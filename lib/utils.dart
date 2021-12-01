import 'package:demo/service/auth.dart';

final AuthService _auth = AuthService();

class Command {
  static final all = [email, browser1, browser2, out];

  static const email = 'write email';
  static const browser1 = 'open';
  static const browser2 = 'go to';
  static const out = 'hello';
}

class Utils {
  static void scanText(String rawText) {
    final text = rawText.toLowerCase();

    if (text.contains(Command.out)) {
      out();
    }
  }
}

Future out() async {
  print("hello");
  await _auth.signOut();
}
