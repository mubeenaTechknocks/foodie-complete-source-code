import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color splashColor;
  final void Function() onPressed;

  const RoundButton({
    Key key,
    this.icon,
    this.iconColor,
    this.onPressed,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      width: 40,
      height: 40,
      child: IconButton(
        // splashColor: needsplashcolor ? splashColor : null,
        splashColor: splashColor,
        onPressed: onPressed,
        icon: Icon(icon),
        color: iconColor,
      ),
    );
  }
}
