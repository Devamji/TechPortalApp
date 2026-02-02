<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--   if user loffed in as a normal use then its role will be normal in that case that user try to open admin.jsp then
    it will redirected to login page -->
	<c:if
		test="${not empty sessionScope.userobj.role and  sessionScope.userobj.role != 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


  <!-- is any user directly try to open admin.jsp then redirected to login page -->
	<c:if test="${empty sessionScope.userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<!-- navbar started -->
	<%@include file="navbar.jsp"%>
	<!-- navbar ends -->


	<!-- body starts -->


	<div class="container-fluid">

		<div class="row">

			<div class="col-md-3">
				<div class="card mycard admincard">
					<div class="card-body">
						<h3>
							<a href="addcourse.jsp" class="card-link text-light ">Add
								Course</a>
						</h3>
					</div>
				</div>

			</div>


			<div class="col-md-3">
				<div class="card mycard admincard">
					<div class="card-body">
						<h3>
							<a href="viewcourse.jsp" class="card-link text-light ">View
								Course Info</a>
						</h3>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card mycard admincard">
					<div class="card-body">
						<h3>
							<a href="addjobs.jsp" class="card-link text-light">Post Jobs</a>
						</h3>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card mycard admincard">
					<div class="card-body">
						<h3>
							<a href="viewalljobs.jsp" class="card-link text-light ">View
								Jobs</a>
						</h3>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card mycard admincard">
					<div class="card-body">
						<h3>
							<a href="jobapplicants.jsp" class="card-link text-light ">View
								Applicants</a>
						</h3>
					</div>
				</div>
			</div>

		</div>


	</div>










	<!-- 	body ends
	 -->




</body>
</html>