<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<%--<c:set var="linkUrl" value="${currentResource.moduleParams.linkUrl}"/>--%>
<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<c:set var="linkType" value="${currentNode.properties.linkType.string}"/>
<c:set var="linkUrl" value="#"/>

<c:choose>
    <c:when test="${linkType eq 'internalLink'}">
        <c:set var="internalLinkNode" value="${currentNode.properties.internalLink.node}"/>
        <c:choose>
            <c:when test="${! empty internalLinkNode}">
                <c:url var="linkUrl" value="${internalLinkNode.url}"/>
            </c:when>
        </c:choose>
    </c:when>
    <c:when test="${linkType eq 'externalLink'}">
        <c:url var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
    </c:when>
    <c:when test="${linkType eq 'self'}">
        <c:url var="linkUrl" value="${currentNode.url}"/>
    </c:when>
</c:choose>

<%--TODO create cache dependencies with image?--%>

<div class="media d-block media-custom text-center">
    <a href="${linkUrl}"><img src="${imageURL}" alt="people" class="img-fluid"></a>
    ${body}
</div>