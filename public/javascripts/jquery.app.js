$( document ).ready(function() {
    //console.log( "ready!" );
	$(".navbar-toggle").click(function(){
		//debugger
		if($(".left-panel").hasClass("collapsed")){
			$(".leftNav").css("overflow",'hidden');
			$(".slimScrollDiv").css("overflow",'hidden');
		}else{
			$(".leftNav").css("overflow",'visible');
			$(".slimScrollDiv").css("overflow",'visible');
		}
		 
		$(".topMenu").each(function() {
				if($(this).children().last().hasClass("fa-angle-down"))
				{
					$(this).children().last().addClass("fa-angle-right");
					$(this).children().last().removeClass("fa-angle-down");
					$(this).next().hide(200);
				}
			});
			$(".submenu").each(function() {
					if($(this).children(0).hasClass("fa-angle-down")){
						$(this).children(0).removeClass("fa-angle-down");
						$(this).children(0).addClass("fa-angle-right");
						$(this).next().hide(200);
					}
				});
	});
	$(".topMenu").click(function(){
		if($(this).children().last().hasClass("fa-angle-right")){
			 $(".topMenu").each(function() {
				if($(this).children().last().hasClass("fa-angle-down"))
				{
					$(this).children().last().addClass("fa-angle-right");
					$(this).children().last().removeClass("fa-angle-down");
					$(this).next().hide(200);
				}
			}); 
			$(this).children().last().removeClass("fa-angle-right");
			$(this).children().last().addClass("fa-angle-down");
			$(this).next().show(200);
		} else if($(this).children().last().hasClass("fa-angle-down")){
			$(this).children().last().addClass("fa-angle-right");
			$(this).children().last().removeClass("fa-angle-down");
			$(this).next().hide(200);
		} 
		
	});
	$(".submenu").click(function(){
		if($(this).children(0).hasClass("fa-angle-down")){
				$(".submenu").each(function() {
					if($(this).children(0).hasClass("fa-angle-down")){
						$(this).children(0).removeClass("fa-angle-down");
						$(this).children(0).addClass("fa-angle-right");
						$(this).next().hide(200);
					}
				});
				$(this).children(0).removeClass("fa-angle-down");
				$(this).children(0).addClass("fa-angle-right");
				$(this).next().hide(200);
			}else if($(this).children(0).hasClass("fa-angle-right")){
				$(".submenu").each(function() {
					if($(this).children(0).hasClass("fa-angle-down")){
						$(this).children(0).removeClass("fa-angle-down");
						$(this).children(0).addClass("fa-angle-right");
						$(this).next().hide(200);
					}
				});
				$(this).children(0).addClass("fa-angle-down");
				$(this).children(0).removeClass("fa-angle-right");
				$(this).next().show(200);
			}
		/* $(this).children(0).toggleClass("fa-angle-down");
	    //$(".fa-angle-right").toggleClass("fa-angle-down");
		$(this).next().show(200); */
			 
	});
});
! function($) {
    "use strict";

    /**
    Sidebar Module
    */
	
	
	
	$(".submenu2Items").click(function(){
	   $(this).next().toggle();
	   $(this).parent().parent().css('height','auto');
	});
    var SideBar = function() {
        this.$body = $("body"),
        this.$sideBar = $('aside.left-panel'),
        this.$navbarToggle = $(".navbar-toggle"),
        this.$navbarItem = $("aside.left-panel nav.navigation > ul > li:has(ul) > a")
    };

    //initilizing 
    SideBar.prototype.init = function() {
        //on toggle side menu bar
        var $this = this;
        $(document).on('click', '.navbar-toggle', function () {
            $this.$sideBar.toggleClass('collapsed');
			
        }); 

        //on menu item clicking
        /* this.$navbarItem.click(function () {
			if ($this.$sideBar.hasClass('collapsed') == false || $(window).width() < 768) {
                $("aside.left-panel nav.navigation > ul > li > ul").slideUp(300);
                $("aside.left-panel nav.navigation > ul > li").removeClass('active');
				$(this).children().last().toggleClass("fa-angle-down")
                if (!$(this).next().is(":visible")) {
                   $(this).next().slideToggle(300, function () {
                     // $("aside.left-panel:not(.collapsed)").getNiceScroll().resize();
                    });
					
						$(this).closest('li').addClass('active');
						
						
					
                    
               }
                return false;
            }
        }); */

        //adding nicescroll to sidebar
        if ($.isFunction($.fn.niceScroll)) {
            $("aside.left-panel:not(.collapsed)").niceScroll({
                cursorcolor: '#8e909a',
                cursorborder: '5px solid #fff',
                cursoropacitymax: '0.5',
                cursorborderradius: '0px'
            });
        }
    },

    //exposing the sidebar module
    $.SideBar = new SideBar, $.SideBar.Constructor = SideBar
    
}(window.jQuery),


