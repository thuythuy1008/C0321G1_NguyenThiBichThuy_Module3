package model.repository;

import model.bean.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository{
    private static final String INSERT_CONTRACT_SQL = "INSERT INTO contract (contract_start_date, contract_end_date," +
            " contract_deposit, contract_total_money, employee_id, customer_id, service_id) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_CONTRACTS = "select * from contract";
    @Override
    public List<Contract> selectAllContract() {
        List<Contract> contracts = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_CONTRACTS);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int contractId = rs.getInt("contract_id");
                String contractStartDate =rs.getString("contract_start_date");
                String contractEndDate = rs.getString("contract_end_date");
                double contractDeposit = rs.getDouble("contract_deposit");
                double contractTotalMoney = rs.getDouble("contract_total_money");
                int employeeId = rs.getInt("employee_id");
                int customerId = rs.getInt("customer_id");
                int serviceId = rs.getInt("service_id");
                contracts.add(new Contract(contractId, contractStartDate, contractEndDate, contractDeposit,
                        contractTotalMoney, employeeId,customerId,serviceId));
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
        return contracts;
    }

    @Override
    public void insertContract(Contract contract) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_CONTRACT_SQL);
                statement.setString(1, contract.getContractStartDate());
                statement.setString(2, contract.getContractEndDate());
                statement.setDouble(3, contract.getContractDeposit());
                statement.setDouble(4, contract.getContractTotalMoney());
                statement.setInt(5, contract.getEmployeeId());
                statement.setInt(6, contract.getCustomerId());
                statement.setInt(7, contract.getServiceId());
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
