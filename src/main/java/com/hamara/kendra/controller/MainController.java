package com.hamara.kendra.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.hamara.kendra.model.BookedServices;
import com.hamara.kendra.model.BookingServicesDetails;
import com.hamara.kendra.model.ContactUs;
import com.hamara.kendra.model.FeedBack;
import com.hamara.kendra.model.FinalFeeStructure;
import com.hamara.kendra.model.User;
import com.hamara.kendra.repo.BookedServicesRepo;
import com.hamara.kendra.repo.BookingServiceDetailsRepo;
import com.hamara.kendra.repo.ContactUsRepo;
import com.hamara.kendra.repo.FeedbackRepo;
import com.hamara.kendra.repo.FinalFeeStructureRepo;
import com.hamara.kendra.repo.UserRepo;
import com.hamara.kendra.services.MailService;

@Controller
public class MainController {

	static String api_id = "API5YwmxE7C100099";

	static String api_password = "$2y$10$FobnjjjLaZhkiiSQIU6he.v/INB2swqCThEOogpo9D9HZigCl1mRm";

	static String sms_type = "Transactional";

	static String sms_encoding = "text";

	static String sender = "HAMKND";

	// static String number = "9359381611";

	static String template_id = "121569";

	static String newUrl = "https://www.bulksmsplans.com/api/send_sms";

	@Autowired
	BookingServiceDetailsRepo bookingServiceDetailsRepo;

	@Autowired
	UserRepo userRepo;

	@Autowired
	ContactUsRepo contactUsRepo;

	@Autowired
	BookedServicesRepo bookedServicesRepo;

	@Autowired
	FinalFeeStructureRepo finalFeeStructureRepo;

	@Autowired
	MailService mailService;

	@Autowired
	FeedbackRepo feedbackRepo;

	@Autowired
	RestTemplate restTemplate;

	@Value("${otpFlag}")
	private String otpFlag;

	public String getOtpFlag() {
		return otpFlag;
	}

	public static Map<String, String> otpMap;

	@RequestMapping("/")
	public String getIndex() {
		return "index";
	}

	@RequestMapping("bookappointment")
	public String bookappointment(@RequestParam("serv") String serv, ModelMap modelMap) {
		List<BookingServicesDetails> bookingService = bookingServiceDetailsRepo.findByurlName(serv);
		FinalFeeStructure finalFeeStructure = finalFeeStructureRepo.findByurlName(serv.replaceAll("\'", ""));
		modelMap.put("pageContent", bookingService);
		modelMap.put("finalFeeStructure", finalFeeStructure);
		return "bookingService";
	}

	@RequestMapping("aadharServices")
	public String aadharServices(@RequestParam("serv") String serv, ModelMap modelMap) {
		return "aadharServices";
	}

	@RequestMapping("aboutus")
	public String aboutus(ModelMap modelMap) {
		return "aboutus";
	}

	@RequestMapping("privacyPolicy")
	public String privacyPolicy(ModelMap modelMap) {
		return "privacyPolicy";
	}

	@RequestMapping("termsAndConditions")
	public String termsAndConditions(ModelMap modelMap) {
		return "termsAndConditions";
	}

	@RequestMapping("contactUs")
	public String contactUs(ModelMap modelMap) {
		return "contactUs";
	}

	@RequestMapping("RTOServices")
	public String RTOServices(@RequestParam("serv") String serv, ModelMap modelMap) {
		return "RTOServices";
	}

	@RequestMapping("passportServices")
	public String passportServices(@RequestParam("serv") String serv, ModelMap modelMap) {
		return "passportServices";
	}

	@RequestMapping("setuServices")
	public String setuServices(@RequestParam("serv") String serv, ModelMap modelMap) {
		return "setuServices";
	}

	@RequestMapping("pancardServies")
	public String pancardServies(@RequestParam("serv") String serv, ModelMap modelMap) {
		return "pancardServies";
	}

	@RequestMapping("bookingProceedToLogin")
	public String bookingProceedToLogin(@RequestParam("serv") String serv, ModelMap modelMap) {
		modelMap.put("serv", serv);
		return "bookingProceedToLogin";
	}

