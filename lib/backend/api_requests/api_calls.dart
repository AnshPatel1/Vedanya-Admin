import '../../flutter_quick/flutter_quick_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

String application_url = 'http://134.209.145.155/';

class LoginAuthCall {
  static Future<ApiCallResponse> call({
    String username = '',
    String passwd = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'loginAuth',
      apiUrl: application_url + 'api/app/login/admin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': username,
        'passwd': passwd,
        'format': 'json',
      },
      returnBody: true,
    );
  }
}

class GetRecentSBLRsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getRecentSBLRs',
      apiUrl: application_url + 'api/sblrs?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic reversed(dynamic response) => getJsonField(
        response,
        r'''$[-6:]''',
      );
}

class GetMSObyIdCall {
  static Future<ApiCallResponse> call({
    int id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMSObyId',
      apiUrl: application_url + 'api/msos/id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'format': 'json',
      },
      returnBody: true,
    );
  }
}

class GetMSOSCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getMSOS',
      apiUrl: application_url + 'api/msos?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic lastMSOName(dynamic response) => getJsonField(
        response,
        r'''$[-1].name''',
      );
}

class GetSBLRAsPairsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getSBLRAsPairs',
      apiUrl: application_url + 'api/sblrsaspairs?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetStatisticsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getStatistics',
      apiUrl: application_url + 'api/getStatistics',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': -1,
        'format': 'json',
      },
      returnBody: true,
    );
  }
}

class GetStatisticsByMSOCall {
  static Future<ApiCallResponse> call({
    int id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getStatisticsByMSO',
      apiUrl: application_url + 'api/getStatistics',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'format': 'json',
      },
      returnBody: true,
    );
  }
}

class SBLRsAsPairsIdCall {
  static Future<ApiCallResponse> call({
    int id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SBLRsAsPairsId',
      apiUrl: application_url + 'api/sblrsaspairsid',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'format': 'json',
      },
      returnBody: true,
    );
  }
}
