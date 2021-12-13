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
•	Google Play Services\n''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Log Data\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Cookies\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.
This Service does not use these “cookies” explicitly. \nHowever, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.
''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Service Providers\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''We may employ third-party companies and individuals due to the following reasons:
•	To facilitate our Service;
•	To provide the Service on our behalf;
•	To perform Service-related services; or
•	To assist us in analyzing how our Service is used.
We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.
''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Security\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Links to Other Sites\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Children’s Privacy\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.\n''',
              style: myTextTheme.bodyText1,
            ),
            Text('Changes to This Privacy Policy\n',
                style: myTextTheme.headline6),
            Text(
              '''We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.
This policy is effective as of 2021-12-10\n
''',
              style: myTextTheme.bodyText1,
            ),
            Text(
              'Contact Us\n',
              style: myTextTheme.headline6,
            ),
            Text(
              '''If you have any questions or suggestions about our Privacy Policy, \ndo not hesitate to contact us at GoSport.bantuan@gmail.com. \n\n''',
              style: myTextTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
