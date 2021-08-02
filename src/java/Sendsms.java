/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import static java.lang.System.out;
import java.net.HttpURLConnection;
import java.net.URL;

public class Sendsms{
public static void main(String[] args) {
         
        try {
            // Construct data
            String apiKey = "apikey=" + "NTg3MTZhNGUzMzcwNDkzMTdhNzk1MzRiNzI0ZDMzNzM=";
            String message = "&message=" + "Greetings from Dr.Kapil Kochhar's Clinic! Have a nice day!";
//            String sender = "&sender=" + "TXTLCL";
            String numbers = "&numbers=" + "8120573575";
 
            // Send data
            HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
            String data = apiKey + numbers + message;
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
            conn.getOutputStream().write(data.getBytes("UTF-8"));
             
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuffer stringBuffer = new StringBuffer();
            String line;
            while ((line = rd.readLine()) != null) {
                stringBuffer.append(line).append("\n");
            }
            System.out.println(stringBuffer.toString());
            out.println("success");
            rd.close();
 
 
        } catch (Exception e) {
           e.printStackTrace();
        }
}
}