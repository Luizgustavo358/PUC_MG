package com.luizgbraganca.avante123;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

/**
 * Created by luiz on 06/06/17.
 */

public class UserListViewHolder extends RecyclerView.ViewHolder
{
    private final View mView;
    private static final int POST_TEXT_MAX_LINES = 6;
    private TextView userProjetoViewHolder;
    private TextView userDescricaoViewHolder;
    private UserClickListener mListener;

    public UserListViewHolder(View itemView)
    {
        super(itemView);

        mView = itemView;
        userProjetoViewHolder = (TextView) mView.findViewById(R.id.nomeProjetoLista);
        userDescricaoViewHolder = (TextView) mView.findViewById(R.id.descricaoLista);

        mView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mListener.onUserClick();
            }
        });
    }

    public void setPostClickListener(UserClickListener listener) {
        mListener = listener;
    }


    public void setText(final String text)
    {
        if (text == null || text.isEmpty())
        {
            userProjetoViewHolder.setVisibility(View.GONE);
            userDescricaoViewHolder.setVisibility(View.GONE);
            return;
        }
        else
        {
            userProjetoViewHolder.setVisibility(View.VISIBLE);
            userProjetoViewHolder.setText(text);
            userProjetoViewHolder.setMaxLines(POST_TEXT_MAX_LINES);
            userDescricaoViewHolder.setVisibility(View.VISIBLE);
            userDescricaoViewHolder.setText(text);
            userDescricaoViewHolder.setMaxLines(POST_TEXT_MAX_LINES);
        }
    }

    public interface UserClickListener {
        void onUserClick();
    }
}