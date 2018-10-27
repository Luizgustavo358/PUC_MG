package com.luizgbraganca.bancodedados;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by luiz on 12/05/17.
 */

public class LivroAdapter extends ArrayAdapter<Livro>
{
    private final Context context;
    private final ArrayList<Livro> elementos;

    public LivroAdapter(Context context, ArrayList<Livro> elementos)
    {
        super(context, R.layout.linha, elementos);

        this.context = context;
        this.elementos = elementos;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View rowView = inflater.inflate(R.layout.linha, parent, false);

        TextView titulo = (TextView) rowView.findViewById(R.id.txtNome);
        TextView autor  = (TextView) rowView.findViewById(R.id.txtAutor);
        TextView ano    = (TextView) rowView.findViewById(R.id.txtAno);

        titulo.setText(elementos.get(position).getTitulo());
        autor.setText(elementos.get(position).getAutor());
        ano.setText(Integer.toString(elementos.get(position).getAno()));

        return(rowView);
    }
}
