package com.luizgbraganca.avante123;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.preference.DialogPreference;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.List;

/**
 * Created by luiz on 08/06/17.
 */

public class ProjetosAdapter extends RecyclerView.Adapter<ProjetosAdapter.ProjetoViewHolder>
{
    public static List<Projetos> projetos;
    public Context context;

    public ProjetosAdapter(List<Projetos> projetos, Context context)
    {
        this.context = context;
        this.projetos = projetos;
    }

    @Override
    public ProjetosAdapter.ProjetoViewHolder onCreateViewHolder(ViewGroup parent, int viewType)
    {
        View view = LayoutInflater.from(context).inflate(R.layout.linha, parent, false);

        return new ProjetoViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ProjetosAdapter.ProjetoViewHolder holder, int position)
    {
        holder.bindProjeto(projetos.get(position));
    }

    @Override
    public int getItemCount()
    {
        return projetos.size();
    }

    public static class ProjetoViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener
    {
        // definir dados
        public TextView nomeProjetoLinha, descricaoLinha;
        private Context mContext;
        public DatabaseReference mDatabase = FirebaseDatabase.getInstance().getReference();

        public ProjetoViewHolder(View itemView)
        {
            super(itemView);

            mContext = itemView.getContext();

            nomeProjetoLinha = (TextView) itemView.findViewById(R.id.nomeProjetoLista);
            descricaoLinha = (TextView) itemView.findViewById(R.id.descricaoLista);

            itemView.setOnClickListener(this);
        }

        public void bindProjeto(Projetos projetos)
        {
            nomeProjetoLinha.setText(projetos.getNomeProjeto());
            descricaoLinha.setText(projetos.getDescricao());
        }

        @Override
        public void onClick(View v)
        {
            AlertDialog alerta;

            final int itemPosition = getLayoutPosition();

            AlertDialog.Builder builder = new AlertDialog.Builder(mContext);

            builder.setTitle("Escola uma Opção:");

            builder.setMessage("");

            builder.setPositiveButton("Ver", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface arg0, int arg1)
                {
                    Intent intent = new Intent(mContext, TelaDoProjeto.class);

                    intent.putExtra("position", itemPosition + "");
                    intent.putExtra("nomeProjeto", nomeProjetoLinha.getText().toString());
                    intent.putExtra("descricao", descricaoLinha.getText().toString());

                    mContext.startActivity(intent);
                }// end onClick( )
            });

            builder.setNegativeButton("Apagar", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface arg0, int arg1)
                {
                    // apaga
                    Projetos theRemovedItem = projetos.get(itemPosition);

                    remover(theRemovedItem.getNomeProjeto());
                }// end onClick( )
            });

            //cria o AlertDialog
            alerta = builder.create();
            //Exibe
            alerta.show();
        }

        public void remover(String nomeProjeto)
        {
            mDatabase.child("projetos").child(nomeProjeto).removeValue();
        }
    }
}