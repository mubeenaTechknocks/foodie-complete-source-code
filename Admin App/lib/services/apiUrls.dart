class ApiUrls {
  // static String baseUrl = 'https://foodie-main.herokuapp.com';
  static String baseUrl = 'http://172.20.10.2:5000';
  static String adminApp = baseUrl + '/admin';
  static String hotelApp = baseUrl + '/hotel';
  static String deliveryApp = baseUrl + '/delivery';

  //Admin App Urls
  static String login = adminApp + '/api/user/login';
  static String getshop = adminApp + '/hoteldetails/getallhotels';
  static String shop = adminApp + '/hoteldetails';
  static String shopregister = adminApp + '/hoteldetails/register';
  static String subAdmin = adminApp + '/subadmin';
  static String deliveryBoys = adminApp + '/deliveryboy';
  static String adminRPROtp = adminApp + '/account/recovery/request-otp';
  static String adminRPRVerifyOtp = adminApp + '/account/recovery/verify-otp';
  static String adminRPRupdatePassword =
      adminApp + '/account/recovery/update-password';

  //Hotel App Urls
  static String orders = hotelApp + '/orderdetails';

  //Delivery App Urls

}
