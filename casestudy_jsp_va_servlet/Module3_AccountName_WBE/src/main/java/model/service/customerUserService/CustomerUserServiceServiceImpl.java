package model.service.customerUserService;

import model.bean.Customer;
import model.repository.customerUserService.CustomerUserServiceRepository;
import model.repository.customerUserService.CustomerUserServiceRepositoryImpl;

import java.util.List;

public class CustomerUserServiceServiceImpl implements CustomerUserServiceService {
    CustomerUserServiceRepository repository = new CustomerUserServiceRepositoryImpl();
    @Override
    public List<Customer> selectInforCustomers() {
        return repository.selectInforCustomers();
    }
}
