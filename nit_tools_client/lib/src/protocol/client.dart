/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_serialization/src/serialization.dart' as _i3;
import 'package:nit_tools_client/src/extra_classes/api_response.dart' as _i4;
import 'package:nit_tools_client/src/extra_classes/nit_backend_filter.dart'
    as _i5;
import 'package:nit_tools_client/src/extra_classes/object_wrapper.dart' as _i6;
import 'package:nit_tools_client/src/protocol/media/nit_media.dart' as _i7;

/// {@category Endpoint}
class EndpointNitChat extends _i1.EndpointRef {
  EndpointNitChat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.nitChat';

  _i2.Stream<_i3.SerializableModel> updatesStream({required int chatId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.SerializableModel>,
          _i3.SerializableModel>(
        'nit_tools.nitChat',
        'updatesStream',
        {'chatId': chatId},
        {},
      );
}

/// {@category Endpoint}
class EndpointNitCrud extends _i1.EndpointRef {
  EndpointNitCrud(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.nitCrud';

  _i2.Future<_i4.ApiResponse<int>> getOneCustom({
    required String className,
    required _i5.NitBackendFilter filter,
  }) =>
      caller.callServerEndpoint<_i4.ApiResponse<int>>(
        'nit_tools.nitCrud',
        'getOneCustom',
        {
          'className': className,
          'filter': filter,
        },
      );

  _i2.Future<_i4.ApiResponse<List<int>>> getAll({
    required String className,
    _i5.NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<_i4.ApiResponse<List<int>>>(
        'nit_tools.nitCrud',
        'getAll',
        {
          'className': className,
          'filter': filter,
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i4.ApiResponse<List<_i6.ObjectWrapper>>> getEntityList({
    required String className,
    _i5.NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<_i4.ApiResponse<List<_i6.ObjectWrapper>>>(
        'nit_tools.nitCrud',
        'getEntityList',
        {
          'className': className,
          'filter': filter,
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i4.ApiResponse<List<int>>> saveModels(
          {required List<_i6.ObjectWrapper> wrappedModels}) =>
      caller.callServerEndpoint<_i4.ApiResponse<List<int>>>(
        'nit_tools.nitCrud',
        'saveModels',
        {'wrappedModels': wrappedModels},
      );

  _i2.Future<_i4.ApiResponse<int>> saveModel(
          {required _i6.ObjectWrapper wrappedModel}) =>
      caller.callServerEndpoint<_i4.ApiResponse<int>>(
        'nit_tools.nitCrud',
        'saveModel',
        {'wrappedModel': wrappedModel},
      );

  _i2.Future<_i4.ApiResponse<bool>> delete({
    required String className,
    required int modelId,
  }) =>
      caller.callServerEndpoint<_i4.ApiResponse<bool>>(
        'nit_tools.nitCrud',
        'delete',
        {
          'className': className,
          'modelId': modelId,
        },
      );
}

/// {@category Endpoint}
class EndpointNitUpdates extends _i1.EndpointRef {
  EndpointNitUpdates(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.nitUpdates';
}

/// {@category Endpoint}
class EndpointNitUpload extends _i1.EndpointRef {
  EndpointNitUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.nitUpload';

  _i2.Future<String?> getUploadDescription({required String path}) =>
      caller.callServerEndpoint<String?>(
        'nit_tools.nitUpload',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<_i7.NitMedia?> verifyUpload({required String path}) =>
      caller.callServerEndpoint<_i7.NitMedia?>(
        'nit_tools.nitUpload',
        'verifyUpload',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointServices extends _i1.EndpointRef {
  EndpointServices(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.services';

  _i2.Future<_i4.ApiResponse<bool>> setFcmToken({required String fcmToken}) =>
      caller.callServerEndpoint<_i4.ApiResponse<bool>>(
        'nit_tools.services',
        'setFcmToken',
        {'fcmToken': fcmToken},
      );
}

class Caller extends _i1.ModuleEndpointCaller {
  Caller(_i1.ServerpodClientShared client) : super(client) {
    nitChat = EndpointNitChat(this);
    nitCrud = EndpointNitCrud(this);
    nitUpdates = EndpointNitUpdates(this);
    nitUpload = EndpointNitUpload(this);
    services = EndpointServices(this);
  }

  late final EndpointNitChat nitChat;

  late final EndpointNitCrud nitCrud;

  late final EndpointNitUpdates nitUpdates;

  late final EndpointNitUpload nitUpload;

  late final EndpointServices services;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'nit_tools.nitChat': nitChat,
        'nit_tools.nitCrud': nitCrud,
        'nit_tools.nitUpdates': nitUpdates,
        'nit_tools.nitUpload': nitUpload,
        'nit_tools.services': services,
      };
}
