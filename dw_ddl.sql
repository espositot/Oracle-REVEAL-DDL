-----------------------------------------------------------
-- Export file for user DW@DATAWH                        --
-- Created by espositot on 5/26/2016, 15:34:26 15:34:26  --
-----------------------------------------------------------

set define off
spool dw_ddl.log

prompt
prompt Creating table ABSENCE_FACT_FEX1
prompt ================================
prompt
create table DW.ABSENCE_FACT_FEX1
(
  loc_county_dist_id CHAR(6) not null,
  date_id            VARCHAR2(32),
  stu_key            VARCHAR2(19) not null,
  loc_key            VARCHAR2(55) not null,
  record_type        CHAR(1),
  period             VARCHAR2(8),
  event_type         VARCHAR2(20)
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
create bitmap index DW.BIX_ABSENCE_FACT_CDC on DW.ABSENCE_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create bitmap index DW.BIX_ABSENCE_FACT_DATE_ID on DW.ABSENCE_FACT_FEX1 (DATE_ID)
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
create bitmap index DW.BIX_ABSENCE_FACT_EVENT on DW.ABSENCE_FACT_FEX1 (EVENT_TYPE)
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
create bitmap index DW.BIX_ABSENCE_FACT_LOCKEY on DW.ABSENCE_FACT_FEX1 (LOC_KEY)
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
create bitmap index DW.BIX_ABSENCE_FACT_PERIOD on DW.ABSENCE_FACT_FEX1 (PERIOD)
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
create bitmap index DW.BIX_ABSENCE_STUKEY on DW.ABSENCE_FACT_FEX1 (STU_KEY)
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
prompt Creating table COURSE_DIM_DEX1
prompt ==============================
prompt
create table DW.COURSE_DIM_DEX1
(
  loc_county_dist_id  VARCHAR2(10) not null,
  course_key          VARCHAR2(55) not null,
  school_year         CHAR(4) not null,
  course_id           VARCHAR2(15),
  course_ext          VARCHAR2(5),
  course_desc         VARCHAR2(50),
  course_type         VARCHAR2(50),
  first_elgbl_grd     VARCHAR2(18),
  last_elgbl_grd      VARCHAR2(18),
  course_dept         VARCHAR2(20),
  course_subject_area VARCHAR2(40),
  state_course_cd     VARCHAR2(10),
  state_course_desc   VARCHAR2(150),
  course_adopted_dt   VARCHAR2(21),
  course_deleted_dt   VARCHAR2(21),
  course_updated_dt   VARCHAR2(21)
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
create bitmap index DW.BIX_COURSE_DIM_DEX1_CDC on DW.COURSE_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create index DW.COURSE_KEY on DW.COURSE_DIM_DEX1 (COURSE_KEY)
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
create index DW.IX_COURSE_ID on DW.COURSE_DIM_DEX1 (COURSE_ID)
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
prompt Creating table DATE_DIM
prompt =======================
prompt
create table DW.DATE_DIM
(
  date_sid         NUMBER(8) not null,
  schl_year_desc   VARCHAR2(9) not null,
  schl_year        NUMBER(4) not null,
  yyyymmdd         VARCHAR2(8) not null,
  julian_dt        NUMBER(7) not null,
  date_id          DATE not null,
  day_desc         VARCHAR2(28) not null,
  year_id          NUMBER(4) not null,
  month_nbr        NUMBER(2) not null,
  day_nbr          NUMBER(2) not null,
  dow_desc         VARCHAR2(9) not null,
  dow_nbr          NUMBER(1) not null,
  month_id         NUMBER(6) not null,
  year_desc        VARCHAR2(6) not null,
  month_desc       VARCHAR2(9) not null,
  month_short_desc VARCHAR2(3) not null,
  day_short_desc   VARCHAR2(16) not null,
  dow_short_desc   VARCHAR2(9) not null,
  jul_fy           NUMBER(1),
  sep_fy           NUMBER(1)
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
create unique index DW.DATE_DIM_DATE_SID_SCHL_YEAR on DW.DATE_DIM (DATE_SID, SCHL_YEAR)
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
create unique index DW.DATE_DIM_SID_SCHL_YEAR_DESC on DW.DATE_DIM (DATE_SID, SCHL_YEAR_DESC)
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
create unique index DW.PK_DATE_DIM on DW.DATE_DIM (DATE_SID)
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
prompt Creating table DIMENSION_EXCEPTIONS
prompt ===================================
prompt
create table DW.DIMENSION_EXCEPTIONS
(
  statement_id   VARCHAR2(30),
  owner          VARCHAR2(30) not null,
  table_name     VARCHAR2(30) not null,
  dimension_name VARCHAR2(30) not null,
  relationship   VARCHAR2(11) not null,
  bad_rowid      ROWID not null
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
prompt Creating table DISTRICT_CDN_FEX
prompt ===============================
prompt
create table DW.DISTRICT_CDN_FEX
(
  r10cdn   VARCHAR2(161 CHAR),
  entry_id VARCHAR2(40 CHAR)
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
prompt Creating table DISTRICT_DN_FEX
prompt ==============================
prompt
create table DW.DISTRICT_DN_FEX
(
  dn       VARCHAR2(161 CHAR),
  entry_id VARCHAR2(40 CHAR)
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
prompt Creating table DISTRICT_LOC_FEX
prompt ===============================
prompt
create table DW.DISTRICT_LOC_FEX
(
  r10location VARCHAR2(161 CHAR),
  entry_id    VARCHAR2(40 CHAR)
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
prompt Creating table DISTRICT_LOC_FEX1
prompt ================================
prompt
create table DW.DISTRICT_LOC_FEX1
(
  r10location   VARCHAR2(161 CHAR),
  entry_id_temp VARCHAR2(40 CHAR),
  cur_record    VARCHAR2(40 CHAR),
  counter       NUMBER(10)
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
prompt Creating table DISTRICT_LOC_FEX2
prompt ================================
prompt
create table DW.DISTRICT_LOC_FEX2
(
  r10location      VARCHAR2(161 CHAR),
  entry_id         VARCHAR2(40 CHAR),
  entry_id_temp    VARCHAR2(161 CHAR),
  entry_cur_record VARCHAR2(40 CHAR)
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
prompt Creating table DISTRICT_MAIL_FEX
prompt ================================
prompt
create table DW.DISTRICT_MAIL_FEX
(
  mail     VARCHAR2(161 CHAR),
  entry_id VARCHAR2(40 CHAR)
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
prompt Creating table DISTRICT_UID_FEX
prompt ===============================
prompt
create table DW.DISTRICT_UID_FEX
(
  uid      VARCHAR2(161 CHAR),
  entry_id VARCHAR2(40 CHAR)
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
prompt Creating table DIS_ACT_DIM_DEX1
prompt ===============================
prompt
create table DW.DIS_ACT_DIM_DEX1
(
  loc_county_dist_id  CHAR(6) not null,
  act_key             VARCHAR2(30) not null,
  act_id              VARCHAR2(8),
  act_type            VARCHAR2(8),
  act_short_desc      VARCHAR2(40),
  act_desc            VARCHAR2(50),
  is_corp_pnshmnt     NUMBER,
  is_alt_plcmnt       NUMBER,
  is_is_susp          NUMBER,
  is_other            NUMBER,
  act_cur_sy_cnt      NUMBER,
  act_tot_cnt         NUMBER,
  is_oos_susp         NUMBER,
  is_expulsion        NUMBER,
  is_crt_juv_rfrrl    NUMBER,
  act_severity        NUMBER,
  act_avg_lngth       NUMBER,
  act_assign_lngth    NUMBER,
  is_schll_chg_plcmnt NUMBER,
  is_daep             NUMBER(1),
  is_jjaep            NUMBER(1)
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
create bitmap index DW.BIX_DIS_ACT_DIM_DEX1_CDC on DW.DIS_ACT_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create unique index DW.PK_DIS_ACT_DIM_DEX1 on DW.DIS_ACT_DIM_DEX1 (ACT_KEY)
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
prompt Creating table DIS_FACT_FEX1
prompt ============================
prompt
create table DW.DIS_FACT_FEX1
(
  loc_county_dist_id CHAR(6) not null,
  school_year        VARCHAR2(43),
  record_type        CHAR(1),
  stu_key            VARCHAR2(20) not null,
  event_id           VARCHAR2(50),
  cur_grd_lvl        VARCHAR2(2),
  nbr_of_incidents   CHAR(1),
  is_hate_crime      CHAR(1),
  is_alcohol         CHAR(1),
  is_drug            CHAR(1),
  is_weapon          CHAR(1),
  is_gang            CHAR(1),
  was_law_notified   CHAR(1),
  invlvmnt_type      CHAR(2),
  where_flag         CHAR(3),
  weapon_type_cd     CHAR(2),
  loo_key            VARCHAR2(20),
  inc_key            VARCHAR2(30),
  event_loc_key      VARCHAR2(25),
  event_dt           VARCHAR2(32),
  event_time         CHAR(7),
  rprtng_staff_id    VARCHAR2(40),
  state_grp_id       VARCHAR2(55),
  case_nbr           VARCHAR2(61),
  act_nbr_of_days    VARCHAR2(83),
  act_key            VARCHAR2(30),
  act_loc_key        VARCHAR2(17),
  act_dt             VARCHAR2(32),
  act_staff_id       VARCHAR2(15),
  act_begin_dt       VARCHAR2(32),
  act_nbr_dys_servd  VARCHAR2(10),
  act_reason_dif     VARCHAR2(10),
  incident_number    VARCHAR2(10)
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
comment on table DW.DIS_FACT_FEX1
  is 'Discipline Fact';
comment on column DW.DIS_FACT_FEX1.stu_key
  is 'KEY: Student Dimension';
create bitmap index DW.BIX_DIS_FACT_FEX1_CDC on DW.DIS_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create bitmap index DW.BMI_DIS_FACT_FEX1_ACT_KEY on DW.DIS_FACT_FEX1 (ACT_KEY)
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
create bitmap index DW.BMI_DIS_FACT_RECORD_TYPE on DW.DIS_FACT_FEX1 (RECORD_TYPE)
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
prompt Creating table DIS_INC_DIM_DEX1
prompt ===============================
prompt
create table DW.DIS_INC_DIM_DEX1
(
  loc_county_dist_id CHAR(6),
  inc_key            VARCHAR2(30),
  inc_id             VARCHAR2(9),
  inc_short_desc     VARCHAR2(15),
  inc_type           VARCHAR2(9),
  weapon_used_cd     NUMBER,
  inc_tot_cnt        NUMBER,
  inc_severity       NUMBER,
  inc_desc           VARCHAR2(50),
  inc_cur_sy_cnt     NUMBER,
  is_bullying        NUMBER,
  is_hate_crime      NUMBER,
  is_alcohol         NUMBER,
  is_drug            NUMBER,
  is_weapon          NUMBER,
  is_gang            NUMBER,
  cta_flag           NUMBER
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
create bitmap index DW.BIX_DIS_INC_DIM_DEX1_CDC on DW.DIS_INC_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create unique index DW.PK_DIS_INC_DIM_DEX1 on DW.DIS_INC_DIM_DEX1 (INC_KEY)
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
prompt Creating table DIS_LOO_DIM_DEX1
prompt ===============================
prompt
create table DW.DIS_LOO_DIM_DEX1
(
  loc_county_dist_id CHAR(6) not null,
  loo_key            VARCHAR2(20),
  loo_id             VARCHAR2(8),
  loo_short_desc     VARCHAR2(40),
  loo_use_cnt        NUMBER,
  loo_event_cnt      NUMBER,
  loo_inc_cnt        NUMBER,
  loo_act_cnt        NUMBER,
  create_dt          NUMBER,
  last_updt_dt       NUMBER,
  eff_start_dt       NUMBER,
  eff_end_dt         NUMBER,
  cur_indicator      NUMBER,
  loo_desc           VARCHAR2(30),
  loo_grp            NUMBER
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
create bitmap index DW.BIX_DIS_LOO_DIM_DEX1_CDC on DW.DIS_LOO_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create unique index DW.PK_DIS_LOO_DIM_DEX1 on DW.DIS_LOO_DIM_DEX1 (LOO_KEY)
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
prompt Creating table DIS_STATE_GRP_DIM_DEX1
prompt =====================================
prompt
create table DW.DIS_STATE_GRP_DIM_DEX1
(
  loc_county_dist_id CHAR(6),
  state_grp_key      VARCHAR2(25),
  state_grp_id       VARCHAR2(8),
  state_grp_desc     CHAR(50)
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
create bitmap index DW.BIX_DIS_STATE_GRP_DIM_DEX1_CDC on DW.DIS_STATE_GRP_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create unique index DW.PK_DIS_STATE_GRP_DIM_DEX1 on DW.DIS_STATE_GRP_DIM_DEX1 (STATE_GRP_KEY)
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
prompt Creating table EMP_DATA_DISTRICT_FEX1
prompt =====================================
prompt
create table DW.EMP_DATA_DISTRICT_FEX1
(
  uid        VARCHAR2(190 CHAR) not null,
  ldap_group VARCHAR2(19 CHAR) not null
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
prompt Creating table EMP_DATA_DISTRICT_FEX2
prompt =====================================
prompt
create table DW.EMP_DATA_DISTRICT_FEX2
(
  entry_id   VARCHAR2(40 CHAR),
  ldap_group VARCHAR2(19 CHAR) not null
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
prompt Creating table EMP_DATA_LOCATION_FEX1
prompt =====================================
prompt
create table DW.EMP_DATA_LOCATION_FEX1
(
  uid        VARCHAR2(140 CHAR) not null,
  ldap_group VARCHAR2(19 CHAR) not null
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
prompt Creating table ENROLLMENT_FACT_FEX1
prompt ===================================
prompt
create table DW.ENROLLMENT_FACT_FEX1
(
  loc_county_dist_id CHAR(6),
  stu_key            VARCHAR2(20),
  loc_key            VARCHAR2(55),
  date_id            VARCHAR2(10),
  enr_cnt            CHAR(1),
  ada_enr_cnt        NUMBER(2,1)
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
create bitmap index DW.BIX_ENROLLMENT_FACT_FEX1_CDC on DW.ENROLLMENT_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
prompt Creating table EPMS
prompt ===================
prompt
create table DW.EPMS
(
  id              NUMBER not null,
  filename        VARCHAR2(255),
  epms_table      VARCHAR2(255),
  epms_column     VARCHAR2(255),
  source_table    VARCHAR2(255),
  source_column   VARCHAR2(255),
  error_checking  VARCHAR2(255),
  district        VARCHAR2(25),
  software        VARCHAR2(64),
  cef_business_id VARCHAR2(64),
  cef_description VARCHAR2(1000)
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
alter table DW.EPMS
  add constraint EPMS_PK primary key (ID)
  using index 
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
alter index DW.EPMS_PK nologging;

prompt
prompt Creating table EPMS_DATATYPE_DEFAULTS
prompt =====================================
prompt
create table DW.EPMS_DATATYPE_DEFAULTS
(
  epms_table         VARCHAR2(30),
  epms_column        VARCHAR2(30),
  datatype           VARCHAR2(30),
  data_length_string VARCHAR2(4)
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
prompt Creating table ETL_DICTIONARY
prompt =============================
prompt
create table DW.ETL_DICTIONARY
(
  "Table Name"        VARCHAR2(45) not null,
  "Column Name"       VARCHAR2(45) not null,
  "Common Name"       VARCHAR2(65) not null,
  "Column Definition" VARCHAR2(3000),
  sdm_table           VARCHAR2(30),
  sdm_column          VARCHAR2(30),
  sdm_tabcol          VARCHAR2(61)
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
prompt Creating table ETL_FAR_GUIDE_CODES
prompt ==================================
prompt
create table DW.ETL_FAR_GUIDE_CODES
(
  code        NUMBER(5),
  type        CHAR(20 CHAR),
  description CHAR(108 CHAR)
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
create bitmap index DW.BIX_ETL_FAR_GUIDE_CODES on DW.ETL_FAR_GUIDE_CODES (CODE)
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
prompt Creating table ETL_PEIMS_ETHNICITY_CODES
prompt ========================================
prompt
create table DW.ETL_PEIMS_ETHNICITY_CODES
(
  code        VARCHAR2(1),
  description VARCHAR2(35)
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
create bitmap index DW.BIX_ETL_PEIMS_ETHNICITY_CODES on DW.ETL_PEIMS_ETHNICITY_CODES (CODE)
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
prompt Creating table ETL_PEIMS_TBL_040
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_040
(
  record_type_cd     VARCHAR2(3) not null,
  district_id        VARCHAR2(6) not null,
  staff_id           VARCHAR2(9) not null,
  first_name         VARCHAR2(17) not null,
  middle_name        VARCHAR2(14),
  last_name          VARCHAR2(25) not null,
  generation_cd      VARCHAR2(1),
  sex_cd             VARCHAR2(1) not null,
  ethnicity_cd       VARCHAR2(1) not null,
  tot_yrs_prof_exp   VARCHAR2(2) not null,
  highest_deg_lvl_cd VARCHAR2(1) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index DW.BIX_DISTRICT_ID on DW.ETL_PEIMS_TBL_040 (DISTRICT_ID)
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
create bitmap index DW.BIX_STAFF_ID on DW.ETL_PEIMS_TBL_040 (STAFF_ID)
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
prompt Creating table ETL_PEIMS_TBL_043
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_043
(
  record_type_cd   VARCHAR2(3) not null,
  district_id      VARCHAR2(6) not null,
  staff_id         VARCHAR2(9) not null,
  demo_rev_conf_cd VARCHAR2(1) not null,
  staff_dob        VARCHAR2(8) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_050
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_050
(
  record_type_cd  VARCHAR2(3) not null,
  district_id     VARCHAR2(6) not null,
  staff_id        VARCHAR2(9) not null,
  yrs_exp_in_dist VARCHAR2(2) not null,
  nbr_dys_empl    VARCHAR2(3) not null,
  pct_day_empl    VARCHAR2(3) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_055
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_055
(
  record_type_cd    VARCHAR2(3) not null,
  district_id       VARCHAR2(6) not null,
  campus_id         VARCHAR2(9) not null,
  program_intent_cd VARCHAR2(2) not null,
  tot_cont_inst_fte VARCHAR2(5) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index DW.BIX_CAMPUS_ID on DW.ETL_PEIMS_TBL_055 (CAMPUS_ID)
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
prompt Creating table ETL_PEIMS_TBL_060
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_060
(
  record_type_cd VARCHAR2(3) not null,
  district_id    VARCHAR2(6) not null,
  staff_id       VARCHAR2(9) not null,
  payr_act_cd    VARCHAR2(2) not null,
  fund_cd        VARCHAR2(3) not null,
  function_cd    VARCHAR2(2) not null,
  obj_cd         VARCHAR2(4) not null,
  org_cd         VARCHAR2(3) not null,
  fiscal_yr      VARCHAR2(1) not null,
  prog_intent_cd VARCHAR2(2) not null,
  payr_amt       VARCHAR2(6) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_090
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_090
(
  record_type_cd     VARCHAR2(3) not null,
  district_id        VARCHAR2(6) not null,
  staff_id           VARCHAR2(9) not null,
  campus_id          VARCHAR2(9) not null,
  role_id            VARCHAR2(3) not null,
  svc_id             VARCHAR2(8) not null,
  beg_time           VARCHAR2(5),
  end_time           VARCHAR2(5),
  days_of_wk_cd      VARCHAR2(2),
  wks_of_mth_cd      VARCHAR2(2),
  pop_svd_cd         VARCHAR2(2),
  mult_svc_ind_cd    VARCHAR2(1),
  instr_set_cd       VARCHAR2(2),
  nbr_stu_cls        VARCHAR2(3),
  esc_ssa_sta_ind_cd VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_405
prompt ================================
prompt
create table DW.ETL_PEIMS_TBL_405
(
  district_id                VARCHAR2(6) not null,
  stu_id_2                   VARCHAR2(9) not null,
  loc_id                     VARCHAR2(9),
  instructional_track        VARCHAR2(1),
  report_period_code         VARCHAR2(1) not null,
  number_days_taught         VARCHAR2(3),
  grade_level                VARCHAR2(2),
  instructional_setting_code VARCHAR2(2),
  eligible_days              NUMBER(4),
  excess_hours               NUMBER(6)
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_405_FINAL
prompt ======================================
prompt
create table DW.ETL_PEIMS_TBL_405_FINAL
(
  stu_sid  NUMBER(9) not null,
  date_sid NUMBER(8) not null
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ETL_PEIMS_TBL_405_FINAL_1
prompt ========================================
prompt
create table DW.ETL_PEIMS_TBL_405_FINAL_1
(
  stu_sid  NUMBER(9) not null,
  date_sid NUMBER(8) not null,
  spec_ed  CHAR(1)
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index DW.IX_ETL_PEIMS_405_FINAL on DW.ETL_PEIMS_TBL_405_FINAL_1 (STU_SID, DATE_SID)
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
prompt Creating table ETL_PEIMS_TBL_405_NO_DUPS
prompt ========================================
prompt
create table DW.ETL_PEIMS_TBL_405_NO_DUPS
(
  district_id                VARCHAR2(6) not null,
  stu_id_2                   VARCHAR2(9) not null,
  loc_id                     VARCHAR2(9),
  instructional_track        VARCHAR2(1),
  report_period_code         VARCHAR2(1) not null,
  number_days_taught         VARCHAR2(3),
  grade_level                VARCHAR2(2),
  instructional_setting_code VARCHAR2(2),
  eligible_days              NUMBER(4),
  excess_hours               NUMBER(6)
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
prompt Creating table ETL_PROGRAM_INTENT_CODES
prompt =======================================
prompt
create table DW.ETL_PROGRAM_INTENT_CODES
(
  code        VARCHAR2(2),
  description CHAR(102),
  school_year NUMBER(4)
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
prompt Creating table ETL_RACE_ETHNICITY
prompt =================================
prompt
create table DW.ETL_RACE_ETHNICITY
(
  district_id        VARCHAR2(6) not null,
  local_value        VARCHAR2(10) not null,
  race_ethnicity_key VARCHAR2(7)
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
comment on table DW.ETL_RACE_ETHNICITY
  is 'This table converts local race and ethnicity values into the conformed race and enthinicty of the warehouse.';
comment on column DW.ETL_RACE_ETHNICITY.district_id
  is 'Idenifies the souce of the data needing to the converted. It may be a specific district or standardized test such as TAKS.
Examples:
043901
TAKS';
comment on column DW.ETL_RACE_ETHNICITY.local_value
  is 'A concatenation of the local selection values for ethnicity and race in the following order.

Ethnicity(Hispanic/Not Hispanic/Null)
American indian or Alaskan Native/Not/Null
Asian/Not/Null
Black or African American/Not/Null
Native Hawaiian or Pacific islander/Not/Null
White/Not/Null

Examples:
Y00005  = Hispanic and White';
comment on column DW.ETL_RACE_ETHNICITY.race_ethnicity_key
  is 'The race ethnicity key is used for look up puposes.  It is a positional map of the selected options.
values:
0 - not selected
HIABPW - selected
- (Dash) - Not selected NULL

Mapping:
Postion  Value
H    Hispanic/Latino
I    American Indian or Alaska Native
A    Asian
B   Black or African Americian
P   Native Hawaiian/Other Pacific_Islander
W   White
-      Unknown [in any position]

Example:
000B0W    =   "Black or African American" and  White
00A00W    =   Asian, White
H-----  = Hispanic, race unknown
-I00B00 = Unknown Ethnicity, Black
------   =   Unknown';
alter table DW.ETL_RACE_ETHNICITY
  add constraint PK_ETL_RACE_ETHNICITY primary key (DISTRICT_ID, LOCAL_VALUE)
  using index 
  tablespace DW_DEFAULT01
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
alter index DW.PK_ETL_RACE_ETHNICITY nologging;

prompt
prompt Creating table ETL_STATE_CRS_LOOKUP
prompt ===================================
prompt
create table DW.ETL_STATE_CRS_LOOKUP
(
  etl_year       CHAR(4) not null,
  state_crs_code VARCHAR2(8) not null,
  state_crs_desc VARCHAR2(150)
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
create bitmap index DW.bxi_etl_state_crs_lookup_code on DW.ETL_STATE_CRS_LOOKUP (STATE_CRS_CODE)
  tablespace DW_DEFAULT01
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
create bitmap index DW.bxi_etl_state_crs_lookup_year on DW.ETL_STATE_CRS_LOOKUP (ETL_YEAR)
  tablespace DW_DEFAULT01
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
prompt Creating table ETL_STATE_CRS_LOOKUP_2009
prompt ========================================
prompt
create table DW.ETL_STATE_CRS_LOOKUP_2009
(
  etl_year     CHAR(4) not null,
  code         VARCHAR2(8) not null,
  date6        VARCHAR2(10),
  ldesc        VARCHAR2(35) not null,
  vocada410    VARCHAR2(1) not null,
  vocenr170    VARCHAR2(1) not null,
  staffresp090 VARCHAR2(1) not null,
  studcomp415  VARCHAR2(1) not null,
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
prompt Creating table ETL_TEA_CDC
prompt ==========================
prompt
create table DW.ETL_TEA_CDC
(
  etl_cdc            CHAR(6) not null,
  campusid           CHAR(9) not null,
  type               VARCHAR2(25) not null,
  campusname         VARCHAR2(65) not null,
  status             VARCHAR2(20),
  regionname         VARCHAR2(15) not null,
  districtid         CHAR(6) not null,
  countyname         VARCHAR2(25),
  districtname       VARCHAR2(50) not null,
  grades             VARCHAR2(10),
  regionid           CHAR(2) not null,
  school_year        VARCHAR2(4),
  instructional_type VARCHAR2(11)
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
create bitmap index DW.BIX_ETL_TEA_CDC_CAMPUSID on DW.ETL_TEA_CDC (CAMPUSID)
  tablespace DW_DEFAULT01
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
create bitmap index DW.BIX_ETL_TEA_CDC_CDC on DW.ETL_TEA_CDC (ETL_CDC)
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
create bitmap index DW.BIX_ETL_TEA_CDC_SCHL_YR on DW.ETL_TEA_CDC (SCHOOL_YEAR)
  tablespace DW_DEFAULT01
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
prompt Creating table FUNCTION_DIM_DEX1
prompt ================================
prompt
create table DW.FUNCTION_DIM_DEX1
(
  loc_county_dist_id   CHAR(6),
  function_key         VARCHAR2(25) not null,
  function_id          VARCHAR2(20),
  function_major       VARCHAR2(15),
  function_major_desc  VARCHAR2(46),
  function_detail      VARCHAR2(16),
  function_detail_desc VARCHAR2(46)
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
create bitmap index DW.BIX_FUNCTION_DIM_DEX1_CDC on DW.FUNCTION_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
alter table DW.FUNCTION_DIM_DEX1
  add constraint PK_FUNCTION_DIM_DEX1 primary key (FUNCTION_KEY)
  using index 
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
alter index DW.PK_FUNCTION_DIM_DEX1 nologging;

prompt
prompt Creating table FUND_DIM_DEX1
prompt ============================
prompt
create table DW.FUND_DIM_DEX1
(
  loc_county_dist_id CHAR(6),
  fund_key           VARCHAR2(25) not null,
  fund_id            VARCHAR2(10),
  fund_desc          VARCHAR2(50),
  fund_type_desc     VARCHAR2(50),
  fund_type          VARCHAR2(10)
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
create bitmap index DW.BIX_FUND_DIM_DEX1_CDC on DW.FUND_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
alter table DW.FUND_DIM_DEX1
  add constraint PK_FUND_DIM_DEX1 primary key (FUND_KEY)
  using index 
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
alter index DW.PK_FUND_DIM_DEX1 nologging;

prompt
prompt Creating table GRADES_FACT_FEX1
prompt ===============================
prompt
create table DW.GRADES_FACT_FEX1
(
  loc_county_dist_id CHAR(6),
  stu_key            VARCHAR2(19),
  course_key         VARCHAR2(35),
  course_id          VARCHAR2(14),
  staff_key          VARCHAR2(62),
  school_year        CHAR(4),
  grade_lvl_id       VARCHAR2(2),
  grading_period     VARCHAR2(1),
  grades_type        VARCHAR2(53),
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  sec_nbr_grd        VARCHAR2(10),
  sec_conduct_grd    VARCHAR2(3),
  sec_letter_grd     VARCHAR2(4),
  credits_attempted  NUMBER(6,2),
  credits_earned     NUMBER(6,2),
  credits_denied     NUMBER(6,2),
  elem_effort        CHAR(1),
  elem_std18         CHAR(1),
  elem_std12         CHAR(1),
  elem_std8          CHAR(1),
  elem_std15         CHAR(1),
  elem_performance   CHAR(1),
  elem_std16         CHAR(1),
  elem_std13         CHAR(1),
  elem_std14         CHAR(1),
  elem_std3          CHAR(1),
  elem_std7          CHAR(1),
  elem_std11         CHAR(1),
  elem_std17         CHAR(1),
  elem_std2          CHAR(1),
  elem_std10         CHAR(1),
  elem_std5          CHAR(1),
  elem_std4          CHAR(1),
  elem_std1          CHAR(1),
  elem_std6          CHAR(1),
  elem_std9          CHAR(1),
  elem_mark          VARCHAR2(2),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(15)
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
create bitmap index DW.BIX_GRADES_CDC on DW.GRADES_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create bitmap index DW.BIX_GRADES_GRADESTYPE on DW.GRADES_FACT_FEX1 (GRADES_TYPE)
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
create bitmap index DW.BIX_GRADES_STUKEY on DW.GRADES_FACT_FEX1 (STU_KEY)
  tablespace DW_DEFAULT01
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
prompt Creating table GRADES_GPA_FACT_FEX1
prompt ===================================
prompt
create table DW.GRADES_GPA_FACT_FEX1
(
  loc_county_dist_id CHAR(6) not null,
  stu_key            VARCHAR2(19) not null,
  date_id            VARCHAR2(32) not null,
  grade_lvl_id       VARCHAR2(2),
  grading_period     CHAR(4),
  school_year        CHAR(4),
  gpa_grade          NUMBER(8,4),
  gpa_2              NUMBER(8,4),
  gpa_3              NUMBER(8,4),
  gpa_4              NUMBER(8,4),
  tot_periods        CHAR(2),
  tot_grades         CHAR(2),
  gpa_gpa2           FLOAT,
  gpa_gpa3           FLOAT,
  gpa_gpa4           FLOAT,
  tot_points         VARCHAR2(256 CHAR)
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
create bitmap index DW.BIX_GRADES_GPA_FACT_FEX1_CDC on DW.GRADES_GPA_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create bitmap index DW.BIX_GRADES_GPA_STUKEY on DW.GRADES_GPA_FACT_FEX1 (STU_KEY)
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
prompt Creating table LDAP_BURST_FEX1
prompt ==============================
prompt
create table DW.LDAP_BURST_FEX1
(
  entry_id    VARCHAR2(40 CHAR),
  r10location VARCHAR2(161 CHAR),
  dn          VARCHAR2(161 CHAR),
  mail        VARCHAR2(161 CHAR),
  cdn         VARCHAR2(161 CHAR),
  uid         VARCHAR2(161 CHAR)
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
prompt Creating table LEDGER_FACT_FEX1
prompt ===============================
prompt
create table DW.LEDGER_FACT_FEX1
(
  loc_county_dist_id CHAR(6),
  fund_key           VARCHAR2(25),
  function_key       VARCHAR2(25),
  object_key         VARCHAR2(25),
  progarm_intent_key VARCHAR2(25),
  loc_key            VARCHAR2(25),
  ledger_type        VARCHAR2(11),
  amount             VARCHAR2(340 CHAR),
  budget             VARCHAR2(340 CHAR),
  appropriation      CHAR(340 CHAR),
  encumbrances       CHAR(340 CHAR),
  fiscal_year        VARCHAR2(4),
  fiscal_period      VARCHAR2(4),
  local_option_code  VARCHAR2(3)
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
create index DW.bxi_ledger_cdc on DW.LEDGER_FACT_FEX1 (LOC_COUNTY_DIST_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table LOCATION_DIM_DEX1
prompt ================================
prompt
create table DW.LOCATION_DIM_DEX1
(
  loc_county_dist_id     CHAR(6),
  loc_district           VARCHAR2(40),
  loc_id                 VARCHAR2(21),
  loc_desc               VARCHAR2(40),
  loc_shrt_desc          VARCHAR2(40),
  loc_abbrev             VARCHAR2(25),
  loc_principal_name     VARCHAR2(35),
  loc_state_type         VARCHAR2(10),
  loc_local_type         VARCHAR2(50),
  loc_addr_1             VARCHAR2(35),
  loc_addr_2             VARCHAR2(35),
  loc_city               VARCHAR2(24),
  loc_state              VARCHAR2(2),
  loc_zip                VARCHAR2(10),
  loc_schl_year          CHAR(4),
  loc_phone              VARCHAR2(20),
  loc_term               VARCHAR2(1),
  loc_periods            NUMBER(2),
  loc_ch_ed_cd           VARCHAR2(10),
  loc_attendnce_goal     CHAR(1),
  loc_cost               CHAR(1),
  loc_frl_quartile       CHAR(1),
  loc_area_desc          VARCHAR2(10),
  loc_title_1_flag       CHAR(1),
  loc_principal_ext      CHAR(4),
  loc_admin_type         CHAR(17),
  loc_aaa_flag           CHAR(1),
  loc_square_footage     CHAR(1),
  loc_target_asst_flag   CHAR(1),
  loc_area_id            VARCHAR2(2),
  loc_uil_classification VARCHAR2(10),
  loc_area_long_id       VARCHAR2(10),
  loc_fte_hours          CHAR(1),
  loc_area_shrt_desc     CHAR(1),
  loc_imp_target         CHAR(1),
  loc_key                VARCHAR2(55) not null
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
create bitmap index DW.BIX_LOCATION_DIM_DEX1_CDC on DW.LOCATION_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
alter table DW.LOCATION_DIM_DEX1
  add constraint PK_LOCATION_DIM_DEX1 primary key (LOC_KEY)
  using index 
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
alter index DW.PK_LOCATION_DIM_DEX1 nologging;

prompt
prompt Creating table MERGE_DIST_LOC
prompt =============================
prompt
create table DW.MERGE_DIST_LOC
(
  uid        VARCHAR2(140 CHAR) not null,
  ldap_group VARCHAR2(19 CHAR) not null,
  burst_type CHAR(32 CHAR)
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
prompt Creating table OBJECT_DIM_DEX1
prompt ==============================
prompt
create table DW.OBJECT_DIM_DEX1
(
  loc_county_dist_id     CHAR(6),
  object_key             VARCHAR2(25) not null,
  object_id              VARCHAR2(10),
  obj_account_class      VARCHAR2(40),
  obj_account_class_desc VARCHAR2(100),
  obj_major              VARCHAR2(13),
  obj_major_desc         VARCHAR2(100),
  obj_detail             VARCHAR2(14),
  obj_detail_desc        VARCHAR2(125),
  object_desc            VARCHAR2(125)
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
create bitmap index DW.BIX_OBJECT_DIM_DEX1_CDC on DW.OBJECT_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
alter table DW.OBJECT_DIM_DEX1
  add constraint PK_OBJECT_DIM_DEX1 primary key (OBJECT_KEY)
  using index 
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
alter index DW.PK_OBJECT_DIM_DEX1 nologging;

prompt
prompt Creating table PROGRAM_INTENT_DIM_DEX1
prompt ======================================
prompt
create table DW.PROGRAM_INTENT_DIM_DEX1
(
  program_intent_key  VARCHAR2(25),
  program_intent_code VARCHAR2(16),
  program_intent_desc VARCHAR2(150),
  loc_county_dist_id  CHAR(6)
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
create bitmap index DW.PROGRAM_INTENT_DIM_DEX1 on DW.PROGRAM_INTENT_DIM_DEX1 (PROGRAM_INTENT_KEY)
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
prompt Creating table STAFF_ABSENT_FACT_FEX1
prompt =====================================
prompt
create table DW.STAFF_ABSENT_FACT_FEX1
(
  loc_county_dist_id  VARCHAR2(25) not null,
  sta_absence_id      VARCHAR2(40),
  staff_key           VARCHAR2(47),
  abt_key             VARCHAR2(40),
  sta_reason_id       VARCHAR2(25),
  sta_date_id         VARCHAR2(10),
  loc_key             VARCHAR2(20),
  sta_substitute_id   VARCHAR2(25),
  sta_substitute_name VARCHAR2(35),
  sta_substitute_type VARCHAR2(25),
  abr_key             VARCHAR2(40),
  sta_dur_days        NUMBER,
  sta_hrs_leave       NUMBER
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
create bitmap index DW.BIX_ST_ABS_FACT_FEX1_CDC on DW.STAFF_ABSENT_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create index DW.PK_STAFF_ABSENT_FACT_FEX1 on DW.STAFF_ABSENT_FACT_FEX1 (STA_ABSENCE_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table STAFF_ABSENT_RSN_DIM_DEX1
prompt ========================================
prompt
create table DW.STAFF_ABSENT_RSN_DIM_DEX1
(
  loc_county_dist_id CHAR(6),
  abr_key            VARCHAR2(40) not null,
  abr_id             VARCHAR2(40),
  abr_description    VARCHAR2(50),
  abr_grouping       CHAR(6),
  abr_ytd_count      NUMBER,
  abr_total_count    NUMBER
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
alter table DW.STAFF_ABSENT_RSN_DIM_DEX1
  add constraint PK_STAFF_ABSENT_RSN_DIM_DEX1 primary key (ABR_KEY)
  using index 
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
alter index DW.PK_STAFF_ABSENT_RSN_DIM_DEX1 nologging;

prompt
prompt Creating table STAFF_ABSENT_TYPE_DIM_DEX1
prompt =========================================
prompt
create table DW.STAFF_ABSENT_TYPE_DIM_DEX1
(
  loc_county_dist_id CHAR(6),
  abt_key            VARCHAR2(40),
  abt_id             VARCHAR2(40),
  abt_description    VARCHAR2(50),
  abt_grouping       VARCHAR2(40),
  abt_ytd_count      NUMBER,
  abt_total_count    NUMBER
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
create bitmap index DW.BIX_ST_ABS_TYPE_DIM_DEX1_CDC on DW.STAFF_ABSENT_TYPE_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create unique index DW.PK_ST_ABS_TYPE_DIM_DEX1 on DW.STAFF_ABSENT_TYPE_DIM_DEX1 (ABT_KEY)
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
prompt Creating table STAFF_DIM_DEX1
prompt =============================
prompt
create table DW.STAFF_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  staff_key          VARCHAR2(51),
  staff_id           VARCHAR2(12),
  staff_full_name    VARCHAR2(70),
  staff_last_name    VARCHAR2(35),
  staff_first_name   VARCHAR2(35),
  staff_city         VARCHAR2(35),
  staff_state        VARCHAR2(10),
  staff_zip          VARCHAR2(10),
  staff_edu_lvl      CHAR(5),
  staff_race         VARCHAR2(25),
  staff_ethnicity    VARCHAR2(45),
  staff_gender       VARCHAR2(20),
  staff_type         VARCHAR2(30),
  staff_job_code     VARCHAR2(30),
  staff_job_code_dt  VARCHAR2(10),
  staff_yrs_in_jb_cd VARCHAR2(2),
  staff_yrs_ttl_exp  VARCHAR2(2),
  staff_growth_plan  CHAR(1),
  staff_middle_name  VARCHAR2(35),
  race_ethnicity_key VARCHAR2(6)
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
create bitmap index DW.BIX_STAFF_DIM_DEX1_CDC on DW.STAFF_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
prompt Creating table STAFF_FUNC_DIM_DEX1
prompt ==================================
prompt
create table DW.STAFF_FUNC_DIM_DEX1
(
  record_type_cd   VARCHAR2(4 CHAR) not null,
  record_type_desc VARCHAR2(255 CHAR) not null
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
prompt Creating table STAFF_QUALIFICATIONS_DIM_DEX1
prompt ============================================
prompt
create table DW.STAFF_QUALIFICATIONS_DIM_DEX1
(
  loc_county_dist_id    VARCHAR2(6),
  qlf_key               VARCHAR2(25),
  qlf_category          VARCHAR2(25),
  qlf_category_desc     VARCHAR2(50),
  qlf_subject_area      VARCHAR2(50),
  qlf_subject_area_desc VARCHAR2(75),
  qlf_type              VARCHAR2(25),
  qlf_type_desc         VARCHAR2(50),
  qlf_sub_type          VARCHAR2(25),
  qlf_sub_type_desc     VARCHAR2(55),
  qlf_id                VARCHAR2(20),
  qlf_description       VARCHAR2(75),
  qlf_contrbutes_to     VARCHAR2(25),
  qlf_credit_type       VARCHAR2(25)
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
create index DW.pk_qlf_key on DW.STAFF_QUALIFICATIONS_DIM_DEX1 (QLF_KEY)
  tablespace DW_DEFAULT01
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
prompt Creating table STAFF_QUALIFICATIONS_FACT_FEX1
prompt =============================================
prompt
create table DW.STAFF_QUALIFICATIONS_FACT_FEX1
(
  loc_county_dist_id   VARCHAR2(6),
  staff_key            VARCHAR2(51),
  qualification_key    VARCHAR2(25),
  earned_date_id       VARCHAR2(10),
  issue_date_id        VARCHAR2(10),
  expiration_date_id   VARCHAR2(10),
  activity_name        VARCHAR2(50),
  activity_description VARCHAR2(75),
  points_earned        VARCHAR2(10),
  credits_earned       VARCHAR2(10),
  hours_earned         VARCHAR2(10),
  score1               VARCHAR2(10),
  score2               VARCHAR2(10),
  score3               VARCHAR2(10),
  score4               VARCHAR2(10),
  score5               VARCHAR2(10),
  growth_plan          VARCHAR2(10)
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
prompt Creating table STAFF_SCHDL_FACT_FEX1
prompt ====================================
prompt
create table DW.STAFF_SCHDL_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  loc_key            VARCHAR2(55),
  course_key         VARCHAR2(55),
  staff_key          VARCHAR2(51),
  schl_year          VARCHAR2(43),
  section_id         VARCHAR2(18),
  term               VARCHAR2(5),
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  max_seats          NUMBER(3),
  occupancy_term_1   VARCHAR2(4),
  occupancy_term_2   VARCHAR2(4),
  building           VARCHAR2(3),
  room               VARCHAR2(10),
  fefp_funding_nbr   VARCHAR2(1),
  scheduling_mthd    VARCHAR2(3),
  from_grd_lvl       VARCHAR2(2),
  to_grd_lvl         VARCHAR2(2),
  instructional_stng VARCHAR2(3),
  record_key         VARCHAR2(51),
  fte_elgblty_flag   CHAR(1),
  occup_cmpltn_pts   NUMBER(1),
  to_date            VARCHAR2(9),
  adlt_spcl_inittivs CHAR(1),
  bell_schdl         CHAR(2),
  calendar_1         CHAR(1),
  calendar_2         CHAR(1),
  calendar_3         CHAR(1),
  calendar_4         CHAR(1),
  cert_flag          CHAR(1),
  class_hours        CHAR(1),
  co_enrl_stu_indctr CHAR(1),
  day_1              CHAR(2),
  day_2              CHAR(2),
  day_3              CHAR(2),
  day_4              CHAR(2),
  day_5              CHAR(2),
  day_6              CHAR(2),
  day_night_indctr   CHAR(1),
  drpout_prev_flag   CHAR(1),
  dual_enrlmt_indctr CHAR(1),
  fee_amt_1          CHAR(1),
  fee_amt_2          CHAR(1),
  fee_amt_3          CHAR(1),
  fee_amt_4          CHAR(1),
  fee_amt_5          CHAR(1),
  fee_amt_6          CHAR(1),
  fee_amt_7          CHAR(1),
  fee_amt_8          CHAR(1),
  fee_amt_9          CHAR(1),
  fee_type_1         CHAR(1),
  fee_type_2         CHAR(1),
  fee_type_3         CHAR(1),
  fee_type_4         CHAR(1),
  fee_type_5         CHAR(1),
  fee_type_6         CHAR(1),
  fee_type_7         CHAR(1),
  fee_type_8         CHAR(1),
  fee_type_9         CHAR(1),
  fmly_ltrcy_program CHAR(1),
  from_date          VARCHAR2(9),
  from_hour          VARCHAR2(2),
  from_minute        VARCHAR2(2),
  gateway_program    CHAR(1),
  grd_elgblty_flag   CHAR(1),
  hgly_qlified_tchr  NUMBER(2),
  incarceration_flag CHAR(1),
  mnts_per_week      CHAR(1),
  nbr_dys_in_week    CHAR(1),
  program_lngth      CHAR(1),
  section_team       CHAR(1),
  spec_ed_flag       CHAR(1),
  to_hour            VARCHAR2(2),
  to_minute          VARCHAR2(2),
  voc_intent         CHAR(1),
  voc_spcl_inittivs  CHAR(1),
  voc_stng           CHAR(1),
  voc_subprgrm       CHAR(1),
  staff_id           VARCHAR2(12),
  grading_eligiblity VARCHAR2(1 CHAR),
  grade              VARCHAR2(4000 CHAR)
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
create bitmap index DW.BIX_STAFF_SCHDL_FACT_FEX1_CDC on DW.STAFF_SCHDL_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create index DW.IX_SSFACT_COURSEKEY on DW.STAFF_SCHDL_FACT_FEX1 (COURSE_KEY)
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
prompt Creating table STUDENT_DIM_DEX1
prompt ===============================
prompt
create table DW.STUDENT_DIM_DEX1
(
  loc_county_dist_id   CHAR(6),
  stu_key              VARCHAR2(55),
  stu_id               VARCHAR2(12),
  stu_id_2             VARCHAR2(13),
  stu_full_name        VARCHAR2(50),
  stu_last_name        VARCHAR2(40),
  stu_first_name       VARCHAR2(25),
  stu_middle_name      VARCHAR2(32),
  stu_birth_dt         VARCHAR2(32),
  stu_addr_1           VARCHAR2(40),
  stu_addr_2           VARCHAR2(30),
  stu_city             VARCHAR2(24),
  stu_state            VARCHAR2(20),
  stu_zip              VARCHAR2(10),
  stu_study_area_cd    VARCHAR2(10),
  stu_phone_1          VARCHAR2(21),
  stu_phone_2          VARCHAR2(21),
  stu_phone_3          VARCHAR2(21),
  stu_gender           VARCHAR2(1),
  stu_race             CHAR(1),
  stu_ethnicity        VARCHAR2(40),
  stu_free_rduc_lnch   VARCHAR2(40),
  stu_last_schl        VARCHAR2(10),
  stu_cur_schl         VARCHAR2(40),
  stu_next_schl        VARCHAR2(10),
  stu_last_grd_lvl     VARCHAR2(2),
  stu_cur_grd_lvl      VARCHAR2(2),
  stu_nxt_grd_lvl      VARCHAR2(5),
  stu_last_hmroom      CHAR(1),
  stu_cur_hmroom       VARCHAR2(6),
  stu_next_hmroom      VARCHAR2(5),
  stu_cumulative_gpa   NUMBER(8,4),
  stu_cumulative_gpa_2 NUMBER(8,4),
  stu_cumulative_gpa_3 NUMBER(8,4),
  stu_cumulative_gpa_4 NUMBER(8,4),
  stu_honors_gpa       NUMBER(8,4),
  stu_class_rank       NUMBER(4),
  stu_class_rank_2     NUMBER(4),
  stu_class_rank_3     NUMBER(4),
  stu_class_rank_4     NUMBER(4),
  stu_entry_dt         VARCHAR2(32),
  stu_withdrawal_cd    VARCHAR2(40),
  stu_withdrawal_dt    VARCHAR2(32),
  stu_nbr_of_rtntns    CHAR(1),
  stu_present_cnt      CHAR(1),
  stu_tardy_cnt        CHAR(1),
  stu_abs_unv_cnt      CHAR(1),
  stu_abs_exc_cnt      CHAR(1),
  stu_abs_unexc_cnt    CHAR(1),
  stu_dis_event_cnt    CHAR(1),
  stu_dis_inc_cnt      CHAR(1),
  stu_dis_act_cnt      CHAR(1),
  stu_oos_susp_dys     CHAR(1),
  stu_oos_susp_cnt     CHAR(1),
  stu_is_susp_dys      CHAR(1),
  stu_is_susp_cnt      CHAR(1),
  stu_det_dys          CHAR(1),
  stu_det_cnt          CHAR(1),
  stu_bus_susp_dys     CHAR(1),
  stu_bus_susp_cnt     CHAR(1),
  stu_altplc_sus_dys   CHAR(1),
  stu_plcpen_exp_dys   CHAR(1),
  stu_plc_il_exp_dys   CHAR(1),
  stu_lst_dis_ev_dt    VARCHAR2(32),
  stu_lst_dis_act_dt   VARCHAR2(32),
  stu_lst_oos_dt       VARCHAR2(32),
  stu_lst_is_dt        VARCHAR2(32),
  stu_lst_det_dt       VARCHAR2(32),
  stu_credits_atmptd   NUMBER(7,3),
  stu_credits_ernd     NUMBER(7,3),
  stu_grad_dt          VARCHAR2(32),
  stu_grad_type        VARCHAR2(40),
  stu_flag_504         CHAR(1),
  stu_lep_code         VARCHAR2(40),
  stu_lep_entry_dt     VARCHAR2(32),
  stu_lep_exit_dt      VARCHAR2(32),
  stu_pri_lang         VARCHAR2(40),
  stu_sec_lang         VARCHAR2(40),
  stu_parent_lang      VARCHAR2(40),
  stu_beg_9_grd_yr     VARCHAR2(32),
  stu_aip_participat   CHAR(1),
  stu_birth_cntry      VARCHAR2(40),
  stu_dt_entrd_cntry   VARCHAR2(32),
  stu_sup_acad_imp     CHAR(1),
  stu_last_team        VARCHAR2(32),
  stu_cur_team         VARCHAR2(32),
  stu_next_team        VARCHAR2(32),
  stu_primary_ese_cd   VARCHAR2(32),
  stu_erly_clg_entry   CHAR(1),
  stu_inrly_clg_ntry   VARCHAR2(40),
  stu_single_parent    CHAR(1),
  stu_homeless         VARCHAR2(1),
  stu_proret_lst_yr    VARCHAR2(40),
  stu_in_intnsv_rdng   CHAR(1),
  stu_in_intnsv_math   CHAR(1),
  stu_in_intnsv_la     CHAR(1),
  stu_is_veteran       CHAR(1),
  stu_is_handicapped   VARCHAR2(40),
  stu_is_teen_parent   CHAR(1),
  stu_smrschl_status   VARCHAR2(3),
  stu_is_at_risk       CHAR(1),
  stu_is_migrant       VARCHAR2(1),
  stu_is_tag           VARCHAR2(1),
  stu_is_immigrant     VARCHAR2(30),
  stu_ale_status       VARCHAR2(32),
  stu_pk_status        CHAR(1),
  stu_live_with_cd     CHAR(1),
  stu_title1_status    VARCHAR2(32),
  stu_506_status       CHAR(1),
  stu_mile_dist        CHAR(1),
  stu_trans_zone       NUMBER,
  stu_parent_ed_lvl    CHAR(1),
  stu_allocated_schl   VARCHAR2(20),
  stu_transfer_reason  VARCHAR2(3),
  schl_yr              VARCHAR2(4),
  stu_inoculations     VARCHAR2(3),
  stu_alloc_district   VARCHAR2(6),
  stu_resid_district   VARCHAR2(6),
  stu_uil              CHAR(1),
  stu_dose_in_series   CHAR(1),
  stu_immunization_dt  VARCHAR2(32),
  stu_dtp              CHAR(1),
  race_ethnicity_key   VARCHAR2(6)
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
create bitmap index DW.BIX_STUDENT_DIM_DEX1_CDC on DW.STUDENT_DIM_DEX1 (LOC_COUNTY_DIST_ID)
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
create index DW.IX_STU_DIM_STUKEY on DW.STUDENT_DIM_DEX1 (STU_KEY)
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
prompt Creating table STUDENT_EXPECTATION_2010
prompt =======================================
prompt
create table DW.STUDENT_EXPECTATION_2010
(
  grade               VARCHAR2(2),
  language            VARCHAR2(1),
  subject             VARCHAR2(14),
  item_number         VARCHAR2(2),
  objective           VARCHAR2(2),
  student_expectation VARCHAR2(20),
  test_date           DATE
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
prompt Creating table STUDENT_EXPECTATION_2011
prompt =======================================
prompt
create table DW.STUDENT_EXPECTATION_2011
(
  grade               VARCHAR2(2),
  language            VARCHAR2(1),
  subject             VARCHAR2(14),
  item_number         VARCHAR2(2),
  objective           VARCHAR2(2),
  student_expectation VARCHAR2(20),
  test_date           DATE
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
prompt Creating table STU_SCHEDULE_FACT_FEX1
prompt =====================================
prompt
create table DW.STU_SCHEDULE_FACT_FEX1
(
  loc_county_dist_id CHAR(6),
  record_key         VARCHAR2(55),
  staff_sched_key    VARCHAR2(55),
  school_year        CHAR(4),
  stu_key            VARCHAR2(55),
  loc_key            VARCHAR2(55),
  course_key         VARCHAR2(55),
  section            VARCHAR2(18),
  from_dt            VARCHAR2(32),
  from_time_hour     CHAR(2),
  from_time_min      CHAR(2),
  from_period        VARCHAR2(8),
  to_dt              VARCHAR2(32),
  to_time_hour       CHAR(2),
  to_time_min        CHAR(2),
  to_period          VARCHAR2(8),
  term_code          VARCHAR2(2),
  status             VARCHAR2(16),
  fte_pgm_code       CHAR(1),
  fte_eligibility    VARCHAR2(1),
  occup_comp_pts     CHAR(2),
  sub_program        VARCHAR2(40),
  grading_eligiblity VARCHAR2(1),
  rspbl_rdng_instr   CHAR(1),
  rspbl_writ_instr   CHAR(1),
  rspbl_math_instr   CHAR(1),
  rspbl_sci_instr    CHAR(1)
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
create bitmap index DW.BIX_STU_SCHEDULE_FACT_FEX1_CDC on DW.STU_SCHEDULE_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
create bitmap index DW.BIX_STU_SCHEDULE_STUKEY on DW.STU_SCHEDULE_FACT_FEX1 (STU_KEY)
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
create index DW.IX_STU_STAFF_SCHED_KEY on DW.STU_SCHEDULE_FACT_FEX1 (STAFF_SCHED_KEY)
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
prompt Creating table TESTED_LOCAL_STUDENT
prompt ===================================
prompt
create table DW.TESTED_LOCAL_STUDENT
(
  stu_detail_id  NUMBER(11) not null,
  stu_id_2       VARCHAR2(9) not null,
  last_name      VARCHAR2(15),
  first_name     VARCHAR2(10),
  middle_initial CHAR(1),
  birth_date     DATE,
  gender         CHAR(1),
  stu_local_id   VARCHAR2(9),
  district_id    VARCHAR2(6) not null
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
create unique index DW.UX_TESTED_LOCAL_STUDENT_STUID2 on DW.TESTED_LOCAL_STUDENT (STU_ID_2)
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
create unique index DW.UX_TESTED_LOCAL_STU_DETAIL_ID on DW.TESTED_LOCAL_STUDENT (STU_DETAIL_ID)
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
prompt Creating table TESTED_LOCAL_STUDENT_DETAIL
prompt ==========================================
prompt
create table DW.TESTED_LOCAL_STUDENT_DETAIL
(
  stu_detail_id              NUMBER(11) not null,
  stu_id_2                   VARCHAR2(9) not null,
  grade_tested               VARCHAR2(2) not null,
  subject_name               VARCHAR2(14) not null,
  test_date                  DATE not null,
  test_type_cd               CHAR(1) not null,
  test_language_cd           CHAR(1) not null,
  test_program_cd            VARCHAR2(5) not null,
  test_mode_cd               VARCHAR2(5) not null,
  test_num                   VARCHAR2(2) not null,
  test_version               VARCHAR2(1) not null,
  test_desc                  VARCHAR2(22) not null,
  esc_region_num             VARCHAR2(2),
  esc_region_name            VARCHAR2(9),
  school_year                VARCHAR2(9) not null,
  district_name              VARCHAR2(15),
  district_id                VARCHAR2(6) not null,
  campus_id                  VARCHAR2(3) not null,
  test_admin_site            VARCHAR2(9) not null,
  stu_local_id               VARCHAR2(10),
  gender                     CHAR(1),
  ethnicity                  CHAR(1),
  econ_disadvantaged         CHAR(1),
  titlei                     CHAR(1),
  migrant                    CHAR(1),
  lep                        CHAR(1),
  bilingual                  CHAR(1),
  esl                        CHAR(1),
  special_education          CHAR(1),
  gifted_talented            CHAR(1),
  at_risk                    CHAR(1),
  career_tech                CHAR(1),
  score_cd                   CHAR(1),
  scale_score                NUMBER(5),
  quantile                   VARCHAR2(5),
  lexile                     VARCHAR2(5),
  raw_score                  NUMBER(4),
  composition_score          NUMBER(4),
  short_ansr1_score          CHAR(1),
  short_ansr2_score          CHAR(1),
  short_ansr3_score          CHAR(1),
  met_local_standard         CHAR(1),
  commended                  CHAR(1),
  met_higher_ed_std          CHAR(1),
  online_test                CHAR(1),
  adj_raw_score              NUMBER(4),
  proficiency_level          CHAR(1),
  aeis_district              CHAR(1),
  aeis_campus                CHAR(1),
  ayp_district               CHAR(1),
  ayp_campus                 CHAR(1),
  objective_literal01        VARCHAR2(2),
  objective_literal02        VARCHAR2(2),
  objective_literal03        VARCHAR2(2),
  objective_literal04        VARCHAR2(2),
  objective_literal05        VARCHAR2(2),
  objective_literal06        VARCHAR2(2),
  objective_literal07        VARCHAR2(2),
  objective_literal08        VARCHAR2(2),
  objective_literal09        VARCHAR2(2),
  objective_literal10        VARCHAR2(2),
  objective_score01          NUMBER(2),
  objective_score02          NUMBER(2),
  objective_score03          NUMBER(2),
  objective_score04          NUMBER(2),
  objective_score05          NUMBER(2),
  objective_score06          NUMBER(2),
  objective_score07          NUMBER(2),
  objective_score08          NUMBER(2),
  objective_score09          NUMBER(2),
  objective_score10          NUMBER(2),
  question_literal01         VARCHAR2(2),
  question_literal02         VARCHAR2(2),
  question_literal03         VARCHAR2(2),
  question_literal04         VARCHAR2(2),
  question_literal05         VARCHAR2(2),
  question_literal06         VARCHAR2(2),
  question_literal07         VARCHAR2(2),
  question_literal08         VARCHAR2(2),
  question_literal09         VARCHAR2(2),
  question_literal10         VARCHAR2(2),
  question_literal11         VARCHAR2(2),
  question_literal12         VARCHAR2(2),
  question_literal13         VARCHAR2(2),
  question_literal14         VARCHAR2(2),
  question_literal15         VARCHAR2(2),
  question_literal16         VARCHAR2(2),
  question_literal17         VARCHAR2(2),
  question_literal18         VARCHAR2(2),
  question_literal19         VARCHAR2(2),
  question_literal20         VARCHAR2(2),
  question_literal21         VARCHAR2(2),
  question_literal22         VARCHAR2(2),
  question_literal23         VARCHAR2(2),
  question_literal24         VARCHAR2(2),
  question_literal25         VARCHAR2(2),
  question_literal26         VARCHAR2(2),
  question_literal27         VARCHAR2(2),
  question_literal28         VARCHAR2(2),
  question_literal29         VARCHAR2(2),
  question_literal30         VARCHAR2(2),
  question_literal31         VARCHAR2(2),
  question_literal32         VARCHAR2(2),
  question_literal33         VARCHAR2(2),
  question_literal34         VARCHAR2(2),
  question_literal35         VARCHAR2(2),
  question_literal36         VARCHAR2(2),
  question_literal37         VARCHAR2(2),
  question_literal38         VARCHAR2(2),
  question_literal39         VARCHAR2(2),
  question_literal40         VARCHAR2(2),
  question_literal41         VARCHAR2(2),
  question_literal42         VARCHAR2(2),
  question_literal43         VARCHAR2(2),
  question_literal44         VARCHAR2(2),
  question_literal45         VARCHAR2(2),
  question_literal46         VARCHAR2(2),
  question_literal47         VARCHAR2(2),
  question_literal48         VARCHAR2(2),
  question_literal49         VARCHAR2(2),
  question_literal50         VARCHAR2(2),
  question_literal51         VARCHAR2(2),
  question_literal52         VARCHAR2(2),
  question_literal53         VARCHAR2(2),
  question_literal54         VARCHAR2(2),
  question_literal55         VARCHAR2(2),
  question_literal56         VARCHAR2(2),
  question_literal57         VARCHAR2(2),
  question_literal58         VARCHAR2(2),
  question_literal59         VARCHAR2(2),
  question_literal60         VARCHAR2(2),
  objective_num01            VARCHAR2(2),
  objective_num02            VARCHAR2(2),
  objective_num03            VARCHAR2(2),
  objective_num04            VARCHAR2(2),
  objective_num05            VARCHAR2(2),
  objective_num06            VARCHAR2(2),
  objective_num07            VARCHAR2(2),
  objective_num08            VARCHAR2(2),
  objective_num09            VARCHAR2(2),
  objective_num10            VARCHAR2(2),
  objective_num11            VARCHAR2(2),
  objective_num12            VARCHAR2(2),
  objective_num13            VARCHAR2(2),
  objective_num14            VARCHAR2(2),
  objective_num15            VARCHAR2(2),
  objective_num16            VARCHAR2(2),
  objective_num17            VARCHAR2(2),
  objective_num18            VARCHAR2(2),
  objective_num19            VARCHAR2(2),
  objective_num20            VARCHAR2(2),
  objective_num21            VARCHAR2(2),
  objective_num22            VARCHAR2(2),
  objective_num23            VARCHAR2(2),
  objective_num24            VARCHAR2(2),
  objective_num25            VARCHAR2(2),
  objective_num26            VARCHAR2(2),
  objective_num27            VARCHAR2(2),
  objective_num28            VARCHAR2(2),
  objective_num29            VARCHAR2(2),
  objective_num30            VARCHAR2(2),
  objective_num31            VARCHAR2(2),
  objective_num32            VARCHAR2(2),
  objective_num33            VARCHAR2(2),
  objective_num34            VARCHAR2(2),
  objective_num35            VARCHAR2(2),
  objective_num36            VARCHAR2(2),
  objective_num37            VARCHAR2(2),
  objective_num38            VARCHAR2(2),
  objective_num39            VARCHAR2(2),
  objective_num40            VARCHAR2(2),
  objective_num41            VARCHAR2(2),
  objective_num42            VARCHAR2(2),
  objective_num43            VARCHAR2(2),
  objective_num44            VARCHAR2(2),
  objective_num45            VARCHAR2(2),
  objective_num46            VARCHAR2(2),
  objective_num47            VARCHAR2(2),
  objective_num48            VARCHAR2(2),
  objective_num49            VARCHAR2(2),
  objective_num50            VARCHAR2(2),
  objective_num51            VARCHAR2(2),
  objective_num52            VARCHAR2(2),
  objective_num53            VARCHAR2(2),
  objective_num54            VARCHAR2(2),
  objective_num55            VARCHAR2(2),
  objective_num56            VARCHAR2(2),
  objective_num57            VARCHAR2(2),
  objective_num58            VARCHAR2(2),
  objective_num59            VARCHAR2(2),
  objective_num60            VARCHAR2(2),
  response01                 CHAR(1),
  response02                 CHAR(1),
  response03                 CHAR(1),
  response04                 CHAR(1),
  response05                 CHAR(1),
  response06                 CHAR(1),
  response07                 CHAR(1),
  response08                 CHAR(1),
  response09                 CHAR(1),
  response10                 CHAR(1),
  response11                 CHAR(1),
  response12                 CHAR(1),
  response13                 CHAR(1),
  response14                 CHAR(1),
  response15                 CHAR(1),
  response16                 CHAR(1),
  response17                 CHAR(1),
  response18                 CHAR(1),
  response19                 CHAR(1),
  response20                 CHAR(1),
  response21                 CHAR(1),
  response22                 CHAR(1),
  response23                 CHAR(1),
  response24                 CHAR(1),
  response25                 CHAR(1),
  response26                 CHAR(1),
  response27                 CHAR(1),
  response28                 CHAR(1),
  response29                 CHAR(1),
  response30                 CHAR(1),
  response31                 CHAR(1),
  response32                 CHAR(1),
  response33                 CHAR(1),
  response34                 CHAR(1),
  response35                 CHAR(1),
  response36                 CHAR(1),
  response37                 CHAR(1),
  response38                 CHAR(1),
  response39                 CHAR(1),
  response40                 CHAR(1),
  response41                 CHAR(1),
  response42                 CHAR(1),
  response43                 CHAR(1),
  response44                 CHAR(1),
  response45                 CHAR(1),
  response46                 CHAR(1),
  response47                 CHAR(1),
  response48                 CHAR(1),
  response49                 CHAR(1),
  response50                 CHAR(1),
  response51                 CHAR(1),
  response52                 CHAR(1),
  response53                 CHAR(1),
  response54                 CHAR(1),
  response55                 CHAR(1),
  response56                 CHAR(1),
  response57                 CHAR(1),
  response58                 CHAR(1),
  response59                 CHAR(1),
  response60                 CHAR(1),
  correct_answer01           CHAR(1),
  correct_answer02           CHAR(1),
  correct_answer03           CHAR(1),
  correct_answer04           CHAR(1),
  correct_answer05           CHAR(1),
  correct_answer06           CHAR(1),
  correct_answer07           CHAR(1),
  correct_answer08           CHAR(1),
  correct_answer09           CHAR(1),
  correct_answer10           CHAR(1),
  correct_answer11           CHAR(1),
  correct_answer12           CHAR(1),
  correct_answer13           CHAR(1),
  correct_answer14           CHAR(1),
  correct_answer15           CHAR(1),
  correct_answer16           CHAR(1),
  correct_answer17           CHAR(1),
  correct_answer18           CHAR(1),
  correct_answer19           CHAR(1),
  correct_answer20           CHAR(1),
  correct_answer21           CHAR(1),
  correct_answer22           CHAR(1),
  correct_answer23           CHAR(1),
  correct_answer24           CHAR(1),
  correct_answer25           CHAR(1),
  correct_answer26           CHAR(1),
  correct_answer27           CHAR(1),
  correct_answer28           CHAR(1),
  correct_answer29           CHAR(1),
  correct_answer30           CHAR(1),
  correct_answer31           CHAR(1),
  correct_answer32           CHAR(1),
  correct_answer33           CHAR(1),
  correct_answer34           CHAR(1),
  correct_answer35           CHAR(1),
  correct_answer36           CHAR(1),
  correct_answer37           CHAR(1),
  correct_answer38           CHAR(1),
  correct_answer39           CHAR(1),
  correct_answer40           CHAR(1),
  correct_answer41           CHAR(1),
  correct_answer42           CHAR(1),
  correct_answer43           CHAR(1),
  correct_answer44           CHAR(1),
  correct_answer45           CHAR(1),
  correct_answer46           CHAR(1),
  correct_answer47           CHAR(1),
  correct_answer48           CHAR(1),
  correct_answer49           CHAR(1),
  correct_answer50           CHAR(1),
  correct_answer51           CHAR(1),
  correct_answer52           CHAR(1),
  correct_answer53           CHAR(1),
  correct_answer54           CHAR(1),
  correct_answer55           CHAR(1),
  correct_answer56           CHAR(1),
  correct_answer57           CHAR(1),
  correct_answer58           CHAR(1),
  correct_answer59           CHAR(1),
  correct_answer60           CHAR(1),
  response_ind01             CHAR(1),
  response_ind02             CHAR(1),
  response_ind03             CHAR(1),
  response_ind04             CHAR(1),
  response_ind05             CHAR(1),
  response_ind06             CHAR(1),
  response_ind07             CHAR(1),
  response_ind08             CHAR(1),
  response_ind09             CHAR(1),
  response_ind10             CHAR(1),
  response_ind11             CHAR(1),
  response_ind12             CHAR(1),
  response_ind13             CHAR(1),
  response_ind14             CHAR(1),
  response_ind15             CHAR(1),
  response_ind16             CHAR(1),
  response_ind17             CHAR(1),
  response_ind18             CHAR(1),
  response_ind19             CHAR(1),
  response_ind20             CHAR(1),
  response_ind21             CHAR(1),
  response_ind22             CHAR(1),
  response_ind23             CHAR(1),
  response_ind24             CHAR(1),
  response_ind25             CHAR(1),
  response_ind26             CHAR(1),
  response_ind27             CHAR(1),
  response_ind28             CHAR(1),
  response_ind29             CHAR(1),
  response_ind30             CHAR(1),
  response_ind31             CHAR(1),
  response_ind32             CHAR(1),
  response_ind33             CHAR(1),
  response_ind34             CHAR(1),
  response_ind35             CHAR(1),
  response_ind36             CHAR(1),
  response_ind37             CHAR(1),
  response_ind38             CHAR(1),
  response_ind39             CHAR(1),
  response_ind40             CHAR(1),
  response_ind41             CHAR(1),
  response_ind42             CHAR(1),
  response_ind43             CHAR(1),
  response_ind44             CHAR(1),
  response_ind45             CHAR(1),
  response_ind46             CHAR(1),
  response_ind47             CHAR(1),
  response_ind48             CHAR(1),
  response_ind49             CHAR(1),
  response_ind50             CHAR(1),
  response_ind51             CHAR(1),
  response_ind52             CHAR(1),
  response_ind53             CHAR(1),
  response_ind54             CHAR(1),
  response_ind55             CHAR(1),
  response_ind56             CHAR(1),
  response_ind57             CHAR(1),
  response_ind58             CHAR(1),
  response_ind59             CHAR(1),
  response_ind60             CHAR(1),
  obj01_num_questions_tested NUMBER(3),
  obj02_num_questions_tested NUMBER(3),
  obj03_num_questions_tested NUMBER(3),
  obj04_num_questions_tested NUMBER(3),
  obj05_num_questions_tested NUMBER(3),
  obj06_num_questions_tested NUMBER(3),
  obj07_num_questions_tested NUMBER(3),
  obj08_num_questions_tested NUMBER(3),
  obj09_num_questions_tested NUMBER(3),
  obj10_num_questions_tested NUMBER(3),
  percent_correct            NUMBER(5,2),
  obj01_percent_correct      NUMBER(5,2),
  obj02_percent_correct      NUMBER(5,2),
  obj03_percent_correct      NUMBER(5,2),
  obj04_percent_correct      NUMBER(5,2),
  obj05_percent_correct      NUMBER(5,2),
  obj06_percent_correct      NUMBER(5,2),
  obj07_percent_correct      NUMBER(5,2),
  obj08_percent_correct      NUMBER(5,2),
  obj09_percent_correct      NUMBER(5,2),
  obj10_percent_correct      NUMBER(5,2),
  test_key_date              DATE,
  se01                       VARCHAR2(15),
  se02                       VARCHAR2(15),
  se03                       VARCHAR2(15),
  se04                       VARCHAR2(15),
  se05                       VARCHAR2(15),
  se06                       VARCHAR2(15),
  se07                       VARCHAR2(15),
  se08                       VARCHAR2(15),
  se09                       VARCHAR2(15),
  se10                       VARCHAR2(15),
  se11                       VARCHAR2(15),
  se12                       VARCHAR2(15),
  se13                       VARCHAR2(15),
  se14                       VARCHAR2(15),
  se15                       VARCHAR2(15),
  se16                       VARCHAR2(15),
  se17                       VARCHAR2(15),
  se18                       VARCHAR2(15),
  se19                       VARCHAR2(15),
  se20                       VARCHAR2(15),
  se21                       VARCHAR2(15),
  se22                       VARCHAR2(15),
  se23                       VARCHAR2(15),
  se24                       VARCHAR2(15),
  se25                       VARCHAR2(15),
  se26                       VARCHAR2(15),
  se27                       VARCHAR2(15),
  se28                       VARCHAR2(15),
  se29                       VARCHAR2(15),
  se30                       VARCHAR2(15),
  se31                       VARCHAR2(15),
  se32                       VARCHAR2(15),
  se33                       VARCHAR2(15),
  se34                       VARCHAR2(15),
  se35                       VARCHAR2(15),
  se36                       VARCHAR2(15),
  se37                       VARCHAR2(15),
  se38                       VARCHAR2(15),
  se39                       VARCHAR2(15),
  se40                       VARCHAR2(15),
  se41                       VARCHAR2(15),
  se42                       VARCHAR2(15),
  se43                       VARCHAR2(15),
  se44                       VARCHAR2(15),
  se45                       VARCHAR2(15),
  se46                       VARCHAR2(15),
  se47                       VARCHAR2(15),
  se48                       VARCHAR2(15),
  se49                       VARCHAR2(15),
  se50                       VARCHAR2(15),
  se51                       VARCHAR2(15),
  se52                       VARCHAR2(15),
  se53                       VARCHAR2(15),
  se54                       VARCHAR2(15),
  se55                       VARCHAR2(15),
  se56                       VARCHAR2(15),
  se57                       VARCHAR2(15),
  se58                       VARCHAR2(15),
  se59                       VARCHAR2(15),
  se60                       VARCHAR2(15)
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
create unique index DW.UX_TESTED_LOCAL_STU_ID2_SUB_DT on DW.TESTED_LOCAL_STUDENT_DETAIL (STU_ID_2, SUBJECT_NAME, TEST_DATE DESC)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_TESTED_LOC_STU_DETAIL_ALL on DW.TESTED_LOCAL_STUDENT_DETAIL (STU_DETAIL_ID, GRADE_TESTED, SUBJECT_NAME, TEST_DATE DESC, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_TEST_LOC_STU_DETAIL_ID_CADT on DW.TESTED_LOCAL_STUDENT_DETAIL (STU_DETAIL_ID, SUBJECT_NAME, TEST_DATE DESC)
  tablespace DW_DEFAULT01
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
prompt Creating table TESTED_LOCAL_STUDENT_RESPONSE
prompt ============================================
prompt
create table DW.TESTED_LOCAL_STUDENT_RESPONSE
(
  stu_detail_id    NUMBER(11) not null,
  question_num     VARCHAR2(2) not null,
  grade_tested     VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_num         VARCHAR2(2) not null,
  test_version     VARCHAR2(1) not null,
  test_desc        VARCHAR2(22) not null,
  test_date        DATE not null,
  test_type_cd     CHAR(1) not null,
  test_language_cd CHAR(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  response         CHAR(1),
  correct_answer   CHAR(1),
  response_ind     CHAR(1),
  objective_num    VARCHAR2(2),
  expectation_key  VARCHAR2(15)
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
prompt Creating table TESTED_LOCAL_STUDENT_RESULTS
prompt ===========================================
prompt
create table DW.TESTED_LOCAL_STUDENT_RESULTS
(
  stu_detail_id   NUMBER(11) not null,
  expectation_key VARCHAR2(15),
  questions_num   NUMBER(3) not null,
  correct_num     NUMBER(3) not null,
  objective_num   VARCHAR2(2)
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
prompt Creating table TESTED_STUDENT
prompt =============================
prompt
create table DW.TESTED_STUDENT
(
  stu_detail_id  NUMBER(11) not null,
  stu_id_2       VARCHAR2(9) not null,
  last_name      VARCHAR2(15) not null,
  first_name     VARCHAR2(10) not null,
  middle_initial CHAR(1),
  birth_date     VARCHAR2(8),
  gender         CHAR(1)
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
create unique index DW.UX_TESTED_STUDENT_DETAIL_ID on DW.TESTED_STUDENT (STU_DETAIL_ID)
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
create unique index DW.UX_TESTED_STUDENT_STU_ID2_LNM on DW.TESTED_STUDENT (STU_ID_2, LAST_NAME)
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
prompt Creating table TESTED_STUDENT_DETAIL
prompt ====================================
prompt
create table DW.TESTED_STUDENT_DETAIL
(
  stu_detail_id                 NUMBER(11) not null,
  stu_id_2                      VARCHAR2(9) not null,
  grade_tested                  VARCHAR2(2) not null,
  subject_name                  VARCHAR2(14) not null,
  test_date                     DATE not null,
  test_type_cd                  VARCHAR2(1) not null,
  test_language_cd              VARCHAR2(1) not null,
  test_program_cd               VARCHAR2(5) not null,
  test_mode_cd                  VARCHAR2(5) not null,
  esc_region_num                VARCHAR2(2) not null,
  esc_region_name               VARCHAR2(9) not null,
  school_year                   VARCHAR2(9) not null,
  district_name                 VARCHAR2(15) not null,
  district_id                   VARCHAR2(6) not null,
  campus_id                     VARCHAR2(3) not null,
  test_admin_site               VARCHAR2(9) not null,
  fall_peims_id                 VARCHAR2(9),
  fall_peims_ind                VARCHAR2(1),
  stu_local_id                  VARCHAR2(10),
  last_name                     VARCHAR2(15),
  first_name                    VARCHAR2(10),
  middle_initial                VARCHAR2(1),
  birth_date                    VARCHAR2(8),
  gender                        VARCHAR2(1),
  ethnicity                     VARCHAR2(1),
  econ_disadvantaged            VARCHAR2(1),
  titlei                        VARCHAR2(1),
  migrant                       VARCHAR2(1),
  lep                           VARCHAR2(1),
  bilingual                     VARCHAR2(1),
  esl                           VARCHAR2(1),
  special_education             VARCHAR2(1),
  gifted_talented               VARCHAR2(1),
  at_risk                       VARCHAR2(1),
  career_tech                   VARCHAR2(1),
  score_cd                      VARCHAR2(1) not null,
  scale_score                   NUMBER(4),
  vertical_scale_score          NUMBER(4),
  quantile                      VARCHAR2(5),
  lexile                        VARCHAR2(5),
  raw_score                     NUMBER(4) not null,
  composition_score             NUMBER(4),
  comp_analysis_cd01            VARCHAR2(1),
  comp_analysis_desc01          VARCHAR2(35),
  comp_analysis_cd02            VARCHAR2(1),
  comp_analysis_desc02          VARCHAR2(35),
  comp_analysis_cd03            VARCHAR2(1),
  comp_analysis_desc03          VARCHAR2(35),
  comp_analysis_cd04            VARCHAR2(1),
  comp_analysis_desc04          VARCHAR2(35),
  comp_analysis_cd05            VARCHAR2(1),
  comp_analysis_desc05          VARCHAR2(35),
  comp_analysis_cd06            VARCHAR2(1),
  comp_analysis_desc06          VARCHAR2(35),
  short_ansr1_score             VARCHAR2(1),
  short_ansr2_score             VARCHAR2(1),
  short_ansr3_score             VARCHAR2(1),
  tpm_score                     NUMBER(4),
  tpm_projection                VARCHAR2(1),
  met_standard                  VARCHAR2(1) not null,
  commended                     VARCHAR2(1) not null,
  met_higher_ed_std             VARCHAR2(1),
  online_test                   VARCHAR2(1) not null,
  retest_ind                    VARCHAR2(1) not null,
  adj_raw_score                 NUMBER(4),
  percent_correct               NUMBER(5,2),
  proficiency_level             VARCHAR2(1),
  aeis_district                 VARCHAR2(1),
  aeis_campus                   VARCHAR2(1),
  ayp_district                  VARCHAR2(1),
  ayp_campus                    VARCHAR2(1),
  objective_literal01           VARCHAR2(2),
  objective_literal02           VARCHAR2(2),
  objective_literal03           VARCHAR2(2),
  objective_literal04           VARCHAR2(2),
  objective_literal05           VARCHAR2(2),
  objective_literal06           VARCHAR2(2),
  objective_literal07           VARCHAR2(2),
  objective_literal08           VARCHAR2(2),
  objective_literal09           VARCHAR2(2),
  objective_literal10           VARCHAR2(2),
  objective_score01             VARCHAR2(2),
  objective_score02             VARCHAR2(2),
  objective_score03             VARCHAR2(2),
  objective_score04             VARCHAR2(2),
  objective_score05             VARCHAR2(2),
  objective_score06             VARCHAR2(2),
  objective_score07             VARCHAR2(2),
  objective_score08             VARCHAR2(2),
  objective_score09             VARCHAR2(2),
  objective_score10             VARCHAR2(2),
  question_literal01            VARCHAR2(2),
  question_literal02            VARCHAR2(2),
  question_literal03            VARCHAR2(2),
  question_literal04            VARCHAR2(2),
  question_literal05            VARCHAR2(2),
  question_literal06            VARCHAR2(2),
  question_literal07            VARCHAR2(2),
  question_literal08            VARCHAR2(2),
  question_literal09            VARCHAR2(2),
  question_literal10            VARCHAR2(2),
  question_literal11            VARCHAR2(2),
  question_literal12            VARCHAR2(2),
  question_literal13            VARCHAR2(2),
  question_literal14            VARCHAR2(2),
  question_literal15            VARCHAR2(2),
  question_literal16            VARCHAR2(2),
  question_literal17            VARCHAR2(2),
  question_literal18            VARCHAR2(2),
  question_literal19            VARCHAR2(2),
  question_literal20            VARCHAR2(2),
  question_literal21            VARCHAR2(2),
  question_literal22            VARCHAR2(2),
  question_literal23            VARCHAR2(2),
  question_literal24            VARCHAR2(2),
  question_literal25            VARCHAR2(2),
  question_literal26            VARCHAR2(2),
  question_literal27            VARCHAR2(2),
  question_literal28            VARCHAR2(2),
  question_literal29            VARCHAR2(2),
  question_literal30            VARCHAR2(2),
  question_literal31            VARCHAR2(2),
  question_literal32            VARCHAR2(2),
  question_literal33            VARCHAR2(2),
  question_literal34            VARCHAR2(2),
  question_literal35            VARCHAR2(2),
  question_literal36            VARCHAR2(2),
  question_literal37            VARCHAR2(2),
  question_literal38            VARCHAR2(2),
  question_literal39            VARCHAR2(2),
  question_literal40            VARCHAR2(2),
  question_literal41            VARCHAR2(2),
  question_literal42            VARCHAR2(2),
  question_literal43            VARCHAR2(2),
  question_literal44            VARCHAR2(2),
  question_literal45            VARCHAR2(2),
  question_literal46            VARCHAR2(2),
  question_literal47            VARCHAR2(2),
  question_literal48            VARCHAR2(2),
  question_literal49            VARCHAR2(2),
  question_literal50            VARCHAR2(2),
  question_literal51            VARCHAR2(2),
  question_literal52            VARCHAR2(2),
  question_literal53            VARCHAR2(2),
  question_literal54            VARCHAR2(2),
  question_literal55            VARCHAR2(2),
  question_literal56            VARCHAR2(2),
  question_literal57            VARCHAR2(2),
  question_literal58            VARCHAR2(2),
  question_literal59            VARCHAR2(2),
  question_literal60            VARCHAR2(2),
  objective_num01               VARCHAR2(2),
  objective_num02               VARCHAR2(2),
  objective_num03               VARCHAR2(2),
  objective_num04               VARCHAR2(2),
  objective_num05               VARCHAR2(2),
  objective_num06               VARCHAR2(2),
  objective_num07               VARCHAR2(2),
  objective_num08               VARCHAR2(2),
  objective_num09               VARCHAR2(2),
  objective_num10               VARCHAR2(2),
  objective_num11               VARCHAR2(2),
  objective_num12               VARCHAR2(2),
  objective_num13               VARCHAR2(2),
  objective_num14               VARCHAR2(2),
  objective_num15               VARCHAR2(2),
  objective_num16               VARCHAR2(2),
  objective_num17               VARCHAR2(2),
  objective_num18               VARCHAR2(2),
  objective_num19               VARCHAR2(2),
  objective_num20               VARCHAR2(2),
  objective_num21               VARCHAR2(2),
  objective_num22               VARCHAR2(2),
  objective_num23               VARCHAR2(2),
  objective_num24               VARCHAR2(2),
  objective_num25               VARCHAR2(2),
  objective_num26               VARCHAR2(2),
  objective_num27               VARCHAR2(2),
  objective_num28               VARCHAR2(2),
  objective_num29               VARCHAR2(2),
  objective_num30               VARCHAR2(2),
  objective_num31               VARCHAR2(2),
  objective_num32               VARCHAR2(2),
  objective_num33               VARCHAR2(2),
  objective_num34               VARCHAR2(2),
  objective_num35               VARCHAR2(2),
  objective_num36               VARCHAR2(2),
  objective_num37               VARCHAR2(2),
  objective_num38               VARCHAR2(2),
  objective_num39               VARCHAR2(2),
  objective_num40               VARCHAR2(2),
  objective_num41               VARCHAR2(2),
  objective_num42               VARCHAR2(2),
  objective_num43               VARCHAR2(2),
  objective_num44               VARCHAR2(2),
  objective_num45               VARCHAR2(2),
  objective_num46               VARCHAR2(2),
  objective_num47               VARCHAR2(2),
  objective_num48               VARCHAR2(2),
  objective_num49               VARCHAR2(2),
  objective_num50               VARCHAR2(2),
  objective_num51               VARCHAR2(2),
  objective_num52               VARCHAR2(2),
  objective_num53               VARCHAR2(2),
  objective_num54               VARCHAR2(2),
  objective_num55               VARCHAR2(2),
  objective_num56               VARCHAR2(2),
  objective_num57               VARCHAR2(2),
  objective_num58               VARCHAR2(2),
  objective_num59               VARCHAR2(2),
  objective_num60               VARCHAR2(2),
  response01                    VARCHAR2(1),
  response02                    VARCHAR2(1),
  response03                    VARCHAR2(1),
  response04                    VARCHAR2(1),
  response05                    VARCHAR2(1),
  response06                    VARCHAR2(1),
  response07                    VARCHAR2(1),
  response08                    VARCHAR2(1),
  response09                    VARCHAR2(1),
  response10                    VARCHAR2(1),
  response11                    VARCHAR2(1),
  response12                    VARCHAR2(1),
  response13                    VARCHAR2(1),
  response14                    VARCHAR2(1),
  response15                    VARCHAR2(1),
  response16                    VARCHAR2(1),
  response17                    VARCHAR2(1),
  response18                    VARCHAR2(1),
  response19                    VARCHAR2(1),
  response20                    VARCHAR2(1),
  response21                    VARCHAR2(1),
  response22                    VARCHAR2(1),
  response23                    VARCHAR2(1),
  response24                    VARCHAR2(1),
  response25                    VARCHAR2(1),
  response26                    VARCHAR2(1),
  response27                    VARCHAR2(1),
  response28                    VARCHAR2(1),
  response29                    VARCHAR2(1),
  response30                    VARCHAR2(1),
  response31                    VARCHAR2(1),
  response32                    VARCHAR2(1),
  response33                    VARCHAR2(1),
  response34                    VARCHAR2(1),
  response35                    VARCHAR2(1),
  response36                    VARCHAR2(1),
  response37                    VARCHAR2(1),
  response38                    VARCHAR2(1),
  response39                    VARCHAR2(1),
  response40                    VARCHAR2(1),
  response41                    VARCHAR2(1),
  response42                    VARCHAR2(1),
  response43                    VARCHAR2(1),
  response44                    VARCHAR2(1),
  response45                    VARCHAR2(1),
  response46                    VARCHAR2(1),
  response47                    VARCHAR2(1),
  response48                    VARCHAR2(1),
  response49                    VARCHAR2(1),
  response50                    VARCHAR2(1),
  response51                    VARCHAR2(1),
  response52                    VARCHAR2(1),
  response53                    VARCHAR2(1),
  response54                    VARCHAR2(1),
  response55                    VARCHAR2(1),
  response56                    VARCHAR2(1),
  response57                    VARCHAR2(1),
  response58                    VARCHAR2(1),
  response59                    VARCHAR2(1),
  response60                    VARCHAR2(1),
  correct_answer01              VARCHAR2(1),
  correct_answer02              VARCHAR2(1),
  correct_answer03              VARCHAR2(1),
  correct_answer04              VARCHAR2(1),
  correct_answer05              VARCHAR2(1),
  correct_answer06              VARCHAR2(1),
  correct_answer07              VARCHAR2(1),
  correct_answer08              VARCHAR2(1),
  correct_answer09              VARCHAR2(1),
  correct_answer10              VARCHAR2(1),
  correct_answer11              VARCHAR2(1),
  correct_answer12              VARCHAR2(1),
  correct_answer13              VARCHAR2(1),
  correct_answer14              VARCHAR2(1),
  correct_answer15              VARCHAR2(1),
  correct_answer16              VARCHAR2(1),
  correct_answer17              VARCHAR2(1),
  correct_answer18              VARCHAR2(1),
  correct_answer19              VARCHAR2(1),
  correct_answer20              VARCHAR2(1),
  correct_answer21              VARCHAR2(1),
  correct_answer22              VARCHAR2(1),
  correct_answer23              VARCHAR2(1),
  correct_answer24              VARCHAR2(1),
  correct_answer25              VARCHAR2(1),
  correct_answer26              VARCHAR2(1),
  correct_answer27              VARCHAR2(1),
  correct_answer28              VARCHAR2(1),
  correct_answer29              VARCHAR2(1),
  correct_answer30              VARCHAR2(1),
  correct_answer31              VARCHAR2(1),
  correct_answer32              VARCHAR2(1),
  correct_answer33              VARCHAR2(1),
  correct_answer34              VARCHAR2(1),
  correct_answer35              VARCHAR2(1),
  correct_answer36              VARCHAR2(1),
  correct_answer37              VARCHAR2(1),
  correct_answer38              VARCHAR2(1),
  correct_answer39              VARCHAR2(1),
  correct_answer40              VARCHAR2(1),
  correct_answer41              VARCHAR2(1),
  correct_answer42              VARCHAR2(1),
  correct_answer43              VARCHAR2(1),
  correct_answer44              VARCHAR2(1),
  correct_answer45              VARCHAR2(1),
  correct_answer46              VARCHAR2(1),
  correct_answer47              VARCHAR2(1),
  correct_answer48              VARCHAR2(1),
  correct_answer49              VARCHAR2(1),
  correct_answer50              VARCHAR2(1),
  correct_answer51              VARCHAR2(1),
  correct_answer52              VARCHAR2(1),
  correct_answer53              VARCHAR2(1),
  correct_answer54              VARCHAR2(1),
  correct_answer55              VARCHAR2(1),
  correct_answer56              VARCHAR2(1),
  correct_answer57              VARCHAR2(1),
  correct_answer58              VARCHAR2(1),
  correct_answer59              VARCHAR2(1),
  correct_answer60              VARCHAR2(1),
  response_ind01                VARCHAR2(1),
  response_ind02                VARCHAR2(1),
  response_ind03                VARCHAR2(1),
  response_ind04                VARCHAR2(1),
  response_ind05                VARCHAR2(1),
  response_ind06                VARCHAR2(1),
  response_ind07                VARCHAR2(1),
  response_ind08                VARCHAR2(1),
  response_ind09                VARCHAR2(1),
  response_ind10                VARCHAR2(1),
  response_ind11                VARCHAR2(1),
  response_ind12                VARCHAR2(1),
  response_ind13                VARCHAR2(1),
  response_ind14                VARCHAR2(1),
  response_ind15                VARCHAR2(1),
  response_ind16                VARCHAR2(1),
  response_ind17                VARCHAR2(1),
  response_ind18                VARCHAR2(1),
  response_ind19                VARCHAR2(1),
  response_ind20                VARCHAR2(1),
  response_ind21                VARCHAR2(1),
  response_ind22                VARCHAR2(1),
  response_ind23                VARCHAR2(1),
  response_ind24                VARCHAR2(1),
  response_ind25                VARCHAR2(1),
  response_ind26                VARCHAR2(1),
  response_ind27                VARCHAR2(1),
  response_ind28                VARCHAR2(1),
  response_ind29                VARCHAR2(1),
  response_ind30                VARCHAR2(1),
  response_ind31                VARCHAR2(1),
  response_ind32                VARCHAR2(1),
  response_ind33                VARCHAR2(1),
  response_ind34                VARCHAR2(1),
  response_ind35                VARCHAR2(1),
  response_ind36                VARCHAR2(1),
  response_ind37                VARCHAR2(1),
  response_ind38                VARCHAR2(1),
  response_ind39                VARCHAR2(1),
  response_ind40                VARCHAR2(1),
  response_ind41                VARCHAR2(1),
  response_ind42                VARCHAR2(1),
  response_ind43                VARCHAR2(1),
  response_ind44                VARCHAR2(1),
  response_ind45                VARCHAR2(1),
  response_ind46                VARCHAR2(1),
  response_ind47                VARCHAR2(1),
  response_ind48                VARCHAR2(1),
  response_ind49                VARCHAR2(1),
  response_ind50                VARCHAR2(1),
  response_ind51                VARCHAR2(1),
  response_ind52                VARCHAR2(1),
  response_ind53                VARCHAR2(1),
  response_ind54                VARCHAR2(1),
  response_ind55                VARCHAR2(1),
  response_ind56                VARCHAR2(1),
  response_ind57                VARCHAR2(1),
  response_ind58                VARCHAR2(1),
  response_ind59                VARCHAR2(1),
  response_ind60                VARCHAR2(1),
  accom_presentation            VARCHAR2(1),
  accom_response                VARCHAR2(1),
  accom_setting                 VARCHAR2(1),
  accom_timing                  VARCHAR2(1),
  accom_braille                 VARCHAR2(1),
  accom_lrg_print               VARCHAR2(1),
  accom_dyslexia                VARCHAR2(1),
  accom_oral_admin              VARCHAR2(1),
  metpanelrecommend             VARCHAR2(2),
  localobjstandardall           VARCHAR2(1),
  localobjstandard              VARCHAR2(1),
  combinedflag                  VARCHAR2(1),
  wrreaderscore1                VARCHAR2(2),
  wrreaderscore2                VARCHAR2(2),
  wrreaderscore3                VARCHAR2(2),
  elareaderscore1               VARCHAR2(2),
  elareaderscore2               VARCHAR2(2),
  elareaderscore3               VARCHAR2(2),
  accommodated_ind              VARCHAR2(1),
  num_ques_per_obj              NUMBER(2),
  obj_percent_correct           NUMBER(5,2),
  hispanic_ind                  VARCHAR2(1),
  american_indian_alaska_native VARCHAR2(1),
  asian                         VARCHAR2(1),
  black                         VARCHAR2(1),
  hawaian_pacific_islander      VARCHAR2(1),
  white                         VARCHAR2(1),
  hsep_ela_exit                 VARCHAR2(1),
  hsep_math_science_ss          VARCHAR2(1),
  peims_attribute_code          VARCHAR2(2),
  test_result_type              VARCHAR2(11)
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
create bitmap index DW.INDX_TEST_DATE on DW.TESTED_STUDENT_DETAIL (TEST_DATE)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_STU_DETAIL_ALL on DW.TESTED_STUDENT_DETAIL (STU_DETAIL_ID, GRADE_TESTED, SUBJECT_NAME, TEST_DATE, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD, ONLINE_TEST, RETEST_IND)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_TSD_ID2LNM_GDSUBDT_OL_RETST on DW.TESTED_STUDENT_DETAIL (STU_ID_2, LAST_NAME, GRADE_TESTED, SUBJECT_NAME, TEST_DATE DESC, ONLINE_TEST, RETEST_IND)
  tablespace DW_DEFAULT01
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
alter table DW.TESTED_STUDENT_DETAIL
  add constraint CHECK_SCORE_CD
  check (score_cd in ('S','G','L'));

prompt
prompt Creating table TESTED_STUDENT_EX
prompt ================================
prompt
create table DW.TESTED_STUDENT_EX
(
  row_id     ROWID,
  owner      VARCHAR2(30),
  table_name VARCHAR2(30),
  constraint VARCHAR2(30)
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
prompt Creating table TESTED_STUDENT_RESPONSE
prompt ======================================
prompt
create table DW.TESTED_STUDENT_RESPONSE
(
  stu_detail_id    NUMBER(11) not null,
  question_num     VARCHAR2(2) not null,
  grade_tested     VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_date        DATE not null,
  test_type_cd     VARCHAR2(1) not null,
  test_language_cd VARCHAR2(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  online_test      VARCHAR2(1) not null,
  retest_ind       VARCHAR2(1) not null,
  response         VARCHAR2(1),
  correct_answer   VARCHAR2(1),
  response_ind     VARCHAR2(1),
  objective_num    VARCHAR2(2),
  expectation_key  VARCHAR2(15)
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
prompt Creating table TESTED_STUDENT_RESPONSE_STG
prompt ==========================================
prompt
create table DW.TESTED_STUDENT_RESPONSE_STG
(
  stu_detail_id    NUMBER(11) not null,
  question_num     VARCHAR2(2) not null,
  grade_tested     VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_date        DATE not null,
  test_type_cd     VARCHAR2(1) not null,
  test_language_cd VARCHAR2(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  online_test      VARCHAR2(1) not null,
  retest_ind       VARCHAR2(1) not null,
  response         VARCHAR2(1),
  correct_answer   VARCHAR2(1),
  response_ind     VARCHAR2(1),
  objective_num    VARCHAR2(2),
  expectation_key  VARCHAR2(15)
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
prompt Creating table TEST_ANSWER
prompt ==========================
prompt
create table DW.TEST_ANSWER
(
  question_num     VARCHAR2(2) not null,
  grade            VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_date        DATE not null,
  test_type_cd     CHAR(1) not null,
  test_language_cd CHAR(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  answer           VARCHAR2(9),
  objective_num    VARCHAR2(2),
  expectation_key  VARCHAR2(15)
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
create unique index DW.UX_TEST_ANSWER_ALL on DW.TEST_ANSWER (QUESTION_NUM, GRADE, SUBJECT_NAME, TEST_DATE DESC, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD)
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
create unique index DW.UX_TEST_ANSWER_ALL_PLUS_EX_KEY on DW.TEST_ANSWER (EXPECTATION_KEY, QUESTION_NUM, GRADE, SUBJECT_NAME, TEST_DATE DESC, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD)
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
prompt Creating table TEST_DIM_DEX1
prompt ============================
prompt
create table DW.TEST_DIM_DEX1
(
  test_dim_id    VARCHAR2(50),
  test_id        VARCHAR2(10),
  test_name      VARCHAR2(35),
  version_id     VARCHAR2(2),
  version_name   VARCHAR2(2),
  subject_id     VARCHAR2(20),
  subject_name   VARCHAR2(20),
  sub_test_id    VARCHAR2(12),
  sub_test_name  VARCHAR2(20),
  objective_id   VARCHAR2(25),
  objective_name VARCHAR2(160),
  question_num   VARCHAR2(2),
  char_bk_1      VARCHAR2(16),
  char_bk_2      VARCHAR2(16),
  char_bk_3      VARCHAR2(7),
  char_bk_4      VARCHAR2(3),
  char_bk_5      VARCHAR2(29),
  char_bk_6      VARCHAR2(3),
  char_bk_7      VARCHAR2(17),
  char_bk_8      VARCHAR2(15),
  char_bk_9      VARCHAR2(7),
  char_bk_10     VARCHAR2(5),
  char_bk_11     VARCHAR2(25),
  char_bk_12     VARCHAR2(25),
  int_bk_1       VARCHAR2(21),
  int_bk_2       VARCHAR2(21),
  int_bk_3       VARCHAR2(24),
  int_bk_4       VARCHAR2(31),
  int_bk_5       VARCHAR2(22),
  int_bk_6       VARCHAR2(22),
  int_bk_7       VARCHAR2(22),
  int_bk_8       VARCHAR2(18),
  int_bk_9       VARCHAR2(12),
  int_bk_10      VARCHAR2(17),
  float_bk_1     VARCHAR2(20),
  objective_num  VARCHAR2(2)
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
create index DW.TESTDEXIDS_TST_SUBJ_SUBT_VR_NM on DW.TEST_DIM_DEX1 (TEST_DIM_ID, SUBJECT_ID, SUB_TEST_ID, VERSION_ID, TEST_NAME)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_TEST_DIM_DEX1_TEST_DIM_ID on DW.TEST_DIM_DEX1 (TEST_DIM_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_EXPECTATION
prompt ===============================
prompt
create table DW.TEST_EXPECTATION
(
  expectation_id      NUMBER(11) not null,
  expectation_key     VARCHAR2(15) not null,
  grade               VARCHAR2(2),
  subject_name        VARCHAR2(14) not null,
  test_language_cd    CHAR(1) not null,
  test_program_cd     VARCHAR2(5) not null,
  subject_area_cd     VARCHAR2(3) not null,
  course_title_cd     VARCHAR2(3) not null,
  knowledge_item_cd   VARCHAR2(4) not null,
  expectation_text_cd VARCHAR2(1) not null,
  subject_area        VARCHAR2(70) default 'COMING SOON' not null,
  course_title        VARCHAR2(160) default 'COMING SOON' not null,
  knowledge_item      VARCHAR2(160) default 'COMING SOON' not null,
  expectation_text    VARCHAR2(475) default 'COMING SOON',
  aeisit_se_cd        VARCHAR2(15)
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
create bitmap index DW.BMX_EXPECT_SUB_CRS_KNOW_TEXTCD on DW.TEST_EXPECTATION (SUBJECT_AREA_CD, COURSE_TITLE_CD, KNOWLEDGE_ITEM_CD, EXPECTATION_TEXT_CD)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_EXPECT_KY_GRD_SUB_LANG_PROG on DW.TEST_EXPECTATION (EXPECTATION_KEY, GRADE, SUBJECT_NAME, TEST_LANGUAGE_CD, TEST_PROGRAM_CD)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_FACT_FEX1
prompt =============================
prompt
create table DW.TEST_FACT_FEX1
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_dim_id          VARCHAR2(50) not null,
  date_id              VARCHAR2(10) not null,
  loc_id               VARCHAR2(16) not null,
  stu_id               VARCHAR2(24) not null,
  grade_tested         VARCHAR2(2) not null,
  subject_name         VARCHAR2(15) not null,
  test_type_cd         VARCHAR2(1) not null,
  test_program_cd      VARCHAR2(5) not null,
  test_mode_cd         VARCHAR2(5) not null,
  test_language_cd     VARCHAR2(1) not null,
  accommodated_ind     VARCHAR2(1) not null,
  online_test          VARCHAR2(1) not null,
  retest_ind           VARCHAR2(1) not null,
  gender               VARCHAR2(1),
  econ_dis             VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  char_bk_1            VARCHAR2(9),
  char_bk_2            VARCHAR2(9),
  char_bk_3            VARCHAR2(15),
  char_bk_4            VARCHAR2(2),
  char_bk_5            VARCHAR2(2),
  char_bk_6            VARCHAR2(2),
  char_bk_7            VARCHAR2(2),
  char_bk_8            VARCHAR2(2),
  char_bk_9            VARCHAR2(2),
  char_bk_10           VARCHAR2(2),
  char_bk_11           VARCHAR2(2),
  char_bk_12           VARCHAR2(2),
  int_bk_1             VARCHAR2(22),
  int_bk_2             VARCHAR2(22),
  int_bk_3             VARCHAR2(2),
  int_bk_4             VARCHAR2(2),
  int_bk_5             VARCHAR2(2),
  int_bk_6             VARCHAR2(2),
  int_bk_7             VARCHAR2(2),
  int_bk_8             VARCHAR2(2),
  int_bk_9             VARCHAR2(2),
  int_bk_10            VARCHAR2(2),
  float_bk_1           VARCHAR2(20),
  accom_presentation   VARCHAR2(1),
  accom_response       VARCHAR2(1),
  accom_setting        VARCHAR2(1),
  accom_timing         VARCHAR2(1),
  accom_braille        VARCHAR2(1),
  accom_lrg_print      VARCHAR2(1),
  accom_dyslexia       VARCHAR2(1),
  accom_oral_admin     VARCHAR2(1),
  aeis_campus          VARCHAR2(1),
  ayp_campus           VARCHAR2(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  vertical_scale_score NUMBER(4),
  tpm_score            NUMBER(4),
  tpm_projection       VARCHAR2(1),
  comp_analysis_cd01   VARCHAR2(1),
  comp_analysis_desc01 VARCHAR2(35),
  comp_analysis_cd02   VARCHAR2(1),
  comp_analysis_desc02 VARCHAR2(35),
  comp_analysis_cd03   VARCHAR2(1),
  comp_analysis_desc03 VARCHAR2(35),
  comp_analysis_cd04   VARCHAR2(1),
  comp_analysis_desc04 VARCHAR2(35),
  comp_analysis_cd05   VARCHAR2(1),
  comp_analysis_desc05 VARCHAR2(35),
  comp_analysis_cd06   VARCHAR2(1),
  comp_analysis_desc06 VARCHAR2(35),
  hsep_ela_exit        VARCHAR2(1),
  hsep_math_science_ss VARCHAR2(1),
  peims_attribute_code VARCHAR2(2),
  test_result_type     VARCHAR2(11),
  race_ethnicity_key   VARCHAR2(6)
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
create bitmap index DW.BIX_Date_ID on DW.TEST_FACT_FEX1 (DATE_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_KEY_AEISIT
prompt ==============================
prompt
create table DW.TEST_KEY_AEISIT
(
  cagl_key         VARCHAR2(22) not null,
  objective1       VARCHAR2(2),
  objective2       VARCHAR2(2),
  objective3       VARCHAR2(2),
  objective4       VARCHAR2(2),
  objective5       VARCHAR2(2),
  objective6       VARCHAR2(2),
  objective7       VARCHAR2(2),
  objective8       VARCHAR2(2),
  objective9       VARCHAR2(2),
  objective10      VARCHAR2(2),
  objective11      VARCHAR2(2),
  objective12      VARCHAR2(2),
  objective13      VARCHAR2(2),
  objective14      VARCHAR2(2),
  objective15      VARCHAR2(2),
  objective16      VARCHAR2(2),
  objective17      VARCHAR2(2),
  objective18      VARCHAR2(2),
  objective19      VARCHAR2(2),
  objective20      VARCHAR2(2),
  objective21      VARCHAR2(2),
  objective22      VARCHAR2(2),
  objective23      VARCHAR2(2),
  objective24      VARCHAR2(2),
  objective25      VARCHAR2(2),
  objective26      VARCHAR2(2),
  objective27      VARCHAR2(2),
  objective28      VARCHAR2(2),
  objective29      VARCHAR2(2),
  objective30      VARCHAR2(2),
  objective31      VARCHAR2(2),
  objective32      VARCHAR2(2),
  objective33      VARCHAR2(2),
  objective34      VARCHAR2(2),
  objective35      VARCHAR2(2),
  objective36      VARCHAR2(2),
  objective37      VARCHAR2(2),
  objective38      VARCHAR2(2),
  objective39      VARCHAR2(2),
  objective40      VARCHAR2(2),
  objective41      VARCHAR2(2),
  objective42      VARCHAR2(2),
  objective43      VARCHAR2(2),
  objective44      VARCHAR2(2),
  objective45      VARCHAR2(2),
  objective46      VARCHAR2(2),
  objective47      VARCHAR2(2),
  objective48      VARCHAR2(2),
  objective49      VARCHAR2(2),
  objective50      VARCHAR2(2),
  objective51      VARCHAR2(2),
  objective52      VARCHAR2(2),
  objective53      VARCHAR2(2),
  objective54      VARCHAR2(2),
  objective55      VARCHAR2(2),
  objective56      VARCHAR2(2),
  objective57      VARCHAR2(2),
  objective58      VARCHAR2(2),
  objective59      VARCHAR2(2),
  objective60      VARCHAR2(2),
  cacode           VARCHAR2(2) not null,
  grade            VARCHAR2(2) not null,
  test_date        DATE not null,
  test_language_cd CHAR(1) not null,
  test_number      VARCHAR2(2),
  answer1          CHAR(1),
  answer2          CHAR(1),
  answer3          CHAR(1),
  answer4          CHAR(1),
  answer5          CHAR(1),
  answer6          CHAR(1),
  answer7          CHAR(1),
  answer8          CHAR(1),
  answer9          CHAR(1),
  answer10         CHAR(1),
  answer11         CHAR(1),
  answer12         CHAR(1),
  answer13         CHAR(1),
  answer14         CHAR(1),
  answer15         CHAR(1),
  answer16         CHAR(1),
  answer17         CHAR(1),
  answer18         CHAR(1),
  answer19         CHAR(1),
  answer20         VARCHAR2(9),
  answer21         VARCHAR2(9),
  answer22         CHAR(1),
  answer23         CHAR(1),
  answer24         CHAR(1),
  answer25         CHAR(1),
  answer26         CHAR(1),
  answer27         CHAR(1),
  answer28         CHAR(1),
  answer29         CHAR(1),
  answer30         CHAR(1),
  answer31         CHAR(1),
  answer32         CHAR(1),
  answer33         CHAR(1),
  answer34         CHAR(1),
  answer35         CHAR(1),
  answer36         CHAR(1),
  answer37         CHAR(1),
  answer38         CHAR(1),
  answer39         CHAR(1),
  answer40         CHAR(1),
  answer41         CHAR(1),
  answer42         CHAR(1),
  answer43         CHAR(1),
  answer44         CHAR(1),
  answer45         CHAR(1),
  answer46         CHAR(1),
  answer47         CHAR(1),
  answer48         CHAR(1),
  answer49         CHAR(1),
  answer50         CHAR(1),
  answer51         CHAR(1),
  answer52         CHAR(1),
  answer53         CHAR(1),
  answer54         CHAR(1),
  answer55         CHAR(1),
  answer56         CHAR(1),
  answer57         CHAR(1),
  answer58         CHAR(1),
  answer59         CHAR(1),
  answer60         CHAR(1),
  se1              VARCHAR2(15),
  se2              VARCHAR2(15),
  se3              VARCHAR2(15),
  se4              VARCHAR2(15),
  se5              VARCHAR2(15),
  se6              VARCHAR2(15),
  se7              VARCHAR2(15),
  se8              VARCHAR2(15),
  se9              VARCHAR2(15),
  se10             VARCHAR2(15),
  se11             VARCHAR2(15),
  se12             VARCHAR2(15),
  se13             VARCHAR2(15),
  se14             VARCHAR2(15),
  se15             VARCHAR2(15),
  se16             VARCHAR2(15),
  se17             VARCHAR2(15),
  se18             VARCHAR2(15),
  se19             VARCHAR2(15),
  se20             VARCHAR2(15),
  se21             VARCHAR2(15),
  se22             VARCHAR2(15),
  se23             VARCHAR2(15),
  se24             VARCHAR2(15),
  se25             VARCHAR2(15),
  se26             VARCHAR2(15),
  se27             VARCHAR2(15),
  se28             VARCHAR2(15),
  se29             VARCHAR2(15),
  se30             VARCHAR2(15),
  se31             VARCHAR2(15),
  se32             VARCHAR2(15),
  se33             VARCHAR2(15),
  se34             VARCHAR2(15),
  se35             VARCHAR2(15),
  se36             VARCHAR2(15),
  se37             VARCHAR2(15),
  se38             VARCHAR2(15),
  se39             VARCHAR2(15),
  se40             VARCHAR2(15),
  se41             VARCHAR2(15),
  se42             VARCHAR2(15),
  se43             VARCHAR2(15),
  se44             VARCHAR2(15),
  se45             VARCHAR2(15),
  se46             VARCHAR2(15),
  se47             VARCHAR2(15),
  se48             VARCHAR2(15),
  se49             VARCHAR2(15),
  se50             VARCHAR2(15),
  se51             VARCHAR2(15),
  se52             VARCHAR2(15),
  se53             VARCHAR2(15),
  se54             VARCHAR2(15),
  se55             VARCHAR2(15),
  se56             VARCHAR2(15),
  se57             VARCHAR2(15),
  se58             VARCHAR2(15),
  se59             VARCHAR2(15),
  se60             VARCHAR2(15),
  objective_type   VARCHAR2(5) not null,
  subject_name     VARCHAR2(14) not null,
  test_type_cd     CHAR(1) not null
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
create unique index DW.UX_TEST_KEY_AEISIT_G_S_DT_CD_O on DW.TEST_KEY_AEISIT (GRADE, SUBJECT_NAME, TEST_DATE DESC, TEST_TYPE_CD, TEST_LANGUAGE_CD, OBJECTIVE_TYPE)
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
prompt Creating table TEST_LOCAL_DIM_DEX1
prompt ==================================
prompt
create table DW.TEST_LOCAL_DIM_DEX1
(
  test_dim_id    VARCHAR2(75) not null,
  test_id        VARCHAR2(10),
  test_name      VARCHAR2(35),
  version_id     VARCHAR2(2),
  version_name   VARCHAR2(2),
  subject_id     VARCHAR2(20),
  subject_name   VARCHAR2(20),
  sub_test_id    VARCHAR2(12),
  sub_test_name  VARCHAR2(20),
  objective_id   VARCHAR2(25),
  objective_name VARCHAR2(160),
  question_num   VARCHAR2(2),
  char_bk_1      VARCHAR2(16),
  char_bk_2      VARCHAR2(16),
  char_bk_3      VARCHAR2(7),
  char_bk_4      VARCHAR2(3),
  char_bk_5      VARCHAR2(29),
  char_bk_6      VARCHAR2(3),
  char_bk_7      VARCHAR2(17),
  char_bk_8      VARCHAR2(15),
  char_bk_9      VARCHAR2(7),
  char_bk_10     VARCHAR2(5),
  char_bk_11     VARCHAR2(25),
  char_bk_12     VARCHAR2(25),
  int_bk_1       VARCHAR2(21),
  int_bk_2       VARCHAR2(21),
  int_bk_3       VARCHAR2(24),
  int_bk_4       VARCHAR2(31),
  int_bk_5       VARCHAR2(22),
  int_bk_6       VARCHAR2(22),
  int_bk_7       VARCHAR2(22),
  int_bk_8       VARCHAR2(18),
  int_bk_9       VARCHAR2(12),
  int_bk_10      VARCHAR2(17),
  float_bk_1     VARCHAR2(20)
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
create index DW.TESTLDEXIDS_TST_SUB_SUBT_VR_NM on DW.TEST_LOCAL_DIM_DEX1 (TEST_DIM_ID, SUBJECT_ID, SUB_TEST_ID, VERSION_ID, TEST_NAME)
  tablespace DW_DEFAULT01
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
create unique index DW.UX_TESTL_DIM_DEX1_TEST_DIM_ID on DW.TEST_LOCAL_DIM_DEX1 (TEST_DIM_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_LOCAL_FACT_FEX1
prompt ===================================
prompt
create table DW.TEST_LOCAL_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  test_dim_id        VARCHAR2(75) not null,
  date_id            VARCHAR2(10) not null,
  loc_id             VARCHAR2(16) not null,
  stu_id             VARCHAR2(9) not null,
  test_id            VARCHAR2(4),
  test_num           VARCHAR2(2) not null,
  test_version       VARCHAR2(1) not null,
  test_desc          VARCHAR2(22) not null,
  char_bk_1          VARCHAR2(9),
  char_bk_2          VARCHAR2(9),
  char_bk_3          VARCHAR2(20),
  char_bk_4          VARCHAR2(2),
  char_bk_5          VARCHAR2(2),
  char_bk_6          VARCHAR2(2),
  char_bk_7          VARCHAR2(2),
  char_bk_8          VARCHAR2(2),
  char_bk_9          VARCHAR2(2),
  char_bk_10         VARCHAR2(2),
  char_bk_11         VARCHAR2(2),
  char_bk_12         VARCHAR2(2),
  int_bk_1           VARCHAR2(22),
  int_bk_2           VARCHAR2(22),
  int_bk_3           VARCHAR2(2),
  int_bk_4           VARCHAR2(2),
  int_bk_5           VARCHAR2(2),
  int_bk_6           VARCHAR2(2),
  int_bk_7           VARCHAR2(2),
  int_bk_8           VARCHAR2(2),
  int_bk_9           VARCHAR2(2),
  int_bk_10          VARCHAR2(2),
  float_bk_1         VARCHAR2(20),
  test_type_cd       CHAR(1),
  test_mode_cd       VARCHAR2(5),
  accommodated_ind   CHAR(1),
  accom_presentation CHAR(1),
  accom_response     CHAR(1),
  accom_setting      CHAR(1),
  accom_timing       CHAR(1),
  accom_braille      CHAR(1),
  accom_lrg_print    CHAR(1),
  accom_dyslexia     CHAR(1),
  accom_oral_admin   CHAR(1),
  online_test        CHAR(1),
  aeis_campus        CHAR(1),
  ayp_campus         CHAR(1),
  quantile           VARCHAR2(5),
  lexile             VARCHAR2(5)
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
create index DW.LTDIM_CDC_B1_B10_TYP_B12_MD_AC on DW.TEST_LOCAL_FACT_FEX1 (TEST_DIM_ID, LOC_COUNTY_DIST_ID, CHAR_BK_1, CHAR_BK_10, TEST_TYPE_CD, CHAR_BK_12, TEST_MODE_CD, ACCOMMODATED_IND)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_LOCAL_SUMMARY_FACT_FEX1
prompt ===========================================
prompt
create table DW.TEST_LOCAL_SUMMARY_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  test_dim_id        VARCHAR2(75) not null,
  date_id            VARCHAR2(10) not null,
  loc_id             VARCHAR2(16) not null,
  stu_id             VARCHAR2(9) not null,
  test_num           VARCHAR2(2) not null,
  test_version       VARCHAR2(1) not null,
  test_desc          VARCHAR2(22) not null,
  char_bk_1          VARCHAR2(2),
  char_bk_2          VARCHAR2(2),
  char_bk_3          VARCHAR2(2),
  char_bk_4          VARCHAR2(2),
  char_bk_5          VARCHAR2(2),
  char_bk_6          VARCHAR2(2),
  char_bk_7          VARCHAR2(2),
  char_bk_8          VARCHAR2(2),
  char_bk_9          VARCHAR2(2),
  char_bk_10         VARCHAR2(2),
  char_bk_11         VARCHAR2(2),
  char_bk_12         VARCHAR2(2),
  int_bk_1           VARCHAR2(22),
  int_bk_2           VARCHAR2(22),
  int_bk_3           VARCHAR2(2),
  int_bk_4           VARCHAR2(2),
  int_bk_5           VARCHAR2(2),
  int_bk_6           VARCHAR2(2),
  int_bk_7           VARCHAR2(2),
  int_bk_8           VARCHAR2(2),
  int_bk_9           VARCHAR2(2),
  int_bk_10          VARCHAR2(2),
  float_bk_1         VARCHAR2(20),
  test_type_cd       CHAR(1),
  test_mode_cd       VARCHAR2(5),
  accommodated_ind   CHAR(1),
  accom_presentation CHAR(1),
  accom_response     CHAR(1),
  accom_setting      CHAR(1),
  accom_timing       CHAR(1),
  accom_braille      CHAR(1),
  accom_lrg_print    CHAR(1),
  accom_dyslexia     CHAR(1),
  accom_oral_admin   CHAR(1),
  online_test        CHAR(1),
  aeis_campus        CHAR(1),
  ayp_campus         CHAR(1),
  quantile           VARCHAR2(5),
  lexile             VARCHAR2(5)
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
create index DW.LSDIM_CDC_B1_B10_TYP_B12_MD_AC on DW.TEST_LOCAL_SUMMARY_FACT_FEX1 (TEST_DIM_ID, LOC_COUNTY_DIST_ID, CHAR_BK_1, CHAR_BK_10, TEST_TYPE_CD, CHAR_BK_12, TEST_MODE_CD, ACCOMMODATED_IND)
  tablespace DW_DEFAULT01
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
create index DW.TESTLSUMIDS_STUTESTLOC_DT_CDC on DW.TEST_LOCAL_SUMMARY_FACT_FEX1 (STU_ID, TEST_DIM_ID, LOC_ID, DATE_ID, LOC_COUNTY_DIST_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_OBJECTIVE
prompt =============================
prompt
create table DW.TEST_OBJECTIVE
(
  objective_id     NUMBER(11) not null,
  objective_num    VARCHAR2(2) not null,
  grade            VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_type_cd     CHAR(1) not null,
  test_language_cd CHAR(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  objective_desc   VARCHAR2(160) default 'COMING SOON' not null,
  max_pnts_per_obj NUMBER(3)
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
create unique index DW.UX_OBJCT_NO_GRD_SUB_TYP_LNG_PG on DW.TEST_OBJECTIVE (OBJECTIVE_NUM, GRADE, SUBJECT_NAME, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD)
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
prompt Creating table TEST_PROGRAM
prompt ===========================
prompt
create table DW.TEST_PROGRAM
(
  test_program_id      NUMBER(5) not null,
  test_program_cd      VARCHAR2(5) not null,
  test_program_name    VARCHAR2(35) not null,
  test_program_version VARCHAR2(10)
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
create unique index DW.UX_TEST_PROG_TEST_PROGRAM_ID on DW.TEST_PROGRAM (TEST_PROGRAM_ID)
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
prompt Creating table TEST_SUBJECT
prompt ===========================
prompt
create table DW.TEST_SUBJECT
(
  test_program_id    NUMBER(5) not null,
  subject_id         NUMBER(11) not null,
  grade              VARCHAR2(2) not null,
  subject_name       VARCHAR2(14) not null,
  test_type_cd       CHAR(1) not null,
  test_language_cd   CHAR(1) not null,
  test_program_cd    VARCHAR2(5) not null,
  test_mode_cd       VARCHAR2(5) default 'NONE' not null,
  test_mode_name     VARCHAR2(35),
  test_type_name     VARCHAR2(20),
  accommodated_ind   CHAR(1),
  num_test_questions NUMBER(4),
  max_test_points    NUMBER(4)
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
create unique index DW.UX_TESTSUBJ_GRD_SUB_T_L_P_M_A on DW.TEST_SUBJECT (GRADE, SUBJECT_NAME, TEST_TYPE_CD, TEST_LANGUAGE_CD, TEST_PROGRAM_CD, TEST_MODE_CD, ACCOMMODATED_IND)
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
prompt Creating table TEST_SUMMARY_FACT_FEX1
prompt =====================================
prompt
create table DW.TEST_SUMMARY_FACT_FEX1
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_dim_id          VARCHAR2(50) not null,
  date_id              VARCHAR2(10) not null,
  loc_id               VARCHAR2(16) not null,
  stu_id               VARCHAR2(24) not null,
  grade_tested         VARCHAR2(2),
  subject_name         VARCHAR2(15),
  test_type_cd         VARCHAR2(1) not null,
  test_program_cd      VARCHAR2(5) not null,
  test_mode_cd         VARCHAR2(5) not null,
  test_language_cd     VARCHAR2(1) not null,
  accommodated_ind     VARCHAR2(1),
  online_test          VARCHAR2(1) not null,
  retest_ind           VARCHAR2(1) not null,
  gender               VARCHAR2(1),
  econ_dis             VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  char_bk_1            VARCHAR2(2),
  char_bk_2            VARCHAR2(2),
  char_bk_3            VARCHAR2(2),
  char_bk_4            VARCHAR2(2),
  char_bk_5            VARCHAR2(2),
  char_bk_6            VARCHAR2(2),
  char_bk_7            VARCHAR2(2),
  char_bk_8            VARCHAR2(2),
  char_bk_9            VARCHAR2(2),
  char_bk_10           VARCHAR2(2),
  char_bk_11           VARCHAR2(2),
  char_bk_12           VARCHAR2(2),
  int_bk_1             VARCHAR2(22),
  int_bk_2             VARCHAR2(22),
  int_bk_3             VARCHAR2(2),
  int_bk_4             VARCHAR2(2),
  int_bk_5             VARCHAR2(2),
  int_bk_6             VARCHAR2(2),
  int_bk_7             VARCHAR2(2),
  int_bk_8             VARCHAR2(2),
  int_bk_9             VARCHAR2(2),
  int_bk_10            VARCHAR2(2),
  float_bk_1           VARCHAR2(20),
  accom_presentation   VARCHAR2(1),
  accom_response       VARCHAR2(1),
  accom_setting        VARCHAR2(1),
  accom_timing         VARCHAR2(1),
  accom_braille        VARCHAR2(1),
  accom_lrg_print      VARCHAR2(1),
  accom_dyslexia       VARCHAR2(1),
  accom_oral_admin     VARCHAR2(1),
  aeis_campus          VARCHAR2(1),
  ayp_campus           VARCHAR2(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  vertical_scale_score NUMBER(4),
  tpm_score            NUMBER(4),
  tpm_projection       VARCHAR2(1),
  comp_analysis_cd01   VARCHAR2(1),
  comp_analysis_desc01 VARCHAR2(35),
  comp_analysis_cd02   VARCHAR2(1),
  comp_analysis_desc02 VARCHAR2(35),
  comp_analysis_cd03   VARCHAR2(1),
  comp_analysis_desc03 VARCHAR2(35),
  comp_analysis_cd04   VARCHAR2(1),
  comp_analysis_desc04 VARCHAR2(35),
  comp_analysis_cd05   VARCHAR2(1),
  comp_analysis_desc05 VARCHAR2(35),
  comp_analysis_cd06   VARCHAR2(1),
  comp_analysis_desc06 VARCHAR2(35),
  hsep_ela_exit        VARCHAR2(1),
  hsep_math_science_ss VARCHAR2(1),
  peims_attribute_code VARCHAR2(2),
  test_result_type     VARCHAR2(11),
  race_ethnicity_key   VARCHAR2(6)
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
create index DW.SDIM_CDC_B1_B10_TYP_B12_MD_ACM on DW.TEST_SUMMARY_FACT_FEX1 (TEST_DIM_ID, LOC_COUNTY_DIST_ID, CHAR_BK_1, CHAR_BK_10, TEST_TYPE_CD, CHAR_BK_12, TEST_MODE_CD, ACCOMMODATED_IND, ONLINE_TEST, RETEST_IND)
  tablespace DW_DEFAULT01
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
create index DW.TESTSUMIDS_STU_TEST_LOC_DT_CDC on DW.TEST_SUMMARY_FACT_FEX1 (STU_ID, TEST_DIM_ID, LOC_ID, DATE_ID DESC, LOC_COUNTY_DIST_ID)
  tablespace DW_DEFAULT01
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
prompt Creating table TEST_TPM_UPDATE
prompt ==============================
prompt
create table DW.TEST_TPM_UPDATE
(
  stu_id_2         VARCHAR2(9) not null,
  last_name        VARCHAR2(15),
  grade_tested     VARCHAR2(2) not null,
  subject_name     VARCHAR2(14) not null,
  test_date        DATE not null,
  test_type_cd     VARCHAR2(1) not null,
  test_language_cd VARCHAR2(1) not null,
  test_program_cd  VARCHAR2(5) not null,
  tpm_score        NUMBER(4),
  tpm_projection   VARCHAR2(1)
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
create unique index DW.UX_TPM_UPDATE on DW.TEST_TPM_UPDATE (STU_ID_2, LAST_NAME, GRADE_TESTED, SUBJECT_NAME, TEST_DATE, TEST_TYPE_CD, TEST_LANGUAGE_CD)
  tablespace DW_DEFAULT01
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
prompt Creating table TMP_ISS_DATE_DIM
prompt ===============================
prompt
create table DW.TMP_ISS_DATE_DIM
(
  school_year          VARCHAR2(4) not null,
  district_sid         NUMBER(4) not null,
  loc_county_dist_id   VARCHAR2(24),
  reporting_period     VARCHAR2(1),
  enroll_beg_date_sid  NUMBER,
  enroll_end_date_sid  NUMBER,
  disp_beg_date_sid    NUMBER,
  disp_end_date_sid    NUMBER,
  max_reporting_period VARCHAR2(40),
  load_sid             CHAR(1)
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
create bitmap index DW.BMI_ISS_DATE_DISPBEGDT_TMP on DW.TMP_ISS_DATE_DIM (DISP_BEG_DATE_SID)
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
create bitmap index DW.BMI_ISS_DATE_DISPENDDT_TMP on DW.TMP_ISS_DATE_DIM (DISP_END_DATE_SID)
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
create bitmap index DW.BMI_ISS_DATE_DIST_TMP on DW.TMP_ISS_DATE_DIM (DISTRICT_SID)
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
create bitmap index DW.BMI_ISS_DATE_RPTPRD_TMP on DW.TMP_ISS_DATE_DIM (REPORTING_PERIOD)
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
prompt Creating table TRANSACTION_FACT_FEX1
prompt ====================================
prompt
create table DW.TRANSACTION_FACT_FEX1
(
  loc_county_dist_id CHAR(6),
  transaction_id     CHAR(25),
  fund_key           VARCHAR2(263),
  function_key       VARCHAR2(263),
  object_key         VARCHAR2(519),
  date_id            VARCHAR2(20),
  loc_key            VARCHAR2(263),
  transaction_code   CHAR(3 CHAR),
  amount             FLOAT,
  batch              VARCHAR2(25),
  program_intent_key VARCHAR2(263),
  fiscal_year        VARCHAR2(4),
  fiscal_period      VARCHAR2(4)
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
create bitmap index DW.BIX_TRANSACTION_FACT_FEX1_CDC on DW.TRANSACTION_FACT_FEX1 (LOC_COUNTY_DIST_ID)
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
prompt Creating sequence EPMS_PK_SEQ
prompt =============================
prompt
create sequence DW.EPMS_PK_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 181062
increment by 1
cache 20;

prompt
prompt Creating view V_OWNERS
prompt ======================
prompt
create or replace force view dw.v_owners as
(
    select username as owner
    from all_users 
    where created>to_date('20070730', 'YYYYMMDD') 
);

prompt
prompt Creating view V_DDL_BACKUP
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW DW.V_DDL_BACKUP AS
SELECT
/* 
*  $Id: v_ddl_backup.sql,v 1.6 2007/12/10 18:18:09 hennesseyp Exp hennesseyp $  
*  (C) Copyright 2007  Region 10 Education Service Center.  All Rights Reserved
*
*  author: <patrick.hennessey@region10.org>  
*  created: 2007-12-10
*/
--
/* 
*  USAGE NOTE: errors will be generated for users that do not have DBA-like  
*    priviledges.  Therefore, for 'normal' users, add "where owner='OWNERNAME" 
*    to all select queries utilizing this view                                 
*/
--
    sysdate as backup_datetime 
    ,objectlist.objtype as object_type 
    ,objectlist.owner as owner 
    ,objectlist.objname as name ,DBMS_METADATA 
    .GET_DDL(objectlist.objtype, objectlist.objname) as ddl_sql 
    ,DBMS_METADATA.GET_XML(objectlist.objtype, objectlist.objname) as ddl_xml 
    ,objectlist.objtypeorder
  
FROM
    ( ( select
            owner,table_name as objname ,'TABLE' as objtype, '1' as objtypeorder 
        from
            SYS.ALL_TABLES 
            where table_name not like '%$%'
       and owner in (select owner from v_owners)
    )
    union all 
    (   select owner,index_name as objname ,'INDEX' as objtype, '2' as  objtypeorder 
 --, table_owner,table_name,table_type
                from
                    SYS.ALL_INDEXES 
                where index_name not like '%$%'
       and owner in (select owner from v_owners)
)
    union all 
    (   select
                    owner,view_name as objname, 'VIEW' as objtype , '3' as objtypeorder 
                from
                    SYS.ALL_VIEWS 
                    where view_name not like '%$%'
       and owner in (select owner from v_owners)
        )
 /*
   union all 
    (   select
                    owner,constraint_name as objname , 'CONSTRAINT' as objtype, 
                    '4' as objtypeorder , r_owner as table_owner,table_name,table_type
                from
                    SYS.ALL_CONSTRAINTS 
                    where constraint_name not like '%$%'
       and owner in (select owner from v_owners)
        )
*/
    union all 
    (   select
                    owner,dimension_name as objname , 'DIMENSIONS' as objtype, '5' as objtypeorder 
                from
                    SYS.ALL_DIMENSIONS
                    where dimension_name not like '%$%'
                    and owner in (select owner from v_owners)
        ) 
     ) objectlist 

order by
        objectlist.objtypeorder,objectlist.objname
/* sequences does not work for some reason */
/*    (   select
                    sequence_owner,sequence_name as objname , 'SEQUENCES' as objtype, 
                    '5' as objtypeorder 
                from
                    ALL_SEQUENCES
        )    
 union all 
*/

/* end */
;

prompt
prompt Creating view V_LARGEST_TABLES
prompt ==============================
prompt
create or replace force view dw.v_largest_tables as
select 
/* copyright 2007 region 10 education service center */
owner,table_name,num_rows,blocks,logging,monitoring,avg_row_len,last_analyzed,sample_size,tablespace_name
from all_Tables 
where owner in (select username 
                 from all_users 
                 where created>to_date('20070730', 'YYYYMMDD') 
    )
    and (num_rows > 0 or blocks >0)
order by blocks desc;

prompt
prompt Creating view V_MY_PRIVS
prompt ========================
prompt
create or replace force view dw.v_my_privs as
select username,null as role, "PRIVILEGE",admin_option from user_sys_privs
union all
select null as username,role, "PRIVILEGE",admin_option from role_sys_privs t2
where "ROLE" in (
    select role from user_role_privs
)
/*
grant select on v_my_privs to sasi;
grant select on v_my_privs to winschool;
grant select on v_my_privs to jenkinsj;
grant select on v_my_privs to hennesseyp;
grant select on v_my_privs to edp;
grant select on v_my_privs to stuplus;
*/;

prompt
prompt Creating function FN_CURR_SCHL_YR
prompt =================================
prompt
CREATE OR REPLACE FUNCTION DW."FN_CURR_SCHL_YR"
return number
is
    v_cur_yr number(4);
begin 

    v_cur_yr := 0;
    select distinct to_number(schl_year)
    into v_cur_yr
    from dw.date_dim 
    where date_sid = to_char(sysdate, 'YYYYMMDD');

    return v_cur_yr;
end;
/

prompt
prompt Creating function FN_CURR_SCHL_YR_CHAR
prompt ======================================
prompt
CREATE OR REPLACE FUNCTION DW."FN_CURR_SCHL_YR_CHAR"
return varchar2
is
    v_cur_yr varchar2(4);
begin 

    select distinct school_year
    into v_cur_yr
    from sdm.date_dim 
    where date_id = trunc(sysdate);

    return v_cur_yr;
end;
/

prompt
prompt Creating function FN_GET_LAST_PULL_DT
prompt =====================================
prompt
CREATE OR REPLACE FUNCTION DW."FN_GET_LAST_PULL_DT"
  return date
  is
    v_date_id date;
begin
      select max(date_id)
        into v_date_id
        from sdm.date_dim  
       where date_id < trunc(sysdate)
         and DAY_OF_WEEK_SHORT_NAME = 'Thu';
  
  return v_date_id;
end FN_GET_LAST_PULL_DT;
/

prompt
prompt Creating trigger BI_EPMS
prompt ========================
prompt
CREATE OR REPLACE TRIGGER DW."BI_EPMS"
  before insert on "EPMS"              
  for each row 
begin  
  for c1 in ( 
    select "EPMS_PK_SEQ".nextval next_val 
    from dual 
  ) loop 
    :new."ID" :=  c1.next_val; 
  end loop; 
end;
/


spool off
