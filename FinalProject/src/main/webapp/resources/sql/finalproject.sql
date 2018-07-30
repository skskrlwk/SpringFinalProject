
-------- 나라 테이블 생성 (tbl_world) ------------

create table tbl_world
( category number not null,    -- 나라 카테고리 번호
  name varchar2(30) not null , -- 나라 이름
  flag varchar2(100) not null, -- 국기 이미지이름
  image varchar2(100) not null, -- 나라 대표 이미지
  comments varchar2(1000) not null, -- 코멘트
  constraint PK_tbl_world_category primary key(category)
);

comment on table tbl_world
is '나라 테이블' ;
comment on column tbl_world.category
is '나라 카테고리 번호  100 프랑스, 200. 영국, 300 포루투칼, 400 스페인, 500 이탈리아, 600 독일, 700 불가리아, 800 폴란드, 900 벨기에, 1000 헝가리';
comment on column tbl_world.name
is '나라 이름';
comment on column tbl_world.flag
is '국기 이미지 이름';
comment on column tbl_world.image
is '나라 대표 이미지';
comment on column tbl_world.comments
is '나라 설명 코멘트';

---------------------------------------------------------------------------------

------------------ 음식 테이블 생성 (tbl_food) ----------------

create table tbl_food
( seq_food number not null,    --  시퀀스 번호
  fk_category number not null , -- 나라 카테고리번호(tbl_world PK참조)
  name varchar2(100) not null, -- 음식 이름
  image varchar2(100) not null, -- 음식 이미지
  comments varchar2(1000) not null, -- 음식 설명
  constraint PK_tbl_food_seq primary key(seq_food),
  constraint FK_tbl_food_fk_category foreign key(fk_category)
                              references tbl_world(category)
);

comment on table tbl_food
is '음식테이블';
comment on column tbl_food.fk_category
is '나라 카테고리 번호(tbl_world PK참조)';
comment on column tbl_food.name
is '음식 이름';
comment on column tbl_food.image
is '음식 이미지';
comment on column tbl_food.comments
is '음식 설명';

create sequence seq_tbl_food
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

----------------------------------------------------------

-------------- 음식점 테이블 생성 ------------------

create table tbl_food_detail
( seq_food_detail number not null, -- 시퀀스 번호
  fk_seq_food number not null, -- tbl_food 시퀀스번호(PK 참조)
  name varchar2(100) not null, -- 음식점 이름 
  image varchar2(100) not null, -- 음식점 이미지
  comments varchar2(1000) not null, -- 음식점 설명
  addr varchar2(500) not null, -- 음식점 주소
  worktime varchar2(100) not null, -- 음식점 영업시간
  constraint PK_tbl_food_detail primary key(seq_food_detail),
  constraint FK_tbl_food_detail_seq_food foreign key(fk_seq_food)
                              references tbl_food(seq_food)
);

comment on table tbl_food_detail
is '음식점 테이블';
comment on column tbl_food_detail.seq_food_detail
is '시퀀스 번호';
comment on column tbl_food_detail.fk_seq_food
is 'tbl_food 시퀀스 번호 (PK 참조)';
comment on column tbl_food_detail.name
is '음식점 이름';
comment on column tbl_food_detail.image
is '음식점 이미지';
comment on column tbl_food_detail.comments
is '음식점 설명';
comment on column tbl_food_detail.addr
is '음식점 주소';
comment on column tbl_food_detail.worktime
is '음식점 영업시간';

create sequence seq_tbl_food_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-------------------------------------------------------------------------

------------ 투어 테이블 생성 ----------
create table tbl_tour
(seq_tour          number not null
,fk_category    number not null
,name      varchar2(150) not null
,image      varchar2(100) not null
,price      varchar2(100) not null
,addr      varchar2(200) not null
,constraint PK_tbl_tour primary key(seq_tour)
,constraint  FK_tbl_tour_fk_category foreign key(fk_category) references tbl_world(category)
);

create sequence seq_tbl_tour
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

comment on table tbl_tour is '투어정보를 알려주는 테이블';
comment on column tbl_tour.seq_tour is '투어 일련번호';
comment on column tbl_tour.fk_category is '나라테이블의 카테고리 컬럼 참조';
comment on column tbl_tour.name is '투어 명';
comment on column tbl_tour.image is '투어 이미지';
comment on column tbl_tour.price is '투어 가격';
comment on column tbl_tour.addr is '투어 등록 페이지 주소';

---------------------------------------------------------------

--------------------- 명소 테이블 생성 ------------------------------
create table tbl_tourlist
(seq_tourlist          number not null
,fk_category    number not null
,name      varchar2(100) not null
,image      varchar2(100) not null
,comments      varchar2(500) not null
,constraint PK_tbl_tourlist primary key(seq_tourlist)
,constraint  FK_tbl_tourlist_fk_category foreign key(fk_category) references tbl_world(category)
);

create sequence seq_tbl_tourlist
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

comment on table tbl_tourlist is '명소정보를 알려주는 테이블';
comment on column tbl_tourlist.seq_tourlist is '명소 일련번호';
comment on column tbl_tourlist.fk_category is '나라테이블의 카테고리 컬럼 참조';
comment on column tbl_tourlist.name is '명소 이름';
comment on column tbl_tourlist.image is '명소 이미지';
comment on column tbl_tourlist.comments is '명소 소개';
---------------------------------------------------------------------------------------------------

--------------------- 가이드북 테이블 생성 ------------------------------

create table tbl_book
(seq_book          number not null
,fk_category    number not null
,name      varchar2(100) not null
,image      varchar2(100) not null
,price      varchar2(100) not null
,addr      varchar2(200) not null
,constraint PK_tbl_book primary key(seq_book)
,constraint  FK_tbl_book_fk_category foreign key(fk_category) references tbl_world(category)
);

create sequence seq_tbl_book
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

comment on table tbl_tour is '가이드북정보를 알려주는 테이블';
comment on column tbl_tour.seq_tour is '가이드북 일련번호';
comment on column tbl_tour.fk_category is '나라테이블의 카테고리 컬럼 참조';
comment on column tbl_tour.name is '가이드북 명';
comment on column tbl_tour.image is '가이드북 이미지';
comment on column tbl_tour.price is '가이드북 가격';
comment on column tbl_tour.addr is '가이드북 구입페이지주소';



------------------------------------------------------------------------

---------------------- 나라 정보 테이블 -------------------------
create table tbl_world_detail
(
  seq_world_detail     number   not null,      -- 일련번호
  fk_category   number   not null,    -- 나라이름
  latitude    number  not null,       --  위도
  longitude   number  not null,       -- 경도
  zindex      number not null         -- 우선순위 (지도)
  
   ,constraint PK_tbl_world_detail_seq primary key(seq_world_detail) -- 기본키
   ,constraint FK_tbl_world_detail_fk_ct foreign key(fk_category)    --tbl_world의 category를 참조하는 외래키
                                              references tbl_world(category)
);


--나라정보 테이블 시퀀스
create sequence seq_tbl_world_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

 -- comment of table tbl_world_detail
 comment on table tbl_world_detail
 is '나라의 정보를 알려주는  테이블';
 comment on column tbl_world_detail.seq_world_detail
 is '나라의 일련번호 (시퀀스로 입력을 받는다.)';
 comment on column tbl_world_detail.fk_category
 is '나라 이름';
 comment on column tbl_world_detail.latitude
 is '나라 위도'; 
 comment on column tbl_world_detail.longitude
 is '나라 경도'; 
comment on column tbl_world_detail.zindex
 is '지도에 표시해주는 우선순위 '; 

-----------------------------------------------------------------------------------

----------- 쇼핑 테이블 생성 ---------------.
create table tbl_shop
( seq_shop      number    not null,  -- 일련번호
 fk_category    number    not null,  -- 나라카테고리
 name           varchar2(100) not null,  -- 나라 이름
 image          varchar2(100) not null, -- 대표이미지
 comments        varchar2(500) not null, -- 설명
 addr           varchar2(200) not null, -- 주소
 worktime       varchar2(100)  -- 영업시간

,constraint PK_tbl_shop_seq_shop primary key(seq_shop)
,constraint FK_tbl_shop_fk_ct foreign key(fk_category)
                        references tbl_world(category)
);


-- 쇼핑 테이블 시퀀스
create sequence seq_tbl_shop
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- comment of table tbl_shop
 comment on table tbl_shop
 is '나라의 오프라인샵(백화점,대형마트 등)을 알려주는  테이블';
 comment on column tbl_shop.seq_shop
 is '샵의 일련번호 (시퀀스로 입력을 받는다.)';
 comment on column tbl_shop.name
 is '나라의 이름';
 comment on column tbl_shop.image
 is '샵의 대표 이미지'; 
 comment on column tbl_shop.comments
 is '나라 안의 오프라인 샵에대한 간략한 설명'; 
comment on column tbl_shop.addr
 is ' 오프라인 샵의 주소  '; 
comment on column tbl_shop.worktime
 is '오프라인 샵의 영업시간  '; 
 
------------------------------------------------------------------

--------- 유저 테이블 생성 ----------------.

-- 회원 테이블
create table tbl_userinfo 
(userid       varchar2(30) not null                     -- 회원아이디
,password     varchar2(30) not null                     -- 비밀번호
,name         varchar2(30) not null                     -- 회원이름
,email        varchar2(50) not null                     -- 이메일
,tel          varchar2(30) not null                     -- 연락처
,gender       number       not null                     -- 성별 (1: 남, 2: 여)
,birthday     varchar2(50) not null                     -- 생년월일
,registerday  date         default sysdate              -- 가입일자
,quitYN       number       default 1                    -- 회원탈퇴유무 (1:가입, 0:탈퇴)
,constraint PK_tbl_userinfo_userid primary key(userid)
);

comment on table tbl_userinfo  
is '회원 테이블';
comment on column tbl_userinfo.userid
is '회원 아이디 ';
comment on column tbl_userinfo.password
is '비밀번호';
comment on column tbl_userinfo.name
is '회원이름';
comment on column tbl_userinfo.email
is '이메일';
comment on column tbl_userinfo.tel
is '연락처';
comment on column tbl_userinfo.gender
is '성별 (1:남, 2:여)';
comment on column tbl_userinfo.birthday
is '생년월일';
comment on column tbl_userinfo.registerday
is '가입일자 (default sysdate)';
comment on column tbl_userinfo.quitYN
is '회원탈퇴유무 (1:가입, 0:탈퇴)';
------------------------------------------------------

-------------------- 일정 테이블 생성 -------------------------------
create table tbl_schedule 
(seq_schedule      NUMBER           not null                         -- 일련번호
,fk_userid         VARCHAR2(30)     not null                         -- 회원ID
,title             VARCHAR2(100)     not null                         -- 제목
,startDay          DATE             not null                         -- 여행시작일
,registerday       DATE             default sysdate                  -- 작성일
,imageArr         varchar2(500)     not null                         -- 이동경로 좌표 배열
,constraint PK_tbl_schedule_seq_schedule primary key(seq_schedule)
,constraint FK_tbl_schedule_fk_userid foreign key(fk_userid) references tbl_userinfo(userid)
);

-- 일정 테이블 시퀀스
create sequence seq_tbl_schedule
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


comment on table tbl_schedule  
is '일정 테이블';
comment on column tbl_schedule.seq_schedule
is '일련번호(시퀀스번호로 증가 (seq_schedule))';
comment on column tbl_schedule.fk_userid
is '회원ID(회원테이블(tbl_userinfo) PK 참조)';
comment on column tbl_schedule.title
is '일정제목';
comment on column tbl_schedule.startDay
is '여행시작일';
comment on column tbl_schedule.registerday
is '작성일(default sysdate)';
comment on column tbl_schedule.imageArr
is '이동경로 좌표 배열 [{lat: 47.509827, lng: 19.033967},{lat: 47.509827, lng: 19.033967}]';
-------------------------------------------------------------------

--------------- 일정 디테일 테이블 생성 -----------------------

create table tbl_schedule_detail
( seq_schedule_detail number not null,   -- 시퀀스 번호
  fk_seq_schedule number not null,       -- tbl_schedule 시퀀스 (PK 참조)
  fk_category number not null,           -- tbl_world 카테고리 (PK 참조)
  days number not null,                  -- 체류일
  constraint PK_tbl_schedule_detail primary key(seq_schedule_detail),
  constraint FK_schedule_detail_schedule foreign key(fk_seq_schedule)
                                          references tbl_schedule(seq_schedule) on delete cascade,
  constraint FK_schedule_detail_category foreign key(fk_category)
                                           references tbl_world(category)
);

comment on table tbl_schedule_detail  
is '일정 디테일 테이블';
comment on column tbl_schedule_detail.seq_schedule_detail
is '일련번호(시퀀스번호로 증가 (seq_schedule_detail))';
comment on column tbl_schedule_detail.fk_seq_schedule
is 'tbl_schedule 테이블 시퀀스 참조';
comment on column tbl_schedule_detail.fk_category
is 'tbl_world 테이블 카테고리 참조';
comment on column tbl_schedule_detail.days
is '체류일 ';


create sequence seq_schedule_detail
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;
-------------------------------------------------------------

------------------------- 일정 디테일디테일 테이블 ---------------------
create table tbl_schedule_detail2
( seq_schedule_detail2 number not null,        -- 시퀀스 번호
  fk_schedule_detail number not null,          -- tbl_schedule_detail 시퀀스 (PK 참조)
  category varchar2(100) not null,                    -- 테이블 카테고리 (음식, 명소등의 정보가 들어감)
  category_seq number not null,                -- 카테고리 시퀀스번호(테이블 카테고리의 시퀀스번호)
  constraint PK_tbl_schedule_detail2 primary key(seq_schedule_detail2),
  constraint FK_schedule_detail2_schedule foreign key(fk_schedule_detail)
                                          references tbl_schedule_detail(seq_schedule_detail) on delete cascade
);

comment on table tbl_schedule_detail2  
is '일정 디테일 디테일 테이블';
comment on column tbl_schedule_detail2.seq_schedule_detail2
is '일련번호(시퀀스번호로 증가 (seq_schedule_detail2))';
comment on column tbl_schedule_detail2.fk_schedule_detail
is 'seq_schedule_detail 테이블 시퀀스 참조';
comment on column tbl_schedule_detail2.category
is '테이블 카테고리 (음식, 명소등의 정보가 들어감)';
comment on column tbl_schedule_detail2.category_seq
is '카테고리 시퀀스번호(테이블 카테고리의 시퀀스번호) ';


create sequence seq_schedule_detail2
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;
-----------------------------------------------------------------------



----------------- 일정표 테이블 생성 -----------------

create table tbl_scheduler 
(seq_scheduler    NUMBER          not null     -- 일련번호
,fk_schedule      NUMBER          not null     -- 일정일련번호
,schedule         VARCHAR2(300)                -- 일정
,transfer         VARCHAR2(300)                -- 교통

,constraint PK_tbl_scheduler_seq_scheduler primary key(seq_scheduler)
,constraint FK_tbl_scheduler_fk_schedule foreign key(fk_schedule) references tbl_schedule(seq_schedule) on delete cascade
);

-- 일정표 테이블 시퀀스
create sequence seq_tbl_scheduler
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

comment on table tbl_scheduler  
is '일정표 테이블';
comment on column tbl_scheduler.seq_scheduler
is '일련번호(시퀀스번호로 증가 (seq_scheduler))';
comment on column tbl_scheduler.fk_schedule
is '일정일련번호(일정테이블(tbl_schedule) PK 참조)';
comment on column tbl_scheduler.schedule
is '일정';
comment on column tbl_scheduler.transfer
is '교통';
-------------------------------------------------------------------

------------------------ 게시판 테이블 생성  ------------------------
create table tbl_board
(
    seq_board     number                  not null
  , fk_userid     varchar2(30)            not null
  , name          varchar2(30)            not null
  , title         varchar2(100)           not null
  , comments      clob                    not null
  , readcount     number default 0       
  , regdate       date   default sysdate  
  , status        number default 1        
  , commentcount  number default 0       
  , groupno       number                  not null
  , fk_seq        number default 0        
  , depthno       number default 0        
  , filename      varchar2(255)           
  , orgfilename   varchar2(255)           
  , filesize      number                  
  
  , constraint  PK_tbl_board_seq_board    primary key(seq_board)
  , constraint  FK_tbl_Board_userid       foreign key(fk_userid)
                                          references tbl_userinfo(userid)
  , constraint  CK_tbl_Board_status       check(status in(0,1))
);

