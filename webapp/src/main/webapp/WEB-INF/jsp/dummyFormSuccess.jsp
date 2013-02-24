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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
<body>
	<h2>Dummy form submission Success!</h2>
 
	<table>
		<tr>
			<td>textbox :</td>
			<td>${dForm.textbox}</td>
		</tr>
		<tr>
			<td>textarea :</td>
			<td>${dForm.textarea}</td>
		</tr>
		<tr>
			<td>Password :</td>
			<td>${dForm.password}</td>
		</tr>
		<tr>
			<td>Confirm Password :</td>
			<td>${dForm.confirmPassword}</td>
		</tr>
		<tr>
			<td>checkbox work? :</td>
			<td>${dForm.checkbox}</td>
		</tr>
		<tr>
			<td>checkboxList :</td>
			<td><c:forEach items="${dForm.checkboxList}" var="current">
				   [<c:out value="${current}" />]
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>Radio Button :</td>
			<td>${dForm.radioButton}</td>
		</tr>
		<tr>
			<td>radioButtonList :</td>
			<td>${dForm.radioButtonList}</td>
		</tr>
		
		<td>Select :</td>
		<td>${dForm.select}</td>
		</tr>
		<tr>
			<td>Hidden Value :</td>
			<td>${dForm.secretValue}</td>
		</tr>
	</table>
 
</body>
</html>