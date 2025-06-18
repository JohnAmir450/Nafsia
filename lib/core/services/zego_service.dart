import 'package:nafsia/core/utils/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

const int appID = zegoAppid; // Replace with your actual AppID
const String appSign = zegoAppSign; // Replace with your actual AppSign

 initializeZego(String userID, String userName) {
  // Initialize ZIMKit for in-app chat
  //  ZIMKit().init(
  //   appID: appID,
  //   appSign: appSign,
  // );

  // Connect user for chat
  ZIMKit().connectUser(
    id: userID,
    name: userName,
    
  );

  // Initialize Prebuilt Call Invitation Service
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: appID,
    appSign: appSign,
    userID: userID,
    userName: userName,
    plugins: [ZegoUIKitSignalingPlugin()],
  );
}
