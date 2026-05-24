import 'dart:io';
import 'menu_item.dart';
import 'food.dart';
import 'drink.dart';

// Each Food object take the following features: name, price, portion size.
// Portion size is one of: "small", "medium", "large".

Food butterChicken = Food('Butter Chicken', 4500, 'Large');

Food muffin = Food('Muffin', 1200, 'Small');

Food whiteRiceAndStew = Food('White Rice and Stew', 2500, 'Medium');

Food plantainAndEgg = Food('Plantain and Egg Sauce', 2000, 'Medium');

Food stirFrySpaghetti = Food('Stir Fry Spaghetti', 2800, 'Large');

// Each Drink object take te following features: name, price, size, isCold (true = cold, false = hot).

Drink cafeLatte = Drink('Cafe Latte', 1900, 'Medium', false);

Drink milkshake = Drink('Milkshake', 2500, 'Large', true);

Drink berryBlast = Drink('Berry Blast', 1800, 'Large', true);

Drink mangoJuice = Drink('Mango Juice', 900, 'Medium', true);

// All items in the menu list are collected into a single list.
// The order here determines the numbers shown to the customer
// when they view the menu or pick an item to add.
List<MenuItem> menuItems = [
  butterChicken,
  muffin,
  whiteRiceAndStew,
  plantainAndEgg,
  stirFrySpaghetti,
  cafeLatte,
  milkshake,
  berryBlast,
  mangoJuice,
];

// showFullMenu()
// Prints every item in menuItems with a number in front of it.
// The number is what the customer types when they want to add that item.

void showFullMenu() {
  print('');
  print('  Full Menu:  ');

  for (int i = 0; i < menuItems.length; i++) {
    stdout.write('  ${i + 1}. ');
    menuItems[i].displayItem();
  }
}
