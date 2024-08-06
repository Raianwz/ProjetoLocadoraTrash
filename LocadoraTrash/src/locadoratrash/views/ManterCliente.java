/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.views;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import locadoratrash.controllers.ControllerCliente;
import locadoratrash.models.beans.Cliente;

/**
 *
 * @author raian
 */
public class ManterCliente {

    static ControllerCliente contCli;

    public static void inserir() throws SQLException, ClassNotFoundException {
        String nome = JOptionPane.showInputDialog("Nome");
        String email = JOptionPane.showInputDialog("Email");
        String tel = JOptionPane.showInputDialog("Telefone");
        String status = JOptionPane.showInputDialog("Status");
        Cliente cli = new Cliente(nome, email, tel, status);
        contCli = new ControllerCliente();
        cli = contCli.inserir(cli);
        JOptionPane.showMessageDialog(null, cli.toString());
        Menu();
    }

    public static void alterar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        String nome = JOptionPane.showInputDialog("Nome");
        String email = JOptionPane.showInputDialog("Email");
        String tel = JOptionPane.showInputDialog("Telefone");
        String status = JOptionPane.showInputDialog("Status");
        Cliente cli = new Cliente(id, nome, email, tel, status);
        contCli = new ControllerCliente();
        cli = contCli.alterar(cli);
        JOptionPane.showMessageDialog(null, cli.toString());
        Menu();
    }

    public static void excluir() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        Cliente cli = new Cliente(id);
        contCli = new ControllerCliente();
        cli = contCli.excluir(cli);
        JOptionPane.showMessageDialog(null, cli.toString());
        Menu();
    }

    public static void buscar() throws SQLException, ClassNotFoundException {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        Cliente cli = new Cliente(id);
        contCli = new ControllerCliente();
        cli = contCli.buscar(cli);
        JOptionPane.showMessageDialog(null, cli.toString());
        Menu();
    }

    public static void listar() throws SQLException, ClassNotFoundException {
        String nome = JOptionPane.showInputDialog("NOME");
        Cliente cli = new Cliente(nome);
        contCli = new ControllerCliente();
        List<Cliente> listaCli = contCli.listar(cli);
        for (Cliente cliSaida : listaCli) {
            JOptionPane.showMessageDialog(null, cliSaida.toString());
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
