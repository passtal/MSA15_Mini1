
// tab 클릭 이벤트
$(function(){
	$(".tabIdx").on("click",".idx",function(){
		var wrap = $(this).data("wrap");
		var idx = $(this).data("idx");
		$(this).addClass("on");
		$(".tabIdx .idx[data-wrap="+wrap+"]").not("[data-idx="+idx+"]").removeClass("on");
		$(".conIdx[data-wrap="+wrap+"]").not("[data-idx="+idx+"]").removeClass("on");
		$(".conIdx[data-wrap="+wrap+"][data-idx="+idx+"]").addClass("on");
	})
})

function toggleClass(obj,wrap,Class,type){
	if(obj == "body"){
		$("html").toggleClass("hidden");
	};
	if(!wrap){
		var wrap = (".toggleWrap");
	};
	if(!Class){
		var Class = "on";
	};
	if(type == "A"){
		$(wrap).addClass(Class);
		$(wrap).siblings("").removeClass(Class);
	}else{
		$(obj).parents(wrap).toggleClass(Class);
		$(obj).parents(wrap).siblings("").removeClass(Class);
	}
};

// 이메일, 전화 링크
function telLink(obj){
	var n = $(obj).data("link");
	$(obj).attr("href","tel:"+n+"")
}
function mailLink(obj){
	var mail = $(obj).data("link");
	window.location = "mailto:"+mail+"";
}

// 스크롤 이벤트
function goTop() {
	$('body, html').animate({ scrollTop: 0 }, 500);
}

scrollLoad();
function scrollLoad(evt){
	window.addEventListener('load', function() {
		$("html").addClass("load");
		onScroll(evt);
	});
	document.addEventListener('scroll', function() {
		onScroll(evt);
	});
	let latestKnownScrollY = 0,
	ticking = false;
	function onScroll(evt) {
		latestKnownScrollY = document.documentElement.scrollTop;
		requestTick();
		
	}
	function requestTick() {
		if(!ticking) {
			requestAnimationFrame(update);
		}
		ticking = true;
	}
	function update() {
		ticking = false;
		if(latestKnownScrollY > 0){
			$("html").addClass("scroll");
		}else{
			$("html").removeClass("scroll");
		}
		if(evt){
			evtStart(evt);
		}
		
	}
}

// 바탕 클릭 이벤트
function documentClick(obj){	
	$(document).mouseup(function (e){	
		if(!Class){
			var Class = "on";
		};	
		$(obj).each(function () {	
			if($(this).has(e.target).length === 0){
				$(this).removeClass(Class);			
			}
		});	
	});
}

//layer popup
function layerOpen(url){
	var frame ='<iframe class="layer_frame" src="'+url+'" frameborder="0" scrolling="no" allowtransparency="true"></iframe>'
	var wrap = '<div class="layer_wrap">'+frame+'</div>'
	$("body").append(wrap);
	$("html").addClass("hidden").addClass("popOpen");
	$(".layer_frame").on("load", function(){
		$(".layer_wrap").addClass("on");
	});
};

$(document).ready(function(){
	layerLoad();
});
function layerLoad(){
	var obj = $('.pop .popWrap');
	if(obj.hasClass("closeNo")){
		var bg = "<div class='layer_bg'></div>";
	}else{
		var bg = "<div class='layer_bg' onclick='parent.layerClose()'></div>";
	}
	obj.append(bg);
};

function layerClose(){
	$(".layer_wrap").remove()
	$("html").removeClass("hidden").removeClass("popOpen");
};

function layerOpenImg(obj){
	var src = $(obj).find("img").attr("src");
	var bg = '<div class="layer_bg" onclick="layerClose()"></div>'
	var frame ='<div class="layer_img">'+bg+'<div class="img"><img src="'+src+'" alt="" /><a href="javascript:layerClose();" class="popClose"><i class="mti material-symbols-outlined">close</i></a></div></div>'
	var wrap = '<div class="layer_wrap">'+frame+'</div>'

	$("body").append(wrap);
	$("html").addClass("hidden").addClass("popOpen");
	$(".layer_wrap").addClass("on");
};

