import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final Widget title;
  final Widget subtitle;
  final VoidCallback? onTap;
  final Widget? logo;

  AppCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.onTap,
      this.logo})
      : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: widget.logo != null
            ? widget.logo
            : FlutterLogo(size: 72.0),
        title: widget.title,
        subtitle: widget.subtitle,
        onTap: widget.onTap,
      ),
    );
  }
}
