/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.UsersFacadeLocal;
import Entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ankhaa
 */
public class UpdateProfileServlet extends HttpServlet {

    @EJB
    private UsersFacadeLocal uf;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        Integer gender = request.getParameter("gender").equals("male") ? 0 : 1;
        String state = request.getParameter("state");
        String city = request.getParameter("city").isEmpty() ? null : request.getParameter("city");
        String street = request.getParameter("street");
        Integer zip = request.getParameter("zip").isEmpty() ? 0 : Integer.parseInt(request.getParameter("zip"));
        Integer birthYear = Integer.parseInt(request.getParameter("birthYear"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Users user = new Users();
        user.setUserid(Integer.parseInt(request.getParameter("userId")));
        user.setFullname(fullName);
        user.setGender(gender);
        user.setState(state);
        user.setCity(city);
        user.setStreet(street);
        user.setZipcode(zip);
        user.setBirthyear(birthYear);
        user.setEmail(email);
        user.setPassword(password);
        user.setDatecreated(new Date());

        uf.edit(user);

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        response.sendRedirect("http://localhost:8080/FinalProject/Home");
    }

}