create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

comment on table tbl_board
is '게시판 테이블';

comment on column tbl_board.seq_board
is '게시글 일련번호';
comment on column tbl_board.fk_userid
is '게시글 작성자 아이디';
comment on column tbl_board.name
is '게시글 작성자 이름';
comment on column tbl_board.title
is '게시글 제목';
comment on column tbl_board.comments
is '게시글 내용';
comment on column tbl_board.readcount
is '게시글 조회수';
comment on column tbl_board.regdate
is '게시글 작성일자';
comment on column tbl_board.status
is '게시글 상태 (0 : 삭제됨, 1 : 게시됨)';
comment on column tbl_board.commentcount
is '게시글 댓글수';
comment on column tbl_board.groupno
is '게시글 답변글쓰기에 있어서 그룹번호. 원글(부모글)과 답변글은 동일한 groupno 를 가진다. 답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다.';
comment on column tbl_board.fk_seq
is '자신의 글(답변글)에 있어서 원글(부모글)이 누구인지에 대한 정보값.';
  -- fk_seq 컬럼은 절대로 foreign key가 아니다.
  -- fk_seq 컬럼은 자신의 글(답변글)에 있어서 
  -- 원글(부모글)이 누구인지에 대한 정보값이다.
  -- 답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
  -- 원글(부모글)의 seq 컬럼의 값을 가지게 되며,
  -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.
comment on column tbl_board.depthno
is '들여쓰기단계. 답변글쓰기에 있어서 답변글 이라면 원글(부모글)의 depthno + 1 을 가지게 되며, 답변글이 아닌 원글일 경우 0 을 가지도록 한다.';
comment on column tbl_board.filename
is 'WAS(톰캣)에 저장될 첨부파일명';
comment on column tbl_board.orgfilename
is '진짜 첨부파일명';
comment on column tbl_board.filesize
is '첨부파일크기';

alter table tbl_board  ADD(click_count NUMBER default 0);

comment on column tbl_board.click_count
is '실시간 검색어 count용';

--------------------------------------------------------------------

------------------- 댓글 테이블 생성 --------------------------------

create table tbl_comment
(
    seq_comment   number                      not null
  , fk_seq_board  number                      not null
  , fk_userid     varchar2(30)                not null
  , name          varchar2(30)                not null
  , comments      nvarchar2(200)               not null
  , regdate       date   default sysdate      
  , status        number default 1            
  
  , constraint    PK_tbl_comment_seq_comment  primary key(seq_comment)
  , constraint    FK_tbl_comment_fk_userid    foreign key(fk_userid)
                                              references tbl_userinfo(userid)
  , constraint    FK_tbl_comment_fk_seq_board foreign key(fk_seq_board) 
                                              references tbl_board(seq_board)
  , constraint    CK_tbl_comment_status       check(status in(1,0))
);

create sequence seq_tbl_comment
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

comment on table tbl_comment
is '댓글 테이블';

comment on column tbl_comment.seq_comment
is '댓글 일련번호';
comment on column tbl_comment.fk_seq_board
is '원게시물 글번호';
comment on column tbl_comment.fk_userid
is '댓글 작성자 아이디';
comment on column tbl_comment.name
is '댓글 작성자 이름';
comment on column tbl_comment.comments
is '댓글 내용';
comment on column tbl_comment.regdate
is '댓글 작성일자';
comment on column tbl_comment.status
is '댓글 상태 (0 : 삭제됨, 1 : 작성됨)';

-------------------------------------------------------------------
--- 좋아요 테이블
create table tbl_like
(
  fk_seq_schedule  number not null,
  fk_userid   varchar2(30) not null,
  likecnt    number default 0,
  constraint PK_tbl_like primary key(fk_seq_schedule, fk_userid),
  constraint FK_seq_schedule_ FOREIGN KEY(fk_seq_schedule) REFERENCES TBL_SCHEDULE(seq_schedule) on delete cascade,
  constraint FK_userid FOREIGN KEY(fk_userid) REFERENCES TBL_USERINFO(userid) on delete cascade
);

create or replace view likeRank as
select fk_seq_schedule, ROW_NUMBER() OVER (ORDER BY likecnt DESC) as rank
from (select fk_seq_schedule, count(*) as likecnt
      from tbl_like
      group by fk_seq_schedule);


--------------------------------------------------------------------

insert into tbl_world(category, name, flag, image, comments)
values (101,'파리','france.png','paris.jpg','예술과 낭만의 도시, 꾸준히 사랑받는 유럽여행 NO.1.');

insert into tbl_world(category, name, flag, image, comments)
values (102,'니스','france.png','nice.jpg','고급 휴양지와 누드비치가 있는 해변.');

insert into tbl_world(category, name, flag, image, comments)
values (201,'런던','UK.png','london.jpeg','유럽 최고의 관광도시. 내가 상상하던 그 영국!');

insert into tbl_world(category, name, flag, image, comments)
values (301,'리스본','portugal.png','lisboa.jpg','포르투칼의 수도.벨렘의 탑이 유명하다. 파스텔 빛 거리, 노란 트램');

insert into tbl_world(category, name, flag, image, comments)
values (401,'바르셀로나','spain.png','barcelona.jpg','스페인 북부 까딸루냐 지방의 문화, 경제적 중심지.구엘공원, 사그라다파밀리아 교회 등이 유명하다.');

insert into tbl_world(category, name, flag, image, comments)
values (402,'마드리드','spain.png','madrid.jpg','스페인의 수도. 라스 벤따스 투우장과 다양한 볼거리를 가지고 있다. 유럽에서 저렴한 쇼핑이 가능한 곳이기도 하다.');

insert into tbl_world(category, name, flag, image, comments)
values (403,'그라나다','spain.png','granada.jpg','이슬람문화의 흔적이 뚜렷하게 남아있는곳. 알함브라궁전이 유명하다.');

insert into tbl_world(category, name, flag, image, comments)
values (501,'로마','italia.png','roma.jpg','도시전체가 거대한 역사 박물관이지만 콘도티 거리 등 명품쇼핑거리로도 유명하다.');

insert into tbl_world(category, name, flag, image, comments)
values (502,'베니스','italia.png','venezia.jpg','물의 도시로 베네치아라고 불리며 매해마다 베니스 국제 영화제가 이곳에서 열린다.');

insert into tbl_world(category, name, flag, image, comments)
values (503,'피렌체','italia.png','firenze.jpg','도시 전체가 하나의 아름다운 작품, 피렌체 역사지구 전체가 1982년 유네스코 세계문화유산으로 등록.');

insert into tbl_world(category, name, flag, image, comments)
values (601,'프랑크푸르트','de.png','frankfurt.jpg','유럽의 관문 도시이자 상업 중심지. 현대와 중세가 공존하는 곳.');

insert into tbl_world(category, name, flag, image, comments)
values (602,'뮌헨','de.png','münchen.jpg','독일 제 3의 도시이자 남부독일의 중심지. 문화 유산관광과 자연관광이 모두 발달.');

insert into tbl_world(category, name, flag, image, comments)
values (603,'베를린','de.png','berlin.jpg','독일의 수도. 9-10월에 있는 베를린축제, 베를린 필하모니로도 유명.');

insert into tbl_world(category, name, flag, image, comments)
values (901,'브리쉘','belgium.png','brussels.jpg','벨기에의 수도. 오줌싸게 소년 동상과 시청사 야경, 홍합 요리가 유명하다.');

insert into tbl_world(category, name, flag, image, comments)
values (1001,'부다페스트','hungary.png','budapest.jpg','헝가리의 수도. 동유럽의 파리. 다뉴브의 진주라고 불리움.');

commit;


insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 101, 48.857482, 2.349118, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 102, 43.709409, 7.261653, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 201, 51.507273,  -0.128143, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 301, 38.726102,  -9.138781, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 401, 41.390755, 2.172765, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 402, 40.418043, -3.704247, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 403, 37.176818, -3.598221, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 501, 41.902067, 12.495479, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 502, 45.440890, 12.316005, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 503, 43.769355, 11.255816, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 601, 50.110010, 8.678614, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 602, 48.134959, 11.577883, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 603, 52.519089, 13.404470, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 901, 50.848504, 4.354141, seq_tbl_world_detail.currval);

insert into tbl_world_detail(seq_world_detail, fk_category, latitude, longitude, zindex)
values(seq_tbl_world_detail.nextval, 1001, 47.509827, 19.033967, seq_tbl_world_detail.currval);

commit;


insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 101, '뵈프 부르기뇽' ,'FR_food1.jpg', '프랑스의 가정식인 뵈프 부르기뇽은 와인을 넣어 만든 소고기찜 요리에요. 소고기와 각종 채소에 와인을 넣어 장시간 졸여 만든 음식으로 얼핏 보면 그 부드러운 고기의 질감이 우리나라 갈비찜과도 비슷하답니다. 대부분의 프랑스 레스토랑에서 찾아 볼 수 있는 음식이에요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 101, '그라탕' ,'FR_food2.jpg', '그라탕은 오브에 치즈나 혹은 빵과 함께 구워서 먹는 종류의 음식인데요. 감자 요리가 발달한 프랑스에서는 이 감자를 이용해서 크림과 함께 그라탕 요리를 만들어 먹습니다. 크림이 들어가 부드러운 맛의 소스와 구운 감자의 고소한 맛의 조합인데요. 오븐만 있다면 만들기도 간편하고 모든 연령층이 좋아하는 맛이라 프랑스의 대표 가정 음식이 아닐까 싶어요. 감자를 이용한 그라탱 이외에도 애호박, 가지, 양배추 등 다양한 재료를 이용해서 만들기도 합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 101, '꼬꼬뱅 ' ,'FR_food3.jpg', '레드와인에 절인 닭고기 음식인 꼬꼬뱅은 프랑스의 국민 요리이기도 합니다. 앙리 4세가 프랑스 국력을 성장시킨 후 일요일마다 모든 국민에게 닭고기를 먹을 수 있도록 공표한 데서 시작된 음식이라고도 해요. 일반적으로 프랑스에서는 국물 있는 음식은 서민적인 음식이라는 인식이 있는데요. 꼬꼬뱅은 와인을 써서 만든 음식이라 고급 음식으로 간주된답니다. 프렌치 비스트로에서 쉽게 만나보실 수 있으니 춥거나 흐린 파리의 날씨에 따뜻한 식사로 추천합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 101, '키쉬 ' ,'FR_food4.jpg', '키쉬는 계란, 우유에 채소나 고기 다진 것들을 넣어서 만든 짠맛의 타르트인데요. 한국에서는 늘 달달한 타르트 종류만 먹다 이곳에서 짠맛의 타르트를 먹었을 때의 새로워 했던 기억들이 있네요. 사진에서처럼 샐러드와 키쉬 이렇게 많이 먹는 거 같아요. 프랑스인들에게 전식인 ''엉트레''로 많이 먹는 음식인데. 저에게는 점심 식사 한 끼로도 충분히 포만감을 느낄 수 있는 음식 같아요. 요리하기가 싫을 땐 가까운 빵집 Boulangerie에서 자주 먹는 음식이랍니다. 버섯, 파, 라흐동 등등 다양한 종류의 키쉬가 있는데요. 파로 만든 Quiche au poireaux (키쉬 오 뿌아호)를 추천합니다!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 101, '에스카르고' ,'FR_food5.jpg', '다음은 프랑스 하면 생각나는 메뉴! 바로 달팽이 요리 ''에스카르고''입니다. 프랑스는 다양한 식재료를 먹는 나라들 중 하나인데요. 이 사실을 잘 보여주는 예가 바로 달팽이 요리이지 않을까요? 파슬리를 올려서 만든 버터 향의 소스와 어우러진 달팽이. 달팽이 하면 거부감이 드시는 분들도 있을 텐데 한국의 소라, 골뱅이와 비슷한 맛이에요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 102, '블랑켓 드 보' ,'FR_food6.jpg', '프랑스의 대표적 부활절 요리이기도 한 블랑켓 드 보는 송아지 고기에 진한 화이트소스로 조리한 스튜 요리에요. 송아지 대신 양고기, 닭고기, 생선 등을 넣어 만들기도 하고요. 버섯, 당근, 양파 등이 어우러진 요리로 밥과 함께 서빙되는 것이 일반적이라고 합니다. 지역이나 조리법에 따라 맛이 조금씩 다르다고 해요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 102, '스테이크 타르타르' ,'FR_food7.jpg', '다진 생소고기에 날달걀 노른자와 양파를 곁들인 음식인 스테이크 타르타르는 불에 구워 내는 요리가 아니니 주문하실 때 꼭 유의하셔야 해요. 우리나라의 육회와 비슷한 이 음식은 맥주 또는 프랑스 와인과 함께하면 가장 잘 어울리는 음식입니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 102, '라따뚜이' ,'FR_food8.jpg', '디즈니에서 만든 영화 때문에 잘 알려진 ''라따뚜이''는 토마토소스 베이스에 여러 야채를 조려 먹는 음식입니다.  그 기원은 프랑스 남부에 살고 있는 농부들이 남은 자투리 야채들을 다 이용해서 끓여먹는 스튜에서 시작이 되었다 하는데요. 음식의 기원은 가난에서 시작됐지만 그 맛은 그렇지 않답니다. 다양한 야채에서 나오는 향과 토마토소스가 참 잘 어울리는 음식 같아요. 동시에 먹으면 건강해지는 기분도 들고요. 깔끔하고 건강한 음식을 드시고 싶으시다면 라따뚜이를 추천해 드립니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 102, ' 부이야베스' ,'FR_food9.jpg', '프랑스 음식 중 마르세유 지방 전통 음식으로 유명한 ''부이야베스''입니다. 생선을 비롯한 다양한 해산물과 마늘 양파 감자 등을 넣고 끓인 생선 토마토 스튜에요. 부이야베스의 기원 또한 마르세유에 어부들이 상품가치가 떨어져 시장에서 팔 수 없는 생선을 한데 모아 끓인 데서 유래되었답니다. 맛있는 음식의 레시피는 가난한 사람들의 전통 음식에서 많이 나온 거 같아요. 지금은 유명해져 파리에서도 부이야베스를 찾을 수 있답니다. 저는 마르세유에서 이 음식을 먹은 적이 있는데요. ''가난한 음식''이라 하지만 현재 그 가격은 그리 저렴한 편은 아니랍니다. 우리나라의 생선찌개와 모양은 비슷하지만 그 맛은 달라요. 토마토가 들어간 수프와 허브의 조합이 색달랐던 음식이었어요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 102, '말린 소시지' ,'FR_food10.jpg', '프랑스에서 자주 먹는 전식 중 하나인 말린 소시지입니다. 프랑스의 정육점 대형마트 곳곳에서 다양한 종류의 말린 소시지를 발견할 수 있는데요. 본식을 먹기 전 와인과 함께 먹는 안주 같은 개념의 음식이에요. 맛은 담백한 맛에서부터 매운맛이 첨가된 소시지, 허브 향이 추가된 소시지 등 매우 다양한 종류가 있답니다. 저 개인적으론 매운맛이 첨가된 소시지가 느끼하지 않고 계속 손이 가는 거 같아요.  ''Charcuterie''라고 쓰인 가게에 가면 다양한 종류의 프랑스 소시지를 보실 수 있으니 여행 오실 때 참고해 주세요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 201, '로스트디너', 'GB_food1.jpg', '선데이 로스트라고도 알려져 있으며, 아마도 로스트 디너가 해외에 사는 영국인들이 가장 그리워 하는 메뉴 일 것이다. 오랜시간 천천히 요리한 소고기와 구운 감자, 요크셔 푸딩 그리고 더운 야채가 그레이비 소스에 덮혀져서 나오는 요리로서 주말에 온 가족이 모였을 때 함께 먹는 전통적인 주말 식사이다. 영국전체의 모든 펍들은 자신들만의 구운 음식들을 일요일 저녁에 판매한다. 또한 만약 당신에게 오직 단 한번뿐의 영국 요리 경험이 주어진다면, 단언컨대 이 음식을 먹어 봐야 한다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 201, '론 소시지', 'GB_food2.jpg', '보통 오직 스코틀랜드에서만 접할 수 있으며, 론 소시지는 곱게 간 돼지고기와 소고기에 빵가루를 섞고 소금, 후추, 넛멕과 코리앤더(고수)로 양념을 해서 조화롭게 맛을 낸 음식이다. 론 소시지는 전형적인 아침식사 메뉴이며 딱딱한 빵에 넣어서 샌드위치로 많이 먹는다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 201, '치킨 티카 마살라', 'GB_food3.jpg', '치킨 티카 마살라');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 201, '잉글리쉬 브렉퍼스트', 'GB_food4.jpg', '아마도 세상에서 가장 양이 많은 아침식사 메뉴 일 것이다. 이미 한 접시가 하루 섭취 열량 중 반 이상을 제공 할 것이다. 베이컨, 소시지, 구운 콩, 계란이 항상 포함 되며, 어떤 사람들은 토마토와 해쉬 브라운, 토스트, 버섯, 블랙 푸팅을 보충해서 먹는다. 이 음식이 절대 당신을 날씬하게 유지시켜 주지는 않겠지만, 숙취해소에는 인생 최고의 음식일 것이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 201, '코니쉬 페이스티', 'GB_food5.jpg', '영국 남서쪽 지역인 Cornwall지방에서 유래 되었으며, 영국 곳곳에 West Cornwall Pasty Co. 상점이 생겨나면서 지난 15년 동안 그 인기가 급격하게 상승하였다. 서로 다른 맛의 코니쉬 패이스티의 종류는 매우 다양하지만 전통적인 코니쉬 패이스티는 소고기, 감자, 순무, 양파를 페이스트리로 감싸서 구운 것이다. 다시 말하지만, 세상에서 가장 건강한 음식은 절대 아니다(이 글의 테마를 좀 이해 하시겠나요?). 하지만 아주 맛있고, 특히 쉬지 않고 오랫동안 일하고 있을때 배를 든든하게 채워 줄 수 있는 간식이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 301, '파스테이스 드 나타', 'PT_food1.jpg', '에그타르트가 처음 탄생한 곳이 바로 제로니모스 수도원이다. 수녀원들이 수녀복을 다림질할 때 계란 흰자를 쓰고 남았던 노른자로 만든 것이 에그타르트라고 한다. 1837년에 오픈해서 지금까지 계속 사랑받고 있는 파스테이스 드 벨렘(Pasteis de Belem). 시나몬을 약간 뿌린 향좋은 커피 한잔과 갓 구운 에그타르트를 먹어보기로 했다. 맛있다는 맛집에서도 먹어보고 여러군데의 에그타르트를 먹어봤지만 역시 원조의 에그타르트는 세계 제일이다. 안먹고 오면 정말 후회할 듯.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 301, '비파나', 'PT_food2.jpg', '빵은 포르투갈어[pão]에서 유래되었는데 그만큼 포르투갈에서는 다양한 빵의 종류가 있다. 비파나의 빵은 입자가 거칠어 한개만 먹어도 배가 부르다. 약간의 양념이 벤 돼지고기와 겉은 단단하지만 안은 부드러운 빵. 아주 심플한 조합이지만 꽤 맛있다. 거리에서 자주 볼 수 있으니 맥주 또는 와인과 함께 먹어보길 추천한다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 301, '진자', 'PT_food3.jpg', '작은 플라스틱 잔에 따라주는데 모든 사람들이 가게 앞에 서서 도란도란 얘기를 나누며 마시는 모습이 참 매력적이다. 한잔에 1.5유로. 가게에 따라 약간 다른데 초콜릿 잔에 따라주는 곳도 있다. 달달한 초콜릿 잔에 담긴 풍미가 깊은 진자는 정말 특별하다. 신이나 들뜬 마음에 달달하니 맛있다고 생각없이 마시다간 어느 순간 의식이 혼미해 질 수 있으니 주의해야 한다. 작은 컵에 담겨져 있어 적은 양의 술이라고 얕보다간 큰코 다칠 수 있다. 알콜도수가 20도를 넘는 술이라는 것을 명심할 것!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 301, '포트와인', 'PT_food4.jpg', '17세기 영국인이 자국 수출용으로 와인을 만들기 시작했는데 그곳이 바로 포르투갈의 포르투(북부지방)이다. 와인을 수출하는데 약 1개월이상이 소요됐는데 와인맛이 변질되기 일쑤였다고. 그래서 와인의 변질을 막기위해 브랜디를 섞어 만들기 시작했고 도수는 강하지만 깊은 단맛이 나는게 특징이다');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 301, '바칼라우', 'PT_food5.jpg', '바칼라우는 포르투갈어로 「O fiel amigo」 충실한 친구라고 불릴 정도로 특별한 존재이다. 포르투갈의 바칼라우 소비량은 유럽에서 1위, 세계에서 4위라 할만큼 소비량이 굉장히 많다. 매일 먹을 수 있는 정도로 조리법이 굉장히 다양하고 파티나 중요한 때에도 빠지지 않는 요리가 바로 바칼라우 요리이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 401, '빠에야', 'ES_food1.jpg', '빠에야는 커다란 철판에 해산물이나 고기, 채소, 샤프란 등을 밥과 함께 넣어 만든 요리로, 사실 그 이름은 빠에야를 담아내는 둥근 모양의 얕은 프라이팬을 일컫는 데에서 유래하였다고 한다. 얼핏 해산물 볶음밥 같기도 하지만, 리소또처럼 밥이 찰진 것이 다른 점이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 401, '타파스', 'ES_food2.jpg', '작은 접시에 담겨 나오는 스페인의 전채요리인 타파스는 고급 레스토랑, 허름한 식당, 선술집, 바 등 어느 곳에서나 흔하게 접할 수 있는 스페인 고유음식이다.타파스를 사랑하는 스페인 사람들은 낮에는 식사와 식사 중간에 간식처럼, 저녁에는 술과 함께 곁들여 먹는 안주처럼 먹는데 그 종류가 수십, 수백 가지에 이를 정도. 지역별, 식당별로 개성 있는 타파스를 맛볼 수 있으며, 그 가격 또한 저렴해 매력적인 음식이 아닐 수 없다. 샹그리아 또는 맥주와 함께 즐기며 스페인의 매력에 빠져보자. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 401, '츄러스', 'ES_food3.jpg', '몇 해 전부터 한국에서도 선풍적인 인기를 끌었던 츄러스의 본고장 역시 스페인이다. 츄러스는 막대 모양으로 만든 밀가루 반죽을 기름에 튀겨낸 스페인 전통요리로, 스페인 사람들은 주로 아침 식사나 간식으로 즐겨 먹을 만큼 일반 가정에도 보편화 되어 있다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 401, '샹그리아', 'ES_food4.jpg', '우리나라 소주, 막걸리만큼 스페인의 대중적인 주류로 알려진 샹그리아는 각종 과일을 와인에 넣어 달콤하게 마시는 술이다. 스페인 사람들은 품질이 좋은 포도주는 그대로 마시고, 그렇지 않은 포도주는 오렌지 주스나 탄산수, 과일과 함께 섞어 샹그리아를 만들어 먹는다고 한다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 402, '가스파쵸', 'ES_food5.jpg', '약간은 생소한 이름이지만, 아는 사람들은 다 아는 스페인 안달루시아 지방의 전통음식입니다. 다른 수프와는 달리 차가운 수프이며, 토마토를 기본 재료로 각종 재료를 갈아서 요리합니다. 스페인에서도 가장 더운 지역 중 한 곳인 안달루시아 지방의 대표적인 여름 음식입니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 402, '꼬치니요 아사도', 'ES_food6.jpg', '코치니요 아사도는 직역하여 새끼돼지 구이입니다.스페인 중부도시 세비고아의 명물로 스페인에 가면 꼭 먹어봐야 할 음식으로 꼽히고 있습니다. 돼지의 적나라한 비주얼 떄문에 거부감을 느끼는 분들도 많지만, 막상 한 번 먹어보면 그 맛을 잊을 수 없다고 합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 402, '뿔뽀 아 라 가예가', 'ES_food7.jpg', '뿔뽀 는 ''문어'' 라는 뜻이고 아 라 가예가 는 ''갈리시아의'' 라는 뜻입니다. 스페인 북서쪽 갈라시아 지방의 전통음식으로, 문어 본래의 풍미를 살린 담백한 요리입니다. 부드러우면서 쫄깃쫄깃한 식감이 일품이며, 한 번도 안 먹어 본 사람은 있어도 한 번만 먹어본 사람은 없다 라는 말까지 있을 정도로 별미!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 402, '하몬', 'ES_food8.jpg', '대한항공에서 진행한 ''내가 먹고싶은 유럽'' 3위에 랭크된 음식인 하몬은 돼지 뒷다리를 소금에 절여 건조한 햄으로 스페인 전역에서 만나볼 수 있습니다. 상점 앞에 거무잡잡한 돼지 뒷다리가 전시되어 있다면 그냥 지나치지 마시고 꼭 맛보세요.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 403, '빠에야', 'ES_food1.jpg', '빠에야는 커다란 철판에 해산물이나 고기, 채소, 샤프란 등을 밥과 함께 넣어 만든 요리로, 사실 그 이름은 빠에야를 담아내는 둥근 모양의 얕은 프라이팬을 일컫는 데에서 유래하였다고 한다. 얼핏 해산물 볶음밥 같기도 하지만, 리소또처럼 밥이 찰진 것이 다른 점이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 403, '타파스', 'ES_food2.jpg', '작은 접시에 담겨 나오는 스페인의 전채요리인 타파스는 고급 레스토랑, 허름한 식당, 선술집, 바 등 어느 곳에서나 흔하게 접할 수 있는 스페인 고유음식이다.타파스를 사랑하는 스페인 사람들은 낮에는 식사와 식사 중간에 간식처럼, 저녁에는 술과 함께 곁들여 먹는 안주처럼 먹는데 그 종류가 수십, 수백 가지에 이를 정도. 지역별, 식당별로 개성 있는 타파스를 맛볼 수 있으며, 그 가격 또한 저렴해 매력적인 음식이 아닐 수 없다. 샹그리아 또는 맥주와 함께 즐기며 스페인의 매력에 빠져보자. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 403, '츄러스', 'ES_food3.jpg', '몇 해 전부터 한국에서도 선풍적인 인기를 끌었던 츄러스의 본고장 역시 스페인이다. 츄러스는 막대 모양으로 만든 밀가루 반죽을 기름에 튀겨낸 스페인 전통요리로, 스페인 사람들은 주로 아침 식사나 간식으로 즐겨 먹을 만큼 일반 가정에도 보편화 되어 있다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 403, '샹그리아', 'ES_food4.jpg', '우리나라 소주, 막걸리만큼 스페인의 대중적인 주류로 알려진 샹그리아는 각종 과일을 와인에 넣어 달콤하게 마시는 술이다. 스페인 사람들은 품질이 좋은 포도주는 그대로 마시고, 그렇지 않은 포도주는 오렌지 주스나 탄산수, 과일과 함께 섞어 샹그리아를 만들어 먹는다고 한다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 501, '까르보나라', 'IT_food1.jpg', '대표적인 로마 음식으로 스파게티 면에 계란과 양젖치즈, 베이컨을 함께 넣어 섞은 요리다. 소스가 많은 우리나라의 카르보나라와는 달리 뻑뻑한 것이 특징이다. 스파게티를 먹을 때 숟가락과 포크를 모두 사용하는 건 미국식 문화. 보통 접시에 포크를 대고 돌리거나 그냥 먹는다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 501, '아마트리치아나', 'IT_food2.jpg', '중부의 아마트리체 지역에서 만들어진 토마토 소스를 말하며 파스타 부카티니면과 잘 어울린다. 산간 지방에 있다 보니 올리브 오일을 구할 수 없어 삼겹살같은 돼지기름을 사용한 것 에서 유래되었다. 덕분에 고소한 맛이 특징이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 501, '피자 비앙카', 'IT_food3.jpg', '과거 가난한 서민들이 최소한의 재료로 만들어 먹던 빵을 로마인들이 발전시킨 음식이다. ‘포카치아’라고도 부르는 피자 비앙카는 두꺼운 빵 위에 취향별로 토핑을 올려 먹는다. 정통 로마식은 바삭한 피자 도우에 올리브오일과 소금, 허브만 들어있다. 오래 되면 질긴 편이니 갓 구웠을 때 맛보도록 하자.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 501, '로마식 피자', 'IT_food4.jpg', '피자의 고향 나폴리와 달리 바삭한 도우가 로마 스타일이다. 요즘에는 피자 알탈리오(잘라서 파는피자)도 즐긴다. 무게를 재서 피자값을 받는 방식으로 테이크 아웃으로 판매되는 체인점이 많다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 501, '브루스케타', 'IT_food5.jpg', '바게트 같은 바삭한 빵에 각종 재료를 얹어서 식사 전에 먹는 요리다. 보통 살라미 또는 토마토와 올리브 오일을 뿌려서 먹는다. 좋은 재료를 사용해서인지 심플한 외모에도 불구하고 엄청난 매력을 가지고 있다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 502, '살팀 보카', 'IT_food6.jpg', '살팀보카는 너무 맛있어서 ‘입으로 뛰어들다‘라는 뜻이다. . 저민 송아지나 양고기 덩어리를 햄으로감싸 버터로 구워낸다. 고기와 고기가 합쳐지니 맛이 없을 수 없다. 허브인 세이지를 끼워 상큼한 맛을 더한 것도 특징이다. 로마가 속한 라치오 지역의 플라스카티Frascati 와인이나 토스카나의 키안티Chianti 와인과 함께 즐겨도 좋다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 502, '구안치알레', 'IT_food7.jpg', '돼지의 목과 턱에 있는 살을 소금에 절인 것으로 지방이 많다. 주로 까르보나라에 사용되며 훈제해서 빵 위에 올려 먹기도 한다. 식전빵은 대부분 서비스금액으로 영수증에 포함된다. 빵이 나오지 않는 경우 따로 주문해야 하는지 확인하자.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 502, '아티초크 ', 'IT_food8.jpg', '염분이 있으면 더 잘 자라는 아티초크는 로마가 아닌 근교 라디스폴리가 주산지다. 크고 신선한 아티초크는 사람이 많은 로마에 가장 많이 배송되어 ‘로만 아티초크’라 부른다. 4월 초에는 축제도 열릴 만큼 제철을 맞이하는 데 이때 로마를 방문한다면 꼭 맛보자. 일반적으로 갈색이 될 정도로 바싹구워서 제공되며 샐러드로 먹어도 맛있다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 502, '코다 알라 바치나라', 'IT_food9.jpg', '우리나라의 소꼬리찜이라고 생각하면 된다. 소꼬리와 토마토, 샐러리 등 야채를 넣어 끓여먹는 전통 로마요리다. 체력이 많이 필요한 로마여행에서 몸보신할 수 있는 요리. 푸짐하게 먹기 위해 뇨끼(이탈리아식 수제비)를 함께 넣어서 조리하기도 한다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 503, '까르보나라', 'IT_food1.jpg', '스파게티 면에 계란과 양젖치즈, 베이컨을 함께 넣어 섞은 요리다. 소스가 많은 우리나라의 카르보나라와는 달리 뻑뻑한 것이 특징이다. 스파게티를 먹을 때 숟가락과 포크를 모두 사용하는 건 미국식 문화. 보통 접시에 포크를 대고 돌리거나 그냥 먹는다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 503, '아마트리치아나', 'IT_food2.jpg', '중부의 아마트리체 지역에서 만들어진 토마토 소스를 말하며 파스타 부카티니면과 잘 어울린다. 산간 지방에 있다 보니 올리브 오일을 구할 수 없어 삼겹살같은 돼지기름을 사용한 것 에서 유래되었다. 덕분에 고소한 맛이 특징이다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 503, '피자 비앙카', 'IT_food3.jpg', '과거 가난한 서민들이 최소한의 재료로 만들어 먹던 빵을 로마인들이 발전시킨 음식이다. ‘포카치아’라고도 부르는 피자 비앙카는 두꺼운 빵 위에 취향별로 토핑을 올려 먹는다. 정통 로마식은 바삭한 피자 도우에 올리브오일과 소금, 허브만 들어있다. 오래 되면 질긴 편이니 갓 구웠을 때 맛보도록 하자.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 503, '브루스케타', 'IT_food5.jpg', '바게트 같은 바삭한 빵에 각종 재료를 얹어서 식사 전에 먹는 요리다. 보통 살라미 또는 토마토와 올리브 오일을 뿌려서 먹는다. 좋은 재료를 사용해서인지 심플한 외모에도 불구하고 엄청난 매력을 가지고 있다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 601, '굴라쉬', 'DE_food1.jpg', '굴라쉬는 돼지고기와 각종 야채를 썰어 넣고 매콤하고 새콤한 소스를 곁들인 요리입니다. 여행 중에 빵이나 소시지, 기름진 돼지고기류의 요리가 물렸을 때 매콤하고, 약간 매운 종류의 따스한 굴라쉬는 활력소가 되니 맛보는걸 추천!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 601, '슈니첼', 'DE_food2.jpg', '슈니첼에 이용하는 고기는 전통적으로 송아지 고기를 사용하지만 돼지고기나 닭고기 등을 사용한 경우가 있으며, 독일에서는 돼지고기 슈니첼이 주류를 이루고 있습니다. 외관상 돈가스와 비슷하다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 601, '슈바인스학세', 'DE_food3.jpg', '슈바인학세는 돼지고기다리 부위를 껍질이 붙은 상태로 그대로 구워낸 것을 말합니다. 겉은 단단하고 바삭하며 속은 부드러워서 우리나라의 족발과는 다른 느낌입니다. 독일을 대표하는 음식!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 601, '자우어브라텐', 'DE_food4.jpg', '자우어브라텐은 소고기나 돼지고기를 와인과 식초, 향신료 등에 재우고, 그것을 구운 다음 소스에 끓인 요리로 삶은 감자나 국수, 야채 등과 함께 먹습니다. 수육처럼 부드러운 고기와 야채를 먹으면서 슈바인학세 맥주와 함께하면 더 좋습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 601, '부어서트', 'DE_food5.jpg', '독일 음식중 빵과 소시즈는 종류가 다양합니다. 그중에 소시지는 1500 종류가 넘고, 각 도시마다 특색 있는 소시지가 있어서 독일 여행의 즐거움을 더해줍니다. 삶아먹는 소시지인 ''바이스부어스트'' 크기는작지만 그릴에 구운 맛이 일품인 ''뉘른베르거부어스트'' 등이 유명합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 602, '케제 슈페츨레', 'DE_food6.jpg', '치지와 슈페츨레라는 밀가루로 만든 독일식 파스타를 넣어 만든 반 독일식, 반 오스트리아식 요리. 들어가는 면은 우리나라의 일반적인 국수처럼 얇지 않고, 올챙이국수와 흡사하다. 치즈를 좋아하는 사람이라면 필수!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 602, '마울타쉔', 'DE_food7.jpg', '마울타셴은 밀가루 반죽을 만투피처럼 얇게 펴서 고기와 야채를 넣는다. 만두국처럼 스프나 소스에 곁들어져 먹기도 하고, 굼만두처럼 팬에 한번 지져서 양파와 달걀과 함께 먹기도 합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 602, '카토펠푸퍼', 'DE_food8.jpg', '카토펠푸퍼는 감자를 갈아서 으걘후 밀가루 양파를 넣고, 후추와 소금으로 간을한 음식입니다. 감자전과 비슷하며 사과잼에 찍어먹으면 색다를 맛을 느낄수 있습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 602, '리프헨', 'DE_food9.jpg', '리프헨은 돼지고기 갈비를 삶거나 구어서 자우어크라프트 등과 곁들여 먹는 음식입니다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 603, '굴라쉬', 'DE_food1.jpg', '굴라쉬는 돼지고기와 각종 야채를 썰어 넣고 매콤하고 새콤한 소스를 곁들인 요리입니다. 여행 중에 빵이나 소시지, 기름진 돼지고기류의 요리가 물렸을 때 매콤하고, 약간 매운 종류의 따스한 굴라쉬는 활력소가 되니 맛보는걸 추천!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 603, '슈니첼', 'DE_food2.jpg', '슈니첼에 이용하는 고기는 전통적으로 송아지 고기를 사용하지만 돼지고기나 닭고기 등을 사용한 경우가 있으며, 독일에서는 돼지고기 슈니첼이 주류를 이루고 있습니다. 외관상 돈가스와 비슷하다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 603, '자우어브라텐', 'DE_food4.jpg', '자우어브라텐은 소고기나 돼지고기를 와인과 식초, 향신료 등에 재우고, 그것을 구운 다음 소스에 끓인 요리로 삶은 감자나 국수, 야채 등과 함께 먹습니다. 수육처럼 부드러운 고기와 야채를 먹으면서 슈바인학세 맥주와 함께하면 더 좋습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 603, '부어서트', 'DE_food5.jpg', '독일 음식중 빵과 소시즈는 종류가 다양합니다. 그중에 소시지는 1500 종류가 넘고, 각 도시마다 특색 있는 소시지가 있어서 독일 여행의 즐거움을 더해줍니다. 삶아먹는 소시지인 ''바이스부어스트'' 크기는작지만 그릴에 구운 맛이 일품인 ''뉘른베르거부어스트'' 등이 유명합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 901, '카르보나드 플라망드', 'BE_food1.jpg', '어떤 벨기에 요리에는 맥주가 재료로 사용됩니다. 가장 유명한 것이 ''카르보나드 플라망드'' 인데 벨기에산 맥주로 삶은 소고기 조림 요리입니다. 천천히 시간을 들여 국물을 조려, 맥주 맛이 배어 들어간 소고기는 한층 부드러워져 입안에서 녹아들며 맛있습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 901, '지비에', 'BE_food2.jpg', '지비에 라는 사냥요리는 왈론 지역의 자랑입니다. 유명한 것으로 꿩, 멧돼지, 산토끼, 작은 사슴, 비둘기, 오리, 메추리 요리 등입니다. 지비에 요리를 맛보고 싶다면, 수렵금지가 해제되는 초가을이 좋습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 901, '블리트 어 라 리에주', 'BE_food3.jpg', '블리트 어 라 리에주 는 다진 소고기와 돼지고기, 빵가루, 양파, 계란 등을 섞은 경단을 튀긴 후, 시로 드 리에주, 세이지 잎 등으로 만든 소스와 곁들이는 요리로, 보통 감자튀김, 아채샐러드와 함께 먹습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 901, '마체스', 'BE_food4.jpg', '마체스는 젊은 청어 라는 뜻으로 다진 양파를 곁들여 통쨰로 먹습니다. 생선 가게에는 청어 샌드위치를 파는 곳도 있지만, 더운 계절에는 청어와 양파로 간단히 먹는 방법을 추천합니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 901, '홍합 요리', 'BE_food5.jpg', '벨기에의 국가를 대표하는 음식이 홍합. 맥주 찜, 토마토 소스 조림, 크림 소스 조림, 카레 조림과 요리법은 다양하고, 플랑드르 지역만도 홍합 요리는 30종류 이상입니다. 우리나라의 해물탕이나 홍합탕을 기대하기는 어렵고, 국물이 짜고 느끼해 맥주와 곁들이면 좋습니다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 1001, '굴라쉬', 'DE_food1.jpg', '굴라쉬는 헝가리 음식 중에 가장 유명하고 대중적인 요리입니다. 헝가리에서 9세기부터 먹기 시작한 음식으로, 원래는 시골에서 고기와 여러 채소를 같이 넣고 삶아 먹던 것에서 유래했다고 한다. 지금은 체코 등 주변 유렵 여러 곳에서도 즐겨먹는 쇠고기 수프 중 하나!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 1001, '할라슬리', 'HU_food1.jpg', '할라슬리 라는 음식은 쉽게말해 ''생선 매운탕 혹은 생선조림'' 입니다. 잉어, 메기, 민물 농어 등 여러 종류의 민물 생선을 넣고, 매운 파프리카를 엄청 많이 넣어 만드는 요리입니다. 굴라시와 동급으로 유명한 헝가리의 전통음식으로, 지역마다 가정마다 각자 다른 방식으로 조리해 먹는다.');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 1001, '랑고스', 'HU_food2.jpg', '랑고스는 빵 반죽을 튀겨서 그 위에 마늘소스, 치즈, 샤워 크림을 토핑으로 올려 먹습니다. 간식으로도, 한 끼 식사로도 언제 어디서나 쉽게 사 먹을 수 있는 음식입니다.!');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 1001, '도보스 토르테', 'HU_food3.jpg', '도보스 토르테 는 스펀지 케이크 사이에 초콜릿 버터크림이 들어있고, 카라멜이 덮여 있어 입에서 살살 녹습니다. 주 재료인 ''버터크림''을 만드는 방법은 아직도 알려지지 않았다고 한다. ');

