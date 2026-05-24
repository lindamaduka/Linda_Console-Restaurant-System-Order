// We import menu_item.dart so Food can extend (inherit from) MenuItem.
// Without this import, Dart would not know what MenuItem is.
import 'menu_item.dart';

// Food subclass inherits everything MenuItem has
// (name, price, category, getters, and displayItem) and then adds
// its own extra field: portion size.

class Food extends MenuItem {
  // Private field specific to food items
  final String _portionSize;

  // Constructor: sets _portionSize, then forwards name and price to
  // MenuItem via super() with category hardcoded as 'Food'.
  Food(String name, double price, String portionSize)
    : _portionSize = portionSize,
      super(name, price, 'Food');

  // Getter for portionSize
  // Lets other parts of the app read the portion size without changing it.
  String get portionSize => _portionSize;

  // displayItem(): overrides MenuItem to also print portion size. Uses the
  // name/price getters since MenuItem's private fields aren't accessible here.
  @override
  void displayItem() {
    print('  $name | Portion: $portionSize | Price: N$price');
  }
}
