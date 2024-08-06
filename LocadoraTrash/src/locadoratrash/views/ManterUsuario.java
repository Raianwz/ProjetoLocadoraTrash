/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.views;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import locadoratrash.controllers.ControllerUsuario;
import locadoratrash.models.beans.Usuario;

/**
 *
 * @author raian
 */
public class ManterUsuario {

    //Definindo uma variavel do tipo ControllerUsuario
    static ControllerUsuario contUsu;

    public static void inserir() throws SQLException, ClassNotFoundException {
        //Criando e setando valores nas variaveis
        String login = JOptionPane.showInputDialog("Login");
        String senha = JOptionPane.showInputDialog("Senha");
        String status = JOptionPane.showInputDialog("Status");
        String tipo = JOptionPane.showInputDialog("Tipo");

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(login, senha, status, tipo);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método inserir()
        Usuario usuSaida = contUsu.inserir(usuEnt);

        //Mostrando para o usuário o resultado da pesquisa
        JOptionPane.showMessageDialog(null, usuSaida.toString());
        Menu();
    }

    public static void alterar() throws SQLException, ClassNotFoundException {
        //Criando e setando valores nas variaveis
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));
        String login = JOptionPane.showInputDialog("Login");
        String senha = JOptionPane.showInputDialog("Senha");
        String status = JOptionPane.showInputDialog("Status");
        String tipo = JOptionPane.showInputDialog("Tipo");

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(id, login, senha, status, tipo);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método alterar()
        Usuario usuSaida = contUsu.alterar(usuEnt);

        //Mostrando para o usuário o resultado da pesquisa
        JOptionPane.showMessageDialog(null, usuSaida.toString());

        //Voltando para o menu
        Menu();
    }

    public static void excluir() throws SQLException, ClassNotFoundException {
        //Criando e setando valor na variavel
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(id);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método excluir()
        Usuario usuSaida = contUsu.excluir(usuEnt);

        //Mostrando para o usuário o resultado da pesquisa
        JOptionPane.showMessageDialog(null, usuSaida.toString());

        //Voltando para o menu
        Menu();
    }

    public static void buscar() throws SQLException, ClassNotFoundException {
        //Criando e setando valor na variavel
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID"));

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(id);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método buscar()
        Usuario usuSaida = contUsu.buscar(usuEnt);

        //Mostrando para o usuário o resultado da pesquisa
        JOptionPane.showMessageDialog(null, usuSaida.toString());

        //Voltando para o menu
        Menu();
    }

    public static void listar() throws SQLException, ClassNotFoundException {
        //Criando e setando valor na variavel
        String login = JOptionPane.showInputDialog("Login");

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(login);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método listar()
        List<Usuario> listaUsuSaida = contUsu.listar(usuEnt);

        //Guardando os valores dentro da lista em variaveis separadas
        for (Usuario usu : listaUsuSaida) {
            //Mostrando para o usuário o resultado da pesquisa
            JOptionPane.showMessageDialog(null, usu.toString());
        }

        //Voltando para o menu
        Menu();
    }

    public static boolean validar() throws SQLException, ClassNotFoundException {
        //Criando e setando valores nas variaveis
        boolean validado = false;
        String login = JOptionPane.showInputDialog("Login");
        String senha = JOptionPane.showInputDialog("Senha");

        //Instanciando a classe Usuario usando um construtor
        Usuario usuEnt = new Usuario(login, senha);

        //Instanciando a classe ControllerUsuario
        contUsu = new ControllerUsuario();

        //Guardando o conteúdo que será retornado do ControllerUsuario usando o método validar()
        validado = contUsu.validar(usuEnt);

        //retornando o resultado da validação do usuário
        return validado;
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