	@RequestMapping("forgotUserId")
	public String forgotUserId(ModelMap modelMap, @RequestParam("serv") String serv) {
		modelMap.put("serv", "forgotUserId");
		return "forgotUserId";
	}

	@RequestMapping("forgotPassword")
	public String forgotPassword(ModelMap modelMap, @RequestParam("serv") String serv) {
		modelMap.put("serv", "forgotPassword");
		return "forgotPassword";
	}

	@RequestMapping("signupNow")
	public String signupNow(ModelMap modelMap, @RequestParam("serv") String serv) {
		modelMap.put("serv", "signup");
		return "signup";
	}

	@RequestMapping("feedback")
	public String feedback(ModelMap modelMap) {
		modelMap.put("serv", "feedback");
		return "feedback";
	}

	@PostMapping("/submitFeedback")
	public String submitFeedback(@RequestParam("Q1") String Q1, @RequestParam("Q2") String Q2,
			@RequestParam("Q3") String Q3, ModelMap modelMap) {
		String rating = Q1;
		String employeeBehavior = Q2;
		String timeTakenToProvideService = Q3;
		FeedBack feedback = new FeedBack();
		feedback.setEmployeeBehavior(employeeBehavior);
		feedback.setRating(rating);
		feedback.setTimeTakenToProvideService(timeTakenToProvideService);
		feedbackRepo.save(feedback);
		modelMap.put("msg", "");
		modelMap.put("msgRes", "Thank you for your valuable feedback.");
		return "popup";
	}

	@PostMapping("/forgotUserIdRequest")
	public String forgotUserIdRequest(@RequestParam("emailOrMobile") String emailOrMobile,
			@RequestParam("serv") String serv, ModelMap modelMap) {
		User userByEmail = userRepo.findByCustEmail(emailOrMobile);
		if (userByEmail != null) {
			modelMap.put("name", userByEmail.getName());
			modelMap.put("serv", "forgotPasswordRequest");
			modelMap.put("msg", "success");
			modelMap.put("msgRes", "Your default password is send to your registered mobile number or on email ");
			return "popup";
		} else {
			User userByMobileNo = userRepo.findByCustMobileNo(emailOrMobile);
			if (userByMobileNo != null) {
				modelMap.put("name", userByMobileNo.getName());
				modelMap.put("serv", "forgotPasswordRequest");
				modelMap.put("msg", "success");
				modelMap.put("msgRes", "Your default password is send to your registered mobile number or on email ");
				return "popup";
			} else {
				modelMap.put("serv", "forgotPasswordRequest");
				modelMap.put("msgRes", "User Not Found,Kindly Register / Signup");
				modelMap.put("msg", "Error");
				return "popup";
			}
		}
	}

	@PostMapping("/forgotPasswordRequest")
	public String forgotPasswordRequest(@RequestParam("emailOrMobile") String emailOrMobile,
			@RequestParam("serv") String serv, ModelMap modelMap) {
		User userByEmail = userRepo.findByCustEmail(emailOrMobile);
		if (userByEmail != null) {
			modelMap.put("name", userByEmail.getName());
			modelMap.put("serv", "forgotPasswordRequest");
			modelMap.put("msg", "success");
			modelMap.put("msgRes", "Your default password is send to your registered mobile number or on email ");
			return "popup";
		} else {
			User userByMobileNo = userRepo.findByCustMobileNo(emailOrMobile);
			if (userByMobileNo != null) {
				modelMap.put("name", userByMobileNo.getName());
				modelMap.put("serv", "forgotPasswordRequest");
				modelMap.put("msg", "success");
				modelMap.put("msgRes", "Your default password is send to your registered mobile number or on email ");
				return "popup";
			} else {
				modelMap.put("serv", "forgotPasswordRequest");
				modelMap.put("msgRes", "User Not Found,Kindly Register / Signup");
				modelMap.put("msg", "Error");
				return "popup";
			}
		}

	}

