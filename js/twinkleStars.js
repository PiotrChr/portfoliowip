$.fn.twinkleStars = function(options) {
	var settings = $.extend({
       width: $(this).width(),
       height: $(this).height(),
       density: 5,
       timespan: 2,
       blinkSpeed: 0.5,
       gap: 1,
       container: this
    }, options );

    var twikleStarsClass = new twinkleStarsClass(settings);

    return this;
}

function twinkleStarsClass(options) {
	this.twinkles = [];
	self = this;
	this.settings = $.extend({
      width: 100,
      height: 100,
      density: 5,
      timespan: 2,
      blinkSpeed: 0.5,
      gap: 1,
      stars: [
      	'gfx/stars/small1.png',
      	'gfx/stars/small2.png',
      	'gfx/stars/mid1.png',
      	'gfx/stars/mid2.png'
      ]
    }, options );

    for (i=0;i<parseInt(this.settings.density);i++) {
    	setTimeout(function() {
    		self.twinkle(self.settings.timespan, self.settings.blinkSpeed);
    	}, getRandomInt(0, 1500));
    }

}


twinkleStarsClass.prototype.twinkle = function(timespan,blinkspeed) {
	
	var self = this;
	var twink = setInterval(function() {
		var id = 'star_' + getRandomInt(0, 999999);

		$(new Image()).attr({
			'src' : self.settings.stars[self.getRandomStarKey()],
			'class' : 'twinkleStar',
			'id' : id 
		}).css({
			//'width' : '',
			//'height' : '',
			'position' : 'absolute',
			'top' : self.getRandomXY()[1] + 'px',
			'left' : self.getRandomXY()[0] + 'px'
		}).appendTo(self.settings.container).fadeIn(blinkspeed * 1000, function() {
			var that = this;
			setTimeout(function() {
				$(that).fadeOut(blinkspeed * 1000, function() {
					$(that).remove();
				});
			}, timespan * 1000);
		});
	}, timespan * 1000 + 2 * blinkspeed);
	self.twinkles.push(twink);
}

twinkleStarsClass.prototype.removeTwinks = function(amount) {

}

twinkleStarsClass.prototype.getRandomXY = function() {
	return [getRandomInt(0, this.settings.width),getRandomInt(0, this.settings.height)];
}

twinkleStarsClass.prototype.getRandomStarKey = function() {
	return getRandomInt(0,this.settings.stars.length);
}

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}