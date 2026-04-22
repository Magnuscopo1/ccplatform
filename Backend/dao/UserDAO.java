package com.backend.dao;
import com.backend.util.DBConnection;
import com.common.model.User;

import java.sql.*;

public class UserDAO {
    public boolean registerUser(User user) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO account_holders (full_name, email_address, secret_password) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { return false; }
    }

    public User loginUser(String email, String pass) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM account_holders WHERE email_address=? AND secret_password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("user_id"));
                u.setName(rs.getString("full_name"));
                u.setEmail(rs.getString("email_address"));
                return u;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}