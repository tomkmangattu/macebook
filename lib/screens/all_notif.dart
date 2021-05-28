import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macebook/cubit/notif_cubit.dart';
import 'package:macebook/models/notif_model.dart';

class AllNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotifCubit, NotifState>(
      builder: (context, state) {
        if (state is NotifInitial) {
          context.read<NotifCubit>().getNotifications();
          return loadingIndicator();
        }
        if (state is NotifLoaded) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount:
                context.read<NotifCubit>().notifServices.notifModels.length,
            itemBuilder: (BuildContext context, int index) {
              //item data
              final notifData =
                  context.read<NotifCubit>().notifServices.notifModels[index];
              //comments
              if (notifData.notifType == NotifType.comment) {
                return _comments(notifData);
              }
              //follow
              else if (notifData.notifType == NotifType.follow) {
                return _follower(notifData);
              }
              //like
              else if (notifData.notifType == NotifType.like) {
                return _like(notifData);
              }
              //mention
              else if (notifData.notifType == NotifType.mention) {
                return mentions(notifData);
              }
              return const SizedBox();
            },
          );
        }
        return null;
      },
    );
  }

  TextButton _follower(NotifModel notifData) {
    return notifItem(
      onpress: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 10),
              Text(
                notifData.fromName,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Text('started following you')
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.amber,
              padding: const EdgeInsets.all(4.0),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            child: Text('follow'),
          )
        ],
      ),
    );
  }

  TextButton _like(NotifModel notifData) {
    return notifItem(
      onpress: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 10),
              Text(
                notifData.fromName,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Text('liked your post')
            ],
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }

  TextButton _comments(NotifModel notifData) {
    return notifItem(
      onpress: () {},
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 10),
          Text(
            notifData.fromName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 5),
          Text('commented in your post'),
          const SizedBox(width: 5),
          Text(
            notifData.message.length > 15
                ? '${notifData.message.substring(0, 15)} ...'
                : notifData.message,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

Widget loadingIndicator() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black12,
                  spreadRadius: 3,
                )
              ]),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(
                      Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

TextButton notifItem({Widget child, Function onpress}) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: Colors.black,
      padding: EdgeInsets.zero,
    ),
    onPressed: onpress,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: child,
    ),
  );
}

TextButton mentions(NotifModel notifData) {
  return notifItem(
    onpress: () {},
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(
          notifData.fromName,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 5),
        Text('mentioned you')
      ],
    ),
  );
}
