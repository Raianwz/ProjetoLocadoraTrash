/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.models.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import locadoratrash.models.beans.Filme;
import locadoratrash.utils.Conexao;

/**
 *
 * @author raian
 */
public class DaoFilme {

    private final Connection c;

    public DaoFilme() throws SQLException, ClassNotFoundException {
        this.c = new Conexao().getConnection();
    }

    public Filme inserir(Filme flmEnt) throws SQLException {
        String sql = "INSERT INTO filmes" + " (nome, genero, ano)" + " values (?,?,?)";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // setando os valores
        stmt.setString(1, flmEnt.getNome());
        stmt.setString(2, flmEnt.getGenero());
        stmt.setString(3, flmEnt.getAno());
        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            flmEnt.setId(id);
        }
        stmt.close();
        return flmEnt;
    }

    public Filme buscar(Filme flmEnt) throws SQLException {
        String sql = "SELECT * FROM filmes WHERE id = ?";
        // prepared statement para busca
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setInt(1, flmEnt.getId());
        // executa
        ResultSet rs = stmt.executeQuery();
        Filme flmSaida = null;
        while (rs.next()) {
            flmSaida = new Filme(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4)
            );
        }
        stmt.close();
        return flmSaida;
    }

    public Filme alterar(Filme flmEnt) throws SQLException {
        String sql = "UPDATE filmes SET nome = ?, genero = ?, ano = ? WHERE id = ?";
        // prepared statement para Alterar
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setString(1, flmEnt.getNome());
        stmt.setString(2, flmEnt.getGenero());
        stmt.setString(3, flmEnt.getAno());
        stmt.setInt(4, flmEnt.getId());
        // executa
        stmt.execute();
        stmt.close();
        return flmEnt;
    }

    public Filme excluir(Filme flmEnt) throws SQLException {
        String sql = "DELETE FROM filmes WHERE id = ?";
        // prepared statement para Excluir
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setInt(1, flmEnt.getId());
        stmt.execute();
        stmt.close();
        c.close();
        return flmEnt;
    }

    public List<Filme> listar(Filme flmEnt) throws SQLException {
        // flms: Array que armazena a lista de filmes
        List<Filme> flms = new ArrayList<>();

        String sql = "SELECT * FROM filmes WHERE genero LIKE ?";
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setString(1, "%" + flmEnt.getGenero() + "%");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            //Criando o Objeto Filme
            Filme flm = new Filme(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4)
            );
            flms.add(flm);
        }
        rs.close();
        stmt.close();
        return flms;
    }
}
