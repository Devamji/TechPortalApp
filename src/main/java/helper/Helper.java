package helper;

import java.io.File;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;

public class Helper {

	public static boolean saveFile(Part part, String uploadDir, String fileName) {
		boolean f = false;

		try {
			// ensure upload directory exists or not
			File dir = new File(uploadDir);

			if (!dir.exists()) {
				dir.mkdirs();// create folder
			}

			// construct full file path
			// :- /profile_img\karan.png
			String filePath = uploadDir + File.separator + fileName;
			System.out.println(filePath);

			// save file to folder
			part.write(filePath);

			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}//
	
	
	//get profile image 
	public static String getUserProfileImage(HttpSession session)
	{
		
		//get real path of upload image directory
		String uploadedPath = session.getServletContext().getRealPath("profile_img");
		
		//get loggedin user from session
		User user=(User)session.getAttribute("userobj");
		
		if(user!=null && user.getUserImage()!=null && !user.getUserImage().isEmpty())
		{
			String imagePAth=uploadedPath+File.separator+user.getUserImage();//profile_img/karan.png
			
		   File f=new File(imagePAth);
		   
		   if(f.exists())
		   {
			   return user.getUserImage();
		   }
		   
			
		}
		
		return "default.png";
	}
	
	
	
	
	
	

}
