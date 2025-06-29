/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/nit_chat_endpoint.dart' as _i2;
import '../endpoints/nit_crud_endpoint.dart' as _i3;
import '../endpoints/nit_updates_endpoint.dart' as _i4;
import '../endpoints/nit_upload_endpoint.dart' as _i5;
import '../endpoints/services_endpoint.dart' as _i6;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i7;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'nitChat': _i2.NitChatEndpoint()
        ..initialize(
          server,
          'nitChat',
          'nit_tools',
        ),
      'nitCrud': _i3.NitCrudEndpoint()
        ..initialize(
          server,
          'nitCrud',
          'nit_tools',
        ),
      'nitUpdates': _i4.NitUpdatesEndpoint()
        ..initialize(
          server,
          'nitUpdates',
          'nit_tools',
        ),
      'nitUpload': _i5.NitUploadEndpoint()
        ..initialize(
          server,
          'nitUpload',
          'nit_tools',
        ),
      'services': _i6.ServicesEndpoint()
        ..initialize(
          server,
          'services',
          'nit_tools',
        ),
    };
    connectors['nitChat'] = _i1.EndpointConnector(
      name: 'nitChat',
      endpoint: endpoints['nitChat']!,
      methodConnectors: {
        'updatesStream': _i1.MethodStreamConnector(
          name: 'updatesStream',
          params: {
            'chatId': _i1.ParameterDescription(
              name: 'chatId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['nitChat'] as _i2.NitChatEndpoint).updatesStream(
            session,
            chatId: params['chatId'],
          ),
        )
      },
    );
    connectors['nitCrud'] = _i1.EndpointConnector(
      name: 'nitCrud',
      endpoint: endpoints['nitCrud']!,
      methodConnectors: {
        'getOneCustom': _i1.MethodConnector(
          name: 'getOneCustom',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.NitBackendFilter>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).getOneCustom(
            session,
            className: params['className'],
            filter: params['filter'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.NitBackendFilter?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).getAll(
            session,
            className: params['className'],
            filter: params['filter'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getCount': _i1.MethodConnector(
          name: 'getCount',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.NitBackendFilter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).getCount(
            session,
            className: params['className'],
            filter: params['filter'],
          ),
        ),
        'getEntityList': _i1.MethodConnector(
          name: 'getEntityList',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i7.NitBackendFilter?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).getEntityList(
            session,
            className: params['className'],
            filter: params['filter'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'saveModels': _i1.MethodConnector(
          name: 'saveModels',
          params: {
            'wrappedModels': _i1.ParameterDescription(
              name: 'wrappedModels',
              type: _i1.getType<List<_i8.ObjectWrapper>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).saveModels(
            session,
            wrappedModels: params['wrappedModels'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i8.ObjectWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).saveModel(
            session,
            wrappedModel: params['wrappedModel'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'modelId': _i1.ParameterDescription(
              name: 'modelId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i3.NitCrudEndpoint).delete(
            session,
            className: params['className'],
            modelId: params['modelId'],
          ),
        ),
      },
    );
    connectors['nitUpdates'] = _i1.EndpointConnector(
      name: 'nitUpdates',
      endpoint: endpoints['nitUpdates']!,
      methodConnectors: {},
    );
    connectors['nitUpload'] = _i1.EndpointConnector(
      name: 'nitUpload',
      endpoint: endpoints['nitUpload']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitUpload'] as _i5.NitUploadEndpoint)
                  .getUploadDescription(
            session,
            path: params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitUpload'] as _i5.NitUploadEndpoint).verifyUpload(
            session,
            path: params['path'],
          ),
        ),
      },
    );
    connectors['services'] = _i1.EndpointConnector(
      name: 'services',
      endpoint: endpoints['services']!,
      methodConnectors: {
        'setFcmToken': _i1.MethodConnector(
          name: 'setFcmToken',
          params: {
            'fcmToken': _i1.ParameterDescription(
              name: 'fcmToken',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i6.ServicesEndpoint).setFcmToken(
            session,
            fcmToken: params['fcmToken'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