	@PostMapping("/signup")
	public String signup(@RequestParam("email") String custEmail, @RequestParam("mobileno") String custMobile,
			@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("serv") String serv, ModelMap modelMap) {
		User user = null;
		User getUserDetails = new User();
		getUserDetails.setEmail(custEmail);
		getUserDetails.setMobileNo(custMobile);
		getUserDetails.setName(name);
		getUserDetails.setPassword(password);
		user = userRepo.save(getUserDetails);
		if (user != null) {
			modelMap.put("name", user.getName());
			modelMap.put("serv", "signup");
			modelMap.put("msg", "success");
			modelMap.put("msgRes", "Registration / Signup Successful You can now login for service booking");
			return "popup";
		} else {
			modelMap.put("serv", "signup");
			modelMap.put("msgRes", "Something Went Wrong.");
			modelMap.put("msg", "Error");
			return "popup";
		}
	}

	@PostMapping("/submitContactUsDetails")
	public String submitContactUsDetails(@RequestParam("fullName") String fullName,
			@RequestParam("subject") String subject, @RequestParam("description") String description,
			@RequestParam("mobileNo") String mobileNo, @RequestParam("emailId") String emailId, ModelMap modelMap) {
		ContactUs contactus = null;
		ContactUs contactUsObject = new ContactUs();
		contactUsObject.setDescription(description);
		contactUsObject.setEmailId(emailId);
		contactUsObject.setFullName(fullName);
		contactUsObject.setMobileNo(mobileNo);
		contactUsObject.setSubject(subject);
		contactus = contactUsRepo.save(contactUsObject);
		if (contactus != null) {
			modelMap.put("msg", "success");
			modelMap.put("msgRes", "Details submitted, We will get back to you soon");
			return "popup";
		} else {
			modelMap.put("msg", "success");
			modelMap.put("msg", "Something Went Wrong.Please try after some time");
			return "popup";
		}
	}

	@PostMapping("/submitDetails")
	public String saveDetails(@RequestParam("email") String custEmail, @RequestParam("mobileno") String custMobile,
			@RequestParam("serv") String serv, @RequestParam("password") String password, ModelMap modelMap)
			throws Exception {
		User user = null;
		if (custEmail != null && !custEmail.isEmpty()) {
			user = userRepo.findByCustEmail(custEmail);
		} else if (custMobile != null && !custMobile.isEmpty()) {
			user = userRepo.findByCustMobileNo(custMobile);
		}
		if (user != null) {
			// check by email and password
			if (custEmail != null && !custEmail.isEmpty()) {
				if (password != null && !password.isEmpty()) {
					if (custEmail.equals(user.getEmail()) && password.equals(user.getPassword())) {
						modelMap.put("custName", user.getName());
						modelMap.put("userName", user.getEmail());
						modelMap.put("serv", serv);
						modelMap.put("msg", "success");
						modelMap.put("serviceName", getServiceNameFromservUrl(serv));
						return "getDetails";
					}
				}
			} else if (custMobile != null && !custMobile.isEmpty()) {
				// else go to validate otp
				String otp;
				Random rnd = new Random();
				int number = rnd.nextInt(999999);
				otp = String.format("%06d", number);
				if (user.getMobileNo() != null && !user.getMobileNo().isEmpty()) {
					if(otpFlag.equals("enable")) {
						prepareUrlForSms(otp, user.getMobileNo());
					}else {
						otp = "123456";
					}
				}
				modelMap.put("name", user.getName());
				modelMap.put("mobileNo", user.getMobileNo());
				modelMap.put("lastdigit", otp);
				modelMap.put("serv", serv);
				modelMap.put("msg", "success");
				modelMap.put("custName", user.getName());
				modelMap.put("userName", user.getEmail());
				return "validateotp";
			} else {
				modelMap.put("serv", serv);
				modelMap.put("msg", "User Not found! Please Signup First.");
				return "bookingProceedToLogin";
			}
		}
		modelMap.put("serv", serv);
		modelMap.put("msg", "User Not found! Please Signup First.");
		return "bookingProceedToLogin";
	}

	@RequestMapping("/insertServiceMappedData")
	public String insertServiceMappedData(ModelMap modelMap) {
		return "insertServiceMappedData";
	}

