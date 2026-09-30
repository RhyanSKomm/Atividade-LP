package br.edu.ifms.portalrobotica.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.edu.ifms.portalrobotica.dao.util.Conexao;
import br.edu.ifms.portalrobotica.model.PeriodoLetivo;

public class PeriodoLetivoDAO {

    public List<PeriodoLetivo> listar()
            throws NamingException, SQLException {

        List<PeriodoLetivo> periodos = new ArrayList<>();

        String sql = """
            SELECT
                id,
                ano,
                semestre
            FROM periodo_letivo
            ORDER BY ano, semestre
            """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()
        ) {

            while (rs.next()) {

                PeriodoLetivo periodo = new PeriodoLetivo();

                periodo.setId(rs.getLong("id"));
                periodo.setAno(rs.getInt("ano"));
                periodo.setSemestre(rs.getInt("semestre"));

                periodos.add(periodo);

            }

        }

        return periodos;

    }

    public List<PeriodoLetivo> listarPorAtividade(Long atividadeId)
            throws NamingException, SQLException {

        List<PeriodoLetivo> periodos = new ArrayList<>();

        String sql = """
            SELECT
                p.id,
                p.ano,
                p.semestre
            FROM periodo_letivo p
            INNER JOIN atividade_periodo ap
                ON ap.periodo_id = p.id
            WHERE ap.atividade_id = ?
            ORDER BY p.ano, p.semestre
            """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement stmt = conexao.prepareStatement(sql)
        ) {

            stmt.setLong(1, atividadeId);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    PeriodoLetivo periodo = new PeriodoLetivo();

                    periodo.setId(rs.getLong("id"));
                    periodo.setAno(rs.getInt("ano"));
                    periodo.setSemestre(rs.getInt("semestre"));

                    periodos.add(periodo);

                }

            }

        }

        return periodos;

    }

}