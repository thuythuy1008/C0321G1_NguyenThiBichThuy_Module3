package controller;

import model.bean.Customer;
import model.service.customer.CustomerService;
import model.service.customer.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    CustomerService service = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        try {
            request.setAttribute("customer", service.selectCustomer(customerId));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/view.jsp");
            requestDispatcher.forward(request, response);
        } catch (IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String customerCode =request.getParameter("customerCode");
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        String customerGender = request.getParameter("customerGender");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = service.selectCustomer(customerId);
        customer.setCustomerId(customerId);
        customer.setCustomerCode(customerCode);
        customer.setCustomerName(customerName);
        customer.setCustomerBirthday(customerBirthday);
        customer.setCustomerGender(customerGender);
        customer.setCustomerIdCard(customerIdCard);
        customer.setCustomerPhone(customerPhone);
        customer.setCustomerEmail(customerEmail);
        customer.setCustomerAddress(customerAddress);
        customer.setCustomerTypeId(customerTypeId);
        try {
            service.updateCustomer(customer);
            listCustomers(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerCode =request.getParameter("customerCode");
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        String customerGender = request.getParameter("customerGender");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(customerCode, customerName, customerBirthday, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress, customerTypeId);
        try {
            Map<String, String> mapMessage = service.insertCustomer(customer);
            if (mapMessage.isEmpty()) {
                listCustomers(request, response);
            } else {
                request.setAttribute("messCustomerCode", mapMessage.get("customerCode"));
                request.setAttribute("messCustomerName", mapMessage.get("customerName"));
                request.setAttribute("messCustomerIdCard", mapMessage.get("customerIdCard"));
                request.setAttribute("messCustomerPhone", mapMessage.get("customerPhone"));
                request.setAttribute("messCustomerEmail", mapMessage.get("customerEmail"));
                request.setAttribute("customer",customer);
                showNewCustomer(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        try {
            service.deleteCustomer(customerId);
            request.setAttribute("customerList", service.selectAllCustomers());
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        request.setAttribute("customer", service.selectCustomer(customerId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = service.selectAllCustomers();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
