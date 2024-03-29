class ApiUrls {
  static String baseUrl = 'https://foodie-main.herokuapp.com';
  // static String baseUrl = 'http://172.20.10.2:5000';
  static String adminApp = baseUrl + '/admin';
  static String hotelApp = baseUrl + '/hotel';
  static String deliveryApp = baseUrl + '/delivery';

  //Admin App Urls
  static String login = adminApp + '/api/user/login';
  static String shop = adminApp + '/hoteldetails';
  static String subAdmin = adminApp + '/subadmin';

  //Hotel App Urls
  static String orders = hotelApp + '/orderdetails';
  static String products = hotelApp + '/homeadd';
  static String uploadImage = hotelApp + '/homeadd/upload-image';
  static String hotelLogin = adminApp + '/hoteldetails/signin';
  static String hotelRPROtp = hotelApp + '/account/recovery/request-otp';
  static String hotelRPRVerifyOtp = hotelApp + '/account/recovery/verify-otp';
  static String hotelRPRupdatePassword =
      hotelApp + '/account/recovery/update-password';

  //Delivery App Urls
  static String deliveryBoys = deliveryApp + '/deliveryboy';
}
