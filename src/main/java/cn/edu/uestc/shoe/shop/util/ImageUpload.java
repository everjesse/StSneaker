package cn.edu.uestc.shoe.shop.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("imageUpload")
public class ImageUpload {

	@Autowired
	private ImageScale imageScale;
	
	public File mkDirs(String fileFolder) {
		
		File savedir = new File(fileFolder);
		if (!savedir.exists()) {
			savedir.mkdirs();
		}
		return savedir;
	}
	
	public String imageUpload(String fileFolder, MultipartFile file){    
		
		try {
			String fileName = null;
			if (!file.isEmpty()) {
				File savedir = mkDirs(fileFolder);
				fileName = imageScale.getImageName() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				File saveFile = new File(savedir, fileName);
				FileUtils.copyInputStreamToFile(file.getInputStream(), saveFile); 
			}
			return fileName;
		} catch (IOException e) {
			return null;
		}
	}  

	public String imageUpload(String fileFolder, MultipartFile file, ImageSize imageSize) {

		try {
			String fileName = null;
			if (!file.isEmpty()) {
				File savedir = mkDirs(fileFolder);
				fileName = imageScale.getImageName() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				BufferedImage src = ImageIO.read(file.getInputStream());
				File saveFile = new File(savedir, fileName);
				imageScale.scalesImage(src, saveFile, imageSize);
			}
			return fileName;
		} catch (IOException e) {
			return null;
		}
	}
	
}
