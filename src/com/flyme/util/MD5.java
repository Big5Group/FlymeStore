package com.flyme.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Hex;

public class MD5 {
	/**
	 * md5加密的工具方法
	 * @throws NoSuchAlgorithmException
	 */
	public static String encryptWithMD5(String plaintext) {

		MessageDigest digest;
		byte[] md5Bytes = null;
		try {
			digest = MessageDigest.getInstance("md5");
			md5Bytes = digest.digest(plaintext.getBytes());
			// 运用第三方 org.apache.commons.codec.binary.Hex 将 byte[] -> 16进制
			return Hex.encodeHexString(md5Bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
}