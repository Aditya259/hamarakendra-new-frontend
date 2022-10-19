package com.hamara.kendra.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hamara.kendra.model.BookingServicesDetails;
import com.hamara.kendra.repo.AddAdminMenuRepo;
import com.hamara.kendra.repo.AddAdminSubMenuRepo;
import com.hamara.kendra.repo.BookingServiceDetailsRepo;
import com.hamara.kendra.utils.Constants;

@Controller
public class AdminController {

	@Autowired
	AddAdminMenuRepo addAdminMenuRepo;

	@Autowired
	AddAdminSubMenuRepo addAdminSubMenuRepo;

	@Autowired
	BookingServiceDetailsRepo bookingServiceDetailsRepo;

	@RequestMapping("admin")
	public String getIndex() {
		return "admin/login";
	}

	@RequestMapping("admin/listServices")
	public String getListServices(ModelMap modelMap) {
		List<BookingServicesDetails> bookingService = bookingServiceDetailsRepo.findAll();
		modelMap.put("listServices", bookingService);
		return "admin/listOfService";
	}

	@RequestMapping("admin/getDataToUpdate")
	public String getDataToUpdate(@RequestParam("id") String id, ModelMap modelMap) {
		Optional<BookingServicesDetails> bookingService = bookingServiceDetailsRepo.findById(Integer.parseInt(id));
		modelMap.put("bookingService", bookingService.get());
		return "admin/getDataToUpdate";
	}

	@PostMapping("admin/adminLogin")
	public String adminLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) {
		if (email.equals("admin") && password.equals("admin")) {
			return "admin/dashboard";
		}
		modelMap.put("msg", "Invalid Credentials");
		return "admin/login";
	}

	@PostMapping("admin/addAdminMenu")
	public String addAdminMenu(@RequestParam("menu") String menu, ModelMap modelMap) {
		return "admin/addAdminMenu";
	}

	@PostMapping("admin/addAdminSubMenuRepo")
	public String addAdminSubMenuRepo(@RequestParam("menuId") String menuId, @RequestParam("subMenu") String subMenu,
			ModelMap modelMap) {
		return "admin/addAdminSubMenuRepo";
	}

	@PostMapping("admin/updateBookingServiceDetails")
	public String insertServiceMappedServie(@RequestParam("urlName") String urlName,
			@RequestParam("heading") String heading, @RequestParam("description1") String description1,
			@RequestParam("id") String id, ModelMap modelMap) {
		Optional<BookingServicesDetails> bookingService = bookingServiceDetailsRepo.findById(Integer.parseInt(id));
		BookingServicesDetails bookingServicesDetails = new BookingServicesDetails();
		bookingServicesDetails.setUrlName(bookingService.get().getUrlName());
		bookingServicesDetails.setHeading(heading);
		bookingServicesDetails.setDescription1(description1);
		bookingServicesDetails.setId(bookingService.get().getId());
		bookingServiceDetailsRepo.save(bookingServicesDetails);
		modelMap.put("msg", "success");
		modelMap.put("msgRes", "true");
		modelMap.put("bookingService", bookingService.get());
		return "admin/getDataToUpdate";
	}

	@PostMapping("/getLocation")
	public ResponseEntity<Map> getCurrentLocation(@RequestParam("lat") String lat, @RequestParam("lng") String lng)
			throws IOException {
		Map m = new HashMap();
		Map<String, String> respMap = new HashMap<String, String>();
		JSONObject jObj = getLocation(lng, lat);
		m.put(Constants.status, true);
		m.put(Constants.message, "Success");
		respMap.put("country", jObj.get("country").toString());
		respMap.put("city", jObj.get("city").toString());
		if (jObj.has("postcode")) {
			respMap.put("postcode", jObj.get("postcode").toString());
		}
		respMap.put("state", jObj.get("state").toString());
		respMap.put("country_code", jObj.get("country_code").toString());
		String str = jObj.get("subArea1").toString().replaceAll("\\[", "").replaceAll("\\]", "");
		str = str.replaceAll("^\"|\"$", "");
		respMap.put("subArea1", str);
		m.put(Constants.data, respMap);
		return new ResponseEntity<Map>(m, HttpStatus.OK);
	}

	private JSONObject getLocation(String lng, String lat) throws IOException {
		JSONObject json = null;
		URL url = new URL("https://api.geoapify.com/v1/geocode/reverse?lat=" + lat + "&lon=" + lng
				+ "&apiKey=e368e9248544414fa646e3d12edf4064");
		HttpURLConnection http = (HttpURLConnection) url.openConnection();
		http.setRequestProperty("Accept", "application/json");
		BufferedReader br = null;
		if (http.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(http.getInputStream()));
			String strCurrentLine;
			while ((strCurrentLine = br.readLine()) != null) {
				json = new JSONObject(strCurrentLine);
			}
		} else {
			br = new BufferedReader(new InputStreamReader(http.getErrorStream()));
			String strCurrentLine;
			while ((strCurrentLine = br.readLine()) != null) {
			
			}
		}
		http.disconnect();
		JSONArray features = json.getJSONArray("features");
		JSONObject jsonObj = ((JSONObject) features.get(0)).getJSONObject("properties");
		String subArea = (String) jsonObj.get("formatted");
		jsonObj.append("subArea1", subArea);
		return jsonObj;
	}

}
