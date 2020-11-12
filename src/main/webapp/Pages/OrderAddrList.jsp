<%@page import="kr.or.ddit.rb.cmm.vo.AddrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AddrVO> addrList = (List<AddrVO>) request.getAttribute("addrList");
%>
[
<%
	if(addrList.size() > 0 || addrList != null){
		for(int i=0; i<addrList.size(); i++){
			AddrVO addrVO = addrList.get(i);
		%>
		{
			"addr"		: "<%= addrVO.getAddrSido() %> <%= addrVO.getAddrGugun() %> <%= addrVO.getAddrDong() %>",
			"addrSq"		: "<%= addrVO.getAddrSq() %>"
		}
		<%
			if(i != addrList.size()-1){
				out.print(",");
			}
		}
	}
%>
]