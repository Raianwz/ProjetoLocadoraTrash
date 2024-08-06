/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package locadoratrash;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import locadoratrash.views.ManterCliente;
import locadoratrash.views.ManterClienteFilme;
import locadoratrash.views.ManterFilme;
import locadoratrash.views.ManterUsuario;

/**
 *
 * @author raian
 */
public class LocadoraTrashMain {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        // TODO code application logic here
        if (ManterUsuario.validar()) {
            mainMenu();
        } else {
            JOptionPane.showMessageDialog(null, "ERRO: Usuário Inválido!!", "Locadora Trash", 1);
        }
    }

    public static void mainMenu() throws SQLException, ClassNotFoundException {
        String msg = "0 — Sair\n1 — Cadastrar Cliente\n2 — Cadastrar Filme\n3 — Alugar Filme \n4 — Gerenciar Usuário";
        int op = Integer.parseInt(JOptionPane.showInputDialog(msg));
        switch (op) {
            case 0:
                int sair = JOptionPane.showConfirmDialog(null, "Deseja sair?");
                if (sair > 0) {
                    mainMenu();
                }
                break;
            case 1:
                ManterCliente.Menu();
                break;
            case 2:
                ManterFilme.Menu();
                break;
            case 3:
                ManterClienteFilme.Menu();
                break;
            case 4:
                ManterUsuario.Menu();
                break;
            default:
                JOptionPane.showMessageDialog(null, "ERRO: Operação Inválida!!","Locadora Trash",1);
                mainMenu();
                break;
        }

    }

}
