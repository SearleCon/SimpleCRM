# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script
$ ->
 $("form.new_activity").bind "ajax:success", (event, data, status, xhr) ->
  $('#modal-window').modal('hide')
  strVar = "<tr>"
  strVar += "<td>" +  data.description + "(" + data.tags.length + ")</td>"
  if data.tags.length > 0
   i = 0
   strVar += "<td>"
   while i < data.tags.length
    tagname = data.tags[i]['name']
    strVar += "<span class=label label-success>" + tagname + "</span>"
    i++
  else
    strVar += "<td><span class=label label-warning>Untagged</span></td>"

  strVar += "<td><span class=timestamp>" + jQuery.timeago(data.created_at) + "</span></td>"
  strVar += "<td><a href=/activities/" + data.id + "data-confirm=You sure you want to delete the activity? All it's tags will also be removed! data-method=delete rel=nofollow title=" + data.description + ">Delete</a></td>"
  strVar += "</tr>"
  row = jQuery(strVar)
  $('table tbody').append(strVar)






