import 'package:flutter/services.dart';

enum Filters {
  Employee,
  Product,
  Service,
  Visits,
  TotalSales,
  TotalCount,
  DiscountTotal,
  DiscountCount,
  ServiceSales,
  ProductSales,
  ServiceCount,
  ProductCount,
  GuestCount,
  AverageTicket,
  Discount,
  EmployeeProduction,
  GuestVisit,
  Tax
}

class Constants {
  static String MERCHANT_ID;
  static String AVATAR_NAME = 'a1.png';

  static const platform = const MethodChannel("payment_channel");
  static const LAUNCH_SHOW_CART_ITEMS_METHOD = 'launch_show_cart_items_method';
  static const LAUNCH_COLLECT_TIP_METHOD = 'launch_collect_tip_method';
  static const LAUNCH_PAYMENT_FRAGMENT_METHOD = 'launch_payment_fragment_method';

  static const SB_NO_INTERNET_DURATION = 60 * 5;
  static const NULL = 'null';
  static const DAY = 'day';
  static const WEEK = 'week';
  static const MONTH = 'month';

  static const HAPPY = 1;
  static const NEUTRAL = 2;
  static const SAD = 3;

  static const IN_STOCK = 'In-Stock';
  static const LOW = 'Low';
  static const OUT_OF_STOCK = 'Out Of Stock';

  static const WIDTH_EMP_NAME_HEADER = 100.0;

  // APPOINTMENT STATUS
  static const WAITING = 'Waiting';
  static const IN_SERVICE = 'In-Service';
  static const COMPLETED = 'Completed';

  // ITEM TYPE
  static const SERVICE = 'SERVICE';
  static const PRODUCT = 'PRODUCT';

  static const DEFAULT_SERVICE_CODE = 'S001';
  static const DEFAULT_PRODUCT_CODE = 'P001';

}
