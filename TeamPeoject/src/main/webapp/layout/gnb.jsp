<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="gnb flex">
	<li class="m_shop ${dp1 eq 'shop' ? 'on' : ''}">
		<a href="/" class="dp1 flex ac"><span class="tt">${ nav.shop }</span></a>
		<ul class="dp2 flex">
			<li class="sm_list ${dp1 eq 'shop' and dp2 eq 'list' ? 'on' : ''}"><a href="${ root }/board/list" class="flex ac"><span class="tt">${ nav.shop_list }</span></a></li>
			<li class="sm_map ${dp1 eq 'shop' and dp2 eq 'map' ? 'on' : ''}"><a href="${ root }/board/list" class="flex ac"><span class="tt">${ nav.shop_map }</span></a></li>
			<li class="sm_hot ${dp1 eq 'shop' and dp2 eq 'hot' ? 'on' : ''}"><a href="${ root }/board/list" class="flex ac"><span class="tt">${ nav.shop_hot }</span></a></li>
			<li class="sm_board ${dp1 eq 'board' and dp2 eq 'list' ? 'on' : ''}"><a href="${ root }/board/list" class="flex ac"><span class="tt">${ nav.board_list }</span></a></li>
		</ul>
	</li>	
	<li class="m_mypage ${dp1 eq 'mypage' ? 'on' : ''}">
		<a href="${ root }/page/mypage.jsp" class="dp1 flex ac"><span class="tt">${ nav.mypage }</span></a>
		<ul class="dp2 flex">
			<li class="sm_modify ${dp1 eq 'mypage' and dp2 eq 'modify' ? 'on' : ''}"><a href="${ root }/page/update.jsp" class="flex ac"><span class="tt">${ nav.mypage_modify }</span></a></li>			
		</ul>
	</li>		
</ul>