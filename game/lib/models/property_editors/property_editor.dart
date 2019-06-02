abstract class PropertyEditor<T> {
  T convert(String value);
  bool validate(String value);
}