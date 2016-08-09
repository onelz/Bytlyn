$(document).ready(function() {

	$('.loading-page').hide();

	// parallax effect 
	$('.parallax').parallax();
	$('.carousel').slick({
		dots: true,
		infinite: true,
		slidesToShow: 3,
  		slidesToScroll: 1,
  		lazyLoad: 'ondemand',
  		responsive: [
	    {
	      breakpoint: 550,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1,
	      }
	    }]
	});

	// Add New Card Form
	$('#card-add-new').hide();
	$('#card-add-button').click(function() {
		$('#card-add-new').show();
		$('#card-add-new').addClass("animated slideInUp");
	});

	// change profile-photo 
	$('.change-photo-button').click(function() {
		$('input[id="user_avatar"]').click();
	});
});


// Youtube API

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
	player = new YT.Player('yt-player', {
	    height: '500px',
	    width: '100%',
	    videoId: 'frubRK86fb4',
	    playerVars: {
	      'controls': 0,
	      'rel': 0,
	      'showinfo': 0,
	      'modestbranding': 1,
	    },
	});
}