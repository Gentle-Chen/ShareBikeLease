<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<div class="footer" ${param.action!='index'?'style="color: #fff;"':''}>
<%-- 	<p><spring:message code="footer_copyright"/></p> --%>
	<div class="f-nav">
<a ${param.action!='index'?'class="fff"':''} href="">Copyright © 2018 HaFu. All Rights Reserved 津ICP备666666号-6</a>
	</div>
</div>
