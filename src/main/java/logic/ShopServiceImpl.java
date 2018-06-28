package logic;

import java.util.List;

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
		int shop_no = shopDao.maxNo();
		shop.setShop_no(++shop_no);		
		shopDao.shopWrite(shop);
	}

	@Override
	public int shopCount(String searchType, String searchContent) {
		return shopDao.shopCount(searchType, searchContent);
	}

	@Override
	public List<Shop> shopList(String searchType, String searchContent, Integer pageNum, int limit) {
		return shopDao.shopList(searchType, searchContent, pageNum, limit);
	}

	@Override
	public Shop getShop(Integer shop_no) {
		return shopDao.getShop(shop_no);
	}
	
}
