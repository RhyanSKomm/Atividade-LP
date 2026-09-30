package br.edu.ifms.portalrobotica.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.edu.ifms.portalrobotica.dao.util.Conexao;
import br.edu.ifms.portalrobotica.model.Participacao;

public class ParticipacaoDAO {

    public void inserir(Participacao participacao)
            throws SQLException, NamingException {

        String sql = """
                INSERT INTO participacao
                (estudante_id, atividade_id, funcao, descricao_contribuicao)
                VALUES (?, ?, ?, ?)
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(
                1,
                participacao.getEstudanteId()
            );

            statement.setLong(
                2,
                participacao.getAtividadeId()
            );

            statement.setString(
                3,
                participacao.getFuncao()
            );

            statement.setString(
                4,
                participacao.getDescricaoContribuicao()
            );

            statement.executeUpdate();
        }
    }

    public boolean existe(Long estudanteId, Long atividadeId)
            throws SQLException, NamingException {

        String sql = """
                SELECT 1
                FROM participacao
                WHERE estudante_id = ?
                  AND atividade_id = ?
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, estudanteId);
            statement.setLong(2, atividadeId);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    public List<Participacao> listarPorAtividade(Long atividadeId)
            throws SQLException, NamingException {

        String sql = """
                SELECT
                    p.estudante_id,
                    p.atividade_id,
                    p.funcao,
                    p.descricao_contribuicao,
                    e.nome AS estudante_nome
                FROM participacao p
                INNER JOIN estudante e
                    ON e.id = p.estudante_id
                WHERE p.atividade_id = ?
                ORDER BY e.nome
                """;

        List<Participacao> participacoes = new ArrayList<>();

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, atividadeId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Participacao participacao = new Participacao();

                    participacao.setEstudanteId(
                        resultSet.getLong("estudante_id")
                    );

                    participacao.setAtividadeId(
                        resultSet.getLong("atividade_id")
                    );

                    participacao.setFuncao(
                        resultSet.getString("funcao")
                    );

                    participacao.setDescricaoContribuicao(
                        resultSet.getString("descricao_contribuicao")
                    );

                    participacao.setEstudanteNome(
                        resultSet.getString("estudante_nome")
                    );

                    participacoes.add(participacao);
                }
            }
        }

        return participacoes;
    }

    public List<Participacao> listarPorEstudante(Long estudanteId)
            throws SQLException, NamingException {

        String sql = """
                SELECT
                    p.estudante_id,
                    p.atividade_id,
                    p.funcao,
                    p.descricao_contribuicao,
                    a.titulo AS atividade_titulo
                FROM participacao p
                INNER JOIN atividade a
                    ON a.id = p.atividade_id
                WHERE p.estudante_id = ?
                ORDER BY a.titulo
                """;

        List<Participacao> participacoes = new ArrayList<>();

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, estudanteId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Participacao participacao = new Participacao();

                    participacao.setEstudanteId(
                        resultSet.getLong("estudante_id")
                    );

                    participacao.setAtividadeId(
                        resultSet.getLong("atividade_id")
                    );

                    participacao.setFuncao(
                        resultSet.getString("funcao")
                    );

                    participacao.setDescricaoContribuicao(
                        resultSet.getString("descricao_contribuicao")
                    );

                    participacao.setAtividadeTitulo(
                        resultSet.getString("atividade_titulo")
                    );

                    participacoes.add(participacao);
                }
            }
        }

        return participacoes;
    }
}