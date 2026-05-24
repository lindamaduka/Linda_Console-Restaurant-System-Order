import 'dart:io';
import 'order.dart';
import 'menu.dart';

void main() {
  // Ask for the first customer's name before we start the loop.
  // If they just press Enter without typing anything, console will type name as "Guest".
  stdout.write('Enter customer name: ');
  String? firstCustomer = stdin.readLineSync();
  Order currentOrder = Order(
    firstCustomer?.trim().isNotEmpty == true ? firstCustomer!.trim() : 'Guest',
  );

  print('');
  print('Welcome, ${currentOrder.customerName}! Your order is in progress.');

  // isRunning controls the while loop.
  // As long as it is true, the menu keeps showing after each action.
  // When the user picks Exit, we set it to false and the app closes.
  bool isRunning = true;

  while (isRunning) {
    // Print the menu when the app starts
    print('');
    print('Restaurant Order System:             ');
    print('  1. View Menu');
    print('  2. Add Item to Order');
    print('  3. Remove Item from Order');
    print('  4. Print Receipt');
    print('  5. Exit');
    stdout.write('Your choice: ');

    String? choice = stdin.readLineSync();

    // OPTION 1: View Menu
    // It prints every item with its number, name, and details.
    if (choice == '1') {
      showFullMenu();

      //  OPTION 2: Add Item to Order
      // Show the menu so the customer can see the numbers,
      // then ask which number they want to add.
    } else if (choice == '2') {
      showFullMenu();
      stdout.write('Enter the number of the item to add: ');
      String? pick = stdin.readLineSync();

      // int.tryParse safely converts the typed text to an integer.
      // If they typed something that is not a number, it returns null.
      int? pickNum = int.tryParse(pick ?? '');

      if (pickNum == null || pickNum < 1 || pickNum > menuItems.length) {
        // If the number entered isn't on the menu, print the error message
        print(
          '  Invalid choice. Please enter a number between 1 and ${menuItems.length}.',
        );
      } else if (pickNum == 1) {
        currentOrder.addItem(butterChicken);
      } else if (pickNum == 2) {
        currentOrder.addItem(muffin);
      } else if (pickNum == 3) {
        currentOrder.addItem(whiteRiceAndStew);
      } else if (pickNum == 4) {
        currentOrder.addItem(plantainAndEgg);
      } else if (pickNum == 5) {
        currentOrder.addItem(stirFrySpaghetti);
      } else if (pickNum == 6) {
        currentOrder.addItem(cafeLatte);
      } else if (pickNum == 7) {
        currentOrder.addItem(milkshake);
      } else if (pickNum == 8) {
        currentOrder.addItem(berryBlast);
      } else if (pickNum == 9) {
        currentOrder.addItem(mangoJuice);
      }

      //  OPTION 3: Remove Item from Order
      // here, the name of the item needed to be removed is entered
    } else if (choice == '3') {
      stdout.write('Enter the name of the item to remove: ');
      String? itemName = stdin.readLineSync();

      if (itemName == null || itemName.trim().isEmpty) {
        // if Enter was pressed without typing anything
        print('  You did not enter a name. Please try again.');
      } else {
        currentOrder.removeItem(itemName.trim());
      }

      //  OPTION 4: Print Receipt
      // Print the full receipt for the current customer.
      // After printing, Order clears itself automatically
    } else if (choice == '4') {
      currentOrder.printBill();

      // Ask for the next customer's name straight after the receipt is printed
      stdout.write(
        'Enter next customer name (or press Enter to keep "${currentOrder.customerName}"): ',
      );
      String? nextName = stdin.readLineSync();

      if (nextName != null && nextName.trim().isNotEmpty) {
        currentOrder.customerName = nextName.trim();
        print('  New customer set to: ${currentOrder.customerName}');
      }

      //  OPTION 5: Exit
      // changes isRunning to false. The while loop checks this condition
      // at the top of each round, so it will stop after this is selected
    } else if (choice == '5') {
      print('');
      print('  Thank you for dining with Lcm_Restaurant. Goodbye!');
      isRunning = false;

      // print this error message if a number gereater than fve is entered.
    } else {
      print('  Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}
