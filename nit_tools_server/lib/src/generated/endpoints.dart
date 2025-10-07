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
import '../endpoints/nit_auth_endpoint.dart' as _i2;
import '../endpoints/nit_chat_endpoint.dart' as _i3;
import '../endpoints/nit_crud_endpoint.dart' as _i4;
import '../endpoints/nit_updates_endpoint.dart' as _i5;
import '../endpoints/nit_upload_endpoint.dart' as _i6;
import '../endpoints/services_endpoint.dart' as _i7;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i8;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i9;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i10;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'nitAuth': _i2.NitAuthEndpoint()
        ..initialize(
          server,
          'nitAuth',
          'nit_tools',
        ),
      'nitChat': _i3.NitChatEndpoint()
        ..initialize(
          server,
          'nitChat',
          'nit_tools',
        ),
      'nitCrud': _i4.NitCrudEndpoint()
        ..initialize(
          server,
          'nitCrud',
          'nit_tools',
        ),
      'nitUpdates': _i5.NitUpdatesEndpoint()
        ..initialize(
          server,
          'nitUpdates',
          'nit_tools',
        ),
      'nitUpload': _i6.NitUploadEndpoint()
        ..initialize(
          server,
          'nitUpload',
          'nit_tools',
        ),
      'services': _i7.ServicesEndpoint()
        ..initialize(
          server,
          'services',
          'nit_tools',
        ),
    };
    connectors['nitAuth'] = _i1.EndpointConnector(
      name: 'nitAuth',
      endpoint: endpoints['nitAuth']!,
      methodConnectors: {
        'signOutUser': _i1.MethodConnector(
          name: 'signOutUser',
          params: {
            'revokeAllTokens': _i1.ParameterDescription(
              name: 'revokeAllTokens',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitAuth'] as _i2.NitAuthEndpoint).signOutUser(
            session,
            revokeAllTokens: params['revokeAllTokens'],
          ),
        )
      },
    );
    connectors['nitChat'] = _i1.EndpointConnector(
      name: 'nitChat',
      endpoint: endpoints['nitChat']!,
      methodConnectors: {
        'readChatMessages': _i1.MethodConnector(
          name: 'readChatMessages',
          params: {
            'readMessageIds': _i1.ParameterDescription(
              name: 'readMessageIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'chatId': _i1.ParameterDescription(
              name: 'chatId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitChat'] as _i3.NitChatEndpoint).readChatMessages(
            session,
            params['readMessageIds'],
            params['chatId'],
          ),
        ),
        'typingToggle': _i1.MethodConnector(
          name: 'typingToggle',
          params: {
            'channelId': _i1.ParameterDescription(
              name: 'channelId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isTyping': _i1.ParameterDescription(
              name: 'isTyping',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitChat'] as _i3.NitChatEndpoint).typingToggle(
            session,
            params['channelId'],
            params['isTyping'],
          ),
        ),
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
              (endpoints['nitChat'] as _i3.NitChatEndpoint).updatesStream(
            session,
            chatId: params['chatId'],
          ),
        ),
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
              type: _i1.getType<_i8.NitBackendFilter>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).getOneCustom(
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
              type: _i1.getType<_i8.NitBackendFilter?>(),
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
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).getAll(
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
              type: _i1.getType<_i8.NitBackendFilter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).getCount(
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
              type: _i1.getType<_i8.NitBackendFilter?>(),
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
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).getEntityList(
            session,
            className: params['className'],
            filter: params['filter'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i9.ObjectWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).saveModel(
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
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).delete(
            session,
            className: params['className'],
            modelId: params['modelId'],
          ),
        ),
        'subscribeOnUpdates': _i1.MethodStreamConnector(
          name: 'subscribeOnUpdates',
          params: {
            'channel': _i1.ParameterDescription(
              name: 'channel',
              type: _i1.getType<String>(),
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
              (endpoints['nitCrud'] as _i4.NitCrudEndpoint).subscribeOnUpdates(
            session,
            channel: params['channel'],
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
              (endpoints['nitUpload'] as _i6.NitUploadEndpoint)
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
            ),
            'duration': _i1.ParameterDescription(
              name: 'duration',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nitUpload'] as _i6.NitUploadEndpoint).verifyUpload(
            session,
            path: params['path'],
            duration: params['duration'],
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
              (endpoints['services'] as _i7.ServicesEndpoint).setFcmToken(
            session,
            fcmToken: params['fcmToken'],
          ),
        ),
        'deleteFcmToken': _i1.MethodConnector(
          name: 'deleteFcmToken',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i7.ServicesEndpoint).deleteFcmToken(
            session,
            userId: params['userId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i10.Endpoints()..initializeEndpoints(server);
  }
}
