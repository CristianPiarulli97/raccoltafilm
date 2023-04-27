package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.service.FilmService;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RegistaService;

/**
 * Servlet implementation class PrepareEditFilmServlet
 */
@WebServlet("/PrepareEditFilmServlet")
public class PrepareEditFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private FilmService filmService;
	
	private RegistaService registaService;

	public PrepareEditFilmServlet() {
		this.filmService = MyServiceFactory.getFilmServiceInstance();
		this.registaService = MyServiceFactory.getRegistaServiceInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idFilmParam = request.getParameter("idFilm");
		if (!NumberUtils.isCreatable(idFilmParam)) {
			request.setAttribute("errorMessage","Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
		}
		Long idFilm = Long.parseLong(idFilmParam);
		
		try {
			request.setAttribute("edit_film_attr", filmService.caricaSingoloElemento(idFilm));
			request.setAttribute("registi_list_attribute", registaService.listAllElements() );
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage","Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/film/edit.jsp").forward(request, response);
		
	}
}