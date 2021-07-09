package controller;

import model.bean.ContractDetail;
import model.service.contractDetail.ContractDetailService;
import model.service.contractDetail.ContractDetailServiceImpl;

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

@WebServlet(name = "ContractDetailServlet", urlPatterns = {"/contractDetail"})
public class ContractDetailServlet extends HttpServlet {
    ContractDetailService contractDetailService = new ContractDetailServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertContractDetail(request, response);
                break;
            default:
                listContractDetail(request, response);
                break;
        }
    }

    private void insertContractDetail(HttpServletRequest request, HttpServletResponse response) {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractId, attachServiceId, quantity);
        try {
            Map<String, String> mapMessage =  contractDetailService.insertContractDetail(contractDetail);
            if (mapMessage.isEmpty()) {
                listContractDetail(request, response);
            } else {
                request.setAttribute("messQuantity", mapMessage.get("quantity"));
                request.setAttribute("contractDetail",contractDetail);
                showNewContractDetail(request, response);
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
                showNewContractDetail(request, response);
                break;
            default:
                listContractDetail(request, response);
                break;
        }
    }

    private void showNewContractDetail(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contractDetail/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listContractDetail(HttpServletRequest request, HttpServletResponse response) {
        List<ContractDetail> contractDetailList = contractDetailService.selectAllContractDetail();
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contractDetail/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
