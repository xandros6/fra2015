<%@ include file="../common/includes/taglibs.jsp"%>

<form:form class="cmxform" commandName="formUserFilter" id="filterUserForm"  method="post" action="${pageContext.request.contextPath}/users/updateFilter/">
	<fieldset>
		<table style="width:100%">
		<tr>
			<td colspan="2">
				<form:label path="name" class="control-label">Name</form:label> 
			</td>
		</tr>
		<tr>
			<td width="90%">
				<form:input path="name" id="filter_cname" name="name" class="input-block-level"/> 
			</td>
			<td width="10%" valign="top" align="center">
				<button id="filter_cname_clear_btn" type="button" class="btn btn-primary">X</button>	
			</td>	
		</tr>
		
		<tr>
			<td colspan="2">
				<form:label path="username" class="control-label">Username</form:label> 
			</td>
		</tr>
		<tr>
			<td>
				<form:input path="username" id="filter_cusername" name="username" class="input-block-level"/> 
			</td>
			<td valign="top" align="center">
				<button id="filter_cusername_clear_btn" type="button" class="btn btn-primary">X</button>	
			</td>	
		</tr>
		
		<tr>
			<td colspan="2">
				<form:label path="email" class="control-label">E-Mail</form:label> 
			</td>
		</tr>
		<tr>
			<td>
				<form:input path="email" id="filter_cemail" name="email" class="input-block-level"/> 
			</td>
			<td valign="top" align="center">
				<button id="filter_cemail_clear_btn" type="button" class="btn btn-primary">X</button>	
			</td>	
		</tr>
		
		<tr>
			<td colspan="2">
				<form:label path="role" class="control-label">Role</form:label> 
			</td>
		</tr>
		<tr>
			<td>
				<form:select path="role" id="filter_roleComboBox" class="input-block-level"> 
 					<form:options items="${roles}" />
				</form:select>
			</td>
			<td valign="top" align="center">
				<button id="filter_roleComboBox_clear_btn" type="button" class="btn btn-primary">X</button>	
			</td>	
		</tr>
		
		<tr>
			<td colspan="2">
				<form:label path="countries" class="control-label">Countries</form:label> 
			</td>
		</tr>
		<tr>
			<td>
				<input id="filter_countries" type="text" autocomplete="off" class="input-block-level"/>  
				<form:input path="selCountries" name="selCountries" type="hidden" id="selCountries"/>
			</td>
			<td valign="top" align="center">
				<button id="filter_countries_clear_btn" type="button" class="btn btn-primary">X</button>	
			</td>	
		</tr>
		
		</table>
	</fieldset>
</form:form>