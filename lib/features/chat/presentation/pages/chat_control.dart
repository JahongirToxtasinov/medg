import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/colors.dart';
import 'package:medg/assets/icons.dart';
import 'chat_page.dart';

List<String> icon = [
  AppIcons.psycho,
  AppIcons.cardio,
  AppIcons.nervo,
];

List<String> name = [
  'Psixologiya',
  'Kardiologiya',
  'Nevrologiya',
];

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              padding: const EdgeInsets.only(left: 18,top: 12,bottom: 12,right: 16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        icon[index],
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          name[index],
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppIcons.info)
                    ],
                  ),
                  const Gap(4),
                  SizedBox(
                    width: double.infinity,
                    height: 28,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatPage1(receiverUserEmail: 'Doctors chat', receiverUserId: 'messages',),
                         )
                        );
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                          color: lightBlueText, // Border color
                          width: 1, // Border width
                        )),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Xabarlashuvga o’tish',
                        style: TextStyle(color: lightBlueText),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

