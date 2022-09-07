# wanted_pre_onboarding
---

## Intro
---

한 화면에서 대한민국 주요 도시의 날씨 정보를 볼 수 있는 `One Weather` 앱을 소개합니다.   
   
<img width="275" alt="스크린샷 2022-09-07 오후 12 38 53" src="https://user-images.githubusercontent.com/82270058/188783494-b4385b91-7f1a-480c-be70-59762b369a64.png">

자세한 날씨가 보고 싶다면, 각 도시를 클릭해서 상세한 날씨 정보를 알아보세요!   
   
<img width="275" alt="스크린샷 2022-09-07 오후 12 39 38" src="https://user-images.githubusercontent.com/82270058/188783576-0f5526be-8142-41e6-ba51-cc8a705d5f84.png">

## features
---

1. `MVVM` 아키텍쳐 패턴

- 뷰와 모델 간 철저한 분리로 테스트 용이성 증가
- 하나의 재사용 가능한 뷰모델이 네트워크 통신을 중개하여 뷰와 모델 사이 소통을 매개

2. `NSCache` 를 활용한 이미지 캐싱

- 각 뷰에서 이미지를 로딩하기 위해 소요되는 속도를 `NSCache` 를 활용하여 단축
- 분기 처리를 통해 캐시 로딩되지 않을 때 필요한 아이콘만 따로 이미지를 로드할 수 있도록 지원

3. `Open Weather API` 에서 제공하는 다양한 날씨 정보 열람 가능

> Starts at 220902.
> Ends at 220907.
