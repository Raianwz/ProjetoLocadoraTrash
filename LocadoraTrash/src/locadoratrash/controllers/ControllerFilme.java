/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.controllers;

import java.sql.SQLException;
import java.util.List;
import locadoratrash.models.beans.Filme;
import locadoratrash.models.daos.DaoFilme;

/**
 *
 * @author raian
 */
public class ControllerFilme {

    static DaoFilme daoFil;

    public Filme inserir(Filme fil) throws SQLException, ClassNotFoundException {
        daoFil = new DaoFilme();
        return daoFil.inserir(fil);
    }

    public Filme alterar(Filme fil) throws SQLException, ClassNotFoundException {
        daoFil = new DaoFilme();
        return daoFil.alterar(fil);
    }

    public Filme excluir(Filme fil) throws SQLException, ClassNotFoundException {
        daoFil = new DaoFilme();
        return daoFil.excluir(fil);
    }

    public Filme buscar(Filme fil) throws SQLException, ClassNotFoundException {
        daoFil = new DaoFilme();
        return daoFil.buscar(fil);
    }

    public List<Filme> listar(Filme fil) throws SQLException, ClassNotFoundException {
        daoFil = new DaoFilme();
        return daoFil.listar(fil);
    }
}
