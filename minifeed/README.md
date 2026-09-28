# Minifeed

익명으로 짧은 글을 올리고 읽는 피드 앱 (과제 #2108 연습용)

## 기술 스택

- Flutter 3.47.2 (Dart 3.13.2)
- Android 7.0 (API 24) 이상
- Firebase 익명 인증 · Firestore (MP2부터)

## 시작하기

```bash
cd minifeed
flutter pub get
flutter run
```

USB 또는 무선 ADB로 연결한 Android 기기가 필요합니다. `flutter devices`로 연결을 확인하세요.

## 커밋 컨벤션

- `feat:` 기능 추가
- `fix:` 버그 수정
- `refactor:` 기능 변경 없는 코드 구조 개선
- `test:` 테스트 추가·수정
- `docs:` 문서
- `chore:` 설정/빌드 관련

제목은 한 줄 한글로 쓰고, 관련 이슈 번호를 끝에 붙입니다. 예: `feat: PostCard 레이아웃 (#5)`
