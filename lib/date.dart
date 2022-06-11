import 'package:shared_preferences/shared_preferences.dart';

List<String> dates = [];

Future read() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dates = pref.getStringList("key") ?? [];
}

add() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dates.add("Add Note  ");
  await pref.setStringList("key", dates);
  read();
}

remove(String mLine) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dates.remove(mLine);
  await pref.setStringList("key", dates);
  read();
}

save(int index, String newmline) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dates[index] = newmline;
  await pref.setStringList("key", dates);
  read();
}
