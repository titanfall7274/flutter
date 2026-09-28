import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      // 화면·AppBar 배경
      surface: Color(0xFFFFFFFF),
      // 본문 글자, 아이콘
      onSurface: Color(0xFF111111),
      // Card, BottomSheet 배경
      surfaceContainerLow: Color(0xFFF7F7F7),
      // 팝업 메뉴 배경, 스크롤된 AppBar 배경
      surfaceContainer: Color(0xFFF1F1F1),
      // Dialog 배경
      surfaceContainerHigh: Color(0xFFEAEAEA),
      // 채워진 TextField 배경
      surfaceContainerHighest: Color(0xFFE2E2E2),
      // 보조 글자(작성 시각, 좋아요·댓글 수), 비활성 아이콘
      onSurfaceVariant: Color(0xFF5E5E5E),
      // OutlinedButton·TextField 테두리
      outline: Color(0xFF8C8C8C),
      // Divider, Chip 테두리
      outlineVariant: Color(0xFFE2E2E2),
      // FilledButton 배경, 포커스된 TextField 테두리, 로딩 인디케이터
      primary: Color(0xFF111111),
      // primary 위 글자·아이콘
      onPrimary: Color(0xFFFFFFFF),
      // FAB 배경
      primaryContainer: Color(0xFFE8E8E8),
      // FAB 아이콘
      onPrimaryContainer: Color(0xFF111111),
      // 선택된 Chip 배경, FilledButton.tonal 배경
      secondaryContainer: Color(0xFFEDEDED),
      // secondaryContainer 위 글자·아이콘
      onSecondaryContainer: Color(0xFF111111),
      // TextField 에러 글자·테두리, 실패 안내
      error: Color(0xFFD93025),
      // error 위 글자·아이콘
      onError: Color(0xFFFFFFFF),
      // SnackBar 배경
      inverseSurface: Color(0xFF2A2A2A),
      // SnackBar 글자
      onInverseSurface: Color(0xFFF2F2F2),
      // SnackBar 액션 버튼 글자
      inversePrimary: Color(0xFFE0E0E0),
      // Dialog·BottomSheet 뒤를 어둡게 덮는 막
      scrim: Color(0xFF000000),
    );

    final base = ThemeData(colorScheme: colorScheme);

    // 크기·줄 높이는 Material 3 기본값 그대로 두고, title·headline 굵기만 바꾼다.
    // titleSmall은 기본값(Medium) 유지.
    // 기본값으로 쓰는 나머지: bodyLarge(TextField 입력), bodyMedium(SnackBar),
    // bodySmall(TextField 도움말·글자 수), labelLarge(버튼 글자).
    final textTheme = base.textTheme.copyWith(
      // 큰 제목 (M3 위젯 기본 사용처 없음)
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      // Dialog 제목
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      // AppBar 제목
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      // ListTile 제목, BottomSheet 제목
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );

    return base.copyWith(
      // 굵기별 폰트 파일을 처음 쓸 때 인터넷에서 받아 기기에 캐시한다.
      textTheme: GoogleFonts.notoSansKrTextTheme(textTheme),
      extensions: const [AppColors.light],
    );
  }
}

/// ColorScheme에 없는 색. `Theme.of(context).extension<AppColors>()!`로 꺼낸다.
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.like,
    required this.userOn,
    required this.users,
  });

  /// 좋아요 누른 하트
  final Color like;

  /// 아바타 글자색
  final Color userOn;

  /// 아바타 배경색. 게시글의 사용자 색 번호(0~7)로 고른다.
  final List<Color> users;

  // user/6~8은 user/2~4와 값이 같다. 임시 값인지 팀에 확인 필요(#2).
  static const light = AppColors(
    like: Color(0xFFE8263A),
    userOn: Color(0xFF1F1F1F),
    users: [
      Color(0xFFEEEFE8),
      Color(0xFFBDCEE0),
      Color(0xFFE8ACBA),
      Color(0xFF8FBC93),
      Color(0xFFFBEBBE),
      Color(0xFFBDCEE0),
      Color(0xFFE8ACBA),
      Color(0xFF8FBC93),
    ],
  );

  @override
  AppColors copyWith({Color? like, Color? userOn, List<Color>? users}) {
    return AppColors(
      like: like ?? this.like,
      userOn: userOn ?? this.userOn,
      users: users ?? this.users,
    );
  }

  // 테마 전환 애니메이션용 중간값. 라이트 하나뿐이라 형식만 맞춘다.
  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      like: Color.lerp(like, other.like, t)!,
      userOn: Color.lerp(userOn, other.userOn, t)!,
      users: [
        for (var i = 0; i < users.length; i++)
          Color.lerp(users[i], other.users[i], t)!,
      ],
    );
  }
}
