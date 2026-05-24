import 'dart:io';

class MenuItem {
  final String _name;
  final double _price;
  final String _category;

  MenuItem(this._name, this._price, this._category);

  String get name => _name;
  double get price => _price;
  String get category => _category;

  void displayItem() {
    print(' $_name | Category: $_category | Price: ₦$_price');
  }
}

class Food extends MenuItem {
  final String _portionSize;

  Food(String name, double price, String portionSize)
    : _portionSize = portionSize,
      super(name, price, 'Food');

  String get portionSize => _portionSize;

  @override
  void displayItem() {
    print('$name | Portion: &_portionSize | Price:₦$price ');
  }
}

class Drink extends MenuItem {
  final String _size;
  final bool _isCold;

  Drink(String name, double price, String size, bool isCold)
    : _size = size,
      _isCold = isCold,
      super(name, price, 'Drink');

  String get size => _size;
  bool get isCold => _isCold;

  @override
  void displayItem() {
    String temp = _isCold ? 'Cold' : 'Hot';
    print('  $name | Size: $_size | Temp: $temp | Price: ₦$price');
  }
}

class Order {
  String _customerName;
  final List<MenuItem> _items;
  double _total;

  Order(this._customerName) : _items = [], _total = 0.0;

  String get customerName => _customerName;
  List<MenuItem> get items => _items;
  double get total => _total;

  set customerName(String name) => _customerName = name;

  void addItem(MenuItem item) {
    _items.add(item);
    _total += item.price;
    print(' ${item.name}  added to your order');
  }

  void removeItem(String name) {
    bool found = false;

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name.toLowerCase() == name.toLowerCase()) {
        _total -= _items[i].price;
        _items.removeAt(i);
        print(' "$name" has been removed from your order.');
        found = true;
        break;
      }
    }

    if (!found) {
      print('  "$name" was not found in your order. Nothing was removed.');
    }
  }

  void printBill() {
    if (_items.isEmpty) {
      print('   No items in the order yet. Nothing to bill.');
      return;
    }

    print('');
    print('  Customer: $_customerName');

    // Print every ordered item using its own displayItem()
    for (MenuItem item in _items) {
      item.displayItem();
    }

    print(' Total Due: ₦$_total');

    _items.clear();
    _total = 0.0;
    print('  Order cleared. Ready for next customer!');
  }
}

void showFullMenu(List<MenuItem> menu) {
  print('');
  print('          FULL MENU              ');
  for (int i = 0; i < menu.length; i++) {
    stdout.write('  ${i + 1}. ');
    menu[i].displayItem();
  }
}

void main() {
  Food burgerDeluxe = Food('Burger Deluxe', 3500, 'large');
  Food garlicNoodles = Food('Garlic Noodles', 2000, 'medium');
  Food springRolls = Food('Spring Rolls', 1500, 'small');

  Drink icedLemonade = Drink('Iced Lemonade', 800, 'large', true);
  Drink hotChocolate = Drink('Hot Chocolate', 600, 'medium', false);
  Drink watermelon = Drink('Watermelon Slush', 950, 'large', true);

  List<MenuItem> menu = [
    burgerDeluxe,
    garlicNoodles,
    springRolls,
    icedLemonade,
    hotChocolate,
    watermelon,
  ];

  stdout.write('Enter customer name: ');
  String? firstCustomer = stdin.readLineSync();
  Order currentOrder = Order(firstCustomer ?? 'Guest');

  print('\nWelcome, ${currentOrder.customerName}! ');

  bool isRunning = true;

  while (isRunning) {
    print('');
    print('         RESTAURANT ORDER SYSTEM       ');
    print('  1. View Menu                            ');
    print('  2. Add Item to Order                    ');
    print('  3. Remove Item from Order               ');
    print('  4. Print Bill                           ');
    print('  5. Exit                                 ');
    stdout.write('Your choice: ');

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      showFullMenu(menu);
    } else if (choice == '2') {
      showFullMenu(menu);
      stdout.write('Enter the number of the item to add: ');
      String? pick = stdin.readLineSync();

      int? pickNum = int.tryParse(pick ?? '');

      if (pickNum == null || pickNum < 1 || pickNum > menu.length) {
        print(
          '   Invalid choice. Please enter a number between 1 and ${menu.length}.',
        );
      } else if (pickNum == 1) {
        currentOrder.addItem(burgerDeluxe);
      } else if (pickNum == 2) {
        currentOrder.addItem(garlicNoodles);
      } else if (pickNum == 3) {
        currentOrder.addItem(springRolls);
      } else if (pickNum == 4) {
        currentOrder.addItem(icedLemonade);
      } else if (pickNum == 5) {
        currentOrder.addItem(hotChocolate);
      } else if (pickNum == 6) {
        currentOrder.addItem(watermelon);
      }
    } else if (choice == '3') {
      stdout.write('Enter the name of the item to remove: ');
      String? itemName = stdin.readLineSync();

      if (itemName == null || itemName.trim().isEmpty) {
        print('  You didn\'t type anything. Try again.');
      } else {
        currentOrder.removeItem(itemName.trim());
      }
    } else if (choice == '4') {
      currentOrder.printBill();

      stdout.write(
        '\nEnter next customer name (or press Enter to keep same): ',
      );
      String? nextCustomer = stdin.readLineSync();
      if (nextCustomer != null && nextCustomer.trim().isNotEmpty) {
        currentOrder.customerName = nextCustomer.trim();
        print('   New customer: ${currentOrder.customerName}. Ready to order!');
      }
    } else if (choice == '5') {
      print('');
      print('  Thank you for dining with us. Goodbye!');
      isRunning = false;
    } else {
      print('  Please enter a number between 1 and 5.');
    }
  }
}
