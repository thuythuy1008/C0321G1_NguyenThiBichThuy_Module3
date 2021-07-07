package model.service;

import model.bean.Contract;
import model.repository.ContractRepository;
import model.repository.ContractRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements ContractService {
    ContractRepository repository = new ContractRepositoryImpl();

    @Override
    public List<Contract> selectAllContract() {
        return repository.selectAllContract();
    }

    @Override
    public void insertContract(Contract contract) throws SQLException {
        repository.insertContract(contract);
    }
}
