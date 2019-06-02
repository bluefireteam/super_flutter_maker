import 'property_editor.dart';

class StringEditor extends PropertyEditor<String> {
  @override
  String convert(String value) => value;

  @override
  bool validate(String value) => true;
}