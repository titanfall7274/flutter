중요하고 알아야하는 내용만 남기는 md 이다.

1. flutter는 운영체제에 부탁하여 화면을 그리지 않는다. 플러터는 엔진을 사용하여 화면의 모든 부분을 다룰수 있으며 flutter를 사용하면 네이티브 앱으로부터 아이콘을 받지 않고 모든 아이콘을 설계할수 있어 안드로이드나 ios에 종속되지 않은 디자인이 가능하다. 

2. flutter extention, dart extension을 사용하면 debug 버튼을 통해 원하는 에뮬레이터, chrome 등등 크로스 플랫폼에 쉽게 설치할수 있으며 flutter devtools: inspector와 flutter widget preview를 사용하여 구조를 미리 확인해 볼수있다.

3. flutter는 Widget에 return 하여 앱의 화면을 그리게 됩니다. 그중 하나는 StatelessWidget이며 반드시 build 라는 함수를 override 하도록 합니다. 이 build라는 함수는 Widget을 반환하며 앱의 화면을 그리는 runApp에 반환되는 클래스 App은 앱의 루트가된다.

4. Widget은 반드시 2개의 형식중 하나를 return 해야한다. 각각 MaterialApp or CupertinoApp 어떤 family style을 사용할지 flutter에게 말해주게 되며 각각 google 과 ios(apple)에서 제공한다. customize 앱을 만들거지만 두가지중 하나를 반드시 사용해야한다. 이것들은 base ui filling을 설정하는거다. google이 만들은 flutter 특성상 material 쪽이 더 보기좋다. 기본적으로 amterialApp을 사용하면 된다.

5. MaterialApp(home: Widget?) 이라는게 있다. 널타입일수 있으며 애플리케이션의 home에 갔을때 무엇이 보여야하는가를 결정합니다.;

6. screen은 Scaffold(화면의 구조 골격)를 가집니다. navigationBar bottom tab bar buttonTop, screen 등등 정의를 가능하게 해줍니다.

7. return MaterialApp(home: Scaffold()) 수많은 옵션들을 볼수있습니다.

8. flutter 에서 모든것은 Widget이며 심지어는 Text, Center, appBar 등등 모든것이 위젯이다. 위젯안에 위젯을 그리고 우리는 그걸통해 트리를 만들게된다. 

9. Dart는 우리가 class로 작성하는것에 대해 모두 인스턴스화 해준다. java처럼 객체를 생성할때마다 new를 할 필요가 없는 framework다. ex) new Text(""), new MaterialApp() 이런작업을 하지 않는다.

10. 각 Widget은 필수로 필요로 하는 required 속성이 붙은 생성자들이 존재하니 하나하나 확인해보기 바랍니다. Text의 경우에는 String data 속성을 반드시 요구하게 되며 나머지는 null을 허용하거나 기본으로 값이 들어가 있기도합니다.