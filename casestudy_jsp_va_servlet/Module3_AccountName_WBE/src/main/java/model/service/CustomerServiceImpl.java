package model.service;

import com.sun.org.apache.regexp.internal.RE;
import model.bean.Customer;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService{
    CustomerRepository repository =new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAllCustomers() {
        return repository.selectAllCustomers();
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        repository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int customerId) {
        return repository.selectCustomer(customerId);
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        repository.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int customerId) throws SQLException {
        repository.deleteCustomer(customerId);
    }
}