	@PostMapping("/insertServiceMappedServie")
	public String insertServiceMappedServie(@RequestParam("urlName") String urlName,
			@RequestParam("heading") String heading, @RequestParam("description1") String description1,
			@RequestParam("description2") String description2, @RequestParam("description3") String description3,
			@RequestParam("description4") String description4, @RequestParam("description5") String description5,
			@RequestParam("description6") String description6, @RequestParam("description7") String description7,
			ModelMap modelMap) {
		BookingServicesDetails bookingServicesDetails = new BookingServicesDetails();
		bookingServicesDetails.setUrlName(urlName);
		bookingServicesDetails.setHeading(heading);
		bookingServicesDetails.setDescription1(description1);
		bookingServicesDetails.setDescription2(description2);
		bookingServicesDetails.setDescription3(description3);
		bookingServicesDetails.setDescription4(description4);
		bookingServicesDetails.setDescription5(description5);
		bookingServicesDetails.setDescription6(description6);
		bookingServicesDetails.setDescription7(description7);
		bookingServiceDetailsRepo.save(bookingServicesDetails);
		modelMap.put("msg", "success");
		modelMap.put("msgRes", "true");
		return "insertServiceMappedData";
	}

	@GetMapping("test")
	public String test(ModelMap modelMap) {
		modelMap.put("msg", "success");
		modelMap.put("msgRes", "true");
		return "submitBookingData";
	}

	@PostMapping("/SaveBookingDetails")
	public String SaveBookingDetails(@RequestParam("name") String name, @RequestParam("mobileNo") String mobileNo,
			@RequestParam("emailId") String emailId, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("address3") String address3,
			@RequestParam("date") String date, @RequestParam("selectedService") String selectedService,
			@RequestParam("serv") String serv, @RequestParam("userName") String userName,
			@RequestParam("custName") String custName, @RequestParam("timeSlot") String timeSlot, ModelMap modelMap) {
		// write your code to save details
		BookedServices bookedServices = new BookedServices();
		bookedServices.setName(name);
		bookedServices.setMobileNo(mobileNo);
		bookedServices.setEmailId(emailId);
		bookedServices.setAddress1(address1);
		bookedServices.setAddress2(address2);
		bookedServices.setAddress3(address3);
		bookedServices.setDate(date);
		bookedServices.setSelectedService(selectedService);
		bookedServices.setUrlName(serv);
		bookedServices.setStatus("pending");
		bookedServices.setTimeSlot(timeSlot);
		bookedServicesRepo.save(bookedServices);

		FinalFeeStructure getFees = finalFeeStructureRepo.findByurlName(serv);

		modelMap.put("custName", custName);
		modelMap.put("userName", userName);
		modelMap.put("msg", "success");
		modelMap.put("msgRes", "true");
		modelMap.put("serv", serv);
		modelMap.put("serviceName", selectedService);
		modelMap.put("GovFee", getFees.getGovFee());
		modelMap.put("ServiceCharge", getFees.getServiceCharges());
		modelMap.put("total", getFees.getTotal());

		// return "submitBookingData";
		return "payment";
	}

	@PostMapping("/processTransaction")
	public String processTransaction(@RequestParam("selectedService") String selectedService,
			@RequestParam("serv") String serv, @RequestParam("modeOfPayment") String modeOfPayment,
			@RequestParam("userName") String userName, @RequestParam("custName") String custName, ModelMap modelMap) {
		System.err.println(serv);
		System.err.println(selectedService);
		System.err.println(modeOfPayment);

		// call email service
		try {
			mailService.sendMailWithAttachment(modeOfPayment, userName);
			mailService.sendSelfMailWithAttachment(modeOfPayment, userName, selectedService, custName);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("logedInName", "logedInName");
			modelMap.put("userName", "userName");
			modelMap.put("msg", "success");
			modelMap.put("msgRes", "true");
			modelMap.put("serv", serv);
			modelMap.put("serviceName", selectedService);
			return "submitBookingData";
		}
		modelMap.put("logedInName", "logedInName");
		modelMap.put("userName", "userName");
		modelMap.put("msg", "success");
		modelMap.put("msgRes", "true");
		modelMap.put("serv", serv);
		modelMap.put("serviceName", selectedService);

		return "submitBookingData";
	}

