package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Film;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.utility.UtilityForm;

/**
 * Servlet implementation class ExecuteEditFilmServlet
 */
@WebServlet("/ExecuteEditFilmServlet")
public class ExecuteEditFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titoloParam = request.getParameter("titolo"); 
		String genereParam = request.getParameter("genere"); 
		String dataPubblicazioneParam = request.getParameter("dataPubblicazione"); 
		String minutiDurataParam = request.getParameter("minutiDurata");
		String filmParam = request.getParameter("regista.id");
		String idParam = request.getParameter("idFilm");

		Film filmTemp = UtilityForm.createFilmFromParams(titoloParam, genereParam, minutiDurataParam, dataPubblicazioneParam, filmParam);
		filmTemp.setId(Long.parseLong(idParam));

		if (!UtilityForm.validateFilmBean(filmTemp)){
			request.setAttribute("edit_film_attr", filmTemp);
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di inserimento");
			request.getRequestDispatcher("/film/edit.jsp").forward(request, response);
			return;
		}
		
		try {
			
			MyServiceFactory.getFilmServiceInstance().aggiorna(filmTemp);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/film/insert.jsp").forward(request, response);
			return;
		}

		// andiamo ai risultati
		// uso il sendRedirect con parametro per evitare il problema del double save on
		// refresh
		response.sendRedirect("ExecuteListFilmServlet?operationResult=SUCCESS");
	}
}
