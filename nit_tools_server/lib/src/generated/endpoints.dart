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
import '../endpoints/crud_endpoint.dart' as _i2;
import '../endpoints/upload_endpoint.dart' as _i3;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i4;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'crud': _i2.CrudEndpoint()
        ..initialize(
          server,
          'crud',
          'nit_tools',
        ),
      'upload': _i3.UploadEndpoint()
        ..initialize(
          server,
          'upload',
          'nit_tools',
        ),
    };
    connectors['crud'] = _i1.EndpointConnector(
      name: 'crud',
      endpoint: endpoints['crud']!,
      methodConnectors: {
        'getOne': _i1.MethodConnector(
          name: 'getOne',
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
              (endpoints['crud'] as _i2.CrudEndpoint).getOne(
            session,
            className: params['className'],
            id: params['id'],
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
              type: _i1.getType<List<_i4.NitBackendFilter>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i2.CrudEndpoint).getAll(
            session,
            className: params['className'],
            filters: params['filters'],
          ),
        ),
        'saveModel': _i1.MethodConnector(
          name: 'saveModel',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i5.ObjectWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i2.CrudEndpoint).saveModel(
            session,
            wrappedModel: params['wrappedModel'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'wrappedModel': _i1.ParameterDescription(
              name: 'wrappedModel',
              type: _i1.getType<_i5.ObjectWrapper>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crud'] as _i2.CrudEndpoint).delete(
            session,
            wrappedModel: params['wrappedModel'],
          ),
        ),
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
              (endpoints['upload'] as _i3.UploadEndpoint).getUploadDescription(
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
              (endpoints['upload'] as _i3.UploadEndpoint).verifyUpload(
            session,
            path: params['path'],
          ),
        ),
      },
    );
  }
}
