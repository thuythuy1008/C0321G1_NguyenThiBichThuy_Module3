package model.repository;

import model.bean.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository{
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer" + "  (customer_code, customer_name," +
            " customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, " +
            "customer_address, customer_type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_CUSTOMERS = "select * from customer";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_code = ?,customer_name = ?, " +
            "customer_birthday = ?,customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, " +
            "customer_address = ?, customer_type_id = ? where customer_id = ?;";
    private static final String SELECT_CUSTOMER_BY_ID = "select customer_id, customer_code, customer_name, " +
            "customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email," +
            "customer_address, customer_type_id from customer where customer_id =?";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?;";


    @Override
    public List<Customer> selectAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String customerCode =rs.getString("customer_code");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                String customerGender = rs.getString("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");
                int customerTypeId = rs.getInt("customer_type_id");
                customers.add(new Customer(customerId, customerCode, customerName, customerBirthday,customerGender,
                        customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId));
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
        return customers;
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
                statement.setString(1, customer.getCustomerCode());
                statement.setString(2, customer.getCustomerName());
                statement.setString(3, customer.getCustomerBirthday());
                statement.setString(4, customer.getCustomerGender());
                statement.setString(5, customer.getCustomerIdCard());
                statement.setString(6, customer.getCustomerPhone());
                statement.setString(7, customer.getCustomerEmail());
                statement.setString(8, customer.getCustomerAddress());
                statement.setInt(9, customer.getCustomerTypeId());
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
    public Customer selectCustomer(int customerId) {
        Customer customer = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            statement.setInt(1, customerId);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                String customerCode =rs.getString("customer_code");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                String customerGender = rs.getString("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");
                int customerTypeId = rs.getInt("customer_type_id");
                customer = new Customer(customerId, customerCode, customerName, customerBirthday,customerGender,
                        customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);
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
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);

                statement.setString(1, customer.getCustomerCode());
                statement.setString(2, customer.getCustomerName());
                statement.setString(3, customer.getCustomerBirthday());
                statement.setString(4, customer.getCustomerGender());
                statement.setString(5, customer.getCustomerIdCard());
                statement.setString(6, customer.getCustomerPhone());
                statement.setString(7, customer.getCustomerEmail());
                statement.setString(8, customer.getCustomerAddress());
                statement.setInt(9, customer.getCustomerTypeId());
                statement.setInt(10, customer.getCustomerId());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void deleteCustomer(int customerId) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
                statement.setInt(1, customerId);
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
