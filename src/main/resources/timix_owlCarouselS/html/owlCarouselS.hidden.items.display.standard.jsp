<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'tint:owlcarouselItemS')}"/>

<%--<c:if test="${not empty items}">--%>
    <c:forEach items="${items}" var="item" varStatus="status">

        <template:module node="${item}" nodeTypes="tint:owlcarouselItemS">
            <template:param name="currentStatus" value="${status.first?' active':''}"/>
        </template:module>

    </c:forEach>
<%--</c:if>--%>
