package model.service;


import model.bean.Employee;
import model.repository.EmployeeRepository;
import model.repository.EmployeeRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository repository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAllEmployees() {
        return repository.selectAllEmployees();
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        repository.insertEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int employeeId) {
        return repository.selectEmployee(employeeId);
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        repository.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(int employeeId) throws SQLException {
        repository.deleteEmployee(employeeId);
    }
}
