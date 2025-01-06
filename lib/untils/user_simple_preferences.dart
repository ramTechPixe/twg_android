import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const String isUserLoggedIn = 'isuserloggedin';
  static const String isFacebook = 'isFacebook';
  static const String isTwitter = 'isTwitter';
  static const String isLinkedIn = 'isLinkedIn';
  static const String isTumblr = 'isTumblr';
  static const String isPinterest = 'isPinterest';
  static const String isGoogleBusinessProfile = 'isGoogleBusinessProfile';
  static const String isInstagram = 'isInstagram';
  static const String isYouTube = 'isYouTube';
  static const String isWordPress = 'isWordPress';
  static const String isToken = 'token';

  static const String userDataLocal = 'userData';
  static const String isRefreshToken = 'refresh_token';
  static const String isFingerprint = 'true';
  static const String fcmToken = 'fcmToken';
  static const String uniquecode = 'uniquecode';

  ///
  static const String isUserId = 'userId';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setLoginStatus({required bool loginStatus}) async {
    await _preferences.setBool(isUserLoggedIn, loginStatus);
  }

  // for networks
  static Future facebookStatus({required bool fbStatus}) async {
    await _preferences.setBool(isFacebook, fbStatus);
  }

  static bool? getLoginStatus() {
    return _preferences.getBool(isUserLoggedIn);
  }

  // getNetworks
  static bool? getfacebookStatus() {
    return _preferences.getBool(isFacebook);
  }

  // Twitter Status
  static Future twitterStatus({required bool twitterStatus}) async {
    await _preferences.setBool(isTwitter, twitterStatus);
  }

  static bool? getTwitterStatus() {
    return _preferences.getBool(isTwitter);
  }

  // LinkedIn Status
  static Future linkedInStatus({required bool linkedInStatus}) async {
    await _preferences.setBool(isLinkedIn, linkedInStatus);
  }

  static bool? getLinkedInStatus() {
    return _preferences.getBool(isLinkedIn);
  }

  // Tumblr Status
  static Future tumblrStatus({required bool tumblrStatus}) async {
    await _preferences.setBool(isTumblr, tumblrStatus);
  }

  static bool? getTumblrStatus() {
    return _preferences.getBool(isTumblr);
  }

  // Pinterest Status
  static Future pinterestStatus({required bool pinterestStatus}) async {
    await _preferences.setBool(isPinterest, pinterestStatus);
  }

  static bool? getPinterestStatus() {
    return _preferences.getBool(isPinterest);
  }

  // Google Business Profile Status
  static Future googleBusinessProfileStatus({required bool gbpStatus}) async {
    await _preferences.setBool(isGoogleBusinessProfile, gbpStatus);
  }

  static bool? getGoogleBusinessProfileStatus() {
    return _preferences.getBool(isGoogleBusinessProfile);
  }

  // Instagram Status
  static Future instagramStatus({required bool instagramStatus}) async {
    await _preferences.setBool(isInstagram, instagramStatus);
  }

  static bool? getInstagramStatus() {
    return _preferences.getBool(isInstagram);
  }

  // YouTube Status
  static Future youtubeStatus({required bool youtubeStatus}) async {
    await _preferences.setBool(isYouTube, youtubeStatus);
  }

  static bool? getYouTubeStatus() {
    return _preferences.getBool(isYouTube);
  }

  // WordPress Status
  static Future wordpressStatus({required bool wordpressStatus}) async {
    await _preferences.setBool(isWordPress, wordpressStatus);
  }

  static bool? getWordPressStatus() {
    return _preferences.getBool(isWordPress);
  }

//
  static Future setfcmToken(String? token) async {
    await _preferences.setString(fcmToken, token!);
  }

  static String? getfcmToken() {
    return (_preferences.getString(fcmToken));
  }

  static Future setuniquecode(String? identifier) async {
    await _preferences.setString(uniquecode, identifier!);
  }

  static String? getuniquecode() {
    return (_preferences.getString(uniquecode));
  }

  static Future setUserdata({required String userData}) async {
    await _preferences.setString(userDataLocal, userData);
  }

  static String? getUserdata() {
    return (_preferences.getString(userDataLocal));
  }

  static Future setfingerprintdata({required String userData}) async {
    await _preferences.setString(isFingerprint, userData);
  }

  static Future setRefreshToken({required String refreshToken}) async {
    await _preferences.setString(isRefreshToken, refreshToken);
  }

  static String? getRefreshToken() {
    return _preferences.getString(isRefreshToken);
  }

  static String? getfingerprintdata() {
    return (_preferences.getString(isFingerprint));
  }

  static Future setToken({required String token}) async {
    await _preferences.setString(isToken, token);
  }

  static String? getToken() {
    return _preferences.getString(isToken);
  }

  /////
  static Future setUserid({required String userId}) async {
    await _preferences.setString(isUserId, userId);
  }

  static String? getUserid() {
    return _preferences.getString(isUserId);
  }

  static void clearAllData() {
    _preferences.clear();
  }
}
