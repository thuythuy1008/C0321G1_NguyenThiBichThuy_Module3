package model.repository.contractDetail;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailRepository {
    public List<ContractDetail> selectAllContractDetail();

    public void insertContractDetail(ContractDetail contractDetail) throws SQLException;
}
