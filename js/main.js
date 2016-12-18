/**************************************
OPTIONS
***************************************/

var options = {
	settings: {
		bg: 'hiRes', // hiRes | lowRes
		language: 'en', // de | pl | en
		topBarHeight: 80
	},
	selector: {
		bodyWrapper: {
			id: '#bodyWrapper'
		},
		backgroundContainer: {
			id: '#backgroundContainer'
		},
		body: {
			id: '#bodyContainer'
		},
		preloader: {
			id: '#preloader',
			sections: {
				music: {
					description: {
						id: '#loadList_music .preloader-container__loadList-description'
					},
					tickMark: {
						id: '#loadList_music .preloader-container__loadList-tick'
					}
				},
				image: {
					description: {
						id: '#loadList_image .preloader-container__loadList-description'
					},
					tickMark: {
						id: '#loadList_image .preloader-container__loadList-tick'
					}
				},
				sections: {
					description: {
						id: '#loadList_sections .preloader-container__loadList-description'
					} ,
					tickMark: {
						id: '#loadList_sections .preloader-container__loadList-tick'
					}
				}
			},
			list: {
				id: '#preloader__loadList'
			},
			text: {
				id: '#preloader_loadingText'
			},
			parenthesis: {
				right: {
					id: '.preloader-container__parenthesis.-right'
				},
				left: {
					id: '.preloader-container__parenthesis.-left'
				}
			}
		},
		mainNav: {
			id: '#mainNav',
			a: {
				element: '#mainNav a'
			}
		},
		secondNav: {
			id: '#topMenu',
			a: {
				element: '#topMenu a'
			}
		},
		mainLogo: {
			id: '#logo'
		},
		cp: {
			left: {
				id: '#leftParallelogram'
			},
			right: {
				id: '#rightParallelogram'
			}
		},
		topControls: {
			id: '#topControls',
			className: '.topControl',
			select: {
				className: '.topControls_select'
			},
			span: {
				element: '.topControls_select span'
			},
			status: {
				className: '.topControl_status'
			}
		},
		topBar: {
			id: '#topBar'
		},
		wrapperContainer: {
			id: '#wrapperContainer'
		} ,
		header: {
			id: '#header'
		}
	},

	toLoad: { 	// Items to load via Ajax
		images: [
			'gfx/space_bg.png',
			'gfx/space_bg.jpg',
			'gfx/logo.png'
		],
		html : [
			{url : "content/portfolio.html", title: "portfolio", callback: function(response) {
				options.loaded.portfolio = response;
			}},
			{url: 'server/server.php/bio', title: 'bioData', callback: function(response) {
				options.loaded.data.bio = response;
			}},
			{url: 'server/server.php/blog', title: 'blogData', callback: function(response) {
				options.loaded.data.blog = response;
			}},
			{url: 'server/server.php/work', title: 'workData', callback: function(response) {
				options.loaded.data.work = response;
			}},
			{url: 'server/server.php/contact', title: 'contactData', callback: function(response) {
				options.loaded.data.contact = response;
			}},
			{url: 'server/server.php/scripts', title: 'scriptsData', callback: function(response) {
				options.loaded.data.scripts = response;
			}}
		],
		sounds : [
			{url:"music/Kai Engel - Extinguished.mp3"}
		]
	},
	loaded : { // loaded output (do not edit)
		data: {}
	}, 
	isLoaded : { // loading states (do not edit)
		music : false,
		image : false,
		sections : false
	},
	background : {
		hiRes : "gfx/space_bg.png",
		lowRes : "gfx/space_bg.jpg",
		width : 0,
		height: 0
	}
};

