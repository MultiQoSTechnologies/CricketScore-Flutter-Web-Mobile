String enumToString(Object o) => o.toString().split('.').last;

// T enumFromString<T>(String key, List<T> values) =>
//     values.firstWhere((v) => key == enumToString(v), orElse: () => "");

/// Example :
///SocialLoginType socialNetworkEnum = enumFromString<SocialLoginType>('APPLE_IOS',SocialLoginType.values);

enum FieldError {
  empty,
  invalid,
}

enum RepositoryProviderType {
  lrf,
  home,
  event,
  profile,
  notification,
  payment,
}

enum CategoryType {
  all,
  sponsored,
  classes,
  retreats,
  gatherings,
  treats,
}
