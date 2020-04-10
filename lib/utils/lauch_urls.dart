import 'package:url_launcher/url_launcher.dart';

void callNCDC() async {
  const url = 'tel:0800 9700 0010';
  _launchUrl(url);
}

void openNCDCTwitterPage() async {
  const url = 'https://twitter.com/NCDCgov';
  _launchUrl(url);
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
