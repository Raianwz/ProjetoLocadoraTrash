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
import locadoratrash.models.beans.Usuario;
import locadoratrash.utils.Conexao;

/**
 *
 * @author raian
 */
public class DaoUsuario {

    private final Connection c;

    //Construtor de conexão
    public DaoUsuario() throws SQLException, ClassNotFoundException {
        this.c = new Conexao().getConnection();
    }

    public Usuario inserir(Usuario usu) throws SQLException {
        //query sql para ser executada
        String sql = "insert into usuarios" + " (login, senha, status, tipo)" + " values (?,?,?,?)";

        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setString(1, usu.getLogin());
        stmt.setString(2, usu.getSenha());
        stmt.setString(3, usu.getStatus());
        stmt.setString(4, usu.getTipo());

        // executa
        stmt.executeUpdate();

        //Pega uma chave gerada pela classe ResultSet
        ResultSet rs = stmt.getGeneratedKeys();

        //verificando se existe resultado na query
        if (rs.next()) {
            //Define o chave gerada como uma variavel
            int id = rs.getInt(1);

            //seta a chave como o id do usuário
            usu.setId(id);
        }

        //Finalizando o prepared statement
        stmt.close();

        //retornando os resultados da pesquisa
        return usu;
    }

    public Usuario alterar(Usuario usu) throws SQLException {
        //query sql para ser executada
        String sql = "UPDATE usuarios SET login = ?, senha = ?, status = ?, tipo = ? WHERE id = ?";

        //prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);

        //seta os valores
        stmt.setString(1, usu.getLogin());
        stmt.setString(2, usu.getSenha());
        stmt.setString(3, usu.getStatus());
        stmt.setString(4, usu.getTipo());
        stmt.setInt(5, usu.getId());

        //executa
        stmt.execute();

        //Finalizando o prepared statement
        stmt.close();

        //retornando os resultados da pesquisa
        return usu;
    }

    public Usuario excluir(Usuario usu) throws SQLException {
        //query sql para ser executada
        String sql = "delete from usuarios WHERE id = ?";

        //prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);

        //seta o valor
        stmt.setInt(1, usu.getId());

        //executa
        stmt.execute();

        //Finalizando o prepared statement
        stmt.close();

        //Finalizando conexão
        c.close();

        //retornando os resultados da pesquisa
        return usu;
    }

    public Usuario buscar(Usuario usu) throws SQLException {
        //query sql para ser executada
        String sql = "select * from usuarios WHERE id = ?";

        //prepared statement para inserção
        PreparedStatement stmt = this.c.prepareStatement(sql);

        //seta o valor
        stmt.setInt(1, usu.getId());

        //executa
        ResultSet rs = stmt.executeQuery();

        //cria e instancia uma variavel do tipo usuário
        Usuario usuSaida = null;

        //verificando se existe resultado na query
        while (rs.next()) {
            // criando o objeto Usuario
            usuSaida = new Usuario(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5));
        }

        //Finalizando o prepared statement
        stmt.close();

        //retornando os resultados da pesquisa
        return usuSaida;
    }

    public List<Usuario> listar(Usuario usuEnt) throws SQLException {
        //usus: array armazena a lista de registros
        List<Usuario> usus = new ArrayList<>();

        //query sql para ser executada
        String sql = "select * from usuarios where login like ?";

        //prepared statement para inserção
        PreparedStatement stmt = this.c.prepareStatement(sql);

        //seta o valor
        stmt.setString(1, "%" + usuEnt.getLogin() + "%");

        //executa
        ResultSet rs = stmt.executeQuery();

        //verificando se existe resultado na query
        while (rs.next()) {
            // criando o objeto Usuario
            Usuario usu = new Usuario(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
            );
            // adiciona o usu à lista de usus
            usus.add(usu);
        }

        //Finalizando a execução da query
        rs.close();

        //Finalizando o prepared statement
        stmt.close();

        //retornando os resultados da pesquisa
        return usus;
    }

    public Usuario validar(Usuario usu) throws SQLException {
        //query sql para ser executada
        String sql = "SELECT * FROM usuarios WHERE login = ? AND senha = ?";

        //prepared statement para seleção
        PreparedStatement stmt = this.c.prepareStatement(sql);

        //seta os valores
        stmt.setString(1, usu.getLogin());
        stmt.setString(2, usu.getSenha());

        //executa
        ResultSet rs = stmt.executeQuery();

        //cria e instancia uma variavel do tipo usuário
        Usuario usuSaida = null;

        //verificando se existe resultado na query
        while (rs.next()) {
            // criando o objeto Usuario
            usuSaida = new Usuario(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
            );
        }

        //Finalizando o prepared statement
        stmt.close();

        //retornando os resultados da pesquisa
        return usuSaida;
    }
}
