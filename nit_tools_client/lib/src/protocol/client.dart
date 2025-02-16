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
import 'package:nit_tools_client/src/extra_classes/api_response.dart' as _i3;
import 'package:nit_tools_client/src/extra_classes/nit_backend_filter.dart'
    as _i4;
import 'package:nit_tools_client/src/extra_classes/object_wrapper.dart' as _i5;

/// {@category Endpoint}
class EndpointChat extends _i1.EndpointRef {
  EndpointChat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.chat';

  _i2.Future<_i3.ApiResponse<bool>> setFcmToken({required String fcmToken}) =>
      caller.callServerEndpoint<_i3.ApiResponse<bool>>(
        'nit_tools.chat',
        'setFcmToken',
        {'fcmToken': fcmToken},
      );
}

/// {@category Endpoint}
class EndpointCrud extends _i1.EndpointRef {
  EndpointCrud(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.crud';

  _i2.Future<_i3.ApiResponse<int>> getOneById({
    required String className,
    required int id,
  }) =>
      caller.callServerEndpoint<_i3.ApiResponse<int>>(
        'nit_tools.crud',
        'getOneById',
        {
          'className': className,
          'id': id,
        },
      );

  _i2.Future<_i3.ApiResponse<int>> getOneCustom({
    required String className,
    required List<_i4.NitBackendFilter> filters,
  }) =>
      caller.callServerEndpoint<_i3.ApiResponse<int>>(
        'nit_tools.crud',
        'getOneCustom',
        {
          'className': className,
          'filters': filters,
        },
      );

  _i2.Future<_i3.ApiResponse<List<int>>> getAll({
    required String className,
    List<_i4.NitBackendFilter>? filters,
  }) =>
      caller.callServerEndpoint<_i3.ApiResponse<List<int>>>(
        'nit_tools.crud',
        'getAll',
        {
          'className': className,
          'filters': filters,
        },
      );

  _i2.Future<_i3.ApiResponse<List<int>>> saveModels(
          {required List<_i5.ObjectWrapper> wrappedModels}) =>
      caller.callServerEndpoint<_i3.ApiResponse<List<int>>>(
        'nit_tools.crud',
        'saveModels',
        {'wrappedModels': wrappedModels},
      );

  _i2.Future<_i3.ApiResponse<int>> saveModel(
          {required _i5.ObjectWrapper wrappedModel}) =>
      caller.callServerEndpoint<_i3.ApiResponse<int>>(
        'nit_tools.crud',
        'saveModel',
        {'wrappedModel': wrappedModel},
      );

  _i2.Future<_i3.ApiResponse<bool>> delete({
    required String className,
    required int modelId,
  }) =>
      caller.callServerEndpoint<_i3.ApiResponse<bool>>(
        'nit_tools.crud',
        'delete',
        {
          'className': className,
          'modelId': modelId,
        },
      );
}

/// {@category Endpoint}
class EndpointServices extends _i1.EndpointRef {
  EndpointServices(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.services';

  _i2.Future<_i3.ApiResponse<bool>> setFcmToken({required String fcmToken}) =>
      caller.callServerEndpoint<_i3.ApiResponse<bool>>(
        'nit_tools.services',
        'setFcmToken',
        {'fcmToken': fcmToken},
      );
}

/// {@category Endpoint}
class EndpointUpload extends _i1.EndpointRef {
  EndpointUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nit_tools.upload';

  _i2.Future<String?> getUploadDescription({required String path}) =>
      caller.callServerEndpoint<String?>(
        'nit_tools.upload',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<String?> verifyUpload({required String path}) =>
      caller.callServerEndpoint<String?>(
        'nit_tools.upload',
        'verifyUpload',
        {'path': path},
      );
}

class Caller extends _i1.ModuleEndpointCaller {
  Caller(_i1.ServerpodClientShared client) : super(client) {
    chat = EndpointChat(this);
    crud = EndpointCrud(this);
    services = EndpointServices(this);
    upload = EndpointUpload(this);
  }

  late final EndpointChat chat;

  late final EndpointCrud crud;

  late final EndpointServices services;

  late final EndpointUpload upload;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'nit_tools.chat': chat,
        'nit_tools.crud': crud,
        'nit_tools.services': services,
        'nit_tools.upload': upload,
      };
}
