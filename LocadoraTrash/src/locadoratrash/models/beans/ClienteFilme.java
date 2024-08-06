/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locadoratrash.models.beans;

/**
 *
 * @author raian
 */
public class ClienteFilme {

    private int id;
    private int idCliente;
    private int idFilme;
    private String dtaluga;
    private String dtdevolve;
    private String observacao;
    private Cliente cli;
    private Filme flm;

    public ClienteFilme(int id) {
        this.id = id;
    }

    public ClienteFilme(String observacao) {
        this.observacao = observacao;
    }

    public ClienteFilme(int idCliente, int idFilme, String dtaluga, String dtdevolve, String observacao) {
        this.idCliente = idCliente;
        this.idFilme = idFilme;
        this.dtaluga = dtaluga;
        this.dtdevolve = dtdevolve;
        this.observacao = observacao;
    }

    public ClienteFilme(int id, int idCliente, int idFilme, String dtaluga, String dtdevolve, String observacao) {
        this.id = id;
        this.idCliente = idCliente;
        this.idFilme = idFilme;
        this.dtaluga = dtaluga;
        this.dtdevolve = dtdevolve;
        this.observacao = observacao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdFilme() {
        return idFilme;
    }

    public void setIdFilme(int idFilme) {
        this.idFilme = idFilme;
    }

    public String getDtaluga() {
        return dtaluga;
    }

    public void setDtaluga(String dtaluga) {
        this.dtaluga = dtaluga;
    }

    public String getDtdevolve() {
        return dtdevolve;
    }

    public void setDtdevolve(String dtdevolve) {
        this.dtdevolve = dtdevolve;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }

    public Filme getFlm() {
        return flm;
    }

    public void setFlm(Filme flm) {
        this.flm = flm;
    }

    @Override
    public String toString() {
        return "ClienteFilme{" + "id=" + id + ", idCliente=" + idCliente + ", idFilme=" + idFilme + ", dtaluga=" + dtaluga + ", dtdevolve=" + dtdevolve + ", observacao=" + observacao + '}';
    }

}
