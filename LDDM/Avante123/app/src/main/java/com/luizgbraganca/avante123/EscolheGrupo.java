package com.luizgbraganca.avante123;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class EscolheGrupo extends AppCompatActivity
{
    // definir dados
    public List<Projetos> projetos;
    public ProjetosAdapter2 projetosAdapter2;
    private FirebaseDatabase firebaseDatabase;
    private DatabaseReference mDatabase;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_escolhe_grupo);

        firebaseDatabase = FirebaseDatabase.getInstance();
        mDatabase = firebaseDatabase.getReference();

        mDatabase.limitToLast(2).addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot)
            {
                for(DataSnapshot dataSnapshot1: dataSnapshot.child("projetos").getChildren())
                {
                    String projetoBD = dataSnapshot1.getKey();

                    Projetos pj = new Projetos(projetoBD);

                    projetos.add(pj);
                }// end for
                projetosAdapter2.notifyDataSetChanged();
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {}
        });

        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.listaProjetos);

        projetos = new ArrayList<>();

        projetosAdapter2 = new ProjetosAdapter2(projetos, this);

        recyclerView.setAdapter(projetosAdapter2);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);

        recyclerView.setLayoutManager(layoutManager);

        projetosAdapter2.notifyDataSetChanged();
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onDestroy( )
    {
        super.onDestroy();
        projetos.clear();
    }
}