//portlets
function($) {
    "use strict";

    /**
    Portlet Widget
    */
    var Portlet = function() {
        this.$body = $("body"),
        this.$portletIdentifier = ".portlet",
        this.$portletCloser = '.portlet a[data-toggle="remove"]',
        this.$portletRefresher = '.portlet a[data-toggle="reload"]'
    };

    //on init
    Portlet.prototype.init = function() {
        // Panel closest
        var $this = this;
        $(document).on("click",this.$portletCloser, function (ev) {
            ev.preventDefault();
            var $portlet = $(this).closest($this.$portletIdentifier);
                var $portlet_parent = $portlet.parent();
            $portlet.remove();
            if ($portlet_parent.children().length == 0) {
                $portlet_parent.remove();
            }
        });

        // Panel Reload
        $(document).on("click",this.$portletRefresher, function (ev) {
            ev.preventDefault();
            var $portlet = $(this).closest($this.$portletIdentifier);
            // This is just a simulation, nothing is going to be reloaded
            $portlet.append('<div class="panel-disabled"><div class="loader-1"></div></div>');
            var $pd = $portlet.find('.panel-disabled');
            setTimeout(function () {
                $pd.fadeOut('fast', function () {
                    $pd.remove();
                });
            }, 500 + 300 * (Math.random() * 5));
        });
    },
    //
    $.Portlet = new Portlet, $.Portlet.Constructor = Portlet
    
}(window.jQuery),
 

//main app module
function($) {
    "use strict";
    
    var VelonicApp = function() {
        this.VERSION = "1.0.0", 
        this.AUTHOR = "Coderthemes", 
        this.SUPPORT = "coderthemes@gmail.com", 
        this.pageScrollElement = "html, body", 
        this.$body = $("body")
    };

    //initializing tooltip
    VelonicApp.prototype.initTooltipPlugin = function() {
        $.fn.tooltip && $('[data-toggle="tooltip"]').tooltip()
    }, 

    //initializing popover
    VelonicApp.prototype.initPopoverPlugin = function() {
        $.fn.popover && $('[data-toggle="popover"]').popover()
    }, 

    //initializing nicescroll
    VelonicApp.prototype.initNiceScrollPlugin = function() {
        //You can change the color of scroll bar here
        $.fn.niceScroll &&  $(".nicescroll").niceScroll({ cursorcolor: '#9d9ea5', cursorborderradius: '0px'});
    },

    //initializing knob
    VelonicApp.prototype.initKnob = function() {
        if ($(".knob").length > 0) {
            $(".knob").knob();
        }
    },
    
    //initilizing 
    VelonicApp.prototype.init = function() {
        this.initTooltipPlugin(),
        this.initPopoverPlugin(),
        this.initNiceScrollPlugin(),
        this.initKnob(),
        //creating side bar
        $.SideBar.init(),
        //creating portles
        $.Portlet.init();
    },

    $.VelonicApp = new VelonicApp, $.VelonicApp.Constructor = VelonicApp

}(window.jQuery),

//initializing main application module
function($) {
    "use strict";
    $.VelonicApp.init()
}(window.jQuery);
