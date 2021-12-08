import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';

class PolicyPage extends StatelessWidget {
  static const routeName = '/PolicyPage';
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Privacy & Policy',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy & Policy \n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''GoSport built the GoSport app as a Commercial app. This SERVICE is provided by GoSport and is intended for use as is.
This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.
\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.
\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at GoSport unless otherwise defined in this Privacy Policy.\n''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Information Collection and Use\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Identitas, email. The information that we request will be retained by us and used as described in this privacy policy.
\nThe app does use third-party services that may collect information used to identify you.
Link to the privacy policy of third-party service providers used by the app\n
•	Google Play Services''',
              style: myTextTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
