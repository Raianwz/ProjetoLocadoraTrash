/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.views;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import locadoratrash.controllers.ControllerClienteFilme;
import locadoratrash.models.beans.ClienteFilme;

/**
 *
 * @author raian
 */
public class ManterClienteFilme {

    static ControllerClienteFilme contClifil;

    public static void inserir() throws SQLException, ClassNotFoundException {
        int idCliente = Integer.parseInt(JOptionPane.showInputDialog("ID do Cliente"));
        int idFilme = Integer.parseInt(JOptionPane.showInputDialog("ID do Filme"));
        String dtaluga = JOptionPane.showInputDialog("Data de Retirada");
        String dtdevolve = JOptionPane.showInputDialog("Data de Devolução");
        String obs = JOptionPane.showInputDialog("Observação");

        ClienteFilme clifilEnt = new ClienteFilme(idCliente, idFilme, dtaluga, dtdevolve, obs);
        ControllerClienteFilme contClifil = new ControllerClienteFilme();
        ClienteFilme clifilSaida = contClifil.inserir(clifilEnt);
        JOptionPane.showMessageDialog(null, clifilSaida.toString());
        Menu();
    }

    public static void alterar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        int idCliente = Integer.parseInt(JOptionPane.showInputDialog("ID do Cliente"));
        int idFilme = Integer.parseInt(JOptionPane.showInputDialog("ID do Filme"));
        String dtaluga = JOptionPane.showInputDialog("Data de Retirada");
        String dtdevolve = JOptionPane.showInputDialog("Data de Devolução");
        String obs = JOptionPane.showInputDialog("Observação");

        ClienteFilme clifilEnt = new ClienteFilme(id, idCliente, idFilme, dtaluga, dtdevolve, obs);
        ControllerClienteFilme contClifil = new ControllerClienteFilme();
        ClienteFilme clifilSaida = contClifil.alterar(clifilEnt);
        JOptionPane.showMessageDialog(null, clifilSaida.toString());
        Menu();
    }

    public static void excluir() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        ClienteFilme clifilEnt = new ClienteFilme(id);
        ControllerClienteFilme contClifil = new ControllerClienteFilme();
        ClienteFilme clifilSaida = contClifil.excluir(clifilEnt);
        JOptionPane.showMessageDialog(null, clifilSaida.toString());
        Menu();
    }

    public static void buscar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        ClienteFilme clifilEnt = new ClienteFilme(id);
        ControllerClienteFilme contClifil = new ControllerClienteFilme();
        ClienteFilme clifilSaida = contClifil.buscar(clifilEnt);
        JOptionPane.showMessageDialog(null, clifilSaida.toString());
        Menu();
    }

    public static void listar() throws SQLException, ClassNotFoundException {
        String obs = JOptionPane.showInputDialog("Observação");
        ClienteFilme clifilEnt = new ClienteFilme(obs);
        ControllerClienteFilme contClifil = new ControllerClienteFilme();
        List<ClienteFilme> clifilSaida = contClifil.listar(clifilEnt);
        JOptionPane.showMessageDialog(null, clifilSaida.toString());
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
