package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.AtividadeDAO;
import br.edu.ifms.portalrobotica.dao.EstudanteDAO;
import br.edu.ifms.portalrobotica.dao.ParticipacaoDAO;
import br.edu.ifms.portalrobotica.model.Participacao;

@WebServlet("/participacoes")
public class ParticipacaoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            EstudanteDAO estudanteDAO = new EstudanteDAO();
            AtividadeDAO atividadeDAO = new AtividadeDAO();

            request.setAttribute(
                "estudantes",
                estudanteDAO.listar()
            );

            request.setAttribute(
                "atividades",
                atividadeDAO.listar()
            );

            String atividadeId = request.getParameter("atividadeId");

            if (atividadeId != null && !atividadeId.isBlank()) {
                request.setAttribute(
                    "atividadeIdSelecionada",
                    Long.parseLong(atividadeId)
                );
            }

            request.getRequestDispatcher(
                "/auth/admin/participacao/participacao-form.jsp"
            ).forward(request, response);

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

            Long estudanteId = Long.parseLong(
                request.getParameter("estudanteId")
            );

            Long atividadeId = Long.parseLong(
                request.getParameter("atividadeId")
            );

            String funcao = request.getParameter("funcao");

            String descricaoContribuicao = request.getParameter(
                "descricaoContribuicao"
            );

            ParticipacaoDAO dao = new ParticipacaoDAO();

            if (dao.existe(estudanteId, atividadeId)) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/participacoes?atividadeId="
                    + atividadeId
                    + "&erro=duplicada"
                );

                return;
            }

            Participacao participacao = new Participacao();

            participacao.setEstudanteId(estudanteId);
            participacao.setAtividadeId(atividadeId);
            participacao.setFuncao(funcao);
            participacao.setDescricaoContribuicao(
                descricaoContribuicao
            );

            dao.inserir(participacao);

            response.sendRedirect(
                request.getContextPath()
                + "/atividades?acao=participantes&id="
                + atividadeId
                + "&sucesso=1"
            );

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}