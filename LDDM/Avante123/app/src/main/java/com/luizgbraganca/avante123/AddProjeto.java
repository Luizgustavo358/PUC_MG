package com.luizgbraganca.avante123;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.luizgbraganca.avante123.database.models.User;

public class AddProjeto extends AppCompatActivity
{
    // definir dados
    private String filho;
    private Button adicionar;
    public DatabaseReference mDatabase;
    private EditText nomeProjeto;
    private EditText descricaoProjeto;
    private EditText nomeCriador;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_projeto);

        mDatabase = FirebaseDatabase.getInstance().getReference();

        adicionar = (Button) findViewById(R.id.addProj);
        nomeProjeto = (EditText) findViewById(R.id.nomeProjeto);
        descricaoProjeto = (EditText) findViewById(R.id.descricaoTarefa);
        nomeCriador = (EditText) findViewById(R.id.nomeCriador);

        adicionar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                filho = nomeProjeto.getText().toString();

                adicionaProjeto();
                Toast.makeText(AddProjeto.this, "Projeto adicionado com sucesso!", Toast.LENGTH_SHORT).show();

                voltaParaTelaPrincipal( );
            }
        });
    }

    public void voltaParaTelaPrincipal( )
    {
        Intent intent = new Intent(AddProjeto.this, MainActivity.class);
        startActivity(intent);
        finish();
    }

    public void adicionaProjeto()
    {
        writeProjeto(nomeProjeto.getText().toString(), descricaoProjeto.getText().toString(), nomeCriador.getText().toString());
    }

    private void writeProjeto(String projeto, String descricao, String nomeCriador)
    {
        User user = new User(projeto, descricao, nomeCriador);

        mDatabase.child("projetos").child(filho).setValue(user);
    }
}