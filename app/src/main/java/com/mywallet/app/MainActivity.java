package com.mywallet.app;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText nomP, apP, correoP, passP;
    ListView listViewPersonas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        nomP = findViewById(R.id.txt_nombrePersona);
        apP = findViewById(R.id.txt_apellidoPersona);
        correoP = findViewById(R.id.txt_correoPersona);
        passP = findViewById(R.id.txt_passwordPersona);

        listViewPersonas = findViewById(R.id.lv_datosPersona);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        String nombre = nomP.getText().toString();
        String correo = correoP.getText().toString();
        String password = passP.getText().toString();
        String apellido = apP.getText().toString();
        switch (item.getItemId()){
            case R.id.icon_add:{
                if (nombre.equals("") || correo.equals("") || apellido.equals("") || password.equals("")){
                    validacion();
                    break;
                }
                else {
                    Toast.makeText(this, "Agregar", Toast.LENGTH_SHORT).show();
                    limpiarCajas();
                    break;
                }

            }
            case R.id.icon_delete:{
                Toast.makeText(this, "Eliminar", Toast.LENGTH_SHORT).show();
                break;
            }
            case R.id.icon_save:{
                Toast.makeText(this, "Guardar", Toast.LENGTH_SHORT).show();
                break;
            }
            default:break;
        }
        return true;
    }

    private void limpiarCajas() {
        nomP.setText("");
        apP.setText("");
        passP.setText("");
        correoP.setText("");
    }

    private void validacion() {
        String nombre = nomP.getText().toString();
        String correo = correoP.getText().toString();
        String password = passP.getText().toString();
        String apellido = apP.getText().toString();

        if (nombre.equals("")){
            nomP.setError("Required");
        }
        else if (correo.equals("")){
            correoP.setError("Required");
        }
        else if (password.equals("")){
            passP.setError("Required");
        }
        else if (apellido.equals("")){
            apP.setError("Required");
        }
    }
}