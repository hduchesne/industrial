<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="linkType" value="${currentNode.properties.linkType.string}" />

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

<c:set target="${moduleMap}" property="linkUrl" value="${linkUrl}" />
<c:set target="${moduleMap}" property="linkTarget" value="${currentNode.properties.linkTarget.string}" />
