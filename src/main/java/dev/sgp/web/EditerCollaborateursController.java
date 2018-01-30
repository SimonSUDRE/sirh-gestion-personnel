package dev.sgp.web;

import static dev.sgp.web.CreerCollaborateursController.collabService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;

public class EditerCollaborateursController  extends HttpServlet {
	
	/** long : serialVersionUID */
	private static final long serialVersionUID = 1L;
		
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Collaborateur collab = new Collaborateur();
			for(Collaborateur col : collabService.listerCollaborateurs()) {
				if(col.getMatricule().equals(req.getParameter("mat"))) {
					collab = col;
				}
			}
			req.setAttribute("collab", collab);
			req.getRequestDispatcher("/views/collab/editerCollaborateurs.jsp").forward(req, resp);
			
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