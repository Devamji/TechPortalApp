package controller;

import java.io.IOException;
import java.util.UUID;

import dao.UserDao;
import dbconnection.ConnectionProvider;
import helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;

@WebServlet("/signup")
@MultipartConfig
public class SignUpControllerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// get all form fields data
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String email = req.getParameter("email");
			String password = req.getParameter("pass");
			String mobNo = req.getParameter("mob");

			// get submitted file name from that part
			Part part = req.getPart("pic");

			// get submitted file name form that pic part
			String picName = part.getSubmittedFileName();

			// create dao object and call save method
			UserDao udao = new UserDao(ConnectionProvider.getDbConnection());

			// create session object
			HttpSession session = req.getSession();

			// check user is already exists
			if (udao.isEmailExists(email)) {
				session.setAttribute("msg", "exists");
				resp.sendRedirect("signup.jsp");
				return;
			}

			// working with image

			String uploadPath = getServletContext().getRealPath("/profile_img");

			// change every profile name into unique name by using timestamp and random
			// number
			if (picName != null && !picName.trim().isEmpty()) {
				// karan.png
				String fileExtension = picName.substring(picName.lastIndexOf("."));
				picName = UUID.randomUUID().toString() + "_" + System.currentTimeMillis() + fileExtension;

			}

			boolean isImageSaved = Helper.saveFile(part, uploadPath, picName);

			// if imageuploaded to directory succesfulyyyy then save user detail to db

			// fill user object
			User u = new User();
			u.setUserFname(fname);
			u.setUserLname(lname);
			u.setUserEmail(email);
			u.setRole("normal");
			u.setPassword(password);
			u.setUserImage(picName);
			u.setMobno(mobNo);

			// check image is saved or not in directory

			if (isImageSaved) {
				boolean isSaved = udao.saveUser(u);
				
				if(isSaved)
				{
					session.setAttribute("msg", "success");
					resp.sendRedirect("signup.jsp");
				}else
				{
					session.setAttribute("msg", "fail");
					resp.sendRedirect("signup.jsp");
				}
				
				
			} else {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
