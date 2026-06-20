class ResponseModel {
  final bool isSuccess;
  final String message;
  final dynamic data;
  ResponseModel({required this.isSuccess, required this.message, this.data});
}
