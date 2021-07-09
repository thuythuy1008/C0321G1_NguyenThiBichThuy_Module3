package model.service.employee;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
    public List<Employee> selectAllEmployees();

    public Map<String, String> insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int employeeId);

    public void updateEmployee(Employee employee) throws SQLException;

    public void deleteEmployee(int employeeId) throws SQLException;
}
