package com.luizgbraganca.bancodedados;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ListView;

import java.util.ArrayList;

public class PrincipalActivity extends AppCompatActivity
{
    private BDSQLiteHelper bd;
    ArrayList<Livro> listaLivros;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        bd = new BDSQLiteHelper(this);

        setContentView(R.layout.activity_principal);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(PrincipalActivity.this, AddLivroActivity.class);

                startActivity(intent);
            }
        });
    }

    @Override
    protected void onStart( )
    {
        super.onStart();

        ListView lista = (ListView) findViewById(R.id.lvLivros);
        listaLivros = bd.getAllLivros();
        LivroAdapter adapter = new LivroAdapter(this, listaLivros);
        lista.setAdapter(adapter);
    }
}
