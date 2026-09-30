
package br.edu.ifms.portalrobotica.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.edu.ifms.portalrobotica.dao.util.Conexao;
import br.edu.ifms.portalrobotica.model.Atividade;

public class AtividadeDAO {

    public void inserir(Atividade atividade, List<Long> periodosIds)
            throws SQLException, NamingException {

        String sqlAtividade = """
                INSERT INTO atividade
                (titulo, tipo, descricao, data_inicio, data_fim, situacao, coordenador_id)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        String sqlPeriodo = """
                INSERT INTO atividade_periodo
                (atividade_id, periodo_id)
                VALUES (?, ?)
                """;

        try (Connection conexao = Conexao.getConnection()) {

            conexao.setAutoCommit(false);

            try {

                Long atividadeId;

                try (PreparedStatement statement =
                        conexao.prepareStatement(
                            sqlAtividade,
                            PreparedStatement.RETURN_GENERATED_KEYS
                        )) {

                    preencherDadosAtividade(statement, atividade);

                    statement.executeUpdate();

                    try (ResultSet resultSet =
                            statement.getGeneratedKeys()) {

                        if (resultSet.next()) {
                            atividadeId = resultSet.getLong(1);
                        } else {
                            throw new SQLException(
                                "Não foi possível obter o ID da atividade."
                            );
                        }
                    }
                }

                inserirPeriodos(conexao, sqlPeriodo, atividadeId, periodosIds);

                conexao.commit();

            } catch (SQLException | RuntimeException e) {

                conexao.rollback();
                throw e;

            } finally {

                conexao.setAutoCommit(true);
            }
        }
    }

    public void atualizar(Atividade atividade, List<Long> periodosIds)
            throws SQLException, NamingException {

        String sqlAtividade = """
                UPDATE atividade
                SET titulo = ?,
                    tipo = ?,
                    descricao = ?,
                    data_inicio = ?,
                    data_fim = ?,
                    situacao = ?,
                    coordenador_id = ?
                WHERE id = ?
                """;

        String sqlExcluirPeriodos = """
                DELETE FROM atividade_periodo
                WHERE atividade_id = ?
                """;

        String sqlInserirPeriodo = """
                INSERT INTO atividade_periodo
                (atividade_id, periodo_id)
                VALUES (?, ?)
                """;

        try (Connection conexao = Conexao.getConnection()) {

            conexao.setAutoCommit(false);

            try {

                try (PreparedStatement statement =
                        conexao.prepareStatement(sqlAtividade)) {

                    preencherDadosAtividade(statement, atividade);
                    statement.setLong(8, atividade.getId());

                    int linhasAtualizadas = statement.executeUpdate();

                    if (linhasAtualizadas == 0) {
                        throw new SQLException(
                            "Atividade não encontrada para atualização."
                        );
                    }
                }

                try (PreparedStatement statement =
                        conexao.prepareStatement(sqlExcluirPeriodos)) {

                    statement.setLong(1, atividade.getId());
                    statement.executeUpdate();
                }

                inserirPeriodos(
                    conexao,
                    sqlInserirPeriodo,
                    atividade.getId(),
                    periodosIds
                );

                conexao.commit();

            } catch (SQLException | RuntimeException e) {

                conexao.rollback();
                throw e;

            } finally {

                conexao.setAutoCommit(true);
            }
        }
    }

    public List<Long> listarPeriodosIds(Long atividadeId)
            throws SQLException, NamingException {

        String sql = """
                SELECT periodo_id
                FROM atividade_periodo
                WHERE atividade_id = ?
                """;

        List<Long> periodosIds = new ArrayList<>();

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, atividadeId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    periodosIds.add(resultSet.getLong("periodo_id"));
                }
            }
        }

        return periodosIds;
    }

    public List<Atividade> listar()
            throws SQLException, NamingException {

        String sql = """
                SELECT id,
                       titulo,
                       tipo,
                       descricao,
                       data_inicio,
                       data_fim,
                       situacao,
                       coordenador_id
                FROM atividade
                ORDER BY data_inicio DESC
                """;

        List<Atividade> atividades = new ArrayList<>();

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {
                atividades.add(criarAtividade(resultSet));
            }
        }

        return atividades;
    }

    public Atividade buscarPorId(Long id)
            throws SQLException, NamingException {

        String sql = """
                SELECT id,
                       titulo,
                       tipo,
                       descricao,
                       data_inicio,
                       data_fim,
                       situacao,
                       coordenador_id
                FROM atividade
                WHERE id = ?
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return criarAtividade(resultSet);
                }
            }
        }

        return null;
    }

    public void excluir(Long id)
            throws SQLException, NamingException {

        String sql = """
                DELETE FROM atividade
                WHERE id = ?
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, id);
            statement.executeUpdate();
        }
    }

    private void preencherDadosAtividade(
            PreparedStatement statement,
            Atividade atividade
    ) throws SQLException {

        statement.setString(1, atividade.getTitulo());
        statement.setString(2, atividade.getTipo());
        statement.setString(3, atividade.getDescricao());
        statement.setObject(4, atividade.getDataInicio());

        if (atividade.getDataFim() != null) {
            statement.setObject(5, atividade.getDataFim());
        } else {
            statement.setNull(5, Types.DATE);
        }

        statement.setString(6, atividade.getSituacao());
        statement.setLong(7, atividade.getCoordenadorId());
    }

    private void inserirPeriodos(
            Connection conexao,
            String sql,
            Long atividadeId,
            List<Long> periodosIds
    ) throws SQLException {

        if (periodosIds == null) {
            return;
        }

        try (PreparedStatement statement =
                conexao.prepareStatement(sql)) {

            for (Long periodoId : periodosIds) {

                statement.setLong(1, atividadeId);
                statement.setLong(2, periodoId);
                statement.addBatch();
            }

            statement.executeBatch();
        }
    }

    private Atividade criarAtividade(ResultSet resultSet)
            throws SQLException {

        Atividade atividade = new Atividade();

        atividade.setId(resultSet.getLong("id"));
        atividade.setTitulo(resultSet.getString("titulo"));
        atividade.setTipo(resultSet.getString("tipo"));
        atividade.setDescricao(resultSet.getString("descricao"));

        atividade.setDataInicio(
            resultSet.getObject("data_inicio", java.time.LocalDate.class)
        );

        atividade.setDataFim(
            resultSet.getObject("data_fim", java.time.LocalDate.class)
        );

        atividade.setSituacao(resultSet.getString("situacao"));
        atividade.setCoordenadorId(resultSet.getLong("coordenador_id"));

        return atividade;
    }
}