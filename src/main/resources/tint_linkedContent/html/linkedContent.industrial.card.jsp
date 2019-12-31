<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="linkUrl" value="${currentResource.moduleParams.linkUrl}"/>
<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<%--TODO create cache dependencies with image?--%>

<div class="media d-block media-custom text-center">
    <a href="${linkUrl}"><img src="${imageURL}" alt="people" class="img-fluid"></a>
    ${body}
</div>