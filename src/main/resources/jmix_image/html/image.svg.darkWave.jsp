<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>


<c:set var="gravity" value="${currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
<c:set var="crop" value="${currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
<c:set var="raw" value="${currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>


<c:url var="imgUrl" value="${currentNode.url}" context="/" />
<%--width="1440" height="785"--%>
<div class="svg-wrapper">
    <svg viewBox="0 0 1440 785" fill="none" class="svg-desktop" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <mask id="mask0_dw" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="1440" height="785">
            <path d="M0 0L1440 0V759.894C1077 719.989 1055.85 832.681 535 759.894C218.5 715.665 190.5 744.612 0.000649284 758.196L0 0Z" fill="white"/>
        </mask>
        <g mask="url(#mask0_dw)" class="image-desktop">
    <%--        <rect width="1436" height="955" transform="matrix(-1 0 0 1 1439 0)" fill="url(#pattern0)"/>--%>
            <rect width="100%" height="100%" fill="url(#pattern0_dw)"/>
            <g style="mix-blend-mode:multiply">
                <rect y="790" width="790" height="1440" transform="rotate(-90 0 790)" fill="url(#paint0_linear_dw)"/>
            </g>
        </g>
        <defs>
    <%--        <pattern id="pattern0_dw" patternContentUnits="objectBoundingBox" width="1" height="1">--%>
    <%--            <use xlink:href="#image0" transform="translate(0 -0.00109927) scale(0.000488281 0.000734211)"/>--%>
    <%--        </pattern>--%>
            <pattern id="pattern0_dw"  width="100%" height="100%">
                <use xlink:href="#image0_dw"/>
            </pattern>
            <linearGradient id="paint0_linear_dw" x1="-1.47149e-06" y1="1510" x2="790" y2="1510" gradientUnits="userSpaceOnUse">
                <stop/>
                <stop offset="1" stop-opacity="0"/>
            </linearGradient>
            <c:choose>
                <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
                    <image id="image0_dw" preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="<cl:url node="${currentNode}" width="1439" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"/>
                </c:when>
                <c:otherwise>
                    <image id="image0_dw" preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="${imgUrl}"/>
                </c:otherwise>
            </c:choose>
        </defs>
    </svg>
<%--    width="375" height="545"--%>
    <svg viewBox="0 0 375 545" fill="none" class="svg-mobile" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <mask id="mask0_dw_xs" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="375" height="545">
            <path d="M0 0L375 0V538.444C280.469 528.023 274.962 557.452 139.323 538.444C56.901 526.893 49.6094 534.453 0.000169084 538L0 0Z" fill="white"/>
        </mask>
        <g mask="url(#mask0_dw_xs)">
<%--            <rect width="826" height="509" transform="matrix(-1 0 0 1 645 0)" fill="url(#pattern0_dw_xs)"/>--%>
            <rect width="100%" height="100%" fill="url(#pattern0_dw_xs)"/>
            <g style="mix-blend-mode:multiply">
                <rect y="550" width="550" height="375" transform="rotate(-90 0 550)" fill="url(#paint0_linear_dw_xs)"/>
            </g>
        </g>
        <defs>
<%--            <pattern id="pattern0_dw_xs" patternContentUnits="objectBoundingBox" width="1" height="1">--%>
<%--                <use xlink:href="#image0_dw_xs" transform="translate(0 -0.0407979) scale(0.000488281 0.000792378)"/>--%>
<%--            </pattern>--%>
            <pattern id="pattern0_dw_xs"  width="100%" height="100%">
                <use xlink:href="#image0_dw_xs"/>
            </pattern>
            <linearGradient id="paint0_linear_dw_xs" x1="-1.02445e-06" y1="737.5" x2="758.5" y2="737.5" gradientUnits="userSpaceOnUse">
                <stop/>
                <stop offset="1" stop-opacity="0"/>
            </linearGradient>
            <c:choose>
                <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
                    <image id="image0_dw_xs" preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="<cl:url node="${currentNode}" width="375" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"/>
                </c:when>
                <c:otherwise>
                    <image id="image0_dw_xs" preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="${imgUrl}"/>
                </c:otherwise>
            </c:choose>
        </defs>
    </svg>
</div>