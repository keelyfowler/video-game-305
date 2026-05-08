import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'SearchGame';

class GetIGDBTokenKFCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIGDBTokenKF',
      apiUrl: 'https://getigdbtoken-pfuvu2mvja-uc.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accesstoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class SearchGamesKFCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${escapeStringForJson(query)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchGamesKF',
      apiUrl: 'https://searchgames-pfuvu2mvja-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? games(dynamic response) => getJsonField(
        response,
        r'''$.games''',
        true,
      ) as List?;
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.games[:].id''',
      ));
  static dynamic cover(dynamic response) => getJsonField(
        response,
        r'''$.games[:].cover''',
      );
  static int? coverID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.games[:].cover.id''',
      ));
  static String? coverURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.games[:].cover.url''',
      ));
  static int? releaseDate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.games[:].first_release_date''',
      ));
  static List? genres(dynamic response) => getJsonField(
        response,
        r'''$.games[:].genres''',
        true,
      ) as List?;
  static int? genreID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.games[:].genres[:].id''',
      ));
  static String? genreName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.games[:].genres[:].name''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.games[:].name''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.games[:].summary''',
      ));
}

class GetGameDetailsKFCall {
  static Future<ApiCallResponse> call({
    String? gameID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "gameId": ${escapeStringForJson(gameID)}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getGameDetailsKF',
      apiUrl: 'https://getgamedetails-pfuvu2mvja-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? gameCoverID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.game.cover.id''',
      ));
  static String? gameCoverURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.game.cover.url''',
      ));
  static String? gameSummary(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.game.summary''',
      ));
  static double? gameRating(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.game.rating''',
      ));
  static int? gameReleaseDate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.game.first_release_date''',
      ));
  static List<String>? gameGenreList(dynamic response) => (getJsonField(
        response,
        r'''$.game.genres[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? gamePlatformList(dynamic response) => (getJsonField(
        response,
        r'''$.game.platforms[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? gameDev(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.game.developer''',
      ));
  static List<String>? gameScreenshots(dynamic response) => (getJsonField(
        response,
        r'''$.game.screenshots[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GeminiRecommendationCall {
  static Future<ApiCallResponse> call({
    String? favorites = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "The user has the following favorite games: {{favorites}}. Recommend 1 game with name, genre, and short description."
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeminiRecommendation',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBofzBXzeFug0aegu_DOuUO-pYaF45s-Kw',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': 'AIzaSyCYqvzNMKwOOhWnQyw7RnEevBY0pC3Kblk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.candidates[0].content.parts[0].text''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
