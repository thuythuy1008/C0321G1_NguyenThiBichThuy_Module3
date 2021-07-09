package model.repository.service;

import model.bean.Service;
import model.repository.DBConnection;
import model.repository.service.ServiceReposytory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceReposytory {
    private static final String INSERT_SERVICE_SQL = "INSERT INTO service" + "  (service_code, service_name," +
            " service_area, service_cost, service_max_people, standard_room, description_other_convenience, " +
            "pool_area, number_of_floors, service_type_id, rent_type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_SERVICES = "select * from service";

    @Override
    public List<Service> selectAllService() {
        List<Service> services = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_SERVICES);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String serviceCode =rs.getString("service_code");
                String serviceName = rs.getString("service_name");
                int serviceArea = rs.getInt("service_area");
                double serviceCost = rs.getDouble("service_cost");
                int serviceMaxPeople = rs.getInt("service_max_people");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double pollArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");
                int serviceTypeId = rs.getInt("service_type_id");
                int rentTypeId = rs.getInt("rent_type_id");
                services.add(new Service(serviceId, serviceCode, serviceName, serviceArea,serviceCost, serviceMaxPeople
                        ,standardRoom,descriptionOtherConvenience,pollArea,numberOfFloors, serviceTypeId, rentTypeId));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DBConnection.close();
        }
        return services;
    }

    @Override
    public void insertService(Service service) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_SERVICE_SQL);
                statement.setString(1, service.getServiceCode());
                statement.setString(2, service.getServiceName());
                statement.setInt(3, service.getServiceArea());
                statement.setDouble(4, service.getServiceCost());
                statement.setInt(5, service.getServiceMaxPeople());
                statement.setString(6, service.getStandardRoom());
                statement.setString(7, service.getDescriptionOtherConvenience());
                statement.setDouble(8, service.getPollArea());
                statement.setInt(9, service.getNumberOfFloors());
                statement.setInt(10, service.getServiceTypeId());
                statement.setInt(11, service.getRentTypeId());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }
}
