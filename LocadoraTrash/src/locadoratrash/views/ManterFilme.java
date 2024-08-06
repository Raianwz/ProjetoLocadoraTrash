/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.views;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import locadoratrash.controllers.ControllerFilme;
import locadoratrash.models.beans.Filme;

/**
 *
 * @author raian
 */
public class ManterFilme {

    static ControllerFilme contFil;

    public static void inserir() throws SQLException, ClassNotFoundException {
        String nome = JOptionPane.showInputDialog("Nome");
        String genero = JOptionPane.showInputDialog("Genero");
        String ano = JOptionPane.showInputDialog("Ano");
        Filme fil = new Filme(nome, genero, ano);
        contFil = new ControllerFilme();
        fil = contFil.inserir(fil);
        JOptionPane.showMessageDialog(null, fil.toString());
        Menu();
    }

    public static void alterar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        String nome = JOptionPane.showInputDialog("Nome");
        String genero = JOptionPane.showInputDialog("Genero");
        String ano = JOptionPane.showInputDialog("Ano");
        Filme fil = new Filme(id, nome, genero, ano);
        contFil = new ControllerFilme();
        fil = contFil.alterar(fil);
        JOptionPane.showMessageDialog(null, fil.toString());
        Menu();
    }

    public static void excluir() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        Filme fil = new Filme(id);
        contFil = new ControllerFilme();
        fil = contFil.excluir(fil);
        JOptionPane.showMessageDialog(null, fil.toString());
        Menu();
    }

    public static void buscar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        Filme fil = new Filme(id);
        contFil = new ControllerFilme();
        fil = contFil.buscar(fil);
        JOptionPane.showMessageDialog(null, fil.toString());
        Menu();
    }

    public static void listar() throws SQLException, ClassNotFoundException {
        String genero = JOptionPane.showInputDialog("Genero");
        Filme fil = new Filme(genero);
        contFil = new ControllerFilme();
        List<Filme> listaFil = contFil.listar(fil);
        for (Filme filSaida : listaFil) {
            JOptionPane.showMessageDialog(null, filSaida.toString());
        }
        Menu();
    }

    public static void Menu() throws SQLException, ClassNotFoundException {
        String msg = "0 — Sair\n1 — Inserir\n2 — Alterar\n3 — Excluir \n4 — Buscar \n5 — Listar\n6 — Voltar";
        int opera = Integer.parseInt(JOptionPane.showInputDialog(msg));
        switch (opera) {
            case 0:
                int sair = JOptionPane.showConfirmDialog(null, "Deseja sair?");
                if (sair > 0) {
                    Menu();
                }
                break;
            case 1:
                inserir();
                break;
            case 2:
                alterar();
                break;
            case 3:
                excluir();
                break;
            case 4:
                buscar();
                break;
            case 5:
                listar();
                break;
            case 6:
                locadoratrash.LocadoraTrashMain.mainMenu();
                break;
            default:
                JOptionPane.showMessageDialog(null, "ERRO: Operação Inválida!!");
                Menu();
                break;
        }
    }
}
