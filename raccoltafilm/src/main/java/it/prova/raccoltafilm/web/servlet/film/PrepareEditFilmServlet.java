package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.model.Film;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// idFilm

		String idFilmParam = request.getParameter("idFilm");

		if (!NumberUtils.isCreatable(idFilmParam)) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}

		try {

			Film filmIstance = filmService.caricaSingoloElemento(Long.parseLong(idFilmParam));

			if (filmIstance == null) {
				request.setAttribute("errorMessage", "Elemento non trovato.");
				request.getRequestDispatcher("ExecuteListFilmServlet?operationResult=NOT_FOUND").forward(request,
						response);
				return;

			}

			request.setAttribute("edit_film_attr", filmIstance);
			request.setAttribute("edit_regista_attr", registaService.listAllElements());

		} catch (Exception e) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}

		request.getRequestDispatcher("/film/edit.jsp").forward(request, response);

	}
}