validateForm = function(form) {
    $('input#submit').attr("disabled", true);
    $('input#submit').val("Please wait...");
    return true;
}
$(document).ready(function () {
    $('#dataTable').DataTable();
    tempAlert("alertId",2000);
});

function tempAlert(divId,duration) {
     setTimeout(function(){
      $("#"+divId).remove();
     },duration);
}