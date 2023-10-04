<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<title>Add Group</title>
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
							action="${pageContext.request.contextPath}/searchGroup"
							class="d-flex" method="POST">
							<input name="ids" class="form-control me-2" type="search"
								placeholder="Name of Groupe" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form></li>



				</ul>

    

			</div>


		</nav>
		 <div>
			<h3>Add Group</h3>
		</div>
		<div>
			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>
			
			<f:form action="addGroup" method="POST" modelAttribute="GroupeModel">

				
					<div class="col">
						<label>Group Name</label>
						<f:input path="nom" type="text" class="form-control"
							placeholder="Group Name" />
						<f:errors path="nom" class="text-danger" />
					</div>
						
					
				
		 
		        <div style="text-align: right">
					<button type="submit" class="btn btn-primary">Register</button>
					
				</div>

			</f:form>
		</div>
		<div>

			<table class="table">
				<thead>
					<tr>
						
						<th scope="col">Group Name</th>
						
					    <th scope="col">Action</th>
						
					</tr>
				</thead>
				<c:forEach items="${GroupList}" var="g">
					<tr>
						<td><c:out value="${g.nom}" /></td>
						
						<td>
							<ul>
								<li><a href="deleteGroup/${g.id}">Delete</a></li>
							</ul>
						</td>
					</tr>

				</c:forEach>

			</table>
		</div>
		
		
		
		
     </div>
</body>
</html>