	@PostMapping("/validate")
	public String validate(@RequestParam("otp") String otp, @RequestParam("serv") String serv,
			@RequestParam("mobileNo") String mobileNo,@RequestParam("userName") String userName, @RequestParam("custName") String custName, ModelMap modelMap) {
		String serviceName = "";
		System.err.println(otp);
		System.err.println(serv);
		modelMap.put("serv", serv);
		if (serv.equals("newAadhaar")) {
			serviceName = "New Aadhaar Card";
		}
		if (serv.equals("updateAadhaar")) {
			serviceName = "Aadhar Update";
		}
		if (serv.equals("newPassport")) {
			serviceName = "New Passport";
		}
		if (serv.equals("changeInPassport")) {
			serviceName = "Change in Passport";
		}
		if (serv.equals("renwalOfPassport")) {
			serviceName = "Renwal of Passport";
		}
		if (serv.equals("learningLicence")) {
			serviceName = "Learning Licence";
		}
		if (serv.equals("drivingLicence")) {
			serviceName = "Driving Licence";
		}
		if (serv.equals("drivingLicenceDobChange")) {
			serviceName = "Driving Licence DOB Change";
		}
		if (serv.equals("drivingLicenceNameChange")) {
			serviceName = "Driving Licence Name Change";
		}
		if (serv.equals("drivingLicenceAddressChange")) {
			serviceName = "Driving Licence Adress Change";
		}
		if (serv.equals("drivingLicencePhotoChange")) {
			serviceName = "Driving Licence Photo Change";
		}
		if (serv.equals("pancardOnline")) {
			serviceName = "PAN Card Online";
		}
		if (serv.equals("pancardOffline")) {
			serviceName = "PAN Card Offline";
		}
		if (serv.equals("newVotingCard")) {
			serviceName = "New Voting Card";
		}
		if (serv.equals("newRationCard")) {
			serviceName = "New Ration Card";
		}
		if (serv.equals("newFoodLicence")) {
			serviceName = "New Food Licence";
		}
		if (serv.equals("gumasta")) {
			serviceName = "Gumasta";
		}
		if (serv.equals("policeVerification")) {
			serviceName = "Police Verification";
		}
		if (serv.equals("smartCard")) {
			serviceName = "Smart Card";
		}

		if (serv.equals("sccaste")) {
			serviceName = "SC Caste";
		}

		if (serv.equals("ntcaste")) {
			serviceName = "NT Caste";
		}

		if (serv.equals("obccaste")) {
			serviceName = "OBC Caste";
		}

		if (serv.equals("cbcCaste")) {
			serviceName = "CBC Caste";
		}

		if (serv.equals("generalcaste")) {
			serviceName = "Ceneral caste";
		}

		if (serv.equals("noncriminalcertificate")) {
			serviceName = "Non criminal certificate";
		}
		if (serv.equals("domicile")) {
			serviceName = "Domicile";
		}
		if (serv.equals("incomecertificate")) {
			serviceName = "Income certificate";
		}
		if (serv.equals("Aafidavit")) {
			serviceName = "Aafidavit";
		}
		if (serv.equals("gapcertificate")) {
			serviceName = "Gap certificate";
		}
		if (serv.equals("rentaggrement")) {
			serviceName = "Rent aggrement";
		}
		boolean otpFlagCheck = false;
		//System.err.println("otpMap = " + otpMap);
		if(otpFlag.equals("enable")) {
			otpFlagCheck = true;
		}
		if(otpFlagCheck == true) {
		if (otpMap.get("mobileNo") != null && otpMap.get("otp") != null) {
			if (otpMap.get("otp").equals(otp) && otpMap.get("mobileNo").equals(mobileNo)) {
				modelMap.put("serviceName", serviceName);
				modelMap.put("otp", otp);
				modelMap.put("custName", custName);
				modelMap.put("userName", userName);
				return "getDetails";
			}
		}
		}else {
			
			modelMap.put("serviceName", serviceName);
			modelMap.put("otp", otp);
			modelMap.put("custName", custName);
			modelMap.put("userName", userName);
			return "getDetails";
		}

		modelMap.put("mobileNo", mobileNo);
		modelMap.put("serv", serv);
		modelMap.put("custName", custName);
		modelMap.put("userName", userName);
		modelMap.put("msg", "Invalid OTP");
		return "validateotp";

	}

