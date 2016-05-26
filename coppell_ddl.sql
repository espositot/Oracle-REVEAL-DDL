-----------------------------------------------------------
-- Export file for user COPPELL@DATAWH                   --
-- Created by espositot on 5/26/2016, 15:25:49 15:25:49  --
-----------------------------------------------------------

set define off
spool coppell_ddl.log

prompt
prompt Creating table ATT_BOTTOMLINE
prompt =============================
prompt
create table COPPELL.ATT_BOTTOMLINE
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  building          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  attendance_date   VARCHAR2(8) not null,
  attendance_period CHAR(5) not null,
  sequence_num      NUMBER(6) not null,
  source            CHAR(1) not null,
  attendance_code   CHAR(5) not null,
  dismiss_time      CHAR(5),
  arrive_time       CHAR(5),
  minutes_absent    NUMBER(6) not null,
  att_comment       VARCHAR2(255),
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_ATT_BOTTOMLINE on COPPELL.ATT_BOTTOMLINE (STUDENT_ID, ATTENDANCE_DATE, ATTENDANCE_PERIOD, ATTENDANCE_CODE)
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
create index COPPELL.IX2_ATT_BOTTOMLINE on COPPELL.ATT_BOTTOMLINE (SCHOOL_YEAR, BUILDING, SUMMER_SCHOOL, DISTRICT)
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
prompt Creating table ATT_CFG_PERIODS
prompt ==============================
prompt
create table COPPELL.ATT_CFG_PERIODS
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  building          NUMBER(10) not null,
  attendance_period CHAR(5) not null,
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table ATT_CODE
prompt =======================
prompt
create table COPPELL.ATT_CODE
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
  change_date_time    VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table ATT_STU_DAY_MEMB
prompt ===============================
prompt
create table COPPELL.ATT_STU_DAY_MEMB
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  student_id       CHAR(10) not null,
  membership_date  VARCHAR2(8) not null,
  membership_value NUMBER(4,3) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  calendar         CHAR(1) not null,
  track            CHAR(3) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_ATT_STU_DAY_MEMB on COPPELL.ATT_STU_DAY_MEMB (BUILDING, STUDENT_ID)
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
prompt Creating table ATT_STU_DAY_TOTALS
prompt =================================
prompt
create table COPPELL.ATT_STU_DAY_TOTALS
(
  district          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  building          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  attendance_date   VARCHAR2(8) not null,
  view_type         CHAR(5) not null,
  criteria          NUMBER(6) not null,
  attendance_code   CHAR(5) not null,
  att_code_value    NUMBER(5,2) not null,
  total_day_time    NUMBER(6) not null,
  student_schd_time NUMBER(6) not null,
  stu_unschd_time   NUMBER(6),
  present_time      NUMBER(6) not null,
  absent_time       NUMBER(6) not null,
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_ATT_STU_DAY_TOT on COPPELL.ATT_STU_DAY_TOTALS (STUDENT_ID, ATTENDANCE_DATE, SCHOOL_YEAR, BUILDING, DISTRICT)
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
create table COPPELL.DISCTB_LOCATION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table DISCTB_OFF_ACTION
prompt ================================
prompt
create table COPPELL.DISCTB_OFF_ACTION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  level_number     NUMBER(6),
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE,
  severity_level   NUMBER(2)
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
  )
nologging;

prompt
prompt Creating table DISCTB_VIC_ACTION
prompt ================================
prompt
create table COPPELL.DISCTB_VIC_ACTION
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table DISC_INCIDENT
prompt ============================
prompt
create table COPPELL.DISC_INCIDENT
(
  district            NUMBER(10) not null,
  school_year         NUMBER(6) not null,
  summer_school       CHAR(1) not null,
  building            NUMBER(10) not null,
  incident_id         NUMBER(10) not null,
  incident_code       CHAR(5) not null,
  incident_subcode    CHAR(5),
  incident_date       VARCHAR2(8) not null,
  incident_time       CHAR(5),
  location            CHAR(5),
  is_student          CHAR(1) not null,
  person_id           CHAR(10) not null,
  reported_to         CHAR(5),
  gang_related        CHAR(1) not null,
  police_notified     CHAR(1) not null,
  police_notify_date  VARCHAR2(8),
  police_department   VARCHAR2(255),
  complaint_number    CHAR(10),
  officer_name        VARCHAR2(100),
  badge_number        CHAR(10),
  comments            VARCHAR2(1024),
  incident_guid       VARCHAR2(32) not null,
  change_date_time    VARCHAR2(8) not null,
  change_uid          VARCHAR2(20) not null,
  r10_loaddate        DATE,
  incident_locked     CHAR(1),
  incident_time_frame CHAR(10)
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
  )
nologging;

prompt
prompt Creating table DISC_INCIDENT_CODE
prompt =================================
prompt
create table COPPELL.DISC_INCIDENT_CODE
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  level_min        NUMBER(6),
  level_max        NUMBER(6),
  state_code_equiv CHAR(10),
  severity_order   NUMBER(6),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table DISC_OFFENDER
prompt ============================
prompt
create table COPPELL.DISC_OFFENDER
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
  notify_date        VARCHAR2(8),
  how_notified       CHAR(5),
  referred_to        CHAR(5),
  police_action      CHAR(5),
  charges_filed_by   VARCHAR2(100),
  charges_filed_with VARCHAR2(100),
  change_date_time   VARCHAR2(8) not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE,
  resp_admin         VARCHAR2(50)
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
  )
nologging;

prompt
prompt Creating table DISC_OFF_ACTION
prompt ==============================
prompt
create table COPPELL.DISC_OFF_ACTION
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
  start_date         VARCHAR2(8),
  end_date           VARCHAR2(8),
  total_occurrences  NUMBER(5,2),
  resp_building      NUMBER(10),
  date_determined    VARCHAR2(8),
  action_outcome     CHAR(5),
  yearend_carry_over CHAR(1) not null,
  change_date_time   VARCHAR2(8) not null,
  change_uid         VARCHAR2(20) not null,
  r10_loaddate       DATE,
  assign_building    NUMBER(10)
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
  )