/**************************************
PORTFOLIO
***************************************/
var helpers = {
    checkSelectors: function (selectorsObject, keyCheckArray, found, notFound) {
        keyCheckArray = keyCheckArray || ['id','className','element'];
		found = found || [];
		notFound = notFound || [];

		/* TODO: FINISH this shit */
		var tested = new function() {
			this.found = [];
            this.notFound = [];
			this.addNotFound = function(val) {
				if (this.notFound.indexOf(val) === -1
					&& this.found.indexOf(val) === -1) this.notFound.push(val);
			};
			this.addFound = function(val) {
				if (this.found.indexOf(val) === -1) this.found.push(val);
                if (this.notFound.indexOf(val) !== -1) this.found.push(val);
			};
			this.setFound = function(array) {
				this.found = array;
			};
			this.setNotFound = function(array) {
				this.notFound = array;
			}
		};

        if (typeof window._selectorCheckup === 'undefined') {
            window._selectorCheckup = {
                found: [],
                notFound: []
            };
        }

		tested.setFound(window._selectorCheckup.found);
        tested.setNotFound(window._selectorCheckup.notFound);

        for (var property in selectorsObject) {
            if (! (selectorsObject.hasOwnProperty(property))) continue;

            if (typeof selectorsObject[property] === 'string' && keyCheckArray.indexOf(property) !== -1) {
                if ($(selectorsObject[property]).length === 0) {
                    tested.addNotFound(selectorsObject[property]);
				} else {
                    tested.addFound(selectorsObject[property]);
				}
            } else {
                helpers.checkSelectors(selectorsObject[property], keyCheckArray, tested.found, tested.notFound);
            }
        }

        window._selectorCheckup.found = tested.found;
        window._selectorCheckup.notFound = tested.notFound;
	},

   	arrayUnique: function(array) {
		var a = array.concat();
		for(var i=0; i<a.length; ++i) {
			for(var j=i+1; j<a.length; ++j) {
				if(a[i] === a[j])
					a.splice(j--, 1);
			}
		}

		return a;
	},

	stretchAll: function() {
		var viewportHeight = $(window).innerHeight();
		var newHeight = viewportHeight - options.settings.topBarHeight;
		var $toStretch = $('html').find('.auto-height');

		$.each($toStretch, function() {
			$(this).css({
				'min-height': newHeight + 'px'
			});
		});
	},
	converters: {
		prettyDate: function(string) {
			var dateObject = new Date(Date.parse(string));
			return dateObject.toDateString();
		}
	}
};


