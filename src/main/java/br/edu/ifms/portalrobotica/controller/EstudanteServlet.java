
package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.EstudanteDAO;
import br.edu.ifms.portalrobotica.model.Estudante;

@WebServlet("/estudantes")
public class EstudanteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try {

            if ("novo".equals(acao)) {

                request.getRequestDispatcher(
                    "/auth/admin/estudante/estudante-form.jsp"
                ).forward(request, response);

            } else if ("editar".equals(acao)) {

                Long id = Long.parseLong(
                    request.getParameter("id")
                );

                EstudanteDAO dao = new EstudanteDAO();

                Estudante estudante = dao.buscarPorId(id);

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

                request.getRequestDispatcher(
                    "/auth/admin/estudante/estudante-form.jsp"
                ).forward(request, response);

            } else if ("excluir".equals(acao)) {

                Long id = Long.parseLong(
                    request.getParameter("id")
                );

                EstudanteDAO dao = new EstudanteDAO();

                dao.excluir(id);

                response.sendRedirect(
                    request.getContextPath() + "/estudantes"
                );

            } else {

                EstudanteDAO dao = new EstudanteDAO();

                request.setAttribute(
                    "estudantes",
                    dao.listar()
                );

                request.getRequestDispatcher(
                    "/auth/admin/estudante/estudante-listar.jsp"
                ).forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String idTexto = request.getParameter("id");
            String nome = request.getParameter("nome");
            String minibio = request.getParameter("minibio");
            String foto = request.getParameter("foto");

            Estudante estudante = new Estudante();

            estudante.setNome(nome);
            estudante.setMinibio(minibio);
            estudante.setFoto(foto);

            EstudanteDAO dao = new EstudanteDAO();

            if (idTexto != null && !idTexto.isBlank()) {

                estudante.setId(
                    Long.parseLong(idTexto)
                );

                dao.atualizar(estudante);

            } else {

                dao.inserir(estudante);
            }

            response.sendRedirect(
                request.getContextPath() + "/estudantes"
            );

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}