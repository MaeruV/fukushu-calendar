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
String _$compWeekDataHash() => r'18dadbabf61131e9355f2972f01ac609ac3e1778';

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

/// See also [compWeekData].
@ProviderFor(compWeekData)
const compWeekDataProvider = CompWeekDataFamily();

/// See also [compWeekData].
class CompWeekDataFamily
    extends Family<AsyncValue<Map<DateTime, List<TaskDate>>>> {
  /// See also [compWeekData].
  const CompWeekDataFamily();

  /// See also [compWeekData].
  CompWeekDataProvider call({
    required List<DateTime> weeks,
  }) {
    return CompWeekDataProvider(
      weeks: weeks,
    );
  }

  @override
  CompWeekDataProvider getProviderOverride(
    covariant CompWeekDataProvider provider,
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
  String? get name => r'compWeekDataProvider';
}

/// See also [compWeekData].
class CompWeekDataProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<TaskDate>>> {
  /// See also [compWeekData].
  CompWeekDataProvider({
    required List<DateTime> weeks,
  }) : this._internal(
          (ref) => compWeekData(
            ref as CompWeekDataRef,
            weeks: weeks,
          ),
          from: compWeekDataProvider,
          name: r'compWeekDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compWeekDataHash,
          dependencies: CompWeekDataFamily._dependencies,
          allTransitiveDependencies:
              CompWeekDataFamily._allTransitiveDependencies,
          weeks: weeks,
        );

  CompWeekDataProvider._internal(
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
    FutureOr<Map<DateTime, List<TaskDate>>> Function(CompWeekDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompWeekDataProvider._internal(
        (ref) => create(ref as CompWeekDataRef),
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
    return _CompWeekDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompWeekDataProvider && other.weeks == weeks;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weeks.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompWeekDataRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<TaskDate>>> {
  /// The parameter `weeks` of this provider.
  List<DateTime> get weeks;
}

class _CompWeekDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<DateTime, List<TaskDate>>>
    with CompWeekDataRef {
  _CompWeekDataProviderElement(super.provider);

  @override
  List<DateTime> get weeks => (origin as CompWeekDataProvider).weeks;
}

String _$compDayDataHash() => r'041f193b87737d1376c9d221a8128be6f5819b5a';

/// See also [compDayData].
@ProviderFor(compDayData)
const compDayDataProvider = CompDayDataFamily();

/// See also [compDayData].
class CompDayDataFamily extends Family<AsyncValue<List<TaskDate>>> {
  /// See also [compDayData].
  const CompDayDataFamily();

  /// See also [compDayData].
  CompDayDataProvider call({
    required DateTime? time,
  }) {
    return CompDayDataProvider(
      time: time,
    );
  }

  @override
  CompDayDataProvider getProviderOverride(
    covariant CompDayDataProvider provider,
  ) {
    return call(
      time: provider.time,
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
  String? get name => r'compDayDataProvider';
}

/// See also [compDayData].
class CompDayDataProvider extends AutoDisposeFutureProvider<List<TaskDate>> {
  /// See also [compDayData].
  CompDayDataProvider({
    required DateTime? time,
  }) : this._internal(
          (ref) => compDayData(
            ref as CompDayDataRef,
            time: time,
          ),
          from: compDayDataProvider,
          name: r'compDayDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$compDayDataHash,
          dependencies: CompDayDataFamily._dependencies,
          allTransitiveDependencies:
              CompDayDataFamily._allTransitiveDependencies,
          time: time,
        );

  CompDayDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.time,
  }) : super.internal();

  final DateTime? time;

  @override
  Override overrideWith(
    FutureOr<List<TaskDate>> Function(CompDayDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompDayDataProvider._internal(
        (ref) => create(ref as CompDayDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TaskDate>> createElement() {
    return _CompDayDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompDayDataProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CompDayDataRef on AutoDisposeFutureProviderRef<List<TaskDate>> {
  /// The parameter `time` of this provider.
  DateTime? get time;
}

class _CompDayDataProviderElement
    extends AutoDisposeFutureProviderElement<List<TaskDate>>
    with CompDayDataRef {
  _CompDayDataProviderElement(super.provider);

  @override
  DateTime? get time => (origin as CompDayDataProvider).time;
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
