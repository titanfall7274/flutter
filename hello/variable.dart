// dart run hello.dart

// entry point
void main() {
  // hello world
  print('hello');

  /**
   *   variable
   *
   *   var (style guide: guess for you)
   *   dynamic ( it needs typeCheck )
   *   ?
   *   final
   *   lage
   *   const (compile-time const)
   *
   *   int(local variable)
   */


  // var
  var name = "니꼬";
  name = "nicco";

  // dynamic
  dynamic something; // 받은 데이터 타입을 모를경우 활용 가능, 데이터 타입 확정시 많은 function method 지원
  if(something is String) {
    print(something.isEmpty);
  }

  // Without null safety:
  bool isEmpty(String string) => string.length == 0;
  // isEmpty(null); // null.length >> NoSuchMethodError

  // null safety
  String? nico = 'nico';
  nico = null;
  // nico.length; // error

  if(nico != null) {
    nico.isNotEmpty;
  }
  nico?.isNotEmpty;

  // final - 한번 정의된 변수를 바뀌지 않도록 만들때
  final count = 0;
  // count = 1;

  // Late - do something, go to api
  late final String str; // 초기 데이터 없이 변수를 선언하게 해줌
  // print(str);
  str = "answer";
  // str = "";

  // const - not same javascript
  const API = '121212';// compile-time constant
  const max_allowed_price = 120;

}