var Portfolio = function() {
	var pt = this;
	pt.active = ''; // active page
	pt.recent = ''; // recent page
	pt.current = 0;

	pt.settings = {
		bgLocation : { // background position on pages
			home : -5659,
			blog: -2500,
			bio: -4500,
			work: -1500,
			contact:0,
			scripts: -3500
		},
		polys : { // header polys
			cp1 : [0,0, 200,0, 275,80, 0 ,80],
			cp2 : [0,0, 360,0, 360,80, 75,80]
		}
	};

	pt.topControls = { // topControls actions
		actions: {
			music: {
                state: {
                    on: false
                },
				on: function() {
					pt.sound.play();
                    pt.topControls.actions.music.state.on = true;
				},
				off: function() {
					pt.sound.pause();
                    pt.topControls.actions.music.state.on = false;
				},
                toggle: function() {
                    if (pt.topControls.actions.music.state.on) {
                        pt.topControls.actions.music.off();
                    } else {
                        pt.topControls.actions.music.on();
                    }
                }
			},
			language: {
				current: options.settings.language,
				setDefault: function() {
					$(options.selector.body.id).find('.lang[lang=\'' + options.settings.language + '\']').show();
				},
				changeTo: function(language) {
					if (language !== this.current) {
						$(options.selector.body.id).find('.lang[lang=\'' + this.current + '\']').hide();
						$(options.selector.body.id).find('.lang[lang=\'' + language + '\']').show();
						this.current = language;
					}
					
				},
				en: function() {
					this.changeTo('en')
				},
				de: function() {
					this.changeTo('de')
				},
				pl: function() {
					this.changeTo('pl')
				}
			}
		},
		open: function(event, optionalTarget) {
            var target = (optionalTarget !== 'undefined') ? optionalTarget : $(event.currentTarget);
            var targetOptions = target.data('options').split(',');
            var current = target.data('current');
            var html = [];
            var control = target.closest(options.selector.topControls.className);

            if (control.data('switch') == 'toggle') {
                var action = control.attr('id').split('_')[1];
                if (control.data('current') == 'on') {
                    target.find('.topControl_icon').removeClass('fa-volume-up').addClass('fa-volume-off');
                    target.data('current','off');
                    if (pt.topControls.actions[action]['off'] instanceof Function) {
                        pt.topControls.actions[action]['off']();
                    }
                } else {
                    target.find('.topControl_icon').removeClass('fa-volume-off').addClass('fa-volume-up');
                    target.data('current','on');
                    if (pt.topControls.actions[action]['on'] instanceof Function) {
                        pt.topControls.actions[action]['on']();
                    }
                }
            } else {
                $.each(targetOptions,function(k,v) {
                    var dataClass = '';
                    if (v.indexOf('.') !== -1) {
                        v = v.split('.');
                        dataClass = 'data-class=\'' + v[1] + '\'';
                        v = v[0];
                    }
                    //if (v != current) {
                    //	html.push('<span ' + dataClass + ' data-option=\'' + v + '\'><img src=\'img/icons/'+v+'_topControls.png\'></span>');
                    //}
                    html.push('<span ' + dataClass + ' data-option=\'' + v + '\'><img src=\'img/icons/'+v+'_topControls.png\'></span>');
                });

                html = html.join('');
                var topControls = target.find(options.selector.topControls.select.className);
                topControls.html(html);
                topControls.stop().css({
                    'display': 'block',
                    'opacity': 0
                }).animate({
                    top: '0px',
                    opacity:1
                },200);
            }
		},
		toggle: function(event) {
			var target = $(event.currentTarget);
            var topControls = target.find(options.selector.topControls.select.className);
            var visible = topControls.css('display') !== 'none';
            if (visible && target.data('switch') !== 'toggle') {
                pt.topControls.close(null,target);
            } else {
                pt.topControls.open(null,target);
            }

		},
		close: function(event, optionalTarget) {
            var target = (optionalTarget !== 'undefined') ? optionalTarget : $(event.currentTarget);
			var topControls = target.find(options.selector.topControls.select.className);
			if (target.data('switch') == 'toggle') {

            } else {
                topControls.stop().animate({
                    top: '-33px',
                    opacity: 0
                }, function() {
                    topControls.css({
                        'display':'none'
                    });
                    topControls.html('');
                })
            }
		},
		change: function(event) {
			var target = $(event.target);
			var option = target.data('option') || target.closest('span[data-option]').data('option');
			var control = target.closest(options.selector.topControls.className);
			var description = control.find(options.selector.topControls.status.className);
			var action = control.attr('id').split('_')[1];

			if (pt.topControls.actions[action][option] instanceof Function) {
                pt.topControls.actions[action][option]();
			}
			control.data('current',option);

			if (typeof target.data('class') !== 'undefined') {
				description.removeClass(function (index, css) {
				    return (css.match (/(^|\s)color-\S+/g) || []).join(' ');
				}).addClass('color-' + target.data('class'));
			}
			control.trigger('mouseleave');
		},
		set: function() {
			$(options.selector.topControls.id).on('click', options.selector.topControls.className, pt.topControls.toggle);
			$(options.selector.topControls.id).on('click', options.selector.topControls.span.element, pt.topControls.change);
			$(window).resize(function() {
				helpers.stretchAll();
			});
		}
	};
	
	pt.openAnimation = { // Page animations on open
		home: function(callback) {
			$('#_home').css({display:'table'});

			drawPoly(options.selector.cp.left.id, pt.settings.polys.cp1, '#000', [300, 80]);
			drawPoly(options.selector.cp.right.id, pt.settings.polys.cp2, '#fff', [360, 80]);

			setTimeout(function() {
				var _navLink = $(options.selector.mainNav.a.element);

				$.each(_navLink, function(k,v) {
					setTimeout(function() {
						$(v).effect('pulsate',200).animate({
							opacity:1
						},200);
					},k*100);
				});
				$(options.selector.mainLogo.id).animate({
					opacity:1
				},2000);
			},1000);

		},
		bio: function(callback) {
			$('#_bio').css({
				'display':'block',
				'opacity':0
			}).animate({
				'opacity':1
			}, function() {
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		blog: function(callback) {
			$('#_blog').css({
				'display':'block',
				'opacity':0
			}).animate({
				'opacity':1
			}, function() {
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		work: function(callback) {
			$('#_work').css({
				'display':'block',
				'opacity':0
			}).animate({
				'opacity':1
			}, function() {
				var $grid = $('.grid').masonry({
					// options
					itemSelector: '.grid-item',
					columnWidth: 300,
					gutter:10
				});

				if (callback instanceof Function) {
					callback();
				}
			});
		},
		contact: function(callback) {
			$('#_contact').css({
				'display':'block',
				'opacity':0
			}).animate({
				'opacity':1
			}, function() {
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		scripts: function() {
			$('#_scripts').css({
				'display':'block',
				'opacity':1
			}).hexList(options.loaded.data.scripts.result, {
				cols:6,
				animate:true,
				autoHeight: true,
				animation: {
					duration : 400,
					type : 'shoot',
					offset : 200
				}
			});
		}
	};
	pt.closeAnimation = { // page animations on close
		home : function(callback) {
			$('#_home').fadeOut(function() {
				$(options.selector.topBar.id).css({
					'display':'block',
					'opacity': 0
				}).animate({
					'opacity':1,
					'top':'0px'
				},function() {
					callback();
				});
			});
		},
		bio: function(callback) {
			$('#_bio').animate({
				opacity:0
			},function() {
				$(this).css({'display':'none'});
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		blog: function(callback) {
			$('#_blog').animate({
				opacity:0
			},function() {
				$(this).css({
					'display':'none'
				});
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		work: function(callback) {
			$('#_work').animate({
				opacity:0
			},function() {
				$(this).css({
					'display':'none'
				});
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		contact: function(callback) {
			$('#_contact').animate({
				opacity:0
			},function() {
				$(this).css({
					'display':'none'
				});
				if (callback instanceof Function) {
					callback();
				}
			});
		},
		scripts: function(callback) {
			$('#_scripts').animate({
				'opacity':0
			}, function() {
				$(this).css({
					'display':'none'
				}).html('');
				if (callback instanceof Function) {
					callback();
				}
			});
		}
	};

	pt.menu = {
		set: function() {
			var links = [options.selector.mainNav.a.element, options.selector.secondNav.a.element].join(',');
			$(options.selector.body.id).on('click', links, function(event) {
				var href = $(this).attr('href').split('#')[1];
				pt.setPage(href, true, true);
			});
		}
	};

	pt.sound = {
		sound : {},
		start: function() {
			pt.sound.sound = new Audio('music/Kai Engel - Extinguished.mp3');
			pt.sound.sound.volume = 0.1;
			pt.sound.sound.loop = true;
			return this;
		},
		play: function() {
			pt.sound.sound.play();
			return this;
		},
		pause: function() {
			pt.sound.sound.pause();
			return this;
		}
	};

	pt.content = {
		setWrapperSize: function() {
			var wrapper = $(options.selector.wrapperContainer.id);
			var headerHeight = $(options.selector.header.id).height();
			var windowHeight = $(window).height();
			var wrapperHeight = parseInt(windowHeight) - parseInt(headerHeight);
			wrapper.css({
				'height': wrapperHeight + 'px',
				'margin-top': headerHeight + 'px'
			});
		}
	};

	pt.background = { // background actions
		getX : function() {
			return centerImage(options.background.width,$(window).width());
		},
		getY : function(page) {
			if (page === false) {
				page = pt.active;
			}
			return pt.settings.bgLocation[page];
		},
		setPosition : function(page,animateBg,callback) {
			var leftOffset = pt.background.getX();
			var topOffset = pt.background.getY(page);
			var backgroundPosition = -leftOffset + "px " + topOffset + "px";
			if (animateBg === false) {
				$(options.selector.backgroundContainer.id).css({
					"background-position" : backgroundPosition
				});
				if (callback instanceof Function) {
					callback();
				}
			} else if (animateBg === true) {
				
				$(options.selector.backgroundContainer.id).stop(true, false).animate({
					backgroundPosition: backgroundPosition
				}, {queue:false,duration:1000,easing:'smoothmove',complete: function() {
					if (callback instanceof Function) {
						callback();
					}
				}});
			}
		},
		setBackground : function(background) {
			$(options.selector.backgroundContainer.id).css({
				"background" : "url('" + background + "')",
			}).fadeIn(2000,function() {
				$('#preloaderBackgroundContainer').fadeOut();
			});
		},
		moveBg : function(e) {
			var strength = 25;
			var x = e.pageX;
			var y = e.pageY;
			var movementX = (x - $(window).width()/2)/strength * -1;
			var movementY = (y - $(window).height()/2)/strength * -1;
			var current = $(options.selector.backgroundContainer.id).css("background-position").split(" ");
			var newBackgroundPosition = (-parseInt(pt.background.getX()) + parseInt(movementX)) + "px " + (parseInt(pt.background.getY(false)) + parseInt(movementY)) + "px";
			$(options.selector.backgroundContainer.id).animate({
				backgroundPosition: newBackgroundPosition
			}, {queue:false,duration:1000,easing:'smoothmove'});
		}
	};

	pt.setPage = function(page,animateBg,close) { // main 'go-to-page' action
		if (pt.active !== page) {
			if (pt.active !== '') {
				pt.recent = pt.active;
			}
			pt.active = page;
			pt.closeRecent(close, function() {
				$(options.selector.wrapperContainer.id).off('mousemove',pt.background.moveBg);
				pt.background.setPosition(page, animateBg, function() {
					helpers.stretchAll();
					if (pt.openAnimation[page] instanceof Function) {
						$(options.selector.wrapperContainer.id).on('mousemove',pt.background.moveBg);
						pt.openAnimation[page]();
					}
				});
			});
		}
	};

	pt.ajaxRecursive = function(ajaxes,callback) { // load and then... load some more
		if (pt.current < ajaxes.length) {
			$.ajax({
				type: 'GET',
				url: ajaxes[pt.current]['url'],
				error: function(xhr, ajaxOptions, thrownError) {
					//some error exception
				}
			}).done(function(response) {
				if (ajaxes[pt.current]['callback'] instanceof Function) {
					ajaxes[pt.current]['callback'](response);
				}

				if (parseInt(pt.current) == parseInt(ajaxes.length-1)) {
					if (callback instanceof Function) {
						callback();
					}
				} else {
					pt.current++;
					pt.ajaxRecursive(ajaxes,callback);
				}
			});
		}
	};

	pt.load = function () { // load everything
		pt.ajaxRecursive(options.toLoad.sounds,function() {
			pt.current = 0;
			options.isLoaded.music = true;
			preloadPictures(options.toLoad.images, function(img, done) {
				var src = img.src;
				var name = src.split('/').pop();
				if (options.background[options.settings.bg] === 'gfx/'+name) {
					options.background.width = img.width;
					options.background.height = img.height;
				}
				if (done === true) {
					options.isLoaded.image = true;
					pt.ajaxRecursive(options.toLoad.html, function() {
						options.isLoaded.sections = true;
					});
				}
			});
		});
	};

	pt.closeRecent = function(close, callback) { // if page should be closed, close it
		if (close === false) {
			if (callback instanceof Function) {
				callback();
			}
		} else {
			if (pt.closeAnimation[pt.recent] instanceof Function) {
				pt.closeAnimation[pt.recent](callback);
			}
		}
	};

	pt.renderTemplates = function() {
		if (options.loaded.data.length !== 0) {
			$.each(options.loaded.data, function() {
				var self = this;
				if (self.error !== true || typeof self.error === 'undefined') {
					var result = self.result;
					var resource = self.resource;
					var template = $('#' + resource + 'Template');
					var container = $('#_' + resource);
					var html = template.render(result);
					container.html(html);
				}
			});
		}
	};

	pt.scrollBar = {
		set: function() {
			$(options.selector.wrapperContainer.id).mCustomScrollbar({
				theme:'light-thin',
				autoHideScrollbar: true,
				
			});
		}
	};

	pt.binds = {
		set: function() {
			$('body').on('mouseenter','.grid-item',function() {
				$(this).find('.grid-header img').stop().animate({
					'opacity': 0.8
				},200);
				}).on('mouseleave','.grid-item',function() {
				$(this).find('.grid-header img').stop().animate({
					'opacity': 1
				},200)
			})
		}
	};

	pt.start = function() { // start portfolio
		$(options.selector.body.id).html(options.loaded.portfolio);
		pt.content.setWrapperSize();
		pt.renderTemplates();
		pt.topControls.actions.language.setDefault();
		pt.background.setBackground(options.background[options.settings.bg]);
		pt.setPage('home',false,false);
		pt.sound.start();
		pt.topControls.set();
		pt.menu.set();
		pt.scrollBar.set();
		pt.binds.set();
		$('#backgroundContainer').foggy(false);
		var shootingStarObj = new ShootingStar( "#twinkleStars" );
		shootingStarObj.launch(20);
	};
};

/**************************************
PRELOADER
***************************************/

function MainPreloader() {
	var pr = this;

	pr.preloaderTemplate = 'content/preloader.html';
	pr.preloaderImage = 'gfx/preloader_bg.jpg';
	pr.animate = function(callback) {
		$(options.selector.preloader.text.id).fadeIn(function() {
			$(options.selector.preloader.parenthesis.right.id).css({
				"display":"block",
				"opacity": 0
			}).animate({
				"right" : "0px",
				"opacity" : 1
			}, 200);

			$(options.selector.preloader.parenthesis.left.id).css({
				"display":"block",
				"opacity": 0
			}).animate({
				"left" : "0px",
				"opacity" : 1
			}, 200);

			setTimeout(function() {
				var items = [
					options.selector.preloader.sections.music.description.id,
					options.selector.preloader.sections.image.description.id,
					options.selector.preloader.sections.sections.description.id
				];

				$.each(items,function(key, item) {
					setTimeout(function() {
						$(item).toggle('pulsate');
					}, key * 200);
				});

				if (callback instanceof Function) {
					setTimeout(function() {
						callback();
					}, 500);
				}

			}, 500);
		});

	};
	pr.unload = function(callback) {
		$(options.selector.preloader.list.id).fadeOut(500, function() {
			$(options.selector.preloader.parenthesis.left.id).animate({
				"right" : "121px",
				"opacity" : 0
			},100);
			$(options.selector.preloader.parenthesis.right.id).animate({
				"left" : "121px",
				"opacity" : 0
			},100);
			$(options.selector.preloader.id).fadeOut(200, function() {
				if (callback instanceof Function) {
					callback();
				}
			});
		});
	};
	pr.load = function() {
		preloadPictures(pr.preloaderImage, function() {
			$('#preloaderBackgroundContainer').css({
				"background" : "url('" + pr.preloaderImage + "')",
				"display" : "none",
				"background-repeat": "no-repeat",
				"background-attachment": "fixed",
				"background-position": "center"
			}).fadeIn().foggy({
				blurRadius: 2,          // In pixels.
				opacity: 0.9,           // Falls back to a filter for IE.
				cssFilterSupport: true  // Use "-webkit-filter" where available.
			});

			$(options.selector.bodyWrapper.id).fadeIn(function() {
				$(this).twinkleStars({
					timespan: 1,
					blinkSpeed: 0.5,
					density: 10,
					moveFactor: 15
				});

				getTemplate('preloader', function(response) {
					$(options.selector.body.id).html(response);
					pr.animate(function() {
						MyPortfolio.load();
						pr.checkIfLoadedAll(function() {
							setTimeout(function() {
								pr.unload(function() {
									MyPortfolio.start();
								});
							},500);
						});
					});
				});
			});
		});
	};
	pr.checkIfLoaded = function(ld,callback) {
		var checkInterval = setInterval(function() {
			var item = options.isLoaded[ld];
			if (item === true) {
				clearInterval(checkInterval);
				if (callback instanceof Function) {
					callback();
				}
			}
		},50);

	};
	pr.checkIfLoadedAll = function(callback) {
		var music = options.selector.preloader.sections.music;
		var image = options.selector.preloader.sections.image;
		var sections = options.selector.preloader.sections.sections;
		var currentResource;

		var pulsate = function(selector) {
			$(selector).effect('pulsate',{times: 15}, 10000, function() {
				notLoadedError();
				$(this).addClass('u-warn-color');
			});
		};

		var notLoadedError = function() {
			console.error('Took too long to load a resource: %c' + currentResource, 'color: red; font-weight: 600'); // mark it red or something
		};

		var stop = function(selector) {
			$(selector).stop(true,false).css({
				opacity:'1'
			});
		};

		var switchLoader = function(resourceName, switchFrom, switchTo) {
			currentResource = resourceName;
			if (false !== switchFrom) {
				stop(switchFrom.description.id);
				$(switchFrom.tickMark.id).show();
			}

			if (switchTo instanceof Object) {
				pulsate(switchTo.description.id);
			}
		};

		switchLoader('music', false, music);
		pr.checkIfLoaded(currentResource, function() {
			switchLoader('image', music, image);
			pr.checkIfLoaded(currentResource, function() {
				switchLoader('sections', image, sections);
				pr.checkIfLoaded(currentResource, function() {
					switchLoader('All', sections);
					if (callback instanceof Function) {
						callback();
					}
				});
			});
		});
	}
}

/**************************************
Custom Functions
[ Picture Preloader ]
***************************************/

var preloadPictures = function(pictureUrls, callback) {
	if (!(pictureUrls instanceof Array)) {
		pictureUrls = [pictureUrls];
	}

    var i,
        j,
        loaded = 0;

    for (i = 0, j = pictureUrls.length; i < j; i++) {
        (function (img, src) {
            img.onload = function () {
                if (++loaded == pictureUrls.length && callback) {
                  callback(this, true);
                } else {
					callback(this, false);
				}
            };

            // Use the following callback methods to debug
            // in case of an unexpected behavior.
            img.onerror = function () {};
            img.onabort = function () {};

            img.src = src;
        } (new Image(), pictureUrls[i]));
    }
};

/**************************************
Custom Functions
[ Template *Ajaxer ]
***************************************/

var getTemplate = function(name,callback) {

	var templateFile = 'content/' + name + '.html';

	$.ajax({
		type: 'GET',
		url: templateFile,
        error: function(xhr, ajaxOptions, thrownError) {
			//some error exception
        }
	}).done(function(response) {
		callback(response);
	});

};

var Preloader = new MainPreloader();
var MyPortfolio = new Portfolio();

$(function() {
    $.views.helpers(helpers.converters);

	(function() {
        var counter = 0;
        var checkupInterval = setInterval(function() {
            helpers.checkSelectors(options.selector);
            counter++;

            if (counter >= 10) clearInterval(checkupInterval);
        }, 500);
	})();


	Preloader.load();
    $(window).resize(function() {
		MyPortfolio.background.setPosition(false,false);
		MyPortfolio.content.setWrapperSize();
	});

});

