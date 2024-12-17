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

<c:choose>
    <c:when test="${currentResource.moduleParams.order eq 'order-2'}">
        <c:set var="classImg" value="order-md-1"/>
        <c:set var="classTxt" value="pl-md-5 order-md-2"/>
    </c:when>
    <c:otherwise>
        <c:set var="classImg" value="order-md-2"/>
        <c:set var="classTxt" value="pr-md-5"/>
    </c:otherwise>
</c:choose>


<%--<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.html" var="itemUrl"/>--%>
<c:url value="${currentNode.url}" var="contentURL"/>

<section class="section element-animate">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-7 ${classImg}">
                <div class="scaling-image">
                    <div class="frame">
                        <template:include view="hidden.image" >
                            <template:param name="propsName" value="image"/>
                            <template:param name="class" value="img-fluid"/>
                        </template:include>
                    </div>
                </div>
            </div>
            <div class="col-md-5 mb-5">
                <div class="block-41">
                    <h2 class="block-41-heading mb-5">${titleEscaped}</h2>
                    <c:if test = "${not empty formatedDate}">
                    <p>
                        <fmt:message key="label.date.createdAt"/>: <b>${formatedDate}</b>
                    </p>
                    </c:if>
                    <div class="block-41-text">
                        ${functions:abbreviate(functions:removeHtmlTags(teaser),300,350,'...')}
                        <p>
                            <a href="${contentURL}" class="readmore">
                                <fmt:message key="label.content.readMore"/>
                                <span class="ion-md-arrow-dropright-circle"></span>
                            </a>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
