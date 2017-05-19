// Avoid `console` errors in browsers that lack a console.
(function() {
    let method;
    let noop = function () {};
    let methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeline', 'timelineEnd', 'timeStamp', 'trace', 'warn'
    ];
    let length = methods.length;
    let console = (window.console = window.console || {});

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
[ Center BG ]
***************************************/

let centerImage = function(bgWidth,windowWidth) {
    return (bgWidth - windowWidth)/2;
};

/**************************************
Custom Functions
[ Draw Poly ]
***************************************/

function drawPoly(selector, poly, bg, sizeArray) {
    let canvas = $(selector)[0];
    let ctx = canvas.getContext('2d');
    ctx.canvas.height = sizeArray[1];
    ctx.canvas.width = sizeArray[0];
    ctx.fillStyle = bg;
    ctx.beginPath();
    ctx.moveTo(poly[0],poly[1]);
    for( let item=2 ; item < poly.length-1 ; item+=2 ){ctx.lineTo( poly[item] , poly[item+1] )}
    ctx.closePath();
    ctx.fill();
}


/**************************************
END
***************************************/

module.exports = {
    drawPoly: drawPoly,
    centerImage: centerImage,
    setSmoothMoove: function ($) {
        $.easing.smoothmove = function (x, t, b, c, d) {
            return -c *(t/=d)*(t-2) + b;
        };
    }
};