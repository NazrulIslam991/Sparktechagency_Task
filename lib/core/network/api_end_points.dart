class ApiEndpoints {
  static const String baseUrl = "https://kaisouaret.pixelstack.cloud/api";
  //static const String baseUrl = "http://10.0.2.2:3000";

  //****************************  auth *********************************
  static const String signUp = 'auth/register/request';
  static const String login = 'auth/register/request';
  static const String getDataWithoutPagination = 'categories';
  static const String delete = 'delete';
  static String productDetails({required String id}) => 'product/details/$id';
  static String getDataWithPagination({required int page}) =>
      'marketplace-management/products?page=$page&limit=40';
  static const String refreshToken = 'v1/auth/refresh';
  static const String createConversation = 'v1/auth/refresh';
  static String getConversation(String conversationId, String cursor) =>
      "chat/message/$conversationId/all?limit=40&cursor=$cursor";
}
