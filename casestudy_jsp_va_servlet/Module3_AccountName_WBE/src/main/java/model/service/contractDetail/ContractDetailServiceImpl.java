package model.service.contractDetail;

import model.bean.ContractDetail;
import model.repository.contractDetail.ContractDetailRepository;
import model.repository.contractDetail.ContractDetailRepositoryImpl;
import model.service.commons.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractDetailServiceImpl implements ContractDetailService {
    ContractDetailRepository repository = new ContractDetailRepositoryImpl();

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        return repository.selectAllContractDetail();
    }

    @Override
    public Map<String, String> insertContractDetail(ContractDetail contractDetail) throws SQLException {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateQuantity(contractDetail.getQuantity()) != null) {
            mapMessage.put("quantity", Validate.validateQuantity(contractDetail.getQuantity()));
        } else {
            repository.insertContractDetail(contractDetail);
        }
       return mapMessage;
    }
}