nologging;
create index COPPELL.IX_DISC_OFF_ACTION on COPPELL.DISC_OFF_ACTION (ACTION_NUMBER, DISTRICT, INCIDENT_ID, OFFENDER)
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
prompt Creating table DISC_VICTIM
prompt ==========================
prompt
create table COPPELL.DISC_VICTIM
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
  notify_date       VARCHAR2(8),
  how_notified      CHAR(5),
  referred_to       CHAR(5),
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_DISC_VICTIM on COPPELL.DISC_VICTIM (DISTRICT, INCIDENT_ID, VICTIM)
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
prompt Creating table DISC_VICTIM_ACTION
prompt =================================
prompt
create table COPPELL.DISC_VICTIM_ACTION
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
  start_date       VARCHAR2(8),
  end_date         VARCHAR2(8),
  resp_building    NUMBER(10),
  date_determined  VARCHAR2(8),
  action_outcome   CHAR(5),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_DISC_VICTIM_ACT on COPPELL.DISC_VICTIM_ACTION (ACTION_NUMBER, DISTRICT, INCIDENT_ID, VICTIM)
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
prompt Creating table ETL_SOURCE_DISTRICT
prompt ==================================
prompt
create table COPPELL.ETL_SOURCE_DISTRICT
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
prompt Creating table GLS_ACCT_PARM_DEF
prompt ================================
prompt
create table COPPELL.GLS_ACCT_PARM_DEF
(
  code_id       NUMBER(10) not null,
  code          VARCHAR2(50) not null,
  acc_part_id   NUMBER(2) not null,
  ldesc         VARCHAR2(50),
  sdesc         VARCHAR2(15),
  parentcode_id NUMBER(10),
  detailcode    VARCHAR2(1) not null,
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
create index COPPELL.IX_GLS_ACCT_PARM_DEF_CODE on COPPELL.GLS_ACCT_PARM_DEF (CODE)
  tablespace DW_DEFAULT02
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
create bitmap index COPPELL.UX_GLS_ACCT_PARM_DEF_ACC_PART on COPPELL.GLS_ACCT_PARM_DEF (ACC_PART_ID)
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
  )
  nologging;

