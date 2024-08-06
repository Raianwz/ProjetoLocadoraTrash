/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.models.daos;

import locadoratrash.models.beans.ClienteFilme;
import locadoratrash.utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author raian
 */
public class DaoClienteFilme {

    private final Connection c;

    public DaoClienteFilme() throws SQLException, ClassNotFoundException {
        this.c = new Conexao().getConnection();
    }

    public ClienteFilme inserir(ClienteFilme cnfEnt) throws SQLException {
        String sql = "INSERT INTO clientes_filmes" + " (idCliente, idFilme, dtaluga, dtdevolve, observacao)" + " values (?,?,?,?,?)";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        // seta os valores
        stmt.setInt(1, cnfEnt.getIdCliente());
        stmt.setInt(2, cnfEnt.getIdFilme());
        stmt.setString(3, cnfEnt.getDtaluga());
        stmt.setString(4, cnfEnt.getDtdevolve());
        stmt.setString(5, cnfEnt.getObservacao());
        // executa
        stmt.executeUpdate();

        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            cnfEnt.setId(id);
        }
        stmt.close();
        return cnfEnt;
    }

    public ClienteFilme buscar(ClienteFilme cnfEnt) throws SQLException {
        String sql = "select * from clientes_filmes WHERE id = ?";
        // prepared statement para buscar
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, cnfEnt.getId());
        // executa
        ResultSet rs = stmt.executeQuery();
        ClienteFilme cnfSaida = null;
        while (rs.next()) {
            // criando o objeto ClienteFilme
            cnfSaida = new ClienteFilme(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6));
        }
        stmt.close();
        return cnfSaida;
    }

    public ClienteFilme alterar(ClienteFilme cnfEnt) throws SQLException {
        String sql = "UPDATE clientes_filmes SET idCliente = ?, idFilme = ?, dtaluga = ?, dtdevolve = ?, observacao = ? WHERE id = ?";
        // prepared statement para Alterar
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, cnfEnt.getIdCliente());
        stmt.setInt(2, cnfEnt.getIdFilme());
        stmt.setString(3, cnfEnt.getDtaluga());
        stmt.setString(4, cnfEnt.getDtdevolve());
        stmt.setString(5, cnfEnt.getObservacao());
        stmt.setInt(6, cnfEnt.getId());

        // executa
        stmt.execute();
        stmt.close();
        return cnfEnt;
    }

    public ClienteFilme excluir(ClienteFilme cnfEnt) throws SQLException {
        String sql = "delete from clientes_filmes WHERE id = ?";
        // prepared statement para Excluir
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, cnfEnt.getId());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return cnfEnt;
    }

    public List<ClienteFilme> listar(ClienteFilme cnfEnt) throws SQLException {
        // cnfs: array armazena a lista de registros

        List<ClienteFilme> cnfms = new ArrayList<>();

        String sql = "SELECT * FROM clientes_filmes WHERE observacao LIKE ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1, "%" + cnfEnt.getObservacao() + "%");

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            // criando o objeto ClienteFilme
            ClienteFilme cnfm = new ClienteFilme(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            // adiciona o cnfs à lista de usus
            cnfms.add(cnfm);
        }

        rs.close();
        stmt.close();
        return cnfms;
    }
}
