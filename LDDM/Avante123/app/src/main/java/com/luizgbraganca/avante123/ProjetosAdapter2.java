package com.luizgbraganca.avante123;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by luiz on 08/06/17.
 */

public class ProjetosAdapter2 extends RecyclerView.Adapter<ProjetosAdapter2.ProjetoViewHolder2>
{
    public List<Projetos> projetos;
    public Context context;

    public ProjetosAdapter2(List<Projetos> projetos, Context context)
    {
        this.context = context;
        this.projetos = projetos;
    }

    @Override
    public ProjetosAdapter2.ProjetoViewHolder2 onCreateViewHolder(ViewGroup parent, int viewType)
    {
        View view = LayoutInflater.from(context).inflate(R.layout.activity_lista_projetos, parent, false);

        return new ProjetoViewHolder2(view);
    }

    @Override
    public void onBindViewHolder(ProjetosAdapter2.ProjetoViewHolder2 holder, int position)
    {
        holder.bindProjeto(projetos.get(position));
    }

    @Override
    public int getItemCount()
    {
        return projetos.size();
    }

    public class ProjetoViewHolder2 extends RecyclerView.ViewHolder implements View.OnClickListener
    {
        public TextView nomeProjetoLinha;
        private Context mContext;

        public ProjetoViewHolder2(View itemView)
        {
            super(itemView);

            mContext = itemView.getContext();

            nomeProjetoLinha = (TextView) itemView.findViewById(R.id.nomeDoProjetoLista);

            itemView.setOnClickListener(this);
        }

        public void bindProjeto(Projetos projetos)
        {
            nomeProjetoLinha.setText(projetos.getNomeProjeto());
        }

        @Override
        public void onClick(View v)
        {
            int itemPosition = getLayoutPosition();

            Intent intent = new Intent(mContext, EncontrarGrupo.class);

            intent.putExtra("position", itemPosition + "");
            intent.putExtra("nomeProjeto", nomeProjetoLinha + "");

            mContext.startActivity(intent);
        }
    }
}