insert into tbl_food(seq_food, fk_category, name, image, comments)
values(seq_tbl_food.nextval, 1001, '뚜로스 추사', 'HU_food4.jpg', '코티지 치즈와 베이컨이 들어간 파스타로 만든 전통 헝가리 요리입니다. 만들기 쉽기 떄문에 헝가리인들은 보통 가정에서 많이 먹는다고 합니다.');

commit;

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,1,'Marche Ou Crêpe','Marche Ou Crêpe.jpg','프랑스 요리 유럽 요리 펍 채식주의 식단 채식 옵션','18 rue des Haies, 75020 Paris, France','오후 1시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,1,'ASPIC','ASPIC.jpg','프랑스 요리 유럽 요리 컨템퍼러리','24 rue de la Tour D Auvergne, 75009 Paris, France','오후 3시 ~ 오전 2시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,1,'Epicure','Epicure.jpg','프랑스 요리 유럽 요리 채식주의 식단 채식 옵션 무글루텐 옵션','112 Rue Du Faubourg Saint-Honore | Le Bristol Paris, 75008 Paris, France','오후 1시 ~ 오후 9시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,1,'Les Apotres de Pigalle','Les Apotres de Pigalle.jpg','남미 요리, 자가 맥주 판매pub, 유럽 요리, 채식주의 식단, 채식 옵션, 무글루텐 옵션','2 rue Germain Pilon, 75018 Paris, France','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,1,'L''Arcane','L Arcane.jpg','프랑스 요리, 유럽 요리, 채식주의 식단, 채식 옵션, 무글루텐 옵션','39 rue Lamarck, 75018 Paris, France','오후 1시 ~ 오전 12시' );

-------------------------------------
insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,2,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );
------------------------------------------------------------

------------------------------------------------------------------------------------
insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,3,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,3,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,3,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,3,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,3,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );
------------------------------------------------------------------------------------


-------------------------------------
insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,4,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );
------------------------------------------------------------

------------------------------------------------------------------------------------
insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,5,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,5,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,5,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,5,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,5,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );
------------------------------------------------------------------------------------

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,7,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,7,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,7,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,7,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,7,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,8,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,9,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,9,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,9,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,9,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,9,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,10,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,11,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,11,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,11,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,11,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,11,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,12,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,13,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,13,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,13,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,13,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,13,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,14,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,15,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,15,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,15,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,15,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,15,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,16,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,17,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,17,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,17,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,17,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,17,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,18,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,19,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,19,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,19,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,19,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,19,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,20,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,21,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,21,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,21,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,21,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,21,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,22,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,23,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,23,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,23,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,23,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,23,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,24,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,25,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,25,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,25,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,25,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,25,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,26,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,27,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,27,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,27,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,27,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,27,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,28,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,29,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,29,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,29,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,29,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,29,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,30,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,31,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,31,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,31,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,31,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,31,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,32,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,33,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,33,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,33,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,33,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,33,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,34,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,34,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,34,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,6,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,34,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,34,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,35,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,35,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,35,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,35,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,35,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,36,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,37,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,37,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,37,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,37,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,37,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,38,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,39,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,39,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,39,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,39,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,39,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,40,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,41,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,41,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,41,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,41,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,41,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,42,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,43,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,43,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,43,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,43,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,43,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,44,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,45,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,45,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,45,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,45,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,45,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,46,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,47,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,47,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,47,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,47,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,47,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,48,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,49,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,49,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,49,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,49,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,49,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,50,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,51,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,51,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,51,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,51,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,51,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,52,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,53,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,53,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,53,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,53,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,53,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,54,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,55,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,55,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,55,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,55,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,55,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,56,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,57,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,57,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,57,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,57,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,57,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,58,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,59,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,59,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,59,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,59,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,59,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,60,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,61,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,61,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,61,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,61,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,61,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,62,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,63,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,63,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,63,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,63,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,63,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,64,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,65,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,65,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,65,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,65,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,65,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,66,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,67,'Osteria alle Testiere','Osteria alle Testiere.jpg','미슐랭 가이드에 몇 년째 오르고 있는 씨푸드 레스토랑 입니다. 가격이 비싼 편이고 공간이 협소하여 사전 예약이 필수이나, 씨푸드와 와인은 최고! 그날들어오는 신선한 해산물 재료를 보고 메뉴가 결정됩니다.','Calle del Mondo Novo, 5801, 30122','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,67,'Osteria Trefanti','Osteria Trefanti.jpg','가격도 좋고, 현지인과 한국인 관광객 모두에게 사랑받는 맛집! 파스타 등 시푸드 모두 괜찮은 식당입니다. 서비스가 좋아서 높은 인기를 얻고있는 레스토랑!','Rio Marin, Santa Croce 888','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,67,'Trattoria Il Vagone','Trattoria Il Vagone.jpg','가격도 저렴하고, 음식이 많이 짜거나 느끼하지 않아 한국인 입맛에 괜찮다는 평이 많습니다. 스테이크류도 괜찮치만 와인과 레몬첼로도 훌륭합니다.','Calle Priuli Ai Cavaleti Cannaregio 106 | Di fronte al ponte degli Scalzi, 30121','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,67,'Da Celeste','Da Celeste.jpg','물위에 지어진듯한 레스토랑뿐만 아니라, 야외에서 만찬을 즐길 수 있게 테이블을 설치해두어 저녁 노을을 보면서 식사를 즐길 수 있습니다. 생선요리가 대표메뉴이며 와인과 커피도 굿!','Sestiere Vianelli 625 | Pellestrina, 30126','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,67,'U Vejvodu','U Vejvodu.jpg','가게 역사가 어마어마한 U Vejvodu의 꼬치는 비주얼이 예술이에요!!, 시간이 보증하는 맛!!','Restaurace U Vejvodů, Jilská 4, 110 00 Praha 1-Staré Město','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Cezembre Restaurant','Cezembre Restaurant.png','트립어드바이저 평점 만점인 파인 다이닝 레스토랑으로 3코스 점심메뉴는 24유로부터 아뮤즈 부쉬와 5가지 메뉴가 나오는 코스는 45유로로 즐길 수 있다.','Cezembre Restaurant, 17 Rue Gregoire de Tours','오전 11시 ~ 오후 10시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Boutary','Boutary.jpg','트립어드바이저 레스토랑 1위인 식당이다. 3코스 점심 메뉴가 29유로 부터이고 3코스 저녁 메뉴는 69유로 부터 합리적인 가격에 코스요리를 맛볼수 있는 곳이다. 특히 캐비어 요리가 인기이다.','Boutary, 25 Rue Mazarine, 75006','오전 10시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Le Clos Y','Le Clos Y.jpg','구글 평점 4.9의 파인 다이닝 레스토랑이다. 3코스 점심메뉴는 31유로, 저녁 메뉴는 65유로로 맛볼 수 있는 곳이다.','Le Clos Y, 27 Avenue du Maine, 75015','오전 11시 ~ 오후 6시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Cafe de la Paix','Cafe de la Paix.jpg','오페라 극장의 설계사인 샤를기니에가 설계한 화려하고 웅장한 카페이다. 섬세한 내부의 인테리어는 무려 문화재로 지정 되었다고 한다.','Cafe de la Paix, 5 Place de l','오후 2시 ~ 오전 12시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Cafe de Flore','Cafe de Flore.jpg','피카소, 까뮈, 사르트르 등 많은 문학예술가들이 모여들었던 역사적인 카페이다. 테라스에 앉아 생제르맹 거리를 바라보며 과거에 있었을 그들의 열띤 토론을 상상해보자.','Cafe de Flore, 172 Boulevard Saint-Germain, 75006','오후 1시 ~ 오후 11시' );

