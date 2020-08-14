#  CoronaView

이젠 아카데미에서 진행한 팀 프로젝트 입니다.

사용자에게 코로나 관련 편의를 제공하고 다양한 Open API를 사용해 보기 위해 제작하였습니다.

# Description

- 개발 기간: 2020.07.08 ~ 2020.07.24 (약 2주)
- 참여 인원: Backend 2명
- 개발 환경
  - Spring 4.0,  Apache Tomcat 9.0,  Tiles3,  BootStrap
  - Java,  Jquery,  Git,  MVC Pttern
  - Corona-19-API,  Youtube Data API
  - Naver News API,  Kakao Map API
- 담당 구현 파트
  - 프로젝트 개발 환경 구축, 설계 참여
  - 팀장 역할을 맡아 pull request를 통한 GitHub Repository 관리
  - 팀원의 Git Conflict 해결
  - 코로나 관련 현황판, 지도, 리스트, 차트, 유튜브 리스트, 네이버 뉴스 리스트
  - Json Pasing 관련 모듈, Open-API 관련 모듈 제공
  - Bootstrap을 사용한 반응형

# Views

- **Web**




![](https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/CoronaView-gif.gif?raw=true)



- **반응형(폰 스크린샷)**



![](https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/app.png?raw=true)



# Implementation

- ### Open-API 모듈 및 Package구조

  ![](https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/API.png?raw=true)  

    [Detail Codes 클릭](https://github.com/77kkyu/Corona_View/blob/master/src/main/java/com/common/apiUtil/OpenApiCall.java)

  - Open API를 많이 사용하기 때문에 관련 코드의 재사용성을 위한 모듈.

  - **코로나 API** 

    코로나 대한민국 전체 API와 지역별 API를 사용하기에 하나의 함수로 정의했습니다.

  - **Youtube API** 

    Youtube API를 호출하는 함수를 정의했습니다.

  - **Naver News API** 

    Naver API를 호출하는 함수를 정의했습니다



------



- ###  Json Parsing 모듈

  ![](https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/JsonParsing.png?raw=true)  

    [Detail Codes 클릭](https://github.com/77kkyu/Corona_View/blob/master/src/main/java/com/common/apiUtil/JsonParsing.java)

  - Json형태로 데이터를 호출하여 사용하기 때문에 관련 코드의 재사용성을 위한 모듈.

    Sort를 이용해 데이터 재정렬.

  - 모든 Open-API가 Json형태이기 때문에 재사용성이 높아 하나의 클래스로 묶어

    Service에서 호출하여 Json Parsing이 이루어지도록 만들었습니다.

  - Service에서는 Open-API의 데이터를 호출하고 호출받은 데이터를 Json Pasing클래스에서

    함수를 호출해 Json형태를 Map형태로 바꾸어 데이터를 재 정렬했습니다.

    [Service Codes 클릭](https://github.com/77kkyu/Corona_View/blob/master/src/main/java/com/corona/main/MainServiceImpl.java)



------



- ### 코로나 현황판

  <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web1.png?raw=true" width="400" height="400"> 

  - **대한민국 데이터**

    Corona-19-API를 이용해 Json형태로 데이터를 호출받아 Service에서 Json Parsing 후

    Controller로 데이터를 넘겨 ModelAndView로 데이터를 View로 넘겨줌. 

  - **지역별 데이터**

    - Corona-19-API를 이용해 Json형태로 데이터를 호출받아 Service에서 Json Parsing

       Controller로 데이터를 넘겨 ModelAndView로 데이터를 View로 넘겨줌.

    - Json Parsing을 할 때 지역별 Class에서 Comparator를 사용해 함수를 만들어 놓고

       Service에서 호출해 총확진자와 새로운 확진자의 순서를 재 정렬했습니다.

  - **숫자 애니메이션**

    - Jquery의 animate() 함수를 사용해 지정된 확진자 수만큼 0부터 자동 증가합니다.

    - Script로 숫자가 3자리마다 콤마를 적용하는 함수를 사용해 애니메이션이 동작하면서 

      확진자 수가 3자리를 넘어가면 자동으로 콤마가 적용됩니다.



------



- ### 코로나 맵, 리스트, 차트

  - <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web2.png?raw=true" width="400" height="400"> 

    - **지도**

      1. Kakao Map API를 사용하여 위도와 경도에 마커를 표시했습니다.

      2. Json Pasing한 데이터를 View로 전달해 마우스를 올렸을 때 그 지역에 해당하는 

          데이터가 보여집니다.

         

  - <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web3.png?raw=true" width="400" height="400"> 

    - **리스트**

      1. Jquery 라이브러리 Tablesorter를 사용하여 현황 리스트를 구성했고 Pasing한 데이터를

         사용했습니다.

      2. 각각의 타이틀을 클릭했을 때 해당 타이틀의 높은 순서, 낮은 순서로 표출되어 나옵니다.

      

  - <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web4.png?raw=true" width="400" height="400"> 

    - **차트**
      1. Morris 차트를 사용하여 차트를 구성했고 마우스를 올렸을 때 데이터 수치가 나타납니다.
      2. Morris 차트에 맞게 Json Pasing후 데이터 타입을 맞춰서 표기했습니다. 



------



- ### News, Youtube

  - <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web5.png?raw=true" width="400" height="400"> 

    - **News**

      1. Naver News API를 사용하여 리스트를 구성했습니다.

      2. 데이터를 Json형태로 호출해 Json Pasing후 원하는 데이터를 Naver News클래스에 반환했고 클릭 시 해당 링크로 이동됩니다.  

         

    

  - <img src="https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/web6.png?raw=true" width="400" height="400"> 

    - **Youtube**
      1. Youtube Data API를 사용하여 리스트를 구성했습니다.
      2. 데이터를 Json형태로 호출해 Json Pasing후 원하는 데이터를 Youtube클래스에 반환했고 클릭 시 해당 Youtube 동영상이 있는 링크로 이동 됩니다. 

    

# Collaboration

- GitHub

  - Project board 를 통한 일정 관리

    ![](https://github.com/77kkyu/Corona_View/blob/master/src/main/webapp/img/project_board.png?raw=true)
