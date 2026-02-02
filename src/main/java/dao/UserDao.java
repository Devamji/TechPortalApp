package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	// save user details at signup
	public boolean saveUser(User user) {
		boolean f = false;

		try {

			// generate query for insert user data & don't include userId beacuse it is
			// auto-increment
			String query = "insert into user (fname,lname,email,role,pass,imagename,mobno) values (?,?,?,?,?,?,?)";

			// use prepared stmt
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getUserFname());
			ps.setString(2, user.getUserLname());
			ps.setString(3, user.getUserEmail());
			ps.setString(4, user.getRole());
			ps.setString(5, user.getPassword());
			ps.setString(6, user.getUserImage());
			ps.setString(7, user.getMobno());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	// check email already present
	public boolean isEmailExists(String email) {
		boolean exists = false;
		try {
			String query = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return exists;
	}

	// check email and password for login purpose

	public User getUserByEmailAndPassword(String email, String pass) {

		User user = null;

		try {

			String query = "select * from user where email=? and pass=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				// fetch all the data from result set and set the data to object
				int uid = rs.getInt("userid");
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				String uemail = rs.getString("email");
				String role = rs.getString("role");
				String img = rs.getString("imagename");
				String mob = rs.getString("mobno");

				user = new User();
				user.setUserId(uid);
				user.setUserFname(fname);
				user.setUserLname(lname);
				user.setUserEmail(uemail);
				user.setRole(role);
				user.setUserImage(img);
				user.setMobno(mob);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return user;

	}

}//
