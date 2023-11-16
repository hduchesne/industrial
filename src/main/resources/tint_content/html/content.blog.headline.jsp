<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<fmt:setLocale value="${currentResource.locale.language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>

<fmt:message key="label.date.at" var="at"/>
<c:set var="date" value="${currentNode.properties['date'].date}"/>
<fmt:formatDate value="${date.time}" pattern="dd MMM yyyy" var="formatedDate"/>
<fmt:formatDate value="${date.time}" pattern="HH:ss" var="formatedTime"/>
<c:if test="${not empty formatedDate && formatedTime != '00:00'}">
    <c:set var="formatedDate" value="${formatedDate} ${at} ${formatedTime}"/>
</c:if>

<%--<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.html" var="itemUrl"/>--%>
<c:url value="${currentNode.url}" var="contentURL"/>


<div class="media mb-4 d-md-flex d-block">
    <a href="${contentURL}" class="mr-5">
        <template:include view="hidden.image" >
            <template:param name="width" value="350"/>
            <template:param name="propsName" value="imagePortrait"/>
            <template:param name="class" value="img-fluid"/>
        </template:include>
    </a>
    <div class="media-body">
        <span class="post-meta">${formatedDate}</span>
        <h3 class="mt-2 text-black">
            <a href="${contentURL}">${titleEscaped}</a>
        </h3>
        <p>${functions:abbreviate(functions:removeHtmlTags(teaser),200,250,'...')}</p>
        <p>
            <a href="${contentURL}" class="readmore">
                <fmt:message key="label.content.readMore"/>
                <span class="ion-md-arrow-dropright-circle"></span>
            </a>
        </p>
    </div>
</div>