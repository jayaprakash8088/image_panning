class FetchImageResponseModel {
  bool? success;
  bool? isAuth;
  String? message;
  List<Result>? result;

  FetchImageResponseModel({
    this.success,
    this.isAuth,
    this.message,
    this.result,
  });

  FetchImageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    isAuth = json['isAuth'] as bool?;
    message = json['message'] as String?;
    result = (json['result'] as List?)
        ?.map((dynamic e) => Result.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['isAuth'] = isAuth;
    json['message'] = message;
    json['result'] = result?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Result {
  List<CardDesignVariations>? cardDesignVariations;
  String? cardImageId;
  String? cardShortBgURL;
  String? cardLongBgURL;
  String? cardImageURL;
  String? cardImageURL2;
  String? cardImageURL3;
  String? cardImageURL4;
  String? categoryId;
  String? cardName;
  String? errorTextColor;
  String? cardDesignType;
  CustomImageCardDesignInfo? customImageCardDesignInfo;
  ProfileDesignInfo? profileDesignInfo;
  DpStyling? dpStyling;
  UserNameStyling? userNameStyling;
  TitleStyling? titleStyling;
  LocationStyling? locationStyling;
  CompanyStyling? companyStyling;
  SkillsStyling? skillsStyling;
  HobbiesStyling? hobbiesStyling;
  SubjectsStyling? subjectsStyling;
  PhoneStyling? phoneStyling;
  EmailStyling? emailStyling;
  AddressStyling? addressStyling;
  ActionIcons? actionIcons;
  bool? favouriteStatus;

  Result({
    this.cardDesignVariations,
    this.cardImageId,
    this.cardShortBgURL,
    this.cardLongBgURL,
    this.cardImageURL,
    this.cardImageURL2,
    this.cardImageURL3,
    this.cardImageURL4,
    this.categoryId,
    this.cardName,
    this.errorTextColor,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.profileDesignInfo,
    this.dpStyling,
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.companyStyling,
    this.skillsStyling,
    this.hobbiesStyling,
    this.subjectsStyling,
    this.phoneStyling,
    this.emailStyling,
    this.addressStyling,
    this.actionIcons,
    this.favouriteStatus,
  });

  Result.fromJson(Map<String, dynamic> json) {
    cardDesignVariations = (json['cardDesignVariations'] as List?)
        ?.map((dynamic e) =>
            CardDesignVariations.fromJson(e as Map<String, dynamic>))
        .toList();
    cardImageId = json['cardImageId'] as String?;
    cardShortBgURL = json['cardShortBgURL'] as String?;
    cardLongBgURL = json['cardLongBgURL'] as String?;
    cardImageURL = json['cardImageURL'] as String?;
    cardImageURL2 = json['cardImageURL2'] as String?;
    cardImageURL3 = json['cardImageURL3'] as String?;
    cardImageURL4 = json['cardImageURL4'] as String?;
    categoryId = json['categoryId'] as String?;
    cardName = json['cardName'] as String?;
    errorTextColor = json['errorTextColor'] as String?;
    cardDesignType = json['cardDesignType'] as String?;
    customImageCardDesignInfo =
        (json['customImageCardDesignInfo'] as Map<String, dynamic>?) != null
            ? CustomImageCardDesignInfo.fromJson(
                json['customImageCardDesignInfo'] as Map<String, dynamic>)
            : null;
    profileDesignInfo =
        (json['profileDesignInfo'] as Map<String, dynamic>?) != null
            ? ProfileDesignInfo.fromJson(
                json['profileDesignInfo'] as Map<String, dynamic>)
            : null;
    dpStyling = (json['dpStyling'] as Map<String, dynamic>?) != null
        ? DpStyling.fromJson(json['dpStyling'] as Map<String, dynamic>)
        : null;
    userNameStyling = (json['userNameStyling'] as Map<String, dynamic>?) != null
        ? UserNameStyling.fromJson(
            json['userNameStyling'] as Map<String, dynamic>)
        : null;
    titleStyling = (json['titleStyling'] as Map<String, dynamic>?) != null
        ? TitleStyling.fromJson(json['titleStyling'] as Map<String, dynamic>)
        : null;
    locationStyling = (json['locationStyling'] as Map<String, dynamic>?) != null
        ? LocationStyling.fromJson(
            json['locationStyling'] as Map<String, dynamic>)
        : null;
    companyStyling = (json['companyStyling'] as Map<String, dynamic>?) != null
        ? CompanyStyling.fromJson(
            json['companyStyling'] as Map<String, dynamic>)
        : null;
    skillsStyling = (json['skillsStyling'] as Map<String, dynamic>?) != null
        ? SkillsStyling.fromJson(json['skillsStyling'] as Map<String, dynamic>)
        : null;
    hobbiesStyling = (json['hobbiesStyling'] as Map<String, dynamic>?) != null
        ? HobbiesStyling.fromJson(
            json['hobbiesStyling'] as Map<String, dynamic>)
        : null;
    subjectsStyling = (json['subjectsStyling'] as Map<String, dynamic>?) != null
        ? SubjectsStyling.fromJson(
            json['subjectsStyling'] as Map<String, dynamic>)
        : null;
    phoneStyling = (json['phoneStyling'] as Map<String, dynamic>?) != null
        ? PhoneStyling.fromJson(json['phoneStyling'] as Map<String, dynamic>)
        : null;
    emailStyling = (json['emailStyling'] as Map<String, dynamic>?) != null
        ? EmailStyling.fromJson(json['emailStyling'] as Map<String, dynamic>)
        : null;
    addressStyling = (json['addressStyling'] as Map<String, dynamic>?) != null
        ? AddressStyling.fromJson(
            json['addressStyling'] as Map<String, dynamic>)
        : null;
    actionIcons = (json['actionIcons'] as Map<String, dynamic>?) != null
        ? ActionIcons.fromJson(json['actionIcons'] as Map<String, dynamic>)
        : null;
    favouriteStatus = json['favouriteStatus'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['cardDesignVariations'] =
        cardDesignVariations?.map((e) => e.toJson()).toList();
    json['cardImageId'] = cardImageId;
    json['cardShortBgURL'] = cardShortBgURL;
    json['cardLongBgURL'] = cardLongBgURL;
    json['cardImageURL'] = cardImageURL;
    json['cardImageURL2'] = cardImageURL2;
    json['cardImageURL3'] = cardImageURL3;
    json['cardImageURL4'] = cardImageURL4;
    json['categoryId'] = categoryId;
    json['cardName'] = cardName;
    json['errorTextColor'] = errorTextColor;
    json['cardDesignType'] = cardDesignType;
    json['customImageCardDesignInfo'] = customImageCardDesignInfo?.toJson();
    json['profileDesignInfo'] = profileDesignInfo?.toJson();
    json['dpStyling'] = dpStyling?.toJson();
    json['userNameStyling'] = userNameStyling?.toJson();
    json['titleStyling'] = titleStyling?.toJson();
    json['locationStyling'] = locationStyling?.toJson();
    json['companyStyling'] = companyStyling?.toJson();
    json['skillsStyling'] = skillsStyling?.toJson();
    json['hobbiesStyling'] = hobbiesStyling?.toJson();
    json['subjectsStyling'] = subjectsStyling?.toJson();
    json['phoneStyling'] = phoneStyling?.toJson();
    json['emailStyling'] = emailStyling?.toJson();
    json['addressStyling'] = addressStyling?.toJson();
    json['actionIcons'] = actionIcons?.toJson();
    json['favouriteStatus'] = favouriteStatus;
    return json;
  }
}

class CardDesignVariations {
  UserNameStyling? userNameStyling;
  TitleStyling? titleStyling;
  LocationStyling? locationStyling;
  ActionIcons? actionIcons;
  ProfileDesignInfo? profileDesignInfo;
  String? cardLongBgURL;
  String? cardDesignType;
  CustomImageCardDesignInfo? customImageCardDesignInfo;
  String? cardImageURL4;
  String? cardImageId;
  String? cardImageURL;

  CardDesignVariations({
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.actionIcons,
    this.profileDesignInfo,
    this.cardLongBgURL,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.cardImageURL4,
    this.cardImageId,
    this.cardImageURL,
  });

  CardDesignVariations.fromJson(Map<String, dynamic> json) {
    userNameStyling = (json['userNameStyling'] as Map<String, dynamic>?) != null
        ? UserNameStyling.fromJson(
            json['userNameStyling'] as Map<String, dynamic>)
        : null;
    titleStyling = (json['titleStyling'] as Map<String, dynamic>?) != null
        ? TitleStyling.fromJson(json['titleStyling'] as Map<String, dynamic>)
        : null;
    locationStyling = (json['locationStyling'] as Map<String, dynamic>?) != null
        ? LocationStyling.fromJson(
            json['locationStyling'] as Map<String, dynamic>)
        : null;
    actionIcons = (json['actionIcons'] as Map<String, dynamic>?) != null
        ? ActionIcons.fromJson(json['actionIcons'] as Map<String, dynamic>)
        : null;
    profileDesignInfo =
        (json['profileDesignInfo'] as Map<String, dynamic>?) != null
            ? ProfileDesignInfo.fromJson(
                json['profileDesignInfo'] as Map<String, dynamic>)
            : null;
    cardLongBgURL = json['cardLongBgURL'] as String?;
    cardDesignType = json['cardDesignType'] as String?;
    customImageCardDesignInfo =
        (json['customImageCardDesignInfo'] as Map<String, dynamic>?) != null
            ? CustomImageCardDesignInfo.fromJson(
                json['customImageCardDesignInfo'] as Map<String, dynamic>)
            : null;
    cardImageURL4 = json['cardImageURL4'] as String?;
    cardImageId = json['cardImageId'] as String?;
    cardImageURL = json['cardImageURL'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userNameStyling'] = userNameStyling?.toJson();
    json['titleStyling'] = titleStyling?.toJson();
    json['locationStyling'] = locationStyling?.toJson();
    json['actionIcons'] = actionIcons?.toJson();
    json['profileDesignInfo'] = profileDesignInfo?.toJson();
    json['cardLongBgURL'] = cardLongBgURL;
    json['cardDesignType'] = cardDesignType;
    json['customImageCardDesignInfo'] = customImageCardDesignInfo?.toJson();
    json['cardImageURL4'] = cardImageURL4;
    json['cardImageId'] = cardImageId;
    json['cardImageURL'] = cardImageURL;
    return json;
  }
}

class UserNameStyling {
  String? noOfLines;
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  UserNameStyling({
    this.noOfLines,
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  UserNameStyling.fromJson(Map<String, dynamic> json) {
    noOfLines = json['noOfLines'] as String?;
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['noOfLines'] = noOfLines;
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}

class TitleStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  TitleStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  TitleStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}

class LocationStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  LocationStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  LocationStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}

class ActionIcons {
  String? type;
  String? backgroundColor;
  String? iconColor;
  String? alignment;

  ActionIcons({
    this.type,
    this.backgroundColor,
    this.iconColor,
    this.alignment,
  });

  ActionIcons.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    backgroundColor = json['backgroundColor'] as String?;
    iconColor = json['iconColor'] as String?;
    alignment = json['alignment'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type;
    json['backgroundColor'] = backgroundColor;
    json['iconColor'] = iconColor;
    json['alignment'] = alignment;
    return json;
  }
}

class ProfileDesignInfo {
  Opacity? opacity;
  String? designType;
  String? errorTextColor;
  String? primaryColor;
  String? secondaryColor;
  String? textColor;
  String? profileBannerImageURL;
  String? baseColor;
  bool? tint;

  ProfileDesignInfo({
    this.opacity,
    this.designType,
    this.errorTextColor,
    this.primaryColor,
    this.secondaryColor,
    this.textColor,
    this.profileBannerImageURL,
    this.baseColor,
    this.tint,
  });

  ProfileDesignInfo.fromJson(Map<String, dynamic> json) {
    opacity = (json['opacity'] as Map<String, dynamic>?) != null
        ? Opacity.fromJson(json['opacity'] as Map<String, dynamic>)
        : null;
    designType = json['designType'] as String?;
    errorTextColor = json['errorTextColor'] as String?;
    primaryColor = json['primaryColor'] as String?;
    secondaryColor = json['secondaryColor'] as String?;
    textColor = json['textColor'] as String?;
    profileBannerImageURL = json['profileBannerImageURL'] as String?;
    baseColor = json['baseColor'] as String?;
    tint = json['tint'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['opacity'] = opacity?.toJson();
    json['designType'] = designType;
    json['errorTextColor'] = errorTextColor;
    json['primaryColor'] = primaryColor;
    json['secondaryColor'] = secondaryColor;
    json['textColor'] = textColor;
    json['profileBannerImageURL'] = profileBannerImageURL;
    json['baseColor'] = baseColor;
    json['tint'] = tint;
    return json;
  }
}

class Opacity {
  String? primary;
  String? secondary;

  Opacity({
    this.primary,
    this.secondary,
  });

  Opacity.fromJson(Map<String, dynamic> json) {
    primary = json['primary'] as String?;
    secondary = json['secondary'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['primary'] = primary;
    json['secondary'] = secondary;
    return json;
  }
}

class CustomImageCardDesignInfo {
  String? primaryColor;
  String? profileBannerImageURL;

  CustomImageCardDesignInfo({
    this.primaryColor,
    this.profileBannerImageURL,
  });

  CustomImageCardDesignInfo.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primaryColor'] as String?;
    profileBannerImageURL = json['profileBannerImageURL'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['primaryColor'] = primaryColor;
    json['profileBannerImageURL'] = profileBannerImageURL;
    return json;
  }
}

class DpStyling {
  String? borderPresent;
  BorderDetails? borderDetails;
  String? alignment;

  DpStyling({
    this.borderPresent,
    this.borderDetails,
    this.alignment,
  });

  DpStyling.fromJson(Map<String, dynamic> json) {
    borderPresent = json['borderPresent'] as String?;
    borderDetails = (json['borderDetails'] as Map<String, dynamic>?) != null
        ? BorderDetails.fromJson(json['borderDetails'] as Map<String, dynamic>)
        : null;
    alignment = json['alignment'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['borderPresent'] = borderPresent;
    json['borderDetails'] = borderDetails?.toJson();
    json['alignment'] = alignment;
    return json;
  }
}

class BorderDetails {
  String? type;
  String? color;
  String? thickness;

  BorderDetails({
    this.type,
    this.color,
    this.thickness,
  });

  BorderDetails.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    color = json['color'] as String?;
    thickness = json['thickness'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type;
    json['color'] = color;
    json['thickness'] = thickness;
    return json;
  }
}

class CompanyStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;
  String? companyDesignationFontSize;
  String? companyDesignationFontColor;
  String? companyDesignationFontStyle;
  String? companyDesignationFontWeight;

  CompanyStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
    this.companyDesignationFontSize,
    this.companyDesignationFontColor,
    this.companyDesignationFontStyle,
    this.companyDesignationFontWeight,
  });

  CompanyStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
    companyDesignationFontSize = json['companyDesignationFontSize'] as String?;
    companyDesignationFontColor =
        json['companyDesignationFontColor'] as String?;
    companyDesignationFontStyle =
        json['companyDesignationFontStyle'] as String?;
    companyDesignationFontWeight =
        json['companyDesignationFontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    json['companyDesignationFontSize'] = companyDesignationFontSize;
    json['companyDesignationFontColor'] = companyDesignationFontColor;
    json['companyDesignationFontStyle'] = companyDesignationFontStyle;
    json['companyDesignationFontWeight'] = companyDesignationFontWeight;
    return json;
  }
}

class SkillsStyling {
  String? boxBackgroundColor;
  String? fontColor;
  String? fontSize;

  SkillsStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  SkillsStyling.fromJson(Map<String, dynamic> json) {
    boxBackgroundColor = json['boxBackgroundColor'] as String?;
    fontColor = json['fontColor'] as String?;
    fontSize = json['fontSize'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['boxBackgroundColor'] = boxBackgroundColor;
    json['fontColor'] = fontColor;
    json['fontSize'] = fontSize;
    return json;
  }
}

class HobbiesStyling {
  String? boxBackgroundColor;
  String? fontColor;
  String? fontSize;

  HobbiesStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  HobbiesStyling.fromJson(Map<String, dynamic> json) {
    boxBackgroundColor = json['boxBackgroundColor'] as String?;
    fontColor = json['fontColor'] as String?;
    fontSize = json['fontSize'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['boxBackgroundColor'] = boxBackgroundColor;
    json['fontColor'] = fontColor;
    json['fontSize'] = fontSize;
    return json;
  }
}

class SubjectsStyling {
  String? boxBackgroundColor;
  String? fontColor;
  String? fontSize;

  SubjectsStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  SubjectsStyling.fromJson(Map<String, dynamic> json) {
    boxBackgroundColor = json['boxBackgroundColor'] as String?;
    fontColor = json['fontColor'] as String?;
    fontSize = json['fontSize'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['boxBackgroundColor'] = boxBackgroundColor;
    json['fontColor'] = fontColor;
    json['fontSize'] = fontSize;
    return json;
  }
}

class PhoneStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  PhoneStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  PhoneStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}

class EmailStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  EmailStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  EmailStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}

class AddressStyling {
  String? fontSize;
  String? alignment;
  String? fontColor;
  String? fontStyle;
  String? fontWeight;

  AddressStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  AddressStyling.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as String?;
    alignment = json['alignment'] as String?;
    fontColor = json['fontColor'] as String?;
    fontStyle = json['fontStyle'] as String?;
    fontWeight = json['fontWeight'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fontSize'] = fontSize;
    json['alignment'] = alignment;
    json['fontColor'] = fontColor;
    json['fontStyle'] = fontStyle;
    json['fontWeight'] = fontWeight;
    return json;
  }
}
