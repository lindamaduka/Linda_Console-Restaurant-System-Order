import 'menu_item.dart';

// Order Class:
// One Order object represents one customer's session at the restaurant.
// It stores the customer's name, a list of the items they have ordered,
// and the total price.

class Order {
  String _customerName;
  final List<MenuItem> _items;
  double _total;

  // Constructor that creates a fresh order for a new customer.
  // The items list starts empty and the total starts at zero.
  Order(this._customerName) : _items = [], _total = 0.0;

  String get customerName => _customerName;
  List<MenuItem> get items => _items;
  double get total => _total;

  // Setter for customerName: this field can be changed so an Order can be
  // reassigned to a new customer after the bill is printed.
  set customerName(String name) => _customerName = name;

  // addItem()
  // Takes any MenuItem  and adds it to the order.
  // It also adds that item's price to the total price
  void addItem(MenuItem item) {
    _items.add(item); // put the item into the list
    _total += item.price; // add its price to what the customer owes
    print('  "${item.name}" has been added to the order.');
  }

  // removeItem()
  // Searches through the current order by item name and removes it if found.

  void removeItem(String name) {
    bool found = false;

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name.toLowerCase() == name.toLowerCase()) {
        _total -= _items[i].price;
        _items.removeAt(i);
        print('  "$name" has been removed from the order.');
        found = true;
        break;
      }
    }

    // If we looped through everything  and didn't find anthing, write the error message.
    if (!found) {
      print(
        '  ERROR: "$name" was not found in the current order. Nothing was removed.',
      );
    }
  }

  // printBill(): prints a full receipt (customer, items, total), then resets
  // the item list and total to zero so the next customer starts clean.
  void printBill() {
    // if there is nothing in the order, console should print out this message
    if (_items.isEmpty) {
      print('  No items have been ordered yet. Nothing to print.');
      return;
    }

    print('');
    print(' Total Bill:   ');
    print(' Customer: $_customerName');

    // Loop through every item in the order and let each one print itself.
    for (MenuItem item in _items) {
      item.displayItem();
    }

    print('  Total Due: N$_total');

    // Clear the order so the next customer starts fresh
    _items.clear();
    _total = 0.0;
    print('  Order cleared. Ready for the next customer.');
  }
}
