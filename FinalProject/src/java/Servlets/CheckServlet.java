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
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankhaa
 */
public class CheckServlet extends HttpServlet {

    @EJB
    private PostsFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        Users user = (Users)request.getSession().getAttribute("user");
        
        if (this.getServletContext().getAttribute("latestId"+user.getUserid()) != null) {
            
            Integer postId  = Integer.parseInt(this.getServletContext().getAttribute("latestId"+user.getUserid()).toString());
            
            List<Posts> posts = pfl.findAll();
            Posts p = null;
            if (posts.size() > 0) {
                p = posts.get(0);
                
                if (p.getPostid() > postId) {
                    
                    this.getServletContext().setAttribute("latestId"+user.getUserid(), p.getPostid());
                    boolean isUpdated = true;
                    String json = new Gson().toJson(p); 

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    
                } else {
                    boolean isUpdated = false;
                    String json = new Gson().toJson(isUpdated);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                }
            }
        } else {

            boolean isUpdated = false;
            String json = new Gson().toJson(isUpdated);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }

    }

}
