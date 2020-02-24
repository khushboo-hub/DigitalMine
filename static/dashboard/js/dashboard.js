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
    var StrataAjax;


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
    })(profile_avatar);

    $('a.strata-location-dropdown').click(function () {
        let location_id = $(this).attr('data-strata-location');
        let sensor_id = this.id
        $('span#strata_location_name').text(this.innerHTML);
        $.xhrPool.abortAll();
        StrataAjax.abort();
        Plotly.purge('stratamonitoring');
        strataStart(sensor_id, strata_url);
    });
    $('div.water-dropdown-location').click(function () {
        let location_id = $(this).attr('data-strata-location');
        let sensor_id = this.id
        $.xhrPool.abortAll();
        strataStart(sensor_id, strata_url);
    });

    $('div.water.location').click(function () {
        iframe_link = $('iframe#water_monitoring_iframe')[0].src;
        $('iframe#water_monitoring_iframe').attr('src', replaceAt(iframe_link, iframe_link.lastIndexOf('/') + 1, this.id.toString()));

    });

    function replaceAt(string, index, replace) {
        return string.substring(0, index) + replace + string.substring(index + 1);
    }

    //  WATER();

    function WATER() {
        (function waterlevel() {
            $.ajax({
                type: "get",
                url: "{% url 'dashboard:fetchwl' %}",

                beforeSend: function (jqXHR) {
                    $.xhrPool.push(jqXHR);
                },
                success: function (data) {
                    GasMonitoring(data.result, 208, "waterLevel");
                    GasMonitoring(getRandomIntInclusive(1, 100), 100, "nitrogen");
                    GasMonitoring(getRandomIntInclusive(1, 100), 100, "oxygen");
                    GasMonitoring(getRandomIntInclusive(1, 100), 100, "methane");
                    GasMonitoring(getRandomIntInclusive(1, 100), 100, "hydrogen");
                    GasMonitoring(getRandomIntInclusive(1, 100), 100, "nodeprogress");
                },
                error: function () {
                    console.log("something is not right.please contact admin - 1");
                },
                complete: function () {
                    setTimeout(waterlevel, 5000);
                }
            });
        })();
    }

    document.getElementById("overlay").style.display = "block";


    const scale = (num, in_min, in_max, out_min, out_max) => {
        return (num - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    }

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


    /*var l_label = "Low";
    var strata_l_Value = "";
    var strata_l_color = "";

    var m_label = "Medium";
    var strata_m_Value = "";
    var strata_m_color = "";

    var h_label = "High";
    var strata_h_Value = "";
    var strata_h_endValue = "";
    var strata_h_color = "";
    var strata_unit_sensor = "";
    var strata_custom_title = "";

    var strata_audio_type = "";
    var strata_first_warning = "";
    var strata_second_warning = "";
    var strata_third_warning = "";

    var strata_first_audio = "";
    var strata_second_audio = "";
    var strata_third_audio = "";
    */

    sensor_id = $('#stratamonitoring').attr('data-strata-sensor');

    strataStart(sensor_id, strata_url);

    function strataStart(sensor_id, url) {
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
                let strata_l_Value = parseFloat(strata.level1);
                let strata_l_color = strata.level1_color;

                let strata_m_Value = parseFloat(strata.level2);
                let strata_m_color = strata.level2_color;

                let strata_h_Value = parseFloat(strata.level3);
                let strata_h_color = strata.level3_color;

                let strata_audio_type = strata.audio_type;
                let strata_first_warning = strata.level1_msg;
                let strata_second_warning = strata.level2_msg;
                let strata_third_warning = strata.level3_msg;

                let strata_first_audio = strata.level1_audio;
                let strata_second_audio = strata.level2_audio;
                let strata_third_audio = strata.level3_audio;

                console.log('strata l m h', strata_l_Value, strata_m_Value, strata_h_Value);

                //INITIALIZING PLOTLY
                var y = [];
                var time = new Date();

                var strata_white = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [strata_l_Value, strata_l_Value, strata_l_Value, strata_l_Value],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: 'rgba(158,158,158,0.18)', //white
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: 'Safe Level',

                };
                var strata_green = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [strata_m_Value, strata_m_Value, strata_m_Value, strata_m_Value],
                    fill: 'tonexty',
                    mode: 'lines',
                    fillcolor: '#0096888a',
                    hoverinfo: 'skip',
                    name: '1st Level Warning',
                };
                var strata_yellow = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [strata_h_Value, strata_h_Value, strata_h_Value, strata_h_Value],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: '#ffeb3b75',
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: '2nd Level Warning',
                };
                var strata_red = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [strata_h_Value * 1.2, strata_h_Value * 1.2, strata_h_Value * 1.2, strata_h_Value * 1.2],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: '#f443368c',
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: '3rd Level Warning',

                };
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
                    name: 'Strata level',
                };

                var strata_layout = {
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
                    showlegend: true
                }

                var strata_data = [strata_white, strata_green, strata_yellow, strata_red, strata];
                Plotly.react('stratamonitoring', strata_data, strata_layout);

                //PLOTLY INITIALZATION END

                stratamonitoringajax(strata_l_Value, strata_m_Value, strata_h_Value, strata_values_url);

            },
            error: function () {
                console.log("Something Went Wrong!");
            }, timeout: 10000
        });
    }

    $("#current_date").removeAttr('style');


    //------------------------------------------------------------------------------------------------------------------

    var stratamonitoringajax = function (strata_l_Value, strata_m_Value, strata_h_Value, url) {
        StrataAjax=$.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
            },
            success: function (data) {
                console.log('new l m h',strata_l_Value,strata_m_Value,strata_h_Value);
                var value = data.result.sensor_value;
                time = new Date();
                var update = {
                    x: [[time], [time], [time], [time], [time]],
                    y: [[strata_l_Value], [strata_m_Value], [strata_h_Value], [strata_h_Value * 1.2], [value / 15]],
                };
                var olderTime = time.setMinutes(time.getMinutes() - 1);
                var futureTime = time.setMinutes(time.getMinutes() + 1);
                var minuteView = {
                    xaxis: {
                        type: 'date',
                        range: [olderTime, futureTime],
                        title: 'Time',
                        nticks: 10,
                        domain: [0, 1],
                    }
                };

                Plotly.relayout('stratamonitoring', minuteView);
                Plotly.extendTraces('stratamonitoring', update, [0, 1, 2, 3, 4]);
                //{#checkAndPlay(Number(str_array[6]))#}

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
            complete: function () {
                setTimeout(stratamonitoringajax(strata_l_Value, strata_m_Value, strata_h_Value, url), 100);
            }, timeout: 60000,
        });
    };

    function checkAndPlay(sensorValue) {
        console.log(sensorValue);

        var loc = window.location;
        var baseUrl = loc.protocol + "//" + loc.hostname + (loc.port ? ":" + loc.port : "") + "/media/";

        if ((parseFloat(l_Value) < parseFloat(sensorValue)) && (parseFloat(sensorValue) < parseFloat(m_Value))) {//low level
            $.toast({
                heading: '<b>Strata Monitoring : First Level Warning</b>',
                text: first_warning,
                showHideTransition: 'fade',
                position: 'bottom-right',
                icon: 'error'
            })
            if (audio_type == "text2voice") {
                Speak(first_warning, 9, 0.5);
            } else {
                path = baseUrl + first_audio;
                var playNow = new Audio(path);
                playNow.play();
            }
        }
        if ((parseFloat(m_Value) < parseFloat(sensorValue)) && (parseFloat(sensorValue) < parseFloat(h_Value))) {//middle level
            $.toast({
                heading: '<b>Strata Monitoring : Second Level Warning </b>',
                text: second_warning,
                showHideTransition: 'fade',
                position: 'bottom-right',
                icon: 'error'
            })
            if (audio_type == "text2voice") {
                console.log(second_warning)
                Speak(second_warning, 9, 0.5);
            } else {
                path = baseUrl + second_audio;
                var playNow = new Audio(path);
                playNow.play();
            }
        }

        if (parseFloat(h_Value) < parseFloat(sensorValue)) {//high level
            $.toast({
                heading: '<b>Strata Monitoring : Third Level Warning</b> ',
                text: third_warning,
                position: 'bottom-right',
                showHideTransition: 'fade',
                icon: 'error'
            })
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

    water_sensor_id = $('#watermonitoring').attr('data-water-sensor');

    //waterStart(water_sensor_id, water_url);

    function waterStart(sensor_id, url) {

        console.log('water start sensor', sensor_id);
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
                for (index = 0; index < data.result.length; index++) {
                    var str_array = data.result[index].split('@#');
                    // {#console.log(str_array);#}
                    //$("#ip_hidden").val(str_array[0]);
                    water_l_value = str_array[1];
                    water_m_value = str_array[2];
                    water_h_value = str_array[3];
                    water_t_height = parseInt(str_array[4]);
                    console.log(water_l_value, water_m_value, water_h_value, water_t_height)

                    water_audio_type = str_array[5];
                    water_first_warning = str_array[6];
                    water_second_warning = str_array[7];
                    water_third_warning = str_array[8];

                    water_first_audio = str_array[9];
                    water_second_audio = str_array[10];
                    water_third_audio = str_array[11];
                    // {#setTimeout(fill_water_level_graph(),1000);#}
                }


                //INITIALIZING PLOTLY
                var water_white = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [water_l_value, water_l_value, water_l_value, water_l_value],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: 'rgba(158,158,158,0.18)', //white
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: 'Safe Level',

                };
                var water_green = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [water_m_value, water_m_value, water_m_value, water_m_value],
                    fill: 'tonexty',
                    mode: 'lines',
                    fillcolor: '#0096888a',
                    hoverinfo: 'skip',
                    name: '1st Level Warning',
                };

                var water_yellow = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [water_h_value, water_h_value, water_h_value, water_h_value],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: '#ffeb3b75',
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: '2nd Level Warning',
                };
                var water_red = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
                    x: [1, 2, 3, 4],
                    y: [water_t_height, water_t_height, water_t_height, water_t_height],
                    fill: 'tonexty',
                    type: 'scatter',
                    fillcolor: '#f443368c',
                    hoverinfo: 'skip',
                    mode: 'lines',
                    name: '3rd Level Warning',

                };

                var time = new Date();
                var y = [];
                var water = {
                    // x: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
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
                    name: 'Water Level',
                };

                var water_layout = {
                    // width: 800,
                    // height: 500,
                    //{#title: "fixed-ratio axes",#}
                    xaxis: {
                        nticks: 10,
                        domain: [0, 1],
                        title: "Time",
                    },
                    yaxis: {
                        //{#scaleanchor: "x",#}
                        domain: [0, 1],
                        title: "Water Level(cm)",
                        range: [0, 250]
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
                    showlegend: true
                }

                var water_data = [water_white, water_green, water_yellow, water_red, water];
                Plotly.purge('watermonitoring');
                Plotly.newPlot('watermonitoring', water_data, water_layout);

                //PLOTLY INITIALZATION END


                watermonitoringajax(water_l_value, water_m_value, water_h_value, water_t_height, water_values_url);

            },
            error: function () {
                console.log("Something Went Wrong!");
            }, timeout: 10000
        });
    }

    $("#current_date").removeAttr('style');


    //------------------------------------------------------------------------------------------------------------------

    var watermonitoringajax = function (water_l_value, water_m_value, water_h_value, water_t_height, url) {

        $.ajax({
            type: "get",
            url: url,
            data: {
                'id': sensor_id
            },
            beforeSend: function (jqXHR) {
                $.xhrPool.push(jqXHR);
                console.log('before send');

            },
            success: function (data) {
                var value = water_t_height - data.result.sensor_value
                // {#var value = data.result.sensor_value;#}
                time = new Date();
                console.log('Generate', water_l_value, water_m_value, water_h_value);
                var update = {
                    x: [[time], [time], [time], [time], [time]],
                    y: [[water_l_value], [water_m_value], [water_h_value], [water_t_height], [value]],
                };
                var olderTime = time.setMinutes(time.getMinutes() - 1);
                var futureTime = time.setMinutes(time.getMinutes() + 1);
                var minuteView = {
                    xaxis: {
                        type: 'date',
                        range: [olderTime, futureTime],
                        title: 'Time',
                        nticks: 10,
                        domain: [0, 1],
                    }
                };
                Plotly.relayout('watermonitoring', minuteView);
                Plotly.extendTraces('watermonitoring', update, [0, 1, 2, 3, 4]);
                // {#checkAndPlay(Number(str_array[6]))#}

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
            complete: function () {
                setTimeout(watermonitoringajax(water_l_value, water_m_value, water_h_value, water_t_height, url), 100);
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
                console.log('fire', data);

                result = data.result;

                console.log(result);
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
                console.log(lowest, highest);
                var trace1 = {
                    // {#x: [-1*((highest*lowest)/2)*.4, ((highest*lowest)/2)*0.5],#}
                    //{#y: [((highest*lowest)/2)*0.8, ((highest*lowest)/2)*0.8],#}
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
                    //{#x: [-1*((highest*lowest)/2)*0.5, ((highest*lowest)/2)*0.5],#}
                    //{#y: [-1*((highest*lowest)/2)*0.9, -1*((highest*lowest)/2)*0.9],#}
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
                console.log(dates)
                date = ['1', '2', '3'];
                var trace3 = {
                    x: x_list,
                    y: y_list,
                    xa: dates,
                    mode: 'text+dates+markers',
                    type: 'scatter',
                    //{#name:dates,#}
                    text: text,
                    textfont: {
                        //  {#family: 'sans serif',#}
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


                var data = [trace1, trace2, trace3];
                var layout = {
                    title: 'Ellicott\'s Explosibility Graph(from Manual Entry)',
                    titlefont: {
                        size: 25
                    },
                    //{#width: 1200,#}
                    //{#height: 800,#}

                    xaxis: {
                        title: "<b>(EFFECTIVE INSERT GASES IN %)</b>",
                        tickmode: "linear", //  If "linear", the placement of the ticks is determined by a starting position `tick0` and a tick step `dtick`
                        tick0: 0,
                        dtick: 10,
                        autoscale: false,
                        //  {#range: [-1*((highest*lowest)/2), ((highest*lowest)/2)],#}
                        range: [-100, 100],
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
                        //{#yanchor:'right',#}
                        ticks: 'inside',
                        // {#range: [-1*((highest*lowest)/2), ((highest*lowest)/2)],#}
                        range: [-20, 20],
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

                    showlegend: false
                };
                Plotly.newPlot('fireExp', data, layout, {modeBarButtonsToRemove: ['autoScale2d']});

            },
            error: function () {
                console.log("Something Went Wrong!");
            },
        });
    })(fire_exp_url);


    //FIRE EXP

});