<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
</div>
<!-- 컨텐츠 end -->

<footer id="footer">
	<a href="javascript:goTop();" class="goTop flex ac"><span class="mti material-symbols-outlined">keyboard_arrow_up</span></i></a>	
	<div class="box1 inner flex wrap">
		<div class="logo"><a href="${ root }/" class="in filW"><img src="${ root }/static/img/logo.png" alt="logo"></a></div>
		<div class="info_wrap flex col">
			<ul class="menu flex wrap">
				<li><a href="javascript:void(0);" class="tt">${ nav.policy_agree }</a></li>
				<li><a href="javascript:void(0);" class="tt point">${ nav.policy_privacy }</a></li>
				<li><a href="javascript:void(0);" class="tt">${ nav.policy_map }</a></li>
				<li><a href="javascript:void(0);" class="tt">${ nav.policy_guide }</a></li>
			</ul>
			<ul class="info flex wrap">
				<li><span class="tt">${ site.name }</span></li>
				<li><span class="tt">대표. ${ site.owner }</span></li>
				<li><span class="tt">주소. ${ site.addr }</span></li>
				<li class="br"></li>
				<li><span class="tt">사업자등록번호. ${ site.bnum }</span></li>
				<li><span class="tt">개인정보담당. </span><a class="tt dataLink" data-link="${ site.email }" onclick="mailLink(this)"></a></li>
				<li><span class="tt">대표번호. </span><a class="tt dataLink" data-link="${ site.tel }" onclick="telLink(this)"></a></li>
			</ul>
			<div class="copy">copyright © ${ site.name }. all rights reserved.</div>
		</div>
	</div>	
</footer>

<jsp:include page="/layout/bottom.jsp" />