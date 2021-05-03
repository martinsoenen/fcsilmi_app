import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfosPage extends StatefulWidget {
  String selectedSession = "Toutes sessions";

  @override
  _InfosPageState createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  @override
  Widget build(BuildContext context) {
    const double iconSize = 40;
    final iconColor = primaryColor;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Informations diverses"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fcsilmi_ultra.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 110, 10, 40),
            child: Column(
              children: [
                Text(
                  "Cette application est une application non-officielle de statistiques du FC Silmi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "Elle est développée par ",
                        ),
                        TextSpan(
                          text: "Martin Soenen",
                          style: new TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextSpan(
                          text: ", et utilise pour les données une API développée par ",
                        ),
                        TextSpan(
                          text: "William Beuil",
                          style: new TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextSpan(
                          text: " pour le site ",
                        ),
                        TextSpan(
                          text: "fcsilmi.club",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () async {
                              if (await canLaunch("https://fcsilmi.club")) {
                                launch("https://fcsilmi.club");
                              }
                            // else {
                            //   showErrorToast("Impossible to launch this URL", context);
                            // }
                          },
                          style: new TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        TextSpan(text: "."),
                      ]),
                  textAlign: TextAlign.center,
                ),
                Text.rich(
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(text: "Les logos du FC Silmi sont issus du "),
                        TextSpan(
                          text: "compte Twitter du FC Silmi",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () async {
                              if (await canLaunch("https://twitter.com/FCSilmi")) {
                                launch("https://twitter.com/FCSilmi");
                              }
                            // else {
                            //   showErrorToast("Impossible to launch this URL", context);
                            // }
                          },
                          style: new TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        TextSpan(text: ". Tous les droits des logos sont réservés à leurs créateurs."),
                      ]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      child: SvgPicture.asset(
                        "assets/svg/github-brands.svg",
                        color: iconColor,
                        height: iconSize,
                        width: iconSize,
                      ),
                      onPressed: () async {
                        if (await canLaunch(
                            "https://github.com/martinsoenen")) {
                          launch("https://github.com/martinsoenen");
                        }
                        // else {
                        //   showErrorToast("Impossible to launch this URL", context);
                        // }
                      },
                    ),
                    RawMaterialButton(
                      child: SvgPicture.asset(
                        "assets/svg/twitter-brands.svg",
                        color: iconColor,
                        height: iconSize,
                        width: iconSize,
                      ),
                      onPressed: () async {
                        if (await canLaunch("https://twitter.com/FCSilmi")) {
                          launch("https://twitter.com/FCSilmi");
                        }
                    //     else {
                    //           showErrorToast("Impossible to launch this URL", context);
                    //         }
                      },
                    ),
                    RawMaterialButton(
                      child: SvgPicture.asset(
                        "assets/svg/futbol-solid.svg",
                        color: iconColor,
                        height: iconSize,
                        width: iconSize,
                      ),
                      onPressed: () async {
                        if (await canLaunch("https://fcsilmi.club/")) {
                          launch("https://fcsilmi.club/");
                        }
                    //     else {
                    //           showErrorToast("Impossible to launch this URL", context);
                    //         }
                      },
                    ),
                    RawMaterialButton(
                      child: Image.asset(
                        "assets/images/fcsilmi_logo.png",
                        height: iconSize + 10,
                        width: iconSize + 10,
                      ),
                      onPressed: () async {
                        if (await canLaunch("https://fcsilmi.com/")) {
                          launch("https://fcsilmi.com/");
                        }
                    //     else {
                    //           showErrorToast("Impossible to launch this URL", context);
                    //         }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