prompt
prompt Creating table GLS_TRANSACTIONS
prompt ===============================
prompt
create table COPPELL.GLS_TRANSACTIONS
(
  tran_id             NUMBER(10),
  journal             VARCHAR2(5),
  jrnl_date           VARCHAR2(8),
  post_date           VARCHAR2(8),
  source              VARCHAR2(15),
  type                VARCHAR2(15),
  reference           VARCHAR2(25),
  journal_description VARCHAR2(50),
  username            VARCHAR2(50),
  jrnl_ctr            NUMBER(10),
  account             VARCHAR2(50),
  ledger              VARCHAR2(4),
  debit_amount        NUMBER(15,4),
  credit_amount       NUMBER(15,4),
  comments            VARCHAR2(50),
  fund_comp           VARCHAR2(101),
  fund_desc           VARCHAR2(50),
  fund_code           VARCHAR2(50),
  fcn                 VARCHAR2(50),
  obj                 VARCHAR2(50),
  sub_obj             VARCHAR2(50),
  org                 VARCHAR2(50),
  fy                  VARCHAR2(50),
  progint             VARCHAR2(50),
  local1              VARCHAR2(50),
  local2              VARCHAR2(50),
  fund_id             NUMBER(6),
  acct_id             NUMBER(10),
  ledger_def          NUMBER(6),
  link_id             NUMBER(10),
  r10_loaddate        DATE
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
create index COPPELL.IX_GLS_TRAN_FULL on COPPELL.GLS_TRANSACTIONS (JRNL_DATE, TYPE, LEDGER)
  tablespace DW_DEFAULT02
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
prompt Creating table HRS_EMPLOYEE_DATA
prompt ================================
prompt
create table COPPELL.HRS_EMPLOYEE_DATA
(
  employeedataid           NUMBER(10) not null,
  personid                 NUMBER(10) not null,
  emp_classification       NUMBER(10),
  staff_type               NUMBER(10),
  releaseinfo              VARCHAR2(1) not null,
  hiredate                 VARCHAR2(8),
  termstatus               VARCHAR2(1) not null,
  termdate                 VARCHAR2(8),
  termreason               NUMBER(10),
  termcomment              VARCHAR2(255),
  substatus                CHAR(1),
  sub_comment              VARCHAR2(255),
  emp_department           NUMBER(10),
  trs_retired_tch          VARCHAR2(1) not null,
  on_personnel_roster      VARCHAR2(1) not null,
  certified_tch            VARCHAR2(1) not null,
  classroom_tch            VARCHAR2(1) not null,
  on_peims                 VARCHAR2(1) not null,
  peims_revision           VARCHAR2(1) not null,
  primary_locationid       NUMBER(10),
  cur_assignment_date      VARCHAR2(8),
  badgenumber              VARCHAR2(15),
  trs_retireddate          VARCHAR2(8),
  disbursement_location_id NUMBER(10),
  emp_status               CHAR(1),
  username                 VARCHAR2(50),
  email_pay_notification   VARCHAR2(1) not null,
  fsp_staff_pos            NUMBER(10),
  highlyqualified          VARCHAR2(1) not null,
  r10_loaddate             DATE
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
  )
nologging;
create index COPPELL.IX_HRS_EMPLOYEE_DATA on COPPELL.HRS_EMPLOYEE_DATA (EMPLOYEEDATAID)
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
prompt Creating table HRS_EMPLOYMENTEXP
prompt ================================
prompt
create table COPPELL.HRS_EMPLOYMENTEXP
(
  empexpid     NUMBER(10) not null,
  personid     NUMBER(10) not null,
  exptypeid    NUMBER(10) not null,
  expdate      VARCHAR2(8),
  internal     NUMBER(1) not null,
  earnedyears  NUMBER(5,2) not null,
  awardedyears NUMBER(5,2),
  emprecid     NUMBER(10),
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
  )
nologging;
create index COPPELL.IX_HRS_EMPLOYMENTEXP on COPPELL.HRS_EMPLOYMENTEXP (EMPEXPID)
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
prompt Creating table HRS_EMPLOYMENT_RECORD
prompt ====================================
prompt
create table COPPELL.HRS_EMPLOYMENT_RECORD
(
  emprecid             NUMBER(10) not null,
  personid             NUMBER(10) not null,
  begindate            VARCHAR2(8) not null,
  enddate              VARCHAR2(8) not null,
  wghtavgdlyrate       NUMBER(19,6),
  exempt_employee      VARCHAR2(1) not null,
  eeoc_assignment_code NUMBER(10),
  servrec_fiscalyr     NUMBER(6),
  servrec_posid        NUMBER(10),
  servrec_exptypeid    NUMBER(10),
  servrec_percentemp   NUMBER(18,4),
  totaldaysofservice   NUMBER(6),
  servrec_step         NUMBER(6),
  peims_year           NUMBER(6),
  locked               VARCHAR2(1) not null,
  budget               VARCHAR2(1) not null,
  contractyear         NUMBER(6) not null,
  scenarioapplied      VARCHAR2(1) not null,
  r10_loaddate         DATE
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
  )
nologging;
create index COPPELL.IX_HRS_EMPLOYMENT_RECORD on COPPELL.HRS_EMPLOYMENT_RECORD (EMPRECID)
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
prompt Creating table HRS_EMPLOYMENT_ROLE
prompt ==================================
prompt
create table COPPELL.HRS_EMPLOYMENT_ROLE
(
  emproleid      NUMBER(10) not null,
  emprecid       NUMBER(10) not null,
  ldesc          VARCHAR2(50) not null,
  begindate      VARCHAR2(8) not null,
  enddate        VARCHAR2(8) not null,
  contracttypeid NUMBER(10),
  contractedrole VARCHAR2(1) not null,
  nbrhrsperday   NUMBER(4,2),
  worktimes      VARCHAR2(100),
  payrollid      NUMBER(6) not null,
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
  )
nologging;
create index COPPELL.IX_HRS_EMPLOYMENT_ROLE on COPPELL.HRS_EMPLOYMENT_ROLE (EMPROLEID)
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
prompt Creating table HRS_PERSON
prompt =========================
prompt
create table COPPELL.HRS_PERSON
(
  personid         NUMBER(10) not null,
  lastname         VARCHAR2(50) not null,
  firstname        VARCHAR2(50) not null,
  middlename       VARCHAR2(50),
  aka              VARCHAR2(50),
  generationcodeid NUMBER(10),
  type             CHAR(1) not null,
  webaddress       VARCHAR2(100),
  email            VARCHAR2(100),
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
  )
nologging;
create index COPPELL.IX_HRS_PERSON on COPPELL.HRS_PERSON (PERSONID)
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
prompt Creating table HRS_PERSONADDRESS
prompt ================================
prompt
create table COPPELL.HRS_PERSONADDRESS
(
  addressid       NUMBER(10) not null,
  personid        NUMBER(10) not null,
  address         VARCHAR2(255),
  city            VARCHAR2(30),
  state           CHAR(2),
  zip             VARCHAR2(10),
  country         VARCHAR2(25),
  addresstypeid   NUMBER(10) not null,
  comments        VARCHAR2(255),
  primary_address VARCHAR2(1) not null,
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
  )
nologging;
create index COPPELL.IX_HRS_PERSONADDRESS on COPPELL.HRS_PERSONADDRESS (ADDRESSID)
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
prompt Creating table HRS_PERSONCONTACT
prompt ================================
prompt
create table COPPELL.HRS_PERSONCONTACT
(
  contactid       NUMBER(10) not null,
  personid        NUMBER(10) not null,
  contacttypeid   NUMBER(10) not null,
  contactpersonid NUMBER(10) not null,
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
  )
nologging;
create index COPPELL.IX_HRS_PERSONCONTACT on COPPELL.HRS_PERSONCONTACT (CONTACTID)
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
prompt Creating table HRS_PERSONPHONE
prompt ==============================
prompt
create table COPPELL.HRS_PERSONPHONE
(
  phoneid      NUMBER(10) not null,
  personid     NUMBER(10) not null,
  typeid       NUMBER(6) not null,
  phonenumber  VARCHAR2(20) not null,
  unlisted     VARCHAR2(1) not null,
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
  )
nologging;
create index COPPELL.IX_HRS_PERSONPHONE on COPPELL.HRS_PERSONPHONE (PHONEID)
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
prompt Creating table HRS_PERSON_DATA
prompt ==============================
prompt
create table COPPELL.HRS_PERSON_DATA
(
  persondataid      NUMBER(10) not null,
  personid          NUMBER(10) not null,
  gender            CHAR(1) not null,
  ssn               CHAR(9),
  prior_ssn         CHAR(9),
  dob               VARCHAR2(8),
  pob               VARCHAR2(30),
  ethnicid          NUMBER(10),
  maritalstatus     CHAR(1),
  militarybranch    VARCHAR2(50),
  militaryrank      VARCHAR2(50),
  reserves          CHAR(1) not null,
  previousname      VARCHAR2(100),
  uscitizen         CHAR(1) not null,
  noncitizendocnum  VARCHAR2(50),
  handicapflag      CHAR(1) not null,
  handicapcondition NUMBER(10),
  handicapneeds     VARCHAR2(255),
  handicapcomments  VARCHAR2(255),
  employee          CHAR(1) not null,
  comments          VARCHAR2(255),
  highestdegree     NUMBER(10),
  ethnicity         NUMBER,
  americanindian    VARCHAR2(1),
  asian             VARCHAR2(1),
  africanamerican   VARCHAR2(1),
  hawaiian          VARCHAR2(1),
  white             VARCHAR2(1),
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
  )
nologging;
create index COPPELL.IX_HRS_PERSON_DATA on COPPELL.HRS_PERSON_DATA (PERSONDATAID)
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
prompt Creating table MEDTB_SHOT
prompt =========================
prompt
create table COPPELL.MEDTB_SHOT
(
  district         NUMBER(10) not null,
  code             CHAR(10) not null,
  description      VARCHAR2(255) not null,
  shot_order       NUMBER(6) not null,
  auto_generate    CHAR(1) not null,
  live_virus       CHAR(1) not null,
  shot_requirement CHAR(25),
  series_flag      CHAR(1) not null,
  licensing_date   VARCHAR2(8) not null,
  state_code_equiv VARCHAR2(10),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MEDTB_SHOT on COPPELL.MEDTB_SHOT (CODE, DISTRICT)
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
prompt Creating table MED_SERIES
prompt =========================
prompt
create table COPPELL.MED_SERIES
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  series_code      CHAR(10) not null,
  series_exemption CHAR(10),
  total_doses      NUMBER(6) not null,
  series_status    CHAR(2),
  calc_date        VARCHAR2(8),
  override         CHAR(1) not null,
  comments         VARCHAR2(64),
  number_letters   NUMBER(6) not null,
  had_disease      CHAR(1) not null,
  disease_date     VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MED_SERIES on COPPELL.MED_SERIES (DISTRICT, SERIES_CODE, STUDENT_ID)
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
prompt Creating table MED_SERIES_DET
prompt =============================
prompt
create table COPPELL.MED_SERIES_DET
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  series_code      CHAR(10) not null,
  series_date      VARCHAR2(8) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MED_SERIES_DET on COPPELL.MED_SERIES_DET (DISTRICT, SERIES_CODE, SERIES_DATE, STUDENT_ID)
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
prompt Creating table MED_SHOT_DET
prompt ===========================
prompt
create table COPPELL.MED_SHOT_DET
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  shot_code        CHAR(10) not null,
  shot_date        VARCHAR2(8) not null,
  shot_order       NUMBER(10) not null,
  source_doc       CHAR(10),
  signed_doc       CHAR(1) not null,
  warning_status   CHAR(2),
  override         CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MED_SHOT_DET on COPPELL.MED_SHOT_DET (DISTRICT, SHOT_CODE, SHOT_DATE, STUDENT_ID)
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
prompt Creating table MR_COMMENTS
prompt ==========================
prompt
create table COPPELL.MR_COMMENTS
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  code             CHAR(5) not null,
  ipr_usage        CHAR(1) not null,
  sc_usage         CHAR(1) not null,
  rc_usage         CHAR(1) not null,
  description      VARCHAR2(255) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_COMMENTS on COPPELL.MR_COMMENTS (BUILDING, CODE, DISTRICT)
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
prompt Creating table MR_COMMENT_TYPES
prompt ===============================
prompt
create table COPPELL.MR_COMMENT_TYPES
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
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_COMMNT_TYPES on COPPELL.MR_COMMENT_TYPES (BUILDING, COMMENT_TYPE, DISTRICT)
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
create index COPPELL.IX2_MR_COMMNT_TYPES on COPPELL.MR_COMMENT_TYPES (BUILDING, COMMENT_ORDER, DISTRICT)
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
prompt Creating table MR_CRSEQU_DET
prompt ============================
prompt
create table COPPELL.MR_CRSEQU_DET
(
  district         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  building         NUMBER(10) not null,
  state_id         CHAR(10) not null,
  course           CHAR(10) not null,
  course_section   NUMBER(6) not null,
  equiv_parts      NUMBER(6) not null,
  equiv_sequence   NUMBER(6) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_CRSEQU_DET on COPPELL.MR_CRSEQU_DET (BUILDING, COURSE, COURSE_SECTION, DISTRICT, SCHOOL_YEAR, STATE_ID)
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
create index COPPELL.IX2_MR_CRSEQU_DET on COPPELL.MR_CRSEQU_DET (SCHOOL_YEAR, BUILDING, COURSE, COURSE_SECTION)
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
prompt Creating table MR_LEVEL_HDR
prompt ===========================
prompt
create table COPPELL.MR_LEVEL_HDR
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  level_number     NUMBER(6) not null,
  description      VARCHAR2(255) not null,
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_LEVEL_HDR on COPPELL.MR_LEVEL_HDR (BUILDING, DISTRICT, LEVEL_NUMBER)
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
prompt Creating table MR_LEVEL_MARKS
prompt =============================
prompt
create table COPPELL.MR_LEVEL_MARKS
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  mark             CHAR(3) not null,
  display_order    NUMBER(6) not null,
  active           CHAR(1) not null,
  state_code_equiv VARCHAR2(10),
  course_completed VARCHAR2(1),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_LEVEL_MARKS on COPPELL.MR_LEVEL_MARKS (BUILDING, DISTRICT, MARK)
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
create index COPPELL.IX2_MR_LEVEL_MARKS on COPPELL.MR_LEVEL_MARKS (BUILDING, DISPLAY_ORDER, DISTRICT)
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
prompt Creating table MR_MARK_TYPES
prompt ============================
prompt
create table COPPELL.MR_MARK_TYPES
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
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_MARK_TYPES on COPPELL.MR_MARK_TYPES (BUILDING, DISTRICT, MARK_TYPE)
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
prompt Creating table MR_STATE_COURSES
prompt ===============================
prompt
create table COPPELL.MR_STATE_COURSES
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
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_STATE_COURSES on COPPELL.MR_STATE_COURSES (DISTRICT, SCHOOL_YEAR, STATE_CODE)
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
prompt Creating table MR_STU_CRSEQU_MARK
prompt =================================
prompt
create table COPPELL.MR_STU_CRSEQU_MARK
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
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_STU_CRSEQU_MARK on COPPELL.MR_STU_CRSEQU_MARK (BUILDING, COURSE_SESSION, DEST_MARK_TYPE, DESTINATION_MP, DISTRICT, SCHOOL_YEAR, SECTION_KEY, STATE_ID, STUDENT_ID)
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
prompt Creating table MR_STU_GPA
prompt =========================
prompt
create table COPPELL.MR_STU_GPA
(
  district           NUMBER(10),
  student_id         CHAR(10),
  gpa_type           CHAR(5),
  school_year        NUMBER(6),
  run_term_year      NUMBER(6),
  building           NUMBER(10),
  grade              CHAR(2),
  needs_recalc       CHAR(1),
  override           CHAR(1),
  cur_gpa_calc_date  VARCHAR2(8),
  cur_gpa            NUMBER(7,4),
  cur_quality_points NUMBER(8,4),
  cur_add_on_points  NUMBER(8,4),
  cur_att_credit     NUMBER(7,4),
  cur_rnk_calc_date  VARCHAR2(8),
  cur_rank           NUMBER(6),
  cur_percentile     NUMBER(6),
  cur_decile         NUMBER(6),
  cur_quintile       NUMBER(6),
  cur_quartile       NUMBER(6),
  cur_rank_gpa       NUMBER(7,4),
  cum_gpa_calc_date  VARCHAR2(8),
  cum_gpa            NUMBER(7,4),
  cum_quality_points NUMBER(9,4),
  cum_add_on_points  NUMBER(8,4),
  cum_att_credit     NUMBER(7,4),
  cum_rnk_calc_date  VARCHAR2(8),
  cum_rank           NUMBER(6),
  cum_percentile     NUMBER(6),
  cum_decile         NUMBER(6),
  cum_quintile       NUMBER(6),
  cum_quartile       NUMBER(6),
  cum_rank_gpa       NUMBER(7,4),
  cur_rank_qual_pts  NUMBER(8,4),
  cum_rank_qual_pts  NUMBER(9,4),
  change_date_time   VARCHAR2(8),
  change_uid         VARCHAR2(25),
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
  )
nologging;
create index COPPELL.IX_MR_STU_GPA on COPPELL.MR_STU_GPA (DISTRICT, GPA_TYPE, RUN_TERM_YEAR, SCHOOL_YEAR, STUDENT_ID)
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
prompt Creating table MR_STU_HDR
prompt =========================
prompt
create table COPPELL.MR_STU_HDR
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
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_STU_HDR on COPPELL.MR_STU_HDR (COURSE_SESSION, DISTRICT, SECTION_KEY, STUDENT_ID)
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
create index COPPELL.IX2_MR_STU_HDR on COPPELL.MR_STU_HDR (STUDENT_ID, SECTION_KEY, COURSE_SESSION, DISTRICT)
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
prompt Creating table MR_STU_HDR_SUBJ
prompt ==============================
prompt
create table COPPELL.MR_STU_HDR_SUBJ
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  subject_area     CHAR(5) not null,
  value            CHAR(5) not null,
  override         CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_MR_STU_HDR_SUBJ on COPPELL.MR_STU_HDR_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, STUDENT_ID, SUBJECT_AREA)
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
prompt Creating table MR_STU_MARKS
prompt ===========================
prompt
create table COPPELL.MR_STU_MARKS
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
  override_reason  CHAR(3),
  override_notes   VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
create index COPPELL.IX1_MR_STU_MARKS on COPPELL.MR_STU_MARKS (COURSE_SESSION, DISTRICT, MARK_TYPE, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
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
create index COPPELL.IX2_MR_STU_MARKS on COPPELL.MR_STU_MARKS (STUDENT_ID, DISTRICT)
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
create table COPPELL.MR_STU_MP
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
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_STU_MP on COPPELL.MR_STU_MP (COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
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
create index COPPELL.IX2_MR_STU_MP on COPPELL.MR_STU_MP (SECTION_KEY, COURSE_SESSION, STUDENT_ID, DISTRICT)
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
prompt Creating table MR_STU_MP_COMMENTS
prompt =================================
prompt
create table COPPELL.MR_STU_MP_COMMENTS
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  comment_type     CHAR(5) not null,
  code             CHAR(5),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_MR_STU_MP_COMM on COPPELL.MR_STU_MP_COMMENTS (COMMENT_TYPE, COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY, STUDENT_ID)
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
create index COPPELL.IX2_MR_STU_MP_COMM on COPPELL.MR_STU_MP_COMMENTS (SECTION_KEY, STUDENT_ID, COURSE_SESSION, DISTRICT)
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
prompt Creating table MR_TRN_PRT_STU_DET
prompt =================================
prompt
create table COPPELL.MR_TRN_PRT_STU_DET
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
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table REG
prompt ==================
prompt
create table COPPELL.REG
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
  calendar           CHAR(1) not null,
  track              CHAR(3) not null,
  current_status     CHAR(1) not null,
  summer_status      CHAR(1),
  counselor          CHAR(10),
  house_team         CHAR(5),
  homeroom_primary   CHAR(5),
  homeroom_secondary CHAR(5),
  birthdate          VARCHAR2(8) not null,
  family_census      CHAR(8),
  alt_building       NUMBER(10),
  alt_district       NUMBER(10),
  nickname           VARCHAR2(30),
  home_district      NUMBER(10),
  attending_district NUMBER(10),
  alt_bldg_acct      NUMBER(10),
  dist_enroll_date   VARCHAR2(8),
  state_enroll_date  VARCHAR2(8),
  us_enroll_date     VARCHAR2(8),
  student_guid       NUMBER(10) not null,
  res_county_code    CHAR(10),
  state_res_building CHAR(20),
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG on COPPELL.REG (DISTRICT, STUDENT_ID)
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
create index COPPELL.IX2_REG on COPPELL.REG (BUILDING, DISTRICT)
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
create index COPPELL.IX3_REG on COPPELL.REG (HOMEROOM_PRIMARY, DISTRICT)
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
create index COPPELL.IX4_REG on COPPELL.REG (STUDENT_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, GRADE, GENERATION, CURRENT_STATUS)
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
prompt Creating table REGTB_BLDG_TYPES
prompt ===============================
prompt
create table COPPELL.REGTB_BLDG_TYPES
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REGTB_BLDG_TYPES on COPPELL.REGTB_BLDG_TYPES (CODE, DISTRICT)
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
create table COPPELL.REGTB_ENTRY
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  sif_code         CHAR(5),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REGTB_ENTRY on COPPELL.REGTB_ENTRY (CODE, DISTRICT)
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
prompt Creating table REGTB_ETHNICITY
prompt ==============================
prompt
create table COPPELL.REGTB_ETHNICITY
(
  district           NUMBER(10) not null,
  code               CHAR(5) not null,
  description        VARCHAR2(255) not null,
  state_code_equiv   CHAR(10),
  federal_code_equiv CHAR(10),
  active             CHAR(1) not null,
  sif_code           CHAR(5),
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REGTB_ETHNICITY on COPPELL.REGTB_ETHNICITY (CODE, DISTRICT)
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
prompt Creating table REGTB_LANGUAGE
prompt =============================
prompt
create table COPPELL.REGTB_LANGUAGE
(
  district           NUMBER(10) not null,
  code               CHAR(5) not null,
  description        VARCHAR2(255) not null,
  state_code_equiv   CHAR(10),
  active             CHAR(1) not null,
  alternate_language CHAR(1) not null,
  sif_code           CHAR(5),
  sif2_code          CHAR(5),
  change_date_time   VARCHAR2(8) not null,
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
prompt Creating table REGTB_WITHDRAWAL
prompt ===============================
prompt
create table COPPELL.REGTB_WITHDRAWAL
(
  district         NUMBER(10) not null,
  code             CHAR(5) not null,
  description      VARCHAR2(255) not null,
  state_code_equiv CHAR(10),
  active           CHAR(1) not null,
  sif_code         CHAR(5),
  sif2_code        CHAR(5),
  dropout_code     CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
create index COPPELL.IX_REGTB_WITHDRAWAL on COPPELL.REGTB_WITHDRAWAL (CODE, DISTRICT)
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
create table COPPELL.REG_ACADEMIC
(
  district           NUMBER(10) not null,
  student_id         CHAR(10) not null,
  graduation_year    NUMBER(6),
  graduation_date    VARCHAR2(8),
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
  elig_effective_dte VARCHAR2(8),
  elig_expires_date  VARCHAR2(8),
  hold_report_card   CHAR(1) not null,
  votec              CHAR(1) not null,
  advisor            CHAR(10),
  change_date_time   VARCHAR2(8),
  change_uid         VARCHAR2(25),
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
  )
nologging;
create index COPPELL.IX1_REG_ACADEMIC on COPPELL.REG_ACADEMIC (DISTRICT, STUDENT_ID)
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
create index COPPELL.IX2_REG_ACADEMIC on COPPELL.REG_ACADEMIC (STUDENT_ID, DISTRICT)
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
prompt Creating table REG_BUILDING
prompt ===========================
prompt
create table COPPELL.REG_BUILDING
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
  county_code       CHAR(10),
  out_of_district   CHAR(1),
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_BUILDING on COPPELL.REG_BUILDING (BUILDING, DISTRICT)
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
prompt Creating table REG_BUILDING_GRADE
prompt =================================
prompt
create table COPPELL.REG_BUILDING_GRADE
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table REG_CALENDAR
prompt ===========================
prompt
create table COPPELL.REG_CALENDAR
(
  district           NUMBER(10) not null,
  building           NUMBER(10) not null,
  school_year        NUMBER(6) not null,
  summer_school      CHAR(1) not null,
  track              CHAR(3) not null,
  calendar           CHAR(1) not null,
  description        VARCHAR2(255) not null,
  def_mem_value      NUMBER(4,3) not null,
  first_day          VARCHAR2(8) not null,
  last_day           VARCHAR2(8) not null,
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
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_CALENDAR on COPPELL.REG_CALENDAR (BUILDING, CALENDAR, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TRACK)
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
prompt Creating table REG_CAL_DAYS
prompt ===========================
prompt
create table COPPELL.REG_CAL_DAYS
(
  district          NUMBER(10) not null,
  building          NUMBER(10) not null,
  school_year       NUMBER(6) not null,
  summer_school     CHAR(1) not null,
  track             CHAR(3) not null,
  calendar          CHAR(1) not null,
  cal_date          VARCHAR2(8) not null,
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
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG_CAL_DAYS on COPPELL.REG_CAL_DAYS (BUILDING, CAL_DATE, CALENDAR, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TRACK)
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
create index COPPELL.IX2_REG_CAL_DAYS on COPPELL.REG_CAL_DAYS (SCHOOL_YEAR, BUILDING, TRACK, CALENDAR, SUMMER_SCHOOL, DISTRICT)
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
prompt Creating table REG_CONTACT
prompt ==========================
prompt
create table COPPELL.REG_CONTACT
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
  pwd_chg_date_time  VARCHAR2(8),
  last_login_date    VARCHAR2(8),
  education_level    CHAR(5),
  sif_refid          VARCHAR2(32),
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG_CONTACT on COPPELL.REG_CONTACT (CONTACT_ID, DISTRICT)
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
create index COPPELL.IX2_REG_CONTACT on COPPELL.REG_CONTACT (DISTRICT, LOGIN_ID)
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
prompt Creating table REG_CONTACT_PHONE
prompt ================================
prompt
create table COPPELL.REG_CONTACT_PHONE
(
  district         NUMBER(10) not null,
  contact_id       NUMBER(10) not null,
  phone_type       CHAR(5) not null,
  phone_listing    CHAR(1) not null,
  phone            CHAR(10) not null,
  phone_extension  CHAR(5),
  sif_refid        VARCHAR2(32),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_CONTACT_PHONE on COPPELL.REG_CONTACT_PHONE (CONTACT_ID, DISTRICT, PHONE_TYPE)
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
prompt Creating table REG_DISTRICT
prompt ===========================
prompt
create table COPPELL.REG_DISTRICT
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
  cutoff_date                 VARCHAR2(8),
  ew_membership               CHAR(1) not null,
  use_rank_class_size_exclude CHAR(1) not null,
  include_iep                 CHAR(1) not null,
  include_gifted              CHAR(1) not null,
  include_504                 CHAR(1) not null,
  min_age_citation            NUMBER(6),
  lockout_users               CHAR(1) not null,
  change_date_time            VARCHAR2(8) not null,
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
create index COPPELL.IX_REG_DISTRICT on COPPELL.REG_DISTRICT (DISTRICT)
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
create table COPPELL.REG_ENTRY_WITH
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  entry_wd_type    CHAR(1) not null,
  school_year      NUMBER(6) not null,
  entry_date       VARCHAR2(8) not null,
  entry_code       CHAR(5) not null,
  building         NUMBER(10) not null,
  grade            CHAR(2) not null,
  track            CHAR(3) not null,
  calendar         CHAR(1) not null,
  withdrawal_date  VARCHAR2(8),
  withdrawal_code  CHAR(5),
  comments         CHAR(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG_ENTRY_WITH on COPPELL.REG_ENTRY_WITH (DISTRICT, ENTRY_DATE, ENTRY_WD_TYPE, SCHOOL_YEAR, STUDENT_ID)
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
create index COPPELL.IX2_REG_ENTRY_WITH on COPPELL.REG_ENTRY_WITH (STUDENT_ID, SCHOOL_YEAR, ENTRY_WD_TYPE, DISTRICT)
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
prompt Creating table REG_ETHNICITY
prompt ============================
prompt
create table COPPELL.REG_ETHNICITY
(
  district         NUMBER not null,
  student_id       VARCHAR2(10) not null,
  ethnic_code      VARCHAR2(5) not null,
  ethnicity_order  NUMBER not null,
  percentage       NUMBER,
  change_date_time VARCHAR2(8),
  change_uid       VARCHAR2(20)
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

prompt
prompt Creating table REG_MP_DATES
prompt ===========================
prompt
create table COPPELL.REG_MP_DATES
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  school_year      NUMBER(6) not null,
  track            CHAR(3) not null,
  marking_period   CHAR(3) not null,
  start_date       VARCHAR2(8) not null,
  end_date         VARCHAR2(8) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_MP_DATES on COPPELL.REG_MP_DATES (BUILDING, DISTRICT, MARKING_PERIOD, SCHOOL_YEAR, TRACK)
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
prompt Creating table REG_PERSONAL
prompt ===========================
prompt
create table COPPELL.REG_PERSONAL
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
  change_date_time   VARCHAR2(8) not null,
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
create bitmap index COPPELL.BMI_ETHNIC_CODE on COPPELL.REG_PERSONAL (ETHNIC_CODE)
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
create index COPPELL.IX_REG_PERSONAL on COPPELL.REG_PERSONAL (DISTRICT, STUDENT_ID)
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
prompt Creating table REG_PERSONAL_OLD
prompt ===============================
prompt
create table COPPELL.REG_PERSONAL_OLD
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
  change_date_time   VARCHAR2(8) not null,
  change_uid         VARCHAR2(20) not null,
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
  );
create index COPPELL.IX_REG_PERSONAL_OLD on COPPELL.REG_PERSONAL_OLD (STUDENT_ID)
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
prompt Creating table REG_PROGRAMS
prompt ===========================
prompt
create table COPPELL.REG_PROGRAMS
(
  district          NUMBER(10) not null,
  program_id        CHAR(5) not null,
  field_number      NUMBER(6) not null,
  student_id        CHAR(10) not null,
  start_date        VARCHAR2(8) not null,
  summer_school     CHAR(1) not null,
  entry_reason      CHAR(5),
  program_value     VARCHAR2(255) not null,
  end_date          VARCHAR2(8),
  withdrawal_reason CHAR(5),
  program_override  CHAR(1) not null,
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_PROGRAMS on COPPELL.REG_PROGRAMS (DISTRICT, FIELD_NUMBER, PROGRAM_ID, START_DATE, STUDENT_ID, SUMMER_SCHOOL)
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
prompt Creating table REG_PROGRAM_COLUMN
prompt =================================
prompt
create table COPPELL.REG_PROGRAM_COLUMN
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
  change_date_time   VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_PROG_COL_NBR on COPPELL.REG_PROGRAM_COLUMN (DISTRICT, FIELD_NUMBER, PROGRAM_ID)
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
create index COPPELL.IX_REG_PROG_COL_ORD on COPPELL.REG_PROGRAM_COLUMN (DISTRICT, FIELD_ORDER, PROGRAM_ID)
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
prompt Creating table REG_PROGRAM_USER
prompt ===============================
prompt
create table COPPELL.REG_PROGRAM_USER
(
  district         NUMBER(10) not null,
  program_id       CHAR(5) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG_PROGRAM_USER on COPPELL.REG_PROGRAM_USER (DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, PROGRAM_ID, SCREEN_NUMBER)
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
prompt Creating table REG_STAFF
prompt ========================
prompt
create table COPPELL.REG_STAFF
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
  sub_expiration   VARCHAR2(8),
  gender           CHAR(1),
  prim_ethnic_code CHAR(5),
  hispanic         CHAR(1) not null,
  fed_race_ethnic  CHAR(10),
  birthdate        VARCHAR2(8),
  staff_state_id   VARCHAR2(32),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_REG_STAFF on COPPELL.REG_STAFF (DISTRICT, STAFF_ID)
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
create index COPPELL.IX2_REG_STAFF on COPPELL.REG_STAFF (LOGIN_ID)
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
prompt Creating table REG_STAFF_BLDGS
prompt ==============================
prompt
create table COPPELL.REG_STAFF_BLDGS
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
  change_date_time   VARCHAR2(8) not null,
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
create index COPPELL.IX1_REG_STAFF_BLDGS on COPPELL.REG_STAFF_BLDGS (BUILDING, DISTRICT, STAFF_ID)
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
create index COPPELL.IX2_REG_STAFF_BLDGS on COPPELL.REG_STAFF_BLDGS (HOMEROOM_PRIMARY, HOMEROOM_SECONDARY)
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
create table COPPELL.REG_STU_CONTACT
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
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_STU_CONTACT on COPPELL.REG_STU_CONTACT (CONTACT_ID, CONTACT_TYPE, DISTRICT, STUDENT_ID)
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
prompt Creating table REG_USER
prompt =======================
prompt
create table COPPELL.REG_USER
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_USER on COPPELL.REG_USER (DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, SCREEN_NUMBER, STUDENT_ID)
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
prompt Creating table REG_USER_BUILDING
prompt ================================
prompt
create table COPPELL.REG_USER_BUILDING
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6) not null,
  field_value      VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_REG_USER_BLDG on COPPELL.REG_USER_BUILDING (BUILDING, DISTRICT, FIELD_NUMBER, LIST_SEQUENCE, SCREEN_NUMBER)
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
prompt Creating table SCHD_COURSE
prompt ==========================
prompt
create table COPPELL.SCHD_COURSE
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
  change_date_time   VARCHAR2(8) not null,
  change_uid         VARCHAR2(25) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_COURSE on COPPELL.SCHD_COURSE (BUILDING, COURSE, DISTRICT)
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
prompt Creating table SCHD_COURSE_BLOCK
prompt ================================
prompt
create table COPPELL.SCHD_COURSE_BLOCK
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  block_course     CHAR(10) not null,
  blockette_course CHAR(10) not null,
  same_section     CHAR(1) not null,
  mandatory        CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_CRS_BLOCK on COPPELL.SCHD_COURSE_BLOCK (BLOCK_COURSE, BLOCKETTE_COURSE, BUILDING, DISTRICT)
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
prompt Creating table SCHD_COURSE_GRADE
prompt ================================
prompt
create table COPPELL.SCHD_COURSE_GRADE
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  course           CHAR(10) not null,
  restrict_grade   CHAR(2) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_CRS_GRADE on COPPELL.SCHD_COURSE_GRADE (BUILDING, COURSE, DISTRICT, RESTRICT_GRADE)
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
prompt Creating table SCHD_COURSE_USER
prompt ===============================
prompt
create table COPPELL.SCHD_COURSE_USER
(
  district         NUMBER(10) not null,
  building         NUMBER(10) not null,
  course           CHAR(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6),
  field_value      VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_CRS_USER on COPPELL.SCHD_COURSE_USER (BUILDING, COURSE, DISTRICT, FIELD_NUMBER, SCREEN_NUMBER)
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
prompt Creating table SCHD_MS
prompt ======================
prompt
create table COPPELL.SCHD_MS
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
  change_date_time   VARCHAR2(8) not null,
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
create index COPPELL.IX_SCHD_MS_BLDG on COPPELL.SCHD_MS (BUILDING, COURSE, COURSE_SECTION, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL)
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
create index COPPELL.IX_SCHD_MS_KEY on COPPELL.SCHD_MS (SECTION_KEY)
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
create table COPPELL.SCHD_MS_CYCLE
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  cycle_code       CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX1_SCHD_MS_CYCLE on COPPELL.SCHD_MS_CYCLE (COURSE_SESSION, CYCLE_CODE, DISTRICT, SECTION_KEY)
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
create index COPPELL.IX2_SCHD_MS_CYCLE on COPPELL.SCHD_MS_CYCLE (CYCLE_CODE)
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
prompt Creating table SCHD_MS_GRADE
prompt ============================
prompt
create table COPPELL.SCHD_MS_GRADE
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  restrict_grade   CHAR(2) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;

prompt
prompt Creating table SCHD_MS_HOUSE_TEAM
prompt =================================
prompt
create table COPPELL.SCHD_MS_HOUSE_TEAM
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  house_team       CHAR(5) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_HSE_TM on COPPELL.SCHD_MS_HOUSE_TEAM (DISTRICT, HOUSE_TEAM, SECTION_KEY)
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
prompt Creating table SCHD_MS_MP
prompt =========================
prompt
create table COPPELL.SCHD_MS_MP
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  marking_period   CHAR(3) not null,
  used_seats       NUMBER(6) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_MP on COPPELL.SCHD_MS_MP (COURSE_SESSION, DISTRICT, MARKING_PERIOD, SECTION_KEY)
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
prompt Creating table SCHD_MS_SCHEDULE
prompt ===============================
prompt
create table COPPELL.SCHD_MS_SCHEDULE
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
  change_date_time    VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_SCHEDULE on COPPELL.SCHD_MS_SCHEDULE (BUILDING, COURSE, COURSE_SECTION, COURSE_SESSION, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL)
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
prompt Creating table SCHD_MS_SESSION
prompt ==============================
prompt
create table COPPELL.SCHD_MS_SESSION
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  description      VARCHAR2(255) not null,
  start_period     CHAR(5) not null,
  end_period       CHAR(5) not null,
  take_attendance  CHAR(1) not null,
  receive_mark     CHAR(1) not null,
  credit           NUMBER(6,4) not null,
  primary_staff_id CHAR(10) not null,
  room_id          CHAR(5) not null,
  course_level     NUMBER(6),
  change_date_time VARCHAR2(8) not null,
  change_uid       VARCHAR2(25) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_SESSION on COPPELL.SCHD_MS_SESSION (COURSE_SESSION, DISTRICT, SECTION_KEY)
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
prompt Creating table SCHD_MS_STAFF
prompt ============================
prompt
create table COPPELL.SCHD_MS_STAFF
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  staff_id         CHAR(10) not null,
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_STAFF on COPPELL.SCHD_MS_STAFF (COURSE_SESSION, DISTRICT, SECTION_KEY, STAFF_ID)
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
prompt Creating table SCHD_MS_SUBJ
prompt ===========================
prompt
create table COPPELL.SCHD_MS_SUBJ
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  course_session   NUMBER(6) not null,
  subject_area     CHAR(5) not null,
  subj_order       NUMBER(6) not null,
  sub_area         CHAR(5),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_SUBJ_AREA on COPPELL.SCHD_MS_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, SUBJECT_AREA)
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
create index COPPELL.IX_SCHD_MS_SUBJ_ORD on COPPELL.SCHD_MS_SUBJ (COURSE_SESSION, DISTRICT, SECTION_KEY, SUBJ_ORDER)
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
prompt Creating table SCHD_MS_USER
prompt ===========================
prompt
create table COPPELL.SCHD_MS_USER
(
  district         NUMBER(10) not null,
  section_key      NUMBER(10) not null,
  screen_number    NUMBER(10) not null,
  field_number     NUMBER(6) not null,
  list_sequence    NUMBER(6),
  field_value      VARCHAR2(255),
  change_date_time VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_MS_USER on COPPELL.SCHD_MS_USER (DISTRICT, FIELD_NUMBER, SCREEN_NUMBER, SECTION_KEY)
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
prompt Creating table SCHD_STU_COURSE
prompt ==============================
prompt
create table COPPELL.SCHD_STU_COURSE
(
  district         NUMBER(10) not null,
  student_id       CHAR(10) not null,
  section_key      NUMBER(10) not null,
  modeled          CHAR(1) not null,
  course_status    CHAR(1) not null,
  model_val_type   CHAR(1) not null,
  retake           CHAR(1) not null,
  change_date_time VARCHAR2(8) not null,
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
create index COPPELL.IX1_SCHD_STU_COURSE on COPPELL.SCHD_STU_COURSE (DISTRICT, MODELED, SECTION_KEY, STUDENT_ID)
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
create index COPPELL.IX2_SCHD_STU_COURSE on COPPELL.SCHD_STU_COURSE (SECTION_KEY, DISTRICT, STUDENT_ID, MODELED)
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
create table COPPELL.SCHD_STU_CRS_DATES
(
  district          NUMBER(10) not null,
  student_id        CHAR(10) not null,
  section_key       NUMBER(10) not null,
  modeled           CHAR(1) not null,
  date_range_key    NUMBER(10) not null,
  date_added        VARCHAR2(8) not null,
  date_dropped      VARCHAR2(8),
  resolved_conflict CHAR(1) not null,
  mr_ungraded       CHAR(1) not null,
  mr_first_mp       CHAR(3),
  mr_last_mp        CHAR(3),
  mr_last_mark_by   CHAR(1),
  from_section_key  NUMBER(10),
  from_range_key    NUMBER(10),
  to_section_key    NUMBER(10),
  to_range_key      NUMBER(10),
  change_date_time  VARCHAR2(8) not null,
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
  )
nologging;
create index COPPELL.IX_SCHD_STU_CRS_DT on COPPELL.SCHD_STU_CRS_DATES (DATE_RANGE_KEY, DISTRICT, MODELED, SECTION_KEY, STUDENT_ID)
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
prompt Creating table SCHD_TIMETABLE
prompt =============================
prompt
create table COPPELL.SCHD_TIMETABLE
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
  change_date_time VARCHAR2(8) not null,
  change_uid       VARCHAR2(20) not null,
  r10_loaddate     DATE,
  lunch_time       VARCHAR2(30)
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
  )
nologging;
create index COPPELL.IX_SCHD_TIMETABLE on COPPELL.SCHD_TIMETABLE (BELL_SCHD, BUILDING, CYCLE, DISTRICT, SCHOOL_YEAR, SUMMER_SCHOOL, TIMESLOT)
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
prompt Creating sequence SEQ_STUDENT_GUID
prompt ==================================
prompt
create sequence COPPELL.SEQ_STUDENT_GUID
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
nocache;


spool off
