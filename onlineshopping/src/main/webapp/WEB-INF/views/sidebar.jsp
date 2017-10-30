<!--  BEGIN sidebar.jsp -->
<p class="lead">Shop Name</p>

<div class="list-group">
    <a href="${contextRoot}/test" class="list-group-item bg-danger">Test Harness</a>
	<c:forEach items="${categories}" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products"
			class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>
 
</div>
<!--  END sidebar.jsp -->
