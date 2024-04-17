// 4. Functions

// // 4-1. Defining a function

// // // 4-1-1.
// // void sayHello(String name) {
// //   // void는 이 함수가 부가적인 효과만 있고 아무것도 return 하지 않는다는 것을 말함
// //   // console에 print만 하고 return 하지 않음
// //   print("Hello, $name nice to meet you!");
// // }

// // // 4-1-2.
// // String sayHello(String name) {
// //   // String을 return하는 함수 sayHello
// //   // tip. 변수 name에 커서를 두고 ctrl+d하면 같은 변수명을 다 잡을 수 있음
// //   return "Hello, $name nice to meet you!";
// // }

// // 4-1-2.처럼 호출해서 바로 return하는 함수는 아래와 같이 작성할 수 있음
// String sayHello(String name) => "Hello, $name nice to meet you!";
// // => : fat arrow syntax -> 곧바로 return하는 것

// num plus(num a, num b) => a + b;

// void main() {
//   // sayhello 함수는 main 밖에 작성해도 되지만, main 안에서 호출해줘야 함
//   print(sayHello('kuuneeee'));
//   print(plus(2, 4));
// }

// // 4-2. Named Parameters
// // 4-2-1. 한번에 여러가지 파라미터를 입력하는 경우 : positional parameters
// String sayHello(String name, int age, String country) {
//   return "Hello, $name. you are $age, and you come from $country.";
// }

// void main() {
//   print(sayHello('kuuneeee', 32, 'korea'));
//   // 이렇게 해도 되지만 이 순서를 그대로 입력해야되고, 해당 요소들이 어떤 의미를 갖는지 알아야 사용할 수 있음
// }

// // 4-2-2. named argument 사용, default value 사용하는 경우
// String sayHello({
//   String name = 'anon',
//   int age = 99,
//   String country = 'wakanda',
// }) {
//   // main에서 named argument 사용하는 경우, 함수 입력 부분에 {} 해야함
//   // 단순히 {}만 하면 안됨 -> null safety 고려해야함 -> default value 지정
//   return "Hello, $name. you are $age, and you come from $country.";
// }

// void main() {
//   print(sayHello(
//     // 이렇게 하면 순서랑 상관없이 입력할 수 있고, 요소들이 의미하는 게 뭔지 알 수 있음
//     // named argument
//     age: 32,
//     // country: 'korea',
//     // name: 'kuuneeee',
//   ));
// }

// // 4-2-3. named argument 사용, default value 사용하지 않는 경우
// String sayHello({
//   required String name,
//   required int age,
//   required String country,
// }) {
//   // required modifier
//   // required는 입력값이 없으면 에러가 발생함
//   return "Hello, $name. you are $age, and you come from $country.";
// }

// void main() {
//   print(sayHello(
//     age: 12,
//     country: 'korea',
//     name: 'kuuneeee',
//   )); // required로 지정된 변수들이 입력되지 않으면 에러가 발생함
// }

// // 4-3. Optional Positional Parameters
// String sayHello(String name, int age, [String? country = 'korea']) =>
//     'Hello, $name. you are $age, and you come from $country.';
// // country null일 수도 있고 아닐 수도 있고(-> ?), null이면 default value인 korea를 사용함

// void main() {
//   var result = sayHello('kuuneeee', 32);
//   print(result);
// }

// // 4-4. QQ Operator : Question Question Operator
// // 4-4-1.
// String capitalizeName(String name) => name.toUpperCase();

// // 4-4-2. null도 입력할 수 있게끔 하려고 할때 -> 길게 쓰면
// String capitalizeName(String? name) {
//   // 길게 쓰면
//   if (name != null) {
//     return name.toUpperCase();
//   }
//   return 'ANON';
// }

// // 4-4-3. null도 입력할 수 있게끔 하려고 할때 -> 짧게 쓰면
// String capitalizeName(String? name) =>
//     name != null ? name.toUpperCase() : 'ANON';
// // name이 null이 아니면 ? .toUpperCase(), null이면 'ANON'
// // 파이썬 if else 문이랑 유사

// // 4-4-4. 더 짧게 하면
// String capitalizeName(String? name) => name?.toUpperCase() ?? 'ANON';
// // name이 null이 아니면 .toUperase가 null이 아니니깐 그대로
// // name이 null이면 .toUperase가 null이니깐 ANON을 반환

// void main() {
//   print(capitalizeName('kuuneeee'));
//   print(capitalizeName(null));
// }

// // QQ -> left ?? right
// // left가 null이면 right를 반환함

// // 4-4-5. QQ equals Operator : Question Question Equals Operator 또는 QQ assignment Operator : Question Question Assignment Operator
// void main() {
//   String? name;
//   name ??= 'kuneeee'; // name이 null이면 name = 'kuneeee' 할당
//   // name = null;
//   name ??= 'another'; // 여기서는 에러 -> name에 'kuuneeee'가 할당되어 있으므로, null이 되지 않으니까
//   print(name);
// }

// 4-5. Typedef
// 자료형이 헷갈릴때 도움이 될 alias를 만드는 방법

// // 4-5-1.
// typedef ListOfInts = List<int>; // 타입에 대해 따로 별명을 지어주고

// // List<int> reverseListOfNumbers(List<int> list) {
// ListOfInts reverseListOfNumbers(ListOfInts list) {
//   // 이렇게 바꿀 수 있음
//   var reversed =
//       list.reversed; // .reversed하면 iterable이 되서 .toList()를 해줘야 list로 반환함
//   return reversed.toList();
// }

// void main() {
//   print(reverseListOfNumbers([1, 2, 3]));
// }

// 4-5-2.
// Map도 같은 방식으로 할 수 있음
typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo) {
  return "Hi, ${userInfo['name']}";
}

void main() {
  print(sayHi({"name": 'kuuneeee'}));
}
// 이렇게 해도 작동은 하지만, 구조화된 데이터에 대해서는 class를 적용하는 게 좋음
// typedef는 간단한 데이터의 alias를 만들때 사용
