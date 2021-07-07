package model.service;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailService {
    public List<ContractDetail> selectAllContractDetail();

    public void insertContractDetail(ContractDetail contractDetail) throws SQLException;
}
