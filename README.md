# enrollment

## About this gem
 이 패키지는 모든 신청에 대한 프론트와 백엔드를 구현하는 것을 목표로 합니다.  
 이 패키지는 다음의 사례에 유용하게 쓰일 것입니다.
 - 수강신청 시스템이 필요한 프로젝트
 - 물품 구매 시스템을 만들어야 하는 프로젝트
 - 주기적으로 받아야 하는 예약 시스템
 - 티케팅 시스템

 이를 위해서는 다음의 기능이 필요합니다.
 - 사용자 페이지
  - 신청 가능한 목록을 표시
  - 항목에 들어가면 이미지와 정보 출력
 - 전체 관리자 페이지
  - 카테고리/목록 관리
  - Course 관리자 임명, 퇴출
 - 부분 관리자 페이지
  - 신청 목록 만들기
    - 마감 조건 설정: 기간 설정, 수량
    - 이미지와 정보 입력, 생성
    - CRUD

## Development FrameWork
- Backend: ruby on rails
- Frontend: React.js || Angular2 || HTML ***....***
- Database : Sqlite3, Postgre  
### Using Pakage
- sunspot || will_paginate || kaminari
-
## Database ERD  
* 1단계 분류 : 전체 캠퍼스(매장) 테이블  
  - Schema : 캠퍼스(지역)구분 | 캠퍼스명  
  - ex) 용인 | 죽전캠퍼스  
  - ex) 서울 | 압구정점  

* 2단계 분류 : 단과대(재고분류)별 테이블  
  - Schema : 단과대(매장)명 | 소속과(재고분류)  
  - ex) 외국어대 | 영문과  
  - ex) 반포점 | 의류  

* 3단계 분류 : 과별시간표(재고목록) 테이블  
  - Schema : 각 Col명  
    - 학교 - 과목명 | 이수구분 | 교수명 | 학점 | 요일 | 시간 | 강의실 | 잔여석 ***...***  
    - 매장 - 제품명 | 사이즈 | 색상 | 재고량 | ***...***  

* +전체보기 : 모든과목(제품) 한번에 보기  
  - Schema : 각 Col명  
  - 학교 - 과목명 | 이수구분 | 교수명 | 학점 | 요일 | 시간 | 강의실 | 잔여석 ***...***    
  - 매장 - 제품명 | 사이즈 | 색상 | 재고량 | ***...***  

* 각 Col별 테이블
  * Mypage(학생시간표,장바구니,교수시간표,직원별판매전표,강의실시간표,지점별판매전표)  
  - Schema : 전체보기와 동일  

## Database Schema
### Category
- t.string   :name
- t.string   :route_name
- t.text     :info

info는 html_safe를 걸어서 아무 말이나 넣을 수 있게 하자
### Course
- t.string   :name
- t.string   :route_name
- t.text     :info
- t.integer  :school_id
### Class
- t.string   :name
- t.text     :info
- t.datetime :time_limit_start
- t.datetime :time_limit_end
- t.integer  :personnel_limit
- t.string   :limit_on_ruby
- t.integer  :admin_id
- t.integer  :course_id

time_limit: 수강 시간 제한  
personnel_limit: 수강 인원 제한  
limit_on_ruby: 여기에 루비 문법을 넣으면, 그 루비 문법대로 실행되어 제한을 건다.
### Enroll
- t.integer :user_id
- t.integer :class_id

## Naming rules  
-  이름의 구분자는 _ 로 한다(-와 PascalCase, camelCase 를 사용하지 않는다)
-  이름은 최대한 수강신청에 알맞는 어감으로 해야 한다.(shopping -> enroll, item-> class)
-  다음의 단어를 위주로 배치한다.
    - enroll (등록하다)
    - school (course의 묶음)
    - course (class의 묶음 / 쇼핑몰의 경우 옵션)
    - class  (신청할 대상 / 쇼핑몰의 경우 상품)
    - limit (수강 제한의 의미)
    - authentication (권한 제한의 의미)

## Class & Method structure

### Model Class
* user(누가 등록을 하는지)
* target(무엇을 등록을 하는지)
* user_target(누가 무엇을 등록 했는지)
* shopping_basket(누가 무엇을 등록 할건지)

### Controller&View Class
#### View  
* 전체 class 목록    
  * 꽉찬 class 목록 bold or fontcolor 등 별도 표시  
* User의 개인 class 목록  
* 중간자(지역별지점/단과대별) class 리스트  

#### Controller  
* 전체 목록 Action  
  * 물품/강의의 각 col에 해당하는 변수들 생성  
*   
