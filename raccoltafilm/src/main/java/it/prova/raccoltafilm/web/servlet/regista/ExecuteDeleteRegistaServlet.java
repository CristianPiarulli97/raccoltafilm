package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.exceptions.ElementNotFoundException;
import it.prova.raccoltafilm.exceptions.RegistaAssociatoFilmsException;
import it.prova.raccoltafilm.service.RegistaService;

/**
 * Servlet implementation class ExecuteDeleteRegistaServlet
 */
@WebServlet("/admin/ExecuteDeleteRegistaServlet")
public class ExecuteDeleteRegistaServlet extends HttpServlet {
	
	private RegistaService registaService;
	
	

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idRegistaToDelete = request.getParameter("idRegista");

		if (!NumberUtils.isCreatable(idRegistaToDelete)) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}
		try {
			// novità rispetto al passato: abbiamo un overload di rimuovi che agisce per id
			// in questo modo spostiamo la logica di caricamento/rimozione nel service
			// usando la stessa finestra di transazione e non aprendo e chiudendo due volte
			// inoltre mi torna utile quando devo fare rimozioni eager
			registaService.rimuovi(Long.parseLong(idRegistaToDelete));
		} catch (ElementNotFoundException e) {
			response.sendRedirect(request.getContextPath() + "/ExecuteListRegistaServlet?operationResult=NOT_FOUND");
			return; 
		}catch (RegistaAssociatoFilmsException e) {
			response.sendRedirect(request.getContextPath() + "/ExecuteListRegistaServlet?operationResult=NOT_VALID");
			return;
		} catch (Exception e) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}

		response.sendRedirect("ExecuteListRegistaServlet?operationResult=SUCCESS");
	}
}
