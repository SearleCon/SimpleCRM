// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require timeago
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.purr
//= require best_in_place
//= require bootstrap-datepicker
//= require rails.validations
// //= require_tree .
$(function() {
    $('#activity_targetdate').datepicker({
        format: 'dd-mm-yyyy'
    });
    $('#activity_targetdate').datepicker('setStartDate','01-01-2012')


    $('.pagination a').live("click", function () {
        $('.pagination').html('Page is loading...');
        $.get(this.href, null, null, 'script');
        return false;
    });
});











