import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/get_user_data.dart';
import 'package:nafsia/core/services/notification_service.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/book_your_appointment_now_section.dart';
import 'package:nafsia/features/home/presentation/views/widgets/chats_view_widgets/empty_chats_list.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../custom_main_view_app_bar.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVerticalPadding,
      ),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                    child: CustomMainViewsAppBar(title: 'المحادثات')),
                SliverToBoxAdapter(child: verticalSpace(16)),
                SliverFillRemaining(
                    child: ZIMKitConversationListView(
                  lastMessageTimeBuilder:
                      (context, messageTime, defaultWidget) => Text(
                    timeago.format(messageTime!, locale: 'ar'),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  emptyBuilder: (context, defaultWidget) => const Center(
                    child: EmptyChatsList(),
                  ),
                  onPressed: (context, conversation, defaultAction) =>
                      Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        chatID: conversation.id,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          const BookYourAppointmentNowSection(),
        ],
      ),
    );
  }
}

// Chat Screen Widget
class ChatScreen extends StatelessWidget {
  final String chatID;

  const ChatScreen({required this.chatID, super.key});

  @override
  Widget build(BuildContext context) {
    print("chartID: $chatID");
    print("userID: ${getUserData().user.id}");
    return Scaffold(
      body: ZIMKitMessageListPage(
        onMessageSent: (p0) {
          NotificationService().sendNotification(
              receiverId: chatID,
              title: 'لقد حصلت على رسالة من ${getUserData().user.name}',
              body: p0.textContent.toString());
              
        },
        conversationID: chatID,
        showMoreButton: false,
        appBarActions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CallScreen(
                    callID: chatID,
                    isVideoCall: true,
                    targetUserName: chatID, // You might use real name
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CallScreen(
                    callID: getUserData().user.id,
                    isVideoCall: false,
                    targetUserName: chatID,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CallScreen extends StatelessWidget {
  final String callID;
  final bool isVideoCall;
  final String targetUserName;

  const CallScreen({
    required this.callID,
    required this.isVideoCall,
    required this.targetUserName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getUserData().user;

    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
        appID: zegoAppid,
        appSign: zegoAppSign,
        userID: user.id,
        userName: user.name,
        callID: callID,
        config: isVideoCall
            ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
      ),
    );
  }
}
