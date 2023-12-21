import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  const BlueButton({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: const StadiumBorder(),
        onPressed: onPressed, 
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        )
      ),
    );
  }
}

