import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/core/paddings.dart';
import 'package:weatherapp_bloc/core/spacer_size.dart';

class Utils {
  static showBottomSnackBar(String content, BuildContext context,
      {String? asset, bool? error = false}) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
    SnackBar snackBar = SnackBar(
      padding: EdgeInsets.zero,
      elevation: 0,
      content: Container(
        alignment: Alignment.center,
        height: spacerSize50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(padding4),
          color: error! ? Colors.white : const Color(0xFFEDF7ED),
          border: Border.all(
            color: error ? Colors.redAccent : Colors.greenAccent,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: spacerSize24,
            ),
            Icon(
              error ? Icons.cancel : Icons.check_circle,
              color: error ? Colors.redAccent : Colors.greenAccent,
            ),
            const SizedBox(
              width: spacerSize12,
            ),
            Text(
              content,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: error ? Colors.redAccent : Colors.greenAccent,
                  fontSize: spacerSize16),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
