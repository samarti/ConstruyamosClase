/*
Place all the behaviors and hooks related to the matching controller here.
All this logic will automatically be available in application.js.
You can use CoffeeScript in this file: http://coffeescript.org/
*/

$(function (){
  $('#level-select').change(function(){
    $.get('add_level', {level: $(this).val()}, function(data){
      replace(data, "level");
    });
  });

  $(document).on('click', '.delete-level', function() {
    $.get('delete_level', {level: $(this).attr('value')}, function(data){
      replace(data, "level");
    })
  })

  $('#subject-select').change(function(){
    $.get('add_subject', {subject: $(this).val()}, function(data){
      replace(data, "subject");
    });
  });

  $(document).on('click', '.delete-subject', function() {
    $.get('delete_subject', {subject: $(this).attr('value')}, function(data){
      replace(data, "subject");
    })
  })

  var replace = function(data, type){
    var subscribed = $('#subscribed-'+type+'s');
    subscribed.empty();
    for(var i = 0; i < data.length; i++){
      subscribed.append("<div class='tag'>" + data[i].name + "<span class='delete-" + type + "', style='color: red;', value='" + data[i].id + "'> x</span></div>");
    }
  };
});
