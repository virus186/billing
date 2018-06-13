<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/cs-skin-elastic.css">
<!-- <link rel="stylesheet" href="/assets/css/bootstrap-select.less"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/scss/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body class="bg-dark">
	<%-- <div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="/images/logo.png" alt="">
					</a>
				</div>
				<div class="login-form">
					<form:form id="loginForm" modelAttribute="login"
						action="/loginProcess" method="post">
						<h2 align="center">Login</h2>
						<div class="form-group">
							<label>Email address</label> <input type="email" name="email"
								id="email" class="form-control" placeholder="Email">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" name="password"
								id="password" class="form-control" placeholder="Password">
						</div>
						<form:button id="login" name="login"
							class="btn btn-success btn-flat m-b-30 m-t-30">Login</form:button>
						<div class="social-login-content"></div>
					</form:form>
				</div>
			</div>
		</div>
	</div> --%>
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="/images/logo.png" alt="">
					</a>
				</div>
	<div class="login-form">
						<h2 align="center">Login</h2>
	
	<form:form id="loginForm" modelAttribute="login" action="loginProcess.html" method="post">
               <div class="form-group">
							<label>Email address</label> <input type="email" name="email"
								id="email" class="form-control" placeholder="Email">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" name="password"
								id="password" class="form-control" placeholder="Password">
						</div>
                            <form:button id="login" name="login" class="btn btn-success btn-flat m-b-30 m-t-30">Login</form:button>
                       <a href="home">Home</a>
            </form:form>
            </div></div></div></div>
            <table align="center">
                <tr>
                    <td style="font-style: italic; color: red;">${message}</td>
                </tr>
            </table>

	<script	src="<%=request.getContextPath() %>/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/popper.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/plugins.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/main.js"></script>


</body>
</html>
