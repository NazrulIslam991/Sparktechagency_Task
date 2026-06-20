// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';

// class ErrorHandle {
//  static void handleDioError(DioException e) {
//   print("Error Type: ${e.type}");
//   switch (e.type) {
//     case DioExceptionType.badCertificate:
//       print("badCertificate: ${e.message}");
//       throw Exception("Bad certificate error: ${e.message}");
//     case DioExceptionType.badResponse:
//       print("badResponse: ${e.message}");
//       if (e.response != null) {
//         print("Status Code: ${e.response?.statusCode}");
//         print("Response Data: ${e.response?.data}");
//       }
//       throw Exception("${e.response?.data['message']['message']}");
//     case DioExceptionType.cancel:
//       print("Request cancelled: ${e.message}");
//       throw Exception("Request was cancelled: ${e.message}");
//     case DioExceptionType.connectionError:
//       print("Connection error: ${e.message}");
//       throw Exception("Connection error: ${e.message}");
//     case DioExceptionType.connectionTimeout:
//       print("Connection Timeout: ${e.message}");
//       print("Request URL: ${e.requestOptions.uri}");
//       throw Exception("Connection timeout error: ${e.message}");
//     case DioExceptionType.receiveTimeout:
//       print("Receive Timeout: ${e.message}");
//       print("Request URL: ${e.requestOptions.uri}");
//       throw Exception("Receive timeout error: ${e.message}");
//     case DioExceptionType.sendTimeout:
//       print("Send Timeout: ${e.message}");
//       print("Request URL: ${e.requestOptions.uri}");
//       throw Exception("Send timeout error: ${e.message}");
//     case DioExceptionType.unknown:
//       print("Unknown error: ${e.message}");
//       if (e.error != null) {
//         print("Error: ${e.error}");
//       }
//       throw Exception("Unknown error: ${e.message}");
//   }
// }

// }

class ErrorHandle {
  static String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        print("error: ${e.message}");
        return "Bad certificate. Please try again.";
      case DioExceptionType.badResponse:
        print("badResponse: ${e.message}");
        if (e.response != null) {
          print("Status Code: ${e.response?.statusCode}");
          print("Response Data: ${e.response?.data}");
          // return e.response?.data;
        }
        print("error: ${e.message}");
        if (e.response != null && e.response?.data != null) {
          // Attempt to extract a message from server
          final data = e.response?.data;
          String message = data['message'].toString();
          log(message);
          if (message.trim().isEmpty) {
            return "Something went wrong";
          }
          if (data is Map<String, dynamic> && data['message'] != null) {
            return data['message'].toString();
          }
          return message;
        }
        return "Server error: ${e.message}";
      case DioExceptionType.cancel:
        print("error: ${e.message}");
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        print("error: ${e.message}");
        return "Connection error. Please check your internet.";
      case DioExceptionType.connectionTimeout:
        print("error: ${e.message}");
        return "Connection timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        print("error: ${e.message}");
        return "Receive timeout. Please try again.";
      case DioExceptionType.sendTimeout:
        print("error: ${e.message}");
        return "Send timeout. Please try again.";
      case DioExceptionType.unknown:
        print("error: ${e.message}");
        return "Unknown error occurred. Please try again.";
    }
  }
}
