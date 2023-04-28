package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.service.RegistaService;

@WebServlet("/admin/PrepareDeleteRegistaServlet")
public class PrepareDeleteRegistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RegistaService registaService;

	public PrepareDeleteRegistaServlet() {
		this.registaService = MyServiceFactory.getRegistaServiceInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idRegistaParam = request.getParameter("idRegista");

		if (!NumberUtils.isCreatable(idRegistaParam)) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}

		try {
			Regista registaInstance = registaService.caricaSingoloElementoConFilms(Long.parseLong(idRegistaParam));

			if (registaInstance == null) {
				// qui serve il percorso assoluto in quanto siamo in un sottopercorso /admin/
				response.sendRedirect(
						request.getContextPath() + "/ExecuteListRegistaServlet?operationResult=NOT_FOUND");
				return;
			}

			request.setAttribute("delete_regista_attr", registaInstance);
		} catch (Exception e) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/home?operationResult=ERROR");
			return;
		}

		request.getRequestDispatcher("/regista/delete.jsp").forward(request, response);
	}

}
