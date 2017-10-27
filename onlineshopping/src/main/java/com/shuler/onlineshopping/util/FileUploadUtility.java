package com.shuler.onlineshopping.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {
    private static final String ABS_PATH = 
    		"Y:\\Developer\\spring\\online-shopping\\onlineshopping\\src\\main\\webapp\\assets\\images\\";
    private static String REAL_PATH = "";
    private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);
    
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
		REAL_PATH =  request.getSession().getServletContext().getRealPath("/assets/images/");
		
		logger.info(REAL_PATH);
		
		// Make sure dir exists
		if (!new File(ABS_PATH).exists()) {
			// create
			new File(ABS_PATH).mkdirs();
		}
		if (!new File(REAL_PATH).exists()) {
			// create
			new File(REAL_PATH).mkdirs();
		}
		try {
			// server upload
			file.transferTo(new File(REAL_PATH +  code + ".jpg"));  // TODO what about JPG or PNG
			// project directory upload
			file.transferTo(new File(ABS_PATH +  code + ".jpg"));  // TODO what about JPG or PNG

		} catch (IOException ex) {
			
		}
	}
}
