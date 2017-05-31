/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;  
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import java.util.*;
/**
 *
 * @author arca
 */
public class detailspage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        
        String t = request.getParameter("param");
        int len = t.length() - 1;
        String temp = t.substring(0, len);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/coolfitteddb?zeroDateTimeBehavior=convertToNull", "root", "inf124");
            Statement stmt=con.createStatement();  
            ResultSet rs=stmt.executeQuery("select * from details where imagename='"+temp+"1"+"'");  
            rs.next();
            request.setAttribute("title", rs.getString(3));
            request.setAttribute("details", rs.getString(4));
            request.setAttribute("price", rs.getString(5));
            
            rs=stmt.executeQuery("select imagepath from images where imagename in ('"+temp+"1"+"','"+temp+"2"+"','"+temp+"3"+"')");  
            rs.next();
            request.setAttribute("image1", rs.getString("imagepath"));
            rs.next();
            request.setAttribute("image2", rs.getString("imagepath"));
            rs.next();
            request.setAttribute("image3", rs.getString("imagepath"));
        
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/details.jsp");
            rd.forward(request, response);
                con.close();  
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
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
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
