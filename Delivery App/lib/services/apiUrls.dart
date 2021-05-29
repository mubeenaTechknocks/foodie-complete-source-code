class ApiUrls {
  static String baseUrl = 'https://foodie-main.herokuapp.com';
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
  static String hotelLogin = hotelApp + '/hotel/login';

  //Delivery App Urls
  static String deliveryBoys = deliveryApp + '/deliveryboy';
  static String deliveryBoyLogin = deliveryApp + '/api/user/signin';
  static String deliveryBoyRegister = deliveryApp + '/api/user/register';
  static String getDeliveryboyDetails =
      deliveryApp + '/api/user/getonedeliveryboy';
}
