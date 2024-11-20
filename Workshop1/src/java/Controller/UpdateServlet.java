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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    final static String ADDACCOUNT = "View/CreateAccount.jsp";
    final static String UPDATEACCOUNT = "View/UpdateAccount.jsp";
    final static String ADDPRODUCT = "View/AddProduct.jsp";
    final static String UPDATEPRODUCT = "View/UpdateProduct.jsp";
    final static String ADDCAT = "View/CreateCat.jsp";
    final static String UPDATECAT = "View/UpdateCategory.jsp";
    final static String LOGIN = "View/LogIn.jsp";
    final static String DACCOUNT = "View/DashboardAccount.jsp";
    final static String DCATEGORY = "View/DashboardCategory.jsp";
    final static String DPRODUCT = "View/DashboardProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AccountDAO aDAO = new AccountDAO();
        CategoryDAO cDAO = new CategoryDAO();
        ProductDAO pDAO = new ProductDAO();
        ArrayList<Account> listA = aDAO.listAll();
        ArrayList<Category> listC = cDAO.listAll();
        ArrayList<Product> listP = pDAO.listAll();
        HttpSession session = request.getSession();
        String url = "";
        switch (action) {
            // Account ===================================================
            case "update":
                url = DACCOUNT;
                break;
            case "addAccountFoward":
                url = ADDACCOUNT;
                break;
            case "addAccount":
                String userCreate = request.getParameter("user");
                String pass = request.getParameter("pass");
                String lastName = request.getParameter("lastName");
                String firstName = request.getParameter("firstName");
                String birthday = request.getParameter("birthday");
                int role = Integer.parseInt(request.getParameter("role"));
                Date d;
                if (birthday.length() != 0) {
                    d = Date.valueOf(birthday);
                } else {
                    d = null;
                }
                String gender = request.getParameter("optradio");
                boolean genderCheck = (gender == "true") ? true : false;
                String phone = request.getParameter("phone");
                if (aDAO.getObjectById(userCreate) != null) {
//                    request.setAttribute("valueUser", userCreate);
//                    request.setAttribute("valuePass", pass);
//                    request.setAttribute("valueFirstName", firstName);
//                    request.setAttribute("valueLastName", lastName);
//                    request.setAttribute("valueBirthday", d);
//                    request.setAttribute("valueGender", gender);
//                    request.setAttribute("valuePhone", phone);
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-danger alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Tên Tài khoản đã tồn tại !!\n"
                            + "</div>");
                    url = ADDACCOUNT;
                } else {
                    Account acc = new Account(userCreate, pass, lastName, firstName, d, genderCheck, phone, true, role);
                    aDAO.insertRec(acc);
                    session.setAttribute("listA", aDAO.listAll());
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-info alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Tạo Tài Khoản Thành Công !!\n"
                            + "</div>");
                    url = DACCOUNT;
                }
                break;
            case "updateAccountForward":
                url = UPDATEACCOUNT;
                session.setAttribute("aUpdate", aDAO.getObjectById(request.getParameter("aId")));
                break;
            case "updateAccount":
                Account aUpdate = (Account) session.getAttribute("aUpdate");
                String passUpdate = request.getParameter("pass");
                String lastNameUpdate = request.getParameter("lastName");
                String firstNameUpdate = request.getParameter("firstName");
                String birthdayUpdate = request.getParameter("birthday");
                String phoneUpdate = request.getParameter("phone");
                int roleUpdate = Integer.parseInt(request.getParameter("role"));
                String isUseUpdate = request.getParameter("isUse");
                String genderUpdate = request.getParameter("optradio");
                boolean genderCheckUpdate = (genderUpdate.equalsIgnoreCase("1")) ? true : false;
                boolean isUseUpdateB;
                if (isUseUpdate != null) {
                    isUseUpdateB = true;
                } else {
                    isUseUpdateB = false;
                }
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
                aUpdate.setIsUse(isUseUpdateB);
                aDAO.updateRec(aUpdate);
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Cập Nhật Thành Công!!\n"
                        + "</div>");
                url = UPDATEACCOUNT;
                session.setAttribute("listA", aDAO.listAll());
                break;
            case "deleteAccount":
                String aIdDelete = request.getParameter("aId");
                ArrayList<Product> listProduct = pDAO.selectByAcc(aIdDelete);
                for (Product product : listProduct) {
                    pDAO.deleteRec(product);
                }
                aDAO.deleteRec(aDAO.getObjectById(aIdDelete));
                session.setAttribute("listA", aDAO.listAll());
                session.setAttribute("listP", pDAO.listAll());
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Xóa Tài Khoản Thành Công !!\n"
                        + "</div>");
                url = DACCOUNT;
                break;
            case "deactiveAccount":
                String aId = request.getParameter("aId");
                boolean isUse = Boolean.valueOf(request.getParameter("isUse"));
                Account aIsUser = aDAO.getObjectById(aId);
                if (isUse == true) {
                    aIsUser.setIsUse(false);
                } else {
                    aIsUser.setIsUse(true);
                }
                aDAO.updateRec(aIsUser);
                session.setAttribute("listA", aDAO.listAll());
                url = DACCOUNT;
                break;
            // Category ==================================================
            case "addCatForward":
                url = ADDCAT;
                break;
            case "addCat":
                String nameCat = request.getParameter("name");
                String memoCat = request.getParameter("memo");
                Category cat = new Category(nameCat, memoCat);
                cDAO.insertRec(cat);
                session.setAttribute("listC", cDAO.listAll());
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Tạo Thể Loại Thành Công!!\n"
                        + "</div>");
                url = ADDCAT;
                break;
            case "updateCatForward":
                url = UPDATECAT;
                session.setAttribute("cUpdate", cDAO.getObjectById(request.getParameter("cId")));
                break;
            case "updateCat":
                try {
                    Category cUpdate = (Category) session.getAttribute("cUpdate");
                    String nameCate = request.getParameter("name");
                    String memoCate = request.getParameter("memo");
                    cUpdate.setCategoryName(nameCate);
                    cUpdate.setMemo(memoCate);
                    cDAO.updateRec(cUpdate);
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Cập Nhật Thành Công!!\n"
                            + "</div>");
                    session.setAttribute("listC", cDAO.listAll());
                    url = UPDATECAT;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "deleteCat":
                String cIdDelete = request.getParameter("cId");
                ArrayList<Product> list = pDAO.selectByCatId(cIdDelete);
                for (Product product : list) {
                    pDAO.deleteRec(product);
                }
                cDAO.deleteRec(cDAO.getObjectById(cIdDelete));
                session.setAttribute("listC", cDAO.listAll());
                session.setAttribute("listP", pDAO.listAll());
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Xóa Thể Loại Thành Công !!\n"
                        + "</div>");
                url = DCATEGORY;
                break;
            // Product ====================================================
            case "addProductForward":
                url = ADDPRODUCT;
                break;
            case "addProduct":
                String productIdC = request.getParameter("id");
                if (pDAO.getObjectById(productIdC) != null) {
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-danger alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Mã Sản Phẩm Đã Tồn Tại!!\n"
                            + "</div>");
                    url = ADDPRODUCT;
                } else {
                    String productname = request.getParameter("name");
                    String productTypeId = request.getParameter("typeId");
                    String productImage = "/images/sanPham/" + uploadImage(request, response);
                    if (productImage.equals("/images/sanPham/")) {
                        productImage = "";
                    }
                    String productBrief = request.getParameter("brief");
                    String productDateString = request.getParameter("date");
                    String productUnit = request.getParameter("unit");
                    String productPriceString = request.getParameter("price");
                    int productDiscount = Integer.parseInt(request.getParameter("discount"));
                    int productPriceInt = Integer.parseInt(String.join("", productPriceString.split("[.]")));
                    Date productDate;
                    if (productDateString.length() != 0) {
                        productDate = Date.valueOf(productDateString);
                    } else {
                        productDate = null;
                    }
                    Product productAdd = new Product(productIdC, productname, productImage, productBrief, productDate, cDAO.getObjectById(productTypeId), aDAO.getObjectById((String) session.getAttribute("valueUser")), productUnit, productPriceInt, productDiscount);
                    pDAO.insertRec(productAdd);
                    session.setAttribute("listP", pDAO.listAll());
                    request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    Thêm Sản Phẩm Mới Thành Công!!\n"
                            + "</div>");
                    url = DPRODUCT;
                }
                break;
            case "updateProductForward":
                url = UPDATEPRODUCT;
                session.setAttribute("pUpdate", pDAO.getObjectById(request.getParameter("pId")));
                break;
            case "updateProduct":
                url = "View/UpdateProduct.jsp";
                Product pUpdate = (Product) session.getAttribute("pUpdate");
                String name = request.getParameter("name");
                String image = "/images/sanPham/" + uploadImage(request, response);
                String statusImage = request.getParameter("statusImage");
                if (statusImage.equals("1")) {
                    if (image.equals("/images/sanPham/")) {
                        image = "";
                    }
                } else {
                    image = pUpdate.getProductImage();
                }

                String brief = request.getParameter("brief");
                String date = request.getParameter("date");
                String unit = request.getParameter("unit");
                String price = request.getParameter("price");
                String token[] = price.split("[.]");
                int priceInt = Integer.parseInt(String.join("", token));
                int discount = Integer.parseInt(request.getParameter("discount"));
                Date dUpdate;
                if (date.length() != 0) {
                    dUpdate = Date.valueOf(date);
                } else {
                    dUpdate = null;
                }
                pUpdate.setProductName(name);
                pUpdate.setProductImage(image);
                pUpdate.setBrief(brief);
                pUpdate.setPostedDate(dUpdate);
                pUpdate.setUnit(unit);
                pUpdate.setPrice(priceInt);
                pUpdate.setDiscount(discount);
                pDAO.updateRec(pUpdate);
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Cập Nhật Thành Công!!\n"
                        + "</div>");
                session.setAttribute("listP", pDAO.listAll());
                break;
            case "deleteProduct":
                String pIdDelete = request.getParameter("pId");
                pDAO.deleteRec(pDAO.getObjectById(pIdDelete));
                session.setAttribute("listP", pDAO.listAll());
                request.setAttribute("statusUpdate", "<div class=\"alert alert-success alert-dismissible\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    Xóa Sản Phẩm Thành Công !!\n"
                        + "</div>");
                url = DPRODUCT;
                break;
            // =======================================================
        }
        request.getRequestDispatcher(url).forward(request, response);
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
    //Config Image
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images" + File.separator + "sanPham";

    private String uploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //======================================================
        String nameImage = "";
        String b = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        String[] uploadStrings = b.split("\\\\build");
        String uploadPath = String.join("", uploadStrings);
        // Tạo thư mục nếu nó không tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        // Lưu các file được upload vào thư mục images/sanPham
        int count = 1;
        for (Part part : request.getParts()) {
            if (part.getSubmittedFileName() != null) {
                nameImage = part.getSubmittedFileName();
                if (part.getSubmittedFileName().length() != 0) {
                    part.write(uploadPath + File.separator + part.getSubmittedFileName());
                }
            }
            count++;
        }
        return nameImage;
    }
}
