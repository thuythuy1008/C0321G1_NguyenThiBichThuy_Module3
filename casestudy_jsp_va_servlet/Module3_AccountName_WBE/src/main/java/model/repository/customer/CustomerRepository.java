package model.repository.customer;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerRepository {
    public List<Customer> selectAllCustomers();

    public void insertCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(int customerId);

    public void updateCustomer(Customer customer) throws SQLException;

    public void deleteCustomer(int customerId) throws SQLException;

}
