<%@page import="kr.or.ddit.rb.cmm.vo.AddrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	List<AddrVO> addrList = (List<AddrVO>) request.getAttribute("addrList");
%> --%>

[
	<c:forEach var="avo" items="${addrList}" varStatus="status">
		<c:if test="${status.index > 0}">
			,
		</c:if>
		{
			"zip": "${avo.addrZip}",
			"addr" : "${avo.addrSido } ${avo.addrGugun} ${avo.addrDong}",
			"bunji" : "${avo.addrBunji}",
			"sq" : "${avo.addrSq }"
			
		
		}
	</c:forEach>
	



<%-- <%
	for(int i=0; i<addrList.size();i++){
		AddrVO avo = addrList.get(i);
		if(i>0) out.print(",");
		String bunji = avo.getAddrBunji();
		if(bunji == null) bunji = "";
		// zip+ 시도 + 구군 + 동 + 번지
%>
	{
		"zip" : "<%= avo.getAddrZip() %>",
		"addr" : "<%= avo.getAddrSido() %> <%= avo.getAddrGugun() %> <%= avo.getAddrDong() %>",
		"bunji" : "<%= bunji %>",
		"sq" : "<%= avo.getAddrSq() %>"
	}
<%		
	}
%> --%>
]