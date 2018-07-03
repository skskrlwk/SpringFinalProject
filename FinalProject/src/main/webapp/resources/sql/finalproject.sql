
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
is '나라 카테고리 번호  100 프랑스, 200. 영국, 300 포루투칼, 400 스페인, 500 이탈리아, 600 독일, 700 불가리아, 800 폴란드, 900 그리스, 1000 헝가리';
comment on column tbl_world.name
is '나라 이름';
comment on column tbl_world.flag
is '국기 이미지 이름';
comment on column tbl_world.image
is '나라 대표 이미지';
comment on column tbl_world.comments
is '나라 설명 코멘트';

insert into tbl_world(category, name, flag, image, comments)
values (101,'파리','france.png','','')

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
,name      varchar2(100) not null
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
,title             VARCHAR(100)     not null                         -- 제목
,startDay          DATE             not null                         -- 여행시작일
,registerday       DATE             default sysdate                  -- 작성일

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
-------------------------------------------------------------------

--------------- 일정 디테일 테이블 생성 -----------------------

create table tbl_schedule_detail
( seq_schedule_detail number not null,   -- 시퀀스 번호
  fk_seq_schedule number not null,       -- tbl_schedule 시퀀스 (PK 참조)
  fk_category number not null,           -- tbl_world 카테고리 (PK 참조)
  days number not null,                  -- 체류일
  constraint PK_tbl_schedule_detail primary key(seq_schedule_detail),
  constraint FK_schedule_detail_schedule foreign key(fk_seq_schedule)
                                          references tbl_schedule(seq_schedule),
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
  category number not null,                    -- 테이블 카테고리 (음식, 명소등의 정보가 들어감)
  category_seq number not null,                -- 카테고리 시퀀스번호(테이블 카테고리의 시퀀스번호)
  constraint PK_tbl_schedule_detail2 primary key(seq_schedule_detail2),
  constraint FK_schedule_detail2_schedule foreign key(fk_schedule_detail)
                                          references tbl_schedule_detail(seq_schedule_detail)
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
,constraint FK_tbl_scheduler_fk_schedule foreign key(fk_schedule) references tbl_schedule(seq_schedule)
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

--------------------------------------------------------------------

------------------- 댓글 테이블 생성 --------------------------------

create table tbl_comment
(
    seq_comment   number                      not null
  , fk_seq_board  number                      not null
  , fk_userid     varchar2(30)                not null
  , name          varchar2(30)                not null
  , comments      varchar2(200)               not null
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
