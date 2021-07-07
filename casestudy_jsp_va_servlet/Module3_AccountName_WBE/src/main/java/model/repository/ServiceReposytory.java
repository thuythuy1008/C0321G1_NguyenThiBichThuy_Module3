package model.repository;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface ServiceReposytory {
    public List<Service> selectAllService();

    public void insertService(Service service) throws SQLException;
}
