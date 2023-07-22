// app/assets/javascripts/articles.js

$(document).on('ajax:send', '.new_article', function (event) {
    var progressBar = $('.progress-bar');
    progressBar.css('width', '0%');
    progressBar.removeClass('bg-success');
});

$(document).on('ajax:progress', '.new_article', function (event) {
    var progressBar = $('.progress-bar');
    var progress = event.originalEvent.detail[0];
    var percent = Math.round((progress.loaded * 100) / progress.total);
    progressBar.css('width', percent + '%');
});

$(document).on('ajax:complete', '.new_article', function (event) {
    var progressBar = $('.progress-bar');
    progressBar.css('width', '100%');
    progressBar.addClass('bg-success');
});

document.addEventListener('DOMContentLoaded', function () {
    var imageGallery = document.querySelector('.image-gallery');
    var images = imageGallery.getElementsByTagName('a');

    for (var i = 0; i < images.length; i++) {
        images[i].classList.add('horizontal');
    }
});