insert into tbl_food_detail(seq_food_detail, fk_seq_food, name, image, comments, addr, worktime)
values(seq_tbl_food_detail.nextval,68,'Les Deux Magots','Les Deux Magots.jpg','프랑스 현대 문학이 탄생한 발상지랍니다. 지금도 예술가들이 즐겨 찾는 이곳에서 엽서도 쓰고 일기도 쓰면서, 빠르게 흘러가는 여행의 시간들을 정리해 보자.','Les Deux Magots, 6 Place Saint-Germain des Pres, 75006 Paris, 프랑스','오전 10시 ~ 오후 6시' );

commit;

alter table tbl_tourlist drop(comments);

alter table tbl_tourlist
add comments clob;

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '에펠탑', 'fr_pa_001.jpg', '에펠 탑(Tour Eiffel)은 1889년 파리 마르스 광장에 지어진 탑이다. 프랑스의 대표 건축물인 이 탑은 격자 구조로 이루어져 파리에서 가장 높은 건축물이며, 매년 수백만 명이 방문할 만큼 세계적인 유료 관람지이다. 이를 디자인한 프랑스 공학자 및 건축가 귀스타브 에펠의 이름에서 명칭을 얻었으며, 1889년 프랑스 혁명 100주년 기념 세계 박람회의 출입 관문으로 건축되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '루브르 박물관', 'fr_pa_002.jpg', '루브르 박물관(Le musée du Louvre)은 프랑스 파리의 중심가인 리볼리 가에 있는 국립 박물관이다. 소장품의 수와 질 면에서 메트로폴리탄 미술관과 대영박물관와 함께 세계적으로 손꼽히는 박물관이다. 지금의 건물은 루브르 궁전을 개조한 것으로, 파리의 세느 강변에 포함하여 세계유산으로 지정되어 있다. 루브르 박물관 앞의 피라미드 조형물은 근대에 건설된 것으로 한때 어울리지 않다는 평이 많았으나 현재는 루브르를 대표하는 조형물이 되었다. 프랑스어로 뮈제 뒤 루브르, 그랑 루브르, 또는 단순히 루브르 라고도 불린다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '노트르담 대성당', 'fr_pa_003.jpg', '파리의 노트르담 대성당(프랑스어: Cathédrale Notre-Dame de Paris 카테드랄 노트르담 드 파리[*])은 프랑스 파리의 시테 섬의 동쪽 반쪽에 있는 프랑스후기고딕 양식의 성당이다. 이 대성당은 지금도 로마 가톨릭교회의 교회 건물로서 파리 대주교좌 성당으로 사용되고 있다. 노트르담 대성당은 흔히 프랑스 고딕 건축의 정수로 이야기된다. 이 대성당은 프랑스의 유명한 건축가인 비올레르뒤크에 의해 파괴된 상태에서 보호되어 복구되었다. “노트르담”은 “우리의 귀부인”이라는 뜻의 프랑스어다(성모 마리아를 의미함).');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '에투알 개선문', 'fr_pa_004.jpg', '에투알 개선문(Arc de triomphe de l''Étoile)은 1806년 나폴레옹에 의해 기공되어 그의 사후 준공된 매우 거대한 개선문이다. 프랑스 역사의 영광의 상징으로 높이는 50m이다. 개선문의 바로 아래에는 무명용사의 무덤이 있는데 사계절 등불이 꺼지는 일이 없고 헌화가 시드는 일이 없다. 샹젤리제 거리의 서쪽, 샤를 드골 광장에 위치해 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '샹젤리제 거리', 'fr_pa_005.jpg', '샹젤리제 거리(avenue des Champs-Élysées, /ɑ̃zelize)는 프랑스 파리 시의 2km 길이의 길이다. 동쪽의 콩코르드 광장 오벨리스크에서 서쪽의 샤를 드골 광장 에투알 개선문까지이다. 피에르 드라노에가 이 거리의 이름을 바탕으로 Aux-Champs-Elysees란 노래를 Mike deigan 이 작곡한후 편곡을. 하였다. 샹젤레제란 이름은 엘리시온 들판(Elysian Field)이라는 뜻을 가지고 있는데, 이 들판은 고대 그리스인들이 행복한 영혼이 죽은 후에 가는 곳이라고 믿던 곳이었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '몽마르트르', 'fr_pa_006.jpg', '몽마르트르(Montmartre)는 프랑스 파리 북부에 있는 지역으로, 종교적 분위기와 시대에 따른 미술사조의 흐름을 느낄 수 있을 정도로 그 문화·예술적인 정체성을 간직하고 있는 곳이다. 또한 오늘날, 주거지역이기도 하면서 역사·문화적 중심지이기도 하여 오래된 파리의 전형적인 골목길을 거닐고 싶어하는 관광객이 꼭 들르는 곳이다. 창작과 예술의 장소로, 이곳에서는 관광객들은 항상 계단 한 켠에서 그림을 그리는 무명화가들을 볼 수 있고, 또한 영화 촬영 현장을 발견할 수 있다. 반면 이러한 예술적 모습을 띠는 지역이 밤에는 환락가로 변한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 101, '프롬나드 데 장글레', 'fr_pa_007.jpg', '프롬나드 데 장글레 (프랑스어: Promenade des Anglais→영국인 산책로) (니사르어: Camin dei Anglés)는 프랑스 니스에 있는 지중해를 따라 조성된 유명 산책로이다. 서쪽으로 공항에서부터 동쪽의 에타쥐니 길 (Quai des États-Unis)까지 뻗어 있으며 거리는 약 7km에 달한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '런던 국립 미술관', 'uk_lo_001.jpg', '런던 트라팔가 광장에 위치한 런던 국립 미술관. 흔히들 내셔널 갤러리라고 부른다. 중세와 르네상스 시기부터 19세기 후반에 아우르는 작품군을 소장하고 있다. 건물 자체도 화려하지는 않지만 고전적인 아름다움을 간직하고 있어서 차분하면서도 정통을 간직한 런던의 이미지를 조성하는데 도움을 주고 있다. 거기에 더해 위치가 트라팔가 광장, 도시의 중심부에 위치하고 있기 때문에 런던이라는 도시에 예술성이라는 품격을 더해주는데 일조하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '대영박물관', 'uk_lo_002.jpg', '대영박물관(大英博物館, The British Museum)은 영국의 런던 블룸즈베리에 위치해 있는 영국 최대의 국립 공공박물관이다. 대영박물관은 과거 영국이 제국주의시대부터 전세계 모든 대륙에서 수집한 방대한 유물들을 소장 및 전시하고 있다. 대영박물관은 인류시작부터 현재까지의 역사, 미술, 문화와 관련된 유물 및 소장품이 대략 8백만여점에 달한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '타워 브리지', 'uk_lo_003.jpg', '타워 브리지(Tower Bridge)는 영국 런던 시내를 흐르는 템즈 강 위에 도개교와 현수교를 결합한 구조로 지은 다리다. 런던 탑 근처에 있기 때문에 이러한 이름이 붙여졌다. 1886년에 착공을 시작하여 1894년에 완성한 이 다리는 오늘날에는 런던의 대표적인 상징물 가운데 하나가 되었다. 완공된 첫 달에만 655번이나 다리가 들어올려졌다. 현재는 1년에 약 500번 정도 다리가 들어올려진다. 처음에는 수력을 이용해 개폐했지만 오늘날에는 전력을 이용하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '웨스트민스터 사원', 'uk_lo_004.jpg', '정식으로는 웨스트민스터 세인트 피터 성당 참사회(Collegiate Church of St. Peter in Westminster), 간략하게 웨스트민스터 사원(Westminster Abbey)은 런던 웨스트민스터에 있는 영국고딕 양식의 거대한 성공회 성당이다. 서쪽으로는 웨스트민스터 궁전(영국 국회의사당)과 인접해 있다. 전통적으로 이곳은 영국 왕의 대관식 등 왕실 행사를 거행하거나 매장터로 이용하는 곳이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '웨스트민스터 대성당', 'uk_lo_005.jpg', '웨스트민스터 대성당(Westminster Cathedral) 또는 웨스트민스터 주교좌 성당은 영국 런던의 웨스트민스터에 있는 로마 가톨릭교회의 대성당이다. 19세기 후반에 건립되어, 1903년 봉헌되었으며, 비잔틴 양식으로 되어 있다. 웨스트민스터 대교구의 대성당이며, 영국 잉글랜드와 웨일스 지역 로마 가톨릭교회의 중심지이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '세인트 폴 대성당', 'uk_lo_006.jpg', '세인트 폴 대성당(St. Paul’s Cathedral)은 시티 오브 런던의 러드게이트 힐에 있는 높이 108m의 성공회 성당으로 런던 주교좌가 자리 잡고 있다. 원래 있었던 세인트폴 대성당은 1666년 런던 대화재 때 불타 버렸으며, 1675년에 다시 짓기 시작하여 35년 만에 완공됐다. 세인트 폴 대성당의 34m나 되는 돔을 ''속삭이는 방''이라고 부르기도 하는데 돔 안에서 작은 속삭임도 34m나 떨어진 반대편에서도 들을 수 있기 때문이다. 돔 형태의 지붕의 꼭대기에는 높이7m에 무게가 8t이나 되는 십자가와 황금 공이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 201, '버킹엄 궁', 'uk_lo_007.jpg', '버킹엄 궁(Buckingham Palace)은 영국 런던에 있는 궁전이다. 1703년 버킹엄 공작 존 셰필드의 저택으로 세워진 것을 1761년에 조지 3세에게 양도되어 지금의 모습으로 증개축을 한 후 사저로 이용되다가 1837년 빅토리아 여왕의 즉위식 때에 궁전으로 격상되어 이후 역대 군주들이 상주하였다. 영국 군주의 공식적인 사무실 및 주거지로 쓰이고 있기 때문에 현재 영국 왕실의 대명사이기도 하다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '제로니무스 수도원', 'po_ri_001.jpg', '제로니무스 수도원(포르투갈어: Mosteiro dos Jerónimos 모스테이루 두스 제로니무스)은 포르투갈 리스본 벨렝에 있는 수도원으로, 인근에 위치한 벨렝탑과 함께 유네스코 세계유산에 등재되어 있다. 부근에 엔히크 왕자 탄생 500주년을 기념해 세워진 발견기념비가 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '상 조르지 성', 'po_ri_002.jpg', '상 조르지 성(포르투갈어: Castelo de São Jorge)은 포르투갈 리스본에 있는 성이다. 성 일대는 성벽에 둘러싸인 사각형의 요새의 모습이다. 왕궁 유적은 주요 문 근처에 있어, 일부 벽과 재건된 카사 오기발의 방이 남아있다. 가장 높은 요새 부분의 북서쪽에는 중세의 성이 있었다. 만약 요새를 공격하면 성이 마지막 강력한 저항의 장소였다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '리베이라 궁전', 'po_ri_003.jpg', '리베이라 궁전(영어: Ribeira Palace,포르투갈어: Paço da Ribeira)은 포르투갈의 군주들이 리스본에서 약 250년 동안 주거지였던 궁전이다. 마누엘 1세 (포르투칼)가 상조르즈 성이 살기에 부적합하다고 판단한 뒤 명령을 내려 만들어졌다. 궁전은 수많은 재건설과 재건축 끝에 원래 마누엘 양식에서 마지막에는 매너리즘과 바로크 양식으로 건설되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '호시우 광장', 'po_ri_004.jpg', '호시우 광장(포르투갈어: Praça do Rossio)은 포르투갈 리스본의 광장이다. 페드루 4세 광장(포르투갈어: Praça de D. Pedro IV)이라는 이름으로도 잘 알려져 있으며, 간단히 호시우라고도 한다. 광장 중심에는 페드루 4세의 동상이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '코메르시우 광장', 'po_ri_005.jpg', '코메르시우 광장(포르투갈어: Praça do Comércio)은 포르투갈 리스본의 광장이다. 타구스 강변에 위치해있으며 과거에 마누엘 1세의 리베이라 궁전이 위치해 있었기 때문에 궁전 광장이라는 별칭으로도 통한다. 1755년 리스본 대지진으로 궁전이 파괴된 이후에 폼발 후작의 도시계획에 의해 광장으로 재건축되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 301, '벨렝 탑', 'po_ri_006.jpg', '벨렝 탑(포르투갈어: Torre de Belém)은 포르투갈 리스본 벨렝에 있는 타워로, 인근에 위치한 제로니무스 수도원과 함께 세계유산으로 등재되었다. 16세기 마누엘 1세에 의해 바스코 다 가마의 세계일주의 위업을 기념해 만든 타구스 강 선박의 출입을 감시하는 목적의 탑이다. 건축 양식은 마누엘 양식이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '사그라다 파밀리아 성당', 'sp_ba_001.jpg', '사그라다 파밀리아 성당(카탈루냐어: Temple Expiatori de la Sagrada Família, 스페인어: Templo Expiatorio de la Sagrada Familia)은 스페인 바르셀로나에 짓고 있는 로마 가톨릭 성당이다. ''사그라다''는 스페인어로 신성한 또는 성스러운이라는 뜻을 가졌으며, 파밀리아는 가족을 뜻하기 때문에 성가족성당이라고도 불린다. 카탈루냐 출신의 건축가 안토니 가우디가 설계하고 직접 건축을 책임졌다. 이 건물에 대한 가우디의 작업은 유네스코 세계 문화 유산의 일부이며, 2010년 11월 교황 베네딕토 16세는 성당에서 준 대성당으로 승격을 선포했다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '카사 바트요', 'sp_ba_002.jpg', '카사 바트요(카탈루냐어: Casa Batlló, 스페인어: Casa Batlló)는 스페인 바르셀로나에 있는 안토니오 가우디가 설계한 건축물 중 하나로, 2005년에 유네스코 세계유산에 등록되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '카사 밀라', 'sp_ba_003.jpg', '카사 밀라는 안토니오 가우디(1852~1926년)의 작품으로 바르셀로나 중심가인 그라시아 거리에 있다. ''라 페드레라''(채석장 이라는 뜻)이며 1906년 설계를 시작해 1912년에 완공된 고급 연립주택이다. 1984년 유네스코 세계 문화 유산으로 지정되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '구엘 공원', 'sp_ba_004.jpg', '구엘 공원(카탈루냐어: Parc Güell, 스페인어: Parque Güell)은 스페인 바르셀로나에 있는 공원이다. 1984년 유네스코 세계유산에 등록되었다. 안토니 가우디의 작품 중 하나이다. 카르멜 언덕 위에 있으며, 공용 공원과 초등학교가 위치해 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '카탈루냐 미술관', 'sp_ba_005.jpg', '카탈루냐 미술관(카탈루냐어: Museu Nacional d''Art de Catalunya)은 카탈루냐 지방 바르셀로나에 위치한 미술관이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '시우타데야 공원', 'sp_ba_006.jpg', '시우타데야 공원(카탈루냐어: Parc de la Ciutadella)은 스페인 카탈루냐 지방 바르셀로나 시우타트베야에 있는 공원이다. 공원 내에는 카탈루냐 의회, 바르셀로나 동물원이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '프라도 미술관', 'sp_ba_007.jpg', '프라도 미술관(스페인어: Museo del Prado)은 스페인 마드리드에 있는 세계적인 미술관 중 하나이다. 15세기 이후 스페인 왕실에서 수집한 미술 작품을 전시하고 있다. 그림과 조각을 위한 전용 박물관으로 설립되었으며 5,000개 이상의 그림과 2,000개 이상의 판화, 1,000개 이상의 주화와 메달 그리고 2천 개 이상의 장식물과 예술 작품이 전시되어 있다. 조각상은 700개 이상이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '마드리드 궁전', 'sp_ba_008.jpg', '마드리드 왕궁(스페인어: Palacio Real de Madrid)은 스페인의 왕실 공식 관저이다. 사실 마드리드 외곽의 작은 궁전인 사르수엘라 궁에 머물고 있다. 국가적 상황에만 사용이 되는 것이 원칙이다. 뿐만 아니라 서부 유럽을 통틀어서는 2,800여 개 이상의 방과 135,000 m²의 크기로 단연 최대의 크기를 자랑한다. 궁전은 마드리드 서부 중심가의 서쪽 바일렌 거리에 있으며 만사나레스 강변에 있다. 스페인 지하철의 오페라 역에서 금방 갈 수 있다. 부분적으로만 일반에 공개되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 401, '알람브라 궁전', 'sp_ba_009.jpg', '알람브라(스페인어: Alhambra)는 아랍어로 "붉다"라는 뜻을 지닌 궁전과 성곽의 복합단지다. 1238년부터 1358년 사이에 지어졌다. 스페인 남부의 그라나다 지역에서 머물던 아랍 군주의 저택이었던 곳으로 그라나다 시의 남동쪽 경계에 있다. 현재에는 이슬람 건축 박물관으로 쓰이고 있다. 르네상스식 건물이 카를로스 1세때 추가되었다. 유네스코가 지정한 세계문화유산이다. 한국어로는 알함브라 궁전이라고 쓰는 경우가 많지만 알함브라는 영문 식으로 그냥 읽는 경우이다. 아랍어가 스페인어로 굳어져서 쓰이고 있는 Alhambra라는 이름은 스페인어에서 h가 묵음이므로 ''알람브라''라 읽는 것이 정확하다. 따라서 한국어로 옮겼을 때 공식 명칭은 알함브라 궁전이 아닌 알람브라 궁전이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '콜로세움', 'it_ro_001.jpg', '콜로세움(Colosseum, 이탈리아어: Colosseo 콜로세오)은 고대 로마 시대의 건축물 가운데 하나로 로마 제국 시대에 만들어진 원형 경기장이다. 현재는 로마를 대표하는 유명한 관광지로 탈바꿈하였다. 콜로세움이라는 이름은 근처에 있었던 네로 황제의 동상(巨像:colossus)에서 유래한다. 원래 이름은 플라비우스 원형 경기장으로, 서기 70년 베스파시아누스 황제가 착공해 10년 뒤에 아들인 티투스 황제가 완공했다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '판테온', 'it_ro_002.jpg', '판테온(로마)은 125년경 만들어진 모든 로마 신들에게 봉헌된 신전으로, 현재는 기독교 교회가 쓰고 있다. 판테온(그리스어: Πάνθειον)은 그리스어의 "모든 신들"이라는 말에서 유래한 말로, 한국어로는 범신전(汎神殿), 만신전(萬神殿)으로도 번역되며, 모든 신을 모시는 신전을 의미한다. 이런 의미에서의 판테온은 주로 고대 그리스, 고대 로마에서 등장했다. 그러나 유일신을 믿는 기독교가 등장하면서 판테온은 본연의 역할을 잃어버렸다. 인본주의적 풍토의 르네상스 시대를 거친 뒤의 16세기에는 종교적 건물뿐만 아니라 위인들을 모신 건축물에도 판테온이라는 이름이 붙여졌다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '보르게세 미술관', 'it_ro_003.jpg', '보르게세 미술관(Galleria Borghese)은 이탈리아 로마에 있는 미술관이다. 이탈리아에서 바티칸 박물관 다음으로 소장품이 많다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '바티칸 미술관', 'it_ro_004.jpg', '바티칸 미술관(이탈리아어: Musei Vaticani)은 로마의 비알레 바티카노 바티칸 시 내부에 있는 세계 최대급 규모의 미술관 가운데 한 곳이다. 로마 가톨릭교회에 의해 세워진 광대한 전시관에는 수세기에 걸친 예술품들이 진열되어 있다. 바티칸 미술관은 16세기에 교황 율리오 2세에 의해 설립되었다. 바티칸 미술관과 통하는 방문 경로에는 시스티나 성당과 라파엘로가 장식한 서명의 방이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '트레비 분수', 'it_ro_005.jpg', '트레비 분수(이탈리아어: Fontana di Trevi)는 로마에 현존하는 가장 큰 규모의 분수이다. 높이는 25.9m, 너비는 19.8m이다. 바로크 양식으로 지어진 것으로는 예술성이 가장 뛰어나다는 평을 받고 있기도 하다. 트레비 분수에 동전을 던지는 것은 오랜 전통으로 남아있다. 이 분수에 동전을 던지면 소원이 이루어진다고 믿거나 언젠가 다시 로마에 오게 된다고 믿는 전통이 있다고 한다. 오른손에 동전 세 개를 들고 왼쪽 어깨 너머로 던지면 행운이 온다는 말도 있다. 1453년 교황 니콜라우스 5세의 명으로 만들어졌으며 이후 1762년 교황 클레멘스 13세가 설계를 공모하여 니콜라 살비에 의해 바로크 양식으로 재단장되었다. 폴리궁전 앞에 분수를 설치한 형태인데, 해신 트리톤상을 중심으로 그 아래로는 말과 함께 두 개의 트리톤 상이 존재하고, 왼쪽은 격동의 바다를 오른쪽은 잔잔한 바다를 상징한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '성 베드로 대성당', 'it_ro_006.jpg', '성 베드로 대성당(라틴어: Basilica Sancti Petri, 이탈리아어: Basilica di San Pietro in Vaticano)은 바티칸 시국 남동쪽에 있는 대성당을 말한다. 바티칸 대성당(Basilica Vaticana)이라고도 부른다. 성지 가운데 하나이자 기독교 세계의 모든 교회 가운데 가장 거대한 교회로 유일무이한 위치를 차지하고 있다. 개신교를 제외한 기독교의 전승(애초에 개신교는 전승을 인정하지 않는다)에 따르면, 서기 67년에 순교한 예수의 열두 제자 가운데 한 사람이자 로마의 초대 주교, 즉 교황 성 베드로의 무덤 위에 대성당을 건립했다고 한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '산 조반니 인 라테라노 대성당', 'it_ro_007.jpg', '산 조반니 인 라테라노 대성당(이탈리아어: Basilica di San Giovanni in Laterano)은 로마 교구의 대성당이자 로마교구 교구장인 교황의 좌(座)가 있는 대성당이다. 대개 라테라노 대성당이라고 간략하게 부르기도 한다. 대성당의 공식 이름은 라테라노의 지극히 거룩하신 구세주와 성 요한 세례자와 성 요한 복음사가 대성당(라틴어: Archibasilica Sanctissimi Salvatoris et Sancti Iohannes Baptista et Evangelista in Laterano, 이탈리아어: Arcibasilica del Santissimo Salvatore e Santi Giovanni Battista ed Evangelista in Laterano)이다. 로마에 있는 그리스도교 성당 가운데 가장 오래된 성당이자 첫째가는 지위를 가졌으며, 가톨릭 신자들 사이에서 전 세계 모든 성당의 어머니로 대접받고 있다. 정면 외관에는 ‘구세주 그리스도(Christo Salvatore)’라는 글씨가 새겨져 있으며, 모든 총대주교좌 성당을 대표해서 지극히 거룩하신 구세주 그리스도에게 봉헌되었다. 교황좌(Cathedra Romana)가 있는 로마 교구 주교좌 성당으로서 로마 가톨릭교회의 다른 어떤 성당보다 우위를 차지하고 있으며, 여기에는 바티칸의 성 베드로 대성당조차 예외는 아니다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '두칼레 궁전', 'it_ro_008.jpg', '두칼레 궁전(이탈리아어: Palazzo Ducale)은 베네치아 도제(국가원수)의 공식적인 주거지로 9세기에 건설되었다. 현재의 건물은 대부분 1309년부터 1424년의 기간에 걸쳐 지어진 것이다. 고딕 양식의 건물로, 조형미는 베네치아에서 가장 뛰어나다. 산마르코 대성당에 면한 쪽에 ''문서의 문(Porta della Carta)''이 있는데 옛날에는 여기에 정부의 포고문이나 법령 등을 붙였다. 문 위에 보이는 날개가 있는 사자는 베네치아의 상징이다. 두칼레 궁전의 ''10인 평의회의 방''에는 베네치아의 주요 역사를 그린 그림, 원수 76인의 초상화 등이 있다. 두칼레 궁전에서는 산 마르코 광장과 베네치아 석호를 동시에 바라보며 즐길 수 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '산마르코 대성당', 'it_ro_009.jpg', '산마르코 대성당(이탈리아어: Basilica di San Marco)은 이탈리아 베네토 주 베네치아의 성당이다. 비잔틴 건축 양식의 대표적인 건축물 가운데 하나로 손꼽히며 산마르코 광장과 두칼레 궁전과 인접해 있다. 1807년부터 이 성당에 베네치아 총대주교의 주교좌가 설정되었다.그리고 베니스의 수호성인인 산 마르코를 위해 한 상인이 산 마르코 유해를 밀수하기까지도 했다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '산마르코 광장', 'it_ro_010.jpg', '산마르코 광장(이탈리아어: Piazza San Marco)은 이탈리아 베네치아에 위치한 광장으로, 베네치아의 가장 유명한 광장이며 베네치아의 정치적, 종교적 중심지 역할을 하던 광장이다. 베네치아에서는 산 마르코 광장을 단순히 ''광장'' (la Piazza)라고 지칭한다. 산마르코 광장과, 피아제타, 그리고 로마 광장을 제외한 다른 모든 공공 공간들은 광장이라고 불리는 대신에, 들판들이라는 뜻을 가진 캄피(Campi - Campo의 복수)라고 불렸다. 작은 광장이라는 뜻을 가진 피아제타(la Piazzetta)는 베네치아 석호 방향 남동쪽으로 산 마르코 광장이 연장된 것이다. 산마르코 광장은 피아제타와 함께 베네치아의 사회적, 종교적, 정치적 중심지를 형성했고, 보통 하나처럼 여겨졌다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '산 조르조 마조레 성당', 'it_ro_011.jpg', '산 조르조 마조레 성당(이탈리아어: Basilica di San Giorgio Maggiore)는 이탈리아 베네치아의 산 마르코 광장의 남쪽 해상에 떠 있는 산 조르조 섬에 위치한 교회이다. 안드레아 팔라디오(Andrea Palladio)가 설계하였고 1566년과 1610년 사이에 건축되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '미켈란젤로 광장', 'it_ro_012.jpg', '미켈란젤로 광장(Piazzale Michelangelo)은 이탈리아 피렌체에 있는 광장이다. 미켈란젤로의 다비드상의 모조품이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '시뇨리아 광장', 'it_ro_013.jpg', '시뇨리아 광장(Piazza della Signoria)은 이탈리아 피렌체에 있는 광장이다. 우피치 미술관과 베키오 궁전 앞에 위치하고 있으며, 광장 곳곳에는 피렌체의 역사적 사건과 관련된 동상들이 서 있다. 이곳에서 처형당한 지롤라모 사보나롤라를 기념하는 동판이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '우피치 미술관', 'it_ro_014.jpg', '우피치 미술관 (이탈리아어: Galleria degli Uffizi)은 이탈리아 토스카나 지방에 위치한 피렌체 역사지구에 있는 시뇨리아 광장에서 가까운 중요한 미술관이다. 이탈리아에서 가장 중요한 박물관 중 하나이자 가장 많이 방문하는 곳 중 한곳이며, 가장 큰 미술관 중 한 곳으로도 알려져있고, 특히 이탈리아 르네상스 시기의 가치를 매길수 없는 작품들의 컬랙션을 소장하고 있다. 지배 가문인 메디치 가문의 몰락 이후, 그들의 미술품 컬랙션은 마지막 메디치 가의 후손인 안나 마리아 루이자 데 메디치가 상의를 한 끝에 피렌체 시에 기부되었다. 우피치 미술관은 최초의 현대적 박물관 중 하나이며, 이곳의 미술관은 16세기 이래로 요청에 따라 방문객들에게 개방되었고, 1765년에는 공식적으로 대중들에게 개방하였고, 1865년에 정식 박물관이 되었다. 오늘날 우피치 미술관은 피렌체에서 가장 인기있는 관광지중 한 곳이다. 우피치 미술관은 2016년에 2백만명의 방문객들을 받으며, 이탈리아에서 가장 많은 방문객을 받은 미술관이 되었다. 성수기(특히 7월)에는 대기 시간이 다섯 시간에 이른다. 입장권은 사전에 앞서 온라인으로도 구매 가능하며, 상당한 대기 시간을 줄여준다. 박물관은 작품을 전시하는 데 사용 하는 방의 수를 두 배 이상으로 늘리기 위해 개조하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '피렌체 대성당(산타 마리아 델 피오레 대성당)', 'it_ro_015.jpg', '피렌체 대성당(이탈리아어: Duomo di Firenze)은 이탈리아의 피렌체에 있는 대성당(두오모)이다. 정식 명칭은 ''꽃의 성모 마리아''라는 뜻의 산타 마리아 델 피오레 대성당(Cattedrale di Santa Maria del Fiore)이다. 필리포 브루넬레스키가 설계한 돔으로 유명하며, 실외는 하얀색으로 윤곽선을 두른 초록색과 분홍색의 대리석 판으로 마감되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 501, '아카데미아 미술관', 'it_ro_016.jpg', '아카데미아 미술관(이탈리아어: Galleria dell''Accademia)은 이탈리아 베네치아에 있는 미술관이다. 1750년 지역 출신의 화가 조반니 바티스타 피아체타에 의해 창설된 미술학교 (아카데미아)가 기원으로, 현재는 14세기부터 18세기까지의 베네치아파 회화를 중심으로 수집하고있다. 특히 베네치아파의 첫번째 세대를 대표하는 조반니 벨리니, 티치아노, 틴토레토, 파올로 베로네세의 대표작이 있다. 베네치아에도 동명의 미술관이 존재한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '슈테델 미술관', 'ge_be_001.jpg', '슈테델 미술관(Städelsches Kunstinstitut)은 독일 프랑크푸르트암마인에 위치한 미술관이다. 독일에서 가장 유명한 컬렉션 중의 하나로서 프랑크푸르트 은행가인 슈테델의 헌금으로 설립하였다. 14세기부터 현대까지 독일, 프랑스, 네덜란드 등의 회화를 광범위하게 수집, 총 2,700점의 회화를 비롯하여 600점의 조각, 드로잉과 판화 약 10만 점 등을 소장, 전시하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '팔먼가튼', 'ge_be_002.jpg', '팔먼가튼은 프랑크푸르트암마인 시내 한가운데 위치한다. 1868년 프랑크푸르트암마인 시민들에 의해 만들어졌다고 한다. 29ha의 넓은 녹지로 조성되어 있는 식물원이다. 종려나무, 난초, 선인장과 같은 아열대성 식물들이 식재된 거대한 온실이 있고 그 외 식물 종류별로 테마 정원이 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '젠켄베르크 자연사박물관', 'ge_be_003.jpg', '젠켄베르크 자연사박물관(Naturmuseum Senckenberg)은 프랑크푸르트암마인에 있는 자연사박물관으로, 독일에서 두 번째로 크다. 이 박물관은 유럽에서 가장 규모가 큰 공룡 화석들을 전시하고 있는데, 다양한 공룡 화석이 있어 아이들에게 특히 인기가 많다. 박물관에는 2000여개에 이르는 세계에서 가장 거대하고 많은 공룡 화석, 박제된 새 등이 전시되어 있다. 2010년에는 517,000만 명의 방문객들이 다녀갔다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '마리엔 광장', 'ge_be_004.jpg', '마리엔 광장(Marienplatz)은 독일 뮌헨에 위치한 광장이다. 1158년부터 뮌헨의 중앙광장 역할을 했다.가운데 금동상이 마리아다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '알테 피나코테크', 'ge_be_005.jpg', '알테 피나코테크(Alte Pinakothek)는 독일 뮌헨에 있는 미술관이다. 건물은 1836년 완성되었다. 그 콜렉션은 특히 고(古) 독일 회화에 관한 한 질·양 함께 세계 최고의 내용을 자랑하고 있다. 뒤러의 1500년 작인 <자화상> <4명의 사도> 알트도르퍼의 <잇소스의 전쟁> 등은 그들 중에서도 특히 유명한 것인데 독일 화가 이외에도 라파엘로, 푸생, 렘브란트, 특히 루벤스 등의 명작을 수장하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '함부르크 성 피터 교회', 'ge_be_006.jpg', '함부르크 성 피터 교회(St. Peter''s Church)는 함부르크에 있는 가장 오래된 교구교회이다. 교회의 명칭은 가톨릭 교회의 첫 교황으로 알려진 성 베드로(St. Peter)의 이름을 땄다. 묀케베르크 거리(Mönckebergstrasse)에 자리 잡고 있으며, 함부르크 구시가의 가장 높은 지대에 있다. 가장 높은 타워의 높이는 132m이며, 정상까지 544개의 계단이 있다. 첫 건물은 11세기 초에 건립된 것으로 추정되며, 1310년경 고딕 양식으로 재건되기 시작하여 1418년 완공되었다. 1342년 첫 번째 타워가 건립되었고, 1516년 두 번째 타워가 건립되었다. 1842년 함부르크 대화재로 건물이 일부 훼손되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '글립토테크', 'ge_be_007.jpg', '글립토테크(Glyptothek)는 뮌헨의 쾨니히스프라츠에 있는 바이에른주(州)가 관할하는 뮌헨국립고대미술관의 조각전시관. 글립토테크란 조각관을 가리키는 그리스어이다. 가장 중요한 소장품은 아이기나섬에 있던 아파이아신전의 박공에 새긴 조각(서쪽 박공은 BC 510∼BC 505년경, 동쪽 박공은 BC 490∼BC 485년경의 것으로 1813년에 입수)이다. 그 밖에 《테네아의 아폴론》(BC 550년) 등 그리스의 오리지널 조각이 소장되어 있다. 이 조각관 건물은 황태자 루트비히의 명으로 1816년 건축가 L.von 클렌체가 착공, 1830년에 개관하였다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '님펜부르크 궁전', 'ge_be_008.jpg', '님펜부르크 궁전[Schloss Nymphenburg]은 독일의 바이에른주의 주도 뮌헨에 위치하고 있는, 옛 바이에른 왕국의 통치자였던 비텔스바흐 가문의 여름 별궁이다. 이름은 님프(Nymph), 즉 그리스 신화에 나오는 "요정"에서 유래하였는데, 궁전 내부의 "요정들을 거느린 여신의 그림"에서 모티브를 얻었다. 바이에른의 선제후[選帝侯] 페르디난트 마리아가 그의 아들 막시밀리안 2세 에마누엘(1662~1726)의 탄생을 기념하여 짓도록 한 건물로 처음에 지어질 때는 궁전이 아닌 이탈리아 식의 저택이었다. 18세기 초에 막시밀리안 2세 에마누엘은 지금 궁전의 중앙에 해당되는 5층 저택 주변에 네 개의 파빌리온(pavilion)을 더 짓고, 여러 개의 아케이드(arcade)로 이들을 중앙의 저택과 연결시켰다. 이 후 점차 궁전으로 개조되었다. 본궁인 레지덴츠 궁전과 함께 비텔스바흐 왕가의 대표적인 궁전이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '베를린 장벽', 'ge_be_009.jpg', '베를린 장벽(-障壁, 독일어: Die Berliner Mauer)은 동독이 건설한 것으로서 서베를린을 동베를린과 그 밖의 동독으로부터 분리하는 장벽이었다. 그래서 서베를린을 공산주의 국가안의 유일한 자본주의 지역이라고 해서 ''육지의 섬''이라고 불렀다. 하지만, 동독의 관리들은 이 장벽을 반 파시스트 보호벽(독일어: Antifaschistischer Schutzwall)이라고 불렀다. 냉전의 상징이자 독일의 분단을 상징하여 왔다. 동독 탈주자가 많아지자 이를 막으려고 1961년 8월 13일에 만들어진 이후 점차 이 장벽은 보강되었으며, 1989년 11월 9일 자유 왕래가 허용된 이후 차례로 장벽이 붕괴되었다. 일부는 기념으로 남겨져 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '브란덴부르크 문', 'ge_be_010.jpg', '브란덴부르크 문(독일어: Brandenburger Tor)은 초기 고전주의적인 양식의 개선문으로 독일의 수도 베를린에 있다. 프로이센 왕국의 제4대 국왕인 프리드리히 빌헬름 2세의 명을 받아 1788년부터 1791년까지 건설되었고, 건축가는 칼 고트하르트 랑한스(de) 이며, 아테네의 아크로폴리스를 참고했다. 그 상단은 요한 고트프리트 샤도(de)가 조각한 마전차(馬戰車) 모습의 청동상인 "콰드리가" 그리고 승리의 여신 "빅토리아"로 장식했다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '페르가몬 박물관', 'ge_be_011.jpg', '페르가몬 박물관(독일어: Pergamonmuseum)은 베를린의 박물관 섬 안에 위치해 있다. 이곳은 알프레트 메셀과 루트비히 호프만에 의해 설계되었으며, 1910년부터 1930년까지 약 20년에 걸쳐 완공되었다. 내부에는 제우스의 대제단 (또는 ''페르가몬 제단'')을 비롯한 밀레토스의 시장문, 이슈타르 문 등 기념비적 건축물들이 유적지 현지에서 출토된 그대로 옮겨져, 실제 크기로 재건되어 전시되어 있다. 이에 따라 전시품의 소유권에 관한 국가간 법적 논쟁에 휘말려 있기도 하다. 고대 그리스·로마 유물 및 중동 지역에서 출토된 유물과 이슬람 유물들도 소장하고 있다. 박물관 추산으로 매년 85만명이 방문하고 있으며, 2006년 현재 독일에서 가장 많은 사람들이 방문하는 박물관이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '이스트 사이드 갤러리', 'ge_be_012.jpg', '이스트 사이드 갤러리(East Side Gallery)는 독일 베를린에 있는 베를린 장벽 일부에 조성된 미술 갤러리이다. 슈프레 강이 보이는 지역에 위치한 1.3km 길이의 장벽에 조성되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '국가의회 의사당', 'ge_be_013.jpg', '국가의회 의사당(國家議會議事堂, 독일어: Reichstagsgebäude 라이히스탁스게보이데)은 독일 베를린에 있는 역사적인 건물이다. 1871년 독일이 하나의 국가로 통일된 이후 독일 국회의사당의 건설이 계획되었다. 첫 계획은 순조롭지 못하여 통일 이듬해인 1872년 현상설계가 열렸으나 건축되지 못하였다. 1882년 다시 열린 현상 설계에서 파울 발롯(Paul Wallot)의 설계안이 채택되었고, 그로부터 12년이 지난 1894년에 독일 국회의사당이 완공되었다. 1918년 11월 9일에는 사회 민주당(Social Democratic Party) 의원 필립 샤이데만(Philipp Scheidemann)이 독일 국회의사당의 한 창문에서 공화제를 선포하면서 독일 국회의사당의 정치적 공간으로서의 의미가 부각되었다. ');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 601, '독일 역사박물관', 'ge_be_014.jpg', '독일 역사박물관(독일어: Deutsches Historisches Museum, DHM)은 독일 베를린에 위치한 역사 박물관이다. 운터덴린덴에 위치한 박물관으로, 초이그하우스에 위치하고 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '그랑 플라스', 'be_br_001.jpg', '그랑 플라스(프랑스어: Grand-Place) 또는 흐로터 마르크트(네덜란드어: Grote Markt)는 벨기에 브뤼셀의 중심부에 위치한 광장이다. 1998년에 유네스코 세계유산에 등록되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '브뤼셀 길드하우스', 'be_br_002.jpg', '브뤼셀 길드하우스는 제빵, 목공, 양복업자 등 각종 동업조합이 휴식·친목을 도모하던 건물들이다. 그랑 광장을 에워싸듯 늘어서 있다. 중앙역 좌측에 있는 건물군은 ''브라방 공의 거관''이라 불리며, 백조상이 있는 건물은 일찍이 푸주한의 길드하우스였는데 지금은 고급 레스토랑인 메종 뒤 시뉴가 들어서 있다. 그 옆의 건물은 맥주 양조업자의 길드 하우스로서 지금은 맥주박물관이 되었다. 각종 길드하우스는 현재 레스토랑·은행·카페 등으로 사용된다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '트레인월드', 'be_br_003.jpg', '트레인월드는 벨기에 의 철도 박물관이자 벨기에 국립 철도 회사의 공식 박물관이다. 그것은 Schaarbeek 기차역의 보존 건물 과 북쪽에 건설된 새로운 창고에 위치하고 있다. 2014 년 개장 할 예정이었지만, 개장은 2015년 9월까지 연기되었다. 박물관은 Philippe 왕이 개관했다. 박물관은 8,000 평방 미터(86,000 평방 피트) 이상이고 22개의 기관차가 전시되어 있다. 유럽 대륙에서 가장 오래된 기관차(1842년 제작)인 ''Pays de Waes''기관차 또한 소장되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '아토미움', 'be_br_004.jpg', '아토미움(Atomium)은 벨기에 브뤼셀에 위치한 기념물로 높이는 102m이다. 1958년 벨기에 브뤼셀 국제 박람회를 기념하여 지어졌으며 건축 기술자 앙드레 바테르케인(André Waterkeyn), 건축가 앙드레 폴라크(André Polak), 장 폴라크(Jean Polak)가 디자인했다. 건축물은 철의 결정 구조를 1,650억배 정도로 확대한 형상을 본떠서 제작했다. 지름이 18m에 달하는 9개의 구가 정육면체를 구성하는 12개의 모서리를 통해 서로 연결되어 있는 형상을 띠고 있으며 정육면체의 꼭짓점에 있는 8개의 구가 스테인리스강 튜브를 통해 정육면체 가운데에 있는 구를 연결하고 있다. 건축물은 계단, 에스컬레이터, 엘리베이터를 통해 접근할 수 있으며 9개의 구 가운데 5개가 일반에 개방되어 있다. 맨 위에 있는 구 안에는 브뤼셀 시내를 한눈에 볼 수 있는 음식점이 설치되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '브뤼셀 시청사', 'be_br_005.jpg', '브뤼셀 시청사(프랑스어: Hôtel de ville de Bruxelles, 네덜란드어: Stadhuis van Brussel)는 벨기에 브뤼셀의 시청사로, 그랑플라스에 위치하고 있다. 고딕 건축 양식으로 건축되었다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 901, '성 미카엘과 성녀 구둘라 대성당', 'be_br_006.jpg', '성 미카엘과 성녀 구둘라 대성당은 벨기에 브뤼셀의 보드웽 언덕에 있는 로마 가톨릭교회 성당이다. 1962년 2월 대성당으로 지위가 격상된 이래, 메르헨에 있는 성 루몰도 대성당과 더불어 메르헨-브뤼셀 대교구의 공동 대성당이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 1001, '어부의 요새', 'hu_bu_001.jpg', '어부의 요새(헝가리어: Halászbástya, 영어: Fisherman''s Bastion)는 헝가리 부다페스트 마차시 성당 옆에 있는 네오 고딕 네오 로마네스크 스타일의 테라스이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 1001, '헝가리 국회의사당', 'hu_bu_002.jpg', '헝가리의 국회의사당(헝가리어: Országház)은 헝가리의 입법부인 헝가리 국민의회의 의사당 건물이다. 수도 부다페스트의 다뉴브 강 유역 코슈트 러요시 광장에 위치한다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 1001, '회쇠크 광장', 'hu_bu_003.jpg', '회쇠크 광장(헝가리어: Hősök tere 회쇠크 테레) 또는 영웅광장(英雄廣場)은 헝가리 부다페스트에 있는 광장이다. 언드라시 거리의 막다른 곳에 위치하고 있으며, 광장에서 세르비아 대사관이 보인다. 광장의 왼쪽에는 부다페스트 미술관이 있고 오른쪽에는 뮈처르노크가 있다. 또한 부다페스트의 다뉴브 강변과 부다 성 지역 및 언드라시의 일부로서 세계 유산에 등록되어 있다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 1001, '마차시 성당', 'hu_bu_004.jpg', '마차시 성당(헝가리어: Mátyás templom)은 헝가리 부다페스트에 있는 성당이다. 정식 이름은 성모 마리아 대성당이지만, 이곳의 남쪽 탑에 마차시 1세(1458~1490) 왕가의 문장과 그의 머리카락이 보관되어 있기 때문에 마차시 성당으로 불리게 되었다. 기독교의 전래에 따라 원래는 1015년에 건축된 것이다. 1255년, 부다 성내에 건축되어, 역대 국왕의 결혼식과 대관식의 장소로서 이용되었다. 현존하는 건물은 14세기 후반에 화려한 후기 고딕 양식으로 건조된 것으로서, 1479년에 마차시 1세에 의해 대개축됨으로써, 높이 80미터의 첨탑이 증축되었고, 19세기 후반에 광범위하게 수복된 것이다. 700년이라는 교회의 역사 중, 이 성당은 부다의 풍요로움 (혹은, 헝가리인에 있어서 의지처)이었고, 따라서 종종 비극의 역사의 상징을 지니게 되었다. 합스부르크 왕가의 최후의 황제 칼 1세를 포함하여, 거의 모든 역대 헝가리 국왕의 대관식이 이곳에서 행해졌을 뿐만 아니라, 마차시 1세의 2번의 결혼식도 이곳 성당에서 행해졌다. 구 부다 지구에서 두 번째로 큰 성당이다.');

