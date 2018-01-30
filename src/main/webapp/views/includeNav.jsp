<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
</head>
<body>
	<nav>
		<ul class="nav nav-pills border-bottom">
			<li class="nav-item">
				<a class="nav-link" href="#">
					<img src="<%= request.getContextPath() %>/img/logo.jpg" />
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="<%= request.getContextPath() %>/collaborateurs/lister">Collaborateur</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Statistiques</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Activités</a>
			</li>
		</ul>
	</nav>