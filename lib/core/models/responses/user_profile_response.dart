import 'package:template_provider_mvvm/core/models/responses/base_responses/base_response.dart';
import 'package:template_provider_mvvm/core/models/user/profile.dart';

class UserProfileResponse extends BaseResponse {
  UserProfile? profile;

  UserProfileResponse(success, {error}) : super(success, error: error);

  UserProfileResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) {
      profile = UserProfile.fromJson(json['body']['user']);
    }
  }
}
