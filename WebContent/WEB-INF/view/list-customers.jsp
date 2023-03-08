<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>

<html>
<head>

<title>List of the customers!</title>

<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
</link>

</head>


<body>

	<div id="wrapper">

		<div id="header">
			<h2>CRM - Customer RelationSHip Manager</h2>

		</div>
	</div>

	<div id="container">
		<div id="content">
			<!-- put new button add customer  -->

			<input type="button" value="Add Customer"
				onclick="window.location.href = 'showFormForAdd'; return false;"
				class="add-button" />

			<!--  add a search box -->
			<form:form action="search" method="GET">
                Search customer: <input type="text" name="theSearchName" />

				<input type="submit" value="Search" class="add-button" />
			</form:form>


			<%@ page import="com.yes2code.springdemo.util.SortUtils"%>
			<!-- construct a sort link for first name -->
			<c:url var="sortLinkFirstName" value="/customer/list">
				<c:param name="sort"
					value="<%=Integer.toString(SortUtils.FIRST_NAME)%>" />
			</c:url>

			<!-- construct a sort link for last name -->
			<c:url var="sortLinkLastName" value="/customer/list">
				<c:param name="sort"
					value="<%=Integer.toString(SortUtils.LAST_NAME)%>" />
			</c:url>

			<!-- construct a sort link for email -->
			<c:url var="sortLinkEmail" value="/customer/list">
				<c:param name="sort"
					value="<%=Integer.toString(SortUtils.EMAIL)%>" />
			</c:url>

			<table>
				<tr>
					<th><a href="${sortLinkFirstName}">First Name</a></th>
					<th><a href="${sortLinkLastName}">Last Name</a></th>
					<th><a href="${sortLinkEmail}">Email</a></th>
					<th>Action</th>
				</tr>

				<c:forEach var="tempCustomer" items="${customers}">

					<!-- construct the update link in customer -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>

					<!-- construct the delete link in customer -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>



					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>

						<td>
							<!-- Display the update link --> <a href="${updateLink }">Update</a>
							| <a href="${deleteLink }"
							onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">
								Delete</a>
						</td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>


</body>

</html>