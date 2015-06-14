package costansin.antiantiplagiat20;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.lamerman.FileDialog;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Main extends ActionBarActivity {

    boolean doc_chosen;
    final int REQUEST_SAVE=1234;
    final int REQUEST_LOAD=532;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        doc_chosen = false;
    }

    public void attachClick(View v){
        // Create the ACTION_GET_CONTENT Intent
        Intent intent = new Intent(getBaseContext(), FileDialog.class);
        intent.putExtra(FileDialog.START_PATH, "/sdcard");

        //can user select directories or not
        intent.putExtra(FileDialog.CAN_SELECT_DIR, true);

        //alternatively you can set file filter
        //intent.putExtra(FileDialog.FORMAT_FILTER, new String[] { "png" });

        startActivityForResult(intent, REQUEST_SAVE);
    }

    public synchronized void onActivityResult(final int requestCode,
                                              int resultCode, final Intent data) {

        if (resultCode == Activity.RESULT_OK) {

            if (requestCode == REQUEST_SAVE) {
                System.out.println("Saving...");
            } else if (requestCode == REQUEST_LOAD) {
                System.out.println("Loading...");
            }

            String filePath = data.getStringExtra(FileDialog.RESULT_PATH);

        } else if (resultCode == Activity.RESULT_CANCELED) {
            //Logger.getLogger(AccelerationChartRun.class.getName()).log(
            //        Level.WARNING, "file not selected");
        }

    }

    public void sendClick(View v){
        EditText userName = (EditText) findViewById(R.id.editText);
        EditText userTelephone = (EditText) findViewById(R.id.editText2);
        Button attachbtn = (Button) findViewById(R.id.attachButton);

        if( userName.getText().toString().trim().equals("")){
            userName.setError( "Введите имя" );
            //You can Toast a message here that the Username is Empty
        }
        else if( userTelephone.getText().toString().trim().length()<5){
            userTelephone.setError( "Введите телефон" );
        }
        else if (!(doc_chosen)){
            attachbtn.setTextColor(Color.RED);
        }
        else {
            attachbtn.setTextColor(Color.BLACK);
            //Intent i = new Intent(getApplicationContext(), Login.class);
            //startActivity(i);
        }
    }

}