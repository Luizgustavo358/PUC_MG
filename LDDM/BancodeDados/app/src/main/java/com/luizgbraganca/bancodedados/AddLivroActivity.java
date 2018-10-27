package com.luizgbraganca.bancodedados;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class AddLivroActivity extends AppCompatActivity
{
    private BDSQLiteHelper bd;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_livro);

        bd = new BDSQLiteHelper(this);

        final EditText nome = (EditText) findViewById(R.id.edtNome);
        final EditText autor = (EditText) findViewById(R.id.edtAutor);
        final EditText ano = (EditText) findViewById(R.id.edtAno);
        Button adicionar = (Button) findViewById(R.id.btnAddLivro);

        adicionar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Livro livro = new Livro();
                livro.setTitulo(nome.getText().toString());
                livro.setAutor(autor.getText().toString());
                livro.setAno(Integer.parseInt(ano.getText().toString()));

                bd.addLivro(livro);

                Toast.makeText(getBaseContext(), "Livro Adicionado", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
