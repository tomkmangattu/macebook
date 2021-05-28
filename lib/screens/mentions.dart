import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macebook/cubit/notif_cubit.dart';
import 'package:macebook/models/notif_model.dart';
import 'package:macebook/screens/all_notif.dart'
    show loadingIndicator, mentions;

class Mentions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotifCubit, NotifState>(
      builder: (context, state) {
        if (state is NotifInitial) {
          return loadingIndicator();
        }
        if (state is NotifLoaded) {
          return ListView.builder(
            itemCount:
                context.read<NotifCubit>().notifServices.notifModels.length,
            itemBuilder: (BuildContext context, int index) {
              final notifData =
                  context.read<NotifCubit>().notifServices.notifModels[index];
              if (notifData.notifType == NotifType.mention) {
                return mentions(notifData);
              } else
                return const SizedBox();
            },
          );
        }
        return Container();
      },
    );
  }
}
