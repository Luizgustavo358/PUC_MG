package com.luizgbraganca.avante123;


import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import com.luizgbraganca.avante123.database.models.User;

public class Register extends AppCompatActivity implements View.OnClickListener{
    private static final String TAG = "Register";

    private FirebaseAuth mAuth;
    private FirebaseAuth.AuthStateListener mAuthListener;

    private EditText mEmailField;
    private EditText mPasswdField;
    private Button mSignButton;
    private DatabaseReference mDatabase;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        mDatabase = FirebaseDatabase.getInstance().getReference();

        mAuth = FirebaseAuth.getInstance();
        mAuth.signOut();

        mEmailField = (EditText) findViewById(R.id.register_email);
        mPasswdField = (EditText) findViewById(R.id.register_passwd);
        mSignButton = (Button) findViewById(R.id.register_sign_in_button);

        mSignButton.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        int i = v.getId();
        if (i ==  R.id.register_sign_in_button) {
            signIn();
        }
    }
    @Override
    public void onStart() {
        super.onStart();

        // Check auth on Activity start
        if (mAuth.getCurrentUser() != null) {
            onAuthSuccess(mAuth.getCurrentUser());
        }
    }
    @Override
    public void onStop() {
        super.onStop();
        if (mAuthListener != null) {
            mAuth.removeAuthStateListener(mAuthListener);
        }
    }

    private void signIn() {
        Log.d(TAG, "SignIn");

        if(!validateForm()) {
            return;
        }


        String email = mEmailField.getText().toString();
        String passwd = mPasswdField.getText().toString();

        mAuth.createUserWithEmailAndPassword(email, passwd)
                .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        Log.d(TAG, "createUser:onComplete:" + task.isSuccessful());

                        if (task.isSuccessful()) {
                            onAuthSuccess(task.getResult().getUser());
                        } else {
                            Toast.makeText(Register.this, "Sign Up Failed",
                                    Toast.LENGTH_SHORT).show();
                        }
                    }
                });

    }

    private void writeNewUser(String userId, String name, String email){
        User user = new User(name, email);

        mDatabase.child("users").child(userId).setValue(user);
    }

    private void onAuthSuccess(FirebaseUser user) {
        String username = usernameFromEmail(user.getEmail());

        writeNewUser(user.getUid(), username, user.getEmail());

        startActivity(new Intent(Register.this, MainActivity.class));
    }

    private String usernameFromEmail(String email) {
        if (email.contains("@")) {
            return email.split("@")[0];
        } else {
            return email;
        }
    }

    private boolean validateForm(){
        boolean result = true;
        View focusView = null;

        // testa se o email e' valido
        if(TextUtils.isEmpty(mEmailField.getText().toString())){
            mEmailField.setError(getString(R.string.error_field_required));
            result = false;
            focusView = mEmailField;
        } else if (!isEmailValid(mEmailField.getText().toString())) {
            mEmailField.setError(getString(R.string.error_invalid_email));
            focusView = mEmailField;
            result = false;
        }else {
            mEmailField.setError(null);
        }

        // testa se a senha e' valida
        if(TextUtils.isEmpty(mPasswdField.getText().toString())
                && !isPasswordValid(mEmailField.getText().toString())){
            mPasswdField.setError(getString(R.string.error_invalid_password));
            TextView tv = (TextView) findViewById(R.id.err);
            tv.setText("Invalido");
            result = false;
        }

        if (focusView != null) {
            focusView.requestFocus();
        }
        return result;
    }

    private boolean isPasswordValid(String password) {
        //TODO: Replace this with your own logic
        return password.length() > 6;
    }
    private boolean isEmailValid(String email) {
        boolean valid = false;

        if(email.contains("@") && !email.contains(" ")){
            valid = true;
        }
        //TODO: Replace this with your own logic
        return valid;
    }
}
