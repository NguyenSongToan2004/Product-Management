/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class CartServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        switch (action) {
            case "cartForward":
                request.getRequestDispatcher("View/Cart.jsp").forward(request, response);
                break;
            case "change":
                update(request, response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("pId");
        String txt = "";
        String result = "";
        int count = 0;
        int quantity = 0;
        String action2 = request.getParameter("action2"); // Biện pháp 
        HttpSession ses = request.getSession();
        String user = (String) ses.getAttribute("valueUser");
        Cookie[] cookie = request.getCookies();
        if (cookie != null) {
            for (Cookie c : cookie) {
                if (c.getName().equals("Cart" + user)) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }

        if (action2.equals("addNeg") || action2.equals("addToCart") || action2.equals("addDetail")) {
            String op = request.getParameter("op");
            if (action2.equals("addNeg") && !action2.equals("addDetail")) {
                if (op.equals("-")) {
                    quantity = -1;
                } else {
                    quantity = 1;
                }
            } else {
                quantity = 1;
            }

            // Tăng Giảm
            if (txt.length() == 0) {
                txt = txt + id + ":" + quantity;
            } else {
                if (txt.contains(id)) {
                    String[] token = txt.split("/");
                    for (String s : token) {
                        String[] part = s.split(":");
                        if (part[0].equals(id)) {
                            part[1] = Integer.parseInt(part[1]) + quantity + "";
                            if (count == 0) {
                                result = result + part[0] + ":" + part[1];
                            } else {
                                result = result + "/" + part[0] + ":" + part[1];
                            }
                        } else {
                            if (count == 0) {
                                result = result + s;
                            } else {
                                result = result + "/" + s;
                            }
                        }
                        count++;
                    }
                    txt = result;
                } else {
                    txt = txt + "/" + id + ":" + quantity;
                }
            }
        } else if (action2.equals("update")) {
            String[] token = txt.split("/");
            quantity = Integer.parseInt(request.getParameter("quantity"));
            // xử lí txt
            for (String s : token) {
                if (s.contains(id)) {
                    if (count == 0) {
                        result = id + ":" + quantity;
                    } else {
                        result = result + "/" + id + ":" + quantity;
                    }
                } else {
                    if (count == 0) {
                        result = s;
                    } else {
                        result = result + "/" + s;
                    }
                }
                count++;
            }
            txt = result;
        } else if (action2.equals("delete")) {
            String[] token = txt.split("/");
            for (String s : token) {
                if (!s.contains(id)) {
                    if (count == 0) {
                        result += s;
                    } else {
                        result += "/" + s;
                    }
                    count++;
                }
            }
            txt = result;
        }
        Cookie c = new Cookie("Cart" + user, txt);
        Cookie cName = new Cookie("cName", "cookie.Cart" + user + ".value");
        c.setMaxAge(60 * 60);
        response.addCookie(c);
        response.addCookie(cName);
        if (action2.equals("addToCart")) {
            response.sendRedirect("home");
        } else if (action2.equals("addDetail")) {
            request.setAttribute("status", "<div class=\"alert alert-info alert-dismissible\">\n"
                    + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                    + "    Thêm vào giỏ hàng thành công!!\n"
                    + "</div>");
            request.getRequestDispatcher("MainController?action=DetailProduct").forward(request, response);
        } else {
            response.sendRedirect("cart?action=cartForward");
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
