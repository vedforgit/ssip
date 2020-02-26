/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

/**
 *
 * @author Parthik Shah
 */

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
public class ResizeImageExample
{
    
    public static void main(String... args) throws IOException {

        File input = new File("C:/Users/vedant/Downloads/CPS_0006.jpg");
        BufferedImage image = ImageIO.read(input);

        BufferedImage resized = resize(image, 215,215);

        File output = new File("C:/Users/vedant/Desktop/CPS_0006.jpg");
        ImageIO.write(resized, "png", output);
        
    }

    public static BufferedImage resize(BufferedImage img, int par, int par1) 
    {
        Image tmp = img.getScaledInstance(215,215, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(215,215, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }
    
    public static BufferedImage resize(File f,BufferedImage img, int par, int par1) 
    {
        Image tmp = img.getScaledInstance(215,215, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(215,215, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }
    
}
