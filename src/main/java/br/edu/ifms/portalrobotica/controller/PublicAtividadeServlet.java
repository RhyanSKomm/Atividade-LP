package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.AtividadeDAO;

@WebServlet("/public/atividades")
public class PublicAtividadeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            AtividadeDAO atividadeDAO = new AtividadeDAO();

            request.setAttribute(
                "atividades",
                atividadeDAO.listar()
            );

            request.getRequestDispatcher(
                "/public/public-atividades.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}