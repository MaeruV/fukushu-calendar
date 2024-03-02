import 'dart:convert';

import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:isar/isar.dart';

class MyExtraCodec extends Codec<Object?, Object?> {
  /// Create a codec.
  const MyExtraCodec();
  @override
  Converter<Object?, Object?> get decoder => const _MyExtraDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _MyExtraEncoder();
}

class _MyExtraDecoder extends Converter<Object?, Object?> {
  const _MyExtraDecoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    final List<Object?> objects = input as List<Object?>;

    switch (objects[0]) {
      case 'Task':
        return Task()
          ..id = objects[1]! as Id
          ..title = objects[2]! as String
          ..memo = objects[3]! as String
          ..dateTime = objects[4]! as DateTime
          ..dates = objects[5]! as List<int>;
    }

    throw FormatException('Unable to parse input: $input');
  }
}

class _MyExtraEncoder extends Converter<Object?, Object?> {
  const _MyExtraEncoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    switch (input) {
      case Task _:
        return <Object?>[
          'Task',
          input.id,
          input.title,
          input.memo,
          input.dateTime.toIso8601String(),
          input.dates
        ];

      default:
        throw FormatException('Cannot encode type ${input.runtimeType}');
    }
  }
}
