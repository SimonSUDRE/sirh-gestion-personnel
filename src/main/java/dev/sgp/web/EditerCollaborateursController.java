package dev.sgp.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateursController extends HttpServlet {
	
	/** long : serialVersionUID */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] attributs = { "matricule", "titre", "nom", "prenom" };
		Map<String, String> params = new HashMap<>();
		for(String s : attributs) {
			params.put(s, req.getParameter(s));
		}
		
		resp.setContentType("text/html");
		
		if(params.containsValue("")) {
			StringBuilder sortie = new StringBuilder("");
			for(Entry<String, String> param : params.entrySet()) {
				if(param.getValue().equals("")) {
					sortie.append(param.getKey()+", ");
				}
			}
			resp.sendError(400, "Les paramètres suivants sont incorrects : "+sortie);
		}
		
		resp.getWriter().write("<h1>Création d'un collaborateur</h1>"
				+"<p>Matricule : "+req.getParameter("matricule")+"</p>"
				+"<p>Titre : "+req.getParameter("titre")+"</p>"
				+"<p>Nom : "+req.getParameter("nom")+"</p>"
				+"<p>Prénom : "+req.getParameter("prenom")+"</p>");
		
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}