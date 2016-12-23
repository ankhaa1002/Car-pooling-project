/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.PostsFacadeLocal;
import Entities.Comments;
import Entities.Likes;
import Entities.Posts;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankhaa
 */
public class PostServlet extends HttpServlet {

    @EJB
    private PostsFacadeLocal pfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
//        int pageNum = Integer.parseInt(request.getParameter("pageNumber"));
//        int postType = Integer.parseInt(request.getParameter("postType"));
//        
//        List<Posts> posts = pfl.findByPostType(postType, pageNum);
//        
//        RequestDispatcher view = request.getRequestDispatcher("tempPost.jsp");
//        request.setAttribute("posts", posts);
//        view.forward(request, response);
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

        Integer postType = Integer.parseInt(request.getParameter("postType"));

        List<Posts> posts = pfl.findByPostType(postType);

        for (Posts p : posts) {
            for (Likes l : p.getLikesList()) {
                l.setPostid(null);
            }
        }

        for (Posts p : posts) {
            for (Comments c : p.getCommentsList()) {
                c.setPostid(null);
            }
        }

        String json = new Gson().toJson(posts);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}
