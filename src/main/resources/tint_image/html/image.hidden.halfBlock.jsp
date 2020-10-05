<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>

<%--
    NOTE :

    background-image : image-set(
      url('../img/carousel/bg_360.jpg') 1x,
      url('../img/carousel/bg_780.jpg') 2x
    );
    is currently not well supported. Use it when it will be supported
--%>

<c:choose>
    <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
        <%-- cloudinary config params --%>
        <c:set var="gravity" value="${not empty currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
        <c:set var="crop" value="${not empty currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
        <c:set var="raw" value="${not empty currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>
        <c:set var="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width :'768'}"/>
        <div class="image-display" style="background-image: url('<cl:url node="${currentNode.properties.image.node.url}" width="${width}" crop="${crop}" gravity="${gravity}" raw="${raw}"/>');"></div>
    </c:when>
    <c:otherwise>
        <c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>
        <div class="image-display" style="background-image: url('${imageURL}');"></div>
    </c:otherwise>
</c:choose>
