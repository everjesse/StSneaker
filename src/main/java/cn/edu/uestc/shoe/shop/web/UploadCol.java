package cn.edu.uestc.shoe.shop.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.uestc.shoe.shop.util.ImageSize;
import cn.edu.uestc.shoe.shop.util.ImageUpload;

/**
 * upload col
 *  
 * @author lynch
 */
@Controller
@RequestMapping(value="/upload")
public class UploadCol {
	
	@Autowired
	private ImageUpload imageUpload;
	
	private String path = "E:\\photo";
	
	
	/**
	 * 上传
	 */
	@RequestMapping(value = "view")
	public String view() {
		
		return "upload/view";
	}
	
	/**
	 * 上传
	 */
	@RequestMapping(value = "upload")
	public String upload(MultipartFile file) {
		
		ImageSize imageSzie = new ImageSize(300, 300);
		String imageName = imageUpload.imageUpload(path, file, imageSzie);
		System.out.println(imageName);
		return "upload/success";
	}

}
