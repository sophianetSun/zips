package ciper;

import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CiperUtil {
	private final static byte[] iv = new byte[] {
			(byte)0x8E, 0x12, 0x39, (byte)0x9C,
			0x07, 		0x72, 0x6F, (byte)0x5A,
			(byte)0x8E, 0x12, 0x39, (byte)0x9C,
			0x07, 		0x72, 0x6F, (byte)0x5A,
	};
	static Cipher cipher;
	static {
		try {
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String encrypt(String plainText, String key) {
		byte[] cipherBuf = new byte[1024];
		try {
			Key cipherKey = new SecretKeySpec(makeKey(key), "AES");//128비트키가 있음./AES알고리즘에 사용될 키라고 설정해 줌.
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			//ENCRYPT_MODE : 암호화할것임이라는 선언
			//cipherKey : 암호화에 사용될 키 지정
			//paramSpec : iv설정
			cipher.init(Cipher.ENCRYPT_MODE, cipherKey, paramSpec);
			cipherBuf = cipher.doFinal(paddingString(plainText).getBytes());//plainText : 안녕하세요 허주한입니다를 실행함.
		} catch(Exception e) {
			e.printStackTrace();
		}
		return bytesToHex(cipherBuf).trim();
	}

	private static String paddingString(String msg) {
		int x = msg.length() % 16;
		int padLen = 16 - x;
		for(int i=0; i<padLen; i++)
			msg += ' ';
		return msg;
	}

	private static String bytesToHex(byte[] cipherBuf) {
		if(cipherBuf == null) return null;
		int len = cipherBuf.length;
		String str = "";
		for(int i=0; i<len; i++) {
			if((cipherBuf[i]&0xFF) < 16)
				str += "0" + Integer.toHexString(cipherBuf[i]&0xFF);
			else
				str += Integer.toHexString(cipherBuf[i]&0xFF);
			}
		return str;
	}
	//AES암호알고리즘은 키크기를 128비트여야함. 지정을 해놈.
	private static byte[] makeKey(String key) {
		int len = key.length();
		char ch = 'A';
		for(int i=len; i<16; i++) {
			key += ch++;
		}
		return key.getBytes();
	}

	public static String decrypt(String ciperText, String key) {
		byte[] plainMsg = new byte[1024];
		try {
			Key decKey = new SecretKeySpec(makeKey(key), "AES");
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			//DECRYPT_MODE : 복호화
			cipher.init(Cipher.DECRYPT_MODE, decKey, paramSpec);
			plainMsg = cipher.doFinal(hexToBytes(ciperText.trim()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new String(plainMsg).trim();
	}
	
	private static byte[] hexToBytes(String str) {
		if(str == null) return null;
		if(str.length() < 2) return null;
		int len = str.length() / 2;
		byte[] buf = new byte[len];
		for(int i=0; i<len; i++) {
			buf[i] = (byte)Integer.parseInt(str.substring(i*2, i*2+2), 16);
		}
		return buf;
	}	
}
