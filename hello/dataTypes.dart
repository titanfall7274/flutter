void main() {
  // 모든 variable 또한 object이다.

  String name = "nico";
  name.length; // a lot of method

  bool alive = true;
  int age = 12;
  double money = 12.34;

  num x = 12; // could be integer | double
  x = 1.1;

  // List, Collection.if()
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if(giveMeFive) 5,
  ];
  // List<int> numbers2 = [1, 2, 3, 4]; // 자료형 명시는 class 에서만

  print(numbers);
  numbers.add(1);
  print(numbers);

  // String Interpolation
  var name2 = 'nico';
  var age2 = 10;
  var greeting = "Hello, everyone, my name is $name and I'm ${age2 + 2}";

  print(greeting);

  // Collection For
  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for(var friend in oldFriends) "$friend",
  ];

  print(newFriends);
}