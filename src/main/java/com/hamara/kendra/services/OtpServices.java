package com.hamara.kendra.services;

import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;

@Service
public class OtpServices {

	public void generateAndSendOtp(String mobileNo, String otp) throws IOException, InterruptedException {
		String apiKey = "5611CBF73BEE31";
		String contacts = "97656XXXXX,98012XXXXX";
		String from = "DEMO";
		String smsText = "Hello People, have a great day";

		String apiUrl = "http://jskbulkmarketing.in/app/smsapi/index.php?key=5611CBF73BEE31&campaign=1&routeid=46"
				+ "&type=text&contacts=" + mobileNo + "&senderid=SHRAVT&msg=" + otp
				+ "&template_id=1207164137781293237";

		HttpClient client = HttpClient.newHttpClient();
		try {
			URL url = new URL(apiUrl);
			String nullFragment = null;
			URI uri = new URI(url.getProtocol(), url.getHost(), url.getPath(), url.getQuery(), nullFragment);
			System.out.println("URI " + uri.toString() + " is OK");
			HttpRequest request = HttpRequest.newBuilder().uri(uri).build();

			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

			System.out.println(response.body());
		} catch (MalformedURLException e) {
			System.out.println("URL " + apiUrl + " is a malformed URL");
		} catch (URISyntaxException e) {
			System.out.println("URI " + apiUrl + " is a malformed URL");
		}

	}

	public static void main(String[] args) throws IOException, InterruptedException {

		String apiKey = "5611CBF73BEE31";
		String contacts = "9359381611";
		String from = "DEMO";
		String smsText = "Hello People have a great day";

		/*
		 * String apiUrl = "http://jskbulkmarketing.in/app/smsapi/index.php?key="
		 * +apiKey+"&campaign=1&routeid=47&type=text&contacts="
		 * +contacts+"&senderid="+from+"&msg="+smsText;
		 */

		/*
		 * String apiUrl =
		 * "http://jskbulkmarketing.in/app/smsapi/index.php?key=5611CBF73BEE31" +
		 * "&campaign=1&routeid=14&type=text&contacts=9359381611&senderid=SHRAVT" +
		 * "&msg=Hello+People%2C+have+a+great+day&template_id=1207164137781293237";
		 */
		String apiUrl = "http://jskbulkmarketing.in/app/smsapi/index.php?key=5611CBF73BEE31&campaign=1&routeid=46&type=text&contacts=9359381611&senderid=SHRAVT&msg=hi&template_id=1207164137781293237";

		HttpClient client = HttpClient.newHttpClient();
		try {
			URL url = new URL(apiUrl);
			String nullFragment = null;
			URI uri = new URI(url.getProtocol(), url.getHost(), url.getPath(), url.getQuery(), nullFragment);
			System.out.println("URI " + uri.toString() + " is OK");
			HttpRequest request = HttpRequest.newBuilder().uri(uri).build();

			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

			System.out.println(response.body());
		} catch (MalformedURLException e) {
			System.out.println("URL " + apiUrl + " is a malformed URL");
		} catch (URISyntaxException e) {
			System.out.println("URI " + apiUrl + " is a malformed URL");
		}

	}

}
