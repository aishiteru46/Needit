package web.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import web.dto.Rent;
import web.service.face.PaymentService;

@Controller
public class PaymentController {
   private final Logger logger = LoggerFactory.getLogger( this.getClass() );
   
   @Autowired PaymentService paymentService;
   
   //IamportClient타입 변수생성
   private IamportClient iamportClient;
   
   //식별코드
   private String apiKey = "0485646228871227";
   private String secretKey = "zlwIDmhgdJZZ8fIJGYP0wnzmpkbc6fHksifefkrRrknfXylZcx7Ch37KJuCrWpxM5lfPmQt6VlxkvMXr";
   
   public PaymentController() {
      this.iamportClient = new IamportClient(apiKey, secretKey);
   }
   
   @ResponseBody
   @RequestMapping(value="/verify/{imp_uid}", method=RequestMethod.POST)
   public IamportResponse<Payment> paymentByImpUid(
		   Model model, Locale locale
		   , HttpSession session
		   , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {   
   
	   return iamportClient.paymentByImpUid(imp_uid);
   
   }
   
//   @PostMapping("/confirm")
//   @ResponseBody
//   public void payment( String merchantUid, String impUid ) {
//      logger.info("impUid : {} ", impUid);
//      logger.info("merchantUid : {} ", merchantUid);
//      
//      RestTemplate restTemplate = new RestTemplate();
//      
//      HttpHeaders headers = new HttpHeaders();
//      headers.setContentType(MediaType.APPLICATION_JSON);
//      
//      JSONObject body = new JSONObject();
//      body.put("imp_key", "2441044643164541");
//      body.put("imp_secret", "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX");
////      MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
////      body.add("imp_key", "2441044643164541");
////      body.add("imp_secret", "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX");
//      
//      HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
////      HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
//      ResponseEntity<JSONObject> token = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", entity, JSONObject.class);
//      
//      logger.info("token :{}", token);
//      logger.info("token :{}", token.getStatusCode());
//      logger.info("token :{}", token.getStatusCodeValue());
//      logger.info("token :{}", token.getBody());
//      logger.info("token :{}", token.getBody().get("response"));
//      
//   }
   
   @PostMapping(value="/cancel")
   @ResponseBody
   public ResponseEntity<Map<String,Object>> cancel( Rent rent, String merchantUid ) throws IOException {
      logger.info("merchantUid : {} ", merchantUid);
      
//      try {
         String token = paymentService.getToken(apiKey, secretKey);
         logger.info("token : {} ", token);
         paymentService.cancel(token, merchantUid);
         
//      } catch (IOException e) {
//         e.printStackTrace();
//         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
//      }
      
//      rentService.cancelBooking(rent);
      
//      return ResponseEntity.ok().build();
      return ResponseEntity.ok(Map.of("status","success"));
//      return "redirect:/booking/main";
      
   }
   
   
}