$.xhrPool = [];
$.xhrPool.abortAll = function () {
    $(this).each(function (i, jqXHR) {   //  cycle through list of recorded connection
        jqXHR.abort();  //  aborts connection
        $.xhrPool.splice(i, 1); //  removes from list by index
    });
};
$(document).ready(function () {

    let strata_url = $('#stratamonitoring').attr('data-url');
    let strata_values_url = $('#stratamonitoring').attr('data-values-url');
    let water_url = $('#watermonitoring').attr('data-url');
    let water_values_url = $('#watermonitoring').attr('data-values-url');
    let fire_exp_url = $('#fireExp').attr('data-url');
    let notification_url = $('#alertsDropdown').attr('data-url');
    var StrataAjax;
    var strataFlag = 0;
    var waterFlag = 0;


    let profile_avatar = $('img#profile_avatar').attr('data-url');

    (function profile_avatar(url) {
        $.ajax({
            url: url,
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                if (data.hasOwnProperty('profile_avatar')) {
                    if (!isEmpty(data.profile_avatar)) {
                        $('img#profile_avatar').attr('src', '/media/' + data.profile_avatar);
                    } else {
                        $('img#profile_avatar').attr('src', '/media/employee_image/male_alt_photo.svg');
                    }

                }
                if (data.hasOwnProperty('mine')) {

                    $('li#mine_name').html(data.mine.substring(data.mine.indexOf('(') + 1, data.mine.indexOf(')')));
                }
            },
            error: function () {
                console.log('Something Went Wrong!');
                $('img#profile_avatar').attr('src', '/media/employee_image/male_alt_photo.svg');
            }, timeout: 3000

        });
    });

    $('a.strata-location-dropdown').click(function () {
        let location_id = $(this).attr('data-strata-location');
        let sensor_id = this.id;
        $('span#strata_location_name').text(this.innerHTML);
        $.xhrPool.abortAll();
        StrataAjax.abort();
        Plotly.purge('stratamonitoring');
        $.xhrPool.abortAll();
        strataFlag = 1;
        strataStart(sensor_id, strata_url);
    });
    $('div.water-dropdown-location').click(function () {
        let location_id = $(this).attr('data-strata-location');
        let sensor_id = this.id;
        //console.log('sensor id', sensor_id);
        Plotly.purge('watermonitoring');
        $.xhrPool.abortAll();
        waterFlag = 1;
        waterStart(sensor_id, water_url);
    });

    $('div.water.location').click(function () {
        iframe_link = $('iframe#water_monitoring_iframe')[0].src;
        $('iframe#water_monitoring_iframe').attr('src', replaceAt(iframe_link, iframe_link.lastIndexOf('/') + 1, this.id.toString()));

    });

    function replaceAt(string, index, replace) {
        return string.substring(0, index) + replace + string.substring(index + 1);
    }

    //WATER();

    function WATER() {
        (function waterlevel() {
            $.ajax({
                type: "get",
                url: $('#waterLevel').data('url'),
                beforeSend: function (jqXHR) {
                    $.xhrPool.push(jqXHR);
                },
                success: function (data) {
                    GasMonitoring(data.result, 208, "waterLevel");

                    // GasMonitoring(getRandomIntInclusive(1, 100), 100, "oxygen");
                    // GasMonitoring(getRandomIntInclusive(1, 100), 100, "methane");
                    // GasMonitoring(getRandomIntInclusive(1, 100), 100, "hydrogen");
                    // GasMonitoring(getRandomIntInclusive(1, 100), 100, "nodeprogress");
                },
                error: function () {
                    console.log("something is not right.please contact admin - 1");
                },
                complete: function () {
                    setTimeout(waterlevel, 3000);
                }
            });
        })();
    }

    document.getElementById("overlay").style.display = "block";


    const scale = (num, in_min, in_max, out_min, out_max) => {
        return (num - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    };

    function getRandomIntInclusive(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }


    <!--MINERS TRACKING START-->

    //alert(img);
    function GasMonitoring(waterLevel, UpperLimit, Id) {
        waterLevelPercentage = parseFloat(waterLevel);
        if (waterLevelPercentage < 0.00) {
            document.getElementById("overlay").style.display = "block";
        } else {
            document.getElementById("overlay").style.display = "none";
        }
        waterLevelPercentage = scale(waterLevelPercentage, 0, UpperLimit, 100, 0);
        waterLevelPercentage = waterLevelPercentage.toFixed(2);
        if (waterLevelPercentage < 50) {
            $('div#' + Id).removeClass('bg-danger').addClass('bg-success');
        } else {
            $('div#' + Id).removeClass('bg-success').addClass('bg-danger');
        }

        waterLevelPercentage = waterLevelPercentage + "%";

        $('div#' + Id).width(waterLevelPercentage);

        $('span#' + Id).html(waterLevelPercentage);
    }

    //PLOTLY


    let l_label = "Low";
    let strata_l_Value = "";
    let strata_l_color = "";

    let m_label = "Medium";
    let strata_m_Value = "";
    let strata_m_color = "";

    let h_label = "High";
    let strata_h_Value = "";
    let strata_h_endValue = "";
    let strata_h_color = "";
    let strata_unit_sensor = "";
    let strata_custom_title = "";

    let strata_audio_type = "";
    let strata_first_warning = "";
    let strata_second_warning = "";
    let strata_third_warning = "";

    let strata_first_audio = "";
    let strata_second_audio = "";
    let strata_third_audio = "";


    let sensor_id = $('#stratamonitoring').attr('data-strata-sensor');

    strataStart(sensor_id, strata_url);

    function strataStart(sensor_id, url) {
        $.xhrPool.abortAll();
        $.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                var strata = data.result;
                strata_l_Value = parseFloat(strata.level1);
                strata_l_color = strata.level1_color;

                strata_m_Value = parseFloat(strata.level2);
                strata_m_color = strata.level2_color;

                strata_h_Value = parseFloat(strata.level3);
                strata_h_color = strata.level3_color;

                strata_audio_type = strata.audio_type;

                strata_first_warning = strata.level1_msg;
                strata_second_warning = strata.level2_msg;
                strata_third_warning = strata.level3_msg;

                strata_first_audio = strata.level1_audio;
                strata_second_audio = strata.level2_audio;
                strata_third_audio = strata.level3_audio;

                //  console.log('strata l m h', strata_l_Value, strata_m_Value, strata_h_Value);

                //INITIALIZING PLOTLY
                var y = [];
                var time = new Date();
                var strata = {
                    x: [time],
                    y: y,
                    type: 'scatter',
                    fillcolor: 'rgba(3,169,244,0.5)',
                    mode: 'markers+lines',
                    marker: {
                        color: 'rgba(3,169,244,1)',
                        size: 12
                    },
                    hoveron: 'points',
                    hovertemplate: '%{x} : %{y:0.2f} mm<extra></extra>',
                    hoverinfo: 'text',
                    title: 'Time',
                    name: 'Strata',
                };

                var strata_layout = {
                    shapes: [
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: strata_l_Value,
                            x1: 1,
                            y1: strata_m_Value,
                            line: {
                                color: '#0096888a',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#0096888a'
                        },
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: strata_m_Value,
                            x1: 1,
                            y1: strata_h_Value,
                            line: {
                                color: '#ffeb3b75',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#ffeb3b75'
                        },
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: strata_h_Value,
                            x1: 1,
                            y1: strata_h_Value * 1.2,
                            line: {
                                color: '#f443368c',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#f443368c'
                        }

                    ],
                    xaxis: {
                        nticks: 10,
                        domain: [0, 1],
                        title: "Time",
                    },
                    yaxis: {
                        domain: [0, 1],
                        title: "Strata Level (in mm)",
                        range: [0, strata_h_Value * 1.2]
                    },
                    images: [{
                        name: 'watermark_1',
                        source: "http://localhost:8000/static/image/csir_logo.svg",
                        xref: "paper",
                        yref: "paper",
                        x: 0.25,
                        y: 0.9,
                        sizex: 0.7,
                        sizey: 0.7,
                        opacity: 0.1,
                        layer: "below"
                    }],
                    showlegend: true,
                    legend: {
                        xanchor: "left",//"auto" | "left" | "center" | "right"
                        yanchor: "bottom",//"auto" | "top" | "middle" | "bottom"
                        y: 1,//number between or equal to -2 and 3
                        x: 0,//number between or equal to -2 and 3
                        orientation: "h"
                    }
                };

                var strata_data = [strata];
                var config = {responsive: true};
                Plotly.react('stratamonitoring', strata_data, strata_layout, config);

                //PLOTLY INITIALZATION END

                stratamonitoringajax(strata_l_Value, strata_m_Value, strata_h_Value, strata_values_url, strata_audio_type, strata_first_warning, strata_second_warning, strata_third_warning, strata_first_audio, strata_second_audio, strata_third_audio);

            },
            error: function () {
                console.log("Something Went Wrong!");
            }, timeout: 10000
        });
    }

    $("#current_date").removeAttr('style');

    var CHECK = 0;
    //------------------------------------------------------------------------------------------------------------------
    /*var sock = new WebSocket("ws://192.168.1.131:3000");  //replace this address with the one the node.js server prints out. keep port 3000
    //var display=document.getElementById("display")

    sock.onopen = function (event) {
        //alert("Socket connected succesfully!!!")
        setTimeout(function () {
            sock.send('connection succeeded');
        }, 1000);
        //display.innerHTML+="connection succeeded <br />";
    };
    sock.onmessage = function (event) {
        var time = new Date();
        var sensor = JSON.parse(event.data);
        if (sensor.hasOwnProperty('id')) {
            if (sensor.id == "one") {
                //   GasMonitoring(sensor.data[0], 20, "methane");
                /// GasMonitoring(sensor.data[0], 20, "hydrogen");
                //GasMonitoring(sensor.data[0], 20, "nodeprogress");

                var update = {
                    x: [[time]],
                    y: [[sensor.data[0]]],
                };
                var olderTime = time.setMinutes(time.getMinutes() - 1);
                var futureTime = time.setMinutes(time.getMinutes() + 1);
                var minuteView = {
                    legend: {
                        xanchor: "left",//"auto" | "left" | "center" | "right"
                        yanchor: "bottom",//"auto" | "top" | "middle" | "bottom"
                        y: 1,//number between or equal to -2 and 3
                        x: 0,//number between or equal to -2 and 3
                        orientation: "h"
                    },
                    xaxis: {
                        type: 'date',
                        range: [olderTime, futureTime],
                        title: 'Time',
                        nticks: 10,
                        domain: [0, 1],
                    }
                };
                CHECK++;
                if (sensor.data[0] < 10) {
                    CHECK = 0;
                }
                //console.log('CHECK',CHECK);
                if (CHECK > 3) {
                    checkAndPlay(Number(sensor.data[0]), 5, 10, 20, "Strata Warning", strata_audio_type, strata_first_warning, strata_second_warning, strata_third_warning, strata_first_audio, strata_second_audio, strata_third_audio);
                    CHECK = 0;
                }

                Plotly.relayout('stratamonitoring', minuteView);
                Plotly.extendTraces('stratamonitoring', update, [0, 1, 2, 3, 4]);

            }
            if (sensor.id == "two") {
                GasMonitoring(sensor.data[0], 20, "watermonitoring");
                GasMonitoring(sensor.data[0], 20, "methane");
                GasMonitoring(sensor.data[0], 20, "hydrogen");
                GasMonitoring(sensor.data[0], 20, "nodeprogress");
                /*
                Plotly.extendTraces('Graph2', {
                    x: [[time]],
                    y: [[sensor.data[0]]]
                }, [0]);

            }
        }}; */

    var stratamonitoringajax = function (strata_l_Value, strata_m_Value, strata_h_Value, url, audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio) {
        console.log('flag strata monitoring', strataFlag);
        StrataAjax = $.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                console.log('strata', data);
                console.log('new l m h', strata_l_Value, strata_m_Value, strata_h_Value);
                var value = data.result.sensor_value;
                time = new Date();
                var update = {
                    x: [[time]],
                    y: [[value]],
                };
                var olderTime = time.setMinutes(time.getMinutes() - 1);
                var futureTime = time.setMinutes(time.getMinutes() + 1);
                var minuteView = {
                    legend: {
                        xanchor: "left",//"auto" | "left" | "center" | "right"
                        yanchor: "bottom",//"auto" | "top" | "middle" | "bottom"
                        y: 1,//number between or equal to -2 and 3
                        x: 0,//number between or equal to -2 and 3
                        orientation: "h"
                    },
                    xaxis: {
                        type: 'date',
                        range: [olderTime, futureTime],
                        title: 'Time',
                        nticks: 10,
                        domain: [0, 1],
                    }
                };

                Plotly.relayout('stratamonitoring', minuteView);
                Plotly.extendTraces('stratamonitoring', update, [0]);
                checkAndPlay(Number(value), strata_l_Value, strata_m_Value, strata_h_Value, "Strata Warning", audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio);

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
            complete: function () {
                if (strataFlag == 1) {
                    strataFlag = 0;
                    return;
                }
                setTimeout(stratamonitoringajax(strata_l_Value, strata_m_Value, strata_h_Value, url, audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio), 100);
            }, timeout: 60000,
        });
    };

    function checkAndPlay(sensorValue, l_value, m_value, h_value, string, audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio) {
        // console.log(sensorValue);

        var loc = window.location;
        var baseUrl = loc.protocol + "//" + loc.hostname + (loc.port ? ":" + loc.port : "") + "/media/";

        if ((parseFloat(l_value) < parseFloat(sensorValue)) && (parseFloat(sensorValue) < parseFloat(m_value))) {//low level
            $.toast({
                heading: '<b>' + string + ' : First Level Warning</b>',
                text: first_warning,
                showHideTransition: 'fade',
                position: 'bottom-right',
                icon: 'error'
            });
            if (audio_type == "text2voice") {
                Speak(first_warning, 9, 0.5);
            } else {
                path = baseUrl + first_audio;
                var playNow = new Audio(path);
                playNow.play();
            }
        }
        if ((parseFloat(m_value) < parseFloat(sensorValue)) && (parseFloat(sensorValue) < parseFloat(h_value))) {//middle level
            $.toast({
                heading: '<b>' + string + ' : Second Level Warning </b>',
                text: second_warning,
                showHideTransition: 'fade',
                position: 'bottom-right',
                icon: 'error'
            });
            if (audio_type == "text2voice") {
                //console.log(second_warning)
                Speak(second_warning, 9, 0.5);
            } else {
                path = baseUrl + second_audio;
                var playNow = new Audio(path);
                playNow.play();
            }
        }

        if (parseFloat(h_value) < parseFloat(sensorValue)) {//high level
            $.toast({
                heading: '<b>' + string + ' : Third Level Warning</b> ',
                text: third_warning,
                position: 'bottom-right',
                showHideTransition: 'fade',
                icon: 'error'
            });
            if (audio_type == "text2voice") {
                Speak(third_warning, 9, 0.5);
            } else {
                path = baseUrl + third_audio;
                var playNow = new Audio(path);
                playNow.play();
            }
        }
    }


    //WATER MONITORING
    var water_l_color = "#C0DF81";
    var water_m_color = "#FEFE9A";
    var water_h_color = "#F37C84";

    var water_l_value = "";
    var water_m_value = "";
    var water_h_value = "";
    var water_t_height = 0;

    var water_audio_type = "";
    var water_first_warning = "";
    var water_second_warning = "";
    var water_third_warning = "";

    var water_first_audio = "";
    var water_second_audio = "";
    var water_third_audio = "";

    var water_sensor_id = $('#watermonitoring').attr('data-water-sensor');

    waterStart(water_sensor_id, water_url);

    function waterStart(sensor_id, url) {

        //console.log('water start sensor', sensor_id);
        $.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);

            },
            success: function (data) {
                console.log('water', data);
                for (index = 0; index < data.result.length; index++) {
                    var str_array = data.result[index].split('@#');
                    water_l_value = parseFloat(str_array[1]);
                    water_m_value = parseFloat(str_array[2]);
                    water_h_value = parseFloat(str_array[3]);
                    water_t_height = parseFloat(str_array[4]);
                    //    console.log(water_l_value, water_m_value, water_h_value, water_t_height)

                    water_audio_type = str_array[5];
                    water_first_warning = str_array[6];
                    water_second_warning = str_array[7];
                    water_third_warning = str_array[8];

                    water_first_audio = str_array[9];
                    water_second_audio = str_array[10];
                    water_third_audio = str_array[11];
                }

                var time = new Date();
                var y = [];
                var water = {
                    x: [time],
                    y: y,
                    fill: 'tozeroy',
                    type: 'scatter',
                    fillcolor: 'rgba(3,169,244,0.5)',
                    mode: 'markers+lines',
                    marker: {
                        color: 'rgba(3,169,244,1)',
                        size: 12
                    },
                    hoveron: 'points',
                    hovertemplate: '%{x} : %{y:0.2f} cm<extra></extra>',
                    hoverinfo: 'text',
                    name: 'Water',
                };

                var water_layout = {
                    shapes: [
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: water_l_value,
                            x1: 1,
                            y1: water_m_value,
                            line: {
                                color: '#0096888a',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#0096888a'
                        },
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: water_m_value,
                            x1: 1,
                            y1: water_h_value,
                            line: {
                                color: '#ffeb3b75',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#ffeb3b75'
                        },
                        {
                            type: 'rect',
                            xref: 'paper',
                            x0: 0,
                            y0: water_h_value,
                            x1: 1,
                            y1: water_t_height,
                            line: {
                                color: '#f443368c',
                                width: 1,
                                dash: 'line'
                            },
                            fillcolor: '#f443368c'
                        }

                    ],
                    xaxis: {
                        nticks: 10,
                        domain: [0, 1],
                        title: "Time",
                    },
                    yaxis: {
                        //{#scaleanchor: "x",#}
                        domain: [0, 1],
                        title: "Water Level(cm)",
                        range: [0, water_t_height * 1.2]
                    },
                    images: [{
                        name: 'watermark_1',
                        source: "http://localhost:8000/static/image/csir_logo.svg",
                        xref: "paper",
                        yref: "paper",
                        x: 0.40,
                        y: 0.9,
                        sizex: 0.7,
                        sizey: 0.7,
                        opacity: 0.1,
                        layer: "below"
                    }],
                    showlegend: true,
                    legend: {
                        xanchor: "left",//"auto" | "left" | "center" | "right"
                        yanchor: "bottom",//"auto" | "top" | "middle" | "bottom"
                        y: 1,//number between or equal to -2 and 3
                        x: 0,//number between or equal to -2 and 3
                        orientation: "h"
                    }
                };

                var water_data = [water];
                var config = {responsive: true};
                Plotly.react('watermonitoring', water_data, water_layout, config);

                //PLOTLY INITIALZATION END


                watermonitoringajax(water_l_value, water_m_value, water_h_value, water_t_height, water_values_url, water_audio_type, water_first_warning, water_second_warning, water_third_warning, water_first_audio, water_second_audio, water_third_audio);

            },
            error: function () {
                console.log("Something Went Wrong!");
            }, timeout: 10000
        });
    }

    $("#current_date").removeAttr('style');


    //------------------------------------------------------------------------------------------------------------------

    var watermonitoringajax = function (water_l_value, water_m_value, water_h_value, water_t_height, url, audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio) {
        console.log('water monitotring');
        $.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                let value = water_t_height - data.result.sensor_value;
                time = new Date();
                //console.log('Generate', water_l_value, water_m_value, water_h_value);
                let update = {
                    x: [[time]],
                    y: [[value]],
                };
                let olderTime = time.setMinutes(time.getMinutes() - 1);
                let futureTime = time.setMinutes(time.getMinutes() + 1);
                let minuteView = {
                    xaxis: {
                        type: 'date',
                        range: [olderTime, futureTime],
                        title: 'Time',
                        nticks: 10,
                        domain: [0, 1],
                    }
                };
                Plotly.relayout('watermonitoring', minuteView);
                Plotly.extendTraces('watermonitoring', update, [0]);
                // checkAndPlay(Number(value), water_l_value, water_m_value, water_h_value, "Water Level Warning", audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio);

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
            complete: function () {
                if (waterFlag == 1) {
                    waterFlag = 0;
                    return;
                }
                setTimeout(watermonitoringajax(water_l_value, water_m_value, water_h_value, water_t_height, url, audio_type, first_warning, second_warning, third_warning, first_audio, second_audio, third_audio), 100);
            }, timeout: 60000,
        });
    };


    //WATER MONITORING


    //FIRE EXP Start
    (function FireExp(url) {

        $.ajax({
            type: "get",
            url: fire_exp_url,
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                // console.log('fire', data);

                result = data.result;

                //console.log(result);
                var x_list = [];
                var y_list = [];
                var text = [];
                var color = [];
                var dates = [];
                for (var i = 0; i < result.length; i++) {
                    x_list.push(result[i].x);
                    y_list.push(result[i].y);
                    text.push((i + 1).toString());
                    color.push(result[i].color);
                    dates.push(result[i].dates);
                }
                var xhighest = Math.max.apply(Math, x_list);
                var xlowest = Math.min.apply(Math, x_list);
                var yhighest = Math.max.apply(Math, y_list);
                var ylowest = Math.min.apply(Math, y_list);


                var highest = Math.max.apply(Math, [Math.abs(xhighest), Math.abs(xlowest), Math.abs(yhighest), Math.abs(ylowest)]);
                var lowest = Math.min.apply(Math, [Math.abs(xhighest), Math.abs(xlowest), Math.abs(yhighest), Math.abs(ylowest)]);
                console.log('HL', lowest, highest);
                var trace1 = {
                    x: [-65, 80],
                    y: [18, 18],
                    mode: 'text',
                    name: 'Lines, Markers and Text',
                    text: ['<b>CLEAN FUEL NON-EXPLOSIVE</b>', '<b>EXPLOSIVE</b>'],
                    hoverinfo: 'skip',
                    textposition: 'center',
                    textfont: {
                        //  {#family: 'sans serif ,bold',#}
                        size: 10,
                        color: '#1f77b4'
                    },
                    type: 'scatter'
                };
                var trace2 = {
                    x: [-65, 75],
                    y: [-18, -18],
                    mode: 'text',
                    name: 'Lines and Text',
                    text: ['<b>NON COMBUSTIBLE NON-EXPLOSIVE</b>', '<b>POTENTIALLY EXPLOSIVE</b>'],
                    hoverinfo: 'skip',
                    textposition: 'bottom center',
                    textfont: {
                        //   {#family: 'sans serif',#}
                        size: 10,
                        color: '#ff7f0e'
                    },
                    type: 'scatter'
                };
                // console.log(dates)
                date = ['1', '2', '3'];
                var trace3 = {
                    x: x_list,
                    y: y_list,
                    xa: dates,
                    mode: 'text+dates+markers',
                    type: 'scatter',
                    text: text,
                    textfont: {
                        size: 20,
                        color: color,
                        weight: '900'
                    },
                    marker: {size: dates,},
                    textposition: 'bottom center',

                    hoveron: 'points',
                    hovertemplate: "<b>%{marker.size}<b><extra></extra>",


                    hoverinfo: 'x+y',
                };


                var data = [trace3];
                var layout = {
                    title: 'Ellicott\'s Explosibility Graph(from Manual Entry)',
                    titlefont: {
                        size: 25
                    },
                    xaxis: {
                        title: "<b>(EFFECTIVE INSERT GASES IN %)</b>",
                        tickmode: "linear", //  If "linear", the placement of the ticks is determined by a starting position `tick0` and a tick step `dtick`
                        tick0: 0,
                        dtick: 10,
                        autoscale: false,

                        range: [-highest * 2, highest * 2],
                        ticks: "outside",
                        showgrid: true,
                        zeroline: true,
                        showline: true,
                        mirror: 'ticks',
                        gridcolor: '#bdbdbd',
                        gridwidth: 0.05,
                        zerolinecolor: '#969696',
                        zerolinewidth: 3,
                        linecolor: '#636363',
                        linewidth: 6,
                        //{#side:'right'#}
                    },
                    yaxis: {
                        title: "<b>(TOTAL EFFECTIVE COMBUSTIBLE IN %)</b>",
                        tickmode: "linear", //  If "linear", the placement of the ticks is determined by a starting position `tick0` and a tick step `dtick`
                        tick0: 0,
                        dtick: 2,
                        autoscale: false,
                        ticks: 'inside',
                        range: [-highest * 2, highest * 2],
                        showgrid: true,
                        zeroline: true,
                        showline: true,
                        mirror: 'ticks',
                        gridcolor: '#bdbdbd',
                        gridwidth: 0.15,
                        zerolinecolor: '#969696',
                        zerolinewidth: 3,
                        linecolor: '#636363',
                        linewidth: 6,

                    },
                    annotations: [
                        {
                            x: -highest * 1.2,
                            y: highest * 1.8,
                            xref: 'x',
                            yref: 'y',
                            text: '<b>CLEAN FUEL NON-EXPLOSIVE</b>',
                            bgcolor: "#ff7f0e",
                            showarrow: false,
                            arrowhead: 7,
                            ax: 0,
                            ay: -40
                        },
                        {
                            x: highest * 1.2,
                            y: highest * 1.8,
                            xref: 'x',
                            yref: 'y',
                            text: '<b>EXPLOSIVE</b>',
                            bgcolor: "#ff7f0e",
                            showarrow: false,
                            arrowhead: 7,
                            ax: 0,
                            ay: -40
                        },
                        {
                            x: -highest * 1.2,
                            y: -highest * 1.8,
                            xref: 'x',
                            yref: 'y',
                            text: '<b>NON COMBUSTIBLE NON-EXPLOSIVE</b>',
                            bgcolor: "#ff7f0e",
                            showarrow: false,
                            arrowhead: 7,
                            ax: 0,
                            ay: -40
                        },
                        {
                            x: highest * 1.2,
                            y: -highest * 1.8,
                            xref: 'x',
                            yref: 'y',
                            text: '<b>POTENTIALLY EXPLOSIVE</b>',
                            bgcolor: "#ff7f0e",
                            showarrow: false,
                            arrowhead: 7,
                            ax: 0,
                            ay: -40
                        }
                    ],

                    showlegend: false
                };
                var config = {responsive: true};
                Plotly.newPlot('fireExp', data, layout, config, {modeBarButtonsToRemove: ['autoScale2d']});

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
        });
    })(fire_exp_url);


    //FIRE EXP
    var HashDataPrev = "";
    var HashDataCurr = "";
    (function notification() {

        $.ajax({
            type: "get",
            url: notification_url,
            success: function (data) {
                HashDataPrev = "";
                HashDataPrev = HashDataCurr;

                HashDataCurr = "";

                data = data.result;
                X = data;
                // console.log('notification', data);
                for (notify in data) {
                    HashDataCurr += data[notify].id;
                }
                if (HashDataPrev != HashDataCurr) {
                    $('#notifications').empty();
                    $('#notifications').append('<h6 class="dropdown-header">Alerts Center </h6>');
                    if (!isEmpty(data) && HashDataPrev != HashDataCurr) {

                        for (notify in data) {


                            messageText = (data[notify].isread == 1) ? '<span class="font-weight-bold">' + data[notify].message + '</span>' : data[notify].message;
                            if (data[notify].type == 1) {
                                htmlOP = '<a class="dropdown-item d-flex align-items-center" href="#">\n' +
                                    '                                <div class="mr-3">\n' +
                                    '                                    <div class="icon-circle bg-primary">\n' +
                                    '                                        <i class="fas fa-donate text-white"></i>\n' +
                                    '                                    </div>\n' +
                                    '                                </div>\n' +
                                    '                                <div>\n' +
                                    '                                    <div class="small text-gray-500">' + data[notify].time + '</div>\n' +
                                    messageText +
                                    '                                </div>\n' +
                                    '                            </a>'
                            } else if (data[notify].type == 2) {

                                htmlOP = '<a class="dropdown-item d-flex align-items-center" href="#">\n' +
                                    '                                <div class="mr-3">\n' +
                                    '                                    <div class="icon-circle bg-success">\n' +
                                    '                                        <i class="fas fa-donate text-white"></i>\n' +
                                    '                                    </div>\n' +
                                    '                                </div>\n' +
                                    '                                <div>\n' +
                                    '                                    <div class="small text-gray-500">' + data[notify].time + '</div>\n' +
                                    messageText +
                                    '                                </div>\n' +
                                    '                            </a>'
                            }
                            $('#notifications').append(htmlOP);
                        }

                    }
                    $('#notifications').append('<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>');
                }

            },
            complete: function () {
                setTimeout(notification, 3000);
            }
        })
        ;
    })
    (notification_url);

})
;
var X;