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
String _$taskDatesHash() => r'cfc670e44a61e7e1b93009864f0444fff4725853';

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
String _$compTaskDataPeriodHash() =>
    r'db645607bab621e2015936a17e79c7012654ce98';

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

/// See also [compTaskDataPeriod].
@ProviderFor(compTaskDataPeriod)
const compTaskDataPeriodProvider = CompTaskDataPeriodFamily();

/// See also [compTaskDataPeriod].
class CompTaskDataPeriodFamily
    extends Family<AsyncValue<Map<DateTime, List<TaskDate>>>> {
  /// See also [compTaskDataPeriod].
  const CompTaskDataPeriodFamily();

  /// See also [compTaskDataPeriod].
  CompTaskDataPeriodProvider call({
    required List<DateTime> weeks,
  }) {
    return CompTaskDataPeriodProvider(
      weeks: weeks,
    );
  }

  @override
  CompTaskDataPeriodProvider getProviderOverride(
    covariant CompTaskDataPeriodProvider provider,
  ) {
    return call(
      weeks: provider.weeks,
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
  String? get name => r'compTaskDataPeriodProvider';
}

/// See also [compTaskDataPeriod].
class CompTaskDataPeriodProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<TaskDate>>> {
  /// See also [compTaskDataPeriod].
  CompTaskDataPeriodProvider({
    required List<DateTime> weeks,
  }) : this._internal(
          (ref) => compTaskDataPeriod(
            ref as CompTaskDataPeriodRef,
            weeks: weeks,
          ),
          from: compTaskDataPeriodProvider,
          name: r'compTaskDataPeriodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compTaskDataPeriodHash,
          dependencies: CompTaskDataPeriodFamily._dependencies,
          allTransitiveDependencies:
              CompTaskDataPeriodFamily._allTransitiveDependencies,
          weeks: weeks,
        );

  CompTaskDataPeriodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weeks,
  }) : super.internal();

  final List<DateTime> weeks;

  @override
  Override overrideWith(
    FutureOr<Map<DateTime, List<TaskDate>>> Function(
            CompTaskDataPeriodRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompTaskDataPeriodProvider._internal(
        (ref) => create(ref as CompTaskDataPeriodRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weeks: weeks,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<DateTime, List<TaskDate>>>
      createElement() {
    return _CompTaskDataPeriodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompTaskDataPeriodProvider && other.weeks == weeks;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weeks.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompTaskDataPeriodRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<TaskDate>>> {
  /// The parameter `weeks` of this provider.
  List<DateTime> get weeks;
}

class _CompTaskDataPeriodProviderElement
    extends AutoDisposeFutureProviderElement<Map<DateTime, List<TaskDate>>>
    with CompTaskDataPeriodRef {
  _CompTaskDataPeriodProviderElement(super.provider);

  @override
  List<DateTime> get weeks => (origin as CompTaskDataPeriodProvider).weeks;
}

String _$compEventDataPeriodHash() =>
    r'afac5f14ff86e5408e15ae94d1c0576630134486';

/// See also [compEventDataPeriod].
@ProviderFor(compEventDataPeriod)
const compEventDataPeriodProvider = CompEventDataPeriodFamily();

/// See also [compEventDataPeriod].
class CompEventDataPeriodFamily
    extends Family<AsyncValue<Map<DateTime, List<Task>>>> {
  /// See also [compEventDataPeriod].
  const CompEventDataPeriodFamily();

  /// See also [compEventDataPeriod].
  CompEventDataPeriodProvider call({
    required List<DateTime> weeks,
  }) {
    return CompEventDataPeriodProvider(
      weeks: weeks,
    );
  }

  @override
  CompEventDataPeriodProvider getProviderOverride(
    covariant CompEventDataPeriodProvider provider,
  ) {
    return call(
      weeks: provider.weeks,
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
  String? get name => r'compEventDataPeriodProvider';
}

/// See also [compEventDataPeriod].
class CompEventDataPeriodProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<Task>>> {
  /// See also [compEventDataPeriod].
  CompEventDataPeriodProvider({
    required List<DateTime> weeks,
  }) : this._internal(
          (ref) => compEventDataPeriod(
            ref as CompEventDataPeriodRef,
            weeks: weeks,
          ),
          from: compEventDataPeriodProvider,
          name: r'compEventDataPeriodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compEventDataPeriodHash,
          dependencies: CompEventDataPeriodFamily._dependencies,
          allTransitiveDependencies:
              CompEventDataPeriodFamily._allTransitiveDependencies,
          weeks: weeks,
        );

  CompEventDataPeriodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weeks,
  }) : super.internal();

  final List<DateTime> weeks;

  @override
  Override overrideWith(
    FutureOr<Map<DateTime, List<Task>>> Function(
            CompEventDataPeriodRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompEventDataPeriodProvider._internal(
        (ref) => create(ref as CompEventDataPeriodRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weeks: weeks,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<DateTime, List<Task>>> createElement() {
    return _CompEventDataPeriodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompEventDataPeriodProvider && other.weeks == weeks;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weeks.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompEventDataPeriodRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<Task>>> {
  /// The parameter `weeks` of this provider.
  List<DateTime> get weeks;
}

class _CompEventDataPeriodProviderElement
    extends AutoDisposeFutureProviderElement<Map<DateTime, List<Task>>>
    with CompEventDataPeriodRef {
  _CompEventDataPeriodProviderElement(super.provider);

  @override
  List<DateTime> get weeks => (origin as CompEventDataPeriodProvider).weeks;
}

String _$fetchDataForTappedHash() =>
    r'4ef25fb837b41c560904d9463f13dfac7e095e7f';

/// See also [fetchDataForTapped].
@ProviderFor(fetchDataForTapped)
const fetchDataForTappedProvider = FetchDataForTappedFamily();

/// See also [fetchDataForTapped].
class FetchDataForTappedFamily extends Family<AsyncValue<List<TaskDate>>> {
  /// See also [fetchDataForTapped].
  const FetchDataForTappedFamily();

  /// See also [fetchDataForTapped].
  FetchDataForTappedProvider call({
    required List<DateTime> times,
  }) {
    return FetchDataForTappedProvider(
      times: times,
    );
  }

  @override
  FetchDataForTappedProvider getProviderOverride(
    covariant FetchDataForTappedProvider provider,
  ) {
    return call(
      times: provider.times,
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
  String? get name => r'fetchDataForTappedProvider';
}

/// See also [fetchDataForTapped].
class FetchDataForTappedProvider
    extends AutoDisposeFutureProvider<List<TaskDate>> {
  /// See also [fetchDataForTapped].
  FetchDataForTappedProvider({
    required List<DateTime> times,
  }) : this._internal(
          (ref) => fetchDataForTapped(
            ref as FetchDataForTappedRef,
            times: times,
          ),
          from: fetchDataForTappedProvider,
          name: r'fetchDataForTappedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDataForTappedHash,
          dependencies: FetchDataForTappedFamily._dependencies,
          allTransitiveDependencies:
              FetchDataForTappedFamily._allTransitiveDependencies,
          times: times,
        );

  FetchDataForTappedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.times,
  }) : super.internal();

  final List<DateTime> times;

  @override
  Override overrideWith(
    FutureOr<List<TaskDate>> Function(FetchDataForTappedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDataForTappedProvider._internal(
        (ref) => create(ref as FetchDataForTappedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        times: times,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TaskDate>> createElement() {
    return _FetchDataForTappedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDataForTappedProvider && other.times == times;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, times.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchDataForTappedRef on AutoDisposeFutureProviderRef<List<TaskDate>> {
  /// The parameter `times` of this provider.
  List<DateTime> get times;
}

class _FetchDataForTappedProviderElement
    extends AutoDisposeFutureProviderElement<List<TaskDate>>
    with FetchDataForTappedRef {
  _FetchDataForTappedProviderElement(super.provider);

  @override
  List<DateTime> get times => (origin as FetchDataForTappedProvider).times;
}

String _$fetchCompEventForTappedHash() =>
    r'bd18af15802dfe60977ad7558a4104f90169b721';

/// See also [fetchCompEventForTapped].
@ProviderFor(fetchCompEventForTapped)
const fetchCompEventForTappedProvider = FetchCompEventForTappedFamily();

/// See also [fetchCompEventForTapped].
class FetchCompEventForTappedFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [fetchCompEventForTapped].
  const FetchCompEventForTappedFamily();

  /// See also [fetchCompEventForTapped].
  FetchCompEventForTappedProvider call({
    required List<DateTime> times,
  }) {
    return FetchCompEventForTappedProvider(
      times: times,
    );
  }

  @override
  FetchCompEventForTappedProvider getProviderOverride(
    covariant FetchCompEventForTappedProvider provider,
  ) {
    return call(
      times: provider.times,
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
  String? get name => r'fetchCompEventForTappedProvider';
}

/// See also [fetchCompEventForTapped].
class FetchCompEventForTappedProvider
    extends AutoDisposeFutureProvider<List<Task>> {
  /// See also [fetchCompEventForTapped].
  FetchCompEventForTappedProvider({
    required List<DateTime> times,
  }) : this._internal(
          (ref) => fetchCompEventForTapped(
            ref as FetchCompEventForTappedRef,
            times: times,
          ),
          from: fetchCompEventForTappedProvider,
          name: r'fetchCompEventForTappedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCompEventForTappedHash,
          dependencies: FetchCompEventForTappedFamily._dependencies,
          allTransitiveDependencies:
              FetchCompEventForTappedFamily._allTransitiveDependencies,
          times: times,
        );

  FetchCompEventForTappedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.times,
  }) : super.internal();

  final List<DateTime> times;

  @override
  Override overrideWith(
    FutureOr<List<Task>> Function(FetchCompEventForTappedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCompEventForTappedProvider._internal(
        (ref) => create(ref as FetchCompEventForTappedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        times: times,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Task>> createElement() {
    return _FetchCompEventForTappedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCompEventForTappedProvider && other.times == times;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, times.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCompEventForTappedRef on AutoDisposeFutureProviderRef<List<Task>> {
  /// The parameter `times` of this provider.
  List<DateTime> get times;
}

class _FetchCompEventForTappedProviderElement
    extends AutoDisposeFutureProviderElement<List<Task>>
    with FetchCompEventForTappedRef {
  _FetchCompEventForTappedProviderElement(super.provider);

  @override
  List<DateTime> get times => (origin as FetchCompEventForTappedProvider).times;
}

String _$tempTaskHash() => r'35d4be616b9fec43030d9aac2cf8de64ac8c61f0';

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

String _$setCalendarEventsHash() => r'795a51727e0eb477c2977aa144a398cddb5ae005';

/// See also [setCalendarEvents].
@ProviderFor(setCalendarEvents)
final setCalendarEventsProvider =
    AutoDisposeFutureProvider<List<CalendarEvent>>.internal(
  setCalendarEvents,
  name: r'setCalendarEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setCalendarEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SetCalendarEventsRef
    = AutoDisposeFutureProviderRef<List<CalendarEvent>>;
String _$tempTaskDateHash() => r'a8d76b34115a63a433dc379a09d5a22a6f52e44f';

/// See also [tempTaskDate].
@ProviderFor(tempTaskDate)
const tempTaskDateProvider = TempTaskDateFamily();

/// See also [tempTaskDate].
class TempTaskDateFamily extends Family<AsyncValue<TaskDate?>> {
  /// See also [tempTaskDate].
  const TempTaskDateFamily();

  /// See also [tempTaskDate].
  TempTaskDateProvider call({
    required TaskDate? taskDate,
  }) {
    return TempTaskDateProvider(
      taskDate: taskDate,
    );
  }

  @override
  TempTaskDateProvider getProviderOverride(
    covariant TempTaskDateProvider provider,
  ) {
    return call(
      taskDate: provider.taskDate,
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
    required TaskDate? taskDate,
  }) : this._internal(
          (ref) => tempTaskDate(
            ref as TempTaskDateRef,
            taskDate: taskDate,
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
          taskDate: taskDate,
        );

  TempTaskDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskDate,
  }) : super.internal();

  final TaskDate? taskDate;

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
        taskDate: taskDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskDate?> createElement() {
    return _TempTaskDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TempTaskDateProvider && other.taskDate == taskDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TempTaskDateRef on AutoDisposeFutureProviderRef<TaskDate?> {
  /// The parameter `taskDate` of this provider.
  TaskDate? get taskDate;
}

class _TempTaskDateProviderElement
    extends AutoDisposeFutureProviderElement<TaskDate?> with TempTaskDateRef {
  _TempTaskDateProviderElement(super.provider);

  @override
  TaskDate? get taskDate => (origin as TempTaskDateProvider).taskDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
