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
  static String hotelLogin = adminApp + '/hoteldetails/signin';

  //Delivery App Urls
  static String deliveryBoys = deliveryApp + '/deliveryboy';
}
