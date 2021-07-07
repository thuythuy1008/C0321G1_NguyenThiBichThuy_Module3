package model.service;

import model.bean.Customer;
import model.repository.CustomerUserServiceRepository;
import model.repository.CustomerUserServiceRepositoryImpl;

import java.util.List;

public class CustomerUserServiceServiceImpl implements CustomerUserServiceService{
    CustomerUserServiceRepository repository = new CustomerUserServiceRepositoryImpl();
    @Override
    public List<Customer> selectInforCustomers() {
        return repository.selectInforCustomers();
    }
}
