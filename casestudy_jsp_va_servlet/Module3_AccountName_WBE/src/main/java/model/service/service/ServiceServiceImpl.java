package model.service.service;

import model.bean.Service;
import model.repository.service.ServiceRepositoryImpl;
import model.repository.service.ServiceReposytory;
import model.service.commons.Validate;
import model.service.service.ServiceService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceServiceImpl implements ServiceService {
    ServiceReposytory reposytory = new ServiceRepositoryImpl();

    @Override
    public List<Service> selectAllService() {
        return reposytory.selectAllService();
    }

    @Override
    public Map<String, String> insertService(Service service) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateServiceCode(service.getServiceCode()) != null
                || Validate.validateNameService(service.getServiceName()) != null
                || Validate.validateCost(service.getServiceCost()) != null
                || Validate.validateNumberOfFloors(service.getNumberOfFloors()) != null) {
            mapMessage.put("serviceCode", Validate.validateServiceCode(service.getServiceCode()));
            mapMessage.put("serviceName", Validate.validateNameService(service.getServiceName()));
            mapMessage.put("serviceCost", Validate.validateCost(service.getServiceCost()));
            mapMessage.put("numberOfFloors", Validate.validateNumberOfFloors(service.getNumberOfFloors()));
        } else {
            reposytory.insertService(service);
        }
       return mapMessage;
    }
}
