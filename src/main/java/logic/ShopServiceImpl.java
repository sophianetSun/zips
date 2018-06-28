package logic;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ShopDao;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDao shopDao;

	@Override
	public void shopWrite(Shop shop, HttpServletRequest request) {
		shopDao.shopWrite(shop);
	}
	
}
