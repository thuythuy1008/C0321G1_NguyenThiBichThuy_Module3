package model.service.service;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ServiceService {
    public List<Service> selectAllService();

    public Map<String, String> insertService(Service service) throws SQLException;
}
