package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    public List<Employee> selectAllEmployees();

    public void insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int employeeId);

    public void updateEmployee(Employee employee) throws SQLException;

    public void deleteEmployee(int employeeId) throws SQLException;
}
