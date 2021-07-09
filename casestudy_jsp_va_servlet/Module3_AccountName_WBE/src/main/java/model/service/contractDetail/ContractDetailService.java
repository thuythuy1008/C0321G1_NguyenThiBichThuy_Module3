package model.service.contractDetail;

import model.bean.ContractDetail;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ContractDetailService {
    public List<ContractDetail> selectAllContractDetail();

    public Map<String, String> insertContractDetail(ContractDetail contractDetail) throws SQLException;
}
