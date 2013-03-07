<%@ include file="../common/includes/taglibs.jsp"%>
<div>
	<div id="filterWindow" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Set filter</h3>
		</div>
		<div class="modal-body">
			<form id="filterForm" method="get" action="">
				<fieldset>
					<p>
						<label for="name" class="control-label">Name</label> <input
							id="name" name="name" size="25" class="input-block-level">
					</p>
					<p>
						<label for="username" class="control-label">Username</label> <input
							id="username" name="username" size="25" class="input-block-level">
					</p>
					<p>
						<label for="email" class="control-label">E-Mail</label> <input
							id="email" name="email" size="25" class="input-block-level">
					</p>
					<p>
						<label class="control-label" for="role">Role</label> <select
							id="role" class="input-block-level">
							<option value="contributor">Contributor</option>
							<option value="reviewer">Reviewer</option>
							<option value="editor">Review Editor</option>
							<option value="validator">Country Validator</option>
						</select>
					</p>
					<p>
						<label class="control-label" for="countryComboBox">Countries:</label>
						<input id="countries_a" size="20" class="input-block-level" type="text" data-provide="typeahead" data-source="['AA','AB','CD']">
					</p>
				</fieldset>
			</form>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a
				id="filterBtn" href="#" class="btn btn-primary">Create</a>
		</div>
	</div>


	<div id="createUserWindow" class="modal hide fade span8">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>Create user</h3>
		</div>

		<div id="modal-body" class="modal-body">

		</div>
		
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> 
			<a id="saveBtn" href="#" class="btn btn-primary">Save</a>
		</div>
	</div>


	<div class="container">

		<div class="row">
			<div id="errorPanel" class="span12"></div>
		</div>

		<div class="row">
			<p class="pull-right">
				<a href="${pageContext.request.contextPath}/users/editor/-1/${page}" class="btn" data-toggle="modal" data-target="#createUserWindow"> Create user </a>
				<a href="#" id="applyFilterBtn" class="btn btn-primary" data-toggle="modal" data-target="#filterWindow">Apply filter</a>
			</p>
		</div>


		<div class="row">
			<div class="span12">
				<table id="userTable"
					class="table table-bordered table-hover table-condensed table-striped">
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
								<td>${user.name}</td>
								<td>${user.username}</td>
								<td>${user.role}</td>
								<td>${user.countries}</td>
								<td><a href="${pageContext.request.contextPath}/users/editor/${user.id}/${page}" class="btn" data-toggle="modal" data-target="#createUserWindow"> Edit </a></td>
							</tr>
						</c:forEach>	
							
					</tbody>
				</table>
				<ul class="pager pull-right">
					<c:if test="${ prev>=0}">
					<li class="eanabled"><a href="${prev}">Prev</a></li>
					</c:if>
					<c:if test="${next>0}">
					<li><a href="${next}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