insert into tbl_tourlist(seq_tourlist, fk_category, name, image, comments)
values(seq_tbl_tourlist.nextval, 1001, '부다 성', 'hu_bu_005.jpg', '부다 성(헝가리어: Budai Vár, 터키어: Budin Kalesi)은 헝가리 부다페스트에 있는 헝가리 국왕들이 살았던 역사적인 성채이다. 과거에는 왕궁(Királyi-palota) 또는 왕성(Királyi Vár)이라는 이름으로 불렸다. 부다 성은 중세와 바로크, 19세기 양식의 가옥들과 공공건물들로 유명한 옛 성곽 지역(Várnegyed) 옆에 있는 부다 언덕 남쪽 꼭대기에 지어졌다. 아담 클라크 광장과 푸니쿨라(계단식 열차) 옆 세체니 다리와 이어져 있다. 부다 성은 1987년 공표된 부다페스트 세계문화유산의 일부이기도 하다.');

commit;

SET DEFINE OFF;


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, '에트르타+옹플뢰흐+몽생미셸(+야경)', 'france01.jpg', '169,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=55');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, '공인 가이드와 함께하는 오랑주리 미술관 산책 (1.5시간)', 'france02.jpg', '38,500', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=32');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, '루브르 파리 전일 투어', 'france03.jpg', '30,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=195');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, '베르사유 자전거 투어', 'france04.jpg', '112,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=83');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, 'La Carotte Snap_파리 스냅', 'france05.jpg', '120,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=71');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 101, '지베르니 + 고흐마을 투어', 'france06.jpg', '125,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=216');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 201, '해리포터 스튜디오 + 옥스포드 투어', 'england01.jpg', '185,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=66');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 201, '뮤지컬 라이온킹', 'england03.jpg', '78,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=252');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 201, '스톤헨지+바스+캐슬쿰 (캐바스 투어)', 'england04.jpg', '84,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=65');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 201, '세븐시스터즈 + 브라이튼 투어', 'england05.jpg', '59,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=259');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 301, '포르투 한국어 워킹투어', 'portugal01.jpg', '5,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=283');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '가우디 반일 + 저녁 시내', 'spain01.jpg', '34,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=127');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '빠에야,타파스 쿠킹클래스 + 보케리아 시장투어 + 와인', 'spain02.jpg', '76,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=314');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, 'STUDIO HERMANO_바르셀로나 스냅', 'spain03.jpg', '110,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=42');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, 'STUDIO HERMANO_마드리드 스냅', 'spain04.jpg', '110,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=144');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '피카소 로맨틱투어', 'spain05.jpg', '39,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=288');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '바르셀로나 근교 중세도시로의 시간여행!! [지로나+또사데마르] 전용차량투어!', 'spain06.jpg', '65,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=254');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '[세고비아+톨레도] 알찬 차량투어', 'spain07.jpg', '110,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=13');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 401, '마드리드 프라도 미술관', 'spain08.jpg', '39,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=289');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '바티칸시국 반일 투어', 'italy01.jpg', '25,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=164');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '이탈리아 남부투어(폼페이/소렌토/포지타노)', 'italy02.jpg', '50,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=190');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '달콤한 로마 야경파티 ALL INCLUSIVE', 'italy03.jpg', '15,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=273');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '피렌체 야경투어', 'italy04.jpg', '13,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=331');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '베네치아 야경투어', 'italy05.jpg', '3,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=220');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '우피치와 피렌체시내를 다 돌아보는 알찬 투어!', 'italy06.jpg', '25,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=295');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 501, '피사+친퀘테레 소수정예 전용차량 투어!!', 'italy07.jpg', '125,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=63');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 601, '볼수록 빠져드는 도시, 반전 매력 프랑크푸르트 투어', 'german01.jpg', '80,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=260');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 901, '와플의 도시 브뤼셀 투어', 'belgium01.jpg', '80,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=152');


insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 1001, '인생샷,스냅촬영비법전수 야경투어!!', 'hungary01.jpg', '54,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=264');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 1001, '부다페스트의 정취를 느끼는 워킹투어', 'hungary02.jpg', '29,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=364');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 1001, '도나우벤트 1일 근교투어+액티비티', 'hungary03.jpg', '129,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=366');

insert into tbl_tour(seq_tour, fk_category, name, image, price, addr)
values (seq_tbl_tour.nextval, 1001, '센텐드레 반나절 투어', 'hungary04.jpg', '90,000', 'http://www.stubbyplanner.com/guide/detail.asp?needlogin=&serial=250');
commit;

-- tbl_shop --
 
 -- 프랑스 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,101,'Printemps','france01.jpg','아름다운 뷰와 함께 커피나 샴페인을 즐길 수 있는 쁘렝땅 백화점','64 boulevard Haussmann, 75009','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,101,'Samaritaine','france02.jpg','계단을 타고 꼭대기 층의 옥상 테라스를 가면 파리의 퐁네프 다리를 포함한 멋진 경치를 관람할 수 있는 백화점입니다.','19 rue de la Monnaie, 75001','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,101,'Citadium Paris','france03.jpg','신발에서 액세서리까지 스포츠웨어만 판매하는 작은 쇼핑몰. 당신이 업계를 사랑한다면 산책 할 가치가 있습니다.','64 boulevard Haussmann, 75009','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,101,'Village Royal','france04.jpg','매우 고급스러운 디올 골목 로열 가를 산책할 수 있으며 쇼핑몰에서 다양한 상품을 구매할 수 있습니다.','25 rue Royale, 75008','오전 10:00 - 오후 8:30');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,101,'Maria Luisa','france05.jpg','패션을 사랑하는 사람들에게 필수적인 멀티 브랜드 부티크에서 가장 우아한 제품을 선택하십시오.','2 rue Cambon | 1st, 75001',' 오후 7:30 - 오후 11:00');



 -- 영국 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,201,'Westfield London','uk01.jpg','유럽에서 가장 큰 백화점으로 볼거리가 많습니다. 고급스러운 분위기에서 사진을 찍어보세요!','Ariel Way | Shepherds Bush, White City, London W12','오전 10:00 - 오후 10:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,201,'Greenwich Market','uk02.jpg','맛있는 음식과 엔틱 장식품들을 파는 그리니치 마켓','Greenwich Church Street, London SE10 9HZ','오전 10:00 - 오후 5:30');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,201,'Borough Market','uk03.jpg','여러 음식도 팔고 런던 마켓 문화를 알 수있는 버로우 마켓을 추천합니다!','8 Southwark Street, London SE1 1TL','오전 10:00 - 오후 5:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,201,'One New Change','uk04.jpg','옥상 테라스에서는 도로 멋진 전망. 바울의 런던 스카이라인. 여러가지를 즐길 수 있습니다. ','1 New Change, London EC4M 9AF','오전 8:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,201,'Lower Marsh Market','uk05.jpg','세계 여러 문화의 행상들이 있고 특히 길거리 음식을 즐길 수 있습니다.','Lower Marsh, London SE1 7RG','오전 10:00 - 오전 5:00');


