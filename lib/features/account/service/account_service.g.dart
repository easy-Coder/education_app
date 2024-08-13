// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAccountHash() => r'32d3230168a0e13234788503e5e3c299f02879b0';

/// See also [getAccount].
@ProviderFor(getAccount)
final getAccountProvider = AutoDisposeFutureProvider<UserModel>.internal(
  getAccount,
  name: r'getAccountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAccountRef = AutoDisposeFutureProviderRef<UserModel>;
String _$accountServiceHash() => r'82bd4fe7c3130c8c407b4fcf1ebffd97a0aa82c4';

/// See also [accountService].
@ProviderFor(accountService)
final accountServiceProvider = AutoDisposeProvider<AccountService>.internal(
  accountService,
  name: r'accountServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountServiceRef = AutoDisposeProviderRef<AccountService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
