package model.repository.contractDetail;

import model.bean.ContractDetail;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository{
    private static final String INSERT_CONTRACT_DETAIL_SQL = "INSERT INTO contract_detail (contract_id," +
            "attach_service_id, quantity) VALUES (?, ?, ?);";
    private static final String SELECT_ALL_CONTRACT_DETAIL = "select * from contract_detail";
    @Override
    public List<ContractDetail> selectAllContractDetail() {
        List<ContractDetail> contractDetails = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL);
            System.out.println(statement);
            rs = statement.executeQuery();

            while (rs.next()) {
                int contractDetailId = rs.getInt("contract_detail_id");
                int contractId = rs.getInt("contract_id");
                int attachServiceId = rs.getInt("attach_service_id");
                int quantity = rs.getInt("quantity");
                contractDetails.add(new ContractDetail(contractDetailId, contractId, attachServiceId, quantity));
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
        return contractDetails;
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_CONTRACT_DETAIL_SQL);
                statement.setInt(1, contractDetail.getContractId());
                statement.setInt(2, contractDetail.getAttachServiceId());
                statement.setInt(3, contractDetail.getQuantity());
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
