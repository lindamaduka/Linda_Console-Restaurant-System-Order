import 'menu_item.dart';

// Drink subclass inheits MenuItem with two extra fields:
//   - size: cup/glass size (small, medium, large)
//   - isCold: true = cold drink, false = hot drink
class Drink extends MenuItem {
  final String _size;
  final bool _isCold;

  // Constructor: sets its own fields (_size, _isCold), then forwards name
  // and price to MenuItem via super()
  Drink(String name, double price, String size, bool isCold)
    : _size = size,
      _isCold = isCold,
      super(name, price, 'Drink');

  String get size => _size;
  bool get isCold => _isCold;

  // displayItem(): overrides MenuItem to print name, size, temperature, and
  // price.
  @override
  void displayItem() {
    // Convert the boolean into a readable word for the console output
    String temperature = _isCold ? 'Cold' : 'Hot';
    print('  $name | Size: $size | Served: $temperature | Price: N$price');
  }
}
