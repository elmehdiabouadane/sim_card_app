
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
  getAllPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    /* return prefs
        .getKeys()
        .map<String>((key) =>
        ListTile(
      title: Text(key),
      subtitle: Text(prefs.get(key).toString()),
    ))
        .toList(growable: false)*/
  }
}
