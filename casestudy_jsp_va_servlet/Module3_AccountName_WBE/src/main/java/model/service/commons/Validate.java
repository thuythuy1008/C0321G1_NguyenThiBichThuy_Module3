package model.service.commons;

public class Validate {
    public static String validateCustomerCode (String customerCode) {
        String message = null;
        String regex = "^(KH)-[0-9]{4}$";
        if (!customerCode.matches(regex)) {
            message = "Vui lòng nhập lại theo định dạng : KH-XXXX (X là số 0-9)";
        }
        return message;
    }

    public static String validateServiceCode (String serviceCode) {
        String message = null;
        String regex = "^(DV)-[0-9]{4}$";
        if (!serviceCode.matches(regex)) {
            message = "Vui lòng nhập lại theo định dạng : DV-XXXX (X là số 0-9)";
        }
        return message;
    }

    public static String validateName(String name) {
        String message = null;
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!name.matches(regex)) {
            message = "Vui lòng viết hoa chữ cái đầu tiên của mỗi từ!";
        }
        return message;
    }

    public static String validateNameService(String nameService) {
        String message = null;
        String regex = "^([A-Z][a-z0-9]*[\\s]?)+$";
        if (!nameService.matches(regex)) {
            message = "Vui lòng viết hoa chữ cái đầu tiên của mỗi từ!";
        }
        return message;
    }

    public static String validatePhone (String phone) {
        String message = null;
        String regex = "^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)[0-9]{7}$";
        if (!phone.matches(regex)) {
            message = "Vui lòng nhập lại theo định dạng : 090xxxxxxx hoặc 091xxxxxxx " +
                    "hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx (x là số 0-9)";
        }
        return message;
    }

    public static String validateIdCard (String idCard) {
        String message = null;
        String regex = "^([0-9]{9}|[0-9]{12})$";
        if (!idCard.matches(regex)) {
            message = "Vui lòng nhập lại theo đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)";
        }
        return message;
    }

    public static String validateEmail (String email) {
        String message = null;
        String regex =  "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        if (!email.matches(regex)) {
            message = "Vui lòng nhập lại theo đúng định dạng: abc@gmail.com hoặc abc@gmail.com.vn";
        }
        return message;
    }
//service
    public static String validateNumberOfFloors (int numberOfFloors) {
        String message = null;
        if (numberOfFloors < 0 ) {
            message = "Vui lòng nhập số nguyên dương!";
        }
        return message;
    }
//    hợp đồng chi tiết
    public static String validateQuantity (int quantity) {
        String message = null;
        if (quantity < 0 ) {
            message = "Vui lòng nhập số nguyên dương!";
        }
        return message;
    }
//    nhân viên
    public static String validateSalary(double salary) {
        String message = null;
        if (salary < 0 ) {
            message = "Vui lòng nhập số dương!";
        }
        return message;
    }
//service chứa cost
    public static String validateCost(double cost) {
        String message = null;
        if (cost < 0 ) {
            message = "Vui lòng nhập số dương!";
        }
        return message;
    }
//hợp đồng contract
    public static String validateDeposit(double deposit) {
        String message = null;
        if (deposit < 0 ) {
            message = "Vui lòng nhập số dương!";
        }
        return message;
    }

    public static String validateTotalMoney(double totalMoney) {
        String message = null;
        if (totalMoney < 0 ) {
            message = "Vui lòng nhập số dương!";
        }
        return message;
    }
}
