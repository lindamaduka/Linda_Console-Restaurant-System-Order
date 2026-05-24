// BASE CLASS: MenuItem
//
// Every item on the restaurant menu will share three features
// its name, its price, and whether it belongs to the Food or Drink category
//
// The fields are marked as private so that nothing outside the MenuItem class can directly change them.
class MenuItem {
  final String _name;
  final double _price;
  final String _category;

  // Constructor: sets name, price, and category when a MenuItem is created.
  MenuItem(this._name, this._price, this._category);

  // Getters: read-only access to the private fields
  String get name => _name;
  double get price => _price;
  String get category => _category;

  // displayItem()
  // Prints the features of this menu item to the console.
  // The Food and Drink subclasses will override this method
  // to also print their own extra details like portion size or temperature.
  void displayItem() {
    print('  $_name | Category: $_category | Price: N$_price');
  }
}
