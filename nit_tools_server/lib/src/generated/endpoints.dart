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
import '../endpoints/chat_endpoint.dart' as _i2;
import '../endpoints/crud_endpoint.dart' as _i3;
import '../endpoints/services_endpoint.dart' as _i4;
import '../endpoints/upload_endpoint.dart' as _i5;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i6;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'chat': _i2.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          'nit_tools',
        ),
      'crud': _i3.CrudEndpoint()
        ..initialize(
          server,
          'crud',
          'nit_tools',
        ),
      'services': _i4.ServicesEndpoint()
        ..initialize(
          server,
          'services',
          'nit_tools',
        ),
      'upload': _i5.UploadEndpoint()
        ..initialize(
          server,
          'upload',
          'nit_tools',
        ),
    };
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
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
              (endpoints['chat'] as _i2.ChatEndpoint).setFcmToken(
            session,
            fcmToken: params['fcmToken'],
          ),
        )
      },
    );
    connectors['crud'] = _i1.EndpointConnector(
      name: 'crud',
      endpoint: endpoints['crud']!,
      methodConnectors: {
        'getOneById': _i1.MethodConnector(
          name: 'getOneById',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i3.CrudEndpoint).getOneById(
            session,
            className: params['className'],
            id: params['id'],
          ),
        ),
        'getOneCustom': _i1.MethodConnector(
          name: 'getOneCustom',
          params: {
            'className': _i1.ParameterDescription(
              name: 'className',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'filters': _i1.ParameterDescription(
              name: 'filters',
              type: _i1.getType<List<_i6.NitBackendFilter>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i3.CrudEndpoint).getOneCustom(
            session,
            className: params['className'],
            filters: params['filters'],
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
            'filters': _i1.ParameterDescription(
              name: 'filters',
              type: _i1.getType<List<_i6.NitBackendFilter>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i3.CrudEndpoint).getAll(
            session,
            className: params['className'],
            filters: params['filters'],
          ),
        ),
        'saveModels': _i1.MethodConnector(
          name: 'saveModels',
          params: {
            'wrappedModels': _i1.ParameterDescription(
              name: 'wrappedModels',
              type: _i1.getType<List<_i7.ObjectWrapper>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i3.CrudEndpoint).saveModels(
            session,
            wrappedModels: params['wrappedModels'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i7.ObjectWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i3.CrudEndpoint).saveModel(
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
              (endpoints['crud'] as _i3.CrudEndpoint).delete(
            session,
            className: params['className'],
            modelId: params['modelId'],
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
              (endpoints['services'] as _i4.ServicesEndpoint).setFcmToken(
            session,
            fcmToken: params['fcmToken'],
          ),
        )
      },
    );
    connectors['upload'] = _i1.EndpointConnector(
      name: 'upload',
      endpoint: endpoints['upload']!,
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
              (endpoints['upload'] as _i5.UploadEndpoint).getUploadDescription(
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
              (endpoints['upload'] as _i5.UploadEndpoint).verifyUpload(
            session,
            path: params['path'],
          ),
        ),
      },
    );
  }
}
