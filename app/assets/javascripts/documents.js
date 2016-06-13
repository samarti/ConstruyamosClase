/*
Place all the behaviors and hooks related to the matching controller here.
All this logic will automatically be available in application.js.
You can use CoffeeScript in this file: http://coffeescript.org/
*/

//= require ./documents/dropzone.js
//= require ./documents/parsley.min.js
//= require_tree ./documents/i18n/.
//= require_tree ./documents/tagsjs/.

$(function () {
    var $sections = $('.form-section');
    var uploaded = false;
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
    }

    // Previous button is easy, just go back
    $('.form-navigation .previous').click(function() {
        navigateTo(curIndex() - 1);
    });

    // Next button goes forward iff current block validates
    $('.form-navigation .next').click(function() {
        if(curIndex() == 0 && uploaded)
            navigateTo(curIndex() + 1);
        else if(curIndex() == 0 && !uploaded)
            $('.uploadAlert').css('display', 'inline')
        else
            navigateTo(curIndex() + 1);

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
});

var onReady = function() {

    // initialize bloodhound engine
    var searchSelector = 'input.typeahead';

    var bloodhound = new Bloodhound({
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.value);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,

        // sends ajax request to remote url where %QUERY is user input
        remote: '/documents/typeahead/%QUERY',
        limit: 50
    });
    bloodhound.initialize();

    // initialize typeahead widget and hook it up to bloodhound engine
    // #typeahead is just a text input
    $(searchSelector).typeahead(null, {
        displayKey: 'name',
        source: bloodhound.ttAdapter()
    });

    // this is the event that is fired when a user clicks on a suggestion
    $(searchSelector).bind('typeahead:selected', function(event, datum, name) {
        //console.debug('Suggestion clicked:', event, datum, name);
        window.location.href = '/documents/' + datum.id;
    });
};

$(onReady);