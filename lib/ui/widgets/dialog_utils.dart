import 'package:flutter/material.dart';

class DialogUtils {
  static void showMessage(
      String? title,
      String content,
      String? posBtnTxt,
      Function? posBtn,
      Function? negBtn,
      String? negBtnTxt,
      BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(content),
        actions: [
          if (posBtnTxt != null)
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posBtn != null) {
                    posBtn();
                  }
                },
                child: Text(posBtnTxt)),
          if (negBtnTxt != null)
            TextButton(
              child: Text(negBtnTxt),
              onPressed: () {
                 Navigator.pop(context);
                if (negBtn != null) {
                  negBtn();
                }
              },
            ),
        ],
      ),
    );
  }
}