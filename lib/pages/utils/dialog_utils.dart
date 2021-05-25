import 'package:flutter/material.dart';

void showAlertDialog(
    BuildContext context, String text, VoidCallback? ok, VoidCallback? cancel) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '提示',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          content: Text(
            text,
            style: TextStyle(color: Colors.black54, fontSize: 18),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ok?.call();
                },
                child: Text(
                  '确定',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  cancel?.call();
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ],
        );
      });
}
