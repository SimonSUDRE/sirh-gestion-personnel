<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includeHeader.jsp" %>
	<title>Gestion du personnel</title>
<%@ include file="../includeNav.jsp" %>
	<section>
		<article>
			<div class="container">
				<a href="nouveauCollaborateur.html" class="btn btn-primary btn-default mt-2 mt-sm-0 col-sm-12 col-md-5 col-lg-4 offset-lg-9 offset-md-9">Ajouter un nouveau collaborateur</a>
			</div>
		</article>
		<article>
			<div class="container">
				<h1>Les collaborateurs</h1>
			</div>
		</article>
		<article>
			<div class="container taille">
				<form action="#" class="form-inline">
					<label class="mr-sm-2 mb-0">Rechercher un nom ou un prénom qui commence par :</label>
					<div class="done col-lg-1 col-md-3"></div>
					<input type="text" class="form-control mr-sm-2 mb-2 mb-sm-0  col-lg-2 col-md-12 col-sm-12" id="first_name">
					<button type="button" class="btn btn-primary btn-default mt-2 mt-sm-0 col-lg-2 col-md-6">Rechercher</button>
					<div class="col-lg-4 col-md-6">
						<input type="checkbox" class="form-check-input">Voir les collaborateurs désactivés
					</div>
					<div class="col-lg-12"><br></div>
					<label class="mr-sm-2 mb-0">Filtrer par département : </label>
					<select class="custom-select col-lg-3 offset-lg-2">
						<option selected value="all">Tous</option>
						<option value="compta">Comptabilité</option>
						<option value="rh">Ressources Humaines</option>
						<option value="info">Informatique</option>
					</select>
				</form>
			</div>
		</article>
		<div class="col-lg-12"><br></div>
		<article>
			<div class="taillecollab container">
				<div class="row">
				<c:forEach items="request.getAttribute('listeCollab')" var="item">
					<div class="collab col-md-6 col-lg-6 col-sm-12">
						<div class="card">
							<h3 class="card-header">${item.nom} ${item.prenom}</h3>
							<div class="card-body row">
								<div class="card-text">
									<img src="<%= request.getContextPath() %>/img/${item.photo}.jpg" class="img-thumbnail col-lg-4 col-md-2 col-sm-2" />
									<div class="col-lg-10 col-md-10 col-sm-8 row">
										<span class="col-lg-6 col-md-6 col-sm-6">Fonction : </span>
										<span class="col-lg-6 col-md-6 col-sm-6">XXXXXXXXXXXX</span>
										<span class="col-lg-6 col-md-6 col-sm-6">Département : </span>
										<span class="col-lg-6 col-md-6 col-sm-6">Informatique</span>
										<span class="col-lg-6 col-md-6 col-sm-6">Email : </span>
										<span class="col-lg-6 col-md-6 col-sm-6">XXXX@XXXX.XX</span>
										<span class="col-lg-6 col-md-6 col-sm-6">Téléphone : </span>
										<span class="col-lg-6 col-md-6 col-sm-6">0000000000</span>
									</div>
								</div>
								<div class="col-lg-12 col-sm-12 col-md-12"><br></div>
								<button type="button" class="btn btn-primary col-lg-2 col-md-3 col-sm-2 offset-lg-9 offset-md-8 offset-sm-9">Editer</button>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</article>
	</section>
<%@ include file="../includeFooter.jsp" %>