package br.edu.ifms.portalrobotica.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.edu.ifms.portalrobotica.dao.util.Conexao;
import br.edu.ifms.portalrobotica.model.Coordenador;

public class CoordenadorDAO {

    public List<Coordenador> listar() throws NamingException, SQLException {

        List<Coordenador> coordenadores = new ArrayList<>();

        String sql = """
            SELECT
                id,
                nome,
                minibio,
                foto
            FROM coordenador
            ORDER BY nome
            """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()
        ) {

            while (rs.next()) {

                Coordenador coordenador = new Coordenador();

                coordenador.setId(rs.getLong("id"));
                coordenador.setNome(rs.getString("nome"));
                coordenador.setMinibio(rs.getString("minibio"));
                coordenador.setFoto(rs.getString("foto"));

                coordenadores.add(coordenador);

            }

        }

        return coordenadores;

    }

    public Coordenador buscarPorId(Long id)
            throws NamingException, SQLException {

        String sql = """
            SELECT
                id,
                nome,
                minibio,
                foto
            FROM coordenador
            WHERE id = ?
            """;

        try (
            Connection conexao = Conexao.getConnection();
            PreparedStatement stmt = conexao.prepareStatement(sql)
        ) {

            stmt.setLong(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Coordenador coordenador = new Coordenador();

                    coordenador.setId(rs.getLong("id"));
                    coordenador.setNome(rs.getString("nome"));
                    coordenador.setMinibio(rs.getString("minibio"));
                    coordenador.setFoto(rs.getString("foto"));

                    return coordenador;

                }

            }

        }

        return null;

    }

}