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