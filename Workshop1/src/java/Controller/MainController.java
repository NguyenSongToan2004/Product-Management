/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO.AccountDAO;
import Model.DAO.CategoryDAO;
import Model.DAO.ProductDAO;
import Model.DTO.Account;
import Model.DTO.Category;
import Model.DTO.Product;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

    public final static String LOGIN = "View/LogIn.jsp";
    public final static String ERROL = "View/errol.jsp";
    public final static String DETAILPRODUCT = "View/DetailProduct.jsp";
    public final static String HOMEUSER = "View/HomeUser.jsp";
    public final static String CREATEACCOUNTGUESS = "View/CreateAccountGuess.jsp";
    public final static String CREATEACCOUNT = "View/CreateAccount.jsp";
    public final static String CSKH = "View/CSKH.jsp";
    public final static String PROFILE = "profile";
    //Config Image
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images" + File.separator + "sanPham";

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROL;
        AccountDAO aDAO = new AccountDAO();
        CategoryDAO cDAO = new CategoryDAO();
        ProductDAO pDAO = new ProductDAO();
        ArrayList<Account> listA = aDAO.listAll();
        ArrayList<Category> listC = cDAO.listAll();
        ArrayList<Product> listP = pDAO.listAll();
        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "CSKH":
                    url = CSKH;
                    break;
                case "Dashboard":
                    url = "dashboard";
                    break;
                case "Profile":
                    url = PROFILE;
                    break;
                case "LogOut":
                    session.removeAttribute("valueUser");
                    request.getSession(false);
                    session.invalidate();
                    url = LOGIN;
                    break;
                case "Login":
                    url = LOGIN;
                    break;
                case "HomeUser":
                    url = HOMEUSER;
                    listP = pDAO.listAll();
                    session.setAttribute("listP", listP);
                    break;
                case "Guess":
                    url = HOMEUSER;
                    session.setAttribute("valueUser", "guess");
                    session.setAttribute("listA", listA);
                    session.setAttribute("listC", listC);
                    session.setAttribute("listP", listP);
                    break;
                case "LoginAccount":
                    String user = request.getParameter("user");
                    String password = request.getParameter("password");
                    Account a = aDAO.checkExist(user, password);
                    if (a != null) {
                        if (a.isIsUse() == true) {
                            session.setAttribute("a", a);
                            session.setAttribute("valueUser", user);
                            session.setAttribute("role", a.getRoleInSystem());
                            session.setAttribute("listA", listA);
                            session.setAttribute("listC", listC);
                            session.setAttribute("listP", listP);
                            url = "View/HomeUser.jsp";
                        } else {
                            request.setAttribute("status", "<div class=\"alert alert-danger alert-dismissible\">\n"
                                    + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                                    + "    Tài khoản đang bị khóa !!\n"
                                    + "</div>");
                            url = LOGIN;
                        }
                    } else {
                        request.setAttribute("status", "<div class=\"alert alert-danger alert-dismissible\">\n"
                                + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                                + "    Tài khoản hoặc mật khẩu không đúng !!\n"
                                + "</div>");
                        url = LOGIN;
                    }
                    break;
                case "CreateAccountGuessForward":
                    url = CREATEACCOUNTGUESS;
                    break;
                case "CreateAccountGuess":
                    String userG = request.getParameter("user");
                    String passG = request.getParameter("pass");
                    String lastNameG = request.getParameter("lastName");
                    String firstNameG = request.getParameter("firstName");
                    String birthdayG = request.getParameter("birthday");
                    String genderG = request.getParameter("optradio");
                    String phoneG = request.getParameter("phone");
                    Date dG;
                    if (birthdayG != "") {
                        dG = Date.valueOf(birthdayG);
                    } else {
                        dG = null;
                    }
                    boolean genderCheckG = (genderG == "true") ? true : false;

                    if (aDAO.getObjectById(userG) != null) {
                        url = CREATEACCOUNTGUESS;
                        request.setAttribute("status", "<div class=\"alert alert-danger alert-dismissible\">\n"
                                + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                                + "    Tên Tài khoản đã tồn tại !!\n"
                                + "</div>");
                    } else {
                        Account accountGuess = new Account(userG, passG, lastNameG, firstNameG, dG, genderCheckG, phoneG);
                        aDAO.insertRec(accountGuess);
                        request.setAttribute("status", "<div class=\"alert alert-info alert-dismissible\">\n"
                                + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                                + "    Tạo Tài Khoản Thành Công!!\n"
                                + "</div>");
                        url = LOGIN;
                    }
                    break;
                case "DetailProduct":
                    String pId = (String) request.getParameter("pId");
                    Product p = pDAO.getObjectById(pId);
                    request.setAttribute("productDetail", p);
                    url = DETAILPRODUCT;
                    break;
                case "SearchProduct":
                    String condition = request.getParameter("searchName");
                    ArrayList<Product> listPSearch = pDAO.listSearchProduct(condition);
                    session.setAttribute("listP", listPSearch);
                    request.setAttribute("valueSearched", condition);
                    url = HOMEUSER;
                    break;
                case "SelectCat":
                    String cId = request.getParameter("cId");
                    listP = pDAO.selectByCatId(cId);
                    session.setAttribute("listP", listP);
                    session.setAttribute("listC", cDAO.listAll());
                    request.setAttribute("selectedCatId", cId);
                    url = HOMEUSER;
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
