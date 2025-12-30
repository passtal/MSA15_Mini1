<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<%
	request.setAttribute("dp0", "pop");
%>

<jsp:include page="/layout/top.jsp" />

<!-- 메뉴 추가 팝업 -->
<div class="popWrap popForm">
    <div class="popTit">
        <span class="tit"><i class="t1">메뉴 추가</i></span>
        <a href="javascript:parent.layerClose();" class="popClose">
            <i class="mti material-symbols-outlined">close</i>
        </a>
    </div>

    <div class="popIn scrollst">
        <div class="popCon">

            <form action="${pageContext.request.contextPath}/menu/write"
                  method="post"
                  class="menu-form">

                <input type="hidden" name="place_no" value="${place_no}" />
                <ul class="form_st">

                    <!-- 메뉴명 -->
                    <li>
                        <div class="mem_tit">
                            <span class="tt">메뉴명</span>
                        </div>
                        <br>
                        <div class="in">
                            <input type="text" name="menuname" class="input_st fit" placeholder="메뉴명을 입력하세요" required />
                        </div>
                    </li>

					<!-- 설명 -->
                    <li>
                        <div class="mem_tit">
                            <span class="tt">설명</span>
                        </div>
                        <br>
                        <div class="in">
                            <input type="text" name="content" class="input_st fit" placeholder="간단한 설명을 적어주세요." required />
                        </div>
                    </li>

                    <!-- 가격 -->
                    <li>
                        <div class="mem_tit">
                            <span class="tt">가격</span>
                        </div>
                        <br>
                        <div class="in">
                            <input type="number" name="price" class="input_st fit" placeholder="가격 (원)" min="0" required />
                        </div>
                    </li>

                    <!-- 버튼 -->
                    <li class="btn_wrap">
                        <button type="button" class="input_st c1 re" onclick="parent.layerClose();">
                            취소
                        </button>
                        <button type="submit" class="input_st c1">
                            메뉴 등록
                        </button>
                    </li>

                </ul>
            </form>

        </div>
    </div>
</div>

<jsp:include page="/layout/bottom.jsp" />