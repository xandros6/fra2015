<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div id="filterWindow" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>Set filter</h3>
		</div>
		<div class="modal-body">

		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> 
			<a id="filterBtn" href="#" class="btn btn-primary">Apply</a>
		</div>
	</div>


	<div id="createUserWindow" class="myModal modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>Create user</h3>
		</div>

		<div id="modal-body" class="modal-body">

		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> 
			<a id="saveBtn" href="#" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	<div id="editUserWindow" class="myModal modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">x</button>
			<h3>Edit user</h3>
		</div>

		<div id="modal-body" class="modal-body">

		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> 
			<a id="updateBtn" href="#" class="btn btn-primary">Update</a>
		</div>
	</div>

    <div id="deleteWarningWindow" class="modal hide fade">
	    <div class="modal-header">
	    	<h3>Delete user confirm</h3>
	    </div>
	    <div class="modal-body">
		    <p>Are you sure?</p>
		</div>
	    <div class="modal-footer">
		    <a href="#" class="btn" data-dismiss="modal">No</a>
		    <a id="deleteBtn" href="#" class="btn btn-primary">Yes</a>
	    </div>
    </div>

	<div class="container">

		<div class="alertArea" id="alert-area"></div>

		<div class="row">
			<p class="pull-right">
				<a href="${pageContext.request.contextPath}/users/editor/-1/${page}" class="btn" data-toggle="modal" data-target="#createUserWindow" data-backdrop="static"> Create user </a>
				<a href="${pageContext.request.contextPath}/users/filter/" class="btn <c:if test="${isFiltered}">btn-primary</c:if>" data-toggle="modal" data-target="#filterWindow" data-backdrop="static">Apply filter</a>
			</p>
		</div>

		<div class="row">
			<div class="span12">
				<table id="userTable"	class="table table-bordered table-hover table-condensed table-striped">
					<thead>
						<tr>
							<th>Fullname</th>
							<th>Username</th>
							<th>Role</th>
							<th>Countries</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items='${users}' var='user' varStatus='rowItem'>
							<tr class="rowItem">								
								<td class="fullname"><div>${user.name}</div></td>
								<td class="username"><div>${user.username}</div></td>
								<td class="role"><div>${user.role}</div></td>
								<td class="countries"><div class="countries">${user.countries}</div></td>
								<td class="link">
									<a style="width:50px" href="${pageContext.request.contextPath}/users/editor/${user.id}/${page}" class="btn" data-toggle="modal" data-target="#editUserWindow" data-backdrop="static"> Edit </a>
									<a style="width:50px" href="#" class="btn" data-toggle="modal" data-target="#deleteWarningWindow" data-userid="${user.id}" data-page="${page}" data-backdrop="static"> Delete </a>
								</td>
							</tr>
						</c:forEach>	
						<c:forEach var="i" begin="1" end="${10 - (fn:length(users))}" step="1">
						  <tr class="rowItem">                
                <td class="fullname"><div>&#160;</div></td>
                <td class="username"><div>&#160;</div></td>
                <td class="role"><div>&#160;</div></td>
                <td class="countries"><div>&#160;</div></td>
                <td class="link">&#160;</td>
						</c:forEach>							
					</tbody>
				</table>
				<div class="pagination pagination-centered">
					<ul>

						<c:if test="${not empty pagination.firstPage}">
            <li><a href="${pageContext.request.contextPath}/users/${pagination.firstPage}">First</a></li>
            </c:if>
            <c:if test="${empty pagination.firstPage}">
              <li class="disabled"><a href="#">First</a></li>
            </c:if>
						
						<c:if test="${not empty pagination.prev1}">
            <li><a href="${pageContext.request.contextPath}/users/${pagination.prev1}">Prev</a></li>
            </c:if>
            <c:if test="${empty pagination.prev1}">
              <li class="disabled"><a href="#">Prev</a></li>
            </c:if>
						
						<c:if test="${not empty pagination.prev2}">
            <li><a href="${pageContext.request.contextPath}/users/${pagination.prev2}">${pagination.prev2+1}</a></li>
            </c:if>
            <c:if test="${empty pagination.prev2}">
              <li class="disabled"><a href="#"> - </a></li>
            </c:if>
						
						<c:if test="${not empty pagination.prev1}">
						<li><a href="${pageContext.request.contextPath}/users/${pagination.prev1}">${pagination.prev1+1}</a></li>
            </c:if>
            <c:if test="${empty pagination.prev1}">
              <li class="disabled"><a href="#"> - </a></li>
            </c:if>
            
						<li class="disabled"><a href="#" style="background-color: #0088CC;color:white;">${pagination.currentPage+1}</a></li>
						
						<c:if test="${not empty pagination.next1}">
						  <li><a href="${pageContext.request.contextPath}/users/${pagination.next1}">${pagination.next1+1}</a></li>
						</c:if>
						<c:if test="${empty pagination.next1}">
              <li class="disabled"><a href="#"> - </a></li>
            </c:if>
						
						<c:if test="${not empty pagination.next2}">
              <li><a href="${pageContext.request.contextPath}/users/${pagination.next2}">${pagination.next2+1}</a></li>
            </c:if>
            <c:if test="${empty pagination.next2}">
              <li class="disabled"><a href="#"> - </a></li>
            </c:if>
						
						<c:if test="${not empty pagination.next1}">
              <li><a href="${pageContext.request.contextPath}/users/${pagination.next1}">Next</a></li>
            </c:if>
            <c:if test="${empty pagination.next1}">
              <li class="disabled"><a href="#">Next</a></li>
            </c:if>
            
            <c:if test="${not empty pagination.lastPage}">
              <li><a href="${pageContext.request.contextPath}/users/${pagination.lastPage}">Last</a></li>
            </c:if>
            <c:if test="${empty pagination.lastPage}">
              <li class="disabled"><a href="#">Last</a></li>
            </c:if>						 

					</ul>
				</div>
			</div>
		</div>
	
	</div>
</div>