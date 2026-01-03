import 'dw_nit_tools.dart';

DwNitTools? _instance;

DwNitTools get dw {
  final v = _instance;
  if (v == null) throw StateError('DwCore is not initialized');
  return v;
}

void setDwInstance(DwNitTools instance) {
  if (_instance != null) throw StateError('DwCore already initialized');
  _instance = instance;
}
