-----------------------------------------------------------
-- Export file for user DENISON@DATAWH                   --
-- Created by espositot on 5/26/2016, 15:31:16 15:31:16  --
-----------------------------------------------------------

set define off
spool denison_ddl.log

prompt
prompt Creating table ABSENCE_CODES
prompt ============================
prompt
create table DENISON.ABSENCE_CODES
(
  abs_code        VARCHAR2(3) not null,
  description     VARCHAR2(15) not null,
  attend_group    NUMBER(5) not null,
  full_accum      VARCHAR2(1) not null,
  half_accum      VARCHAR2(1) not null,
  accum_amount    NUMBER(3,1) not null,
  assigned_to_stu VARCHAR2(1) not null,
  accum_changed   VARCHAR2(1) not null,
  change_date     DATE,
  change_time     VARCHAR2(8),
  change_uid      VARCHAR2(8),
  code_num        NUMBER(5) not null,
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX137_1 on DENISON.ABSENCE_CODES (ABS_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX276_12 on DENISON.ABSENCE_CODES (CODE_NUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ATTEND
prompt =====================
prompt
create table DENISON.ATTEND
(
  empl_no       NUMBER(10),
  pay_code      VARCHAR2(3),
  start_date    DATE,
  stop_date     DATE,
  lv_hrs        NUMBER(8,4),
  remarks       VARCHAR2(21),
  check_date    DATE,
  status_flg    VARCHAR2(1),
  lv_code       VARCHAR2(1),
  pay_run       VARCHAR2(3),
  post_flg      VARCHAR2(1),
  sub_id        NUMBER(10),
  sub_pay_code  VARCHAR2(3),
  sub_pay_class VARCHAR2(4),
  sub_pay_rate  NUMBER(10,5),
  sub_amt_paid  NUMBER(10,2),
  sub_loc       VARCHAR2(4),
  sub_tax_ind   VARCHAR2(1),
  sub_orgn      VARCHAR2(16),
  sub_acct      VARCHAR2(8),
  cal_val       VARCHAR2(1),
  row_id        NUMBER(10),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE
prompt =========================
prompt
create table DENISON.ATTENDANCE
(
  building       NUMBER(10) not null,
  absence_date   DATE not null,
  studentid      NUMBER(10) not null,
  am_teacher_abs VARCHAR2(3),
  pm_teacher_abs VARCHAR2(3),
  am_office_abs  VARCHAR2(3),
  pm_office_abs  VARCHAR2(3),
  am_bottom      NUMBER(5) not null,
  pm_bottom      NUMBER(5) not null,
  arrive_time    VARCHAR2(5),
  dismiss_time   VARCHAR2(5),
  change_date    DATE,
  change_time    VARCHAR2(8),
  change_uid     VARCHAR2(8),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX138_1 on DENISON.ATTENDANCE (BUILDING, ABSENCE_DATE, STUDENTID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX138_2 on DENISON.ATTENDANCE (STUDENTID, ABSENCE_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ATT_BOTTOMLINE
prompt =============================
prompt
create table DENISON.ATT_BOTTOMLINE
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  building          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  attendance_date   DATE not null,
  attendance_period CHAR(5) not null,
  sequence_num      NUMBER(6) not null,
  source            CHAR(1) not null,
  attendance_code   CHAR(5) not null,
  dismiss_time      CHAR(5),
  arrive_time       CHAR(5),
  minutes_absent    NUMBER(6) not null,
  att_comment       VARCHAR2(255),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_ATT_BOTTOMLINE on DENISON.ATT_BOTTOMLINE (STUDENT_ID, ATTENDANCE_DATE, ATTENDANCE_PERIOD, ATTENDANCE_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_ATT_BOTTOMLINE on DENISON.ATT_BOTTOMLINE (SCHOOL_YEAR, BUILDING, SUMMER_SCHOOL, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATT_CFG_PERIODS
prompt ==============================
prompt
create table DENISON.ATT_CFG_PERIODS
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  building          NUMBER(10) not null,
  attendance_period CHAR(5) not null,
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATT_CODE
prompt =======================
prompt
create table DENISON.ATT_CODE
(
  district            NUMBER(10) not null,
  school_year         NUMBER(6) not null,
  summer_school       CHAR(1) not null,
  attendance_code     CHAR(5) not null,
  description         VARCHAR2(255) not null,
  color               CHAR(8),
  use_dismiss_time    CHAR(1) not null,
  use_arrive_time     CHAR(1) not null,
  district_group      CHAR(5),
  state_group         CHAR(5),
  sif_type            CHAR(15),
  sif_status          CHAR(10),
  sif_precedence      NUMBER(6),
  include_perfplus    CHAR(1) not null,
  alt_attendance_code CHAR(5),
  change_date_time    DATE not null,
  change_uid          VARCHAR2(20) not null,
  r10_loaddate        DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATT_STU_DAY_MEMB
prompt ===============================
prompt
create table DENISON.ATT_STU_DAY_MEMB
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  student_id       CHAR(10) not null,
  membership_date  DATE not null,
  membership_value NUMBER(4,3) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  calendar         CHAR(1) not null,
  track            CHAR(3) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_ATT_STU_DAY_MEMB on DENISON.ATT_STU_DAY_MEMB (BUILDING, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATT_STU_DAY_TOTALS
prompt =================================
prompt
create table DENISON.ATT_STU_DAY_TOTALS
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  building          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  attendance_date   DATE not null,
  view_type         CHAR(5) not null,
  criteria          NUMBER(6) not null,
  attendance_code   CHAR(5) not null,
  att_code_value    NUMBER(5,2) not null,
  total_day_time    NUMBER(6) not null,
  student_schd_time NUMBER(6) not null,
  stu_unschd_time   NUMBER(6),
  present_time      NUMBER(6) not null,
  absent_time       NUMBER(6) not null,
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_ATT_STU_DAY_TOT on DENISON.ATT_STU_DAY_TOTALS (STUDENT_ID, ATTENDANCE_DATE, SCHOOL_YEAR, BUILDING, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BEXPLEDGR
prompt ========================
prompt
create table DENISON.BEXPLEDGR
(
  yr           VARCHAR2(2),
  key_orgn     VARCHAR2(16),
  account      VARCHAR2(8),
  budget_orgn  VARCHAR2(16),
  budget_acct  VARCHAR2(8),
  freeze       VARCHAR2(1),
  bud3         NUMBER(12,2),
  act3         NUMBER(12,2),
  bud2         NUMBER(12,2),
  act2         NUMBER(12,2),
  bud1         NUMBER(12,2),
  act1         NUMBER(12,2),
  bud_curr     NUMBER(12,2),
  act_ytd      NUMBER(12,2),
  act_prop     NUMBER(12,2),
  dept_base    NUMBER(12,2),
  dept_new     NUMBER(12,2),
  rec_base     NUMBER(12,2),
  rec_new      NUMBER(12,2),
  app_base     NUMBER(12,2),
  app_new      NUMBER(12,2),
  year2        NUMBER(12,2),
  year3        NUMBER(12,2),
  year4        NUMBER(12,2),
  year5        NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table BUDGET
prompt =====================
prompt
create table DENISON.BUDGET
(
  type_code    VARCHAR2(3),
  district     VARCHAR2(6),
  fund         VARCHAR2(3),
  func         VARCHAR2(2),
  object       VARCHAR2(4),
  orgn         VARCHAR2(3),
  yr           VARCHAR2(1),
  prog         VARCHAR2(2),
  amount       VARCHAR2(11),
  damount      NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table CALDAYS
prompt ======================
prompt
create table DENISON.CALDAYS
(
  building        NUMBER(10) not null,
  calendar        VARCHAR2(5) not null,
  cal_date        DATE not null,
  cycle_flag      VARCHAR2(1) not null,
  cycle_num       VARCHAR2(1) not null,
  memb_day        VARCHAR2(1) not null,
  memb_val        NUMBER(3,1) not null,
  take_atnd       VARCHAR2(1) not null,
  incl_totals     VARCHAR2(1) not null,
  day_type        VARCHAR2(3),
  day_num         NUMBER(5) not null,
  day_in_memb     NUMBER(5) not null,
  mp_num          VARCHAR2(1) not null,
  sem_num         VARCHAR2(1) not null,
  day_of_week     VARCHAR2(1) not null,
  alternate_cycle VARCHAR2(1),
  change_date     DATE,
  change_time     VARCHAR2(8),
  change_uid      VARCHAR2(8),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table CALENDAR
prompt =======================
prompt
create table DENISON.CALENDAR
(
  building           NUMBER(10) not null,
  calendar           VARCHAR2(5) not null,
  description        VARCHAR2(15),
  first_day          DATE,
  last_day           DATE,
  days_meets         VARCHAR2(5) not null,
  days_in_cycle      VARCHAR2(2) not null,
  first_day_cycle    VARCHAR2(1) not null,
  mp1_start_date     DATE,
  mp1_end_date       DATE,
  mp1_sem_code       VARCHAR2(1),
  mp2_start_date     DATE,
  mp2_end_date       DATE,
  mp2_sem_code       VARCHAR2(1),
  mp3_start_date     DATE,
  mp3_end_date       DATE,
  mp3_sem_code       VARCHAR2(1),
  mp4_start_date     DATE,
  mp4_end_date       DATE,
  mp4_sem_code       VARCHAR2(1),
  mp5_start_date     DATE,
  mp5_end_date       DATE,
  mp5_sem_code       VARCHAR2(1),
  mp6_start_date     DATE,
  mp6_end_date       DATE,
  mp6_sem_code       VARCHAR2(1),
  mp7_start_date     DATE,
  mp7_end_date       DATE,
  mp7_sem_code       VARCHAR2(1),
  mp8_start_date     DATE,
  mp8_end_date       DATE,
  mp8_sem_code       VARCHAR2(1),
  mp9_start_date     DATE,
  mp9_end_date       DATE,
  mp9_sem_code       VARCHAR2(1),
  days_in_calendar   NUMBER(5),
  days_in_membership NUMBER(5),
  build_in_progress  VARCHAR2(1),
  dirty_calendar     VARCHAR2(1),
  change_date        DATE,
  change_time        VARCHAR2(8),
  change_uid         VARCHAR2(8),
  r10_loaddate       DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX331_1 on DENISON.CALENDAR (BUILDING, CALENDAR)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table CLS_ATND
prompt =======================
prompt
create table DENISON.CLS_ATND
(
  building     NUMBER(10) not null,
  absence_date DATE not null,
  studentid    NUMBER(10) not null,
  tea_abs01    VARCHAR2(3),
  tea_abs02    VARCHAR2(3),
  tea_abs03    VARCHAR2(3),
  tea_abs04    VARCHAR2(3),
  tea_abs05    VARCHAR2(3),
  tea_abs06    VARCHAR2(3),
  tea_abs07    VARCHAR2(3),
  tea_abs08    VARCHAR2(3),
  tea_abs09    VARCHAR2(3),
  tea_abs10    VARCHAR2(3),
  tea_abs11    VARCHAR2(3),
  tea_abs12    VARCHAR2(3),
  tea_abs13    VARCHAR2(3),
  tea_abs14    VARCHAR2(3),
  tea_abs15    VARCHAR2(3),
  tea_abs16    VARCHAR2(3),
  tea_abs17    VARCHAR2(3),
  tea_abs18    VARCHAR2(3),
  tea_abs19    VARCHAR2(3),
  tea_abs20    VARCHAR2(3),
  tea_abs21    VARCHAR2(3),
  tea_abs22    VARCHAR2(3),
  tea_abs23    VARCHAR2(3),
  tea_abs24    VARCHAR2(3),
  tea_abs25    VARCHAR2(3),
  tea_abs26    VARCHAR2(3),
  tea_abs27    VARCHAR2(3),
  tea_abs28    VARCHAR2(3),
  tea_abs29    VARCHAR2(3),
  tea_abs30    VARCHAR2(3),
  tea_abs31    VARCHAR2(3),
  tea_abs32    VARCHAR2(3),
  off_abs01    VARCHAR2(3),
  off_abs02    VARCHAR2(3),
  off_abs03    VARCHAR2(3),
  off_abs04    VARCHAR2(3),
  off_abs05    VARCHAR2(3),
  off_abs06    VARCHAR2(3),
  off_abs07    VARCHAR2(3),
  off_abs08    VARCHAR2(3),
  off_abs09    VARCHAR2(3),
  off_abs10    VARCHAR2(3),
  off_abs11    VARCHAR2(3),
  off_abs12    VARCHAR2(3),
  off_abs13    VARCHAR2(3),
  off_abs14    VARCHAR2(3),
  off_abs15    VARCHAR2(3),
  off_abs16    VARCHAR2(3),
  off_abs17    VARCHAR2(3),
  off_abs18    VARCHAR2(3),
  off_abs19    VARCHAR2(3),
  off_abs20    VARCHAR2(3),
  off_abs21    VARCHAR2(3),
  off_abs22    VARCHAR2(3),
  off_abs23    VARCHAR2(3),
  off_abs24    VARCHAR2(3),
  off_abs25    VARCHAR2(3),
  off_abs26    VARCHAR2(3),
  off_abs27    VARCHAR2(3),
  off_abs28    VARCHAR2(3),
  off_abs29    VARCHAR2(3),
  off_abs30    VARCHAR2(3),
  off_abs31    VARCHAR2(3),
  off_abs32    VARCHAR2(3),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 14M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_CLASS on DENISON.CLS_ATND (BUILDING, ABSENCE_DATE, STUDENTID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.IX_CLASS1 on DENISON.CLS_ATND (STUDENTID, ABSENCE_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_CLASS2 on DENISON.CLS_ATND (BUILDING, STUDENTID, ABSENCE_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DENISON_STATTAB
prompt ==============================
prompt
create table DENISON.DENISON_STATTAB
(
  statid  VARCHAR2(30),
  type    CHAR(1),
  version NUMBER,
  flags   NUMBER,
  c1      VARCHAR2(30),
  c2      VARCHAR2(30),
  c3      VARCHAR2(30),
  c4      VARCHAR2(30),
  c5      VARCHAR2(30),
  n1      NUMBER,
  n2      NUMBER,
  n3      NUMBER,
  n4      NUMBER,
  n5      NUMBER,
  n6      NUMBER,
  n7      NUMBER,
  n8      NUMBER,
  n9      NUMBER,
  n10     NUMBER,
  n11     NUMBER,
  n12     NUMBER,
  d1      DATE,
  r1      RAW(32),
  r2      RAW(32),
  ch1     VARCHAR2(1000),
  cl1     CLOB
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.DENISON_STATTAB on DENISON.DENISON_STATTAB (STATID, TYPE, C5, C1, C2, C3, C4, VERSION)
  tablespace DW_DEFAULT02
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISCIPLINE
prompt =========================
prompt
create table DENISON.DISCIPLINE
(
  building        NUMBER(10) not null,
  studentid       NUMBER(10) not null,
  incident_date   DATE not null,
  incident_code   VARCHAR2(3) not null,
  incident_number NUMBER(5) not null,
  reported_by     VARCHAR2(20),
  referred_to     VARCHAR2(3),
  action          VARCHAR2(3),
  action_date     DATE,
  duration        VARCHAR2(3),
  contact_flag    VARCHAR2(1) not null,
  contact_date    DATE,
  comment_1       VARCHAR2(60),
  comment_2       VARCHAR2(60),
  comment_3       VARCHAR2(60),
  comment_4       VARCHAR2(60),
  change_date     DATE,
  change_time     VARCHAR2(8),
  change_uid      VARCHAR2(8),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISC1 on DENISON.DISCIPLINE (BUILDING, STUDENTID, INCIDENT_DATE, INCIDENT_CODE, INCIDENT_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_ACTION
prompt ============================
prompt
create table DENISON.DISCTB_ACTION
(
  code         VARCHAR2(3) not null,
  description  VARCHAR2(20) not null,
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.ACTION_KEY on DENISON.DISCTB_ACTION (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_ACTION_CODE
prompt =================================
prompt
create table DENISON.DISCTB_ACTION_CODE
(
  code         VARCHAR2(3) not null,
  description  VARCHAR2(20) not null,
  level_number NUMBER(5),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISCTB_ACT on DENISON.DISCTB_ACTION_CODE (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_CHARGE
prompt ============================
prompt
create table DENISON.DISCTB_CHARGE
(
  code          VARCHAR2(4) not null,
  description   VARCHAR2(20) not null,
  display_order NUMBER(5) not null,
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISCTB_CHG on DENISON.DISCTB_CHARGE (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_DISP_CODE
prompt ===============================
prompt
create table DENISON.DISCTB_DISP_CODE
(
  code         VARCHAR2(3) not null,
  description  VARCHAR2(20) not null,
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISCTB_DISP on DENISON.DISCTB_DISP_CODE (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_DRUG
prompt ==========================
prompt
create table DENISON.DISCTB_DRUG
(
  code          VARCHAR2(4) not null,
  description   VARCHAR2(20) not null,
  display_order NUMBER(5) not null,
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISCTB_DRUG on DENISON.DISCTB_DRUG (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_INCIDENT
prompt ==============================
prompt
create table DENISON.DISCTB_INCIDENT
(
  code         VARCHAR2(3) not null,
  description  VARCHAR2(20) not null,
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.INC_CODE on DENISON.DISCTB_INCIDENT (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_INC_CODE
prompt ==============================
prompt
create table DENISON.DISCTB_INC_CODE
(
  code          VARCHAR2(4) not null,
  description   VARCHAR2(20) not null,
  level_range   VARCHAR2(10),
  display_order NUMBER(5) not null,
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISCTB_INC on DENISON.DISCTB_INC_CODE (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISCTB_LOCATION
prompt ==============================
prompt
create table DENISON.DISCTB_LOCATION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISCTB_OFF_ACTION
prompt ================================
prompt
create table DENISON.DISCTB_OFF_ACTION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  level_number     NUMBER(6),
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  severity_level   NUMBER(6),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISCTB_VIC_ACTION
prompt ================================
prompt
create table DENISON.DISCTB_VIC_ACTION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_ACTION
prompt ==========================
prompt
create table DENISON.DISC_ACTION
(
  school_year   NUMBER(5) not null,
  incident_num  NUMBER(10) not null,
  offender_num  NUMBER(10) not null,
  action_num    NUMBER(10) not null,
  action_code   VARCHAR2(3) not null,
  building      NUMBER(10) not null,
  schd_duration NUMBER(4,1),
  act_duration  NUMBER(4,1),
  reason_code   VARCHAR2(3),
  disp_code     VARCHAR2(3),
  start_date    DATE,
  end_date      DATE,
  total_occ_cnt NUMBER(5) not null,
  fld01         VARCHAR2(47),
  fld02         VARCHAR2(47),
  fld03         VARCHAR2(47),
  fld04         VARCHAR2(47),
  fld05         VARCHAR2(47),
  fld06         VARCHAR2(47),
  fld07         VARCHAR2(47),
  fld08         VARCHAR2(47),
  fld09         VARCHAR2(47),
  fld10         VARCHAR2(47),
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table DISC_DRUG_CODE
prompt =============================
prompt
create table DENISON.DISC_DRUG_CODE
(
  school_year  NUMBER(5) not null,
  incident_num NUMBER(10) not null,
  offender_num NUMBER(10) not null,
  drug_code    VARCHAR2(4),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISC_DRUG on DENISON.DISC_DRUG_CODE (SCHOOL_YEAR, INCIDENT_NUM, OFFENDER_NUM, DRUG_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISC_INCIDENT
prompt ============================
prompt
create table DENISON.DISC_INCIDENT
(
  district            NUMBER(10) not null,
  school_year         NUMBER(6) not null,
  summer_school       CHAR(1) not null,
  building            NUMBER(10) not null,
  incident_id         NUMBER(10) not null,
  incident_code       CHAR(5) not null,
  incident_subcode    CHAR(5),
  incident_date       DATE not null,
  incident_time       CHAR(5),
  incident_time_frame CHAR(5),
  location            CHAR(5),
  is_student          CHAR(1) not null,
  person_id           CHAR(10) not null,
  reported_to         CHAR(5),
  gang_related        CHAR(1) not null,
  police_notified     CHAR(1) not null,
  police_notify_date  DATE,
  police_department   VARCHAR2(255),
  complaint_number    CHAR(10),
  officer_name        VARCHAR2(100),
  badge_number        CHAR(10),
  comments            VARCHAR2(1024),
  incident_guid       CHAR(32) not null,
  incident_locked     CHAR(1) not null,
  change_date_time    DATE not null,
  change_uid          VARCHAR2(20) not null,
  r10_loaddate        DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_INCIDENT_CODE
prompt =================================
prompt
create table DENISON.DISC_INCIDENT_CODE
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  level_min        NUMBER(6),
  level_max        NUMBER(6),
  state_code_equiv CHAR(10),
  severity_order   NUMBER(6),
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_OFFENDER
prompt ============================
prompt
create table DENISON.DISC_OFFENDER
(
  district           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  summer_school      CHAR(1) not null,
  building           NUMBER(10) not null,
  incident_id        NUMBER(10) not null,
  offender           NUMBER(6) not null,
  is_student         CHAR(1) not null,
  person_id          CHAR(10) not null,
  guardian_notified  CHAR(1) not null,
  notify_date        DATE,
  how_notified       CHAR(5),
  referred_to        CHAR(5),
  police_action      CHAR(5),
  charges_filed_by   VARCHAR2(100),
  charges_filed_with VARCHAR2(100),
  resp_admin         VARCHAR2(100),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_OFFENSE_CODE
prompt ================================
prompt
create table DENISON.DISC_OFFENSE_CODE
(
  school_year  NUMBER(5) not null,
  incident_num NUMBER(10) not null,
  offender_num NUMBER(10) not null,
  offense_code VARCHAR2(4) not null,
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISC_OFF on DENISON.DISC_OFFENSE_CODE (SCHOOL_YEAR, INCIDENT_NUM, OFFENDER_NUM, OFFENSE_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table DISC_OFF_ACTION
prompt ==============================
prompt
create table DENISON.DISC_OFF_ACTION
(
  district           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  summer_school      CHAR(1) not null,
  building           NUMBER(10) not null,
  incident_id        NUMBER(10) not null,
  offender           NUMBER(6) not null,
  action_number      NUMBER(6) not null,
  action_code        CHAR(5) not null,
  schd_duration      NUMBER(5,2),
  actual_duration    NUMBER(5,2),
  reason_code        CHAR(5),
  disposition_code   CHAR(5),
  start_date         DATE,
  end_date           DATE,
  total_occurrences  NUMBER(5,2),
  resp_building      NUMBER(10),
  date_determined    DATE,
  action_outcome     CHAR(5),
  yearend_carry_over CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE,
  action_building    NUMBER(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_DISC_OFF_ACTION on DENISON.DISC_OFF_ACTION (ACTION_NUMBER, DISTRICT, INCIDENT_ID, OFFENDER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_VICTIM
prompt ==========================
prompt
create table DENISON.DISC_VICTIM
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  building          NUMBER(10) not null,
  incident_id       NUMBER(10) not null,
  victim            NUMBER(6) not null,
  victim_code       CHAR(5) not null,
  victim_subcode    CHAR(5),
  is_student        CHAR(1) not null,
  person_id         CHAR(10) not null,
  hospital_code     CHAR(5),
  doctor            VARCHAR2(255),
  guardian_notified CHAR(1) not null,
  notify_date       DATE,
  how_notified      CHAR(5),
  referred_to       CHAR(5),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_DISC_VICTIM on DENISON.DISC_VICTIM (DISTRICT, INCIDENT_ID, VICTIM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_VICTIM_ACTION
prompt =================================
prompt
create table DENISON.DISC_VICTIM_ACTION
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  summer_school    CHAR(1) not null,
  building         NUMBER(10) not null,
  incident_id      NUMBER(10) not null,
  victim           NUMBER(6) not null,
  action_number    NUMBER(6) not null,
  action_code      CHAR(5) not null,
  schd_duration    NUMBER(4,2),
  actual_duration  NUMBER(4,2),
  reason_code      CHAR(5),
  disposition_code CHAR(5),
  start_date       DATE,
  end_date         DATE,
  resp_building    NUMBER(10),
  date_determined  DATE,
  action_outcome   CHAR(5),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_DISC_VICTIM_ACT on DENISON.DISC_VICTIM_ACTION (ACTION_NUMBER, DISTRICT, INCIDENT_ID, VICTIM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISC_WEAPON_CODE
prompt ===============================
prompt
create table DENISON.DISC_WEAPON_CODE
(
  school_year  NUMBER(5) not null,
  incident_num NUMBER(10) not null,
  offender_num NUMBER(10) not null,
  weapon_code  VARCHAR2(4),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_DISC_WEA on DENISON.DISC_WEAPON_CODE (SCHOOL_YEAR, INCIDENT_NUM, OFFENDER_NUM, WEAPON_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table EMPLOYEE
prompt =======================
prompt
create table DENISON.EMPLOYEE
(
  empl_no      NUMBER(10),
  ssn          VARCHAR2(11),
  l_name       VARCHAR2(30),
  f_name       VARCHAR2(30),
  addr1        VARCHAR2(30),
  addr2        VARCHAR2(30),
  city         VARCHAR2(20),
  zip          VARCHAR2(10),
  hire_date    DATE,
  home_orgn    VARCHAR2(8),
  birthdate    DATE,
  base_loc     NUMBER(10),
  state_id     VARCHAR2(2),
  orig_hire    DATE,
  prev_lname   VARCHAR2(30),
  email_addr   VARCHAR2(50),
  info_rlease  VARCHAR2(1),
  r10_loaddate DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DENISON.I_EMPL_NO on DENISON.EMPLOYEE (EMPL_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.I_NAME on DENISON.EMPLOYEE (L_NAME, F_NAME, EMPL_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.I_ORGN on DENISON.EMPLOYEE (HOME_ORGN, L_NAME, F_NAME)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.I_SSN on DENISON.EMPLOYEE (SSN)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EMPLOYEE_TYPE
prompt ============================
prompt
create table DENISON.EMPLOYEE_TYPE
(
  code         VARCHAR2(1),
  desc_x       VARCHAR2(15),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX182_1 on DENISON.EMPLOYEE_TYPE (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table EMP_DEGREE
prompt =========================
prompt
create table DENISON.EMP_DEGREE
(
  empl_no      NUMBER(10),
  dtype        VARCHAR2(4),
  highest      VARCHAR2(1),
  school       VARCHAR2(4),
  major        VARCHAR2(4),
  minor        VARCHAR2(4),
  deg_date     DATE,
  credits      NUMBER(5,2),
  gpa          NUMBER(3,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX162_1 on DENISON.EMP_DEGREE (EMPL_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ENCLEDGR
prompt =======================
prompt
create table DENISON.ENCLEDGR
(
  enc_no        VARCHAR2(8),
  line_no       NUMBER(5),
  yr            VARCHAR2(2),
  key_orgn      VARCHAR2(16),
  account       VARCHAR2(8),
  proj          VARCHAR2(8),
  proj_acct     VARCHAR2(8),
  vend_no       VARCHAR2(8),
  orig_amt      NUMBER(12,2),
  change_bal    NUMBER(12,2),
  paymt_bal     NUMBER(12,2),
  date_enc      DATE,
  description   VARCHAR2(25),
  final         VARCHAR2(1),
  sales_tax     NUMBER(12,2),
  use_tax       NUMBER(12,2),
  where_created VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.ENCLEDX on DENISON.ENCLEDGR (ENC_NO, LINE_NO, YR, KEY_ORGN, ACCOUNT, PROJ, PROJ_ACCT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ETL_SOURCE_DISTRICT
prompt ==================================
prompt
create table DENISON.ETL_SOURCE_DISTRICT
(
  district_id VARCHAR2(6),
  type        VARCHAR2(25)
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table EXPBUDGT
prompt =======================
prompt
create table DENISON.EXPBUDGT
(
  yr           VARCHAR2(2),
  key_orgn     VARCHAR2(16),
  account      VARCHAR2(8),
  bud1         NUMBER(12,2),
  exp1         NUMBER(12,2),
  enc1         NUMBER(12,2),
  bud2         NUMBER(12,2),
  exp2         NUMBER(12,2),
  enc2         NUMBER(12,2),
  bud3         NUMBER(12,2),
  exp3         NUMBER(12,2),
  enc3         NUMBER(12,2),
  bud4         NUMBER(12,2),
  exp4         NUMBER(12,2),
  enc4         NUMBER(12,2),
  bud5         NUMBER(12,2),
  exp5         NUMBER(12,2),
  enc5         NUMBER(12,2),
  bud6         NUMBER(12,2),
  exp6         NUMBER(12,2),
  enc6         NUMBER(12,2),
  bud7         NUMBER(12,2),
  exp7         NUMBER(12,2),
  enc7         NUMBER(12,2),
  bud8         NUMBER(12,2),
  exp8         NUMBER(12,2),
  enc8         NUMBER(12,2),
  bud9         NUMBER(12,2),
  exp9         NUMBER(12,2),
  enc9         NUMBER(12,2),
  bud10        NUMBER(12,2),
  exp10        NUMBER(12,2),
  enc10        NUMBER(12,2),
  bud11        NUMBER(12,2),
  exp11        NUMBER(12,2),
  enc11        NUMBER(12,2),
  bud12        NUMBER(12,2),
  exp12        NUMBER(12,2),
  enc12        NUMBER(12,2),
  bud13        NUMBER(12,2),
  exp13        NUMBER(12,2),
  enc13        NUMBER(12,2),
  inv_bal      NUMBER(12,2),
  req_bal      NUMBER(12,2),
  pay_encum    NUMBER(12,2),
  bud_adj      NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.EXPBUDX on DENISON.EXPBUDGT (YR, KEY_ORGN, ACCOUNT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 768K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table EXPLEDGR
prompt =======================
prompt
create table DENISON.EXPLEDGR
(
  yr           VARCHAR2(2),
  key_orgn     VARCHAR2(16),
  account      VARCHAR2(8),
  budget_orgn  VARCHAR2(16),
  budget_acct  VARCHAR2(8),
  bud1         NUMBER(15,5) not null,
  exp1         NUMBER(12,2) not null,
  enc1         NUMBER(12,2) not null,
  bud2         NUMBER(12,2) not null,
  exp2         NUMBER(12,2) not null,
  enc2         NUMBER(12,2) not null,
  bud3         NUMBER(12,2) not null,
  exp3         NUMBER(12,2) not null,
  enc3         NUMBER(12,2) not null,
  bud4         NUMBER(12,2) not null,
  exp4         NUMBER(12,2) not null,
  enc4         NUMBER(12,2) not null,
  bud5         NUMBER(12,2) not null,
  exp5         NUMBER(12,2) not null,
  enc5         NUMBER(12,2) not null,
  bud6         NUMBER(12,2) not null,
  exp6         NUMBER(12,2) not null,
  enc6         NUMBER(12,2) not null,
  bud7         NUMBER(12,2) not null,
  exp7         NUMBER(12,2) not null,
  enc7         NUMBER(12,2) not null,
  bud8         NUMBER(12,2) not null,
  exp8         NUMBER(12,2) not null,
  enc8         NUMBER(12,2) not null,
  bud9         NUMBER(12,2) not null,
  exp9         NUMBER(12,2) not null,
  enc9         NUMBER(12,2) not null,
  bud10        NUMBER(12,2) not null,
  exp10        NUMBER(12,2) not null,
  enc10        NUMBER(12,2) not null,
  bud11        NUMBER(12,2) not null,
  exp11        NUMBER(12,2) not null,
  enc11        NUMBER(12,2) not null,
  bud12        NUMBER(12,2) not null,
  exp12        NUMBER(12,2) not null,
  enc12        NUMBER(12,2) not null,
  bud13        NUMBER(12,2) not null,
  exp13        NUMBER(12,2) not null,
  enc13        NUMBER(12,2) not null,
  pay_encum    NUMBER(12,2),
  active       VARCHAR2(1),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.EXPLEDX on DENISON.EXPLEDGR (YR, KEY_ORGN, ACCOUNT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 704K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table FAACCOUNT
prompt ========================
prompt
create table DENISON.FAACCOUNT
(
  acct         VARCHAR2(8) not null,
  sub_1_acct   VARCHAR2(8),
  sub_2_acct   VARCHAR2(8),
  sub_3_acct   VARCHAR2(8),
  title        VARCHAR2(25),
  proll_flg    VARCHAR2(1),
  reqpur_flg   VARCHAR2(1),
  war_flg      VARCHAR2(1),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.ACCOUNTX on DENISON.FAACCOUNT (ACCT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table FAORGN
prompt =====================
prompt
create table DENISON.FAORGN
(
  yr           VARCHAR2(2),
  key_orgn     VARCHAR2(16),
  lvl          NUMBER(5),
  fund         VARCHAR2(8),
  orgn1        VARCHAR2(16),
  orgn2        VARCHAR2(16),
  orgn3        VARCHAR2(16),
  orgn4        VARCHAR2(16),
  orgn5        VARCHAR2(16),
  orgn6        VARCHAR2(16),
  orgn7        VARCHAR2(16),
  orgn8        VARCHAR2(16),
  orgn9        VARCHAR2(16),
  title        VARCHAR2(25),
  enterprise   VARCHAR2(1),
  cash         VARCHAR2(1),
  budget       VARCHAR2(1),
  req_enc      VARCHAR2(1),
  pr_orgn      VARCHAR2(16),
  disb_fund    VARCHAR2(1),
  total_rec    VARCHAR2(1),
  proj_link    VARCHAR2(1),
  project      VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index DENISON.I2ORGN on DENISON.FAORGN (YR, PR_ORGN)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.I3ORGN on DENISON.FAORGN (LVL, YR)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IIORGN on DENISON.FAORGN (YR, KEY_ORGN)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table GENLEDGR
prompt =======================
prompt
create table DENISON.GENLEDGR
(
  yr           VARCHAR2(2),
  fund         VARCHAR2(8),
  account      VARCHAR2(8),
  gl_bal1      NUMBER(12,2),
  gl_bal2      NUMBER(12,2),
  gl_bal3      NUMBER(12,2),
  gl_bal4      NUMBER(12,2),
  gl_bal5      NUMBER(12,2),
  gl_bal6      NUMBER(12,2),
  gl_bal7      NUMBER(12,2),
  gl_bal8      NUMBER(12,2),
  gl_bal9      NUMBER(12,2),
  gl_bal10     NUMBER(12,2),
  gl_bal11     NUMBER(12,2),
  gl_bal12     NUMBER(12,2),
  gl_bal13     NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.GLLEDX on DENISON.GENLEDGR (YR, FUND, ACCOUNT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table LEVTABLE
prompt =======================
prompt
create table DENISON.LEVTABLE
(
  lv_code         VARCHAR2(3),
  title           VARCHAR2(25),
  ck_title        VARCHAR2(10),
  acc_type        VARCHAR2(1),
  acc_rate        NUMBER(10,6),
  lwop_acct       VARCHAR2(1),
  max_acc         NUMBER(8,4),
  years           NUMBER(5),
  exc_meth        VARCHAR2(1),
  roll_lim        NUMBER(8,4),
  roll_code       VARCHAR2(1),
  max_earn        NUMBER(8,4),
  unused_pay_meth VARCHAR2(1),
  unused_pay      NUMBER(8,4),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MASTER_SCHED
prompt ===========================
prompt
create table DENISON.MASTER_SCHED
(
  building       NUMBER(10) not null,
  course         VARCHAR2(6) not null,
  crs_section    NUMBER(5) not null,
  rsvd_session   NUMBER(5) not null,
  description    VARCHAR2(15) not null,
  teacher_number NUMBER(10) not null,
  course_group   VARCHAR2(1),
  house_or_team  VARCHAR2(2),
  max_stu        NUMBER(5) not null,
  num_used       NUMBER(5) not null,
  male           NUMBER(5) not null,
  female         NUMBER(5) not null,
  blocked        VARCHAR2(1) not null,
  credit         NUMBER(6,4) not null,
  fee            NUMBER(7,2) not null,
  rc_flag        VARCHAR2(1) not null,
  atnd           VARCHAR2(1) not null,
  sex_flag       VARCHAR2(1) not null,
  grade_list     VARCHAR2(20),
  study_hall     VARCHAR2(1) not null,
  room           VARCHAR2(5) not null,
  honor_flag1    VARCHAR2(1) not null,
  honor_flag2    VARCHAR2(1) not null,
  honor_flag3    VARCHAR2(1) not null,
  honor_flag4    VARCHAR2(1) not null,
  hnr_level1     VARCHAR2(1) not null,
  hnr_level2     VARCHAR2(1) not null,
  hnr_level3     VARCHAR2(1) not null,
  hnr_level4     VARCHAR2(1) not null,
  rank_flag1     VARCHAR2(1) not null,
  rank_flag2     VARCHAR2(1) not null,
  rank_flag3     VARCHAR2(1) not null,
  rank_flag4     VARCHAR2(1) not null,
  rank_level1    VARCHAR2(1) not null,
  rank_level2    VARCHAR2(1) not null,
  rank_level3    VARCHAR2(1) not null,
  rank_level4    VARCHAR2(1) not null,
  crs_period     VARCHAR2(3),
  per_len        NUMBER(5) not null,
  average_type   VARCHAR2(3),
  meet_cycle0    VARCHAR2(1) not null,
  meet_cycle1    VARCHAR2(1) not null,
  meet_cycle2    VARCHAR2(1) not null,
  meet_cycle3    VARCHAR2(1) not null,
  meet_cycle4    VARCHAR2(1) not null,
  meet_cycle5    VARCHAR2(1) not null,
  meet_cycle6    VARCHAR2(1) not null,
  meet_cycle7    VARCHAR2(1) not null,
  meet_cycle8    VARCHAR2(1) not null,
  meet_cycle9    VARCHAR2(1) not null,
  meet_mp1       VARCHAR2(1) not null,
  meet_mp2       VARCHAR2(1) not null,
  meet_mp3       VARCHAR2(1) not null,
  meet_mp4       VARCHAR2(1) not null,
  meet_mp5       VARCHAR2(1) not null,
  meet_mp6       VARCHAR2(1) not null,
  meet_mp7       VARCHAR2(1) not null,
  meet_mp8       VARCHAR2(1) not null,
  meet_mp9       VARCHAR2(1) not null,
  mark1_mp1      VARCHAR2(1) not null,
  mark1_mp2      VARCHAR2(1) not null,
  mark1_mp3      VARCHAR2(1) not null,
  mark1_mp4      VARCHAR2(1) not null,
  mark1_mp5      VARCHAR2(1) not null,
  mark1_mp6      VARCHAR2(1) not null,
  mark1_mp7      VARCHAR2(1) not null,
  mark1_mp8      VARCHAR2(1) not null,
  mark1_mp9      VARCHAR2(1) not null,
  mark2_mp1      VARCHAR2(1) not null,
  mark2_mp2      VARCHAR2(1) not null,
  mark2_mp3      VARCHAR2(1) not null,
  mark2_mp4      VARCHAR2(1) not null,
  mark2_mp5      VARCHAR2(1) not null,
  mark2_mp6      VARCHAR2(1) not null,
  mark2_mp7      VARCHAR2(1) not null,
  mark2_mp8      VARCHAR2(1) not null,
  mark2_mp9      VARCHAR2(1) not null,
  mark3_mp1      VARCHAR2(1) not null,
  mark3_mp2      VARCHAR2(1) not null,
  mark3_mp3      VARCHAR2(1) not null,
  mark3_mp4      VARCHAR2(1) not null,
  mark3_mp5      VARCHAR2(1) not null,
  mark3_mp6      VARCHAR2(1) not null,
  mark3_mp7      VARCHAR2(1) not null,
  mark3_mp8      VARCHAR2(1) not null,
  mark3_mp9      VARCHAR2(1) not null,
  use_final      VARCHAR2(1) not null,
  crs_key        NUMBER(5) not null,
  fld01          VARCHAR2(15),
  fld02          VARCHAR2(15),
  fld03          VARCHAR2(15),
  fld04          VARCHAR2(15),
  fld05          VARCHAR2(15),
  fld06          VARCHAR2(15),
  fld07          VARCHAR2(15),
  fld08          VARCHAR2(15),
  fld09          VARCHAR2(15),
  fld10          VARCHAR2(15),
  change_date    DATE,
  change_time    VARCHAR2(8),
  change_uid     VARCHAR2(8),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DENISON.IX_MAS_SCHD on DENISON.MASTER_SCHED (BUILDING, COURSE, CRS_SECTION, RSVD_SESSION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DENISON.I_CRS_KEY on DENISON.MASTER_SCHED (BUILDING, CRS_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEDTB_SHOT
prompt =========================
prompt
create table DENISON.MEDTB_SHOT
(
  district         NUMBER(10) not null,
  code             CHAR(10) not null,
  description      VARCHAR2(255) not null,
  shot_order       NUMBER(6) not null,
  auto_generate    CHAR(1) not null,
  live_virus       CHAR(1) not null,
  shot_requirement CHAR(25),
  series_flag      CHAR(1) not null,
  licensing_date   DATE not null,
  state_code_equiv VARCHAR2(10),
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MEDTB_SHOT on DENISON.MEDTB_SHOT (CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MED_SERIES
prompt =========================
prompt
create table DENISON.MED_SERIES
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  series_code      CHAR(10) not null,
  series_exemption CHAR(10),
  total_doses      NUMBER(6) not null,
  series_status    CHAR(2),
  calc_date        DATE,
  override         CHAR(1) not null,
  comments         VARCHAR2(64),
  number_letters   NUMBER(6) not null,
  had_disease      CHAR(1) not null,
  disease_date     VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MED_SERIES on DENISON.MED_SERIES (DISTRICT, SERIES_CODE, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MED_SERIES_DET
prompt =============================
prompt
create table DENISON.MED_SERIES_DET
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  series_code      CHAR(10) not null,
  series_date      DATE not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MED_SERIES_DET on DENISON.MED_SERIES_DET (DISTRICT, SERIES_CODE, SERIES_DATE, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MED_SHOT_DET
prompt ===========================
prompt
create table DENISON.MED_SHOT_DET
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  shot_code        CHAR(10) not null,
  shot_date        DATE not null,
  shot_order       NUMBER(10) not null,
  source_doc       CHAR(10),
  signed_doc       CHAR(1) not null,
  warning_status   CHAR(2),
  override         CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MED_SHOT_DET on DENISON.MED_SHOT_DET (DISTRICT, SHOT_CODE, SHOT_DATE, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_COMMENTS
prompt ==========================
prompt
create table DENISON.MR_COMMENTS
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  code             CHAR(5) not null,
  ipr_usage        CHAR(1) not null,
  sc_usage         CHAR(1) not null,
  rc_usage         CHAR(1) not null,
  description      VARCHAR2(255) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_COMMENTS on DENISON.MR_COMMENTS (BUILDING, CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_COMMENT_TYPES
prompt ===============================
prompt
create table DENISON.MR_COMMENT_TYPES
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  comment_type     CHAR(5) not null,
  comment_order    NUMBER(6) not null,
  description      VARCHAR2(255) not null,
  active           CHAR(1) not null,
  required         CHAR(1) not null,
  usage            CHAR(1) not null,
  rc_usage         CHAR(1) not null,
  ipr_usage        CHAR(1) not null,
  sc_usage         CHAR(1) not null,
  tws_access       CHAR(1),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_COMMNT_TYPES on DENISON.MR_COMMENT_TYPES (BUILDING, COMMENT_TYPE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_COMMNT_TYPES on DENISON.MR_COMMENT_TYPES (BUILDING, COMMENT_ORDER, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_CRSEQU_DET
prompt ============================
prompt
create table DENISON.MR_CRSEQU_DET
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  building         NUMBER(10) not null,
  state_id         CHAR(10) not null,
  course           CHAR(10) not null,
  course_section   NUMBER(6) not null,
  equiv_parts      NUMBER(6) not null,
  equiv_sequence   NUMBER(6) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_CRSEQU_DET on DENISON.MR_CRSEQU_DET (BUILDING, COURSE, COURSE_SECTION, DISTRICT, SCHOOL_YEAR, STATE_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_CRSEQU_DET on DENISON.MR_CRSEQU_DET (SCHOOL_YEAR, BUILDING, COURSE, COURSE_SECTION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_LEVEL_HDR
prompt ===========================
prompt
create table DENISON.MR_LEVEL_HDR
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  level_number     NUMBER(6) not null,
  description      VARCHAR2(255) not null,
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_LEVEL_HDR on DENISON.MR_LEVEL_HDR (BUILDING, DISTRICT, LEVEL_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_LEVEL_MARKS
prompt =============================
prompt
create table DENISON.MR_LEVEL_MARKS
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  mark             CHAR(3) not null,
  display_order    NUMBER(6) not null,
  active           CHAR(1) not null,
  state_code_equiv CHAR(10),
  course_completed CHAR(1),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_LEVEL_MARKS on DENISON.MR_LEVEL_MARKS (BUILDING, DISTRICT, MARK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_LEVEL_MARKS on DENISON.MR_LEVEL_MARKS (BUILDING, DISPLAY_ORDER, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_MARK_TYPES
prompt ============================
prompt
create table DENISON.MR_MARK_TYPES
(
  district           NUMBER(10) not null,
  building           NUMBER(10) not null,
  mark_type          CHAR(5) not null,
  mark_order         NUMBER(6) not null,
  mark_when          CHAR(1) not null,
  description        VARCHAR2(255) not null,
  include_as_default CHAR(1) not null,
  required           CHAR(1) not null,
  active             CHAR(1) not null,
  tws_access         CHAR(1),
  receive_gb_result  CHAR(1),
  include_perfplus   CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_MARK_TYPES on DENISON.MR_MARK_TYPES (BUILDING, DISTRICT, MARK_TYPE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STATE_COURSES
prompt ===============================
prompt
create table DENISON.MR_STATE_COURSES
(
  district           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  state_code         CHAR(10) not null,
  description        VARCHAR2(255) not null,
  abbrev_course_name VARCHAR2(50),
  flag_01            CHAR(1) not null,
  flag_02            CHAR(1) not null,
  flag_03            CHAR(1) not null,
  flag_04            CHAR(1) not null,
  flag_05            CHAR(1) not null,
  flag_06            CHAR(1) not null,
  flag_07            CHAR(1) not null,
  flag_08            CHAR(1) not null,
  flag_09            CHAR(1) not null,
  flag_10            CHAR(1) not null,
  active             CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_STATE_COURSES on DENISON.MR_STATE_COURSES (DISTRICT, SCHOOL_YEAR, STATE_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_CRSEQU_MARK
prompt =================================
prompt
create table DENISON.MR_STU_CRSEQU_MARK
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  building         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  state_id         CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  dest_mark_type   CHAR(5) not null,
  destination_mp   CHAR(3) not null,
  source_mark_type CHAR(5) not null,
  source_mp        CHAR(3) not null,
  mark_value       CHAR(3),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_STU_CRSEQU_MARK on DENISON.MR_STU_CRSEQU_MARK (BUILDING, COURSE_SESSION, DEST_MARK_TYPE, DESTINATION_MP, DISTRICT, SCHOOL_YEAR, SECTION_KEY, STATE_ID, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_GPA
prompt =========================
prompt
create table DENISON.MR_STU_GPA
(
  district           NUMBER(10) not null,
  student_id         CHAR(10) not null,
  gpa_type           CHAR(5) not null,
  school_year        NUMBER(6) not null,
  run_term_year      NUMBER(6) not null,
  building           NUMBER(10) not null,
  grade              CHAR(2) not null,
  needs_recalc       CHAR(1) not null,
  override           CHAR(1) not null,
  cur_gpa_calc_date  DATE,
  cur_gpa            NUMBER(7,4) not null,
  cur_quality_points NUMBER(8,4) not null,
  cur_add_on_points  NUMBER(8,4) not null,
  cur_att_credit     NUMBER(7,4) not null,
  cur_earn_credit    NUMBER(7,4),
  cur_rnk_calc_date  DATE,
  cur_rank           NUMBER(6) not null,
  cur_percentile     NUMBER(6) not null,
  cur_decile         NUMBER(6) not null,
  cur_quintile       NUMBER(6) not null,
  cur_quartile       NUMBER(6) not null,
  cur_rank_gpa       NUMBER(7,4) not null,
  cum_gpa_calc_date  DATE,
  cum_gpa            NUMBER(7,4) not null,
  cum_quality_points NUMBER(9,4) not null,
  cum_add_on_points  NUMBER(8,4) not null,
  cum_att_credit     NUMBER(7,4) not null,
  cum_earn_credit    NUMBER(7,4),
  cum_rnk_calc_date  DATE,
  cum_rank           NUMBER(6) not null,
  cum_percentile     NUMBER(6) not null,
  cum_decile         NUMBER(6) not null,
  cum_quintile       NUMBER(6) not null,
  cum_quartile       NUMBER(6) not null,
  cum_rank_gpa       NUMBER(7,4) not null,
  cur_rank_qual_pts  NUMBER(8,4),
  cum_rank_qual_pts  NUMBER(9,4),
  bldg_override      VARCHAR2(5),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_STU_GPA on DENISON.MR_STU_GPA (DISTRICT, GPA_TYPE, RUN_TERM_YEAR, SCHOOL_YEAR, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_HDR
prompt =========================
prompt
create table DENISON.MR_STU_HDR
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  rc_status        CHAR(1) not null,
  att_credit       NUMBER(6,4) not null,
  att_override     CHAR(1) not null,
  att_ovr_reason   CHAR(1),
  earn_credit      NUMBER(6,4) not null,
  earn_override    CHAR(1) not null,
  ern_ovr_reason   CHAR(1),
  state_crs_equiv  CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_STU_HDR on DENISON.MR_STU_HDR (COURSE_SESSION, DISTRICT, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_STU_HDR on DENISON.MR_STU_HDR (STUDENT_ID, SECTION_KEY, COURSE_SESSION, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_HDR_SUBJ
prompt ==============================
prompt
create table DENISON.MR_STU_HDR_SUBJ
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  subject_area     CHAR(5) not null,
  value            CHAR(5) not null,
  override         CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_MR_STU_HDR_SUBJ on DENISON.MR_STU_HDR_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, STUDENT_ID, SUBJECT_AREA)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_MARKS
prompt ===========================
prompt
create table DENISON.MR_STU_MARKS
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  mark_type        CHAR(5) not null,
  mark_value       CHAR(3),
  override         CHAR(1) not null,
  raw_mark_value   NUMBER(9,5),
  override_reason  VARCHAR2(50),
  override_notes   VARCHAR2(200),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_STU_MARKS on DENISON.MR_STU_MARKS (COURSE_SESSION, DISTRICT, MARK_TYPE, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_STU_MARKS on DENISON.MR_STU_MARKS (STUDENT_ID, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_MP
prompt ========================
prompt
create table DENISON.MR_STU_MP
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  att_credit       NUMBER(6,4) not null,
  att_override     CHAR(1) not null,
  att_ovr_reason   CHAR(1),
  earn_credit      NUMBER(6,4) not null,
  earn_override    CHAR(1) not null,
  ern_ovr_reason   CHAR(1),
  trail_flag       CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_STU_MP on DENISON.MR_STU_MP (COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_STU_MP on DENISON.MR_STU_MP (SECTION_KEY, COURSE_SESSION, STUDENT_ID, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_STU_MP_COMMENTS
prompt =================================
prompt
create table DENISON.MR_STU_MP_COMMENTS
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  comment_type     CHAR(5) not null,
  code             CHAR(5),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_MR_STU_MP_COMM on DENISON.MR_STU_MP_COMMENTS (COMMENT_TYPE, COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_MR_STU_MP_COMM on DENISON.MR_STU_MP_COMMENTS (SECTION_KEY, STUDENT_ID, COURSE_SESSION, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MR_TRN_PRT_STU_DET
prompt =================================
prompt
create table DENISON.MR_TRN_PRT_STU_DET
(
  district          NUMBER(10) not null,
  mr_trn_print_key  NUMBER(10) not null,
  student_id        CHAR(10) not null,
  section_key       NUMBER(10) not null,
  course_building   NUMBER(10) not null,
  course            CHAR(10) not null,
  course_section    NUMBER(6) not null,
  course_session    NUMBER(6) not null,
  run_term_year     NUMBER(6) not null,
  school_year       NUMBER(6) not null,
  student_grade     CHAR(2),
  description       VARCHAR2(255) not null,
  crs_period        CHAR(13) not null,
  course_level      NUMBER(6),
  primary_staff_id  CHAR(10),
  staff_name        VARCHAR2(25),
  room_id           CHAR(5),
  attempted_credit  NUMBER(6,4),
  earned_credit     NUMBER(6,4),
  department        CHAR(5),
  dept_descr        VARCHAR2(255),
  trn_data_value_01 CHAR(10),
  trn_data_value_02 CHAR(10),
  trn_data_value_03 CHAR(10),
  trn_data_value_04 CHAR(10),
  trn_data_value_05 CHAR(10),
  trn_data_value_06 CHAR(10),
  trn_data_value_07 CHAR(10),
  trn_data_value_08 CHAR(10),
  trn_data_value_09 CHAR(10),
  trn_data_value_10 CHAR(10),
  trn_data_value_11 CHAR(10),
  trn_data_value_12 CHAR(10),
  trn_data_value_13 CHAR(10),
  trn_data_value_14 CHAR(10),
  trn_data_value_15 CHAR(10),
  trn_data_value_16 CHAR(10),
  trn_data_value_17 CHAR(10),
  trn_data_value_18 CHAR(10),
  trn_data_value_19 CHAR(10),
  trn_data_value_20 CHAR(10),
  trn_data_value_21 CHAR(10),
  trn_data_value_22 CHAR(10),
  trn_data_value_23 CHAR(10),
  trn_data_value_24 CHAR(10),
  trn_data_value_25 CHAR(10),
  trn_data_value_26 CHAR(10),
  trn_data_value_27 CHAR(10),
  trn_data_value_28 CHAR(10),
  trn_data_value_29 CHAR(10),
  trn_data_value_30 CHAR(10),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PEM_CRS_EQUIV
prompt ============================
prompt
create table DENISON.PEM_CRS_EQUIV
(
  school_year     NUMBER(5) not null,
  building        NUMBER(10) not null,
  course          VARCHAR2(6) not null,
  description     VARCHAR2(15) not null,
  e0721           VARCHAR2(3) not null,
  e0724           VARCHAR2(8) not null,
  e0173           VARCHAR2(2) not null,
  e0747           VARCHAR2(2) not null,
  voc_ed_co_op    VARCHAR2(1) not null,
  course_sequence VARCHAR2(4),
  course_type     VARCHAR2(2),
  e1010           VARCHAR2(2) not null,
  e1011           VARCHAR2(1) not null,
  change_date     DATE,
  change_time     VARCHAR2(8),
  change_uid      VARCHAR2(8),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table PERSON
prompt =====================
prompt
create table DENISON.PERSON
(
  empl_no        NUMBER(10),
  home_phone     VARCHAR2(12),
  listed         VARCHAR2(1),
  work_phone     VARCHAR2(12),
  emer_cont      VARCHAR2(25),
  emer_phone     VARCHAR2(12),
  phys_name      VARCHAR2(30),
  phys_phone     VARCHAR2(12),
  yrs_district   NUMBER(3,1),
  yrs_state      NUMBER(3,1),
  yrs_total      NUMBER(3,1),
  last_tb        DATE,
  tenure_date    DATE,
  senior_date    DATE,
  empl_type      VARCHAR2(1),
  location       VARCHAR2(4),
  sex            VARCHAR2(1),
  race           VARCHAR2(1),
  eeo            VARCHAR2(2),
  eeo_group      VARCHAR2(1),
  part_time      VARCHAR2(1),
  status         VARCHAR2(4),
  stat_date      DATE,
  hand           VARCHAR2(1),
  job_1          VARCHAR2(4),
  job_2          VARCHAR2(4),
  job_3          VARCHAR2(4),
  job_4          VARCHAR2(4),
  job_5          VARCHAR2(4),
  bargain        VARCHAR2(4),
  comp_code      VARCHAR2(4),
  term_date      DATE,
  term_code      VARCHAR2(4),
  ex_curr1       VARCHAR2(4),
  ex_curr2       VARCHAR2(4),
  ex_curr3       VARCHAR2(4),
  ex_curr4       VARCHAR2(4),
  ex_curr5       VARCHAR2(4),
  ex_curr6       VARCHAR2(4),
  curr_date      DATE,
  prior_class    VARCHAR2(4),
  prior_date     DATE,
  prior2_class   VARCHAR2(4),
  prior2_date    DATE,
  incr_per       NUMBER(8,4),
  incr_date      DATE,
  incr2_per      NUMBER(8,4),
  incr2_date     DATE,
  incr3_per      NUMBER(8,4),
  incr3_date     DATE,
  eeo_func       VARCHAR2(2),
  lastday_worked DATE,
  r10_loaddate   DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DENISON.P_EMPL_NO on DENISON.PERSON (EMPL_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROG_ELEMENT
prompt ===========================
prompt
create table DENISON.PROG_ELEMENT
(
  element_serial   NUMBER(10),
  element_code     VARCHAR2(7) not null,
  description      VARCHAR2(47) not null,
  group_serial     NUMBER(10) not null,
  parent_element   VARCHAR2(7),
  tab_name         VARCHAR2(18),
  col_name         VARCHAR2(18),
  screen_num       NUMBER(5),
  tbl_hlp_table    VARCHAR2(18),
  tbl_hlp_code     VARCHAR2(18),
  tbl_hlp_desc     VARCHAR2(18),
  tbl_hlp_where    VARCHAR2(500),
  allow_binary     VARCHAR2(1) not null,
  allow_rapid_add  VARCHAR2(1) not null,
  allow_override   VARCHAR2(1) not null,
  active_value     VARCHAR2(15),
  with_value       VARCHAR2(15),
  rollover_action  VARCHAR2(1) not null,
  years_history    NUMBER(5) not null,
  state_code_equiv VARCHAR2(20),
  validation_list  VARCHAR2(255),
  default_value    VARCHAR2(20),
  change_date      DATE,
  change_time      VARCHAR2(8),
  change_uid       VARCHAR2(8),
  r10_loaddate     DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_PROG_ELE1 on DENISON.PROG_ELEMENT (ELEMENT_SERIAL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_PROG_ELE2 on DENISON.PROG_ELEMENT (ELEMENT_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.IX_PROG_ELE3 on DENISON.PROG_ELEMENT (GROUP_SERIAL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_PROG_ELE4 on DENISON.PROG_ELEMENT (TAB_NAME, COL_NAME, SCREEN_NUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table PROG_STUDENT
prompt ===========================
prompt
create table DENISON.PROG_STUDENT
(
  student_serial NUMBER(10),
  studentid      NUMBER(10) not null,
  entry_date     DATE not null,
  element_serial NUMBER(10) not null,
  value          VARCHAR2(15) not null,
  override       VARCHAR2(1) not null,
  with_date      DATE,
  change_date    DATE,
  change_time    VARCHAR2(8),
  change_uid     VARCHAR2(8),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_PROG_STU1 on DENISON.PROG_STUDENT (STUDENT_SERIAL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_PROG_STU2 on DENISON.PROG_STUDENT (STUDENTID, ENTRY_DATE, ELEMENT_SERIAL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table RC_CFG
prompt =====================
prompt
create table DENISON.RC_CFG
(
  building     NUMBER(10) not null,
  current_mp   VARCHAR2(1) not null,
  current_sem  VARCHAR2(1) not null,
  use_numeric  VARCHAR2(1) not null,
  numeric_com  VARCHAR2(1) not null,
  com_used     NUMBER(5) not null,
  ask_atd      VARCHAR2(1) not null,
  rank_ile     VARCHAR2(1) not null,
  use_keypad   VARCHAR2(1) not null,
  sem_mp1      VARCHAR2(1),
  sem_mp2      VARCHAR2(1),
  sem_mp3      VARCHAR2(1),
  sem_mp4      VARCHAR2(1),
  sem_mp5      VARCHAR2(1),
  sem_mp6      VARCHAR2(1),
  sem_mp7      VARCHAR2(1),
  sem_mp8      VARCHAR2(1),
  sem_mp9      VARCHAR2(1),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.I_RCCFG on DENISON.RC_CFG (BUILDING)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table RC_COURSE
prompt ========================
prompt
create table DENISON.RC_COURSE
(
  building       NUMBER(10) not null,
  school_year    NUMBER(5) not null,
  course         VARCHAR2(6) not null,
  crs_section    NUMBER(5) not null,
  rsvd_session   NUMBER(5) not null,
  description    VARCHAR2(15) not null,
  teacher_number NUMBER(10) not null,
  teacher_name   VARCHAR2(25),
  rank_level1    VARCHAR2(1),
  rank_level2    VARCHAR2(1),
  rank_level3    VARCHAR2(1),
  rank_level4    VARCHAR2(1),
  rank_flag1     VARCHAR2(1) not null,
  rank_flag2     VARCHAR2(1) not null,
  rank_flag3     VARCHAR2(1) not null,
  rank_flag4     VARCHAR2(1) not null,
  meet_mp1       VARCHAR2(1) not null,
  meet_mp2       VARCHAR2(1) not null,
  meet_mp3       VARCHAR2(1) not null,
  meet_mp4       VARCHAR2(1) not null,
  meet_mp5       VARCHAR2(1) not null,
  meet_mp6       VARCHAR2(1) not null,
  meet_mp7       VARCHAR2(1) not null,
  meet_mp8       VARCHAR2(1) not null,
  meet_mp9       VARCHAR2(1) not null,
  mark1_mp1      VARCHAR2(1) not null,
  mark1_mp2      VARCHAR2(1) not null,
  mark1_mp3      VARCHAR2(1) not null,
  mark1_mp4      VARCHAR2(1) not null,
  mark1_mp5      VARCHAR2(1) not null,
  mark1_mp6      VARCHAR2(1) not null,
  mark1_mp7      VARCHAR2(1) not null,
  mark1_mp8      VARCHAR2(1) not null,
  mark1_mp9      VARCHAR2(1) not null,
  mark2_mp1      VARCHAR2(1) not null,
  mark2_mp2      VARCHAR2(1) not null,
  mark2_mp3      VARCHAR2(1) not null,
  mark2_mp4      VARCHAR2(1) not null,
  mark2_mp5      VARCHAR2(1) not null,
  mark2_mp6      VARCHAR2(1) not null,
  mark2_mp7      VARCHAR2(1) not null,
  mark2_mp8      VARCHAR2(1) not null,
  mark2_mp9      VARCHAR2(1) not null,
  mark3_mp1      VARCHAR2(1) not null,
  mark3_mp2      VARCHAR2(1) not null,
  mark3_mp3      VARCHAR2(1) not null,
  mark3_mp4      VARCHAR2(1) not null,
  mark3_mp5      VARCHAR2(1) not null,
  mark3_mp6      VARCHAR2(1) not null,
  mark3_mp7      VARCHAR2(1) not null,
  mark3_mp8      VARCHAR2(1) not null,
  mark3_mp9      VARCHAR2(1) not null,
  use_final      VARCHAR2(1) not null,
  department     VARCHAR2(2),
  subj_area1     VARCHAR2(3),
  subj_area2     VARCHAR2(3),
  subj_area3     VARCHAR2(3),
  multi_area     VARCHAR2(1) not null,
  credit         NUMBER(6,4) not null,
  grade_list     VARCHAR2(20),
  fld01          VARCHAR2(15),
  fld02          VARCHAR2(15),
  fld03          VARCHAR2(15),
  fld04          VARCHAR2(15),
  fld05          VARCHAR2(15),
  fld06          VARCHAR2(15),
  fld07          VARCHAR2(15),
  fld08          VARCHAR2(15),
  fld09          VARCHAR2(15),
  fld10          VARCHAR2(15),
  change_date    DATE,
  change_time    VARCHAR2(8),
  change_uid     VARCHAR2(8),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.I_RCCOURSE1 on DENISON.RC_COURSE (BUILDING, SCHOOL_YEAR, COURSE, CRS_SECTION, RSVD_SESSION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table RC_CREDIT
prompt ========================
prompt
create table DENISON.RC_CREDIT
(
  studentid      NUMBER(10) not null,
  building       NUMBER(10) not null,
  marking_period VARCHAR2(1) not null,
  att_credit     NUMBER(7,4) not null,
  ern_credit     NUMBER(7,4) not null,
  change_date    DATE,
  change_time    VARCHAR2(8),
  change_uid     VARCHAR2(8),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.I_CREDIT on DENISON.RC_CREDIT (STUDENTID, MARKING_PERIOD)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table RC_DET
prompt =====================
prompt
create table DENISON.RC_DET
(
  school_year     NUMBER(5) not null,
  building        NUMBER(10) not null,
  studentid       NUMBER(10) not null,
  course          VARCHAR2(6) not null,
  crs_section     NUMBER(5) not null,
  rsvd_session    NUMBER(5) not null,
  marking_period  VARCHAR2(1) not null,
  grade1          VARCHAR2(3),
  grade1_override VARCHAR2(1) not null,
  grade2          VARCHAR2(3),
  grade2_override VARCHAR2(1) not null,
  grade3          VARCHAR2(3),
  grade3_override VARCHAR2(1) not null,
  absences1       NUMBER(5) not null,
  absences2       NUMBER(5) not null,
  absences3       NUMBER(5) not null,
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table RC_HDR
prompt =====================
prompt
create table DENISON.RC_HDR
(
  school_year     NUMBER(5) not null,
  building        NUMBER(10) not null,
  studentid       NUMBER(10) not null,
  course          VARCHAR2(6) not null,
  crs_section     NUMBER(5) not null,
  rsvd_session    NUMBER(5) not null,
  rc_status       VARCHAR2(1) not null,
  att_credit      NUMBER(6,4) not null,
  att_override    VARCHAR2(1) not null,
  earn_credit     NUMBER(6,4) not null,
  earn_override   VARCHAR2(1) not null,
  final_grade     VARCHAR2(3),
  final_override  VARCHAR2(1) not null,
  conflict        VARCHAR2(1) not null,
  subj_area1      VARCHAR2(2),
  subj_area2      VARCHAR2(2),
  subj_area3      VARCHAR2(2),
  apply_override1 VARCHAR2(1) not null,
  apply_override2 VARCHAR2(1) not null,
  apply_override3 VARCHAR2(1) not null,
  change_date     DATE,
  change_time     VARCHAR2(8),
  change_uid      VARCHAR2(8),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_RCHDR1 on DENISON.RC_HDR (SCHOOL_YEAR, BUILDING, STUDENTID, COURSE, CRS_SECTION, RSVD_SESSION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.IX_RCHDR2 on DENISON.RC_HDR (STUDENTID, SCHOOL_YEAR)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table RC_SEM
prompt =====================
prompt
create table DENISON.RC_SEM
(
  studentid     NUMBER(10) not null,
  school_year   NUMBER(5) not null,
  mp_sem_num    VARCHAR2(1) not null,
  building      NUMBER(10) not null,
  grade         VARCHAR2(2) not null,
  dat_abs1      NUMBER(6,2) not null,
  dat_abs2      NUMBER(6,2) not null,
  dat_abs3      NUMBER(6,2) not null,
  membership    NUMBER(6,2) not null,
  calc_override VARCHAR2(1) not null,
  dirty_rank    VARCHAR2(1) not null,
  cur_t_attcr   NUMBER(8,4) not null,
  cur_t_erncr   NUMBER(8,4) not null,
  cum_t_attcr   NUMBER(8,4) not null,
  cum_t_erncr   NUMBER(8,4) not null,
  cur_q_pts1    NUMBER(8,4) not null,
  cur_q_pts2    NUMBER(8,4) not null,
  cur_q_pts3    NUMBER(8,4) not null,
  cur_q_pts4    NUMBER(8,4) not null,
  cur_add_pts1  NUMBER(8,4) not null,
  cur_add_pts2  NUMBER(8,4) not null,
  cur_add_pts3  NUMBER(8,4) not null,
  cur_add_pts4  NUMBER(8,4) not null,
  cur_gpa1      NUMBER(7,4) not null,
  cur_gpa2      NUMBER(7,4) not null,
  cur_gpa3      NUMBER(7,4) not null,
  cur_gpa4      NUMBER(7,4) not null,
  cur_erncr1    NUMBER(8,4) not null,
  cur_erncr2    NUMBER(8,4) not null,
  cur_erncr3    NUMBER(8,4) not null,
  cur_erncr4    NUMBER(8,4) not null,
  cur_attcr1    NUMBER(8,4) not null,
  cur_attcr2    NUMBER(8,4) not null,
  cur_attcr3    NUMBER(8,4) not null,
  cur_attcr4    NUMBER(8,4) not null,
  cum_q_pts1    NUMBER(8,4) not null,
  cum_q_pts2    NUMBER(8,4) not null,
  cum_q_pts3    NUMBER(8,4) not null,
  cum_q_pts4    NUMBER(8,4) not null,
  cum_add_pts1  NUMBER(8,4) not null,
  cum_add_pts2  NUMBER(8,4) not null,
  cum_add_pts3  NUMBER(8,4) not null,
  cum_add_pts4  NUMBER(8,4) not null,
  cum_gpa1      NUMBER(7,4) not null,
  cum_gpa2      NUMBER(7,4) not null,
  cum_gpa3      NUMBER(7,4) not null,
  cum_gpa4      NUMBER(7,4) not null,
  cum_erncr1    NUMBER(8,4) not null,
  cum_erncr2    NUMBER(8,4) not null,
  cum_erncr3    NUMBER(8,4) not null,
  cum_erncr4    NUMBER(8,4) not null,
  cum_attcr1    NUMBER(8,4) not null,
  cum_attcr2    NUMBER(8,4) not null,
  cum_attcr3    NUMBER(8,4) not null,
  cum_attcr4    NUMBER(8,4) not null,
  cum_o_rnk1    NUMBER(5) not null,
  cum_o_rnk2    NUMBER(5) not null,
  cum_o_rnk3    NUMBER(5) not null,
  cum_o_rnk4    NUMBER(5) not null,
  cum_o_gpa1    NUMBER(7,4) not null,
  cum_o_gpa2    NUMBER(7,4) not null,
  cum_o_gpa3    NUMBER(7,4) not null,
  cum_o_gpa4    NUMBER(7,4) not null,
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_RCSEM1 on DENISON.RC_SEM (BUILDING, SCHOOL_YEAR, MP_SEM_NUM, STUDENTID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_RCSEM2 on DENISON.RC_SEM (STUDENTID, SCHOOL_YEAR, MP_SEM_NUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table REG
prompt ==================
prompt
create table DENISON.REG
(
  district           NUMBER(10) not null,
  student_id         CHAR(10) not null,
  first_name         VARCHAR2(30) not null,
  middle_name        VARCHAR2(30),
  last_name          VARCHAR2(30) not null,
  generation         CHAR(5),
  building           NUMBER(10) not null,
  home_building      NUMBER(10),
  building_override  CHAR(1) not null,
  building_reason    CHAR(5),
  grade              CHAR(2) not null,
  gender             CHAR(1) not null,
  language           CHAR(5),
  native_language    CHAR(5),
  calendar           CHAR(1) not null,
  track              CHAR(3) not null,
  current_status     CHAR(1) not null,
  summer_status      CHAR(1),
  counselor          CHAR(10),
  house_team         CHAR(5),
  homeroom_primary   CHAR(5),
  homeroom_secondary CHAR(5),
  birthdate          DATE not null,
  family_census      CHAR(8),
  alt_building       NUMBER(10),
  alt_district       NUMBER(10),
  nickname           VARCHAR2(30),
  home_district      NUMBER(10),
  attending_district NUMBER(10),
  alt_bldg_acct      NUMBER(10),
  dist_enroll_date   DATE,
  state_enroll_date  DATE,
  us_enroll_date     DATE,
  student_guid       NUMBER(10) not null,
  res_county_code    CHAR(10),
  state_res_building CHAR(20),
  grade_9_date       DATE,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG on DENISON.REG (DISTRICT, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG on DENISON.REG (BUILDING, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX3_REG on DENISON.REG (HOMEROOM_PRIMARY, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX4_REG on DENISON.REG (STUDENT_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, GRADE, GENERATION, CURRENT_STATUS)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGENTRY
prompt =======================
prompt
create table DENISON.REGENTRY
(
  studentid          NUMBER(10) not null,
  entry_date         DATE not null,
  entry_code         VARCHAR2(3) not null,
  building           NUMBER(10) not null,
  calendar           VARCHAR2(5) not null,
  grade              VARCHAR2(2) not null,
  curriculum         VARCHAR2(2) not null,
  resident           VARCHAR2(1) not null,
  special_ed_percent NUMBER(5) not null,
  with_date          DATE,
  with_code          VARCHAR2(3),
  fld01              VARCHAR2(4),
  fld02              VARCHAR2(2),
  fld03              VARCHAR2(5),
  change_date        DATE,
  change_time        VARCHAR2(8),
  change_uid         VARCHAR2(8),
  r10_loaddate       DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX103_1 on DENISON.REGENTRY (STUDENTID, ENTRY_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.IX_REGENT2 on DENISON.REGENTRY (BUILDING, ENTRY_DATE, STUDENTID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.I_REGENT3 on DENISON.REGENTRY (BUILDING, ENTRY_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table REGTB_BLDG_TYPES
prompt ===============================
prompt
create table DENISON.REGTB_BLDG_TYPES
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REGTB_BLDG_TYPES on DENISON.REGTB_BLDG_TYPES (CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGTB_BUILDING
prompt =============================
prompt
create table DENISON.REGTB_BUILDING
(
  building      NUMBER(10) not null,
  building_name VARCHAR2(25) not null,
  district_num  NUMBER(10),
  street        VARCHAR2(20),
  city          VARCHAR2(20),
  state         VARCHAR2(2),
  zip_code      VARCHAR2(10),
  phone         VARCHAR2(13),
  principal     VARCHAR2(20),
  calendar      VARCHAR2(1) not null,
  building_node VARCHAR2(20),
  dist_updated  DATE,
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX131_1 on DENISON.REGTB_BUILDING (BUILDING)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.IX_BLDG2 on DENISON.REGTB_BUILDING (BUILDING, BUILDING_NAME)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.IX_BLDG3 on DENISON.REGTB_BUILDING (BUILDING_NAME, BUILDING)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table REGTB_ENTRY
prompt ==========================
prompt
create table DENISON.REGTB_ENTRY
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  sif_code         CHAR(5),
  sif2_code        CHAR(5),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REGTB_ENTRY on DENISON.REGTB_ENTRY (CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGTB_ETHNICITY
prompt ==============================
prompt
create table DENISON.REGTB_ETHNICITY
(
  district           NUMBER(10) not null,
  code               CHAR(5) not null,
  description        VARCHAR2(255) not null,
  state_code_equiv   CHAR(10),
  federal_code_equiv CHAR(10),
  active             CHAR(1) not null,
  sif_code           CHAR(5),
  sif2_code          CHAR(5),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REGTB_ETHNICITY on DENISON.REGTB_ETHNICITY (CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGTB_LANGUAGE
prompt =============================
prompt
create table DENISON.REGTB_LANGUAGE
(
  district           NUMBER(10) not null,
  code               CHAR(5) not null,
  description        VARCHAR2(255) not null,
  state_code_equiv   CHAR(10),
  active             CHAR(1) not null,
  alternate_language CHAR(1) not null,
  sif_code           CHAR(5),
  sif2_code          CHAR(5),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REGTB_MEAL_STATUS
prompt ================================
prompt
create table DENISON.REGTB_MEAL_STATUS
(
  code         VARCHAR2(2),
  description  VARCHAR2(20) not null,
  change_date  DATE not null,
  change_time  VARCHAR2(8) not null,
  change_uid   VARCHAR2(8) not null,
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table REGTB_WITHDRAWAL
prompt ===============================
prompt
create table DENISON.REGTB_WITHDRAWAL
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  sif_code         CHAR(5),
  sif2_code        CHAR(5),
  dropout_code     CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REGTB_WITHDRAWAL on DENISON.REGTB_WITHDRAWAL (CODE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_ACADEMIC
prompt ===========================
prompt
create table DENISON.REG_ACADEMIC
(
  district           NUMBER(10) not null,
  student_id         CHAR(10) not null,
  graduation_year    NUMBER(6),
  graduation_date    DATE,
  promotion          CHAR(1),
  curriculum         CHAR(5),
  schd_priority      NUMBER(6),
  graduate_req_group CHAR(5),
  modeled_grad_plan  CHAR(5),
  pending_grad_plan  CHAR(5),
  exp_grad_plan      CHAR(5),
  act_grad_plan      CHAR(5),
  diploma_type       CHAR(5),
  elig_status        CHAR(5),
  elig_reason        VARCHAR2(255),
  elig_effective_dte DATE,
  elig_expires_date  DATE,
  hold_report_card   CHAR(1) not null,
  votec              CHAR(1) not null,
  advisor            CHAR(10),
  disciplinarian     CHAR(50),
  federal_grad_year  CHAR(4),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_ACADEMIC on DENISON.REG_ACADEMIC (DISTRICT, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_ACADEMIC on DENISON.REG_ACADEMIC (STUDENT_ID, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_BUILDING
prompt ===========================
prompt
create table DENISON.REG_BUILDING
(
  district          NUMBER(10) not null,
  building          NUMBER(10) not null,
  name              VARCHAR2(255) not null,
  transfer_building CHAR(1) not null,
  abbreviation      CHAR(10),
  street1           VARCHAR2(255),
  street2           VARCHAR2(255),
  city              VARCHAR2(255),
  state             CHAR(2),
  zip               CHAR(9),
  phone             CHAR(10),
  fax               CHAR(10),
  principal         VARCHAR2(255),
  calendar          CHAR(1),
  building_type     CHAR(5),
  default_zip       CHAR(5),
  state_code_equiv  CHAR(20),
  out_of_district   CHAR(1) not null,
  county_code       CHAR(10),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_BUILDING on DENISON.REG_BUILDING (BUILDING, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_BUILDING_GRADE
prompt =================================
prompt
create table DENISON.REG_BUILDING_GRADE
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_CALENDAR
prompt ===========================
prompt
create table DENISON.REG_CALENDAR
(
  district           NUMBER(10) not null,
  building           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  summer_school      CHAR(1) not null,
  track              CHAR(3) not null,
  calendar           CHAR(1),
  description        VARCHAR2(255),
  def_mem_value      NUMBER(4,3) not null,
  first_day          DATE not null,
  last_day           DATE not null,
  sunday             CHAR(1) not null,
  monday             CHAR(1) not null,
  tuesday            CHAR(1) not null,
  wednesday          CHAR(1) not null,
  thursday           CHAR(1) not null,
  friday             CHAR(1) not null,
  saturday           CHAR(1) not null,
  days_in_cycle      NUMBER(6) not null,
  first_day_cycle    CHAR(1) not null,
  days_in_calendar   NUMBER(6) not null,
  days_in_membership NUMBER(6) not null,
  state_code_equiv   CHAR(10),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_CALENDAR on DENISON.REG_CALENDAR (BUILDING, CALENDAR, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TRACK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_CAL_DAYS
prompt ===========================
prompt
create table DENISON.REG_CAL_DAYS
(
  district          NUMBER(10) not null,
  building          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  track             CHAR(3) not null,
  calendar          CHAR(1),
  cal_date          DATE not null,
  cycle_flag        CHAR(1) not null,
  cycle_code        CHAR(1) not null,
  membership_day    CHAR(1) not null,
  membership_value  NUMBER(4,3) not null,
  take_attendance   CHAR(1) not null,
  include_totals    CHAR(1) not null,
  day_type          CHAR(5),
  day_number        NUMBER(6) not null,
  day_in_membership NUMBER(6) not null,
  alternate_cycle   CHAR(1),
  week_number       NUMBER(6) not null,
  instruct_time     NUMBER(6),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_CAL_DAYS on DENISON.REG_CAL_DAYS (BUILDING, CAL_DATE, CALENDAR, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TRACK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_CAL_DAYS on DENISON.REG_CAL_DAYS (SCHOOL_YEAR, BUILDING, TRACK, CALENDAR, SUMMER_SCHOOL, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_CONTACT
prompt ==========================
prompt
create table DENISON.REG_CONTACT
(
  district           NUMBER(10) not null,
  contact_id         NUMBER(10) not null,
  title              CHAR(5),
  salutation         VARCHAR2(30),
  first_name         VARCHAR2(30) not null,
  middle_name        VARCHAR2(30),
  last_name          VARCHAR2(30) not null,
  generation         CHAR(5),
  language           CHAR(5),
  home_language      CHAR(5),
  use_for_mailing    CHAR(1) not null,
  employer           VARCHAR2(255),
  development        VARCHAR2(255),
  apartment          CHAR(10),
  complex            VARCHAR2(255),
  street_number      CHAR(10),
  street_prefix      CHAR(5),
  street_name        VARCHAR2(255),
  street_suffix      CHAR(5),
  street_type        CHAR(5),
  city               VARCHAR2(255),
  state              CHAR(2),
  zip                CHAR(9),
  plan_area_number   NUMBER(10),
  home_building_type CHAR(5),
  email              VARCHAR2(255),
  email_preference   CHAR(1) not null,
  delivery_point     CHAR(2),
  login_id           VARCHAR2(50),
  web_password       VARCHAR2(50),
  pwd_chg_date_time  DATE,
  last_login_date    DATE,
  education_level    CHAR(5),
  sif_refid          VARCHAR2(32),
  hac_ldap_flag      CHAR(1),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_CONTACT on DENISON.REG_CONTACT (CONTACT_ID, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_CONTACT on DENISON.REG_CONTACT (DISTRICT, LOGIN_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_CONTACT_PHONE
prompt ================================
prompt
create table DENISON.REG_CONTACT_PHONE
(
  district         NUMBER(10) not null,
  contact_id       NUMBER(10) not null,
  phone_type       CHAR(5) not null,
  phone_listing    CHAR(1) not null,
  phone            CHAR(10) not null,
  phone_extension  CHAR(5),
  sif_refid        VARCHAR2(32),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_CONTACT_PHONE on DENISON.REG_CONTACT_PHONE (CONTACT_ID, DISTRICT, PHONE_TYPE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_DISTRICT
prompt ===========================
prompt
create table DENISON.REG_DISTRICT
(
  district                    NUMBER(10) not null,
  name                        VARCHAR2(255) not null,
  validation_only             CHAR(1) not null,
  school_year                 NUMBER(6) not null,
  summer_school_year          NUMBER(6),
  address_format              CHAR(1) not null,
  street1                     VARCHAR2(255),
  street2                     VARCHAR2(255),
  city                        VARCHAR2(255),
  state                       CHAR(2) not null,
  zip                         CHAR(9),
  phone                       CHAR(10),
  superintendent              VARCHAR2(255),
  email                       VARCHAR2(255),
  alphanumeric_ids            CHAR(1) not null,
  student_id_length           NUMBER(6) not null,
  zero_fill_ids               CHAR(1) not null,
  auto_assign                 CHAR(1) not null,
  overide_auto_assgn          CHAR(1) not null,
  starting_id                 NUMBER(16),
  highest_id_used             NUMBER(16),
  show_ssn                    CHAR(1) not null,
  transport_student           CHAR(1) not null,
  st_id_required              CHAR(1) not null,
  st_id_label                 VARCHAR2(30) not null,
  st_id_length                NUMBER(6) not null,
  st_id_enforce_len           CHAR(1) not null,
  change_id_in_prior          CHAR(1) not null,
  id_on_state_report          CHAR(1) not null,
  st_auto_assign              CHAR(1) not null,
  st_id_prefix                CHAR(3),
  st_starting_id              NUMBER(16),
  st_max_id_allowed           NUMBER(16),
  st_highest_id_used          NUMBER(16),
  st_auto_assign_ov           CHAR(1),
  fms_department              CHAR(16),
  fms_home_orgn               CHAR(16),
  fms_program                 CHAR(16),
  aggregate                   NUMBER(10),
  list_max                    NUMBER(10) not null,
  ethnicity_required          CHAR(1) not null,
  use_ethnic_percent          CHAR(1) not null,
  use_dis_dates               CHAR(1) not null,
  use_alert_dates             CHAR(1) not null,
  state_code_equiv            VARCHAR2(20),
  audit_updates               CHAR(1),
  audit_delete_only           CHAR(1),
  audit_clear_int             NUMBER(10),
  language_required           CHAR(1) not null,
  special_ed_table            CHAR(18),
  special_ed_scr_num          NUMBER(6),
  special_ed_column           CHAR(18),
  iepplus_integration         CHAR(1) not null,
  param_key                   CHAR(32),
  crn_from_tac                CHAR(1),
  show_res_bldg               CHAR(1) not null,
  alt_attendance_age          NUMBER(6),
  alt_att_grades              VARCHAR2(255),
  cutoff_date                 DATE,
  ew_membership               CHAR(1) not null,
  use_rank_class_size_exclude CHAR(1) not null,
  include_iep                 CHAR(1) not null,
  include_gifted              CHAR(1) not null,
  include_504                 CHAR(1) not null,
  min_age_citation            NUMBER(6),
  lockout_users               CHAR(1) not null,
  change_date_time            DATE not null,
  change_uid                  VARCHAR2(20) not null,
  r10_loaddate                DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_DISTRICT on DENISON.REG_DISTRICT (DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_ENTRY_WITH
prompt =============================
prompt
create table DENISON.REG_ENTRY_WITH
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  entry_wd_type    CHAR(1) not null,
  school_year      NUMBER(6) not null,
  entry_date       DATE not null,
  entry_code       CHAR(5) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  track            CHAR(3) not null,
  calendar         CHAR(1) not null,
  withdrawal_date  DATE,
  withdrawal_code  CHAR(5),
  comments         CHAR(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_ENTRY_WITH on DENISON.REG_ENTRY_WITH (DISTRICT, ENTRY_DATE, ENTRY_WD_TYPE, SCHOOL_YEAR, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_ENTRY_WITH on DENISON.REG_ENTRY_WITH (STUDENT_ID, SCHOOL_YEAR, ENTRY_WD_TYPE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_ETHNICITY
prompt ============================
prompt
create table DENISON.REG_ETHNICITY
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  ethnic_code      CHAR(5) not null,
  ethnicity_order  NUMBER(6) not null,
  percentage       NUMBER(6),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DENISON.UX_REG_ETHNICITY on DENISON.REG_ETHNICITY (DISTRICT, ETHNIC_CODE, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_MP_DATES
prompt ===========================
prompt
create table DENISON.REG_MP_DATES
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  track            CHAR(3) not null,
  marking_period   CHAR(3) not null,
  start_date       DATE not null,
  end_date         DATE not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_MP_DATES on DENISON.REG_MP_DATES (BUILDING, DISTRICT, MARKING_PERIOD, SCHOOL_YEAR, TRACK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_PERSONAL
prompt ===========================
prompt
create table DENISON.REG_PERSONAL
(
  district           NUMBER(10) not null,
  student_id         CHAR(10) not null,
  ssn                CHAR(9),
  birth_city         VARCHAR2(255),
  birth_state        CHAR(2),
  birth_country      VARCHAR2(255),
  meal_status        CHAR(5),
  classification     CHAR(2),
  locker_number      CHAR(11),
  locker_combination CHAR(255),
  comments           VARCHAR2(255),
  ethnic_code        CHAR(5),
  hispanic           CHAR(1) not null,
  fed_race_ethnic    CHAR(10),
  residency_code     CHAR(5),
  state_report_id    CHAR(32),
  previous_id        CHAR(32),
  previous_id_asof   VARCHAR2(8),
  show_alerts        CHAR(1) not null,
  migrant            CHAR(1) not null,
  at_risk            CHAR(1) not null,
  esl                CHAR(1) not null,
  has_iep            CHAR(1) not null,
  iep_status         CHAR(5),
  section_504_plan   CHAR(1) not null,
  homeless_status    CHAR(5),
  migrant_id         CHAR(20),
  citizen_status     CHAR(5),
  mother_maiden_name VARCHAR2(30),
  fee_status         CHAR(5),
  fee_status_ovr     CHAR(1) not null,
  fee_balance        NUMBER(7,2),
  ferpa_name         CHAR(1) not null,
  ferpa_address      CHAR(1) not null,
  ferpa_phone        CHAR(1) not null,
  ferpa_photo        CHAR(1) not null,
  transfer_bldg_from VARCHAR2(255),
  academic_dis       CHAR(5),
  has_ssp            CHAR(1) not null,
  iep_integration    CHAR(1) not null,
  foster_care        CHAR(1) not null,
  origin_country     CHAR(5),
  ell_years          NUMBER(10),
  immigrant          CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_PERSONAL on DENISON.REG_PERSONAL (DISTRICT, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_PROGRAMS
prompt ===========================
prompt
create table DENISON.REG_PROGRAMS
(
  district          NUMBER(10) not null,
  program_id        CHAR(5) not null,
  field_number      NUMBER(6) not null,
  student_id        CHAR(10) not null,
  start_date        DATE not null,
  summer_school     CHAR(1) not null,
  entry_reason      CHAR(5),
  program_value     VARCHAR2(255) not null,
  end_date          DATE,
  withdrawal_reason CHAR(5),
  program_override  CHAR(1) not null,
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_PROGRAMS on DENISON.REG_PROGRAMS (DISTRICT, FIELD_NUMBER, PROGRAM_ID, START_DATE, STUDENT_ID, SUMMER_SCHOOL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_PROGRAM_COLUMN
prompt =================================
prompt
create table DENISON.REG_PROGRAM_COLUMN
(
  district           NUMBER(10) not null,
  program_id         CHAR(5) not null,
  field_number       NUMBER(6) not null,
  field_order        NUMBER(10) not null,
  field_level        NUMBER(6) not null,
  table_name         CHAR(18),
  screen_number      NUMBER(6),
  column_name        CHAR(18),
  link_dates_to      VARCHAR2(5) not null,
  link_type          VARCHAR2(1) not null,
  label              VARCHAR2(30) not null,
  screen_type        CHAR(1) not null,
  data_type          CHAR(1) not null,
  data_size          NUMBER(6),
  add_default        VARCHAR2(20),
  validation_list    VARCHAR2(255),
  validation_table   CHAR(18),
  code_column        CHAR(18),
  description_column CHAR(18),
  state_code_equiv   CHAR(10),
  use_reasons        CHAR(1),
  use_override       CHAR(1),
  yrend_inactives    CHAR(1) not null,
  inactive_src_reset CHAR(1) not null,
  yrend_actives      CHAR(1) not null,
  active_src_reset   CHAR(1) not null,
  yrend_entry_date   CHAR(1) not null,
  sec_package        CHAR(10),
  sec_subpackage     CHAR(10),
  sec_feature        CHAR(10),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_PROG_COL_NBR on DENISON.REG_PROGRAM_COLUMN (DISTRICT, FIELD_NUMBER, PROGRAM_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_PROG_COL_ORD on DENISON.REG_PROGRAM_COLUMN (DISTRICT, FIELD_ORDER, PROGRAM_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_PROGRAM_USER
prompt ===============================
prompt
create table DENISON.REG_PROGRAM_USER
(
  district         NUMBER(10) not null,
  program_id       CHAR(5) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_PROGRAM_USER on DENISON.REG_PROGRAM_USER (DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, PROGRAM_ID, SCREEN_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_STAFF
prompt ========================
prompt
create table DENISON.REG_STAFF
(
  district         NUMBER(10) not null,
  staff_id         CHAR(10) not null,
  first_name       VARCHAR2(30) not null,
  middle_name      VARCHAR2(30),
  last_name        VARCHAR2(30) not null,
  title_code       CHAR(5),
  email            VARCHAR2(255),
  ssn              CHAR(9),
  fms_department   CHAR(8),
  fms_empl_number  NUMBER(10),
  fms_location     NUMBER(10),
  teacher_load     NUMBER(6),
  login_id         VARCHAR2(20),
  sub_login_id     VARCHAR2(20),
  sub_expiration   DATE,
  gender           CHAR(1),
  prim_ethnic_code CHAR(5),
  hispanic         CHAR(1) not null,
  fed_race_ethnic  CHAR(10),
  birthdate        DATE,
  staff_state_id   VARCHAR2(32),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_STAFF on DENISON.REG_STAFF (DISTRICT, STAFF_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_STAFF on DENISON.REG_STAFF (LOGIN_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_STAFF_BLDGS
prompt ==============================
prompt
create table DENISON.REG_STAFF_BLDGS
(
  district           NUMBER(10) not null,
  building           NUMBER(10) not null,
  staff_id           CHAR(10) not null,
  staff_name         VARCHAR2(25) not null,
  initials           CHAR(3),
  is_counselor       CHAR(1) not null,
  is_teacher         CHAR(1) not null,
  is_advisor         CHAR(1) not null,
  homeroom_primary   CHAR(5),
  homeroom_secondary CHAR(5),
  room               CHAR(5),
  house_team         CHAR(5),
  department         CHAR(5),
  phone              CHAR(10),
  phone_extension    CHAR(5),
  active             CHAR(1) not null,
  is_primary_bldg    CHAR(1),
  group_code         CHAR(10),
  maximum_contiguous NUMBER(6) not null,
  maximum_per_day    NUMBER(6) not null,
  allow_override     CHAR(1) not null,
  regular_year       CHAR(1) not null,
  summer_school      CHAR(1) not null,
  take_lunch_counts  CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_REG_STAFF_BLDGS on DENISON.REG_STAFF_BLDGS (BUILDING, DISTRICT, STAFF_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_REG_STAFF_BLDGS on DENISON.REG_STAFF_BLDGS (HOMEROOM_PRIMARY, HOMEROOM_SECONDARY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_STU_CONTACT
prompt ==============================
prompt
create table DENISON.REG_STU_CONTACT
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  contact_id       NUMBER(10) not null,
  contact_type     CHAR(1) not null,
  contact_priority NUMBER(6) not null,
  relation_code    CHAR(5),
  living_with      CHAR(1) not null,
  web_access       CHAR(1) not null,
  comments         VARCHAR2(255),
  transport_to     CHAR(1) not null,
  transport_from   CHAR(1) not null,
  mail_att         CHAR(1) not null,
  mail_disc        CHAR(1) not null,
  mail_fees        CHAR(1) not null,
  mail_ipr         CHAR(1) not null,
  mail_med         CHAR(1) not null,
  mail_rc          CHAR(1) not null,
  mail_reg         CHAR(1) not null,
  mail_schd        CHAR(1) not null,
  mail_ssp         CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_STU_CONTACT on DENISON.REG_STU_CONTACT (CONTACT_ID, CONTACT_TYPE, DISTRICT, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_USER
prompt =======================
prompt
create table DENISON.REG_USER
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_USER on DENISON.REG_USER (DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, SCREEN_NUMBER, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REG_USER_BUILDING
prompt ================================
prompt
create table DENISON.REG_USER_BUILDING
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_REG_USER_BLDG on DENISON.REG_USER_BUILDING (BUILDING, DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, SCREEN_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REVLEDGR
prompt =======================
prompt
create table DENISON.REVLEDGR
(
  yr           VARCHAR2(2),
  key_orgn     VARCHAR2(16),
  account      VARCHAR2(8),
  bud1         NUMBER(12,2),
  exp1         NUMBER(12,2),
  enc1         NUMBER(12,2),
  bud2         NUMBER(12,2),
  exp2         NUMBER(12,2),
  enc2         NUMBER(12,2),
  bud3         NUMBER(12,2),
  exp3         NUMBER(12,2),
  enc3         NUMBER(12,2),
  bud4         NUMBER(12,2),
  exp4         NUMBER(12,2),
  enc4         NUMBER(12,2),
  bud5         NUMBER(12,2),
  exp5         NUMBER(12,2),
  enc5         NUMBER(12,2),
  bud6         NUMBER(12,2),
  exp6         NUMBER(12,2),
  enc6         NUMBER(12,2),
  bud7         NUMBER(12,2),
  exp7         NUMBER(12,2),
  enc7         NUMBER(12,2),
  bud8         NUMBER(12,2),
  exp8         NUMBER(12,2),
  enc8         NUMBER(12,2),
  bud9         NUMBER(12,2),
  exp9         NUMBER(12,2),
  enc9         NUMBER(12,2),
  bud10        NUMBER(12,2),
  exp10        NUMBER(12,2),
  enc10        NUMBER(12,2),
  bud11        NUMBER(12,2),
  exp11        NUMBER(12,2),
  enc11        NUMBER(12,2),
  bud12        NUMBER(12,2),
  exp12        NUMBER(12,2),
  enc12        NUMBER(12,2),
  bud13        NUMBER(12,2),
  exp13        NUMBER(12,2),
  enc13        NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table SCHD_COURSE
prompt ==========================
prompt
create table DENISON.SCHD_COURSE
(
  district           NUMBER(10) not null,
  building           NUMBER(10) not null,
  course             CHAR(10) not null,
  description        VARCHAR2(30) not null,
  long_description   VARCHAR2(255),
  department         CHAR(5),
  house_team         CHAR(5),
  study_hall         CHAR(1) not null,
  regular_school     CHAR(1) not null,
  summer_school      CHAR(1) not null,
  votec              CHAR(1) not null,
  active_status      CHAR(1) not null,
  simple_tally       CHAR(1) not null,
  conflict_matrix    CHAR(1) not null,
  gender_restriction CHAR(1) not null,
  alternate_course   CHAR(10),
  credit             NUMBER(6,4) not null,
  fee                NUMBER(7,2) not null,
  priority           NUMBER(6) not null,
  semester_weight    NUMBER(6) not null,
  block_type         CHAR(1) not null,
  scan_course        CHAR(1) not null,
  take_attendance    CHAR(1) not null,
  receive_mark       CHAR(1) not null,
  course_level       NUMBER(6),
  subj_area_credit   CHAR(1) not null,
  rec_next_course    CHAR(10),
  request_from_hac   CHAR(1) not null,
  same_teacher       CHAR(1) not null,
  incld_passing_time CHAR(1),
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_COURSE on DENISON.SCHD_COURSE (BUILDING, COURSE, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_COURSES
prompt ===========================
prompt
create table DENISON.SCHD_COURSES
(
  building     NUMBER(10) not null,
  studentid    NUMBER(10) not null,
  course       VARCHAR2(6) not null,
  crs_section  NUMBER(5) not null,
  rsvd_session NUMBER(5) not null,
  schd_status  VARCHAR2(1) not null,
  date_added   DATE not null,
  date_dropped DATE,
  rc_status    VARCHAR2(1),
  rsvd_lock    VARCHAR2(1),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index DENISON.I_CLSSCHD on DENISON.SCHD_COURSES (STUDENTID, DATE_ADDED)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.I_SCHDMAIN on DENISON.SCHD_COURSES (BUILDING, STUDENTID, COURSE, CRS_SECTION, RSVD_SESSION, DATE_ADDED, DATE_DROPPED)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.I_SCHDMNT on DENISON.SCHD_COURSES (BUILDING, COURSE, CRS_SECTION, RSVD_SESSION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.I_SCHEDULES on DENISON.SCHD_COURSES (BUILDING, STUDENTID, COURSE, CRS_SECTION, RSVD_SESSION)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table SCHD_COURSE_BLOCK
prompt ================================
prompt
create table DENISON.SCHD_COURSE_BLOCK
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  block_course     CHAR(10) not null,
  blockette_course CHAR(10) not null,
  same_section     CHAR(1) not null,
  mandatory        CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_CRS_BLOCK on DENISON.SCHD_COURSE_BLOCK (BLOCK_COURSE, BLOCKETTE_COURSE, BUILDING, DISTRICT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_COURSE_DESC
prompt ===============================
prompt
create table DENISON.SCHD_COURSE_DESC
(
  building     NUMBER(10) not null,
  course       VARCHAR2(6) not null,
  desc_number  NUMBER(5) not null,
  line_number  NUMBER(5) not null,
  description  VARCHAR2(78),
  change_date  DATE,
  change_time  VARCHAR2(8),
  change_uid   VARCHAR2(8),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_SCHD_CRS_DESC on DENISON.SCHD_COURSE_DESC (BUILDING, COURSE, DESC_NUMBER, LINE_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table SCHD_COURSE_GRADE
prompt ================================
prompt
create table DENISON.SCHD_COURSE_GRADE
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  course           CHAR(10) not null,
  restrict_grade   CHAR(2) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_CRS_GRADE on DENISON.SCHD_COURSE_GRADE (BUILDING, COURSE, DISTRICT, RESTRICT_GRADE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_COURSE_SETUP
prompt ================================
prompt
create table DENISON.SCHD_COURSE_SETUP
(
  building      NUMBER(10) not null,
  course        VARCHAR2(6) not null,
  description   VARCHAR2(15) not null,
  credit        NUMBER(6,4) not null,
  department    VARCHAR2(2),
  priority      NUMBER(5) not null,
  fee           NUMBER(6,2) not null,
  alternate     VARCHAR2(6),
  matrix_flag   VARCHAR2(1) not null,
  tally_flag    VARCHAR2(1) not null,
  atnd          VARCHAR2(1) not null,
  rc_flag       VARCHAR2(1) not null,
  votec_flag    VARCHAR2(1) not null,
  house_or_team VARCHAR2(2),
  study_hall    VARCHAR2(1) not null,
  grade         VARCHAR2(20),
  display_hac   VARCHAR2(1) not null,
  honor_flag1   VARCHAR2(1) not null,
  honor_flag2   VARCHAR2(1) not null,
  honor_flag3   VARCHAR2(1) not null,
  honor_flag4   VARCHAR2(1) not null,
  hnr_level1    VARCHAR2(1) not null,
  hnr_level2    VARCHAR2(1) not null,
  hnr_level3    VARCHAR2(1) not null,
  hnr_level4    VARCHAR2(1) not null,
  rank_flag1    VARCHAR2(1) not null,
  rank_flag2    VARCHAR2(1) not null,
  rank_flag3    VARCHAR2(1) not null,
  rank_flag4    VARCHAR2(1) not null,
  rank_level1   VARCHAR2(1) not null,
  rank_level2   VARCHAR2(1) not null,
  rank_level3   VARCHAR2(1) not null,
  rank_level4   VARCHAR2(1) not null,
  sem_weight    NUMBER(5) not null,
  subj_area1    VARCHAR2(2),
  subj_area2    VARCHAR2(2),
  subj_area3    VARCHAR2(2),
  multi_area    VARCHAR2(1) not null,
  course_group  VARCHAR2(1),
  fld01         VARCHAR2(15),
  fld02         VARCHAR2(15),
  fld03         VARCHAR2(15),
  fld04         VARCHAR2(15),
  fld05         VARCHAR2(15),
  fld06         VARCHAR2(15),
  fld07         VARCHAR2(15),
  fld08         VARCHAR2(15),
  fld09         VARCHAR2(15),
  fld10         VARCHAR2(15),
  change_date   DATE,
  change_time   VARCHAR2(8),
  change_uid    VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.IX_SCHD_CRS on DENISON.SCHD_COURSE_SETUP (BUILDING, COURSE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table SCHD_COURSE_USER
prompt ===============================
prompt
create table DENISON.SCHD_COURSE_USER
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  course           CHAR(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_CRS_USER on DENISON.SCHD_COURSE_USER (BUILDING, COURSE, DISTRICT, FIELD_NUMBER, SCREEN_NUMBER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS
prompt ======================
prompt
create table DENISON.SCHD_MS
(
  district           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  summer_school      CHAR(1) not null,
  building           NUMBER(10) not null,
  course             CHAR(10) not null,
  course_section     NUMBER(6) not null,
  section_key        NUMBER(10) not null,
  description        VARCHAR2(255) not null,
  study_hall         CHAR(1) not null,
  maximum_seats      NUMBER(6) not null,
  department         CHAR(5),
  votec              CHAR(1) not null,
  fee                NUMBER(7,2) not null,
  gender_restriction CHAR(1) not null,
  block_type         CHAR(1) not null,
  track              CHAR(3) not null,
  duration_type      CHAR(1),
  subj_area_credit   CHAR(1) not null,
  average_type       CHAR(5),
  state_crs_equiv    CHAR(1) not null,
  same_teacher       CHAR(1) not null,
  lock_              CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_BLDG on DENISON.SCHD_MS (BUILDING, COURSE, COURSE_SECTION, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_KEY on DENISON.SCHD_MS (SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_CYCLE
prompt ============================
prompt
create table DENISON.SCHD_MS_CYCLE
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  cycle_code       CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_SCHD_MS_CYCLE on DENISON.SCHD_MS_CYCLE (COURSE_SESSION, CYCLE_CODE, DISTRICT, SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_SCHD_MS_CYCLE on DENISON.SCHD_MS_CYCLE (CYCLE_CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_GRADE
prompt ============================
prompt
create table DENISON.SCHD_MS_GRADE
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  restrict_grade   CHAR(2) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_HOUSE_TEAM
prompt =================================
prompt
create table DENISON.SCHD_MS_HOUSE_TEAM
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  house_team       CHAR(5) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_HSE_TM on DENISON.SCHD_MS_HOUSE_TEAM (DISTRICT, HOUSE_TEAM, SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_MP
prompt =========================
prompt
create table DENISON.SCHD_MS_MP
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  used_seats       NUMBER(6) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_MP on DENISON.SCHD_MS_MP (COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_SCHEDULE
prompt ===============================
prompt
create table DENISON.SCHD_MS_SCHEDULE
(
  district            NUMBER(10) not null,
  school_year         NUMBER(6) not null,
  summer_school       CHAR(1) not null,
  building            NUMBER(10) not null,
  course              CHAR(10) not null,
  course_section      NUMBER(6) not null,
  section_key         NUMBER(10) not null,
  description         VARCHAR2(255) not null,
  study_hall          CHAR(1) not null,
  track               CHAR(3) not null,
  course_session      NUMBER(6) not null,
  session_description VARCHAR2(255) not null,
  start_period        CHAR(5) not null,
  end_period          CHAR(5) not null,
  take_attendance     CHAR(1) not null,
  receive_mark        CHAR(1) not null,
  primary_staff_id    CHAR(10) not null,
  room_id             CHAR(5) not null,
  change_date_time    DATE not null,
  change_uid          VARCHAR2(20) not null,
  r10_loaddate        DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_SCHEDULE on DENISON.SCHD_MS_SCHEDULE (BUILDING, COURSE, COURSE_SECTION, COURSE_SESSION, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_SESSION
prompt ==============================
prompt
create table DENISON.SCHD_MS_SESSION
(
  district           NUMBER(10) not null,
  section_key        NUMBER(10) not null,
  course_session     NUMBER(6) not null,
  description        VARCHAR2(255) not null,
  start_period       CHAR(5) not null,
  end_period         CHAR(5) not null,
  take_attendance    CHAR(1) not null,
  receive_mark       CHAR(1) not null,
  credit             NUMBER(6,4) not null,
  primary_staff_id   CHAR(10) not null,
  room_id            CHAR(5) not null,
  course_level       NUMBER(6),
  incld_passing_time CHAR(1) not null,
  use_focus          CHAR(1) not null,
  change_date_time   DATE not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_SESSION on DENISON.SCHD_MS_SESSION (COURSE_SESSION, DISTRICT, SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_STAFF
prompt ============================
prompt
create table DENISON.SCHD_MS_STAFF
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  staff_id         CHAR(10) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_STAFF on DENISON.SCHD_MS_STAFF (COURSE_SESSION, DISTRICT, SECTION_KEY, STAFF_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_SUBJ
prompt ===========================
prompt
create table DENISON.SCHD_MS_SUBJ
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  subject_area     CHAR(5) not null,
  subj_order       NUMBER(6) not null,
  sub_area         CHAR(5),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_SUBJ_AREA on DENISON.SCHD_MS_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, SUBJECT_AREA)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_SUBJ_ORD on DENISON.SCHD_MS_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, SUBJ_ORDER)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_MS_USER
prompt ===========================
prompt
create table DENISON.SCHD_MS_USER
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_MS_USER on DENISON.SCHD_MS_USER (DISTRICT, FIELD_NUMBER, SCREEN_NUMBER, SECTION_KEY)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_STU_COURSE
prompt ==============================
prompt
create table DENISON.SCHD_STU_COURSE
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  modeled          CHAR(1) not null,
  course_status    CHAR(1) not null,
  model_val_type   CHAR(1) not null,
  retake           CHAR(1) not null,
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX1_SCHD_STU_COURSE on DENISON.SCHD_STU_COURSE (DISTRICT, MODELED, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX2_SCHD_STU_COURSE on DENISON.SCHD_STU_COURSE (SECTION_KEY, DISTRICT, STUDENT_ID, MODELED)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_STU_CRS_DATES
prompt =================================
prompt
create table DENISON.SCHD_STU_CRS_DATES
(
  district          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  section_key       NUMBER(10) not null,
  modeled           CHAR(1) not null,
  date_range_key    NUMBER(10) not null,
  date_added        DATE not null,
  date_dropped      DATE,
  resolved_conflict CHAR(1) not null,
  mr_ungraded       CHAR(1) not null,
  mr_first_mp       CHAR(3),
  mr_last_mp        CHAR(3),
  mr_last_mark_by   CHAR(1),
  from_section_key  NUMBER(10),
  from_range_key    NUMBER(10),
  to_section_key    NUMBER(10),
  to_range_key      NUMBER(10),
  change_date_time  DATE not null,
  change_uid        VARCHAR2(20) not null,
  r10_loaddate      DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_STU_CRS_DT on DENISON.SCHD_STU_CRS_DATES (DATE_RANGE_KEY, DISTRICT, MODELED, SECTION_KEY, STUDENT_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHD_TIMETABLE
prompt =============================
prompt
create table DENISON.SCHD_TIMETABLE
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  summer_school    CHAR(1) not null,
  building         NUMBER(10) not null,
  bell_schd        CHAR(5) not null,
  timeslot         NUMBER(6) not null,
  cycle            CHAR(1) not null,
  start_time       CHAR(5) not null,
  end_time         CHAR(5) not null,
  period           CHAR(5) not null,
  parent_cycle_day CHAR(1),
  change_date_time DATE not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DENISON.IX_SCHD_TIMETABLE on DENISON.SCHD_TIMETABLE (BELL_SCHD, BUILDING, CYCLE, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TIMESLOT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_CFG
prompt ======================
prompt
create table DENISON.SMS_CFG
(
  school_year        VARCHAR2(4) not null,
  retry_limit        NUMBER(5) not null,
  sleep_time         NUMBER(5) not null,
  auto_assign        VARCHAR2(1) not null,
  reg_social         VARCHAR2(1) not null,
  reg_user_screens   NUMBER(5) not null,
  logfile_path       VARCHAR2(60) not null,
  del_with_code      VARCHAR2(3) not null,
  reg_yearend        VARCHAR2(5) not null,
  rank_when          VARCHAR2(1) not null,
  rpt_dir            VARCHAR2(15) not null,
  district_state     VARCHAR2(2) not null,
  state_id_label     VARCHAR2(20) not null,
  state_id_required  VARCHAR2(1) not null,
  state_id_assign    VARCHAR2(1) not null,
  state_id_start     NUMBER(10),
  state_id_stop      NUMBER(10),
  state_id_last_used NUMBER(10),
  state_id_prefix    VARCHAR2(5),
  state_id_upd_allow VARCHAR2(1) not null,
  state_id_length    NUMBER(5),
  state_id_submit    VARCHAR2(1) not null,
  win_image_path     VARCHAR2(256),
  mac_image_path     VARCHAR2(256),
  nix_image_path     VARCHAR2(256),
  use_multi_ethnic   VARCHAR2(1) not null,
  change_date        DATE,
  change_time        VARCHAR2(8),
  change_uid         VARCHAR2(8),
  use_tac            CHAR(1) not null,
  use_hac            CHAR(1) not null,
  r10_loaddate       DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table TRANSACT
prompt =======================
prompt
create table DENISON.TRANSACT
(
  trans_no     NUMBER(10),
  yr           VARCHAR2(2),
  period       VARCHAR2(2),
  t_c          VARCHAR2(2),
  fund         VARCHAR2(8),
  disb_fund    VARCHAR2(8),
  key_orgn     VARCHAR2(16),
  account      VARCHAR2(8),
  project      VARCHAR2(8),
  proj_acct    VARCHAR2(8),
  gl_recv      VARCHAR2(8),
  gl_cash      VARCHAR2(8),
  trans_date   DATE,
  enc_no       VARCHAR2(8),
  je_number    VARCHAR2(8),
  check_no     VARCHAR2(8),
  ck_date      DATE,
  cleared      VARCHAR2(1),
  trans_amt    NUMBER(12,2),
  liquid       NUMBER(12,2),
  vend_no      VARCHAR2(8),
  invoice      VARCHAR2(12),
  p_f          VARCHAR2(1),
  c_1099       VARCHAR2(1),
  cancel       VARCHAR2(1),
  due_date     DATE,
  disc_date    DATE,
  disc_amt     NUMBER(12,2),
  disc_per     NUMBER(8,6),
  reported     VARCHAR2(1),
  description  VARCHAR2(25),
  date_entered DATE,
  operator     VARCHAR2(15),
  batch        VARCHAR2(8),
  je_desc      VARCHAR2(25),
  qty_paid     NUMBER(12,2),
  qty_rec      NUMBER(12,2),
  line_no      NUMBER(5),
  warrant      VARCHAR2(10),
  bnk_code     NUMBER(10),
  sales_tax    NUMBER(12,2),
  use_tax      NUMBER(12,2),
  clear_date   DATE,
  alt_vend_no  NUMBER(10),
  row_id       NUMBER(10),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.TRANS1X on DENISON.TRANSACT (TRANS_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS2X on DENISON.TRANSACT (CHECK_NO, TRANS_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 8M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS3X on DENISON.TRANSACT (YR, PERIOD, DISB_FUND, GL_CASH, CHECK_NO)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1664K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS4X on DENISON.TRANSACT (YR, PERIOD, FUND, KEY_ORGN, ACCOUNT, TRANS_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS5X on DENISON.TRANSACT (YR, PERIOD, PROJECT, ACCOUNT, TRANS_DATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2112K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS6X on DENISON.TRANSACT (VEND_NO, INVOICE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index DENISON.TRANS7X on DENISON.TRANSACT (KEY_ORGN, ACCOUNT)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1984K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create unique index DENISON.TROWIDX on DENISON.TRANSACT (ROW_ID)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table TRANSLEDGR
prompt =========================
prompt
create table DENISON.TRANSLEDGR
(
  yr           VARCHAR2(4),
  keyorgn      VARCHAR2(18),
  account      VARCHAR2(8),
  per          VARCHAR2(7),
  trans_type   VARCHAR2(1),
  bud          NUMBER(12,2),
  exp          NUMBER(12,2),
  enc          NUMBER(12,2),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index DENISON.TRANSLINDX on DENISON.TRANSLEDGR (YR, KEYORGN, ACCOUNT, PER, TRANS_TYPE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating sequence SEQ_STUDENT_GUID
prompt ==================================
prompt
create sequence DENISON.SEQ_STUDENT_GUID
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
nocache;

prompt
prompt Creating view V_FAACCOUNT
prompt =========================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_FAACCOUNT AS
SELECT
Case when substr(acct,1, 1) = 'R'
                then substr(acct,2, length(acct)-1)
                else acct end as ACCT,
SUB_1_ACCT,
SUB_2_ACCT, 
SUB_3_ACCT,
TITLE, 
PROLL_FLG, 
REQPUR_FLG, 
WAR_FLG

FROM FAACCOUNT;

prompt
prompt Creating view V_INFORMIXORGN
prompt ============================
prompt
create or replace force view denison.v_informixorgn as
select x0.yr ,x0.key_orgn ,x0.lvl ,x0.fund ,x0.orgn1 ,x0.orgn2
    ,x0.orgn3 ,x0.orgn4 ,x0.orgn5 ,x0.orgn6 ,x0.orgn7 ,x0.orgn8
    ,x0.orgn9 ,x0.title ,x0.enterprise ,x0.cash ,x0.budget ,x0.req_enc
    ,x0.pr_orgn ,x0.disb_fund ,x0.total_rec ,x0.proj_link ,x0.project
    from faorgn x0 where  1=1;

prompt
prompt Creating view V_PERIODS_BLD1
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_PERIODS_BLD1 AS
SELECT 
TO_CHAR(ABSENCE_DATE, 'YYYY-MM-DD') AS DATE_ID,
STUDENTID AS STU_ID,
LPAD(BUILDING,3, '0') AS LOC_ID,
CASE WHEN OFF_ABS02 IS NOT NULL 
     THEN OFF_ABS02
     ELSE CASE WHEN TEA_ABS02 IS NOT NULL
               THEN TEA_ABS02 END
     END AS PERIOD1,

CASE WHEN OFF_ABS03 IS NOT NULL 
     THEN OFF_ABS03
     ELSE CASE WHEN TEA_ABS03 IS NOT NULL
               THEN TEA_ABS03 END
     END AS PERIOD2,

CASE WHEN OFF_ABS04 IS NOT NULL 
     THEN OFF_ABS04
     ELSE CASE WHEN TEA_ABS04 IS NOT NULL
               THEN TEA_ABS04 END
     END AS PERIOD3,

CASE WHEN OFF_ABS05 IS NOT NULL 
     THEN OFF_ABS05
     ELSE CASE WHEN TEA_ABS05 IS NOT NULL
               THEN TEA_ABS05 END
     END AS PERIOD4,

CASE WHEN OFF_ABS06 IS NOT NULL 
     THEN OFF_ABS06
     ELSE CASE WHEN TEA_ABS06 IS NOT NULL
               THEN TEA_ABS06 END
     END AS PERIOD5,

CASE WHEN OFF_ABS07 IS NOT NULL 
     THEN OFF_ABS07
     ELSE CASE WHEN TEA_ABS07 IS NOT NULL
               THEN TEA_ABS07 END
     END AS PERIOD6,

CASE WHEN OFF_ABS08 IS NOT NULL 
     THEN OFF_ABS08
     ELSE CASE WHEN TEA_ABS08 IS NOT NULL
               THEN TEA_ABS08 END
     END AS PERIOD7,

CASE WHEN OFF_ABS09 IS NOT NULL 
     THEN OFF_ABS09
     ELSE CASE WHEN TEA_ABS09 IS NOT NULL
               THEN TEA_ABS09 END
     END AS PERIOD8,

CASE WHEN OFF_ABS10 IS NOT NULL 
     THEN OFF_ABS10
     ELSE CASE WHEN TEA_ABS10 IS NOT NULL
               THEN TEA_ABS10 END
     END AS PERIOD9,

CASE WHEN OFF_ABS11 IS NOT NULL 
     THEN OFF_ABS11
     ELSE CASE WHEN TEA_ABS11 IS NOT NULL
               THEN TEA_ABS11 END
     END AS PERIOD10

FROM CLS_ATND 
WHERE BUILDING='1';

prompt
prompt Creating view V_PERIODS_BLD41
prompt =============================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_PERIODS_BLD41 AS
SELECT 
TO_CHAR(ABSENCE_DATE, 'YYYY-MM-DD') AS DATE_ID,
STUDENTID AS STU_ID,
LPAD(BUILDING,3, '0') AS LOC_ID,
CASE WHEN OFF_ABS01 IS NOT NULL 
     THEN OFF_ABS01
     ELSE CASE WHEN TEA_ABS01 IS NOT NULL
               THEN TEA_ABS01 END
     END AS PERIOD1,

CASE WHEN OFF_ABS02 IS NOT NULL 
     THEN OFF_ABS02
     ELSE CASE WHEN TEA_ABS02 IS NOT NULL
               THEN TEA_ABS02 END
     END AS PERIOD2,

CASE WHEN OFF_ABS03 IS NOT NULL 
     THEN OFF_ABS03
     ELSE CASE WHEN TEA_ABS03 IS NOT NULL
               THEN TEA_ABS03 END
     END AS PERIOD3,

CASE WHEN OFF_ABS04 IS NOT NULL 
     THEN OFF_ABS04
     ELSE CASE WHEN TEA_ABS04 IS NOT NULL
               THEN TEA_ABS04 END
     END AS PERIOD4,

CASE WHEN OFF_ABS05 IS NOT NULL 
     THEN OFF_ABS05
     ELSE CASE WHEN TEA_ABS05 IS NOT NULL
               THEN TEA_ABS05 END
     END AS PERIOD5,

CASE WHEN OFF_ABS06 IS NOT NULL 
     THEN OFF_ABS06
     ELSE CASE WHEN TEA_ABS06 IS NOT NULL
               THEN TEA_ABS06 END
     END AS PERIOD6,

CASE WHEN OFF_ABS07 IS NOT NULL 
     THEN OFF_ABS07
     ELSE CASE WHEN TEA_ABS07 IS NOT NULL
               THEN TEA_ABS07 END
     END AS PERIOD7,

CASE WHEN OFF_ABS08 IS NOT NULL 
     THEN OFF_ABS08
     ELSE CASE WHEN TEA_ABS08 IS NOT NULL
               THEN TEA_ABS08 END
     END AS PERIOD8,

CASE WHEN OFF_ABS09 IS NOT NULL 
     THEN OFF_ABS09
     ELSE CASE WHEN TEA_ABS09 IS NOT NULL
               THEN TEA_ABS09 END
     END AS PERIOD9,

CASE WHEN OFF_ABS10 IS NOT NULL 
     THEN OFF_ABS10
     ELSE CASE WHEN TEA_ABS10 IS NOT NULL
               THEN TEA_ABS10 END
     END AS PERIOD10

FROM CLS_ATND 
WHERE BUILDING='41';

prompt
prompt Creating view V_RCSEM_SEM2
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_RCSEM_SEM2 AS
SELECT 
studentid||'*'||mp_sem_num||'*'||building||'*'||grade as studentkey,
studentid,
school_year,
MP_SEM_NUM,
sem.cum_o_gpa1 as stu_cumulative_gpa,
sem.cum_o_gpa2   as stu_cumulative_gpa_2,
sem.cum_o_gpa3  as stu_cumulative_gpa_3,
sem.cum_o_gpa4   as stu_cumulative_gpa_4,
sem.cum_o_rnk1 as stu_class_rank,
sem.cum_o_rnk2  as stu_class_rank_2,
sem.cum_o_rnk3  as stu_class_rank_3,
sem.cum_o_rnk4  as stu_class_rank_4,
sem.cum_t_attcr as stu_credits_atmptd,
sem.cum_t_erncr as stu_credits_ernd

FROM rc_sem sem
WHERE MP_SEM_NUM ='2'
and school_year='2010'
--and cum_t_attcr <>'0'
;

prompt
prompt Creating view V_RCSEM_SEM1
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_RCSEM_SEM1 AS
SELECT 
studentid||'*'||mp_sem_num||'*'||building||'*'||grade as studentkey,
studentid,
school_year,
MP_SEM_NUM,
sem.cum_o_gpa1 as stu_cumulative_gpa,
sem.cum_o_gpa2   as stu_cumulative_gpa_2,
sem.cum_o_gpa3  as stu_cumulative_gpa_3,
sem.cum_o_gpa4   as stu_cumulative_gpa_4,
sem.cum_o_rnk1 as stu_class_rank,
sem.cum_o_rnk2  as stu_class_rank_2,
sem.cum_o_rnk3  as stu_class_rank_3,
sem.cum_o_rnk4  as stu_class_rank_4,
sem.cum_t_attcr as stu_credits_atmptd,
sem.cum_t_erncr as stu_credits_ernd

FROM rc_sem sem
WHERE MP_SEM_NUM ='1'
and school_year='2010'
--and cum_t_attcr <>'0'
and studentid not in(select studentid from V_RCSEM_SEM2)
;

prompt
prompt Creating view V_RCSEM_SEM1AND2
prompt ==============================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_RCSEM_SEM1AND2 AS
SELECT "STUDENTKEY","STUDENTID","SCHOOL_YEAR","MP_SEM_NUM","STU_CUMULATIVE_GPA","STU_CUMULATIVE_GPA_2","STU_CUMULATIVE_GPA_3","STU_CUMULATIVE_GPA_4","STU_CLASS_RANK","STU_CLASS_RANK_2","STU_CLASS_RANK_3","STU_CLASS_RANK_4","STU_CREDITS_ATMPTD","STU_CREDITS_ERND" FROM V_RCSEM_SEM1

UNION ALL

SELECT "STUDENTKEY","STUDENTID","SCHOOL_YEAR","MP_SEM_NUM","STU_CUMULATIVE_GPA","STU_CUMULATIVE_GPA_2","STU_CUMULATIVE_GPA_3","STU_CUMULATIVE_GPA_4","STU_CLASS_RANK","STU_CLASS_RANK_2","STU_CLASS_RANK_3","STU_CLASS_RANK_4","STU_CREDITS_ATMPTD","STU_CREDITS_ERND" FROM V_RCSEM_SEM2;

prompt
prompt Creating view V_REGENTRY
prompt ========================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_REGENTRY AS
SELECT STUDENTID,BUILDING,GRADE,ENTRY_DATE, 
WITH_DATE,CALENDAR,WITH_CODE,rank FROM (SELECT STUDENTID,BUILDING,GRADE,ENTRY_DATE, 
WITH_DATE,CALENDAR,WITH_CODE,
RANK() OVER (PARTITION BY STUDENTID,building ORDER BY ENTRY_DATE ASC,building asc) AS RANK
FROM REGENTRY WHERE CALENDAR LIKE '2010%')
where rank='1';

prompt
prompt Creating view V_REGENTRY_ENROLL
prompt ===============================
prompt
create or replace force view denison.v_regentry_enroll as
select 
studentid as studentid,
to_char(entry_date, 'yyyy-mm-dd') as startdate,
 case when with_date is null
      then to_char(sysdate, 'yyyy-mm-dd')
--     then '2008-10-31'
--then to_char(to_date('20090612', 'yyyy-mm-dd'),'yyyy-mm-dd') 
      else to_char(with_date, 'yyyy-mm-dd')
end as lastday,
building,
rank() over(partition by studentid order by entry_date desc,building desc) as ranktrans

from
regentry

where substr(calendar,1,4)='2010'
and length(building)<4
;

prompt
prompt Creating view V_REVLEDGR
prompt ========================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_REVLEDGR AS
SELECT YR, 
KEY_ORGN,
Case when substr(account,1, 1) = 'R'
                then substr(account,2, length(account)-1)
                else account end as ACCOUNT,
BUD1,
EXP1,
ENC1, 
BUD2, 
EXP2, 
ENC2, 
BUD3,
EXP3,
ENC3, 
BUD4, 
EXP4,
ENC4,
BUD5, 
EXP5,
 ENC5,
 BUD6,
 EXP6, 
ENC6, 
BUD7, 
EXP7, 
ENC7, 
BUD8, 
EXP8, 
ENC8,
BUD9,
EXP9, 
ENC9,
BUD10,
EXP10,
ENC10, 
BUD11, 
EXP11, 
ENC11, 
BUD12,
EXP12, 
ENC12,
BUD13,
EXP13,
ENC13

FROM REVLEDGR

WHERE yr='09';

prompt
prompt Creating view V_STU_DIM_PROG_STUDENT
prompt ====================================
prompt
CREATE OR REPLACE FORCE VIEW DENISON.V_STU_DIM_PROG_STUDENT AS
SELECT studentid
       ,DECODE(SUM(STU_HOMELESS), 0, NULL, 'Y') STU_HOMELESS
       ,DECODE(SUM(STU_SINGLE_PARENT), 0, NULL, 'Y')STU_SINGLE_PARENT
       ,DECODE(SUM(STU_IS_AT_RISK), 0, NULL, 'Y') STU_IS_AT_RISK
       ,DECODE(SUM(STU_PRIMARY_ESE_CD ), 0, NULL, 'Y') STU_PRIMARY_ESE_CD 
       ,DECODE(SUM(STU_IS_MIGRANT), 0, NULL, 'Y') STU_IS_MIGRANT
       ,DECODE(SUM(STU_IS_IMMIGRANT), 0, NULL, 'Y') STU_IS_IMMIGRANT 
       ,DECODE(SUM(STU_LEP_CODE), 0, NULL, 'Y') STU_LEP_CODE
       ,DECODE(SUM(STU_IS_TAG), 0, NULL, 'Y') STU_IS_TAG FROM (SELECT studentid
       ,DECODE(element_serial, 17, 1, 0) STU_HOMELESS
       ,DECODE(element_serial, 49, 1, 0) STU_SINGLE_PARENT      
       ,DECODE(element_serial, 7, 1, 0) STU_IS_AT_RISK
       ,DECODE(element_serial, 9, 1, 0) STU_PRIMARY_ESE_CD      
       ,DECODE(element_serial, 3, 1, 0) STU_IS_MIGRANT
       ,DECODE(ELEMENT_SERIAL,14, 1, 0) STU_IS_IMMIGRANT
       ,DECODE(element_serial, 5, 1, 0)STU_LEP_CODE      
       ,DECODE(element_serial, 12, 1, 0) STU_IS_TAG FROM prog_student
        where element_serial = any('3','5','7','9','49','17','12','14')
        and with_date >= to_date('08242009', 'mm/dd/yyyy') or WITH_DATE is null )GROUP
BY studentid;


spool off
