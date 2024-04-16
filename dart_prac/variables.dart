// 2. Variables

// // 2-1. var
// void main() {
//   var name1 = '껀이';
//   String name2 = '꺼니';
//   // 변수를 지정하는 방법 -> var 키워드 : var name / 명시적 타입 : String name
//   // var 키워드를 사용하면 -> dart compiler가 변수의 타입을 추론하게 됨
//   // 변수를 업데이트할 때는 초기에 추론한 변수 타입과 같은 타입으로만 됨 -> ex. String 타입 변수에 Int를 넣지 못함
//   name1 = 'kuuneeee';

//   // 보통 
//   // 함수나 메서드 내의 '지역변수' 지정시에는 var
//   // 클래스 내의 '변수'나 'property' 선언 시 명시적 타입
// }



// // 2-2. Dynamic Type
// void main() {
//   // dynamic 타입은 어떤 변수 타입이든지 될 수 있을 때 사용
//   // Flutter나 JSON처럼 동적인 데이터를 처리할 때 유용
//   // 하지만, 남용하면 코드 가독성 저하, compiler가 타입을 확인하지 않아 발생할 수 있는 오류가 생길 수 있음
//   var name; // = dynamic name;

//   // 업데이트 할때도 어떤 타입으로든 가능
//   // name = 'kuuneeee';
//   // name = 11;
//   // name = true;

//   if(name is String){
//     // 여기 안에서는 name이 String일 거기 때문에 그에 맞는 .method 들을 사용할 수 있음
//   }

//   // 변수가 어떤 타입일지 알기 어려운 경우가 있기 때문에 dynamic을 사용하는게 좋을 때가 있음
// }



// // 2-3. Nullable Variables
// // Null Safety : 개발자가 Null 값을 참조할 수 없도록 하는 것
// // Null 값을 참조하면 런타임 에러가 발생함 -> 사용자가 앱을 사용하는 중에 뜨는 에러

// // // Without Null Safety
// // bool isEmpty(String string) => string.length == 0;

// // main() {
// //   isEmpty(null);
// // }

// void main() {
//   String? name = 'kuuneeee';
//   // 타입 뒤에 ? -> null 값일 수도 있다는 거 명시  => name은 String이거나 null 일 것이다
//   name = null;
//   // 1)
//   if (name != null) {
//     // 여기 안에서는 null이 확실하게 아닐 것
//     name.isNotEmpty;
//   }
//   // 2)
//   name?.isNotEmpty;
// }
// // ==> Null Safety란, 어떤 변수, 혹은 데이터가 null이 될 수 있음을 명시하는 것
//         // null이라면 따로 처리해줄 수 있기 때문에 에러를 방지하는거



// // 2-4. Final Variables
// void main() {
//   final name = 'kuuneeee'; // final String name = 'kuuneeee'; 이렇게 명시적 타입도 정해서 쓸 수도 있음
//   // final 변수는 초기 설정 타입에서 변경할 수 없음 -> javascript나 typescript의 const
// }



// // 2-5. Late Variables
// void main() {
//   late final String name;
//   // API에서 데이터 받아오고 등등 다른 작업 하고
//   name = 'kuuneeee'; // 변수에 데이터를 나중에 넣을 수 있게 해주는 거 -> late

//   // 값을 넣기 전에 변수를 출력하거나 하는 등의 실수를 방지할 수 있음
//   // Flutter로 data fetching을 할 때 유용
// }



// // 2-6. Constant Variables
// // dart의 const는 javascript나 typescript의 const와는 다름(dart의 final과 유사)
// // dart의 const는 compile-time constant를 만듦

// void main() {
//   const name = 'kuuneeee';
//   // const 변수는 final 변수와 같이 업데이트 될 수 없음
//   // compile-time에 알고 있는 값이어야 한다는 것

//   // API 키값을 예시로 들면, 
//   const API1 = '12345';
//   const API2 = fetchAPI();

//   // API1은 현재 어플리케이션이 compile될 때, 알고 있는 값이므로 const 변수로 선언 가능
//   // API2는 현재 어플리케이션이 compile될 때가 아닌 API 호출 시에 알게 되는 값이므로 const 변수로 선언 불가능
//     // API2는 const가 아니라 final이 맞음
// }
