package model.repository;

import model.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository{
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USERS_BY_COUNTRY = "select * from users where country = ?;";
    private static final String SORT_BY_NAME = "select * ,(substring_index(name ,\" \", -1)) as \"first_name\" from users order by first_name";
    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement=connection.prepareStatement(INSERT_USERS_SQL);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());

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
    public User selectUser(int id) {
        User user = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_USER_BY_ID);
            statement.setInt(1, id);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
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
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_USERS);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
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
        return users;
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_USERS_SQL);
                statement.setInt(1, id);
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void updateUser(User user) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_USERS_SQL);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.setInt(4, user.getId());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public List<User> findByCountry(String stringName) throws SQLException {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet =null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_USERS_BY_COUNTRY);
                statement.setString(1, stringName);
                resultSet = statement.executeQuery();
                User user = null;

                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");

                    user = new User(id, name, email, country);
                    userList.add(user);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return userList;
    }

    @Override
    public List<User> sortByName() throws SQLException {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet =null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SORT_BY_NAME);
                resultSet = statement.executeQuery();
                User user = null;

                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");

                    user = new User(id, name, email, country);
                    userList.add(user);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return userList;
    }
}
