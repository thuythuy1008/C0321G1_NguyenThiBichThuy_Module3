package model.bean;

public class Service {
    private int serviceId;
    private String serviceCode;
    private String serviceName;
    private int serviceArea;
    private double serviceCost;
    private int serviceMaxPeople;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double pollArea;
    private int numberOfFloors;
    private int serviceTypeId;
    private int rentTypeId;

    public Service() {
    }

    public Service(String serviceCode, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople, String standardRoom, String descriptionOtherConvenience, double pollArea, int numberOfFloors, int serviceTypeId, int rentTypeId) {
        super();
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.pollArea = pollArea;
        this.numberOfFloors = numberOfFloors;
        this.serviceTypeId = serviceTypeId;
        this.rentTypeId = rentTypeId;
    }

    public Service(String serviceCode, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople, String standardRoom, String descriptionOtherConvenience, int numberOfFloors, int serviceTypeId, int rentTypeId) {
        super();
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.numberOfFloors = numberOfFloors;
        this.serviceTypeId = serviceTypeId;
        this.rentTypeId = rentTypeId;
    }

    public Service(String serviceCode, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople, int serviceTypeId, int rentTypeId) {
        super();
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.serviceTypeId = serviceTypeId;
        this.rentTypeId = rentTypeId;
    }

    public Service(int serviceId, String serviceCode, String serviceName, int serviceArea, double serviceCost, int serviceMaxPeople, String standardRoom, String descriptionOtherConvenience, double pollArea, int numberOfFloors, int serviceTypeId, int rentTypeId) {
        super();
        this.serviceId = serviceId;
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.pollArea = pollArea;
        this.numberOfFloors = numberOfFloors;
        this.serviceTypeId = serviceTypeId;
        this.rentTypeId = rentTypeId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(int serviceArea) {
        this.serviceArea = serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceMaxPeople() {
        return serviceMaxPeople;
    }

    public void setServiceMaxPeople(int serviceMaxPeople) {
        this.serviceMaxPeople = serviceMaxPeople;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPollArea() {
        return pollArea;
    }

    public void setPollArea(double pollArea) {
        this.pollArea = pollArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }
}
