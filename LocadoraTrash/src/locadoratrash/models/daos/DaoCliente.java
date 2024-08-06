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
import locadoratrash.models.beans.Cliente;
import locadoratrash.utils.Conexao;

/**
 *
 * @author raian
 */
public class DaoCliente {

    private final Connection c;

    public DaoCliente() throws SQLException, ClassNotFoundException {
        this.c = new Conexao().getConnection();
    }

    public Cliente inserir(Cliente cliEnt) throws SQLException {
        String sql = "INSERT INTO clientes" + " (nome, email, telefone, status)" + " values (?,?,?,?)";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // setando os valores
        stmt.setString(1, cliEnt.getNome());
        stmt.setString(2, cliEnt.getEmail());
        stmt.setString(3, cliEnt.getTelefone());
        stmt.setString(4, cliEnt.getStatus());
        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            cliEnt.setId(id);
        }
        stmt.close();
        return cliEnt;
    }

    public Cliente buscar(Cliente cliEnt) throws SQLException {
        String sql = "SELECT * FROM clientes WHERE id = ?";
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setInt(1, cliEnt.getId());
        // executa
        ResultSet rs = stmt.executeQuery();
        Cliente cliSaida = null;
        while (rs.next()) {
            // Criando o Objeto Cliente
            cliSaida = new Cliente(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
            );
        }
        stmt.close();
        return cliSaida;
    }

    public Cliente alterar(Cliente cliEnt) throws SQLException {
        String sql = "UPDATE clientes SET nome = ?, email = ?, telefone = ?, status = ? WHERE id = ?";
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setString(1, cliEnt.getNome());
        stmt.setString(2, cliEnt.getEmail());
        stmt.setString(3, cliEnt.getTelefone());
        stmt.setString(4, cliEnt.getStatus());
        stmt.setInt(5, cliEnt.getId());
        // executa
        stmt.execute();
        stmt.close();
        return cliEnt;
    }

    public Cliente excluir(Cliente cliEnt) throws SQLException {
        String sql = "DELETE FROM clientes WHERE id = ?";
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setInt(1, cliEnt.getId());
        stmt.execute();
        stmt.close();
        c.close();
        return cliEnt;
    }

    public List<Cliente> listar(Cliente cliEnt) throws SQLException {
        // clis: Array que armazena a lista de clientes;
        List<Cliente> clis = new ArrayList<>();

        String sql = "SELECT * FROM clientes WHERE nome LIKE ?";
        PreparedStatement stmt = c.prepareStatement(sql);
        // setando os valores
        stmt.setString(1, "%" + cliEnt.getNome() + "%");

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            // Criando o Objeto Cliente
            Cliente cli = new Cliente(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
            );
            clis.add(cli);
        }

        rs.close();
        stmt.close();
        return clis;
    }

}
