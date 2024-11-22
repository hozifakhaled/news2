import 'dart:ffi';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {

  void urlLauncherLink (String urllink)async{
      Uri url = Uri.parse(urllink);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
  }
   void snackBar (context){
      const snackBar = SnackBar(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    behavior: SnackBarBehavior.floating,
                                    content: AwesomeSnackbarContent(
                                        title: 'Done',
                                        message: 'Add to saved',
                                        contentType: ContentType.success));
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
   }
}