import 'property_editor.dart';

class DoubleEditor extends PropertyEditor<double> {
  static bool _empty(String value) => value == null || value.length == 0;

  @override
  double convert(String value) => _empty(value) ? null : double.parse(value);

  @override
  bool validate(String value) => _empty(value) || double.tryParse(value) != null;
}