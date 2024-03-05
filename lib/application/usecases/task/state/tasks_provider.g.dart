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
String _$taskHash() => r'23f01e00769aec6d354ef39af57e4b8cd0682a4a';

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

/// See also [task].
@ProviderFor(task)
const taskProvider = TaskFamily();

/// See also [task].
class TaskFamily extends Family<AsyncValue<Task?>> {
  /// See also [task].
  const TaskFamily();

  /// See also [task].
  TaskProvider call({
    required int taskId,
  }) {
    return TaskProvider(
      taskId: taskId,
    );
  }

  @override
  TaskProvider getProviderOverride(
    covariant TaskProvider provider,
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
  String? get name => r'taskProvider';
}

/// See also [task].
class TaskProvider extends AutoDisposeFutureProvider<Task?> {
  /// See also [task].
  TaskProvider({
    required int taskId,
  }) : this._internal(
          (ref) => task(
            ref as TaskRef,
            taskId: taskId,
          ),
          from: taskProvider,
          name: r'taskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$taskHash,
          dependencies: TaskFamily._dependencies,
          allTransitiveDependencies: TaskFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TaskProvider._internal(
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
    FutureOr<Task?> Function(TaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskProvider._internal(
        (ref) => create(ref as TaskRef),
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
    return _TaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TaskRef on AutoDisposeFutureProviderRef<Task?> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TaskProviderElement extends AutoDisposeFutureProviderElement<Task?>
    with TaskRef {
  _TaskProviderElement(super.provider);

  @override
  int get taskId => (origin as TaskProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
