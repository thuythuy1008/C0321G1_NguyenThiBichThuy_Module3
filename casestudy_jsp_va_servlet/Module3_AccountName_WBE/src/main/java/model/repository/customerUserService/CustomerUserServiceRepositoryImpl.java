package model.repository.customerUserService;

import model.bean.Customer;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerUserServiceRepositoryImpl implements CustomerUserServiceRepository {
    private static final String SELECT_INFOR_CUSTOMERS = "select customer.customer_id, customer.customer_code, customer.customer_name, customer.customer_id_card,\n" +
            " customer.customer_address, contract.contract_id, contract_detail.contract_detail_id, attach_service.attach_service_name,\n" +
            " sum(service.service_cost + contract_detail.quantity * attach_service.attach_service_cost) as \"total_money\"\n" +
            "from customer\n" +
            "join contract on customer.customer_id = contract.customer_id\n" +
            "join service on contract.service_id = service.service_id\n" +
            "join contract_detail on contract.contract_id = contract_detail.contract_id\n" +
            "join attach_service on contract_detail.attach_service_id = attach_service.attach_service_id\n" +
            "group by customer.customer_id;";
    @Override
    public List<Customer> selectInforCustomers() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_INFOR_CUSTOMERS);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String customerCode =rs.getString("customer_code");
                String customerName = rs.getString("customer_name");
                String customerIdCard = rs.getString("customer_id_card");
                String customerAddress = rs.getString("customer_address");
                int contractId = rs.getInt("contract_id");
                int contractDetailId = rs.getInt("contract_detail_id");
                String attachServiceName = rs.getString("attach_service_name");
                double totalMoney = rs.getDouble("total_money");
                customers.add(new Customer(customerId, customerCode, customerName, customerIdCard,customerAddress,
                        contractId,contractDetailId,attachServiceName, totalMoney));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
        return customers;
    }
}
