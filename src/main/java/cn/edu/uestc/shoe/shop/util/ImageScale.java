package cn.edu.uestc.shoe.shop.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

@Service("imageScale")
public class ImageScale {

	public static int generateCount = 0;

	public boolean scalesImage(BufferedImage srcBufferedImage, File destFile,
			ImageSize imageSize) {

		try {
			int imgWidth = imageSize.getWidth();
			int imgHeight = imageSize.getHeight();
			int srcWidth = srcBufferedImage.getWidth();
			int srcHeight = srcBufferedImage.getHeight();
			double scaleW = imageSize.getWidth() * 1.0 / srcWidth;
			double scaleH = imageSize.getHeight() * 1.0 / srcHeight;
			if (scaleW >= scaleH) {
				double imgWidth1 = scaleH * srcWidth;
				double imgHeight1 = scaleH * srcHeight;
				imgWidth = (int) imgWidth1;
				imgHeight = (int) imgHeight1;
			} else {
				double imgWidth1 = scaleW * srcWidth;
				double imgHeight1 = scaleW * srcHeight;
				imgWidth = (int) imgWidth1;
				imgHeight = (int) imgHeight1;
			}
			BufferedImage destBufferedImage = new BufferedImage(imageSize.getWidth(),
					imageSize.getHeight(), BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics2D = destBufferedImage.createGraphics();
			graphics2D.setBackground(Color.WHITE);
			graphics2D.clearRect(0, 0, imageSize.getWidth(), imageSize.getHeight());
			graphics2D.drawImage(srcBufferedImage.getScaledInstance(imgWidth,
					imgHeight, Image.SCALE_SMOOTH), (imageSize.getWidth() / 2)
					- (imgWidth / 2), (imageSize.getHeight() / 2) - (imgHeight / 2), null);
			graphics2D.dispose();
			ImageIO.write(destBufferedImage, "jpg", destFile);
			return true;
		} catch (IOException e) {
			return false;
		}
	}

	public String getImageName() {

		if (generateCount > 99999) {
			generateCount = 0;
		}
		String uniqueNumber = Long.toString(System.currentTimeMillis())
				+ Integer.toString(generateCount);
		generateCount++;
		return uniqueNumber;
	}

}