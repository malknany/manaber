import 'package:flutter/material.dart';

class KeepAliveScreen extends StatefulWidget {
  const KeepAliveScreen({super.key,required this.page});
  final Widget page;

  @override
  State<KeepAliveScreen> createState() => _KeepAliveScreenState();
}

class _KeepAliveScreenState extends State<KeepAliveScreen>
    with AutomaticKeepAliveClientMixin<KeepAliveScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.page;
  }

  @override
  bool get wantKeepAlive => true;
}
