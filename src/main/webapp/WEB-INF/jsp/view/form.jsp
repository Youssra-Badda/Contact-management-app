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
			<h3>Registration Form</h3>
		</div>
		<div>
			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="addContact" method="POST" modelAttribute="ContactModel">

				<div class="row">
					
					<div class="col">
						<label>First Name</label>
						<f:input path="prenom" type="text" class="form-control"
							placeholder="First Name" />
						<f:errors path="prenom" class="text-danger" />
					</div>
						<div class="col">
						<label>Last Name</label>
						<f:input path="nom" type="text" class="form-control"
							placeholder="Last Name" />
						<f:errors path="nom" class="text-danger" />
					</div>
					
				</div>


			

				<div class="row">
					<div class="col">
						<label>Email Personnel</label>
						<f:input path="emailper" class="form-control" placeholder="Email Personnel" />
						<f:errors path="emailper" class="text-danger" />
					</div>

					<div class="col">
						<label>Email Professional : </label>
						<f:input path="emailprof" class="form-control" placeholder="Email Professional" />
						<f:errors path="emailprof" class="text-danger" />
					</div>
				</div>



				<div class="row">
					<div class="col">
						<label>Tele Personnel</label>
						<f:input path="teleper" class="form-control" placeholder="Tele Personnel" />
						<f:errors path="teleper" class="text-danger" />
					</div>

					<div class="col">
						<label>Tele Professional : </label>
						<f:input path="teleprof" class="form-control" placeholder="Tele Professional " />
						<f:errors path="teleprof" class="text-danger" />
					</div>

					
				</div>

				<div class="row">
					<div class="col">
						<label>Address</label>
						<f:input path="adresse" type="text" class="form-control"
							placeholder="...., fes,rabat" />
						<f:errors path="adresse" class="text-danger" />
					</div>
					<div class="col">
						<legend class="col-form-label col-sm-2 pt-0">Gender</legend>
						<div class="form-check">
							<f:radiobutton path="genre" class="form-check-input"
								value="Female" />
							<label class="form-check-label">Female </label>
						</div>
						<div class="form-check">
							<f:radiobutton path="genre" class="form-check-input"
								value="Male " />
							<label class="form-check-label">Male </label>
						</div>
						<f:errors path="genre" class="text-danger" />
						<%-- <form:radiobuttons path="abc" items="${xyz}"/>   --%>

					</div>

				</div>
				
				<div class="col">
		            <label for="groupes"> choose Groupe :</label>
		            <select name="group" class="form-control">
		             <option value="0">Aucun</option>
		                <c:forEach items="${GroupList}" var="group">
		                    <option value="${group.id}">${group.nom}</option>
		                </c:forEach>
		            </select>
		        </div>
				
				   
				
				<div style="text-align: right">
					<button type="submit" class="btn btn-primary">Register</button>
					<button type="reset" class="btn btn-secondary">Rest</button>
				</div>

			</f:form>
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
						<th scope="col">Adress</th>
						<th scope="col">Nom Groupe</th>
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
						
					</tr>

				</c:forEach>

			</table>
			

		</div>
	</div>
</body>
</html>