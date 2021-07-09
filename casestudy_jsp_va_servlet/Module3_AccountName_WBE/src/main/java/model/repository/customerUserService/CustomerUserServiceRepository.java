package model.repository.customerUserService;

import model.bean.Customer;

import java.util.List;

public interface CustomerUserServiceRepository {
    public List<Customer> selectInforCustomers();
}
