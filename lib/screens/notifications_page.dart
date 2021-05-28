import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macebook/cubit/notif_cubit.dart';
import 'package:macebook/screens/all_notif.dart';
import 'package:macebook/screens/mentions.dart';

class NotifationScreen extends StatelessWidget {
  static const String id = 'notification page';
  @override
  Widget build(BuildContext context) {
    final double _topPadding = MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 2,
      child: BlocProvider<NotifCubit>(
        create: (context) => NotifCubit(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Padding(
              padding: EdgeInsets.only(top: _topPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Notifications',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: Colors.black54),
                        insets: const EdgeInsets.symmetric(horizontal: 60)),
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Mentions',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              AllNotification(),
              Mentions(),
            ],
          ),
        ),
      ),
    );
  }
}
