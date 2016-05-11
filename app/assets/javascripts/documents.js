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

    var uploaded = false;
    //Hide all the initial forms but the first
    let isFirst = true;

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
            if(i === index){
                $(this).addClass('active');
            }
            if(i > index)
                $(this).removeClass('active');
            i++;
        });
    }

    function checkStep(step){
        switch (step) {
            case 1:
                return $('#tags').val().length > 0 &&
                    $('#name').val().length > 0;
            case 2:
                return $('#description').val().length > 0;
            default:
                return true;

        }
    }
    // Previous button is easy, just go back
    $('.form-navigation .previous').click(function() {
        navigateTo(curIndex() - 1);
    });

    // Next button goes forward iff current block validates
    $('.form-navigation .next').click(function() {
        updateReviewContent();
        if(curIndex() == 0 && uploaded){
            navigateTo(curIndex() + 1);
        } else if(curIndex() == 0 && !uploaded){
            //$('.uploadAlert').css('display', 'inline')
            navigateTo(curIndex() + 1);
        } else {
            if(checkStep(curIndex())){
                dismissError();
                navigateTo(curIndex() + 1);
            } else {
                showError();
            }
        }

    });

    navigateTo(0);

    //Dropzone
    Dropzone.autoDiscover = false;
    $("#dZUpload").dropzone({
        url: "hn_SimpeFileUploader.ashx",
        addRemoveLinks: true,
        maxFiles: 1,
        init: function() {
            this.on("addedfile", function() {
                if (this.files[1]!=null){
                    this.removeFile(this.files[0]);
                }
            });
        },
        success: function (file, response) {
            var imgName = response;
            file.previewElement.classList.add("dz-success");
            console.log("Successfully uploaded :" + imgName);
            uploaded = true;
        },
        error: function (file, response) {
            file.previewElement.classList.add("dz-error");
            uploaded = true;
        },
    });

    //Update review content
    function updateReviewContent(){
        $('#nameRev').val($('#name').val());
        $('#fileNameRev').val($('#selectFile').val());
        $('#descriptionRev').val($('#description').val());
        $('.bootstrap-tagsinput').last().prop('disabled', true);
        $('.bootstrap-tagsinput').last().empty()
        $('.bootstrap-tagsinput').first().children().filter('span').clone().appendTo($('.bootstrap-tagsinput').last());
    }

    //Errors
    function showError(){
        $('.fieldMissingAlert').css('display', 'inline');
    }

    function dismissError(){
        $('.fieldMissingAlert').css('display', 'none');
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
