/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.models.beans;

/**
 *
 * @author raian
 */
public class Filme {

    private int id;
    private String nome;
    private String genero;
    private String ano;

    public Filme(int id) {
        this.id = id;
    }

    public Filme(String genero) {
        this.genero = genero;
    }

    public Filme(String nome, String genero) {
        this.nome = nome;
        this.genero = genero;
    }

    public Filme(String nome, String genero, String ano) {
        this.nome = nome;
        this.genero = genero;
        this.ano = ano;
    }

    public Filme(int id, String nome, String genero, String ano) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.ano = ano;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    @Override
    public String toString() {
        return "Filmes{" + "id=" + id + ", nome=" + nome + ", genero=" + genero + ", ano=" + ano + '}';
    }

}
