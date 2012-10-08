package it.geosolutions.fra2015.webapp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HttpRequestToolkit {

    private final static Logger log = Logger.getLogger(HttpRequestToolkit.class.getName());

    public static String doGetRequest(String host, Map<String, String> params) {

        StringBuilder response = new StringBuilder();

        StringBuilder request = new StringBuilder();

        try {

            if (params != null && !params.isEmpty()) {

                char separator = '?';

                for (String key : params.keySet()) {

                    String value = params.get(key);

                    request.append(separator);

                    separator = '&';

                    if (value != null) {
                        request.append(URLEncoder.encode(key, "UTF-8"));
                        request.append("=").append(URLEncoder.encode(value, "UTF-8"));
                    }

                }

            }

            URL url = new URL(host + request.toString());

            log.log(Level.INFO, "fetching page:{0}", new Object[]{url.toString()});

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("GET");

            Scanner scanner = new Scanner(conn.getInputStream());

            try {
                while (scanner.hasNext()) {
                    response.append(scanner.nextLine());
                }
            } finally {
                scanner.close();
            }

        } catch (IOException ex) {
            Logger.getLogger(HttpRequestToolkit.class.getName()).log(Level.SEVERE, null, ex);
        }


        return response.toString();
    }

    public static String doPostRequest(String urlstring, String data) throws Exception {

        URL url = new URL(urlstring);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setUseCaches(false);
        conn.setAllowUserInteraction(false);
        conn.setRequestProperty("Content-type", "text/xml; charset=UTF-8");

        BufferedReader rd = null;
        OutputStreamWriter wr = null;
        String line = null;
        try {

            wr = new OutputStreamWriter(conn.getOutputStream());

            wr.write(data);
            wr.flush();

            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            StringBuilder sb = new StringBuilder();

            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }

            return sb.toString();

        } finally {

            if (wr != null) {
                wr.close();
            }

            if (rd != null) {
                rd.close();
            }
        }
    }

    public static String doPostRequest(String urlstring, Map<String, String> params) throws Exception {

        StringBuilder data = new StringBuilder();

        if (params != null && !params.isEmpty()) {

            String separator = "";

            for (String key : params.keySet()) {

                data.append(separator);
                separator = "&";
                data.append(URLEncoder.encode(key, "UTF-8"));
                data.append("=");
                data.append(URLEncoder.encode(params.get(key), "UTF-8"));

            }

        }

        return doPostRequest(urlstring, data.toString());


    }

    /**
     * Reads data from the data reader and posts it to a server via POST request.
     * data - The data you want to send
     * endpoint - The server's address
     * output - writes the server's response to output
     * @throws Exception
     */
    public static void postData(Reader data, URL endpoint, Writer output) throws Exception {

        HttpURLConnection urlc = null;
        try {
            urlc = (HttpURLConnection) endpoint.openConnection();
            urlc.setRequestMethod("POST");
            urlc.setDoOutput(true);
            urlc.setDoInput(true);
            urlc.setUseCaches(false);
            urlc.setAllowUserInteraction(false);
            urlc.setRequestProperty("Content-type", "text/xml; charset=UTF-8");
            OutputStream out = urlc.getOutputStream();
            try {
                Writer writer = new OutputStreamWriter(out, "UTF-8");
                pipe(data, writer);
                writer.close();
            } finally {
                out.close();
            }
            InputStream in = urlc.getInputStream();
            try {
                Reader reader = new InputStreamReader(in);
                pipe(reader, output);
                reader.close();
            } finally {
                in.close();
            }
        } catch (IOException e) {
            throw new Exception("Connection error (is server running at " + endpoint + " ?): " + e);
        } finally {
            if (urlc != null) {
                urlc.disconnect();
            }
        }
    }

    /**
     * Pipes everything from the reader to the writer via a buffer
     */
    private static void pipe(Reader reader, Writer writer) throws IOException {
        char[] buf = new char[1024];
        int read = 0;
        while ((read = reader.read(buf)) >= 0) {
            writer.write(buf, 0, read);
        }
        writer.flush();
    }

    public static void main(String[] args) {
        try {

            HashMap<String, String> params = new HashMap<String, String>();

            params.put("var1", "pippo");
            params.put("var2", "topolino");
            String result = doPostRequest("http://localhost:8080/easyCom-war/home.action", params);

            System.out.println(result);
        } catch (Exception ex) {
            Logger.getLogger(HttpRequestToolkit.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
