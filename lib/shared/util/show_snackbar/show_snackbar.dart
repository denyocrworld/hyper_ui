import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

snackbarPrimary({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: primaryColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSecondary({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: secondaryColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarDanger({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: dangerColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSuccess({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: successColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarInfo({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: infoColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarWarning({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    backgroundColor: warningColor,
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftPrimary({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: primaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftSecondary({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.5),
          border: Border.all(
            width: 1.0,
            color: secondaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftDanger({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: dangerColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: dangerColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: dangerColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftSuccess({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: successColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: successColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: successColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftInfo({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: infoColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: infoColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: infoColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarSoftWarning({required String message, int duration = 4}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: warningColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: warningColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: warningColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftPrimary(
    {required String message,
    int duration = 4,
    IconData data = Icons.task_alt_outlined}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: primaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftSecondary(
    {required String message,
    int duration = 4,
    IconData data = Icons.person_pin_circle_outlined}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: secondaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: secondaryColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftSuccess(
    {required String message,
    int duration = 4,
    IconData data = Icons.check_circle_outline}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: successColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: successColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: successColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: successColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftDanger(
    {required String message,
    int duration = 4,
    IconData data = Icons.dangerous_outlined}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: dangerColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: dangerColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: dangerColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: dangerColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftInfo(
    {required String message,
    int duration = 4,
    IconData data = Icons.info_outline}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: infoColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: infoColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: infoColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: infoColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSoftWarning(
    {required String message,
    int duration = 4,
    IconData data = Icons.warning_amber_outlined}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    padding: const EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    content: Container(
      height: 50,
      width: MediaQuery.of(globalContext).size.width,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: warningColor.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: warningColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  data,
                  size: 24.0,
                  color: warningColor,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: warningColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconPrimary(
    {required String message,
    int duration = 4,
    IconData data = Icons.task_alt_outlined}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: primaryColor,
    content: Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSecondary(
    {required String message,
    int duration = 4,
    IconData data = Icons.person_pin_circle_outlined}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: secondaryColor,
    content: Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconDanger(
    {required String message,
    int duration = 4,
    IconData data = Icons.dangerous_outlined}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: dangerColor,
    content: Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconSuccess(
    {required String message,
    int duration = 4,
    IconData data = Icons.check_circle_outline}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: successColor,
    content: Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconInfo(
    {required String message,
    int duration = 4,
    IconData data = Icons.info_outline}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: infoColor,
    content: Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}

snackbarIconWarning(
    {required String message,
    int duration = 4,
    IconData data = Icons.warning_amber_outlined}) {
  var snackBar = SnackBar(
    padding: const EdgeInsets.all(10),
    duration: Duration(seconds: duration),
    backgroundColor: warningColor,
    content: Row(
      children: [
        Icon(
          data,
          size: 24.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
}
