import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpController extends GetxController {
  // Future<void>? launched;
  RxString whatsapp = "".obs;
  RxString telegram = "".obs;

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
