/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import static Controller.UpdateServlet.UPDATEACCOUNT;
import Model.DAO.AccountDAO;
import Model.DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action2 = request.getParameter("action2");
        String url = "";
        try {
            switch (action2) {
                case "View":
                    url = "View/Profile.jsp";
                    break;
                case "updateForward":
                    url = "View/UpdateProfile.jsp";
                    break;
                case "UpdateProfile":
                    HttpSession session = request.getSession();
                    AccountDAO aDAO = new AccountDAO();
                    Account aUpdate = (Account) session.getAttribute("a");
                    String passUpdate = request.getParameter("pass");
                    String lastNameUpdate = request.getParameter("lastName");
                    String firstNameUpdate = request.getParameter("firstName");
                    String birthdayUpdate = request.getParameter("birthday");
                    String phoneUpdate = request.getParameter("phone");
                    int roleUpdate = Integer.parseInt(request.getParameter("role"));
                    boolean isUseUpdate = true;
                    String genderUpdate = request.getParameter("optradio");
                    boolean genderCheckUpdate = (genderUpdate.equalsIgnoreCase("1")) ? true : false;

                    Date dateUpdate;
                    if (birthdayUpdate.length() != 0) {
                        dateUpdate = Date.valueOf(birthdayUpdate);
                    } else {
                        dateUpdate = null;
                    }
                    aUpdate.setPass(passUpdate);
                    aUpdate.setFirstName(firstNameUpdate);
                    aUpdate.setLastName(lastNameUpdate);
                    aUpdate.setBirthday(dateUpdate);
                    aUpdate.setPhone(phoneUpdate);
                    aUpdate.setGender(genderCheckUpdate);
                    aUpdate.setRoleInSystem(roleUpdate);
                    aUpdate.setIsUse(isUseUpdate);
                    aDAO.updateRec(aUpdate);
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Cập Nhật Thành Công!!\n"
                            + "</div>");
                    url = "View/Profile.jsp";
                    session.setAttribute("listA", aDAO.listAll());
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
