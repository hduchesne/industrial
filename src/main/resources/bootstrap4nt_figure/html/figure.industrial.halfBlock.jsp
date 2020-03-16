<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="imagePosition" value="${currentResource.moduleParams.imagePosition}"/>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<div class="image ${imagePosition}"  style="background-image: url('${imageURL}')"></div>