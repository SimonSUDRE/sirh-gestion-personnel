<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../includeHeader.jsp"%>
<title>Gestion du personnel</title>
<%@ include file="../includeNav.jsp"%>
<section>
	<article>
		<div class="container">
			<h1>Nouveau collaborateur</h1>
		</div>
		<div class="container offset-lg-2">
			<form class="needs-validation"
				action="<%=request.getContextPath()%>/collaborateurs/creer"
				method="post">
				<div class="form-row form">
					<label class="mr-sm-2 mb-0 col-lg-3" for="first_name">Nom</label> <input
						type="text" class="form-control mr-sm-2 mb-2 mb-sm-0 col-lg-6"
						id="first_name" name="first_name" required>
					<div class="invalid-feedback offset-3">Le nom est obligatoire
					</div>
				</div>
				<div class="form-row form">
					<label class="mr-sm-2 mb-0 col-lg-3" for="last_name">Prénom</label>
					<input type="text"
						class="form-control mr-sm-2 mb-2 mb-sm-0 col-lg-6" id="last_name"
						name="last_name" required>
					<div class="invalid-feedback offset-3">
					Le prénom est obligatoire</div>
				</div>
				<div class="form-row form">
					<label class="mr-sm-2 mb-0 col-lg-3" for="first_name">
					Date de naissance</label> <input type="Date"
						class="form-control mr-sm-2 mb-2 mb-sm-0 col-lg-6" id="ddn"
						name="ddn" required>
					<div class="invalid-feedback offset-3">
					La date de naissance est obligatoire</div>
				</div>
				<div class="form-row form">
					<label class="mr-sm-2 mb-0 col-lg-3" for="adresse">Adresse</label>
					<textarea class="form-control mr-sm-2 mb-2 mb-sm-0 col-lg-6"
						id="adresse" name="adresse" required></textarea>
					<div class="invalid-feedback offset-3">
					L'adresse est obligatoire</div>
				</div>
				<div class="form-row form">
					<label class="mr-sm-2 mb-0 col-lg-3" for="nss">
					Numéro de sécurité sociale</label>
					<input type="number"
						class="form-control mr-sm-2 mb-2 mb-sm-0 col-lg-6" id="nss"
						name="nss" min="100000000000000" max="999999999999999"
						title="15 chiffres" required>
					<div class="invalid-feedback offset-3">
					Le numéro de sécurité social est obligatoire</div>
				</div>
				<div class="form-row form">
					<button type="submit" id="creer" name="creer"
						class="btn btn-default mt-2 mt-sm-0 offset-8 col-lg-1">Créer</button>
				</div>
			</form>
		</div>
	</article>
</section>
<%@ include file="../includeFooter.jsp"%>