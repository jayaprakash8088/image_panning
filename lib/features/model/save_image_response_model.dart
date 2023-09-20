class SaveImageResponseModel {
    bool? isAuth;
    String? message;
    List<Result>? result;
    bool? success;

    SaveImageResponseModel({required this.isAuth, required this.message, required this.result, required this.success});

    factory SaveImageResponseModel.fromJson(Map<String, dynamic> json) {
        return SaveImageResponseModel(
            isAuth: json['isAuth'],
            message: json['message'],
            result:  (json['result'] as List).map((i) => Result.fromJson(i)).toList() ,
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['isAuth'] = isAuth;
        data['message'] = message;
        data['success'] = success;
        if (result != null) {
            data['result'] = result!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Result {
    String profileBannerImageURL;
    String uid;

    Result({required this.profileBannerImageURL, required this.uid});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            profileBannerImageURL: json['profileBannerImageURL'],
            uid: json['uid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['profileBannerImageURL'] = profileBannerImageURL;
        data['uid'] = uid;
        return data;
    }
}