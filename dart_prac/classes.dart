// 5. Classes

// // 5-1. Your First Dart Class
// class Player {
//   // property
//   String name = 'kuuneeee'; // final을 붙이면 수정이 안됨
//   int xp = 1500;

//   void sayHello() {
//     print("Hi my name is $name");
//     // $this.name이라고 해도 작동은 함 -> 하지만 클래스 내에서 권고되지 않음
//     // 클래스 내에 겹치는 변수명(같은 이름의 name 변수)가 있으면 this.name이라고 사용할 수는 있음
//     // this는 현재 객체(인스턴스, 여기선 Player 클래스)를 가리킴 -> this.name = Player.name
//   }
// }

// void main() {
//   var player = Player(); //Player 인스턴스 생성, new Player라고 안해도 됨 -> 작동은 함
//   // print(player.name);
//   // player.name = 'lalalalala';
//   // print(player.name);

//   player.sayHello();
// }

// // 5-2. Constructors
// // 5-2-1. Default Constructor
// class Player {
//   // constructor에서 값을 받을 거라서 late
//   late final String name;
//   late int xp;

//   // constructor
//   // 클래스 이름과 같아야 함
//   Player(String name, int xp) {
//     this.name = name;
//     this.xp = xp;
//   }

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player('kuuneeee', 1500);
//   player.sayHello();

//   var player2 = Player('lynn', 2500);
//   player2.sayHello();
// }

// // 5-2-2. Short Constructor
// class Player {
//   // late 사용 x
//   final String name;
//   int xp;

//   // constructor
//   // 순서 중요 -> 이런식으로 줄여서 작성 할 수 있음 => positional parameter(argument)
//   Player(this.name, this.xp);

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player('kuuneeee', 1500);
//   player.sayHello();

//   var player2 = Player('lynn', 2500);
//   player2.sayHello();
// }

// // 5-3. Named Constructor Parameters
// class Player {
//   final String name;
//   int xp;
//   String team;
//   int age;

// // constructor
// // positional parameter(argument)는 많아지면 통제하기 어려워질 수 있음
// // Player(this.name, this.xp, this.team, this.age);
// Player({
//   // named constructor parameter(argument)
//   required this.name, // null 값이 들어올 수 있기 때문에 required
//   required this.xp,
//   required this.team,
//   required this.age,
// });

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   // named parameter와 같음 -> required 변수는 없으면 안됨
//   var player = Player(
//     name: 'kuuneeee',
//     xp: 1200,
//     team: 'red',
//     age: 25,
//   );
//   player.sayHello();

//   var player2 = Player(
//     name: 'lynn',
//     xp: 2500,
//     team: 'blue',
//     age: 20,
//   );
//   player2.sayHello();
// }

// // 5-4. Named Constructors
// class Player {
//   final String name;
//   int xp, age; // int 변수가 여러개면 한번에 써도 됨
//   String team;

//   // constructor
//   Player({
//     // named constructor parameter(argument)
//     required this.name,
//     required this.xp,
//     required this.team,
//     required this.age,
//   });

//   // named constructor
//   // 플레이어를 초기화하는 method
//   Player.createBluePlayer({
//     // named parameter(argument)는 기본적으로 변수를 required하지 않기 때문에 써줘야 함
//     required String name, // createBluePlayer 메서드에서는 name, age를 required하고
//     required int age,
//   })  : this.name = name, // : 다음에 오는 걸로 property를 초기화하는 것
//         this.age = age, // name, age는 받아온 걸 사용
//         this.team = 'blue',
//         this.xp = 0;

//   Player.createRedPlayer(String name, int age)
//       // positional parameter(argument) -> 전부 required
//       : this.name = name,
//         this.age = age,
//         this.team = 'red',
//         this.xp = 0;

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// // xp가 0으로 초기화된 red, blue팀 각각의 Constructor를 만들고 싶다면?
// void main() {
//   var bluePlayer = Player.createBluePlayer(
//     name: 'kuuneeee',
//     age: 25,
//   );
//   var redPlayer = Player.createRedPlayer('lynn', 20);
//   bluePlayer.sayHello();
//   redPlayer.sayHello();
// }

// // 5-4-Recap
// class Player {
//   final String name;
//   int xp; // int 변수가 여러개면 한번에 써도 됨
//   String team;

//   Player.fromJSON(Map<String, dynamic> playerJson)
//       : name = playerJson['name'],
//         xp = playerJson['xp'],
//         team = playerJson['team'];

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// // xp가 0으로 초기화된 red, blue팀 각각의 Constructor를 만들고 싶다면?
// void main() {
//   var apiData = [
//     {
//       "name": "nico",
//       "team": "red",
//       "xp": 0,
//     },
//     {
//       "name": "lynn",
//       "team": "red",
//       "xp": 0,
//     },
//     {
//       "name": "dal",
//       "team": "red",
//       "xp": 0,
//     },
//   ];

//   apiData.forEach((playerJson) {
//     var player = Player.fromJSON(playerJson);
//     player.sayHello();
//   });
// }

// // 5-5. Cascade Notation
// // 5-5-1. defalt
// class Player {
//   String name;
//   int xp;
//   String team;

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//   });

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var nico = Player(name: 'nico', xp: 1200, team: 'red');
//   nico.name = 'las';
//   nico.xp = 120000;
//   nico.team = 'blue';
// }

// // 5-2-2. cascade operator
// class Player {
//   String name;
//   int xp;
//   String team;

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//   });

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// // cascade operator
// void main() {
//   var nico = Player(name: 'nico', xp: 1200, team: 'red');
//   var potato = nico
//     ..name = 'las' // 앞 . : 직전에 있는 클래스를 지칭 -> 여기선 nico
//     ..xp = 120000
//     ..team = 'blue'
//     ..sayHello(); // 메서드도 호출 가능
// }

