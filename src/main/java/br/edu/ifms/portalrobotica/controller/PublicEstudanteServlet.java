package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.EstudanteDAO;

@WebServlet("/public/estudantes")
public class PublicEstudanteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            EstudanteDAO estudanteDAO =
                    new EstudanteDAO();

            request.setAttribute(
                "estudantes",
                estudanteDAO.listar()
            );

            request.getRequestDispatcher(
                "/public/public-estudantes.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}