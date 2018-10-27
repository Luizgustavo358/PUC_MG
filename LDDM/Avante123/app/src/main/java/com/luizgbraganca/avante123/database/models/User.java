package com.luizgbraganca.avante123.database.models;

import com.google.firebase.database.IgnoreExtraProperties;

/**
 * Created by luiz on 06/06/17.
 */

@IgnoreExtraProperties
public class User
{
    // definir dados
    private String username;
    private String email;
    private String projeto;
    private String descricao;
    private String nomeCriador;
    private String tarefa;
    private String descTarefa;
    private String dataTarefa;

    public User() {}

    public User(String projeto, String descricao, String nomeCriador)
    {
        this.projeto = projeto;
        this.descricao = descricao;
        this.nomeCriador = nomeCriador;
    }

    public User(String username, String email)
    {
        this.username = username;
        this.email = email;
    }

    public User(String tarefa, String descTarefa, String dataTarefa, int a)
    {
        this.tarefa = tarefa;
        this.descTarefa = descTarefa;
        this.dataTarefa = dataTarefa;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public void setProjeto(String projeto)
    {
        this.projeto = projeto;
    }

    public String getProjeto( )
    {
        return projeto;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public String getDescricao( )
    {
        return descricao;
    }

    public String getNomeCriador() {
        return nomeCriador;
    }

    public void setNomeCriador(String nomeCriador) {
        this.nomeCriador = nomeCriador;
    }
}

