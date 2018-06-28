package logic;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {
	void shopWrite(Shop shop, HttpServletRequest request);
}
