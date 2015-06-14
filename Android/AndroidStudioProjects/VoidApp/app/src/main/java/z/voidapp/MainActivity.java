package z.voidapp;

import android.content.Context;
import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class MainActivity extends ActionBarActivity {

    final int CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE = 100;
    final int CAPTURE_SEND_ACTIVITY_REQUEST_CODE = 200;
    Uri fileUri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
        ImageActivity();
    }

    public Uri ImageActivity(){//View v){
        // create Intent to take a picture and return control to the calling application
        /*Geocoder gCoder = new Geocoder(this);
        try {
            List<Address> addresses = gCoder.getFromLocation(123456789, 123456789, 1);
            if (addresses.size() > 0) {
                //Toast.makeText(this, "country: " + addresses.get(0).getCountryName(), Toast.LENGTH_LONG).show();
            }
        }
        catch (Exception e) {}
        */Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        fileUri = getOutputMediaFileUri(MEDIA_TYPE_IMAGE); // create a file to save the image
        intent.putExtra(MediaStore.EXTRA_OUTPUT, fileUri); // set the image file name
        // start the image capture Intent
        startActivityForResult(intent, CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE);
        return fileUri;
    }

    public void SendActivity(){
        /*
        //File F = new File("sdcard/DCIM/camera/IMG_20150220_052643.jpg");
        //Uri U = Uri.fromFile(F);
        Intent i = new Intent(Intent.ACTION_SEND);
        i.setType("image/jpg");
        //i.setType("text/plain");
        i.putExtra(Intent.EXTRA_STREAM, fileUri);
        String[] recipients = new String[]{"vlasov046@mail.ru"}; //, "",
        i.putExtra(android.content.Intent.EXTRA_EMAIL, recipients);
        //i.putExtra(Intent.EXTRA_EMAIL, recipients);
        //i.putExtra(android.content.Intent.EXTRA_EMAIL,new String[] { "someone@gmail.com" });
        //i.putExtra(Intent.EXTRA_EMAIL, new String[]{"soro@gmail.com"});
        //i.setData(Uri.parse("mailto:soro@gmail.com"));
        i.putExtra(Intent.EXTRA_SUBJECT,"DONOS ULTRA");
        i.putExtra(Intent.EXTRA_TEXT,"GPS NETU");
        startActivityForResult(Intent.createChooser(i,"Email:"), CAPTURE_SEND_ACTIVITY_REQUEST_CODE);
        */
        try {
            Log.i("SendMail","Start");
            GMailSender sender = new GMailSender("donosultra@gmail.com", "androidisfuckingshit");
            sender.sendMail("This is Subject",
                    "This is Body",
                    "donosultra@gmail.com",
                    "sorotoritas3@gmail.com");

            Log.i("SendMail","End");
        } catch (Exception e) {
            Log.e("SendMail", e.getMessage(), e);
        }
    }

    public static final int MEDIA_TYPE_IMAGE = 1;
    public static final int MEDIA_TYPE_VIDEO = 2;

    /** Create a file Uri for saving an image or video */
    private static Uri getOutputMediaFileUri(int type){
        return Uri.fromFile(getOutputMediaFile(type));
    }

    /** Create a File for saving an image or video */
    private static File getOutputMediaFile(int type){
        // To be safe, you should check that the SDCard is mounted
        // using Environment.getExternalStorageState() before doing this.

        File mediaStorageDir = new File(Environment.getExternalStoragePublicDirectory(
                Environment.DIRECTORY_PICTURES), "DONOS ULTRA");
        // This location works best if you want the created images to be shared
        // between applications and persist after your app has been uninstalled.

        // Create the storage directory if it does not exist
        if (! mediaStorageDir.exists()){
            if (! mediaStorageDir.mkdirs()){
                Log.d("@string/app_name", "failed to create directory");
                return null;
            }
        }

        // Create a media file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        File mediaFile;
        if (type == MEDIA_TYPE_IMAGE){
            mediaFile = new File(mediaStorageDir.getPath() + File.separator +
                    "IMG_"+ timeStamp + ".jpg");
        } else if(type == MEDIA_TYPE_VIDEO) {
            mediaFile = new File(mediaStorageDir.getPath() + File.separator +
                    "VID_"+ timeStamp + ".mp4");
        } else {
            return null;
        }

        return mediaFile;
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch(requestCode) {
            case CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE:
                //you just got back from activity B - deal with resultCode
                //use data.getExtra(...) to retrieve the returned data
                SendActivity();
                break;
            case CAPTURE_SEND_ACTIVITY_REQUEST_CODE:
                //you just got back from activity C - deal with resultCode
                //onDestroy();
                break;
        }
    }
}
