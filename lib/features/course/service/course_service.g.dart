// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseServiceHash() => r'1b5e0048b47c125340176b543d2102c7d9dc5304';

/// See also [courseService].
@ProviderFor(courseService)
final courseServiceProvider = AutoDisposeProvider<CourseService>.internal(
  courseService,
  name: r'courseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$courseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CourseServiceRef = AutoDisposeProviderRef<CourseService>;
String _$getCoursesHash() => r'c2b2ce2c1ca7bc28ab0964115e45946c7c3e89ef';

/// See also [getCourses].
@ProviderFor(getCourses)
final getCoursesProvider = AutoDisposeFutureProvider<List<Course>>.internal(
  getCourses,
  name: r'getCoursesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCoursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCoursesRef = AutoDisposeFutureProviderRef<List<Course>>;
String _$getCourseVideoHash() => r'acef632e069a0964d2b0be5cca3aa6375a1ce873';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getCourseVideo].
@ProviderFor(getCourseVideo)
const getCourseVideoProvider = GetCourseVideoFamily();

/// See also [getCourseVideo].
class GetCourseVideoFamily extends Family<AsyncValue<CourseVideo>> {
  /// See also [getCourseVideo].
  const GetCourseVideoFamily();

  /// See also [getCourseVideo].
  GetCourseVideoProvider call(
    String id,
  ) {
    return GetCourseVideoProvider(
      id,
    );
  }

  @override
  GetCourseVideoProvider getProviderOverride(
    covariant GetCourseVideoProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCourseVideoProvider';
}

/// See also [getCourseVideo].
class GetCourseVideoProvider extends AutoDisposeFutureProvider<CourseVideo> {
  /// See also [getCourseVideo].
  GetCourseVideoProvider(
    String id,
  ) : this._internal(
          (ref) => getCourseVideo(
            ref as GetCourseVideoRef,
            id,
          ),
          from: getCourseVideoProvider,
          name: r'getCourseVideoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCourseVideoHash,
          dependencies: GetCourseVideoFamily._dependencies,
          allTransitiveDependencies:
              GetCourseVideoFamily._allTransitiveDependencies,
          id: id,
        );

  GetCourseVideoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CourseVideo> Function(GetCourseVideoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCourseVideoProvider._internal(
        (ref) => create(ref as GetCourseVideoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CourseVideo> createElement() {
    return _GetCourseVideoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCourseVideoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCourseVideoRef on AutoDisposeFutureProviderRef<CourseVideo> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetCourseVideoProviderElement
    extends AutoDisposeFutureProviderElement<CourseVideo>
    with GetCourseVideoRef {
  _GetCourseVideoProviderElement(super.provider);

  @override
  String get id => (origin as GetCourseVideoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
