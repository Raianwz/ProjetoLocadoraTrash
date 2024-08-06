/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locadoratrash.models.beans.Cliente;
import locadoratrash.models.beans.ClienteFilme;
import locadoratrash.models.beans.Filme;
import locadoratrash.models.daos.DaoClienteFilme;

/**
 *
 * @author raian
 */
public class ControllerClienteFilme {

    static DaoClienteFilme daoCliFil;
    static ControllerCliente contCli;
    static ControllerFilme contFil;

    public ClienteFilme inserir(ClienteFilme CliFlm) throws SQLException, ClassNotFoundException {
        daoCliFil = new DaoClienteFilme();
        return daoCliFil.inserir(CliFlm);
    }

    public ClienteFilme alterar(ClienteFilme CliFlm) throws SQLException, ClassNotFoundException {
        daoCliFil = new DaoClienteFilme();
        return daoCliFil.alterar(CliFlm);
    }

    public ClienteFilme excluir(ClienteFilme CliFlm) throws SQLException, ClassNotFoundException {
        daoCliFil = new DaoClienteFilme();
        return daoCliFil.excluir(CliFlm);

    }

    public ClienteFilme buscar(ClienteFilme CliFlm) throws SQLException, ClassNotFoundException {
        daoCliFil = new DaoClienteFilme();
        ClienteFilme clifilSaida = daoCliFil.buscar(CliFlm);

        //Método de Buscar Pessoa reutilizando o ControllerCliente
        Cliente cliEnt = new Cliente(clifilSaida.getIdCliente());
        contCli = new ControllerCliente();
        clifilSaida.setCli(cliEnt);

        //Método de Buscar Pessoa reutilizando o ControllerFilme
        Filme filEnt = new Filme(clifilSaida.getIdFilme());
        contFil = new ControllerFilme();
        clifilSaida.setFlm(filEnt);

        return clifilSaida;
    }

    public List<ClienteFilme> listar(ClienteFilme CliFlmEnt) throws SQLException, ClassNotFoundException {
        daoCliFil = new DaoClienteFilme();
        //Lista carregando dados vindos da lista do Banco de dados
        List<ClienteFilme> listaCliFlm = new ArrayList<>();

        //Lista carregando dados vindos da lista do Banco de dados
        List<ClienteFilme> listaCliFlmAux = daoCliFil.listar(CliFlmEnt);

        for (ClienteFilme cliflm : listaCliFlmAux) {
            listaCliFlm.add(buscar(cliflm));
        }
        
        return listaCliFlm;
    }

}
