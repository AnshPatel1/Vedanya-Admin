import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_quick/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('ff_username') ?? _username;
    _password = prefs.getString('ff_password') ?? _password;
    _isLoggedIn = prefs.getBool('ff_isLoggedIn') ?? _isLoggedIn;
  }

  SharedPreferences prefs;

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    prefs.setString('ff_password', _value);
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => prefs.getBool('ff_isLoggedIn');
  set isLoggedIn(bool _value) {
    _isLoggedIn = _value;
    prefs.setBool('ff_isLoggedIn', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
