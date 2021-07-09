package model.service.contract;

import model.bean.Contract;
import model.repository.contract.ContractRepository;
import model.repository.contract.ContractRepositoryImpl;
import model.service.commons.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractServiceImpl implements ContractService {
    ContractRepository repository = new ContractRepositoryImpl();

    @Override
    public List<Contract> selectAllContract() {
        return repository.selectAllContract();
    }

    @Override
    public Map<String, String> insertContract(Contract contract) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateDeposit(contract.getContractDeposit()) != null
                || Validate.validateTotalMoney(contract.getContractTotalMoney()) != null) {
            mapMessage.put("contractDeposit", Validate.validateDeposit(contract.getContractDeposit()));
            mapMessage.put("contractTotalMoney", Validate.validateTotalMoney(contract.getContractTotalMoney()));
        } else {
            repository.insertContract(contract);
        }
        return mapMessage;
    }
}
