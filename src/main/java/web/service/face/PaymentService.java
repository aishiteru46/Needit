package web.service.face;

import java.io.IOException;

public interface PaymentService {

	public String getToken(String apiKey, String secretKey) throws IOException;

	public void cancel(String token, String merchantUid) throws IOException;

}
