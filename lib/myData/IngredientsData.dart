import '../Models/Ingredient.dart';

List<Ingredient> ingredientsData = [
  //***************Dairy Products
  Ingredient("Milk", "Dp"),
  Ingredient("Egg", "Dp"),
  Ingredient("Cheese", "Dp"),
  Ingredient("Butter", "Dp"),
  Ingredient("Yogurt", "Dp"),
  Ingredient("Sour cream", "Dp"),
  Ingredient("Heavy cream", "Dp"),
  Ingredient("Cream", "Dp"),
  Ingredient("Margarine", "Dp"),
  Ingredient("Curd", "Dp"),
  Ingredient("Frosting", "Dp"),
  //***************Vegetables
  Ingredient("Tomato", "Veg"),
  Ingredient("Potato", "Veg"),
  Ingredient("garlic", "Veg"),
  Ingredient("onion", "Veg"),
  Ingredient("Pepper", "Veg"),
  Ingredient("Carrot", "Veg"),
  Ingredient("Ginger", "Veg"),
  Ingredient("Scallion", "Veg"), //bssal
  Ingredient("Mushroom", "Veg"),
  Ingredient("Avocado", "Veg"),
  Ingredient("Cucumber", "Veg"),
  Ingredient("Spinach", "Veg"),
  Ingredient("Broccoli", "Veg"),
  Ingredient("Pumpkin", "Veg"),
  Ingredient("Cabbage", "Veg"),
  Ingredient("Cauliflower", "Veg"),
  Ingredient("Eggplant", "Veg"),
  Ingredient("Lettuce", "Veg"),
  Ingredient("Artichoke", "Veg"),
  Ingredient("Radish", "Veg"),
  Ingredient("Parsley", "Veg"), //ma3dnous
  Ingredient("Cilantro", "Veg"), //krafes
  //***************Fruits
  Ingredient("Lemon", "Fr"),
  Ingredient("Lime", "Fr"),
  Ingredient("Apple", "Fr"),
  Ingredient("Orange", "Fr"),
  Ingredient("Banana", "Fr"),
  Ingredient("Strawberry", "Fr"),
  Ingredient("Blueberry", "Fr"),
  Ingredient("Grape", "Fr"),
  Ingredient("Pineapple", "Fr"),
  Ingredient("Raspberry", "Fr"),
  Ingredient("Mango", "Fr"),
  Ingredient("Peach", "Fr"),
  Ingredient("Coconut", "Fr"),
  Ingredient("Pear", "Fr"),
  Ingredient("Date", "Fr"),
  Ingredient("Cherry", "Fr"),
  Ingredient("Watermelon", "Fr"),
  Ingredient("Pomegranate", "Fr"), //rommen
  Ingredient("Kiwi", "Fr"),
  Ingredient("Plum", "Fr"), //3wina
  Ingredient("Apricot", "Fr"),
  Ingredient("Fig", "Fr"), //tin
  Ingredient("Melon", "Fr"),
  Ingredient("Tangerine", "Fr"),
  //***************Spices
  Ingredient("Salt", "Spc"),
  Ingredient("Cumin", "Spc"),
  Ingredient("basil", "Spc"),
  Ingredient("Cinnamon", "Spc"),
  Ingredient("Basil", "Spc"),
  Ingredient("Thyme", "Spc"), //za3ter
  Ingredient("Oregano", "Spc"), //kl rass 7anout
  Ingredient("Paprika", "Spc"),
  Ingredient("Rosemary", "Spc"),
  Ingredient("Cayenne", "Spc"), //bar 3bid
  Ingredient("Turmeric", "Spc"), //korkom
  Ingredient("Clove", "Spc"), //9ronfel
  Ingredient("Chive", "Spc"), //thoum a5dher
  Ingredient("Dill", "Spc"), //chebt
  Ingredient("Mint", "Spc"),
  Ingredient("Coriander", "Spc"), //kozber
  Ingredient("Cardamom", "Spc"), //hiil
  Ingredient("Sage", "Spc"), //rand
  Ingredient("Tarragon", "Spc"), //tronjeya
  Ingredient("Saffron", "Spc"), //za3fran
  Ingredient("Olive", "Spc"),
  //***************Sugar
  Ingredient("Sugar", "Sg"),
  Ingredient("Brown", "Sg"),
  Ingredient("Honey", "Sg"),
  Ingredient("Vanilla", "Sg"),
  Ingredient("Maple", "Sg"),
  Ingredient("Cocoa", "Sg"),
  Ingredient("Chocolate", "Sg"),
  Ingredient("Marshmallow", "Sg"),
  Ingredient("Oreo", "Sg"),
  Ingredient("Biscuits", "Sg"),
  Ingredient("Jam", "Sg"),
  Ingredient("Fudge", "Sg"),
  Ingredient("Candy", "Sg"),
  //***************Flours
  Ingredient("Flour", "Fl"),
  Ingredient("Soda", "Fl"),
  Ingredient("Baking", "Fl"),
  Ingredient("Cornstarch", "Fl"),
  Ingredient("Yeast", "Fl"),
  Ingredient("Panko", "Fl"), //farina yabaneya
  Ingredient("Almond", "Fl"),
  Ingredient("Gelatin", "Fl"),
  Ingredient("Rice", "Fl"),
  Ingredient("Oat", "Fl"),
  Ingredient("Cacao", "Fl"),
  //****************Oils
  Ingredient("Olive oil", "Oil"),
  Ingredient("Vegetable oil", "Oil"),
  Ingredient("Coconut oil", "Oil"),
  Ingredient("Sesame oil", "Oil"),
  Ingredient("Frying oil", "Oil"),
  Ingredient("Sunflower oil", "Oil"),
  Ingredient("Palm oil", "Oil"),
];

List<String> getAllIngredientsName() {
  List<String> myList = [];
  for (var i in ingredientsData) myList.add(i.ingrName.toLowerCase());
  return myList;
}