	public String getServiceNameFromservUrl(String serv) {
		String serviceName = "";
		System.err.println(serv);
		if (serv.equals("newAadhaar")) {
			serviceName = "New Aadhaar Card";
		}
		if (serv.equals("updateAadhaar")) {
			serviceName = "Aadhar Update";
		}
		if (serv.equals("newPassport")) {
			serviceName = "New Passport";
		}
		if (serv.equals("changeInPassport")) {
			serviceName = "Change in Passport";
		}
		if (serv.equals("renwalOfPassport")) {
			serviceName = "Renwal of Passport";
		}
		if (serv.equals("learningLicence")) {
			serviceName = "Learning Licence";
		}
		if (serv.equals("drivingLicence")) {
			serviceName = "Driving Licence";
		}
		if (serv.equals("drivingLicenceDobChange")) {
			serviceName = "Driving Licence DOB Change";
		}
		if (serv.equals("drivingLicenceNameChange")) {
			serviceName = "Driving Licence Name Change";
		}
		if (serv.equals("drivingLicenceAddressChange")) {
			serviceName = "Driving Licence Adress Change";
		}
		if (serv.equals("drivingLicencePhotoChange")) {
			serviceName = "Driving Licence Photo Change";
		}
		if (serv.equals("pancardOnline")) {
			serviceName = "PAN Card Online";
		}
		if (serv.equals("pancardOffline")) {
			serviceName = "PAN Card Offline";
		}
		if (serv.equals("newVotingCard")) {
			serviceName = "New Voting Card";
		}
		if (serv.equals("newRationCard")) {
			serviceName = "New Ration Card";
		}
		if (serv.equals("newFoodLicence")) {
			serviceName = "New Food Licence";
		}
		if (serv.equals("gumasta")) {
			serviceName = "Gumasta";
		}
		if (serv.equals("policeVerification")) {
			serviceName = "Police Verification";
		}
		if (serv.equals("smartCard")) {
			serviceName = "Smart Card";
		}

		if (serv.equals("sccaste")) {
			serviceName = "SC Caste";
		}

		if (serv.equals("ntcaste")) {
			serviceName = "NT Caste";
		}

		if (serv.equals("obccaste")) {
			serviceName = "OBC Caste";
		}

		if (serv.equals("cbcCaste")) {
			serviceName = "CBC Caste";
		}

		if (serv.equals("generalcaste")) {
			serviceName = "Ceneral caste";
		}

		if (serv.equals("noncriminalcertificate")) {
			serviceName = "Non criminal certificate";
		}
		if (serv.equals("domicile")) {
			serviceName = "Domicile";
		}
		if (serv.equals("incomecertificate")) {
			serviceName = "Income certificate";
		}
		if (serv.equals("Aafidavit")) {
			serviceName = "Aafidavit";
		}
		if (serv.equals("gapcertificate")) {
			serviceName = "Gap certificate";
		}
		if (serv.equals("rentaggrement")) {
			serviceName = "Rent aggrement";
		}

		return serviceName;

	}

	private void prepareUrlForSms(String otp, String number) throws Exception {
		String newUrl = "https://my.bulksmsplans.com/api/send_sms?api_id=API5YwmxE7C100099&api_password=%242y%2410%24FobnjjjLaZhkiiSQIU6he.v%2FINB2swqCThEOogpo9D9HZigCl1mRm&sms_type=Transactional&sms_encoding=text&sender=HAMKND&number=9359381611&message=HAMARA KENDRA OTP IS "
				+ otp.trim() + ". THANK YOU HAMKND (HAMARA KENDRA)&template_id=121569";
		sendGET(otp, number);
		otpMap = new HashMap<>();
		otpMap.put("mobileNo", number);
		otpMap.put("otp", otp);
	}

	public void sendGET(String otp, String number) throws IOException {
		String message = "HAMARA KENDRA OTP IS " + otp + ". THANK YOU HAMKND (HAMARA KENDRA)";
		Map<String, String> map = new HashMap<String, String>();
		map.put("api_id", api_id);
		map.put("api_password", api_password);
		map.put("sms_type", sms_type);
		map.put("sms_encoding", sms_encoding);
		map.put("sender", sender);
		map.put("number", number);
		map.put("message", message);
		map.put("template_id", template_id);
		Object res = restTemplate.postForObject(newUrl, map, Object.class);
		System.err.println("OTP Response = " + res);
	}

}
