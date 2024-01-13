import 'package:get/get.dart';
import 'package:share/share.dart';

class InvitationsController extends GetxController {
  void shareInvitationLink() {
    // Define your invitation link here
    const invitationLink = "https://your-invitation-link.com";

    // Use the Share package to share the link
    Share.share('Check out this amazing app: $invitationLink');
  }
}
