package com.tpy.p2p.pay.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.KeyFactory;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.cert.Certificate;
import java.security.spec.X509EncodedKeySpec;

import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfSignatureAppearance;
import com.itextpdf.text.pdf.PdfSignatureAppearance.RenderingMode;
import com.itextpdf.text.pdf.PdfStamper;
import com.jubaopen.p2p.pay.util.*;


/**
 * Sign
 * 
 * @author RanQiBing 2014-03-26
 * 
 */
public class SignProvider {
	
	public static void sign(String originalPDF,String targetPDF,String pfxPath,String sealImg) throws Exception {  
	        KeyStore ks = KeyStore.getInstance("pkcs12");  
	        ks.load(new FileInputStream(pfxPath),"123456".toCharArray()); //123456为私钥密码  
	        String alias = (String) ks.aliases().nextElement();  
	        PrivateKey key = (PrivateKey) ks.getKey(alias, "123456".toCharArray());  
	        Certificate[] chain = ks.getCertificateChain(alias);  
	        PdfReader reader = new PdfReader(originalPDF); //源文件  
	        FileOutputStream fout = new FileOutputStream(targetPDF);  
	        PdfStamper stp = PdfStamper.createSignature(reader, fout, '\0');  
	        PdfSignatureAppearance sap = stp.getSignatureAppearance();  
	        sap.setCrypto(key, chain, null, PdfSignatureAppearance.VERISIGN_SIGNED);  
	        sap.setReason("");  
	        sap.setLocation("");  //添加位置信息，可为空  
	        sap.setContact("http://221.5.96.71/");  
	        Image image = Image.getInstance(sealImg); //使用png格式透明图片
	        sap.setSignatureGraphic(image);  
	        sap.setAcro6Layers(true);  
	        sap.setRenderingMode(RenderingMode.GRAPHIC);  
	        sap.setVisibleSignature(new Rectangle(300,300 ,400,750), 1, null); //对应x轴和y轴坐标  
	        stp.getWriter().setCompressionLevel(5);  
	        if (stp != null) {  
	            stp.close();  
	        }  
	        if (fout != null) {  
	            fout.close();  
	        }  
	        if (reader != null) {  
	            reader.close();  
	        }  
	    }
	
	
	
	/**
	 * 验证是否为环迅返回的信息
	 * 
	 * @param pubKeyText
	 *            公钥
	 * @param plainText
	 *            明文
	 * @param signText
	 *            数字签名的密文
	 * @return <p>
	 *         true
	 *         </p>
	 *         是
	 *         <p>
	 *         true
	 *         </p>
	 *         否
	 */
	public static boolean verify(String pubKeyText, String plainText,
			String signText) {

		try {

			// 解密由base64编码的公钥,并构造X509EncodedKeySpec对象

			X509EncodedKeySpec bobPubKeySpec = new X509EncodedKeySpec(com.jubaopen.p2p.pay.util.Base64
					.decodeBase64String(pubKeyText).getBytes());

			// RSA对称加密算法

			KeyFactory keyFactory = KeyFactory.getInstance("RSA");

			// 取公钥匙对象
			PublicKey pubKey = keyFactory.generatePublic(bobPubKeySpec);

			// 解密由base64编码的数字签名

			byte[] signed = com.jubaopen.p2p.pay.util.Base64.decodeBase64String(signText).getBytes();

			Signature signatureChecker = Signature.getInstance("MD5withRSA");

			signatureChecker.initVerify(pubKey);

			signatureChecker.update(plainText.getBytes());

			// 验证签名是否正常
			if (signatureChecker.verify(signed)) {
				return true;
			} else {
				return false;
			}
		} catch (Throwable e) {

			System.out.println("校验签名失败");

			e.printStackTrace();

			return false;

		}

	}
}
