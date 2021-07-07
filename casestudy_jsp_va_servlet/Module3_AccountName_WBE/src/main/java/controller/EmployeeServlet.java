package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.service.EmployeeService;
import model.service.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                listEmployees(request, response);
                break;
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        try {
            request.setAttribute("employee", employeeService.selectEmployee(employeeId));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/view.jsp");
            requestDispatcher.forward(request, response);
        } catch (IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName =request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");

        Employee employee = employeeService.selectEmployee(employeeId);
        employee.setEmployeeId(employeeId);
        employee.setEmployeeName(employeeName);
        employee.setEmployeeBirthday(employeeBirthday);
        employee.setEmployeeIdCard(employeeIdCard);
        employee.setEmployeeSalary(employeeSalary);
        employee.setEmployeePhone(employeePhone);
        employee.setEmployeeEmail(employeeEmail);
        employee.setEmployeeAddress(employeeAddress);
        employee.setPositionId(positionId);
        employee.setEducationDegreeId(educationDegreeId);
        employee.setDivisionId(divisionId);
        employee.setUserName(userName);
        try {
            employeeService.updateEmployee(employee);
            listEmployees(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName =request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, userName);
        try {
            employeeService.insertEmployee(employee);
            listEmployees(request, response);
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
                showNewEmployee(request, response);
                break;
            case "edit":
                showEditEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                listEmployees(request, response);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        try {
            employeeService.deleteEmployee(employeeId);
            request.setAttribute("employeeList", employeeService.selectAllEmployees());
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        request.setAttribute("employee", employeeService.selectEmployee(employeeId));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployees(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployees();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
