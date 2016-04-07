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
//= require_tree .


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

$(function() {

  $('.upvote-link').click(function(event) {
    event.preventDefault();
    vote(true, $(this));
  });

  $('.downvote-link').click(function(event) {
    event.preventDefault();
    vote(false, $(this));
  });
});

$(document).ajaxError(function (e, xhr) {
  if (xhr.status == 401) {
    alert('You must be signed in to vote on reviews');
  }
});
