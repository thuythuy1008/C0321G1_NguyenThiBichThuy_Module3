package model.service;

import model.bean.Service;
import model.repository.ServiceRepositoryImpl;
import model.repository.ServiceReposytory;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements ServiceService {
    ServiceReposytory reposytory = new ServiceRepositoryImpl();

    @Override
    public List<Service> selectAllService() {
        return reposytory.selectAllService();
    }

    @Override
    public void insertService(Service service) throws SQLException {
        reposytory.insertService(service);
    }
}
