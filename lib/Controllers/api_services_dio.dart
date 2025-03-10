import 'dart:io';
import 'dart:convert';
import 'dart:io';

import 'package:dio/io.dart';

// import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:twg/untils/user_simple_preferences.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
//
import 'package:dio/dio.dart' as dio; //
import 'package:get/get_connect/http/src/multipart/form_data.dart'
    as getFormData; //
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:get/get_connect/http/src/multipart/form_data.dart'
    as get_package;

class ApiServiceDio extends GetxService {
//  http://192.168.1.197:5000

//  String baseUrl = "http://192.168.1.197:5000/";
  String baseUrl = "https://thewisguystech.com/";

  String dummybaseUrl = "https://thewisguystech.com/";
  //https://twgpost.in/twiter-api-save-data-api/
  //  String baseUrl = "https://dev.thewisguystech.com/";  //old
  String live_baseUrl = "https://thewisguystech.com/uploads/twg-api/";

  final errorDict = {
    "data": [
      {"error": "Please check your internet connection."}
    ],
    "status": "error"
  };
  ////////////TWG APIS SERVICES
  ///Network settings

  Future<dynamic> postRequestTwitterSavedummyurl({
    required String endpoint,
    required Map<dynamic, dynamic> payload,
    Map<String, String>? customHeaders,
  }) async {
    try {
      dio_package.Dio dioInstance = dio_package.Dio();

      // Add custom headers if provided
      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      // Use dio_package.FormData
      dio_package.FormData data = dio_package.FormData();
      payload.forEach((key, value) {
        if (value != null) {
          data.fields.add(MapEntry(key.toString(), value.toString()));
        }
      });

      print("FormData: ${data.fields}");

      // Send POST request
      dio_package.Response response = await dioInstance.post(
        baseUrl + endpoint,
        options: dio_package.Options(headers: headers),
        data: data,
      );

      // Check response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }

  /////
  ///Scheduled posts
  Future<dynamic> postRequestMultiIDDeleteScheduledPosts({
    required String endpoint,
    required List<String> payload,
    Map<String, String>? customHeaders,
  }) async {
    try {
      dio.Dio dioInstance = dio.Dio();

      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      dio.FormData data = dio.FormData();
      for (String id in payload) {
        data.fields.add(MapEntry('id[]', id));
      }

      print("FormData: ${data.fields}");

      // Send POST request
      dio.Response response = await dioInstance.post(
        baseUrl + endpoint,
        options: dio.Options(headers: headers),
        data: data,
      );

      // Check the response status
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }
  /////

  Future<dynamic> postRequestMultiIDDeleteMultiPosts({
    required String endpoint,
    required List<String> payload,
    Map<String, String>? customHeaders,
  }) async {
    try {
      dio.Dio dioInstance = dio.Dio();

      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      dio.FormData data = dio.FormData();
      for (String id in payload) {
        data.fields.add(MapEntry('post_id[]', id));
      }

      print("FormData: ${data.fields}");

      // Send POST request
      dio.Response response = await dioInstance.post(
        baseUrl + endpoint,
        options: dio.Options(headers: headers),
        data: data,
      );

      // Check the response status
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }

  // delete multilogs
  Future<dynamic> postRequestMultiIDDeleteMultiLogs({
    required String endpoint,
    required List<String> payload,
    Map<String, String>? customHeaders,
  }) async {
    try {
      // Create Dio instance
      dio.Dio dioInstance = dio.Dio();

      // Construct headers
      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      // Construct the form data
      dio.FormData data = dio.FormData();
      for (String id in payload) {
        data.fields.add(MapEntry('id[]', id));
      }

      print("FormData: ${data.fields}");

      // Send POST request
      dio.Response response = await dioInstance.post(
        baseUrl + endpoint,
        options: dio.Options(headers: headers),
        data: data,
      );

      // Check the response status
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"message": "Something went wrong!"};
    }
  }

  // addmulti post

  Future<dynamic> postRequestAddSaveMultipost({
    //uthista
    required String endpoint,
    required payload,
    required List fbList,
    required List twtList,
    required List tumbList,
    required List pintList,
    required List instaList,
    Map<String, String>? customHeaders,
    File? sapinstaPostImg,
    File? sappintPostImg,
    File? sapFacebookPostImg, // Separate image for sap_facebbok_post_img
    File? sapTumbPostImg,
    File? linkedFacebookPostImg,
    File? img, // Separate image for img
  }) async {
    try {
      // Create Dio instance
      dio.Dio dioInstance = dio.Dio();

      // Construct headers
      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      dio.FormData formData = dio.FormData();

      payload.forEach((key, value) {
        formData.fields
            .add(MapEntry(key, value?.toString() ?? "")); // Handle null values
      });
      //  'sap_instagram_post_img': '', dynamic \\ 'sap_instagram[accounts][0]':
      if (instaList.isNotEmpty) {
        for (String id in instaList) {
          formData.fields.add(MapEntry('sap_instagram[accounts][0]', id));
        }
      }
      if (pintList.isNotEmpty) {
        for (String id in pintList) {
          formData.fields.add(MapEntry('sap_pinterest[accounts][0]', id));
        }
      }
      if (tumbList.isNotEmpty) {
        for (String id in tumbList) {
          formData.fields.add(
              MapEntry('sap_tumblr_user_id[0]', id)); // sap_tumblr_user_id[0]
        }
      }
      if (fbList.isNotEmpty) {
        for (String id in fbList) {
          formData.fields.add(MapEntry('sap_facebook[accounts][0]', id));
        }
      }

      ;
      // 'sap_twitter_user_id[0]': '0', add dynamic
      // 'sap_tweet_img': '', add dynamic
      if (twtList.isNotEmpty) {
        for (String id in twtList) {
          formData.fields.add(MapEntry('sap_twitter_user_id[0]', "0"));
        }
      }
      ;

      // if (sapFacebookPostImg != null) {
      //   formData.files.add(
      //     MapEntry(
      //       'sap_facebbok_post_img',
      //       await dio.MultipartFile.fromFile(sapFacebookPostImg.path,
      //           // filename: 'facebook_post_img.jpg'),
      //           // contentType:    MediaType('image', 'png'),

      //       )
      //     ),
      //   );
      // }
      if (sapinstaPostImg != null) {
        //rep
        formData.files.add(
          MapEntry(
            'sap_instagram_post_img',
            //'sap_pinterest_post_img',
            await dio.MultipartFile.fromFile(
              sapinstaPostImg.path,
              filename: basename(sapinstaPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }
      if (sappintPostImg != null) {
        //rep
        formData.files.add(
          MapEntry(
            'sap_pinterest_post_img',
            await dio.MultipartFile.fromFile(
              sappintPostImg.path,
              filename: basename(sappintPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }
      if (sapTumbPostImg != null) {
        formData.files.add(
          MapEntry(
            'sap_tumblr_post_img',
            await dio.MultipartFile.fromFile(
              sapTumbPostImg.path,
              filename: basename(sapTumbPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }
      if (sapFacebookPostImg != null) {
        formData.files.add(
          MapEntry(
            'sap_facebook_post_img',
            await dio.MultipartFile.fromFile(
              sapFacebookPostImg.path,
              filename: basename(sapFacebookPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }
      if (linkedFacebookPostImg != null) {
        formData.files.add(
          MapEntry(
            'sap_tweet_img',
            await dio.MultipartFile.fromFile(
              linkedFacebookPostImg.path,
              filename: basename(linkedFacebookPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }

      if (sapFacebookPostImg != null) {
        formData.files.add(
          MapEntry(
            'sap_facebook_post_img',
            await dio.MultipartFile.fromFile(
              sapFacebookPostImg.path,
              filename: basename(sapFacebookPostImg.path),
              contentType: MediaType('image', 'png'), // Specify the MIME type
            ),
          ),
        );
      }

      // if (img != null) {
      //   formData.files.add(
      //     MapEntry(
      //       'img',
      //       await dio.MultipartFile.fromFile(img.path,
      //           filename: 'post_image.jpg'),
      //     ),
      //   );
      // }
      if (img != null) {
        formData.files.add(
          MapEntry(
            'img',
            await dio.MultipartFile.fromFile(
              img.path,
              filename: basename(img.path),
              // filename: 'post_image.jpg',
              contentType: MediaType('image', 'jpeg'), // Specify the MIME type
            ),
          ),
        );
      }

/////////////

/////////
      dio.Response response = await dioInstance.post(
        baseUrl + endpoint,
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      if (e is dio.DioError) {
        return _handleDioError(e);
      } else {
        print("Error: $e");
        return {"message": "Something went wrong!"};
      }
    }
  }

  // Utility to handle Dio errors
  dynamic _handleDioError(dio.DioError e) {
    print("DioError: ${e.response?.data}");
    switch (e.response?.statusCode) {
      case 404:
      case 401:
      case 400:
        return e.response?.data;
      default:
        return {"message": "Something went wrong!"};
    }
  }

  // Quick post
  // postRequestQuickPostPublish // ram
  Future<dynamic> postRequestAddQucikpost({
    required String endpoint,
    required payload,
    required List fbList,
    required List twtList,
    required List tumbList,
    required List pintList,
    required List instaList,
    required List ytuList,
    Map<String, String>? customHeaders,
    File? video,
    File? image, //
  }) async {
    try {
      //
      dio.Dio dioInstance = dio.Dio();

      //
      Map<String, dynamic> headers = {};
      if (customHeaders != null) {
        headers.addAll(customHeaders);
      }

      //
      dio.FormData formData = dio.FormData();

      //
      payload.forEach((key, value) {
        formData.fields.add(MapEntry(key, value?.toString() ?? ""));
      });
      if (ytuList.isNotEmpty) {
        for (String id in ytuList) {
          formData.fields.add(MapEntry('networks[youtube_accounts][0]', id));
        } //
      }

      if (instaList.isNotEmpty) {
        for (String id in instaList) {
          formData.fields.add(MapEntry('networks[instagram_accounts][0]', id));
        } //
      }
      if (pintList.isNotEmpty) {
        for (String id in pintList) {
          formData.fields.add(MapEntry('networks[pin_accounts][0]', id));
        } //
      }
      if (tumbList.isNotEmpty) {
        for (String id in tumbList) {
          formData.fields.add(MapEntry('networks[tumblr_accounts][0]', id));
        } //
      }
      if (fbList.isNotEmpty) {
        for (String id in fbList) {
          formData.fields.add(MapEntry('networks[fb_accounts][0]', id));
        }
      }
      ;

      if (twtList.isNotEmpty) {
        for (String id in twtList) {
          formData.fields.add(MapEntry('networks[tw_accounts][0]', "0"));
        }
      }
      ;

      if (image != null) {
        formData.files.add(
          MapEntry(
            'image',
            await dio.MultipartFile.fromFile(
              image.path,
              filename: basename(image.path),

              contentType: MediaType('image', 'jpeg'), //
            ),
          ),
        );
      } else {
        if (video != null) {
          formData.files.add(
            MapEntry(
              'video',
              await dio.MultipartFile.fromFile(
                video.path,
                filename: basename(video.path),
                contentType: MediaType('video', 'mp4'),
              ),
            ),
          );
        }
      }

/////////////

/////////
      dio.Response response = await dioInstance.post(
        baseUrl + endpoint,
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return {
          "message": "Request failed with status: ${response.statusCode}"
        };
      }
    } catch (e) {
      if (e is dio.DioError) {
        return _handleDioError(e);
      } else {
        print("Error: $e");
        return {"message": "Something went wrong!"};
      }
    }
  }

  // Utility to handle Dio errors
  // dynamic _handleDioError(dio.DioError e) {
  //   print("DioError: ${e.response?.data}");
  //   switch (e.response?.statusCode) {
  //     case 404:
  //     case 401:
  //     case 400:
  //       return e.response?.data;
  //     default:
  //       return {"message": "Something went wrong!"};
  //   }
  // }
}
