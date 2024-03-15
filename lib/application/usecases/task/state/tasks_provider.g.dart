// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'7340f0f5475f1eee374b77cb54a0d69de0fa7589';

/// See also [tasks].
@ProviderFor(tasks)
final tasksProvider =
    AutoDisposeFutureProvider<Map<DateTime, List<Task>>>.internal(
  tasks,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TasksRef = AutoDisposeFutureProviderRef<Map<DateTime, List<Task>>>;
String _$taskDatesHash() => r'd5d024cb4115938491695621bada5d1f8391a5d4';

/// See also [taskDates].
@ProviderFor(taskDates)
final taskDatesProvider =
    AutoDisposeFutureProvider<Map<DateTime, List<Task>>>.internal(
  taskDates,
  name: r'taskDatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskDatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskDatesRef = AutoDisposeFutureProviderRef<Map<DateTime, List<Task>>>;
String _$tempTaskHash() => r'35d4be616b9fec43030d9aac2cf8de64ac8c61f0';

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

/// See also [tempTask].
@ProviderFor(tempTask)
const tempTaskProvider = TempTaskFamily();

/// See also [tempTask].
class TempTaskFamily extends Family<AsyncValue<Task?>> {
  /// See also [tempTask].
  const TempTaskFamily();

  /// See also [tempTask].
  TempTaskProvider call({
    required int taskId,
  }) {
    return TempTaskProvider(
      taskId: taskId,
    );
  }

  @override
  TempTaskProvider getProviderOverride(
    covariant TempTaskProvider provider,
  ) {
    return call(
      taskId: provider.taskId,
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
  String? get name => r'tempTaskProvider';
}

/// See also [tempTask].
class TempTaskProvider extends AutoDisposeFutureProvider<Task?> {
  /// See also [tempTask].
  TempTaskProvider({
    required int taskId,
  }) : this._internal(
          (ref) => tempTask(
            ref as TempTaskRef,
            taskId: taskId,
          ),
          from: tempTaskProvider,
          name: r'tempTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tempTaskHash,
          dependencies: TempTaskFamily._dependencies,
          allTransitiveDependencies: TempTaskFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TempTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  Override overrideWith(
    FutureOr<Task?> Function(TempTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TempTaskProvider._internal(
        (ref) => create(ref as TempTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Task?> createElement() {
    return _TempTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TempTaskProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TempTaskRef on AutoDisposeFutureProviderRef<Task?> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TempTaskProviderElement extends AutoDisposeFutureProviderElement<Task?>
    with TempTaskRef {
  _TempTaskProviderElement(super.provider);

  @override
  int get taskId => (origin as TempTaskProvider).taskId;
}

String _$tasksCalendarHash() => r'591f01a313d69a0f38a66b775e7b20d56ce88a25';

/// See also [tasksCalendar].
@ProviderFor(tasksCalendar)
final tasksCalendarProvider =
    AutoDisposeFutureProvider<Map<DateTime, List<CalendarEvent>>>.internal(
  tasksCalendar,
  name: r'tasksCalendarProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksCalendarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TasksCalendarRef
    = AutoDisposeFutureProviderRef<Map<DateTime, List<CalendarEvent>>>;
String _$tempTaskDateHash() => r'1a3baef569ee62c909151cb00bdbb530097de3e3';

/// See also [tempTaskDate].
@ProviderFor(tempTaskDate)
const tempTaskDateProvider = TempTaskDateFamily();

/// See also [tempTaskDate].
class TempTaskDateFamily extends Family<AsyncValue<TaskDate?>> {
  /// See also [tempTaskDate].
  const TempTaskDateFamily();

  /// See also [tempTaskDate].
  TempTaskDateProvider call({
    required int dateId,
  }) {
    return TempTaskDateProvider(
      dateId: dateId,
    );
  }

  @override
  TempTaskDateProvider getProviderOverride(
    covariant TempTaskDateProvider provider,
  ) {
    return call(
      dateId: provider.dateId,
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
  String? get name => r'tempTaskDateProvider';
}

/// See also [tempTaskDate].
class TempTaskDateProvider extends AutoDisposeFutureProvider<TaskDate?> {
  /// See also [tempTaskDate].
  TempTaskDateProvider({
    required int dateId,
  }) : this._internal(
          (ref) => tempTaskDate(
            ref as TempTaskDateRef,
            dateId: dateId,
          ),
          from: tempTaskDateProvider,
          name: r'tempTaskDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tempTaskDateHash,
          dependencies: TempTaskDateFamily._dependencies,
          allTransitiveDependencies:
              TempTaskDateFamily._allTransitiveDependencies,
          dateId: dateId,
        );

  TempTaskDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateId,
  }) : super.internal();

  final int dateId;

  @override
  Override overrideWith(
    FutureOr<TaskDate?> Function(TempTaskDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TempTaskDateProvider._internal(
        (ref) => create(ref as TempTaskDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateId: dateId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskDate?> createElement() {
    return _TempTaskDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TempTaskDateProvider && other.dateId == dateId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TempTaskDateRef on AutoDisposeFutureProviderRef<TaskDate?> {
  /// The parameter `dateId` of this provider.
  int get dateId;
}

class _TempTaskDateProviderElement
    extends AutoDisposeFutureProviderElement<TaskDate?> with TempTaskDateRef {
  _TempTaskDateProviderElement(super.provider);

  @override
  int get dateId => (origin as TempTaskDateProvider).dateId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
