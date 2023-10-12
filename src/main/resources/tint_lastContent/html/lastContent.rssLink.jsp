<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.rss" var="itemUrl"/>
<style>
    .rss > span {
        position: absolute;
        right: 0;
        top: 50%;
        font-size: 1rem;
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
    }
    .rss{
        position: relative;
        padding-right: 20px;
    }

</style>

<a href="${itemUrl}" target="_blank" class="rss">
    ${titleEscaped}
    <span class="ion-logo-rss"></span>
</a>