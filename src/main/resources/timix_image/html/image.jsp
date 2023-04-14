<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>

<%-- mediaNode : the variable is import because it is used by the getMediaURL jsp fragment--%>
<c:set var="mediaNode" value="${currentNode.properties['image'].node}"/>
<c:set var="mediaWidth" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '1280'}"/>

<%-- code included set the variable mediaURL --%>
<%@ include file="../../getMediaURL.jspf"%>

<img src="${mediaURL}" width="100%"
     class="${currentResource.moduleParams.class}"
     alt="${alt}"
/>