// // 5-6. Enums
// // 선택의 폭을 좁혀서 실수하지 않게끔 해주는 장치
// enum Team { red, blue }

// // 'red', 'blue' 이렇게 안써도 된다 -> red, blue는 새로 지정한 Team 타입이 됨
// enum XPLevel { beginner, intermediate, advanced }

// class Player {
//   String name;
//   XPLevel xp; // XPLevel 타입으로 지정
//   Team team; // Team 타입으로 지정 -> red, blue만 있으니까 team 인자에는 저 둘만 오게 됨

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//   });

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var nico = Player(name: 'nico', xp: XPLevel.beginner, team: Team.red); // 바뀐 enum 타입으로 지정
//   var potato = nico
//     ..name = 'las'
//     ..xp = XPLevel.intermediate // XPLevel에서 호출
//     ..team = Team.blue // Team에서 호출
//     ..sayHello();
// }

// // 5-7. Abstract Classes
// // 추상화 클래스는 객체를 생성할 수 없음
// // 다른 클래스들이 직접 구현해야 하는 메서드들을 모아 놓은 일종의 blueprint
// abstract class Human {
//   void walk(); // Human 클래스는 walk 메서드를 가지고, void를 반환함
//   // 이걸 사용하면 다른 클래스들이 이 형태를 사용할 수 있음
//   // 메서드의 이름과 반환 타입, 파라미터만 정해서 정의
// }

// enum Team { red, blue }

// enum XPLevel { beginner, intermediate, advanced }

// class Player extends Human {
//   // Human 클래스를 상속
//   String name;
//   XPLevel xp;
//   Team team;

//   Player({
//     required this.name,
//     required this.xp,
//     required this.team,
//   });

//   void walk() {
//     // 추상화 클래스에서 상속한 메서드를 지정해줘야 함
//     print('I\'m walking...');
//     // Flutter에서는 그다지 많이 사용하지 않을 것
//   }

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// class Coach extends Human {
//   void walk() {
//     print('the coach is walking...');
//   }
// }
// // extends Human이 있다면 해당 클래스는 walk 메서드를 가지고 있다는 것을 알 수 있음
// // 하지만 각각의 클래스의 walk 메서드는 다르게 정의될 수 있음

// void main() {
//   var nico = Player(
//     name: 'nico',
//     xp: XPLevel.beginner,
//     team: Team.red,
//   );
//   var potato = nico
//     ..name = 'las'
//     ..xp = XPLevel.intermediate
//     ..team = Team.blue
//     ..sayHello();
// }

// // 5-8. Inheritance
// class Human {
//   final String name;
//   Human({required this.name});
//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// enum Team { red, blue }

// class Player extends Human {
//   // Player는 Human을 상속
//   final Team team;

//   Player({
//     required this.team,
//     required String name,
//   }) : super(name: name);
//   // super를 통해서 Human 클래스의 name으로 접근
//   // Human에서 name이 requied 변수이기 때문에 : 써서 초기화 -> required 변수 아니면 그냥 name

//   @override // 덮어씌우기
//   void sayHello() {
//     super.sayHello(); // super를 통해서 Human 클래스의 sayHello을 호출
//     print('and I play for ${team}');
//   }
// }

// void main() {
//   var player = Player(
//     team: Team.red,
//     name: 'kuuneeee',
//   );
//   player.sayHello();
// }

// 5-9. Mixins
// 생성자가 없는 클래스
mixin class Strong {
  // 버전이 바뀌면서 mixin, mixin class로 사용해야 함
  // final double strenghtLevel = 1500.99;
  double strenghtLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print('runnnnnnn!');
  }
}

mixin Tall {
  final double height = 1.99;
}
// 클래스에서 생성자를 없애면 mixin

enum Team { red, blue }

class Player with Strong, QuickRunner, Tall {
  // 상속하는게 아니라 다른 클래스들의 property나 메서드를 그냥 긁어오는 것
  // Flutter나 Flutter 플러그인 사용할때 많이 씀
  final Team team;
  String name;

  Player({
    required this.team,
    required this.name,
  });

  void sayHello() {
    print("Hi my name is $name");
  }

  String sayHello2() {
    return "Hello my name is $name";
  }
}

// Mixins은 여러 클래스에서 재사용이 됨
class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {
  var player = Player(
    team: Team.red,
    name: 'kuuneeee',
  );
  var kid = Kid();
  var horse = Horse();

  player.sayHello();
  print(player.strenghtLevel); // print는 두 가지를 가져오지 못하나??

  print('${player.sayHello2()} and my power is ${player.strenghtLevel}');
  // void 함수는 못함 -> 두 가지를 쓰려면 이렇게 값을 가져와서 print

  print('Kid...');
  kid.runQuick(); // 메서드는 () 없으면 메서드 자체로 호출됨 -> 파이썬과 같음

  // 같은 mixin을 사용해도 초기화해서 따로 사용할 수 있음 -> property를 가져와서 클래스의 property로 하는거니까
  player.strenghtLevel = 0;
  print(player.strenghtLevel);

  horse.strenghtLevel = 10;
  print(horse.strenghtLevel);
}
// 상속은 extend를 사용 -> A extends B : A는 자식 클래스, B는 부모 클래스 -> A는 B의 인스턴스가 됨
// Mixin은 with으로 사용 -> 부모자식 클래스가 되는게 아니라 다른 클래스의 property나 메서드를 가져오는 것

// 5-10. Conclusion
// dart만의 특성들
// future, stream, isolate etc.
