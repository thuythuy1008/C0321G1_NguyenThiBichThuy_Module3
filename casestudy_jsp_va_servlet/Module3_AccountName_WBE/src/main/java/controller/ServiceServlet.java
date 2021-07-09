package controller;

import model.bean.Service;
import model.service.service.ServiceService;
import model.service.service.ServiceServiceImpl;

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

@WebServlet(name = "ServiceServlet",urlPatterns = {"/service"})
public class ServiceServlet extends HttpServlet {
    ServiceService serviceService = new ServiceServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "createVilla":
                insertVilla(request, response);
                break;
            case "createHouse":
                insertHouse(request, response);
                break;
            case "createRoom":
                insertRoom(request, response);
                break;
            default:
                showHome(request, response);
                break;
        }
    }

    private void insertRoom(HttpServletRequest request, HttpServletResponse response) {
        String serviceCode =request.getParameter("serviceCode");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Service service = new Service(serviceCode, serviceName, serviceArea, serviceCost, serviceMaxPeople,
                serviceTypeId, rentTypeId);
        try {
            Map<String, String> mapMessage = serviceService.insertService(service);
            if (mapMessage.isEmpty()) {
                listService(request, response);
            } else {
                request.setAttribute("messServiceCode", mapMessage.get("serviceCode"));
                request.setAttribute("messServiceName", mapMessage.get("serviceName"));
                request.setAttribute("messServiceCost", mapMessage.get("serviceCost"));
                request.setAttribute("service",service);
                showNewRoom(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertHouse(HttpServletRequest request, HttpServletResponse response) {
        String serviceCode =request.getParameter("serviceCode");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Service service = new Service(serviceCode, serviceName, serviceArea, serviceCost, serviceMaxPeople,
                standardRoom, descriptionOtherConvenience, numberOfFloors, serviceTypeId, rentTypeId);
        try {
            Map<String, String> mapMessage = serviceService.insertService(service);
            if (mapMessage.isEmpty()) {
                listService(request, response);
            } else {
                request.setAttribute("messServiceCode", mapMessage.get("serviceCode"));
                request.setAttribute("messServiceName", mapMessage.get("serviceName"));
                request.setAttribute("messServiceCost", mapMessage.get("serviceCost"));
                request.setAttribute("messNumberOfFloors", mapMessage.get("numberOfFloors"));
                request.setAttribute("service",service);
                showNewHouse(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    private void insertVilla(HttpServletRequest request, HttpServletResponse response) {
        String serviceCode =request.getParameter("serviceCode");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double pollArea = Double.parseDouble(request.getParameter("pollArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Service service = new Service(serviceCode, serviceName, serviceArea, serviceCost, serviceMaxPeople,
                standardRoom, descriptionOtherConvenience, pollArea, numberOfFloors, serviceTypeId, rentTypeId);
        try {
            Map<String, String> mapMessage = serviceService.insertService(service);
            if (mapMessage.isEmpty()) {
                listService(request, response);
            } else {
                request.setAttribute("messServiceCode", mapMessage.get("serviceCode"));
                request.setAttribute("messServiceName", mapMessage.get("serviceName"));
                request.setAttribute("messServiceCost", mapMessage.get("serviceCost"));
                request.setAttribute("messNumberOfFloors", mapMessage.get("numberOfFloors"));
                request.setAttribute("service",service);
                showNewVilla(request, response);
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
            case "createVilla":
                showNewVilla(request, response);
                break;
            case "createHouse":
                showNewHouse(request, response);
                break;
            case "createRoom":
                showNewRoom(request, response);
                break;
            case "list":
                listService(request, response);
                break;
            default:
                showHome(request, response);
                break;
        }
    }

    private void showNewRoom(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/create-room.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewHouse(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/create-house.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/service-home.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewVilla(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/create-villa.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
