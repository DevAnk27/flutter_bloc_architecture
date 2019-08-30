import 'dart:async';

const String _kEmailRule = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
const String _kMin8CharsOneLetterOneNumber =
    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";

class Validator {
  final validPin =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkPin(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkPin(String value) {
    if (value == null || value.length < 4) {
      return 'Please enter a valid pin';
    } else {
      return null;
    }
  }

  final validShopName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkShopName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkShopName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter shop name';
    } else {
      return null;
    }
  }

  final StreamTransformer<String, String> validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String result = checkEmail(email);
    if (result == null) {
      sink.add(email);
    } else {
      sink.addError(result);
    }
  });

  static String checkEmail(String value) {
    final RegExp emailExp = RegExp(_kEmailRule);
    if (value == null || value.isEmpty || !emailExp.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  final StreamTransformer<String, String> validateOptionEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final RegExp emailExp = new RegExp(_kEmailRule);

    if (!emailExp.hasMatch(email)) {
      sink.addError('Enter a valid email');
    } else {
      sink.add(email);
    }
  });

  final StreamTransformer<String, String> validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    final RegExp passwordExp = new RegExp(_kMin8CharsOneLetterOneNumber);

    if (!passwordExp.hasMatch(password)) {
      sink.addError('Enter a valid password');
    } else {
      sink.add(password);
    }
  });

  final validContactNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkContactNumber(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkContactNumber(String value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value != null && value.length < 10) {
      return 'Enter a valid contact number.';
    } else {
      return null;
    }
  }

  final validWebsite =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkWebsite(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkWebsite(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid website';
    } else {
      return null;
    }
  }

  final validAddress =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkAddress(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkAddress(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid address';
    } else {
      return null;
    }
  }

  final validHolidayName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkHolidayName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkHolidayName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid name';
    } else {
      return null;
    }
  }

  final validHolidayDate =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkDate(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkDate(String value) {
    if (value == null || value.isEmpty) {
      return 'Select a valid date';
    } else {
      return null;
    }
  }

  final validFirstName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkFirstName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkFirstName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid first name';
    } else {
      return null;
    }
  }

  final validLastName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkLastName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkLastName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid last name';
    } else {
      return null;
    }
  }

  final validTaxName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (!value.isEmpty) {
      sink.add(value);
    } else {
      sink.addError('Enter a valid tax name');
    }
  });

  final validTaxAmount =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (!value.isEmpty) {
      sink.add(value);
    } else {
      sink.addError('Enter a valid tax amount');
    }
  });

  final validProductCode =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkProductCode(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkProductCode(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid product code.';
    } else {
      return null;
    }
  }

  final validProductName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkProductName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkProductName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid product name.';
    } else {
      return null;
    }
  }

  final validServiceCode =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkServiceCode(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkServiceCode(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid service code.';
    } else {
      return null;
    }
  }

  final validServiceName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkServiceName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkServiceName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid service name.';
    } else {
      return null;
    }
  }

  final validMID =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkMerchantID(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  final validPrice =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkPrice(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkPrice(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid price.';
    } else if (value != null && double.parse(value) <= 0) {
      return 'Enter a valid price.';
    } else {
      return null;
    }
  }

  final validSKU =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkSKU(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkSKU(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid sku.';
    } else if (value != null && double.parse(value) <= 0) {
      return 'Enter a valid sku.';
    } else {
      return null;
    }
  }

  final validQuantity =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkQuantity(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkQuantity(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid quantity.';
    } else if (value != null && double.parse(value) <= 0) {
      return 'Enter a valid quantity.';
    } else {
      return null;
    }
  }

  final validLowInventoryAlert =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkLowInventoryAlert(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkLowInventoryAlert(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid low inventory alert.';
    } else if (value != null && double.parse(value) < 0) {
      return 'Enter a valid low inventory alert.';
    } else {
      return null;
    }
  }

  static String checkSelectedRole(String value) {
    if (value == null || value.isEmpty) {
      return 'Pnter select role.';
    } else {
      return null;
    }
  }

  static String checkSelectedCategory(String value) {
    if (value == null || value.isEmpty) {
      return 'Pnter select category.';
    } else {
      return null;
    }
  }

  final validCategory =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String result = checkCategory(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String checkCategory(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid category name';
    } else {
      return null;
    }
  }

  static String checkRoleName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter role name';
    } else {
      return null;
    }
  }

  static String checkTaxName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter tax name';
    } else {
      return null;
    }
  }

  static String checkTaxAmount(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter tax amount';
    } else {
      return null;
    }
  }

  static String checkStartTime(String value, String minBusinessHour) {
    if (value == null || value.isEmpty) {
      return 'Select start time.';
    } else {
      int selectedHour = int.parse(value.split(":")[0]);
      int selectedMinute = int.parse(value.split(":")[1]);

      int minHour = int.parse(minBusinessHour.split(":")[0]);
      int minMinute = int.parse(minBusinessHour.split(":")[1]);

      if(selectedHour >= minHour && selectedMinute >= minMinute) {
        return null;
      } else {
       return 'Start time should be greater then start time of business hour.';
      }
    }
  }

  static String checkEndTime(String value, String maxBusinessHour) {
    if (value == null || value.isEmpty) {
      return 'Select end time.';
    } else {
      int selectedHour = int.parse(value.split(":")[0]);
      int selectedMinute = int.parse(value.split(":")[1]);

      int maxHour = int.parse(maxBusinessHour.split(":")[0]);
      int maxMinute = int.parse(maxBusinessHour.split(":")[1]);

      if(selectedHour <= maxHour && selectedMinute <= maxMinute) {
        return null;
      } else {
        return 'End time should be less then end time of business hour.';
      }
    }
  }

  static String checkTime(String value) {
    if (value == null || value.isEmpty) {
      return 'Select time.';
    } else {
      return null;
    }
  }

  static String checkDiscountTitle(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter discount title.';
    } else {
      return null;
    }
  }

  static String checkDiscountCode(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter discount code.';
    } else {
      return null;
    }
  }

  static String checkDiscountValue(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter discount value.';
    } else {
      return null;
    }
  }

  static String checkStartDate(String value){
    if (value == null || value.isEmpty) {
      return 'Select start date.';
    } else {
      return null;
    }
  }

  static String checkEndDate(String value){
    if (value == null || value.isEmpty) {
      return 'Select end date.';
    } else {
      return null;
    }
  }

  static String checkSelectedStylist(String value) {
    if (value == null || value.isEmpty) {
      return 'Please select stylist.';
    } else {
      return null;
    }
  }

  static String checkMerchantID(String value){
    if(value == null || value.isEmpty){
      return 'Please enter merchant ID.';
    } else{
      return null;
    }
  }

  static String isTermsChecked(bool flag){
    if(!flag){
      return 'Please check terms and conditions.';
    } else{
      return null;
    }
  }


  static String checkField(String value, String message){
    if(value == null || value.isEmpty){
      return message;
    } else{
      return null;
    }
  }

  static String checkFileType(String value) {
    if (value == null || value.isEmpty) {
      return 'Please select file type.';
    } else {
      return null;
    }
  }
}
