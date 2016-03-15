// Avoid `console` errors in browsers that lack a console.
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeline', 'timelineEnd', 'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());

// Place any jQuery/helper plugins in here.

/**************************************
Custom Functions
[ Easing addition ]
***************************************/

$.easing.smoothmove = function (x, t, b, c, d) {
    return -c *(t/=d)*(t-2) + b;
};

/**************************************
Custom Functions
[ Center BG ]
***************************************/

var centerImage = function(bgWidth,windowWidth) {
    var newX = (bgWidth - windowWidth)/2;
    return newX;
}

/**************************************
Custom Functions
[ Draw Poly ]
***************************************/

function drawPoly(selector, poly, bg, sizeArray) {
    var canvas = $(selector)[0];
    var ctx = canvas.getContext('2d');
    ctx.canvas.height = sizeArray[1];
    ctx.canvas.width = sizeArray[0];
    ctx.fillStyle = bg;
    ctx.beginPath();
    ctx.moveTo(poly[0],poly[1]);
    for( item=2 ; item < poly.length-1 ; item+=2 ){ctx.lineTo( poly[item] , poly[item+1] )}
    ctx.closePath();
    ctx.fill();
}


/**************************************
END
***************************************/