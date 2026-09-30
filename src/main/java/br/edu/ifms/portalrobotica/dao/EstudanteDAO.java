
package br.edu.ifms.portalrobotica.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.edu.ifms.portalrobotica.dao.util.Conexao;
import br.edu.ifms.portalrobotica.model.Estudante;

public class EstudanteDAO {

    public void inserir(Estudante estudante)
            throws SQLException, NamingException {

        String sql = """
                INSERT INTO estudante (nome, minibio, foto)
                VALUES (?, ?, ?)
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setString(1, estudante.getNome());
            statement.setString(2, estudante.getMinibio());
            statement.setString(3, estudante.getFoto());

            statement.executeUpdate();
        }
    }

    public void atualizar(Estudante estudante)
            throws SQLException, NamingException {

        String sql = """
                UPDATE estudante
                SET nome = ?,
                    minibio = ?,
                    foto = ?
                WHERE id = ?
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setString(1, estudante.getNome());
            statement.setString(2, estudante.getMinibio());
            statement.setString(3, estudante.getFoto());
            statement.setLong(4, estudante.getId());

            int linhasAtualizadas = statement.executeUpdate();

            if (linhasAtualizadas == 0) {
                throw new SQLException(
                    "Estudante não encontrado para atualização."
                );
            }
        }
    }

    public List<Estudante> listar()
            throws SQLException, NamingException {

        String sql = """
                SELECT id, nome, minibio, foto
                FROM estudante
                ORDER BY nome
                """;

        List<Estudante> estudantes = new ArrayList<>();

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Estudante estudante = new Estudante();

                estudante.setId(resultSet.getLong("id"));
                estudante.setNome(resultSet.getString("nome"));
                estudante.setMinibio(resultSet.getString("minibio"));
                estudante.setFoto(resultSet.getString("foto"));

                estudantes.add(estudante);
            }
        }

        return estudantes;
    }

    public Estudante buscarPorId(Long id)
            throws SQLException, NamingException {

        String sql = """
                SELECT id, nome, minibio, foto
                FROM estudante
                WHERE id = ?
                """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement statement = conexao.prepareStatement(sql)
        ) {

            statement.setLong(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Estudante estudante = new Estudante();

                    estudante.setId(resultSet.getLong("id"));
                    estudante.setNome(resultSet.getString("nome"));
                    estudante.setMinibio(resultSet.getString("minibio"));
                    estudante.setFoto(resultSet.getString("foto"));

                    return estudante;
                }
            }
        }

        return null;
    }

    public void excluir(Long id)
            throws SQLException, NamingException {

        String sql = """
                DELETE FROM estudante
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
}