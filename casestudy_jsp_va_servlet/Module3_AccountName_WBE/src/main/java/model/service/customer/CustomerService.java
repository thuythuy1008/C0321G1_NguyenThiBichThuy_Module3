package model.service.customer;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    public List<Customer> selectAllCustomers();

    public Map<String, String> insertCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(int customerId);

    public void updateCustomer(Customer customer) throws SQLException;

    public void deleteCustomer(int customerId) throws SQLException;
}
