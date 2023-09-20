class FetchImageResponseModel {
  bool success;
  bool isAuth;
  String message;
  List<Result> result;

  FetchImageResponseModel({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });

}

class Result {
  List<CardDesignVariation> cardDesignVariations;
  String cardImageId;
  String cardShortBgUrl;
  String cardLongBgUrl;
  String cardImageUrl;
  String cardImageUrl2;
  String cardImageUrl3;
  String cardImageUrl4;
  String categoryId;
  String cardName;
  String errorTextColor;
  String cardDesignType;
  ResultCustomImageCardDesignInfo customImageCardDesignInfo;
  ProfileDesignInfo profileDesignInfo;
  DpStyling dpStyling;
  Styling userNameStyling;
  Styling titleStyling;
  Styling locationStyling;
  CompanyStyling companyStyling;
  SStyling skillsStyling;
  SStyling hobbiesStyling;
  SStyling subjectsStyling;
  Styling phoneStyling;
  Styling emailStyling;
  Styling addressStyling;
  ActionIcons actionIcons;
  bool favouriteStatus;

  Result({
    required this.cardDesignVariations,
    required this.cardImageId,
    required this.cardShortBgUrl,
    required this.cardLongBgUrl,
    required this.cardImageUrl,
    required this.cardImageUrl2,
    required this.cardImageUrl3,
    required this.cardImageUrl4,
    required this.categoryId,
    required this.cardName,
    required this.errorTextColor,
    required this.cardDesignType,
    required this.customImageCardDesignInfo,
    required this.profileDesignInfo,
    required this.dpStyling,
    required this.userNameStyling,
    required this.titleStyling,
    required this.locationStyling,
    required this.companyStyling,
    required this.skillsStyling,
    required this.hobbiesStyling,
    required this.subjectsStyling,
    required this.phoneStyling,
    required this.emailStyling,
    required this.addressStyling,
    required this.actionIcons,
    required this.favouriteStatus,
  });

}

class ActionIcons {
  String type;
  String backgroundColor;
  String iconColor;
  String alignment;

  ActionIcons({
    required this.type,
    required this.backgroundColor,
    required this.iconColor,
    required this.alignment,
  });

}

class Styling {
  String fontSize;
  String alignment;
  String fontColor;
  String fontStyle;
  String fontWeight;
  String? noOfLines;

  Styling({
    required this.fontSize,
    required this.alignment,
    required this.fontColor,
    required this.fontStyle,
    required this.fontWeight,
    this.noOfLines,
  });

}

class CardDesignVariation {
  Styling userNameStyling;
  Styling titleStyling;
  Styling locationStyling;
  ActionIcons actionIcons;
  ProfileDesignInfo profileDesignInfo;
  String cardLongBgUrl;
  String cardDesignType;
  CardDesignVariationCustomImageCardDesignInfo customImageCardDesignInfo;
  String cardImageUrl4;
  String cardImageId;
  String cardImageUrl;

  CardDesignVariation({
    required this.userNameStyling,
    required this.titleStyling,
    required this.locationStyling,
    required this.actionIcons,
    required this.profileDesignInfo,
    required this.cardLongBgUrl,
    required this.cardDesignType,
    required this.customImageCardDesignInfo,
    required this.cardImageUrl4,
    required this.cardImageId,
    required this.cardImageUrl,
  });

}

class CardDesignVariationCustomImageCardDesignInfo {
  String primaryColor;
  String profileBannerImageUrl;

  CardDesignVariationCustomImageCardDesignInfo({
    required this.primaryColor,
    required this.profileBannerImageUrl,
  });

}

class ProfileDesignInfo {
  Opacity opacity;
  String designType;
  String? errorTextColor;
  String primaryColor;
  String secondaryColor;
  String textColor;
  String profileBannerImageUrl;
  String baseColor;
  bool tint;

  ProfileDesignInfo({
    required this.opacity,
    required this.designType,
    this.errorTextColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
    required this.profileBannerImageUrl,
    required this.baseColor,
    required this.tint,
  });

}

class Opacity {
  String primary;
  String secondary;

  Opacity({
    required this.primary,
    required this.secondary,
  });

}

class CompanyStyling {
  String fontSize;
  String alignment;
  String fontColor;
  String fontStyle;
  String fontWeight;
  String companyDesignationFontSize;
  String companyDesignationFontColor;
  String companyDesignationFontStyle;
  String companyDesignationFontWeight;

  CompanyStyling({
    required this.fontSize,
    required this.alignment,
    required this.fontColor,
    required this.fontStyle,
    required this.fontWeight,
    required this.companyDesignationFontSize,
    required this.companyDesignationFontColor,
    required this.companyDesignationFontStyle,
    required this.companyDesignationFontWeight,
  });

}

class ResultCustomImageCardDesignInfo {
  String primaryColor;
  String profileBannerImageUrl;
  List<dynamic> colorFilter;

  ResultCustomImageCardDesignInfo({
    required this.primaryColor,
    required this.profileBannerImageUrl,
    required this.colorFilter,
  });

}

class DpStyling {
  String borderPresent;
  BorderDetails borderDetails;
  String alignment;

  DpStyling({
    required this.borderPresent,
    required this.borderDetails,
    required this.alignment,
  });

}

class BorderDetails {
  String type;
  String color;
  String thickness;

  BorderDetails({
    required this.type,
    required this.color,
    required this.thickness,
  });

}

class SStyling {
  String boxBackgroundColor;
  String fontColor;
  String fontSize;

  SStyling({
    required this.boxBackgroundColor,
    required this.fontColor,
    required this.fontSize,
  });

}
