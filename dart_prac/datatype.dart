// 3. Data Types

// // 3-1. Basic Data Types
// void main() {
//   // 모든 데이터 타입은 class로 object임
//   String name ='kuuneeee';
//   bool alive = true;
//   int age = 32;
//   double money = 100.11;
//   // int, double은 num 클래스에서 파생 -> 부모 클래스가 num

//   // num은 정수, 소수 가능
//   num x = 12;
//   num y = 1.1;
// }

// // 3-2. Lists
// void main() {
//   var numbers1 = [
//     1,
//     2,
//     3,
//     4,
//     5, // 리스트 마지막 요소에 ,를 하면 세로로 정렬됨 -> 요소들이 복잡하거나 할때 보기 편할 것 => preferences에서 Settings -> Editor -> Format On Save 체크
//   ];
//   List<int> numbers2 = [
//     1,
//     2,
//     3,
//     4,
//     5,
//   ];

//   // numbers1.add('lalalal'); -> 안됨
//   numbers1.add(1);
//   numbers1.first;
//   numbers1.last;

//   // collection if
//   // collection if는 '존재할 수도 안할 수도 있는 요소를 다루는 것'
//   var giveMeFive = true;
//   var numbers3 = [
//     1,
//     2,
//     3,
//     4,
//     if (giveMeFive) 5, // giveMeFive가 true이면 5가 추가되는거고, 아니면 없는 것
//   ];
//   print(numbers3);

//   // 위의 if는 아래 코드와 같음
//   // if (giveMeFive) {
//   //   numbers3.add(5);
//   // }
// }

// // 3-3. String Interpolation
// // String Interpolation은 text에 변수를 추가하는 방법
// void main() {
//   var name = 'kuuneeee';
//   var age = 16;
//   var greeting = 'Hello, everyone! my name is $name, and I\'m ${age + 2}';
//   // $name는 변수 사용할 때 사용
//   // 수식을 담을 때는 ${} 사용
//   // \' escape는 파이썬과 동일
//   print(greeting);
// }

// // 3-4. Collection For
// // 파이썬의 list comprehension과 유사
// void main() {
//   var oldFriends = ['nico', 'lynn'];
//   var newFriends = [
//     'lewis',
//     'ralph',
//     'darren',
//     for (var friend in oldFriends) "### $friend",
//   ];
//   print(newFriends);
// }

// // 3-5. Maps
// // javascript나 typescript에서의 opject, python의 dictionary와 같은 개념
// void main() {
//   var players = {
//     // Map<String, Object> players -> 이렇게 쓸수도 있음
//     'name': 'kuuneeee',
//     'xp': 19.99,
//     'super_power': false,
//   };
//   // Map<String, Object> : Object = any type -> 뭐든 올 수 있다는 거
//   // 실제로 key는 String이고 value는 Object(String, double, boolean -> any type)

//   Map<List<int>, bool> players2 = {
//     // 이렇게 복잡하게도 할수 있음
//     [1, 2, 3, 4]: true,
//   };

//   List<Map<String, Object>> players3 = [
//     {
//       'name': 'kuuneeee',
//       'xp': 19.99,
//     },
//     {
//       'name': 'kuuneeee',
//       'xp': 19.99,
//     },
//   ];
//   // 이런식으로 Map을 여러개 써서 만들 수도 있음 -> 추천하지 않는 방식
//   // key, value를 가지는 구조로 object를 만들 때, 그리고 그게 특정 구조를 가질 때 -> class를 사용하는게 나을 것
// }

// // 3-6. Sets
// void main() {
//   var numbers = {1, 2, 3, 4};
//   // Set<int> numbers2 = {1, 2, 3, 4};
//   // 파이썬에서의 Set와 같이 unique한 값을 요소로 하는 집합
//   numbers.add(1);
//   numbers.add(1);
//   numbers.add(1);
//   print(numbers);
// }
