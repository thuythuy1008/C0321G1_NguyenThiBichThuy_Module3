package model.service.customer;

import model.bean.Customer;
import model.repository.customer.CustomerRepository;
import model.repository.customer.CustomerRepositoryImpl;
import model.service.commons.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository repository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> selectAllCustomers() {
        return repository.selectAllCustomers();
    }

    @Override
    public Map<String, String> insertCustomer(Customer customer) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateCustomerCode(customer.getCustomerCode()) != null
                || Validate.validateName(customer.getCustomerName()) != null
                || Validate.validateIdCard(customer.getCustomerIdCard()) != null
                || Validate.validatePhone(customer.getCustomerPhone()) != null
                || Validate.validateEmail(customer.getCustomerEmail()) != null) {
            mapMessage.put("customerCode", Validate.validateCustomerCode(customer.getCustomerCode()));
            mapMessage.put("customerName", Validate.validateName(customer.getCustomerName()));
            mapMessage.put("customerIdCard", Validate.validateIdCard(customer.getCustomerIdCard()));
            mapMessage.put("customerPhone", Validate.validatePhone(customer.getCustomerPhone()));
            mapMessage.put("customerEmail", Validate.validateEmail(customer.getCustomerEmail()));
        } else {
            repository.insertCustomer(customer);
        }
        return mapMessage;
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
