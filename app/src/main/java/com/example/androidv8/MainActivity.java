package com.example.androidv8;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import com.eclipsesource.v8.JavaCallback;
import com.eclipsesource.v8.V8;
import com.eclipsesource.v8.V8Array;
import com.eclipsesource.v8.V8Object;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Example of a call to a native method
        TextView tv = findViewById(R.id.sample_text);
        tv.setText(V8.getV8Version());
        Log.d( "androidV8",V8.getV8Version());
        V8 runtime = V8.createV8Runtime();

        int result = runtime.executeIntegerScript(""
                + "var hello = 'hello, ';\n"
                + "var world = 'world!';\n"
                + "hello.concat(world).length;\n");
        Log.d("androidV8","Test：JS result = "+result);
        Log.d("androidV8","let foo = (a=1)=>++a;foo(10)--->"+runtime.executeScript("let foo = (a=1)=>++a;foo(10);"));
        ///Log.d("androidV8",runtime.executeObjectScript("function a(){}"));
        runtime.registerJavaMethod(new JavaCallback(){
            @Override
            public Object invoke(V8Object receiver, V8Array parameters) {
                return "ddd66";
            }
        },"javafoo");
        Log.d("androidV8","javafoo："+runtime.executeScript("javafoo()"));
        runtime.close();

    }


}
