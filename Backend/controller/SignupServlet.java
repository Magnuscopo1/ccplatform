package com.backend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backend.dao.UserDAO;
import com.common.model.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(pass);

        UserDAO dao = new UserDAO();
        boolean isRegistered = dao.registerUser(user);

        if (isRegistered) {
            // Redirect to login page with success status
            response.sendRedirect("login.jsp?status=success");
        } else {
            // Redirect back to signup if email already exists
            response.sendRedirect("signup.jsp?error=exists");
        }
    }
}