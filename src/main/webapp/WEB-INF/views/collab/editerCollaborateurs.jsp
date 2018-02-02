<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../includeHeader.jsp" %>
	<title>Gestion du personnel</title>
<%@ include file="../includeNav.jsp" %>
    <div class="container">
    <% 
    	Collaborateur collab = (Collaborateur) request.getAttribute("collab");
    %>
        <div class="row">
            <div class="col-12 offset-lg-4">
                <h1><%= collab.getNom() %> <%= collab.getPrenom() %> - <%= collab.getMatricule() %></h1>
            </div>
            <div class="col">
                <div class="float-right">
                    <div class="col-md-3">
                    <% if(collab.getActif()) { %>
                        <input name="actif" class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                    <%} else { %>
                    	<input name="actif" class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked>
                    <%} %>
                        <label class="form-check-label" for="defaultCheck1">
                            Désactiver
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4">
                <img src="<%= request.getContextPath() %><%= collab.getPhoto() %>" alt="profilPic" class="img-thumbnail rounded mx-auto d-block">
            </div>
            <div class="col-md-8  col-12">
                <div id="accordion">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Identité
                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <form class="needs-validation" novalidate>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Civilité</label>
                                        <div class="col-sm-12 col-md-7">
                                            <select class="custom-select">
                                                <option value="1" selected>Monsieur</option>
                                                <option value="2">Madame</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Nom</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input value="<%= collab.getNom() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" readonly>
                                            <div class="invalid-feedback">
                                                Le nom est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Prénom</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input value="<%= collab.getPrenom() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" readonly placeholder="">
                                            <div class="invalid-feedback">
                                                Le prénom est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Date de naissance</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input value="<%= collab.getDateDeNaissance().toString() %>" type="date" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" readonly>
                                            <div class="invalid-feedback">
                                                Le date de naissance est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Adresse</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input name="adresse" value="<%= collab.getAdresse() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" required>
                                            <div class="invalid-feedback">
                                                L'adresse est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Numéro de sécurité sociale</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input value="<%= collab.getNumeroDeSecuriteSociale() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" readonly>
                                            <div class="invalid-feedback">
                                                Le numéro de sécurité sociale est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Numéro de téléphone</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input name="tel" value="<%= collab.getTelephone() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="">
                                            <div class="invalid-feedback">
                                                Le numéro de téléphone est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Poste
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <div class="needs-validation" novalidate>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Département</label>
                                        <div class="col-sm-12 col-md-7">
                                            <select name="depart" class="custom-select" required>
                                            	<% switch(collab.getDepartement().getId()) {
													 case 1 : %>
		                                                <option value="Comptabilité" selected>Comptabilité</option>
		                                                <option value="Informatique">Informatique</option>
		                                                <option value="Resources Humaines">Resources Humaines</option>
	                                                	<% break; 
	                                                case 2 : %>
		                                                <option value="Comptabilité" >Comptabilité</option>
		                                                <option value="Informatique" selected>Informatique</option>
		                                                <option value="Resources Humaines">Resources Humaines</option>
	                                                	<% break; 
	                                                case 3 : %>
		                                                <option value="Comptabilité" >Comptabilité</option>
		                                                <option value="Informatique" >Informatique</option>
		                                                <option value="Resources Humaines" selected>Resources Humaines</option>
	                                                	<% break; 
	                                                default : %>
		                                                <option value="Comptabilité">Comptabilité</option>
		                                                <option value="Informatique">Informatique</option>
		                                                <option value="Resources Humaines">Resources Humaines</option>
		                                                <% break; 
												} %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">Nom</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input name="poste" value="<%= collab.getIntitulePoste() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" required>
                                            <div class="invalid-feedback">
                                                Le nom du poste est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Coordonnées Bancaires
                                </button>
                            </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                <div class="needs-validation" novalidate>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">IBAN</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input name="iban" value="<%= collab.getIban() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" required>
                                            <div class="invalid-feedback">
                                                L'IBAN est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelLg" class="col-md-5 col-sm-12 col-form-label col-form-label-lg">BIC</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input name="bic" value="<%= collab.getBic() %>" type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="" required>
                                            <div class="invalid-feedback">
                                                Le BIC est obligatoire.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
                <div>
	                <form method="post" action="<%= request.getContextPath() %>/collaborateurs/editer">
	    				<input type="hidden" name="mat" value="<%= collab.getMatricule() %>">
	                    <input class="btn btn-dark float-right" type="submit" name="save" value="sauvegarder">
	                </form>
                </div>
            </div>
        </div>
  </div>
   
<%@ include file="../includeFooter.jsp" %>