/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.PostsFacadeLocal;
import Entities.Posts;
import Entities.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ankhaa
 */
public class CreatePostServlet extends HttpServlet {

    @EJB
    private PostsFacadeLocal pfl;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        String post = request.getParameter("post");
        Integer postType = request.getParameter("postType").equals("Offer") ? 0 : 1;
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        
        Posts posts = new Posts();
        posts.setUserid((Users)request.getSession().getAttribute("user"));
        posts.setPost(post);
        posts.setPosttype(postType);
        posts.setSource(source);
        posts.setDestination(destination);
        posts.setDatecreated(new Date());
        
        pfl.create(posts);
        
        Users user = (Users)request.getSession().getAttribute("user");
        
        this.getServletContext().setAttribute("latestId"+user.getUserid(), posts.getPostid());
    }
    

}
