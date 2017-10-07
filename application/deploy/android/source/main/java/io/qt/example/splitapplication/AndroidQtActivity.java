package io.qt.example.splitapplication;

import android.os.Build;
import android.os.Bundle;
import android.support.annotation.Keep;
import android.view.View;
import android.view.View.OnSystemUiVisibilityChangeListener;

import org.qtproject.qt5.android.bindings.QtActivity;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class AndroidQtActivity extends QtActivity {

    // Activity

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        enterFullscreenMode();

        initSystemUiVisibilityListener();
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);

        enterFullscreenMode();
    }

    // Called from C++

    @Keep // nativeCall
    @SuppressWarnings("unused")
    public byte[] nativeCallLoadRccResource(String resourceName) {
        int resourceId = getResources().getIdentifier(resourceName, "raw", getPackageName());
        if (resourceId == 0) {
            return new byte[0];
        }

        InputStream inputStream = getResources().openRawResource(resourceId);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        int size;
        byte[] buffer = new byte[1024];
        try {
            while ((size = inputStream.read(buffer, 0, 1024)) >= 0) {
                outputStream.write(buffer, 0, size);
            }

            inputStream.close();
        } catch (IOException exception) {
            return new byte[0];
        }

        return outputStream.toByteArray();
    }

    // Private

    private void initSystemUiVisibilityListener() {
        if (Build.VERSION.SDK_INT >= 19) {
            getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new OnSystemUiVisibilityChangeListener() {
                    @Override public void onSystemUiVisibilityChange(int visibility) {
                        if (visibility == 0) {
                            enterFullscreenMode();
                        }
                    }
                }
            );
        }
    }

    private void enterFullscreenMode() {
        if (Build.VERSION.SDK_INT >= 19) {
            int uiVisibility =  View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                | View.SYSTEM_UI_FLAG_FULLSCREEN;

            getWindow().getDecorView().setSystemUiVisibility(uiVisibility);
        }
    }
}
