enum ComplainType { abues, ads, privacy, illegal, etc }

String complainTitle(int index) {
  switch (index) {
    case 0:
      return '음란, 욕설 등 부적절한 내용';
    case 1:
      return '부적절한 홍보 또는 광고 내용';
    case 2:
      return '개인 정보 노출';
    case 3:
      return '불법 정보 기재';
    case 4:
      return '기타(직접 입력)';
    default:
      return '';
  }
}

String complainrReason(int index) {
  switch (index) {
    case 0:
      return 'abues';
    case 1:
      return 'ads';
    case 2:
      return 'privacy';
    case 3:
      return 'illegal';
    case 4:
      return 'etc';
    default:
      return '';
  }
}
