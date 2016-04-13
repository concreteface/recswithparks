// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(document).foundation();

var vote = function(upvote, element) {
    var voteDiv = element.parent().parent();
    var fullId = voteDiv.prop('id');
    var reviewId = fullId.match(/vote-for-([0-9]+)/)[1];

    var voteParams = {
        vote: upvote,
        review_id: reviewId
    };

    var request = $.ajax({
        method: 'POST',
        url: '/votes',
        data: voteParams
    });

    var errorString = (upvote) ? 'You cannot upvote twice' : 'You cannot downvote twice';
    var incrementor = (upvote) ? 1 : -1;
    request.done(function(data) {
        if (data.results === 'duplicate') {
            alert(errorString);
        } else {
            var countSpan = voteDiv.find('.vote-total');
            var previousCount = parseInt(countSpan.text());
            countSpan.text(previousCount + incrementor);
        }
    });
};

var deleteRecord = function(element) {
    var itemIdFull = element.prop('id');
    var itemType = itemIdFull.split('-')[0];
    var itemId = itemIdFull.split('-')[1];
    var request = $.ajax({
        method: 'DELETE',
        url: '/' + itemType + 's/' + itemId
    });

    request.done(function(data) {
        if (data.results == 'success') {
            alert(itemType + ' deleted successfully');
            $('#' + itemType + '-' + itemId).parent().remove();
        } else {
            alert('Unable to delete ' + itemType + ' sorry');
        }
    });
};

$(function() {

    $('#searchBar').hide();
    $('#searchToggle').show();
    $('#qaSearchButton').css('display: none;');

    $('.upvote-link').click(function(event) {
        event.preventDefault();
        vote(true, $(this));
    });

    $('.downvote-link').click(function(event) {
        event.preventDefault();
        vote(false, $(this));
    });

    $('.delete-button').click(function() {
        deleteRecord($(this));
    });

    $('#searchToggle').click(function(event){
      event.preventDefault();
      $('#searchBar').show('slow');
      $('#qaSearchButton').remove();
      $(this).hide('slow');
    });

});

$(document).ajaxError(function(e, xhr) {
    if (xhr.status == 401) {
        alert('You must be signed in to vote on reviews');
    }
});
