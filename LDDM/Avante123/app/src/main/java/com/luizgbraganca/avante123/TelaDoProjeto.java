package com.luizgbraganca.avante123;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class TelaDoProjeto extends AppCompatActivity
{
    // definir dados
    private TextView nomeProjeto, descricaoProjeto;
    private FloatingActionButton addTarefas;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tela_do_projeto);

        nomeProjeto = (TextView) findViewById(R.id.nomeProjeto);
        descricaoProjeto = (TextView) findViewById(R.id.descricaoTarefa);
        addTarefas = (FloatingActionButton) findViewById(R.id.addTarefas);

        String projeto = getIntent().getStringExtra("nomeProjeto");
        String descricao = getIntent().getStringExtra("descricao");

        nomeProjeto.setText(projeto);
        descricaoProjeto.setText(descricao);

        addTarefas.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adicionarTarefas( );
            }
        });
    }

    public void adicionarTarefas( )
    {
        Intent intent = new Intent(TelaDoProjeto.this, AdicionarTarefas.class);

        intent.putExtra("nomeProjeto", nomeProjeto.getText().toString());

        startActivity(intent);
    }
}