-- 포루투갈 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,301,'Centro Colombo','Portugal01.jpg','지하철역에서 가까워 접근이 쉬운 리스본에서 가장 큰 쇼핑몰!','Centro Comercial Colombo Avenida Lusiada, Lisbon 1500-392','오전 9:00 - 오전 12:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,301,'Amoreiras Shopping Center','Portugal02.jpg','조용하게 쇼핑하기 좋은 곳. 저녁 식사 또한 즐기실 수 있습니다.','Centro Comercial das Amoreiras Avenida Engenheiro Duarte Pacheco, Lisbon 1070-103','오전 10:00 - 오후 11:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,301,'Almada Forum','Portugal03.jpg','쇼핑몰의 중심! 우수한 영화관, 다양한 상점들이 자리하고 있습니다.','Rua Sergio Malpique 2, Almada 2810-500','오전 10:00 - 오전 12:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,301,'APOLO70','Portugal04.jpg','약국, 서점, 레스토랑, 카페 등이 들어있는 작은 샷 핀 센터. 규모는 작지만 가장 오래된 쇼핑 센터입니다.','Av. Julio Dinis, 10 - A, Lisbon 1069-216','오전 9:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,301,'Anselmo1910','Portugal05.jpg','포르투갈 보석의 훌륭한 선택, 훌륭한 서비스, 전시 된 제품의 완벽한 프리젠테이션!','Amoreiras Shopping, Andar, bairro, praca, Lisbon 1070-100','오전 9:00 - 오전 12:00');

-- 스페인 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,401,'Mercat de la Barceloneta','spain01.jpg','야외 시장으로 아이스크림, 신선한 주스, 해산물, 향신료 과일의 모든 것!','Placa de Font 1 - 2, 08003','오전 8:00 - 오후 3:00');
 
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,401,'La Maquinista','spain02.jpg','거대한 쇼핑 센터. 다양한 브랜드 매장이 있으며 최고의 갤러리라 불립니다!','Paseo Potosi, 2, 08030','오전 9:00 - 오후 10:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,401,'Maremagnum','spain03.jpg','고급 요트들과 바다를 볼 수 있는 산책용 장소! 바닷가를 산책 후 쇼핑을 즐기세요!','Moll d Espanya, 5, 08039','오전 10:00 - 오후 10:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,401,'El Rastro','spain04.jpg','많은 구경거리, 많은 사람들 골목 사이사이 노점을 즐겨보세요!','Plaza de Cascorro, 28005','오전 9:00 - 오후 3:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,401,'Madrid Xanadu','spain05.jpg','다양한 상점이 모여있는 대형 쇼핑 센터.레스토랑구역과 쇼핑구역과 차별화 되어있어 포함한 다양한 음식과 쇼핑을 즐길 수 있습니다.','Calle Puerto de Navacerrada s/n, 28939','오전 10:00 - 오후 10:00');

-- 이탈리아 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,501,'Euroma 2','italy01.jpg','Euroma2는 수도에서 최고가 되는 것을 목표로 하는 아름다운 쇼핑 센터입니다.','Viale Dell Oceano Pacifico 83','오전 10:00 - 오후 9:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,501,'Galleria Alberto Sordi','italy02.jpg','고풍스럽고 멋진 쇼핑센터!','Piazza Colonna 23','오전 8:30 - 오후 9:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,501,'La Romanina','italy03.jpg','대형 까르푸 슈퍼마켓 외에도 권위있는 브랜드를 포함한 역사적인 쇼핑 센터!','Via Enrico Ferri 8, 00173','오전 10:00 - 오후 7:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,501,'Happio','italy04.jpg','귀여운 작은 쇼핑몰!','Via Appia Nuova, 448, 00179','오전 9:00 - 오후 8:30');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,501,'Ferrari Store','italy05.jpg','페라리를 운전시뮬레이션이 가능한 거대한 쇼핑몰! 좋은 경험을 체험해보세요.','Via Giovanni Berchet 2, 20121','오전 10:00 - 오후 8:00');

-- 독일 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,601,'Viktualienmarkt','Germany01.jpg','독일의 흔한 전통시장. 현지 특산물을 가져가세요!','Viktualienmarkt 3, 80331 Munich','오전 10:00 - 오후 6:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,601,'Riem Arcaden','Germany02.jpg','전형적인 유럽 브랜드의 다양한 물건을 저장하고 있는 대규모의 쇼핑몰입니다.','Kaufingerstr. 1-5, 80331','오전 10:00 - 오후 6:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,601,'Oberpollinger','Germany03.jpg','모든 취향을 위한 많은 상점이 입점 되어있는 훌륭한 백화점!','Neuhauser Str. 18, 80331','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,601,'Ludwig Beck','Germany04.jpg','유럽의 클래식, 레코드 저장하고 있는 고급스러운 백화점입니다.','Marienplatz 11, 80331','오전 9:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,601,'Pasing Arcaden','Germany05.jpg','음식뿐만 아니라 의류, 전자 제품 등 다양한 상점이 입점되어 있습니다.','Josef-Felder-Str. 53, 81241','오전 9:30 - 오후 8:00');

-- 벨기에 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,901,'Mediacite','Belgium01.jpg','많은 패션상점과 커피숍, 반드시 가봐야 하는 쇼핑센터','Boulevard Raymond Poincare 7, Liege 4020','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,901,'Passage du Nord','Belgium02.jpg','아름다운 건축물을 자랑하는 쇼핑몰!','Rue Neuve 40, Brussels 1000','오전 10:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,901,'K in Kortrijk','Belgium03.jpg','현대적이고 세련된 디자인을 자랑하는 쇼핑센터!','Steenpoort 2, Kortrijk 8500','오전 10:00 - 오후 7:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,901,'Stadsfeestzaal','Belgium04.jpg','쇼핑을 하지 않아도 황홀한 가장 아름다운 쇼핑센터!','Meir 78, Antwerp 2000','오전 10:00 - 오후 6:30');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,901,'Wijnegem Shopping Center','Belgium05.jpg','모든 주요 국제 브랜드 옷을 찾을 수 있는 가장 큰 쇼핑센터 입니다.','Turnhoutsebaan 5, Wijnegem 2110','오전 10:00 - 오후 8:00');

-- 헝가리 쇼핑몰
 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,1001,'WestEnd City Center','hungary01.jpg','페스트지역에 위치한 대형 복합 쇼핑센터','WestEnd Ingatlanhasznosito es Uzemeltet? Kft, Budapest 1062','오전 10:00 - 오후 9:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,1001,'MOM Park','hungary02.jpg','방문 할 가치가 있는 편리한 쇼핑센터','Alkotas utca 53., Budapest 1123','오전 10:00 - 오후 9:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,1001,'Corvin Plaza','hungary03.jpg','대부분의 브랜드가 있는 쇼핑몰. 큰 프리마 슈퍼마켓과 아늑한 푸드 코트가 자리잡고 있습니다.','Futo utca 37-45, Budapest 1083','오전 9:00 - 오후 8:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,1001,'Duna Plaza','hungary04.jpg','도시 중심부에 있어 편안하고 특별한 쇼핑몰!','Vaci ut 178, Budapest 1138','오전 10:00 - 오후 9:00');

 insert into tbl_shop(seq_shop,fk_category,name,image,comments,addr,worktime)
 values(seq_tbl_shop.nextval,1001,'Hold Utca Food Market','hungary05.jpg','1층과 2층으로 나뉘어진 작은 재래시장','Hold utca 13., Budapest 1112','오전 6:00 - 오후 6:00');

 commit;



insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 101, '프랑스데이','프랑스데이.jpg','18,500','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788994939568&orderClick=LAA&Kc='); 


insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 101, '프랑스 와인여행','프랑스와인여행.jpg','16,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791187496090&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 101, '저스트고 프랑스','저스트고프랑스.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788952776570&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 101, '프랑스 세계를 간다','프랑스세계를간다.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788925548876&orderClick=LAA&Kc=#N');


insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 201, '론리 플래닛 베스트영국','론리플래닛베스트영국.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788970599144&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 201, '영국 혼자 떠나도 괜찮아','영국혼자떠나도괜찮아.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788961411660&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 201, '빌 브라이슨 발칙한 영국산책','빌브라이슨발칙한영국산책.jpg','13,800','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788950919269&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 201, '저스트 고 영국','저스트고영국.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788952773852&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 201, '김영 교수의 영국 문화기행','김영교수의영국문화기행.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788936804077&orderClick=LAA&Kc=');


insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 301, '이지 스페인 포르투갈','이지스페인포르투갈.jpg','19,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791185831466&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 301, '프렌즈 스페인 포르투갈','프렌즈스페인포르투갈.jpg','16,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788927809364&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 301, '론리플래닛 베스트 포르투갈','론리플래닛베스트포르투갈.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788970599359&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 301, '인조이 스페인 포르투갈','인조이스페인포르투갈.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791161652573&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 301, '포르투갈 홀리데이','포르투갈홀리데이.jpg','16,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791186581544&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 401, '스페인 셀프트래블','스페인셀프트래블.jpg','15,900','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791187795179&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 401, '베스트 오브 스페인 101','베스트오브스페인101.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788994939728&orderClick=LAB&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 401, '스페인 어쩌면 당신도 마주칠 수 있는 순간들 79','스페인어쩌면당신도마주칠수있는순간들79.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788994981659&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 401, '스페인 스타일','스페인스타일.jpg','16,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788960900844&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 401, '스페인은 맛있다','스페인은맛있다.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788959133734&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 501, '이탈리아 여행백서','이탈리아여행백서.jpg','20,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788998417369&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 501, '이탈리아 소도시여행','이탈리아소도시여행.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788952762573&orderClick=LAB&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 501, '이탈리아도시기행','이탈리아도시기행.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788950937416&orderClick=LAB&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 501, '이탈리아 100배 즐기기','이탈리아100배즐기기.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788925561752&orderClick=LAB&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 501, '이탈리아남부기행','이탈리아남부기행.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788950965679&orderClick=LAB&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 601, '유피디의 독일의 발견','유피디의독일의발견.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791186581773&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 601, '독일 여행의 시작','독일여행의시작.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791155500293&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 601, '독일에 맥주 마시러 가자','독일에맥주마시러가자.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791186972335&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 601, '일생에 한번은 독일을 만나라','일생에한번은독일을만나라.jpg','14,800','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788950938994&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 601, '오토캠핑으로 떠난 독일 성곽순례','오토캠핑으로떠난독일성곽순례.jpg','18,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791156100935&orderClick=LAB&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 901, '네덜란드 벨기에 미술관 산책','네덜란드벨기에미술관산책.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788960533363&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 901, '벨기에에 마시러 가자','벨기에에마시러가자.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791195529513&orderClick=LAA&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 901, '달콤함이 번지는 곳 벨기에','달콤함이번지는곳벨기에.jpg','15,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788963010229&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 901, '저스트고 네덜란드 벨기에 룩셈부르크','저스트고네덜란드벨기에룩셈부르크.jpg','16,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788952774996&orderClick=LAG&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 1001, '퍼스트헝가리','퍼스트헝가리.jpg','1,500','http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?selectedLargeCategory=001&barcode=480D160703160&orderClick=LAG&Kc=');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 1001, '헝가리에서 보물찾기','헝그리에서보물찾기.jpg','17,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788926854488&orderClick=LAA&Kc=#N');

insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 1001, '일주일 유럽여행','일주일유럽여행.jpg','14,000','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788998035334&orderClick=LAA&Kc=');


insert into tbl_book(seq_book, fk_category, name, image, price, addr)
values (seq_tbl_book.nextval, 1001, '포켓 IN 유럽','포켓IN유럽.jpg','6,500','http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788995772577&orderClick=LAA&Kc=');

commit;




