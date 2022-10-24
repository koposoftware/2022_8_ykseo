package kr.ac.kopo.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.util.HttpUtil;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:coolsms.properties")
@PropertySource("classpath:hanabank.properties")
public class CertifyService {

	@Value("${key}")
	private String apiKey;
	
	private final MemberDAO memberDAO;
	private final AccountDAO accountDAO;

	public Map<String, String> cerificationWithIdCard(String file) {
		StringBuffer response = OCRGeneralAPI(file);
		System.out.println(response);

		JSONObject jObject = new JSONObject(response);

		JSONArray imagesArr = jObject.getJSONArray("images");

		JSONObject images = imagesArr.getJSONObject(0);
		String inferResult = images.getString("inferResult");

		Map<String, String> map = new HashMap<>();

		if (inferResult.equals("SUCCESS")) {
			JSONArray fields = images.getJSONArray("fields");

			JSONObject typeObj = fields.getJSONObject(0);
			String type = typeObj.getString("inferText");

			if (type.equals("주민등록증")) {

				JSONObject field = fields.getJSONObject(1);
				String name = field.getString("inferText");
				name = name.substring(0, name.length() - 2);
				map.put("name", name);

				field = fields.getJSONObject(2);
				String regNo = field.getString("inferText");
				String[] regNoSplit = regNo.split("-");
				map.put("regNoFront", regNoSplit[0]);
				map.put("regNoBack", regNoSplit[1]);

				field = fields.getJSONObject(fields.length() - 5);
				String year = field.getString("inferText");
				year = year.substring(0, 4);
				map.put("year", year);

				field = fields.getJSONObject(fields.length() - 4);
				String month = field.getString("inferText");
				month = month.substring(0, month.length() - 1);
				map.put("month", month);

				field = fields.getJSONObject(fields.length() - 3);
				String day = field.getString("inferText");
				day = day.substring(0, 2);
				map.put("day", day);

				System.out.println(name + " " + regNo + " " + year + " " + month + " " + day);
			}
		}

		return map;
	}

	@SuppressWarnings("unused")
	private StringBuffer OCRGeneralAPI(String imgFile) {
		String apiURL = "https://0to11bhce4.apigw.ntruss.com/custom/v1/17894/7f29e4995c4711d94706c2f1f04f02cee7635733e0ce11a0a985f7f3221af2ca/general";
		String secretKey = "WkdVaFVJQmRKc1NLTXNFUkV2SVF6S3NCYkd2YkhHdnA=";
		String imageFile = imgFile;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			return response;
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

	public AccountVO createDepositAccount(MemberVO user, String password) {
		// 유저의 자세한 정보 가져오기
		MemberVO memberVO = memberDAO.selectAllINfoById(user.getId());
		// account 정보 채우기
		AccountVO accountVO = new AccountVO();
		accountVO.setPassword(password);
		accountVO.setMemberId(user.getId());
		accountVO.setName(user.getName() + "님의 예치금 계좌");
		accountVO.setTypeCode("2"); // 2는 예치금 계좌

		// api request 보내기
		String url = "http://13.209.81.235/HanaBank/account/creation";

		JSONObject param = new JSONObject();
		param.put("apiKey", apiKey);
		param.put("user",  new JSONObject(memberVO));
		param.put("account", new JSONObject(accountVO));
		System.out.println(param);
		
		JSONObject jsonObject = HttpUtil.callApiExceptGet(url, param, "POST");
		
		// JSONOject 파싱
		Gson gson = new Gson();
		JSONObject data = jsonObject.getJSONObject("data");
		AccountVO newAccount = gson.fromJson(data.toString(), AccountVO.class);
		newAccount.setMemberId(user.getId());
		
		// newAccount 저장
		accountDAO.insert(newAccount);
		
		return newAccount;
	}
	
}
