/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.controllers;

import java.sql.SQLException;
import java.util.List;
import locadoratrash.models.beans.Cliente;
import locadoratrash.models.daos.DaoCliente;

/**
 *
 * @author raian
 */
public class ControllerCliente {
    
    static DaoCliente daoClie;
    
    public Cliente inserir(Cliente cli) throws SQLException, ClassNotFoundException {
        daoClie = new DaoCliente();
        return daoClie.inserir(cli);
    }
    
    public Cliente alterar(Cliente cli) throws SQLException, ClassNotFoundException {
        daoClie = new DaoCliente();
        return daoClie.alterar(cli);
    }
    
    public Cliente excluir(Cliente cli) throws SQLException, ClassNotFoundException {
        daoClie = new DaoCliente();
        return daoClie.excluir(cli);
    }
    
    public Cliente buscar(Cliente cli) throws SQLException, ClassNotFoundException {
        daoClie = new DaoCliente();
        return daoClie.buscar(cli);
    }
    
    public List<Cliente> listar(Cliente cli) throws SQLException, ClassNotFoundException {
        daoClie = new DaoCliente();
        return daoClie.listar(cli);
    }
    
}
