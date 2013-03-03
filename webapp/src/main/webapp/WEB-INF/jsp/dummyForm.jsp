<!-- 
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
  -->
  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
	<h2>Dummy form</h2>
	<!--  -->
	<form:form method="POST" commandName="dForm" >
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
			<tr>
				<td>textbox :</td>
				<td><form:input path="textbox" /></td>
				<td><form:errors path="textbox" cssClass="error" /></td>
			</tr>
			<tr>
				<td>textarea :</td>
				<td><form:textarea path="textarea" /></td>
				<td><form:errors path="textarea" cssClass="error" /></td>
			</tr>
			<tr>
				<td>password :</td>
				<td><form:password path="password" /></td>
				<td><form:errors path="password" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Confirm Password :</td>
				<td><form:password path="confirmPassword" /></td>
				<td><form:errors path="confirmPassword" cssClass="error" /></td>
			</tr>
			<tr>
				<td>checkbox works? :</td>
				<td><form:checkbox path="checkbox" /></td>
				<td><form:errors path="checkbox" cssClass="error" /></td>
			</tr>
			<tr>
				<td>checkboxList :</td>
				<td><form:checkboxes items="${checkboxList}"
						path="checkboxList" /></td>
				<td><form:errors path="checkboxList" cssClass="error" /></td>
			</tr>
			<tr>
				<td>radioButton :</td>
				<td><form:radiobutton path="radioButton" value="A" />Aa<form:radiobutton
						path="radioButton" value="B" />Bb</td>
				<td><form:errors path="radioButton" cssClass="error" /></td>
			</tr>
			<tr>
				<td>radioButtonList :</td>
				<td><form:radiobuttons path="radioButtonList"
						items="${radioButtonList}" /></td>
				<td><form:errors path="radioButtonList" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Dropdown :</td>
				<td><form:select path="dropdown">
						<form:option value="NONE" label="--- Select ---" />
						<form:options items="${dropdownList}" />
					</form:select></td>
				<td><form:errors path="dropdown" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Select :</td>
				<td><form:select path="select" items="${select}"
						multiple="true" /></td>
				<td><form:errors path="select" cssClass="error" /></td>
			</tr>
			<form:hidden path="secretValue" />
			<tr>
				<td colspan="3"><input type="submit" /></td>
			</tr>
		</table>
		
	</form:form>

</body>
</html>