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
	<!-- navbar started -->
	<%@include file="navbar.jsp"%>
	<!-- navbar ends -->

	<div class="container my-2">

		<div class="row">

			<div class="col-12 col-md-6 offset-md-3">

				<!-- form started -->
				<form action="signup" method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label for="fn">First Name</label> <input type="text" name="fname"
							class="form-control" id="fn" aria-describedby="fnnn">
					</div>

					<div class="form-group">
						<label for="ln">Last Name</label> <input type="text" name="lname"
							class="form-control" id="ln" aria-describedby="lnn">
					</div>


					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" name="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">


						<c:if test="${not empty sessionScope.msg}">

							<c:if test="${sessionScope.msg=='exists'}">
								<div class="alert alert-warning" role="alert">Email
									Already Exists !!!!</div>

								<c:remove var="msg" scope="session" />
							</c:if>


						</c:if>





					</div>


					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" name="pass" class="form-control"
							id="exampleInputPassword1">
					</div>

					<div class="form-group">
						<label for="mn">Mobile No</label> <input type="number" name="mob"
							class="form-control" id="ln" aria-describedby="lnn">
					</div>

					<div class="form-group">
						<label for="pic">Choose picture</label> <input type="file"
							name="pic" class="form-control" id="ln" aria-describedby="lnn">
					</div>



					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
				<!-- form ended -->


				<!-- success or fail message for signup -->
				<c:if test="${not empty sessionScope.msg}">

					<c:if test="${sessionScope.msg=='success'}">
						<div class="alert alert-success" role="alert">Signup
							Successfully!!!!! Please login</div>
					</c:if>


					<c:if test="${sessionScope.msg=='fail'}">
						<div class="alert alert-success" role="alert">Something Went
							Wrong !!!1</div>
					</c:if>
             	<c:remove var="msg" scope="session" />
				</c:if>


			</div>


		</div>

	</div>




</body>
</html>