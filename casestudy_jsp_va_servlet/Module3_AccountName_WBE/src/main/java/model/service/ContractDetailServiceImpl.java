package model.service;

import model.bean.ContractDetail;
import model.repository.ContractDetailRepository;
import model.repository.ContractDetailRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService {
    ContractDetailRepository repository = new ContractDetailRepositoryImpl();

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        return repository.selectAllContractDetail();
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        repository.insertContractDetail(contractDetail);
    }
}
