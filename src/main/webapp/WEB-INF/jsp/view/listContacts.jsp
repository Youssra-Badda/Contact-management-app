<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
   
<!DOCTYPE html>
<html>
<head>
<title>registration form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
h3 {
	margin-top: 20px;
}

#navbarNav div {
	height: 0;
}

#navbarNav form {
	margin: 0;
	padding: 0;
}

form {
	margin-bottom: 60px;
	margin-top: 10px;
	padding: 10px;
}
</style>


</head>
<body>
	<div class="container">



		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath}/showForm">Home</a></li>





					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/showForm">Add Contact
					</a></li>


					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/manageContact">Manage
							Contact </a></li>
                   
                   <li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/showGroup">Add Group </a></li>


					<li class="nav-item"><form
							action="${pageContext.request.contextPath}/searchContact"
							class="d-flex" method="POST">
							<input name="nom" class="form-control me-2" type="search"
								placeholder="Name of Contact" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form></li>


				</ul>



			</div>

		</nav>



		<div>
			<h3>List of Contact</h3>
		</div>

		<div>

			<table class="table">
				<thead>
					<tr>
						
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email Personnel</th>
						<th scope="col">Email Profesionnel</th>
						<th scope="col">tele Personnel</th>
						<th scope="col">tele Profesionnel</th>
						<th scope="col">Adresse</th>
						<th scope="col">Nom Group </th>
					</tr>
				</thead>
				<c:forEach items="${ContactList}" var="p">
					<tr>
					
						<td><c:out value="${p.prenom}" /></td>
						<td><c:out value="${p.nom}" /></td>
						<td><c:out value="${p.emailper}" /></td>
						<td><c:out value="${p.emailprof}" /></td>
						<td><c:out value="${p.teleper}" /></td>
						<td><c:out value="${p.teleprof}" /></td>
						<td><c:out value="${p.adresse}" /></td>
						<td  class="text-center">
	  						<c:if test="${p.group != null}">
	   						 <c:out value="${p.group.nom}" />
	  						</c:if>
	 						 <c:if test="${p.group == null}">aucune groupe	</c:if>
                        </td>
						
						

						<td>
							<ul>
								<li><a href="deleteContact/${p.id}">Delete</a></li>

								<li><a href="updateContactForm/${p.id}">Update</a></li>
							</ul>
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>