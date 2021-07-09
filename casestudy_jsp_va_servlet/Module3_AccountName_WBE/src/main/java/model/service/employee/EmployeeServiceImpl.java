package model.service.employee;


import model.bean.Employee;
import model.repository.employee.EmployeeRepository;
import model.repository.employee.EmployeeRepositoryImpl;
import model.service.commons.Validate;
import model.service.employee.EmployeeService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository repository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAllEmployees() {
        return repository.selectAllEmployees();
    }

    @Override
    public Map<String, String> insertEmployee(Employee employee) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateName(employee.getEmployeeName()) != null
                || Validate.validateIdCard(employee.getEmployeeIdCard()) != null
                || Validate.validateSalary(employee.getEmployeeSalary()) != null
                || Validate.validatePhone(employee.getEmployeePhone()) != null
                || Validate.validateEmail(employee.getEmployeeEmail()) != null) {
            mapMessage.put("employeeName", Validate.validateName(employee.getEmployeeName()));
            mapMessage.put("employeeIdCard", Validate.validateIdCard(employee.getEmployeeIdCard()));
            mapMessage.put("employeeSalary", Validate.validateSalary(employee.getEmployeeSalary()));
            mapMessage.put("employeePhone", Validate.validatePhone(employee.getEmployeePhone()));
            mapMessage.put("employeeEmail", Validate.validateEmail(employee.getEmployeeEmail()));
        } else {
            repository.insertEmployee(employee);
        }
        return mapMessage;
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
