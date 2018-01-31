package dev.sgp.web;

import static dev.sgp.web.ListerCollaborateursController.collabService;
import static dev.sgp.web.ListerCollaborateursController.departService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;

public class EditerCollaborateursController  extends HttpServlet {
	
	/** long : serialVersionUID */
	private static final long serialVersionUID = 1L;
		
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			if(req.getParameter("save") != null) {
				for(Collaborateur col : collabService.listerCollaborateurs()) {
					if(col.getMatricule().equals(req.getParameter("mat"))) {
						col.setActif(req.getParameter("actif") == null);
						col.setAdresse(req.getParameter("adresse"));
						col.setIntitulePoste(req.getParameter("poste"));
						col.setTelephone(req.getParameter("tel"));
						for(Departement d : departService.listerDepartements()) {
							if(d.getId() == Integer.parseInt(req.getParameter("depart"))) {
								col.setDepartement(d);
							}
						}
						col.setBic(req.getParameter("bic"));
						col.setIban(req.getParameter("iban"));
						break;
					}
				}
				req.setAttribute("listeCollab", collabService.listerCollaborateurs());
			}			
			else {
				Collaborateur collab = new Collaborateur();
				for(Collaborateur col : collabService.listerCollaborateurs()) {
					if(col.getMatricule().equals(req.getParameter("mat"))) {
						collab = col;
						break;
					}
				}
				req.setAttribute("collab", collab);
				req.getRequestDispatcher("/views/collab/editerCollaborateurs.jsp").forward(req, resp);
			}
			
		} catch(ServletException | IOException e) {
			e.getMessage();
		}
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			doGet(req, resp);
		} catch(ServletException | IOException e) {
			e.getMessage();
		}
	}
}