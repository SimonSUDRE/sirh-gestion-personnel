<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../includeHeader.jsp" %>
	<title>Gestion du personnel</title>
	<script>
		function valider(){
			document.forms[0].submit();
		}
	</script>
<%@ include file="../includeNav.jsp" %>
	<section>
		<article>
			<div class="container">
				<a href="<%= request.getContextPath() %>/collaborateurs/creer" class="btn btn-primary btn-default mt-2 mt-sm-0 col-sm-12 col-md-5 col-lg-4 offset-lg-9 offset-md-9">Ajouter un nouveau collaborateur</a>
			</div>
		</article>
		<article>
			<div class="container">
				<h1>Les collaborateurs</h1>
			</div>
		</article>
		<article>
			<div class="container taille">
				<form action="<%= request.getContextPath() %>/collaborateurs/lister" method="post" class="form-inline">
					<label class="mr-sm-2 mb-0">Rechercher un nom ou un prénom qui commence par :</label>
					<div class="done col-lg-1 col-md-3"></div>
					<input type="text" class="form-control mr-sm-2 mb-2 mb-sm-0  col-lg-2 col-md-12 col-sm-12" name="name" id="name">
					<button type="button" class="btn btn-primary btn-default mt-2 mt-sm-0 col-lg-2 col-md-6" onclick="valider()">Rechercher</button>
					<div class="col-lg-4 col-md-6">
						<input name="desac" type="checkbox" class="form-check-input">Voir les collaborateurs désactivés
					</div>
					<div class="col-lg-12"><br></div>
					<label class="mr-sm-2 mb-0">Filtrer par département : </label>
					<select name="depart" class="custom-select col-lg-3 offset-lg-2">
						<option selected value="4" >Tous</option>
						<option value="1" >Comptabilité</option>
						<option value="2" >Ressources Humaines</option>
						<option value="3" >Informatique</option>
					</select>
				</form>
			</div>
		</article>
		<div class="col-lg-12"><br></div>
		<article>
			<div class="taillecollab container">
				<div class="row">
				<% 
				List<Collaborateur> collabs = (List<Collaborateur>) request.getAttribute("listeCollab");
				for(Collaborateur collab : collabs) {
				%>
					<div class="collab col-md-6 col-lg-6 col-sm-12">
						<div class="card">
							<h3 class="card-header"><%= collab.getNom() %> <%= collab.getPrenom() %></h3>
							<div class="card-body row">
								<div class="card-text">
									<img src="<%= request.getContextPath() %><%= collab.getPhoto() %>" class="img-thumbnail col-lg-4 col-md-2 col-sm-2" />
									<div class="col-lg-10 col-md-10 col-sm-8 row">
										<span class="col-lg-6 col-md-6 col-sm-6">Fonction : </span>
										<span class="col-lg-6 col-md-6 col-sm-6"><%= collab.getIntitulePoste() %></span>
										<span class="col-lg-6 col-md-6 col-sm-6">Département : </span>
										<span class="col-lg-6 col-md-6 col-sm-6"><%= collab.getDepartement().getNom() %></span>
										<span class="col-lg-6 col-md-6 col-sm-6">Email : </span>
										<span class="col-lg-6 col-md-6 col-sm-6"><%= collab.getEmailPro() %></span>
										<span class="col-lg-6 col-md-6 col-sm-6">Téléphone : </span>
										<span class="col-lg-6 col-md-6 col-sm-6"><%= collab.getTelephone() %></span>
									</div>
								</div>
								<div class="col-lg-12 col-sm-12 col-md-12"><br></div>
								<form method="post" action="<%= request.getContextPath() %>/collaborateurs/editer">
									<input type="hidden" name="mat" value="<%= collab.getMatricule() %>">
									<button name="editer" type="submit" class="btn btn-primary col-lg-2 col-md-3 col-sm-2 offset-lg-9 offset-md-8 offset-sm-9">Editer</button>
								</form>
							</div>
						</div>
					</div>
				<%
				}
				%>
				</div>
			</div>
		</article>
	</section>
<%@ include file="../includeFooter.jsp" %>