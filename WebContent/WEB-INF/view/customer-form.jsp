<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE>

<html>
<head>
<title>This is the Add Page!!</title>
<link href="../resources/css/add-customer-style.css" rel="stylesheet"
	type="text/css">
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">

</head>


<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Customer</h3>

		<form:form action="saveCustomer" modelAttribute="customer"
			method="POST">


			<table>
				<tbody>
					<tr>
						<td><label>First Name</label></td>
						<td><form:input path="firstName" /></td>
					</tr>

					<tr>
						<td><label>Last Name</label></td>
						<td><form:input path="lastName" /></td>
					</tr>

					<tr>
						<td><label>Email</label></td>
						<td><form:input path="email" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				</tbody>
			</table>

		</form:form>
		
		<div style = "clear; both;"></div>
		
		<p>
		<a href = "../customer/list">Back to list</a>
		</p>
	</div>



</body>
</html>