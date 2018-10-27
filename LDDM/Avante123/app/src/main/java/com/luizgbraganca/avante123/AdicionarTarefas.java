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

public class AdicionarTarefas extends AppCompatActivity
{
    // definir dados
    private EditText nomeTarefa, descricaoTarefa, dataTarefa;
    private Button addTarefa;
    private DatabaseReference mDatabase;
    public String nomeProjeto;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_adicionar_tarefas);

        nomeProjeto = getIntent().getStringExtra("nomeProjeto");

        mDatabase = FirebaseDatabase.getInstance().getReference();

        setaElementos( );

        addTarefa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                String nome = nomeTarefa.getText().toString();
                String desc = descricaoTarefa.getText().toString();
                String data = dataTarefa.getText().toString();

                addFirebase(nome, desc, data);

                Toast.makeText(AdicionarTarefas.this, "Tarefa Adicionada!", Toast.LENGTH_SHORT).show();

                voltaTela( );
            }
        });
    }

    public void setaElementos( )
    {
        nomeTarefa = (EditText) findViewById(R.id.nomeTarefa);
        descricaoTarefa = (EditText) findViewById(R.id.descricaoTarefa);
        dataTarefa = (EditText) findViewById(R.id.dataTarefa);
        addTarefa = (Button) findViewById(R.id.addTarefa);
    }

    public void addFirebase(String tarefa, String descricaoTarefa, String dataTarefa)
    {
        User user = new User(tarefa, descricaoTarefa, dataTarefa, 1);

        mDatabase.child("projetos").child(nomeProjeto).child("tarefas").setValue(user);
    }

    public void voltaTela( )
    {
        Intent intent = new Intent(AdicionarTarefas.this, MainActivity.class);
        startActivity(intent);
        finish();
    }
}
