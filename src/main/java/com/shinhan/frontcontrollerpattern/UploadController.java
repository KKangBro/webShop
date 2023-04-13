package com.shinhan.frontcontrollerpattern;

import java.io.IOException;
import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadController implements CommonControllerInterface {
	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) { // GET
			page = "uploadTest/uploadForm.jsp";
		} else { // POST
			doHandle(request);
//			redirect:" + request.getContextPath() + "/emp/emplist.do
			page = "redirect:"+request.getContextPath();
		}
		return page;
	}

	private void doHandle(HttpServletRequest request) throws ServletException, IOException {
		String encoding = "utf-8";
		
		String currentPath = request.getServletContext().getRealPath("uploads");
		System.out.println(currentPath);
		
		File currentDirPath = new File(currentPath);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				
				if (fileItem.isFormField()) {
					// input type이 file이 아닌 것
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
				} else {
					System.out.println("파라미터명: " + fileItem.getFieldName());
					System.out.println("파일명: " + fileItem.getName());
					System.out.println("파일크기: " + fileItem.getSize() + "bytes");
					
					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1);
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}