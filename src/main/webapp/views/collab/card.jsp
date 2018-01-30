				<%
					boolean desac = false;
					if(collab.getDepartement().getId().equals(request.getParameter("depart"))) {
						if(!request.getParameter("name").equals("")) {
							if(collab.getNom().startsWith(request.getParameter("name")) || collab.getPrenom().startsWith(request.getParameter("name"))) {
								if(request.getParameter("desac") == null && collab.getActif()) {
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
								<button type="button" class="btn btn-primary col-lg-2 col-md-3 col-sm-2 offset-lg-9 offset-md-8 offset-sm-9">Editer</button>
							</div>
						</div>
					</div>
				<%
								}
								else {
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
								<button type="button" class="btn btn-primary col-lg-2 col-md-3 col-sm-2 offset-lg-9 offset-md-8 offset-sm-9">Editer</button>
							</div>
						</div>
					</div>
				<%
								}
							}
						}
						else if(request.getParameter("desac") == null && collab.getActif()) {}
				%>