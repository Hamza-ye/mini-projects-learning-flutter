import 'package:flutter/material.dart';

class PleaseWaitWidget extends StatelessWidget {

  PleaseWaitWidget({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}