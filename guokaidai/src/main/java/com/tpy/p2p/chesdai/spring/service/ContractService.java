package com.tpy.p2p.chesdai.spring.service;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.xhtmlrenderer.pdf.ITextRenderer;

import cn.eseals.service.AutoSignOnPDF;

import com.tpy.base.constant.Constant;
import com.tpy.base.util.FreeMarkerUtil;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.model.LoanContract;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;

/**
 * 合同生成service
 * 
 * @author frank
 * 
 */
@Service
public class ContractService {

	/**
	 * ITextRenderer
	 */
	private ITextRenderer renderer;

	/**
	 * loanContract
	 */
	private String loanContract;

	@PostConstruct
	public void init() {
		String classPath = ContractService.class.getClassLoader()
				.getResource("/").getPath()
				+ "config" + File.separator;
		System.out.println("pdf classPath=" + classPath);
		loanContract = classPath + "marker" + File.separator + "contract"
				+ File.separator + "loan_contract.ftl";
		System.out.println("loanContract=" + loanContract);
		renderer = new ITextRenderer();
		try {
			String ttcPath = classPath + "font" + File.separator + "simsun.ttc";
			renderer.getFontResolver().addFont(ttcPath, BaseFont.IDENTITY_H,
					BaseFont.NOT_EMBEDDED);
		} catch (DocumentException | IOException e) {
			LOG.error("添加中文字体失败！", e);
		}
	}

	/**
	 * 生成
	 * 
	 * @param loanContract
	 *            LoanContract
	 * @param outputStream
	 *            输出流
	 * @throws Exception
	 *             异常
	 */
	@SuppressWarnings("serial")
	public void born(final LoanContract loanContract, OutputStream outputStream)
			throws Exception {

		try {

			// 设置PDF文件内容
			renderer.setDocumentFromString(FreeMarkerUtil.execute(
					"config/marker/contract/loan_contract.ftl",
					Constant.CHARSET_DEFAULT, new HashMap<String, Object>() {
						{
							put("item", loanContract);
						}
					}));
			// 设置PDF根路径
			renderer.getSharedContext().setBaseURL("file:" + loanContract);

			renderer.layout();

			// 设置密码
			// 取消设置密码。无法对加密pdf盖电子章
			/*
			 * renderer.setPDFEncryption(new PDFEncryption(loanContract
			 * .getPdfPassword().getBytes(), loanContract
			 * .getPdfPassword().getBytes()));
			 */
			renderer.createPDF(outputStream);
			outputStream.flush();
			renderer.finishPDF();
		} catch (DocumentException e) {
			LOG.error("生成PDF文档失败！", e);
		}

	}

	/**
	 * 理财合同生成
	 * 
	 * @param loanContract
	 *            LoanContract
	 * @param outputStream
	 *            输出流
	 * @throws Exception
	 *             异常
	 */
	@SuppressWarnings("lcserial")
	public void lcborn(final LoanContract loanContract,
			OutputStream outputStream) throws Exception {

		try {

			// 设置PDF文件内容
			renderer.setDocumentFromString(FreeMarkerUtil.execute(
					"config/marker/contract/licaijihua.ftl",
					Constant.CHARSET_DEFAULT, new HashMap<String, Object>() {
						{
							put("item", loanContract);
						}
					}));
			// 设置PDF根路径
			renderer.getSharedContext().setBaseURL("file:" + loanContract);

			renderer.layout();

			// 设置密码
			// 取消设置密码。无法对加密pdf盖电子章
			/*
			 * renderer.setPDFEncryption(new PDFEncryption(loanContract
			 * .getPdfPassword().getBytes(), loanContract
			 * .getPdfPassword().getBytes()));
			 */
			renderer.createPDF(outputStream);
			outputStream.flush();
			renderer.finishPDF();
		} catch (DocumentException e) {
			LOG.error("生成PDF文档失败！", e);
		}

	}

	/**
	 * 盖章
	 * 
	 * @param pdfPath
	 *            pdf文件位置
	 * @param sealXmlPath
	 *            加密XML文件位置
	 * @param certPath
	 *            加密密钥
	 * @param certPwd
	 *            密码
	 * @param page
	 *            盖章的页面
	 * @param sealPstX
	 *            印章的x位置
	 * @param sealPstY
	 *            印章的y位置
	 * @return
	 */
	public String sign(String pdfPath, String sealXmlPath, String certPath,
			String certPwd, String page, String sealPstX, String sealPstY) {
		String result = "";
		try {
			result = AutoSignOnPDF.signSeal(pdfPath, sealXmlPath, certPath,
					certPwd, Integer.parseInt(page),
					Integer.parseInt(sealPstX), Integer.parseInt(sealPstY));
		} catch (NumberFormatException | IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}
