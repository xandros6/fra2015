
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="tabContent">
	<div>
		<div class="container">

			<!-- <div class="row">
<div class="span4">
<div class="well well-large">
<button class="close">×</button>
<form>
<fieldset>

<legend>Search criteria</legend>

<label>Start date and time</label>
<input type="text" class="input-small" id="startDate" /><input type="text" class="input-small" id="startTime" />


<label>End date and time</label>
<input type="text" class="input-small" id="endDate" /><input type="text" class="input-small" id="endTime" />


<label>User</label>
<input id="users" class="input-large" type="text">

<label>Country</label>
<input id="countries" class="input-large" type="text">

<label>Keyword</label>
<input class="input-large" type="text">

<button type="submit" class="btn">Search</button>
</fieldset>
</form>

</div> 
</div>-->



			<div class="span12">
				
				<div id="filter">
					<form action="revieweractivitylog" method="POST">
						<table
							class="table table-bordered table-hover table-condensed table-striped">
							<thead>
								<tr>
									<th>Time Interval</th>
									<th>Country Username Question</th>
									<th>Country EntryItemName</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="span3">
										<input type="text" class="input-small hasDatepicker" name="t1" id="startDate">
										<input type="text" class="span1 hasTimepicker" id="startTime">
										to <br> 
										<input type="text" class="input-small hasDatepicker" name="t2" id="endDate" />
										<input type="text" class="span1 hasTimepicker" id="endTime" />
									</td>
									<td>
										<input id="country" name="country" class="input-small ui-autocomplete-input" type="text" autocomplete="off" />
										<br>
										<input id="username" name="username" class="input-small ui-autocomplete-input" type="text" autocomplete="off" />
										<input id="question" name="question" class="input-small ui-autocomplete-input" type="text" autocomplete="off" />
										<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
									</td>
									<td>
										<input id="country" name="country" class="input-small ui-autocomplete-input" type="text" autocomplete="off">
										<br>
										<input id="EntryItemName" name="entryItemName" class="input-small ui-autocomplete-input" type="text" autocomplete="off">
										<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
									</td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="filter" value="f3">
						<button type="submit" class="btn">ApplyFilter</button>
					</form>
				</div>

				<table
					class="table table-bordered table-hover table-condensed table-striped">
					<thead>
						<tr>
							<th>Time</th>
							<th>Username</th>
							<th>Country</th>
							<th>Question id</th>
							<th>Content</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${activityLogList}" var="activityLogEntry">
							<tr>
								<td>${activityLogEntry.time}</td>
								<td>${activityLogEntry.username}</td>
								<td>${activityLogEntry.question_id}</td>
								<td>${activityLogEntry.entryItemName}</td>
								<td>${activityLogEntry.content}</td>
							</tr>
						</c:forEach>						
					</tbody>
				</table>
				<ul class="pager pull-right">
					<li class="disabled"><a href="#">Newer</a></li>
					<li><a href="#">Older</a></li>
				</ul>
			</div>
		</div>