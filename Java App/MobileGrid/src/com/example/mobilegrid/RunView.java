package com.example.mobilegrid;

import java.io.*;
import android.app.Activity;
import android.os.*;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.*;
import android.widget.TextView;
public class RunView extends Activity {


public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.runview);
		TextView textView = (TextView) findViewById(R.id.results);
		textView.append("Start!");
		new Playground(textView).execute();
		textView.append("Stop!");
	}	
}