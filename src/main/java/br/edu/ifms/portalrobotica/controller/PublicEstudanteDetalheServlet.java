package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.EstudanteDAO;
import br.edu.ifms.portalrobotica.dao.ParticipacaoDAO;
import br.edu.ifms.portalrobotica.model.Estudante;

@WebServlet("/public/estudante")
public class PublicEstudanteDetalheServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Long id = Long.parseLong(
                request.getParameter("id")
            );

            EstudanteDAO estudanteDAO =
                    new EstudanteDAO();

            ParticipacaoDAO participacaoDAO =
                    new ParticipacaoDAO();

            Estudante estudante =
                    estudanteDAO.buscarPorId(id);

            if (estudante == null) {

                response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Estudante não encontrado."
                );

                return;
            }

            request.setAttribute(
                "estudante",
                estudante
            );

            request.setAttribute(
                "participacoes",
                participacaoDAO.listarPorEstudante(id)
            );

            request.getRequestDispatcher(
                "/public/public-estudante-detalhes.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "ID do estudante inválido."
            );

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }
}