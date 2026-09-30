package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.portalrobotica.dao.AtividadeDAO;
import br.edu.ifms.portalrobotica.dao.CoordenadorDAO;
import br.edu.ifms.portalrobotica.dao.ParticipacaoDAO;
import br.edu.ifms.portalrobotica.dao.PeriodoLetivoDAO;
import br.edu.ifms.portalrobotica.model.Atividade;
import br.edu.ifms.portalrobotica.model.Coordenador;
import br.edu.ifms.portalrobotica.model.Participacao;
import br.edu.ifms.portalrobotica.model.PeriodoLetivo;

@WebServlet("/public/atividade")
public class PublicAtividadeDetalheServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParametro = request.getParameter("id");

            Long atividadeId = Long.parseLong(idParametro);

            AtividadeDAO atividadeDAO = new AtividadeDAO();

            Atividade atividade =
                atividadeDAO.buscarPorId(atividadeId);

            if (atividade == null) {

                response.sendError(
                    HttpServletResponse.SC_NOT_FOUND
                );

                return;

            }

            ParticipacaoDAO participacaoDAO =
                new ParticipacaoDAO();

            PeriodoLetivoDAO periodoDAO =
                new PeriodoLetivoDAO();

            CoordenadorDAO coordenadorDAO =
                new CoordenadorDAO();

            List<Participacao> participacoes =
                participacaoDAO.listarPorAtividade(
                    atividadeId
                );

            List<PeriodoLetivo> periodos =
                periodoDAO.listarPorAtividade(
                    atividadeId
                );

            Coordenador coordenador = null;

            if (atividade.getCoordenadorId() != null) {

                coordenador =
                    coordenadorDAO.buscarPorId(
                        atividade.getCoordenadorId()
                    );

            }

            request.setAttribute(
                "atividade",
                atividade
            );

            request.setAttribute(
                "participacoes",
                participacoes
            );

            request.setAttribute(
                "periodos",
                periodos
            );

            request.setAttribute(
                "coordenador",
                coordenador
            );

            request
                .getRequestDispatcher(
                    "/public/public-atividade-detalhes.jsp"
                )
                .forward(
                    request,
                    response
                );

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST
            );

        } catch (Exception e) {

            throw new ServletException(e);

        }

    }

}