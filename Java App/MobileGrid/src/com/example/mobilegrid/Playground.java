package com.example.mobilegrid;

import java.io.*;

import android.app.Activity;
import android.os.*;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.*;
import android.widget.*;


public class Playground extends AsyncTask<Object, String, String> {
	TextView textView;
	String lastPut = "";
	
	Playground(TextView textView) {
		this.textView = textView;
	}

	static public String get_job(String host, int port, String file) {
		URL url;
		HttpURLConnection conn;
		BufferedReader rd;
		String line;
		String result = "";
		try {
			url = new URL("http", host, port, file);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.addRequestProperty("Content-Type", "application/json");
			rd = new BufferedReader(
					new InputStreamReader(conn.getInputStream()));
			while ((line = rd.readLine()) != null) {
				result += line;
			}
			rd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	static public String put_job(String host, int port, String file, String payload) {
		URL url;
		HttpURLConnection conn;
		try {
			url = new URL("http", host, port, file);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("PUT");
			conn.addRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);
			OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream());
			out.write(payload);
			out.close();
			conn.connect();
			return "success"+"\n" + url + "\n"+conn.getResponseCode()+ " "+conn.getResponseMessage();
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	static public boolean isPrime(Double n) {
		// check if n is a multiple of 2
		if (n % 2 == 0)
			return false;
		// if not, then just check the odds
		for (int i = 3; i * i <= n; i += 2) {
			if (n % i == 0)
				return false;
		}
		return true;
	}

	static public HashMap parse(String json) {
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<String, String>();
		return (HashMap) gson.fromJson(json, map.getClass());
	}

	protected String doInBackground(Object... params) {
		String s;
		while (((s = get_job("192.168.2.2", 3000, "/get/4.json")).length() > 3)) {
			HashMap map = parse(s);
			Double d = (Double) map.get("id");
			String[] data = ((String) map.get("data")).split(",");
			//System.out.println(d.intValue());
			//System.out.println(map.get("created_at"));
			//System.out.println(map.get("data"));
			Double t = Simpson.integrate(Double.parseDouble(data[0]), Double.parseDouble(data[1]));
			String result = "{\"job\":{\"result\":\""+String.valueOf(t)+"\",\"error\":\"0\"}}";
			 publishProgress(put_job("192.168.2.2", 3000, "/jobs/" + d.intValue(), result));
		}
		return "end";
	}
	
    protected void onProgressUpdate(String... progress) {
        textView.append(progress[0]);
    }
    
	 protected void onPostExecute(String result) {
		 textView.append("Done!");
     }
}
