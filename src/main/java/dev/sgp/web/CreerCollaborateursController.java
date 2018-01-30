package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.utils.Constantes;

public class CreerCollaborateursController extends HttpServlet {
	
	/** long : serialVersionUID */
	private static final long serialVersionUID = 1L;
	
	private static int id = 1;
	
	private static ResourceBundle props = ResourceBundle.getBundle("application");
	
	public static CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	
	private static DepartementService departService = Constantes.DEPART_SERVICE;
	
	private static void compte() {
		id++;
	}
		
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			if(req.getParameter("creer") != null) {		
					Collaborateur collab = new Collaborateur();
					collab.setActif(true);
					collab.setAdresse(req.getParameter("adresse"));
					collab.setDateDeNaissance(LocalDate.parse(req.getParameter("ddn")));
					collab.setDateHeureCreation(ZonedDateTime.now());
					collab.setEmailPro(req.getParameter("first_name")+"."+req.getParameter("last_name")+props.getString("param.email.suffix"));
					collab.setNom(req.getParameter("first_name"));
					collab.setNumeroDeSecuriteSociale(req.getParameter("nss"));
					collab.setPhoto("/img/napolitaine.jpg");
					collab.setPrenom(req.getParameter("last_name"));
					collab.setIntitulePoste("Aucun");
					collab.setMatricule("M0"+id);
					collab.setTelephone("0606060606");
					collab.setDepartement(departService.listerDepartements().get(3));
					collab.setBanque("Aucun");
					collab.setBic("00000000000000");
					collab.setIban("0000000000000");
					compte();
					collabService.sauvegarderCollaborateur(collab);
					req.setAttribute("listeCollab", collabService.listerCollaborateurs());
					req.getRequestDispatcher("/views/collab/listerCollaborateurs.jsp").forward(req, resp);
			}
			else {
				req.getRequestDispatcher("/views/collab/creerCollaborateurs.jsp").forward(req, resp);
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