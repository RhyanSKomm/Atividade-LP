
package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.AtividadeDAO;
import br.edu.ifms.portalrobotica.dao.CoordenadorDAO;
import br.edu.ifms.portalrobotica.dao.EstudanteDAO;
import br.edu.ifms.portalrobotica.dao.ParticipacaoDAO;
import br.edu.ifms.portalrobotica.dao.PeriodoLetivoDAO;
import br.edu.ifms.portalrobotica.model.Atividade;

@WebServlet("/atividades")
public class AtividadeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try {

            if ("novo".equals(acao)) {

                carregarDadosFormulario(request);

                request.getRequestDispatcher(
                    "/auth/admin/atividade/atividade-form.jsp"
                ).forward(request, response);

            } else if ("editar".equals(acao)) {

                Long id = Long.parseLong(
                    request.getParameter("id")
                );

                AtividadeDAO atividadeDAO = new AtividadeDAO();

                Atividade atividade = atividadeDAO.buscarPorId(id);

                if (atividade == null) {
                    response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Atividade não encontrada."
                    );
                    return;
                }

                request.setAttribute(
                    "atividade",
                    atividade
                );

                request.setAttribute(
                    "periodosSelecionados",
                    atividadeDAO.listarPeriodosIds(id)
                );

                carregarDadosFormulario(request);

                request.getRequestDispatcher(
                    "/auth/admin/atividade/atividade-form.jsp"
                ).forward(request, response);

            } else if ("excluir".equals(acao)) {

                Long id = Long.parseLong(
                    request.getParameter("id")
                );

                AtividadeDAO atividadeDAO = new AtividadeDAO();

                atividadeDAO.excluir(id);

                response.sendRedirect(
                    request.getContextPath() + "/atividades"
                );

            } else if ("participantes".equals(acao)) {

                Long id = Long.parseLong(
                    request.getParameter("id")
                );

                AtividadeDAO atividadeDAO = new AtividadeDAO();
                EstudanteDAO estudanteDAO = new EstudanteDAO();
                ParticipacaoDAO participacaoDAO = new ParticipacaoDAO();

                Atividade atividade = atividadeDAO.buscarPorId(id);

                if (atividade == null) {
                    response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Atividade não encontrada."
                    );
                    return;
                }

                request.setAttribute(
                    "atividade",
                    atividade
                );

                request.setAttribute(
                    "atividadeId",
                    id
                );

                request.setAttribute(
                    "estudantes",
                    estudanteDAO.listar()
                );

                request.setAttribute(
                    "participacoes",
                    participacaoDAO.listarPorAtividade(id)
                );

                request.getRequestDispatcher(
                    "/auth/admin/atividade/atividade-participantes.jsp"
                ).forward(request, response);

            } else {

                AtividadeDAO atividadeDAO = new AtividadeDAO();

                request.setAttribute(
                    "atividades",
                    atividadeDAO.listar()
                );

                request.getRequestDispatcher(
                    "/auth/admin/atividade/atividade-listar.jsp"
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
            String titulo = request.getParameter("titulo");
            String tipo = request.getParameter("tipo");
            String descricao = request.getParameter("descricao");
            String dataInicioTexto = request.getParameter("dataInicio");
            String dataFimTexto = request.getParameter("dataFim");
            String situacao = request.getParameter("situacao");
            String coordenadorIdTexto = request.getParameter("coordenadorId");
            String[] periodosSelecionados =
                    request.getParameterValues("periodos");

            Atividade atividade = new Atividade();

            atividade.setTitulo(titulo);
            atividade.setTipo(tipo);
            atividade.setDescricao(descricao);
            atividade.setDataInicio(LocalDate.parse(dataInicioTexto));

            if (dataFimTexto != null && !dataFimTexto.isBlank()) {
                atividade.setDataFim(LocalDate.parse(dataFimTexto));
            } else {
                atividade.setDataFim(null);
            }

            atividade.setSituacao(situacao);

            atividade.setCoordenadorId(
                Long.parseLong(coordenadorIdTexto)
            );

            List<Long> periodosIds = new ArrayList<>();

            if (periodosSelecionados != null) {
                for (String periodoId : periodosSelecionados) {
                    periodosIds.add(Long.parseLong(periodoId));
                }
            }

            AtividadeDAO atividadeDAO = new AtividadeDAO();

            if (idTexto != null && !idTexto.isBlank()) {

                atividade.setId(Long.parseLong(idTexto));

                atividadeDAO.atualizar(
                    atividade,
                    periodosIds
                );

            } else {

                atividadeDAO.inserir(
                    atividade,
                    periodosIds
                );
            }

            response.sendRedirect(
                request.getContextPath() + "/atividades"
            );

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void carregarDadosFormulario(HttpServletRequest request)
            throws Exception {

        CoordenadorDAO coordenadorDAO = new CoordenadorDAO();
        PeriodoLetivoDAO periodoDAO = new PeriodoLetivoDAO();

        request.setAttribute(
            "coordenadores",
            coordenadorDAO.listar()
        );

        request.setAttribute(
            "periodos",
            periodoDAO.listar()
        );
    }
}