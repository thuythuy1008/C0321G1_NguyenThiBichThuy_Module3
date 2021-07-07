package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository{
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee (employee_name, employee_birthday," +
            "employee_id_card, employee_salary, employee_phone, employee_email, employee_address, " +
            "position_id, education_degree_id, division_id, user_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_EMPLOYEES = "select * from employee";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set employee_name = ?,employee_birthday = ?, " +
            "employee_id_card = ?,employee_salary = ?,employee_phone = ?,employee_email = ?,employee_address = ?, " +
            "position_id = ?,education_degree_id = ?,division_id = ?,user_name = ? where employee_id = ?;";
    private static final String SELECT_EMPLOYEE_BY_ID = "select employee_id, employee_id, employee_name, employee_birthday," +
            "employee_id_card, employee_salary, employee_phone, employee_email, employee_address," +
            "position_id, education_degree_id, division_id, user_name from employee where employee_id =?";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where employee_id = ?;";
    @Override
    public List<Employee> selectAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int employeeId = rs.getInt("employee_id");
                String employeeName =rs.getString("employee_name");
                String employeeBirthday = rs.getString("employee_birthday");
                String employeeIdCard = rs.getString("employee_id_card");
                double employeeSalary = rs.getDouble("employee_salary");
                String employeePhone = rs.getString("employee_phone");
                String employeeEmail = rs.getString("employee_email");
                String employeeAddress = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String userName = rs.getString("user_name");
                employees.add(new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,employeeSalary,
                        employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId, divisionId, userName));
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
        return employees;
    }

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_EMPLOYEE_SQL);
                statement.setString(1, employee.getEmployeeName());
                statement.setString(2, employee.getEmployeeBirthday());
                statement.setString(3, employee.getEmployeeIdCard());
                statement.setDouble(4, employee.getEmployeeSalary());
                statement.setString(5, employee.getEmployeePhone());
                statement.setString(6, employee.getEmployeeEmail());
                statement.setString(7, employee.getEmployeeAddress());
                statement.setInt(8, employee.getPositionId());
                statement.setInt(9, employee.getEducationDegreeId());
                statement.setInt(10, employee.getDivisionId());
                statement.setString(11, employee.getUserName());
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

    @Override
    public Employee selectEmployee(int employeeId) {
        Employee employee = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            statement.setInt(1, employeeId);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                String employeeName =rs.getString("employee_name");
                String employeeBirthday = rs.getString("employee_birthday");
                String employeeIdCard = rs.getString("employee_id_card");
                double employeeSalary = rs.getDouble("employee_salary");
                String employeePhone = rs.getString("employee_phone");
                String employeeEmail = rs.getString("employee_email");
                String employeeAddress = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String userName = rs.getString("user_name");

                employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,employeeSalary,
                        employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId, divisionId, userName);
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
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);

                statement.setString(1, employee.getEmployeeName());
                statement.setString(2, employee.getEmployeeBirthday());
                statement.setString(3, employee.getEmployeeIdCard());
                statement.setDouble(4, employee.getEmployeeSalary());
                statement.setString(5, employee.getEmployeePhone());
                statement.setString(6, employee.getEmployeeEmail());
                statement.setString(7, employee.getEmployeeAddress());
                statement.setInt(8, employee.getPositionId());
                statement.setInt(9, employee.getEducationDegreeId());
                statement.setInt(10, employee.getDivisionId());
                statement.setString(11, employee.getUserName());
                statement.setInt(12, employee.getEmployeeId());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void deleteEmployee(int employeeId) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);
                statement.setInt(1, employeeId);
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
