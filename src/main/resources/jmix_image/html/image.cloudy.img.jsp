<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%--<utility:logger level="INFO" value="[cloudy] currentNode node : ${currentNode}"/>--%>
<%--<utility:logger level="INFO" value="[cloudy] is jmix:image : ${jcr:isNodeType(currentNode,'jmix:image') }"/>--%>

<c:set var="class" value="${fn:escapeXml(currentResource.moduleParams.class)}"/>
<c:set var="id" value="${not empty currentResource.moduleParams.id ? currentResource.moduleParams.id : currentNode.identifier}"/>

<%-- cloudinary config params --%>
<c:set var="gravity" value="${not empty currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
<c:set var="crop" value="${not empty currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
<c:set var="raw" value="${not empty currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>
<c:set var="widths" value="${not empty currentResource.moduleParams.widths ? currentResource.moduleParams.widths :
    '256,512,768,1024,1280,1600,2000'}"/>
<c:set var="defaultWidth" value="${not empty currentResource.moduleParams.defaultWidth ? currentResource.moduleParams.defaultWidth :'768'}"/>

<c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:url var="imgUrl" value="${currentNode.url}" context="/" />

<%--<utility:logger level="INFO" value="imgUrl : ${imgUrl}"/>--%>

<c:choose>
    <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
<%--        <utility:logger level="INFO" value="Yo! cloudy and live "/>--%>
        <img src="<cl:url node='${currentNode}' width="${defaultWidth}" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"
             srcset="<c:forEach items="${fn:split(widths, ',')}" var="width" varStatus="status">
                        <c:if test="${!status.first}">,</c:if>
                        <cl:url node="${currentNode}" width="${width}" crop="${crop}" gravity="${gravity}" raw="${raw}"/> ${width}w
                    </c:forEach>"
             class="${class}"
             alt="${alt}"
        />
    </c:when>
    <c:otherwise>
<%--        <utility:logger level="INFO" value="[cloudy] Whoooo! cloudy off or default "/>--%>
        <img src="${imgUrl}" class="${class}" alt="${alt}">
    </c:otherwise>
</c:choose>


