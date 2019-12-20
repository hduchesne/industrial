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

<%--<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>--%>
<c:set var="caption" value="${currentNode.properties.caption.string}"/>
<%--<c:set var="imageNode" value="${currentNode.properties.image.node}"/>--%>

<c:url var="videoURL" value="${currentNode.properties.videoURL.string}"/>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="card j-owl-carousel-card-edit">
            <img class="card-img-top" src="${imageURL}" alt="Card image cap">
            <div class="card-body">
                ${caption}
<%--                <h5 class="card-title">Card title</h5>--%>
<%--                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
<%--                <a href="#" class="btn btn-primary">Go somewhere</a>--%>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="item">
                ${caption}
<%--            <div class="block-33 h-100">--%>
<%--                <div class="vcard d-flex mb-3">--%>
<%--                    <div class="image align-self-center">--%>
<%--                        <img src="${imageURL}" alt="Person here">--%>
<%--                    </div>--%>
<%--                    ${caption}--%>
<%--&lt;%&ndash;                    <div class="name-text align-self-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <h2 class="heading">John Smith</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <span class="meta">Free-Template.co Client</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                </div>--%>
<%--                <div class="text">--%>
<%--                    <blockquote>--%>
<%--                        <p>&rdquo; The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. &ldquo;</p>--%>
<%--                    </blockquote>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
<%--        <div class="slider-item" style="background-image: url('${imageURL}');">--%>
<%--            <div class="container">--%>
<%--                <div class="row slider-text align-items-center justify-content-center">--%>
<%--                    <div class="col-lg-7 text-center col-sm-12 element-animate">--%>
<%--                        <div class="btn-play-wrap mx-auto">--%>
<%--                            <p class="mb-4">--%>
<%--                                <a href="${videoURL}" data-fancybox data-ratio="2" class="btn-play">--%>
<%--                                    <span class="ion ion-ios-play"></span>--%>
<%--                                </a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                        ${caption}--%>
<%--&lt;%&ndash;                        <h1 class="mb-4"><span>We Are Industrial Company</span></h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias iste ipsa excepturi nostrum sequi molestias?</p>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </c:otherwise>
</c:choose>