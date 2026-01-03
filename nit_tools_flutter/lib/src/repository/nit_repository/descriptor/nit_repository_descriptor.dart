// class ForeignKeyDescriptor<K> {
//   const ForeignKeyDescriptor({
//     required this.fieldName,
//   });

//   final String fieldName;
// }

import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

class NitRepositoryDescriptor<T extends SerializableModel, K> {
  const NitRepositoryDescriptor({
    // required this.className,
    required this.fieldName,
  });

  String get className => NitRepository.typeName<T>();
  final String fieldName;

  bool init() => NitRepository.addRepositoryDescriptor<T, K>(this);
}
