/*
Place all the behaviors and hooks related to the matching controller here.
All this logic will automatically be available in application.js.
You can use CoffeeScript in this file: http://coffeescript.org/
*/

//= require ./documents/dropzone.js
//= require ./documents/parsley.min.js
//= require_tree ./documents/i18n/.
//= require bootstrap-tagsinput

$(function () {
    var $sections = $('.form-section');

    var selected = false;
    //Hide all the initial forms but the first
    var isFirst = true;

    function curIndex() {
        // Return the current index by looking at which section has the class 'current'
        return $sections.index($sections.filter('.current'));
    }

    function navigateTo(index) {
        // Mark the current section with the class 'current'
        $sections
        .removeClass('current')
        .removeClass('visible')
        .addClass('hidden')
        .eq(index)
        .addClass('current')
        .addClass('visible')
        .removeClass('hidden');
        // Show only the navigation buttons that make sense for the current section:
        $('.form-navigation .previous').toggle(index > 0);
        var atTheEnd = index >= $sections.length - 1;
        $('.form-navigation .next').toggle(!atTheEnd);
        $('.form-navigation [type=submit]').toggle(atTheEnd);
        var i = 0;
        $('.steps li').each(function(){
            if(i === index)
                $(this).addClass('active');
            if(i > index)
                $(this).removeClass('active');
            i++;
        });
    }

    $("#selectFile").change(function(){
        selected = true;
    });

    function checkStep(step){
        switch (step) {
            case 0:
                return selected;
            case 1:
                return $('#tags').val().length > 0 &&
                    $('#name').val().length > 0 &&
                    $('#level').val().length > 0 &&
                    $('#subject').val().length > 0;
            case 2:
                return $('#description').val().length > 0;
            default:
                return false;

        }
    }
    // Previous button is easy, just go back
    $('.form-navigation .previous').click(function() {
        navigateTo(curIndex() - 1);
    });

    // Next button goes forward iff current block validates
    $('.form-navigation .next').click(function() {
        updateReviewContent();
        if(checkStep(curIndex())){
            dismissError();
            navigateTo(curIndex() + 1);
        } else
            showError();
    });

    navigateTo(0);

    //Update review content
    function updateReviewContent(){
        $('#nameRev').val($('#name').val());
        $('#fileNameRev').val($('#selectFile').val());
        $('#descriptionRev').val($('#description').val());
        $('#subjectRev').val($('#subject option:selected').text());
        $('#levelRev').val($('#level option:selected').text());
        $('.bootstrap-tagsinput').last().prop('disabled', true);
        $('.bootstrap-tagsinput').last().empty()
        $('.bootstrap-tagsinput').first().children().filter('span').clone().appendTo($('.bootstrap-tagsinput').last());
    }

    //Errors
    function showError(){
        var alert = "<div class=\"fieldMissingAlert alert alert-danger alert-icon alert-close alert-dismissible fade in\" role=\"alert\">\r\n            <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\r\n                <span aria-hidden=\"true\">\u00D7<\/span>\r\n            <\/button>\r\n            <i class=\"font-icon font-icon-warning\"><\/i>\r\n            Campos faltantes\r\n        <\/div>";
        var node = $('#missing-fields-alert');
        if(node.children().length == 0)
            node.html(alert);
    }

    function dismissError(){
        $('#missing-fields-alert').empty();
    }

    function showWarning(){
        $('.bs-callout-warning').css('hidden', false);
    }

    var ready;
    ready = function() {
        $('.bootstrap-tagsinput').css('display', 'block');
        $('.bootstrap-tagsinput').css('text-align', 'start');
        $('.bootstrap-tagsinput').css('padding', '6px 6px');
    };

    $(document).ready(ready);
    $(document).on('page:load', ready);

});

$(function(){
    var $btn = $('#add-to-favorites');
    var doc_id = $('#document-info').data('docId');
    var $icon = $('.font-icon-heart');
    console.log(doc_id);

    $btn.on('click', function(ev){
        $.ajax({
            url: "/addfavorite/"+doc_id,
            success : function(data){
                if(data.message === 'LIKED'){
                    $icon.removeClass('unliked');
                    $icon.addClass('liked')
                }
                else {
                    $icon.removeClass('liked');
                    $icon.addClass('unliked');
                }
            }
        });
    });


});

