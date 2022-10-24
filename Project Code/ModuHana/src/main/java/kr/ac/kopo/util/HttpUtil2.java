package kr.ac.kopo.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;

public class HttpUtil2 {

	public static JSONObject callApi(String arriveUrl, JSONObject params, String type) {

		HttpURLConnection conn = null;
		JSONObject responseJson = null;

		try {
			// URL 설정
			URL url = new URL(arriveUrl);

			conn = (HttpURLConnection) url.openConnection();

			// type의 경우 POST, GET, PUT, DELETE 가능
			conn.setRequestMethod(type);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Transfer-Encoding", "chunked");
			conn.setRequestProperty("Connection", "keep-alive");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			// 데이터를 STRING으로 변경
			bw.write(params.toString());
			bw.flush();
			bw.close();

			// 보내고 결과값 받기
			int responseCode = conn.getResponseCode();

			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = "";
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}

				// 응답 데이터
				if(sb != null && sb.length() != 0) {
					System.out.println("responseJson:: " + sb.toString());
					responseJson = new JSONObject(sb.toString());
				}

				return responseJson;
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			System.out.println("not JSON Format response");
			e.printStackTrace();
		}

		return null;
	}
}
