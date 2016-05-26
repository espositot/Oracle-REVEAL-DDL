-----------------------------------------------------------
-- Export file for user GAMBHIRJ@DATAWH                  --
-- Created by espositot on 5/26/2016, 15:53:12 15:53:12  --
-----------------------------------------------------------

set define off
spool gambhirj_ddl.log

prompt
prompt Creating table ABSENCE_FEX
prompt ==========================
prompt
create table GAMBHIRJ.ABSENCE_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_type        VARCHAR2(1) not null,
  date_id            DATE not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  period             VARCHAR2(8) not null,
  event_type         VARCHAR2(20),
  process_dt         DATE,
  inactive_record    NUMBER(1)
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
prompt Creating table COURSE_DEX
prompt =========================
prompt
create table GAMBHIRJ.COURSE_DEX
(
  loc_county_dist_id  VARCHAR2(6) not null,
  course_key          VARCHAR2(35) not null,
  school_year         VARCHAR2(4) not null,
  course_id           VARCHAR2(15),
  course_ext          VARCHAR2(5),
  course_desc         VARCHAR2(50),
  course_type         VARCHAR2(30),
  first_elgbl_grd     VARCHAR2(2),
  last_elgbl_grd      VARCHAR2(2),
  course_adopted_dt   VARCHAR2(21),
  course_updated_dt   VARCHAR2(21),
  course_deleted_dt   VARCHAR2(21),
  course_dept         VARCHAR2(20),
  course_subject_area VARCHAR2(30),
  state_course_cd     VARCHAR2(10),
  state_course_desc   VARCHAR2(150)
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
prompt Creating table DATE_DEX
prompt =======================
prompt
create table GAMBHIRJ.DATE_DEX
(
  date_sid          FLOAT not null,
  date_id           TIMESTAMP(6),
  year_id           FLOAT,
  month_id          FLOAT,
  year_desc         VARCHAR2(255 CHAR),
  month_nbr         FLOAT,
  month_desc        VARCHAR2(255 CHAR),
  month_short_desc  VARCHAR2(255 CHAR),
  day_nbr           FLOAT,
  day_desc          VARCHAR2(255 CHAR),
  day_short_desc    VARCHAR2(255 CHAR),
  dow_nbr           FLOAT,
  dow_desc          VARCHAR2(255 CHAR),
  dow_short_desc    VARCHAR2(255 CHAR),
  julian_dt         FLOAT,
  school_year       FLOAT,
  school_year_desc  VARCHAR2(255 CHAR),
  elem_grd_period   VARCHAR2(255 CHAR),
  middle_grd_period VARCHAR2(255 CHAR),
  high_grd_period   VARCHAR2(255 CHAR),
  adult_grd_period  FLOAT,
  djj_grd_period    FLOAT,
  elem_trimester    FLOAT,
  sec_semester      VARCHAR2(255 CHAR),
  sec_nine_weeks    VARCHAR2(255 CHAR),
  holiday           FLOAT,
  schl_day_ct_1     FLOAT,
  schl_day_ct_2     FLOAT,
  schl_day_ct_3     FLOAT,
  schl_day_ct_4     FLOAT,
  schl_day_ct_5     FLOAT,
  schl_day_ct_6     FLOAT,
  schl_day_ct_7     FLOAT,
  schl_day_ct_8     FLOAT,
  schl_day_ct_9     FLOAT,
  schl_day_ct_10    FLOAT,
  yyyymmdd          CHAR(8)
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
alter table GAMBHIRJ.DATE_DEX
  add constraint PK_DATE_DEX primary key (DATE_SID)
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
alter index GAMBHIRJ.PK_DATE_DEX nologging;

prompt
prompt Creating table DIS_ACT_DEX
prompt ==========================
prompt
create table GAMBHIRJ.DIS_ACT_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  act_key            VARCHAR2(15) not null,
  act_id             VARCHAR2(13),
  act_desc           VARCHAR2(50),
  act_short_desc     VARCHAR2(40),
  act_type           VARCHAR2(5),
  act_assign_lngth   NUMBER(5,2),
  act_avg_lngth      NUMBER(5,2),
  act_severity       NUMBER(1),
  is_expulsion       NUMBER(1),
  is_is_susp         NUMBER(1),
  is_oos_susp        NUMBER(1),
  is_crt_juv_rfrrll  NUMBER(1),
  is_corp_pnshmnt    NUMBER(1),
  is_other           NUMBER(1),
  is_alt_plcmnt      NUMBER(1),
  is_schl_chg_plcmnt NUMBER(1),
  act_cur_sy_cnt     NUMBER(6),
  act_tot_cnt        NUMBER(6),
  is_daep            NUMBER(1),
  is_jjaep           NUMBER(1)
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
prompt Creating table DIS_FEX
prompt ======================
prompt
create table GAMBHIRJ.DIS_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  school_year        VARCHAR2(4),
  record_type        VARCHAR2(1) not null,
  event_id           VARCHAR2(50) not null,
  inc_key            VARCHAR2(15) not null,
  act_key            VARCHAR2(15) not null,
  stu_key            VARCHAR2(16) not null,
  state_grp_key      VARCHAR2(15) not null,
  loo_key            VARCHAR2(15),
  event_dt           DATE,
  event_time         VARCHAR2(7),
  event_loc_key      VARCHAR2(15),
  where_flag         VARCHAR2(5),
  rprtng_staff_id    VARCHAR2(15),
  invlvmnt_type      VARCHAR2(2),
  cur_grd_lvl        VARCHAR2(2),
  is_alcohol         NUMBER(1),
  is_drug            NUMBER(1),
  is_gang            NUMBER(1),
  is_hate_crime      NUMBER(1),
  is_weapon          NUMBER(1),
  weapon_type_code   VARCHAR2(2),
  was_law_notified   VARCHAR2(1),
  nbr_of_incidents   NUMBER(1),
  case_nbr           VARCHAR2(25),
  act_loc_key        VARCHAR2(15),
  act_dt             DATE,
  act_staff_id       VARCHAR2(15),
  act_nbr_of_days    NUMBER(6,3),
  act_nbr_dys_servd  NUMBER(6,3),
  act_reason_dif     VARCHAR2(2),
  act_begin_dt       DATE,
  inactive_record    NUMBER(1),
  process_dt         DATE,
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

prompt
prompt Creating table DIS_INC_DEX
prompt ==========================
prompt
create table GAMBHIRJ.DIS_INC_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  inc_key            VARCHAR2(15) not null,
  inc_id             VARCHAR2(13),
  inc_desc           VARCHAR2(50),
  inc_short_desc     VARCHAR2(25),
  inc_type           VARCHAR2(5),
  inc_severity       VARCHAR2(1),
  inc_cur_sy_cnt     NUMBER(6),
  inc_tot_cnt        NUMBER(6),
  is_alcohol         NUMBER(1),
  is_drug            NUMBER(1),
  is_gang            NUMBER(1),
  is_hate_crime      NUMBER(1),
  is_weapon          NUMBER(1),
  is_bullying        NUMBER(1),
  weapon_used_cd     VARCHAR2(2),
  cta_flag           NUMBER(1)
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
prompt Creating table DIS_LOO_DEX
prompt ==========================
prompt
create table GAMBHIRJ.DIS_LOO_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  loo_key            VARCHAR2(15) not null,
  loo_id             VARCHAR2(13),
  loo_desc           VARCHAR2(30),
  loo_short_desc     VARCHAR2(15),
  loo_grp            NUMBER(2),
  loo_use_cnt        NUMBER(1),
  loo_event_cnt      NUMBER(6),
  loo_inc_cnt        NUMBER(6),
  loo_act_cnt        NUMBER(6)
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
prompt Creating table DIS_STATE_GRP_DEX
prompt ================================
prompt
create table GAMBHIRJ.DIS_STATE_GRP_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  state_grp_key      VARCHAR2(15) not null,
  state_grp_id       VARCHAR2(13),
  state_grp_desc     VARCHAR2(50)
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
prompt Creating table ENROLLMENT_FEX
prompt =============================
prompt
create table GAMBHIRJ.ENROLLMENT_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  date_id            DATE not null,
  cnt                CHAR(1) not null,
  inactive_record    NUMBER(1),
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
create bitmap index GAMBHIRJ.BMI_CDC_LOC on GAMBHIRJ.ENROLLMENT_FEX (LOC_COUNTY_DIST_ID, LOC_ID)
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
prompt Creating table ETL_DISTRICT
prompt ===========================
prompt
create table GAMBHIRJ.ETL_DISTRICT
(
  district_id        VARCHAR2(6) not null,
  district_name      VARCHAR2(20),
  esc_region         VARCHAR2(2),
  fiscal_start_month NUMBER(1)
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
prompt Creating table FUNCTION_DEX
prompt ===========================
prompt
create table GAMBHIRJ.FUNCTION_DEX
(
  loc_county_dist_id   VARCHAR2(6) not null,
  function_key         VARCHAR2(15) not null,
  function_id          VARCHAR2(7),
  function_major       VARCHAR2(7),
  function_major_desc  VARCHAR2(50),
  function_detail      VARCHAR2(7),
  function_detail_desc VARCHAR2(50)
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
prompt Creating table FUND_DEX
prompt =======================
prompt
create table GAMBHIRJ.FUND_DEX
(
  loc_county_dist_id CHAR(6 CHAR) not null,
  fund_key           VARCHAR2(15) not null,
  fund_id            VARCHAR2(7),
  fund_desc          VARCHAR2(50 CHAR),
  fund_type_desc     VARCHAR2(50),
  fund_type          VARCHAR2(7)
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
prompt Creating table GRADES_FEX
prompt =========================
prompt
create table GAMBHIRJ.GRADES_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_id             VARCHAR2(16) not null,
  course_id          VARCHAR2(35) not null,
  staff_id           VARCHAR2(25) not null,
  date_id            VARCHAR2(20),
  grd_lvl_id         VARCHAR2(2),
  grade_type         VARCHAR2(20) not null,
  school_year        NUMBER(4),
  grading_period     VARCHAR2(1) not null,
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  sec_letter_grd     VARCHAR2(6),
  sec_nbr_grd        VARCHAR2(6),
  sec_conduct_grd    VARCHAR2(6),
  credits_attempted  NUMBER(6,2),
  credits_earned     NUMBER(6,2),
  credits_denied     NUMBER(6,2),
  process_dt         DATE,
  inactive_record    NUMBER(1),
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

prompt
prompt Creating table GRADES_GPA_FEX
prompt =============================
prompt
create table GAMBHIRJ.GRADES_GPA_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_id             VARCHAR2(16) not null,
  date_id            DATE,
  grd_lvl_id         VARCHAR2(2),
  grading_period     VARCHAR2(2),
  school_year        NUMBER(4),
  gpa_grade          NUMBER(7,4),
  gpa_grade2         NUMBER(7,4),
  gpa_grade3         NUMBER(7,4),
  gpa_grade4         NUMBER(7,4),
  tot_periods        VARCHAR2(2),
  tot_grades         VARCHAR2(2),
  process_dt         DATE,
  inactive_record    NUMBER(1)
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
prompt Creating table LEDGER_FEX
prompt =========================
prompt
create table GAMBHIRJ.LEDGER_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  fund_key           VARCHAR2(15) not null,
  function_key       VARCHAR2(15) not null,
  object_key         VARCHAR2(15) not null,
  program_key        VARCHAR2(15),
  loc_key            VARCHAR2(15) not null,
  ledger_type        VARCHAR2(5),
  amount             NUMBER(12,3),
  appropriation      NUMBER(12,3),
  encumberance       NUMBER(12,3),
  budget             NUMBER(12,3),
  process_dt         DATE,
  inactive_record    NUMBER(1),
  fiscal_year        NUMBER(1) not null,
  fiscal_period      NUMBER(2),
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

prompt
prompt Creating table LOCATION_DEX
prompt ===========================
prompt
create table GAMBHIRJ.LOCATION_DEX
(
  loc_district           VARCHAR2(25),
  loc_county_dist_id     VARCHAR2(6) not null,
  loc_area_id            VARCHAR2(20),
  loc_key                VARCHAR2(15) not null,
  loc_id                 VARCHAR2(21),
  loc_area_long_id       VARCHAR2(10),
  loc_area_desc          VARCHAR2(30),
  loc_area_shrt_desc     VARCHAR2(7),
  loc_desc               VARCHAR2(50),
  loc_short_desc         VARCHAR2(40),
  loc_abbrev             VARCHAR2(25),
  loc_principal_name     VARCHAR2(35),
  loc_state_type         VARCHAR2(2),
  loc_local_type         VARCHAR2(35),
  loc_addr_1             VARCHAR2(35),
  loc_addr_2             VARCHAR2(35),
  loc_city               VARCHAR2(25),
  loc_state              VARCHAR2(20),
  loc_zip                VARCHAR2(20),
  loc_admin_type         VARCHAR2(20) not null,
  loc_attendnce_goal     NUMBER(6),
  loc_schl_year          VARCHAR2(4),
  loc_phone              VARCHAR2(20),
  loc_principal_ext      NUMBER(5),
  loc_term               VARCHAR2(20),
  loc_periods            NUMBER(2),
  loc_fte_hrs            NUMBER(3),
  loc_square_footage     NUMBER(6),
  loc_cost               NUMBER(8),
  loc_aaa_flag           VARCHAR2(1),
  loc_title_1_flag       VARCHAR2(1),
  loc_frl_quartile       NUMBER(4),
  loc_ch_ed_cd           VARCHAR2(20),
  loc_imp_target         VARCHAR2(20),
  loc_target_asst_flag   VARCHAR2(5),
  loc_uil_classification VARCHAR2(10),
  loc_test_key           VARCHAR2(25)
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
prompt Creating table OBJECT_DEX
prompt =========================
prompt
create table GAMBHIRJ.OBJECT_DEX
(
  loc_county_dist_id     VARCHAR2(6) not null,
  object_key             VARCHAR2(15) not null,
  object_id              VARCHAR2(10),
  object_desc            VARCHAR2(100),
  obj_detail             VARCHAR2(10),
  obj_detail_desc        VARCHAR2(125),
  obj_major              VARCHAR2(10),
  obj_major_desc         VARCHAR2(100),
  obj_account_class      VARCHAR2(10),
  obj_account_class_desc VARCHAR2(100)
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
prompt Creating table PROGRAM_INTENT_DEX
prompt =================================
prompt
create table GAMBHIRJ.PROGRAM_INTENT_DEX
(
  loc_county_dist_id  VARCHAR2(6) not null,
  program_intent_key  VARCHAR2(15) not null,
  program_intent_code VARCHAR2(5),
  program_intent_desc VARCHAR2(125)
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
prompt Creating table STAFF_ABSENT_FEX
prompt ===============================
prompt
create table GAMBHIRJ.STAFF_ABSENT_FEX
(
  loc_county_dist_id  CHAR(6) not null,
  loc_key             VARCHAR2(15) not null,
  abt_key             VARCHAR2(15),
  abr_key             VARCHAR2(15),
  staff_key           VARCHAR2(16) not null,
  sta_absence_id      VARCHAR2(40 CHAR),
  sta_reason_id       VARCHAR2(8),
  sta_date_id         DATE not null,
  sta_substitute_id   VARCHAR2(10),
  sta_substitute_name VARCHAR2(35),
  sta_substitute_type VARCHAR2(2),
  sta_dur_days        FLOAT,
  sta_hrs_leave       FLOAT
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
prompt Creating table STAFF_ABSENT_REASON_DEX
prompt ======================================
prompt
create table GAMBHIRJ.STAFF_ABSENT_REASON_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  abr_key            VARCHAR2(15) not null,
  abr_id             VARCHAR2(7) not null,
  abr_description    VARCHAR2(40),
  abr_grouping       VARCHAR2(6),
  abr_ytd_count      NUMBER(9),
  abr_total_count    NUMBER(9)
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
prompt Creating table STAFF_ABSENT_TYPE_DEX
prompt ====================================
prompt
create table GAMBHIRJ.STAFF_ABSENT_TYPE_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  abt_key            VARCHAR2(15) not null,
  abt_id             VARCHAR2(5),
  abt_description    VARCHAR2(40),
  abt_grouping       VARCHAR2(10),
  abt_ytd_count      NUMBER(9),
  abt_total_count    NUMBER(9)
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
prompt Creating table STAFF_DEX
prompt ========================
prompt
create table GAMBHIRJ.STAFF_DEX
(
  loc_county_dist_id CHAR(6) not null,
  staff_key          VARCHAR2(16) not null,
  staff_id           VARCHAR2(9),
  staff_full_name    VARCHAR2(70),
  staff_last_name    VARCHAR2(35),
  staff_middle_name  VARCHAR2(35),
  staff_first_name   VARCHAR2(35),
  staff_city         VARCHAR2(35),
  staff_state        VARCHAR2(25),
  staff_zip          VARCHAR2(10),
  staff_edu_lvl      VARCHAR2(10),
  staff_race         NUMBER(1),
  staff_ethnicity    VARCHAR2(45),
  staff_gender       CHAR(1),
  staff_type         VARCHAR2(35),
  staff_job_code     VARCHAR2(30),
  staff_job_code_dt  DATE,
  staff_yrs_in_jb_cd NUMBER(2),
  staff_yrs_ttl_exp  NUMBER(2),
  staff_growth_plan  VARCHAR2(25),
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

prompt
prompt Creating table STAFF_FUNC_DEX
prompt =============================
prompt
create table GAMBHIRJ.STAFF_FUNC_DEX
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
prompt Creating table STAFF_PAC_DIM_DEX
prompt ================================
prompt
create table GAMBHIRJ.STAFF_PAC_DIM_DEX
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
prompt Creating table STAFF_QUALIFICATIONS_DIM_DEX
prompt ===========================================
prompt
create table GAMBHIRJ.STAFF_QUALIFICATIONS_DIM_DEX
(
  loc_county_dist_id    VARCHAR2(6 CHAR) not null,
  qlf_key               VARCHAR2(25 CHAR) not null,
  qlf_category          VARCHAR2(25 CHAR),
  qlf_category_desc     VARCHAR2(50 CHAR),
  qlf_subject_area      VARCHAR2(50 CHAR),
  qlf_subject_area_desc VARCHAR2(75 CHAR),
  qlf_type              VARCHAR2(25 CHAR),
  qlf_type_desc         VARCHAR2(50 CHAR),
  qlf_sub_type          VARCHAR2(25 CHAR),
  qlf_sub_type_desc     VARCHAR2(55 CHAR),
  qlf_id                VARCHAR2(20),
  qlf_description       VARCHAR2(75 CHAR),
  qlf_contrbutes_to     VARCHAR2(25 CHAR),
  qlf_credit_type       VARCHAR2(25 CHAR)
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
prompt Creating table STAFF_QUALIFICATIONS_FACT_FEX
prompt ============================================
prompt
create table GAMBHIRJ.STAFF_QUALIFICATIONS_FACT_FEX
(
  loc_county_dist_id   VARCHAR2(6 CHAR) not null,
  staff_key            VARCHAR2(16) not null,
  qualification_key    VARCHAR2(25 CHAR) not null,
  earned_date_id       VARCHAR2(10 CHAR),
  issue_date_id        VARCHAR2(10 CHAR),
  expiration_date_id   VARCHAR2(10 CHAR),
  activity_name        VARCHAR2(50 CHAR),
  activity_description VARCHAR2(75 CHAR),
  points_earned        VARCHAR2(10 CHAR),
  credits_earned       VARCHAR2(10 CHAR),
  hours_earned         VARCHAR2(10 CHAR),
  score1               VARCHAR2(10 CHAR),
  score2               VARCHAR2(10 CHAR),
  score3               VARCHAR2(10 CHAR),
  score4               VARCHAR2(10 CHAR),
  score5               VARCHAR2(10 CHAR),
  growth_plan          VARCHAR2(10 CHAR)
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
prompt Creating table STAFF_SCHEDULE_FEX
prompt =================================
prompt
create table GAMBHIRJ.STAFF_SCHEDULE_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_key         VARCHAR2(51),
  course_id          VARCHAR2(30),
  staff_key          VARCHAR2(16),
  schl_year          VARCHAR2(4),
  loc_id             VARCHAR2(15),
  section_id         VARCHAR2(18),
  staff_id           VARCHAR2(20),
  term               VARCHAR2(5),
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  cert_flag          VARCHAR2(5),
  from_date          DATE,
  from_hour          VARCHAR2(2),
  from_minute        VARCHAR2(2),
  to_date            DATE,
  to_hour            NUMBER(6),
  to_minute          NUMBER(6),
  mnts_per_week      NUMBER(6),
  day_1              NUMBER(6),
  day_2              NUMBER(6),
  day_3              NUMBER(6),
  day_4              NUMBER(6),
  day_5              NUMBER(6),
  day_6              NUMBER(6),
  nbr_dys_in_week    NUMBER(6),
  max_seats          NUMBER(6),
  occupancy_term_1   NUMBER(3),
  occupancy_term_2   NUMBER(3),
  building           NUMBER(4),
  room               VARCHAR2(15),
  fefp_funding_nbr   VARCHAR2(2),
  fte_elgblty_flag   NUMBER(1),
  from_grd_lvl       VARCHAR2(2),
  to_grd_lvl         VARCHAR2(2),
  grd_elgblty_flag   VARCHAR2(1),
  drpout_prev_flag   NUMBER(2),
  bell_schdl         VARCHAR2(2),
  calendar_1         VARCHAR2(1),
  calendar_2         VARCHAR2(1),
  calendar_3         VARCHAR2(1),
  calendar_4         VARCHAR2(1),
  instructional_stng VARCHAR2(3),
  class_hours        NUMBER(3),
  voc_subprgrm       NUMBER(3),
  occup_cmpltn_pts   NUMBER(3),
  program_lngth      NUMBER(3),
  fee_type_1         VARCHAR2(8),
  fee_amt_1          NUMBER(7,2),
  fee_type_2         NUMBER(7,2),
  fee_amt_2          NUMBER(7,2),
  fee_type_3         NUMBER(7,2),
  fee_amt_3          NUMBER(7,2),
  fee_type_4         NUMBER(7,2),
  fee_amt_4          NUMBER(7,2),
  fee_type_5         NUMBER(7,2),
  fee_amt_5          NUMBER(7,2),
  fee_type_6         NUMBER(7,2),
  fee_amt_6          NUMBER(7,2),
  fee_type_7         NUMBER(7,2),
  fee_amt_7          NUMBER(7,2),
  fee_type_8         NUMBER(7,2),
  fee_amt_8          NUMBER(7,2),
  fee_type_9         NUMBER(7,2),
  fee_amt_9          NUMBER(7,2),
  voc_intent         VARCHAR2(2),
  incarceration_flag NUMBER(2),
  voc_spcl_inittivs  NUMBER(2),
  voc_stng           NUMBER(2),
  adlt_spcl_inittivs NUMBER(2),
  day_night_indctr   NUMBER(2),
  gateway_program    NUMBER(2),
  fmly_ltrcy_program NUMBER(2),
  dual_enrlmt_indctr VARCHAR2(2),
  co_enrl_stu_indctr NUMBER(2),
  hgly_qlified_tchr  NUMBER(2),
  scheduling_mthd    VARCHAR2(10),
  section_team       VARCHAR2(3),
  spec_ed_flag       VARCHAR2(1),
  process_dt         DATE,
  inactive_record    NUMBER(1)
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
prompt Creating table STUDENT_DEX
prompt ==========================
prompt
create table GAMBHIRJ.STUDENT_DEX
(
  loc_county_dist_id   CHAR(6),
  loc_district         VARCHAR2(25),
  stu_key              VARCHAR2(40) not null,
  stu_id               VARCHAR2(16),
  stu_id_2             VARCHAR2(11),
  stu_full_name        VARCHAR2(75),
  stu_last_name        VARCHAR2(30),
  stu_first_name       VARCHAR2(25),
  stu_middle_name      VARCHAR2(25),
  stu_birth_dt         DATE,
  stu_addr_1           VARCHAR2(40),
  stu_addr_2           VARCHAR2(40),
  stu_city             VARCHAR2(40),
  stu_state            CHAR(3),
  stu_zip              VARCHAR2(10),
  stu_study_area_cd    VARCHAR2(30),
  stu_phone_1          VARCHAR2(30),
  stu_phone_2          VARCHAR2(30),
  stu_phone_3          VARCHAR2(30),
  stu_gender           CHAR(1),
  stu_race             CHAR(1),
  stu_ethnicity        VARCHAR2(40),
  stu_free_redu_lnch   NUMBER,
  stu_last_schl        VARCHAR2(51),
  stu_cur_schl         VARCHAR2(51),
  stu_next_schl        VARCHAR2(51),
  stu_last_grd_lvl     CHAR(2),
  stu_cur_grd_lvl      CHAR(2),
  stu_next_grd_lvl     CHAR(2),
  stu_last_hmroom      VARCHAR2(6),
  stu_cur_hmroom       VARCHAR2(6),
  stu_next_hmroom      VARCHAR2(6),
  stu_cumulative_gpa   NUMBER(8,5),
  stu_cumulative_gpa_2 NUMBER(8,5),
  stu_cumulative_gpa_3 NUMBER(8,5),
  stu_cumulative_gpa_4 NUMBER(8,5),
  stu_honors_gpa       NUMBER(6,5),
  stu_class_rank       NUMBER(6),
  stu_class_rank_2     NUMBER(6),
  stu_class_rank_3     NUMBER(6),
  stu_class_rank_4     NUMBER(6),
  stu_entry_dt         DATE,
  stu_withdrawl_dt     DATE,
  stu_withdrawl_cd     VARCHAR2(80),
  stu_nbr_of_rtntns    NUMBER(1),
  stu_present_cnt      NUMBER(3),
  stu_tardy_cnt        NUMBER(3),
  stu_abs_unv_cnt      NUMBER(3),
  stu_abs_exc_cnt      NUMBER(3),
  stu_abs_unexc_cnt    NUMBER(3),
  stu_dis_event_cnt    NUMBER(3),
  stu_dis_inc_cnt      NUMBER(3),
  stu_dis_act_cnt      NUMBER(3),
  stu_oos_susp_dys     NUMBER(5,2),
  stu_oos_susp_cnt     NUMBER(3),
  stu_is_susp_dys      NUMBER(5,2),
  stu_is_susp_cnt      NUMBER(3),
  stu_det_dys          NUMBER(5,2),
  stu_det_cnt          NUMBER(3),
  stu_bus_susp_dys     NUMBER(5,2),
  stu_bus_susp_cnt     NUMBER(3),
  stu_altplc_sus_dys   NUMBER(5,2),
  stu_plcpen_exp_dys   NUMBER(5,2),
  stu_plc_il_exp_dys   NUMBER(5,2),
  stu_lst_dis_ev_dt    DATE,
  stu_lst_dis_act_dt   DATE,
  stu_lst_oos_dt       DATE,
  stu_lst_is_dt        DATE,
  stu_lst_det_dt       DATE,
  stu_credits_atmptd   NUMBER(4,2),
  stu_credits_ernd     NUMBER(4,2),
  stu_grad_dt          DATE,
  stu_grad_type        VARCHAR2(40),
  stu_flag_504         NUMBER(1),
  stu_lep_code         VARCHAR2(2),
  stu_lep_entry_dt     DATE,
  stu_lep_exit_dt      DATE,
  stu_pri_lang         VARCHAR2(30),
  stu_sec_lang         VARCHAR2(30),
  stu_parent_lang      VARCHAR2(30),
  stu_beg_9_grd_yr     NUMBER(4),
  stu_aip_participat   VARCHAR2(12),
  stu_birth_cntry      VARCHAR2(40),
  stu_dt_entrd_cntry   DATE,
  stu_sup_acad_imp     VARCHAR2(12),
  stu_last_team        VARCHAR2(4),
  stu_cur_team         VARCHAR2(4),
  stu_next_team        VARCHAR2(4),
  stu_primary_ese_cd   VARCHAR2(2),
  stu_erly_clg_entry   NUMBER(1),
  stu_inrly_clg_ntry   NUMBER(1),
  stu_single_parent    NUMBER(1),
  stu_homeless         NUMBER(1),
  stu_proret_lst_yr    CHAR(1),
  stu_in_intnsv_rdng   NUMBER(1),
  stu_in_intnsv_math   NUMBER(1),
  stu_in_intnsv_la     NUMBER(1),
  stu_is_veteran       NUMBER(1),
  stu_is_handicapped   NUMBER(1),
  stu_is_teen_parent   NUMBER(1),
  stu_smrschl_status   NUMBER(1),
  stu_is_at_risk       NUMBER(1),
  stu_is_migrant       NUMBER(1),
  stu_is_tag           NUMBER(1),
  stu_is_immigrant     NUMBER(1),
  stu_ale_status       VARCHAR2(2),
  stu_pk_status        VARCHAR2(2),
  stu_live_with_cd     VARCHAR2(10),
  stu_title1_status    CHAR(1),
  stu_506_status       CHAR(1),
  stu_mile_dist        NUMBER(3),
  stu_trans_zone       VARCHAR2(5),
  stu_parent_ed_lvl    VARCHAR2(25),
  stu_allocated_schl   VARCHAR2(20),
  stu_transfer_reason  VARCHAR2(80),
  schl_yr              CHAR(4),
  data_date            DATE,
  stu_inoculations     VARCHAR2(50),
  stu_uil              CHAR(1),
  stu_dose_in_series   CHAR(1),
  stu_immunization_dt  DATE,
  stu_dtp              VARCHAR2(30),
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

prompt
prompt Creating table STUDENT_SCHEDULE_FEX
prompt ===================================
prompt
create table GAMBHIRJ.STUDENT_SCHEDULE_FEX
(
  loc_county_dist_id CHAR(6) not null,
  record_key         VARCHAR2(51),
  staff_sched_key    VARCHAR2(55) not null,
  school_year        CHAR(4) not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  course_id          VARCHAR2(35),
  section            VARCHAR2(18),
  from_dt            VARCHAR2(32 CHAR),
  from_time_hour     CHAR(2 CHAR),
  from_time_min      CHAR(2 CHAR),
  from_period        VARCHAR2(8),
  to_time_hour       CHAR(2 CHAR),
  to_time_min        CHAR(2 CHAR),
  to_period          VARCHAR2(8),
  term_code          VARCHAR2(2 CHAR),
  status             VARCHAR2(16 CHAR),
  fte_pgm_code       CHAR(1 CHAR),
  fte_eligibility    VARCHAR2(1 CHAR),
  occup_comp_pts     CHAR(2 CHAR),
  sub_program        VARCHAR2(40 CHAR),
  grading_eligiblity VARCHAR2(1 CHAR),
  rspbl_rdng_instr   CHAR(1 CHAR),
  rspbl_writ_instr   CHAR(1 CHAR),
  rspbl_math_instr   CHAR(1 CHAR),
  rspbl_sci_instr    CHAR(1 CHAR),
  to_dt              VARCHAR2(32 CHAR)
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
prompt Creating table TAKS_ELA_DEX1
prompt ============================
prompt
create table GAMBHIRJ.TAKS_ELA_DEX1
(
  test_dim_id    VARCHAR2(22 CHAR),
  test_id        CHAR(4 CHAR),
  test_name      CHAR(4 CHAR),
  version_id     CHAR(2 CHAR),
  subject_id     FLOAT,
  subject_name   VARCHAR2(20 CHAR) not null,
  sub_test_id    CHAR(2 CHAR),
  sub_test_name  CHAR(17 CHAR),
  question_num   CHAR(2 CHAR),
  char_bk_1      CHAR(2 CHAR),
  char_bk_2      CHAR(6 CHAR),
  char_bk_3      CHAR(7 CHAR),
  char_bk_4      CHAR(3 CHAR),
  char_bk_5      CHAR(9 CHAR),
  char_bk_6      CHAR(3 CHAR),
  char_bk_7      CHAR(17 CHAR),
  char_bk_8      CHAR(15 CHAR),
  char_bk_9      CHAR(6 CHAR),
  char_bk_10     CHAR(5 CHAR),
  int_bk_1       VARCHAR2(17 CHAR),
  int_bk_2       VARCHAR2(17 CHAR),
  int_bk_3       VARCHAR2(17 CHAR),
  int_bk_4       VARCHAR2(20 CHAR),
  int_bk_5       CHAR(22 CHAR),
  int_bk_6       CHAR(22 CHAR),
  int_bk_7       CHAR(22 CHAR),
  int_bk_8       CHAR(18 CHAR),
  int_bk_9       CHAR(2 CHAR),
  int_bk_10      CHAR(2 CHAR),
  float_bk_1     CHAR(2 CHAR),
  float_bk_2     CHAR(2 CHAR),
  float_bk_3     CHAR(2 CHAR),
  float_bk_4     CHAR(2 CHAR),
  float_bk_5     CHAR(2 CHAR),
  float_bk_6     CHAR(2 CHAR),
  float_bk_7     CHAR(2 CHAR),
  float_bk_8     CHAR(2 CHAR),
  float_bk_9     CHAR(2 CHAR),
  float_bk_10    CHAR(2 CHAR),
  version        CHAR(2 CHAR),
  objective_id   VARCHAR2(6 CHAR),
  objective_name VARCHAR2(30 CHAR),
  char_bk_11     CHAR(2 CHAR),
  char_bk_12     CHAR(12 CHAR)
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
prompt Creating table TAKS_ELA_FEX1
prompt ============================
prompt
create table GAMBHIRJ.TAKS_ELA_FEX1
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_dim_id        VARCHAR2(22 CHAR),
  date_id            VARCHAR2(10 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  stu_id             VARCHAR2(9 CHAR) not null,
  char_bk_1          CHAR(2 CHAR),
  char_bk_2          VARCHAR2(2 CHAR) not null,
  char_bk_3          VARCHAR2(2 CHAR) not null,
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR) not null,
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  int_bk_1           VARCHAR2(2),
  int_bk_2           VARCHAR2(2),
  int_bk_3           VARCHAR2(8),
  int_bk_4           VARCHAR2(2),
  int_bk_5           VARCHAR2(2),
  int_bk_6           VARCHAR2(2),
  int_bk_7           VARCHAR2(2),
  int_bk_8           VARCHAR2(2),
  int_bk_9           CHAR(2 CHAR),
  int_bk_10          CHAR(2 CHAR),
  float_bk_1         CHAR(2 CHAR),
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
  test_id            CHAR(4 CHAR),
  char_bk_11         CHAR(2 CHAR),
  char_bk_12         VARCHAR2(2 CHAR)
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
prompt Creating table TAKS_ITEM_DEX1
prompt =============================
prompt
create table GAMBHIRJ.TAKS_ITEM_DEX1
(
  cacode            VARCHAR2(2 CHAR),
  testobjectiveskey VARCHAR2(50 CHAR)
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
prompt Creating table TAKS_ITEM_DEX2
prompt =============================
prompt
create table GAMBHIRJ.TAKS_ITEM_DEX2
(
  testobjectiveskey VARCHAR2(50 CHAR),
  questionnum       NUMBER(10),
  objective         NUMBER(10),
  grade             VARCHAR2(2 CHAR),
  objectivetype     VARCHAR2(8 CHAR),
  subject           VARCHAR2(20 CHAR),
  objectivetext     CLOB
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
prompt Creating table TAKS_ITEM_DEX3
prompt =============================
prompt
create table GAMBHIRJ.TAKS_ITEM_DEX3
(
  test_dim_id    VARCHAR2(31 CHAR),
  test_name      VARCHAR2(8 CHAR),
  version_id     CHAR(2 CHAR),
  version        CHAR(2 CHAR),
  subject_id     CHAR(2 CHAR),
  sub_test_id    CHAR(2 CHAR),
  subject_name   VARCHAR2(20 CHAR),
  sub_test_name  CHAR(10 CHAR),
  question_num   NUMBER(19),
  char_bk_1      CHAR(16 CHAR),
  char_bk_2      CHAR(16 CHAR),
  char_bk_3      CHAR(2 CHAR),
  char_bk_4      CHAR(3 CHAR),
  char_bk_5      CHAR(29 CHAR),
  char_bk_6      CHAR(3 CHAR),
  char_bk_7      CHAR(17 CHAR),
  char_bk_8      CHAR(15 CHAR),
  char_bk_9      CHAR(6 CHAR),
  char_bk_10     CHAR(5 CHAR),
  int_bk_1       CHAR(7 CHAR),
  int_bk_2       CHAR(7 CHAR),
  int_bk_3       CHAR(9 CHAR),
  int_bk_4       CHAR(2 CHAR),
  int_bk_5       CHAR(2 CHAR),
  int_bk_6       CHAR(2 CHAR),
  int_bk_7       CHAR(2 CHAR),
  int_bk_8       CHAR(2 CHAR),
  int_bk_9       CHAR(2 CHAR),
  int_bk_10      CHAR(2 CHAR),
  float_bk_1     CHAR(2 CHAR),
  float_bk_2     CHAR(2 CHAR),
  float_bk_3     CHAR(2 CHAR),
  float_bk_4     CHAR(2 CHAR),
  float_bk_5     CHAR(2 CHAR),
  float_bk_6     CHAR(2 CHAR),
  float_bk_7     CHAR(2 CHAR),
  float_bk_8     CHAR(2 CHAR),
  float_bk_9     CHAR(2 CHAR),
  float_bk_10    CHAR(2 CHAR),
  test_id        CHAR(4 CHAR),
  objective_id   VARCHAR2(12 CHAR),
  objective_name CLOB,
  char_bk_11     CHAR(2 CHAR),
  char_bk_12     CHAR(12 CHAR)
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
create index GAMBHIRJ.TAKS_DEX3_OBJID_QNUM_SUBID on GAMBHIRJ.TAKS_ITEM_DEX3 (OBJECTIVE_ID, QUESTION_NUM, SUBJECT_ID)
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
create unique index GAMBHIRJ.TAKS_ITEM_DEX3_TEST_DIM_ID on GAMBHIRJ.TAKS_ITEM_DEX3 (TEST_DIM_ID)
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
prompt Creating table TAKS_ITEM_LVL_FEX1
prompt =================================
prompt
create table GAMBHIRJ.TAKS_ITEM_LVL_FEX1
(
  stu_id             VARCHAR2(9 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  test_dim_id        VARCHAR2(31 CHAR),
  date_id            VARCHAR2(10 CHAR) not null,
  char_bk_1          VARCHAR2(9 CHAR),
  char_bk_2          VARCHAR2(9 CHAR),
  char_bk_3          VARCHAR2(20 CHAR),
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          CHAR(1 CHAR),
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  int_bk_1           VARCHAR2(2 CHAR) not null,
  int_bk_2           VARCHAR2(2 CHAR),
  int_bk_3           VARCHAR2(2 CHAR),
  int_bk_4           CHAR(2 CHAR),
  int_bk_5           CHAR(2 CHAR),
  int_bk_6           CHAR(2 CHAR),
  int_bk_7           CHAR(2 CHAR),
  int_bk_8           CHAR(2 CHAR),
  int_bk_9           CHAR(2 CHAR),
  int_bk_10          CHAR(2 CHAR),
  float_bk_1         CHAR(2 CHAR),
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_id            CHAR(4 CHAR),
  char_bk_11         CHAR(2 CHAR),
  char_bk_12         VARCHAR2(2 CHAR) not null
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
prompt Creating table TAKS_OBJ_DEX1
prompt ============================
prompt
create table GAMBHIRJ.TAKS_OBJ_DEX1
(
  test_dim_id    VARCHAR2(28 CHAR),
  test_id        CHAR(4 CHAR),
  test_name      VARCHAR2(8 CHAR) not null,
  version_id     CHAR(2 CHAR),
  version        CHAR(2 CHAR),
  subject_id     CHAR(2 CHAR),
  subject_name   VARCHAR2(20 CHAR) not null,
  sub_test_id    CHAR(2 CHAR),
  sub_test_name  CHAR(15 CHAR),
  question_num   CHAR(2 CHAR),
  char_bk_1      CHAR(2 CHAR),
  char_bk_2      CHAR(6 CHAR),
  char_bk_3      CHAR(7 CHAR),
  char_bk_4      CHAR(3 CHAR),
  char_bk_5      CHAR(9 CHAR),
  char_bk_6      CHAR(3 CHAR),
  char_bk_7      CHAR(17 CHAR),
  char_bk_8      CHAR(15 CHAR),
  char_bk_9      CHAR(6 CHAR),
  char_bk_10     CHAR(5 CHAR),
  int_bk_1       CHAR(16 CHAR),
  int_bk_2       CHAR(15 CHAR),
  int_bk_3       CHAR(24 CHAR),
  int_bk_4       CHAR(2 CHAR),
  int_bk_5       CHAR(2 CHAR),
  int_bk_6       CHAR(2 CHAR),
  int_bk_7       CHAR(2 CHAR),
  int_bk_8       CHAR(2 CHAR),
  int_bk_9       CHAR(2 CHAR),
  int_bk_10      CHAR(2 CHAR),
  float_bk_1     CHAR(2 CHAR),
  float_bk_2     CHAR(2 CHAR),
  float_bk_3     CHAR(2 CHAR),
  float_bk_4     CHAR(2 CHAR),
  float_bk_5     CHAR(2 CHAR),
  float_bk_6     CHAR(2 CHAR),
  float_bk_7     CHAR(2 CHAR),
  float_bk_8     CHAR(2 CHAR),
  float_bk_9     CHAR(2 CHAR),
  float_bk_10    CHAR(2 CHAR),
  objective_id   VARCHAR2(12 CHAR),
  objective_name VARCHAR2(4000 CHAR) not null,
  char_bk_11     CHAR(2 CHAR),
  char_bk_12     CHAR(12 CHAR)
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
prompt Creating table TAKS_OBJ_LVL_FEX1
prompt ================================
prompt
create table GAMBHIRJ.TAKS_OBJ_LVL_FEX1
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_dim_id        VARCHAR2(50 CHAR),
  date_id            VARCHAR2(10 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  stu_id             VARCHAR2(9 CHAR) not null,
  char_bk_1          CHAR(2 CHAR),
  char_bk_2          VARCHAR2(2 CHAR) not null,
  char_bk_3          VARCHAR2(2 CHAR) not null,
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR) not null,
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  int_bk_1           NUMBER(19) not null,
  int_bk_2           NUMBER(19) not null,
  int_bk_3           CHAR(1 CHAR) not null,
  int_bk_4           CHAR(2 CHAR),
  int_bk_5           CHAR(2 CHAR),
  int_bk_6           CHAR(2 CHAR),
  int_bk_7           CHAR(2 CHAR),
  int_bk_8           CHAR(2 CHAR),
  int_bk_9           CHAR(2 CHAR),
  int_bk_10          CHAR(2 CHAR),
  float_bk_1         CHAR(2 CHAR),
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
  test_id            CHAR(4 CHAR),
  char_bk_11         CHAR(2 CHAR),
  char_bk_12         VARCHAR2(2 CHAR) not null
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
prompt Creating table TAKS_SUBJECT_DEX1
prompt ================================
prompt
create table GAMBHIRJ.TAKS_SUBJECT_DEX1
(
  test_dim_id    CHAR(21 CHAR),
  test_name      CHAR(4 CHAR),
  version_id     CHAR(2 CHAR),
  version        CHAR(2 CHAR),
  subject_id     CHAR(2 CHAR),
  sub_test_id    CHAR(2 CHAR),
  subject_name   VARCHAR2(20 CHAR) not null,
  sub_test_name  CHAR(13 CHAR),
  question_num   CHAR(2 CHAR),
  char_bk_1      CHAR(10 CHAR),
  char_bk_2      CHAR(7 CHAR),
  char_bk_3      CHAR(7 CHAR),
  char_bk_4      CHAR(3 CHAR),
  char_bk_5      CHAR(9 CHAR),
  char_bk_6      CHAR(3 CHAR),
  char_bk_7      CHAR(17 CHAR),
  char_bk_8      CHAR(15 CHAR),
  char_bk_9      CHAR(7 CHAR),
  char_bk_10     CHAR(5 CHAR),
  char_bk_11     CHAR(17 CHAR),
  int_bk_1       CHAR(11 CHAR),
  int_bk_2       CHAR(9 CHAR),
  int_bk_3       CHAR(13 CHAR),
  int_bk_4       CHAR(9 CHAR),
  int_bk_5       CHAR(19 CHAR),
  int_bk_6       CHAR(22 CHAR),
  int_bk_7       CHAR(8 CHAR),
  int_bk_8       CHAR(8 CHAR),
  int_bk_9       CHAR(12 CHAR),
  int_bk_10      CHAR(17 CHAR),
  float_bk_1     CHAR(20 CHAR),
  float_bk_2     CHAR(2 CHAR),
  float_bk_3     CHAR(2 CHAR),
  float_bk_4     CHAR(2 CHAR),
  float_bk_5     CHAR(2 CHAR),
  float_bk_6     CHAR(2 CHAR),
  float_bk_7     CHAR(2 CHAR),
  float_bk_8     CHAR(2 CHAR),
  float_bk_9     CHAR(2 CHAR),
  float_bk_10    CHAR(2 CHAR),
  test_id        CHAR(4 CHAR),
  objective_id   CHAR(5 CHAR),
  objective_name CHAR(13 CHAR),
  char_bk_12     CHAR(12 CHAR)
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
prompt Creating table TAKS_WRITING_DEX1
prompt ================================
prompt
create table GAMBHIRJ.TAKS_WRITING_DEX1
(
  test_dim_id    VARCHAR2(22 CHAR),
  test_id        CHAR(4 CHAR),
  test_name      CHAR(4 CHAR),
  cacode         VARCHAR2(255 CHAR),
  version_id     CHAR(2 CHAR),
  subject_id     CHAR(2 CHAR),
  subject_name   VARCHAR2(20 CHAR) not null,
  sub_test_id    CHAR(2 CHAR),
  sub_test_name  CHAR(17 CHAR),
  question_num   CHAR(2 CHAR),
  char_bk_1      CHAR(2 CHAR),
  char_bk_2      CHAR(6 CHAR),
  char_bk_3      CHAR(7 CHAR),
  char_bk_4      CHAR(3 CHAR),
  char_bk_5      CHAR(9 CHAR),
  char_bk_6      CHAR(3 CHAR),
  char_bk_7      CHAR(17 CHAR),
  char_bk_8      CHAR(15 CHAR),
  char_bk_9      CHAR(6 CHAR),
  char_bk_10     CHAR(5 CHAR),
  int_bk_1       CHAR(21 CHAR),
  int_bk_2       CHAR(21 CHAR),
  int_bk_3       CHAR(21 CHAR),
  int_bk_4       CHAR(31 CHAR),
  int_bk_5       CHAR(2 CHAR),
  int_bk_6       CHAR(2 CHAR),
  int_bk_7       CHAR(2 CHAR),
  int_bk_8       CHAR(2 CHAR),
  int_bk_9       CHAR(2 CHAR),
  int_bk_10      CHAR(2 CHAR),
  float_bk_1     CHAR(2 CHAR),
  float_bk_2     CHAR(2 CHAR),
  float_bk_3     CHAR(2 CHAR),
  float_bk_4     CHAR(2 CHAR),
  float_bk_5     CHAR(2 CHAR),
  float_bk_6     CHAR(2 CHAR),
  float_bk_7     CHAR(2 CHAR),
  float_bk_8     CHAR(2 CHAR),
  float_bk_9     CHAR(2 CHAR),
  float_bk_10    CHAR(2 CHAR),
  version        CHAR(2 CHAR),
  objective_id   VARCHAR2(6 CHAR),
  objective_name CHAR(19 CHAR),
  char_bk_11     CHAR(2 CHAR),
  char_bk_12     CHAR(12 CHAR)
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
prompt Creating table TAKS_WRITING_FEX1
prompt ================================
prompt
create table GAMBHIRJ.TAKS_WRITING_FEX1
(
  test_dim_id        VARCHAR2(22 CHAR),
  date_id            VARCHAR2(10 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  stu_id             VARCHAR2(9 CHAR) not null,
  char_bk_1          CHAR(2 CHAR),
  char_bk_2          VARCHAR2(2 CHAR) not null,
  char_bk_3          VARCHAR2(2 CHAR) not null,
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR) not null,
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  int_bk_1           VARCHAR2(2 CHAR) not null,
  int_bk_2           VARCHAR2(2 CHAR) not null,
  int_bk_3           VARCHAR2(8),
  int_bk_4           VARCHAR2(2 CHAR) not null,
  int_bk_5           CHAR(2 CHAR),
  int_bk_6           CHAR(2 CHAR),
  int_bk_7           CHAR(2 CHAR),
  int_bk_8           CHAR(2 CHAR),
  int_bk_9           CHAR(2 CHAR),
  int_bk_10          CHAR(2 CHAR),
  float_bk_1         CHAR(2 CHAR),
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_id            CHAR(4 CHAR),
  char_bk_11         CHAR(2 CHAR),
  char_bk_12         VARCHAR2(2 CHAR)
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
prompt Creating table TEST_DEX
prompt =======================
prompt
create table GAMBHIRJ.TEST_DEX
(
  test_dim_id    VARCHAR2(50),
  test_id        VARCHAR2(5),
  test_name      VARCHAR2(5),
  version_id     VARCHAR2(2),
  version_name   VARCHAR2(2),
  subject_id     VARCHAR2(2),
  subject_name   VARCHAR2(15),
  sub_test_id    VARCHAR2(2),
  sub_test_name  VARCHAR2(20),
  objective_id   VARCHAR2(30),
  objective_name VARCHAR2(160),
  question_num   NUMBER,
  question_name  VARCHAR2(2),
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
create index GAMBHIRJ.TEST_DEX_TEST_DIM_ID on GAMBHIRJ.TEST_DEX (TEST_DIM_ID)
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
prompt Creating table TEST_FEX
prompt =======================
prompt
create table GAMBHIRJ.TEST_FEX
(
  loc_county_dist_id   VARCHAR2(6 CHAR) not null,
  test_dim_id          VARCHAR2(50),
  date_id              VARCHAR2(10 CHAR) not null,
  loc_id               VARCHAR2(16 CHAR),
  stu_id               VARCHAR2(9 CHAR) not null,
  test_id              VARCHAR2(5),
  char_bk_1            VARCHAR2(9 CHAR),
  char_bk_2            VARCHAR2(9 CHAR),
  char_bk_3            VARCHAR2(15),
  char_bk_4            VARCHAR2(2 CHAR) not null,
  char_bk_5            VARCHAR2(2 CHAR),
  char_bk_6            VARCHAR2(2 CHAR) not null,
  char_bk_7            VARCHAR2(2 CHAR) not null,
  char_bk_8            VARCHAR2(2 CHAR) not null,
  char_bk_9            VARCHAR2(2 CHAR) not null,
  char_bk_10           VARCHAR2(2 CHAR) not null,
  char_bk_11           VARCHAR2(2),
  int_bk_1             VARCHAR2(5),
  int_bk_2             VARCHAR2(5),
  int_bk_3             VARCHAR2(2 CHAR),
  int_bk_4             VARCHAR2(2),
  int_bk_5             VARCHAR2(2),
  int_bk_6             VARCHAR2(2 CHAR),
  int_bk_7             VARCHAR2(2 CHAR),
  int_bk_8             VARCHAR2(2 CHAR),
  int_bk_9             VARCHAR2(2 CHAR),
  int_bk_10            VARCHAR2(2 CHAR),
  float_bk_1           VARCHAR2(6),
  float_bk_2           CHAR(2 CHAR),
  float_bk_3           CHAR(2 CHAR),
  float_bk_4           CHAR(2 CHAR),
  float_bk_5           CHAR(2 CHAR),
  float_bk_6           CHAR(2 CHAR),
  float_bk_7           CHAR(2 CHAR),
  float_bk_8           CHAR(2 CHAR),
  float_bk_9           CHAR(2 CHAR),
  float_bk_10          CHAR(2 CHAR),
  char_bk_12           VARCHAR2(2 CHAR),
  hsep_ela_exit        VARCHAR2(1),
  hsep_math_science_ss VARCHAR2(1),
  peims_attribute_code VARCHAR2(2),
  test_result_type     VARCHAR2(11)
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
create bitmap index GAMBHIRJ.BMI_CDC_TEST_FEX on GAMBHIRJ.TEST_FEX (LOC_COUNTY_DIST_ID)
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
create index GAMBHIRJ.TESTFEXIDS_STU_TEST_LOC_DIST on GAMBHIRJ.TEST_FEX (STU_ID, TEST_DIM_ID, LOC_ID, LOC_COUNTY_DIST_ID)
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
prompt Creating table TEST_SUMMARY_FEX
prompt ===============================
prompt
create table GAMBHIRJ.TEST_SUMMARY_FEX
(
  loc_county_dist_id   VARCHAR2(6 CHAR) not null,
  test_dim_id          VARCHAR2(50),
  date_id              VARCHAR2(10 CHAR) not null,
  loc_id               VARCHAR2(16 CHAR),
  stu_id               VARCHAR2(9 CHAR) not null,
  char_bk_1            VARCHAR2(9),
  char_bk_2            VARCHAR2(9) not null,
  char_bk_3            VARCHAR2(15) not null,
  char_bk_4            VARCHAR2(2 CHAR) not null,
  char_bk_5            VARCHAR2(2 CHAR) not null,
  char_bk_6            VARCHAR2(2 CHAR) not null,
  char_bk_7            VARCHAR2(2 CHAR) not null,
  char_bk_8            VARCHAR2(2 CHAR) not null,
  char_bk_9            VARCHAR2(2 CHAR) not null,
  char_bk_10           VARCHAR2(2 CHAR) not null,
  int_bk_1             VARCHAR2(5),
  int_bk_2             VARCHAR2(5),
  int_bk_3             VARCHAR2(2 CHAR),
  int_bk_4             CHAR(2 CHAR),
  int_bk_5             CHAR(2 CHAR),
  int_bk_6             VARCHAR2(2 CHAR),
  int_bk_7             VARCHAR2(2 CHAR),
  int_bk_8             VARCHAR2(2 CHAR),
  int_bk_9             VARCHAR2(2 CHAR),
  int_bk_10            VARCHAR2(2 CHAR),
  float_bk_1           VARCHAR2(6),
  char_bk_11           CHAR(2 CHAR),
  char_bk_12           VARCHAR2(2 CHAR),
  hsep_ela_exit        VARCHAR2(1),
  hsep_math_science_ss VARCHAR2(1),
  peims_attribute_code VARCHAR2(2),
  test_result_type     VARCHAR2(11)
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
create bitmap index GAMBHIRJ.BMI_CDC_TEST_SUMMARY_FEX on GAMBHIRJ.TEST_SUMMARY_FEX (LOC_COUNTY_DIST_ID)
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
prompt Creating table TEST_TAKS_SUB_FEX1
prompt =================================
prompt
create table GAMBHIRJ.TEST_TAKS_SUB_FEX1
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_dim_id        CHAR(21 CHAR),
  loc_id             VARCHAR2(16 CHAR),
  stu_key            VARCHAR2(9 CHAR) not null,
  stu_local_key      VARCHAR2(17 CHAR),
  test_id            CHAR(4 CHAR),
  date_id            VARCHAR2(10 CHAR) not null,
  char_bk_1          VARCHAR2(2 CHAR) not null,
  char_bk_2          VARCHAR2(2 CHAR) not null,
  char_bk_3          VARCHAR2(2 CHAR) not null,
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR) not null,
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  char_bk_11         CHAR(1 CHAR),
  int_bk_1           NUMBER(19) not null,
  int_bk_2           NUMBER(19) not null,
  int_bk_3           VARCHAR2(2 CHAR),
  int_bk_4           CHAR(1 CHAR) not null,
  int_bk_5           CHAR(1 CHAR) not null,
  int_bk_6           VARCHAR2(2 CHAR),
  int_bk_7           VARCHAR2(2 CHAR),
  int_bk_8           VARCHAR2(2 CHAR),
  int_bk_9           VARCHAR2(2 CHAR),
  int_bk_10          VARCHAR2(2 CHAR),
  float_bk_1         FLOAT not null,
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
  char_bk_12         VARCHAR2(2 CHAR) not null
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
prompt Creating table TRANSACTION_FEX
prompt ==============================
prompt
create table GAMBHIRJ.TRANSACTION_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  transact_id        VARCHAR2(30),
  fund_key           VARCHAR2(15),
  function_key       VARCHAR2(15),
  object_key         VARCHAR2(15),
  date_id            DATE,
  fiscal_year        VARCHAR2(1),
  fiscal_period      VARCHAR2(2),
  transaction_code   VARCHAR2(16),
  amount             NUMBER(12,3),
  batch              VARCHAR2(8),
  loc_key            VARCHAR2(15),
  program_intent_key VARCHAR2(15),
  process_dt         DATE,
  inactive_record    NUMBER(1)
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
prompt Creating table ZERO_ENROLLMENT_CAMPUSES_TBL
prompt ===========================================
prompt
create table GAMBHIRJ.ZERO_ENROLLMENT_CAMPUSES_TBL
(
  loc_district VARCHAR2(25),
  campus       VARCHAR2(65),
  enrollments  NUMBER,
  created_dt   DATE
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
prompt Creating package ZERO_ENROLLMENT_CAMPUSES
prompt =========================================
prompt
CREATE OR REPLACE PACKAGE GAMBHIRJ."ZERO_ENROLLMENT_CAMPUSES" is

  ---------------------------------------------------------------------
  --
  -- Package Spec:        zero_enrollment_campuses 
  --
  -- Purpose:             code to populate table for Confluence 
  --                      "Current Enrollment Counts by Campuses" page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100516  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
  procedure getZeroEnrollments; 
    
end zero_enrollment_campuses;
/

prompt
prompt Creating package body ZERO_ENROLLMENT_CAMPUSES
prompt ==============================================
prompt
CREATE OR REPLACE PACKAGE BODY GAMBHIRJ."ZERO_ENROLLMENT_CAMPUSES" is

  ---------------------------------------------------------------------
  --
  -- Package Body:        zero_enrollment_campuses 
  --
  -- Purpose:             code to populate table for Confluence 
  --                      "Current Enrollment Counts by Campuses" page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100516  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
 
  v_errcode number;
  v_errmesg varchar2(200);
 
  ----------------------------------------------------------------------
  -- getZeroEnrollments - populate gambhirj.zero_enrollment_campuses_tbl
  --                      table with data for all district enrollments.
  ----------------------------------------------------------------------
  procedure getZeroEnrollments 
  is
    v_sql varchar2(2000);
    
  begin
    v_sql := 'insert into gambhirj.zero_enrollment_campuses_tbl
              select l.loc_district
                    ,upper(substr(l.loc_id,7,3) || '' - '' || l.loc_desc) as campus
                    ,nvl(count(distinct e.stu_id),0) as enrollments
                    ,trunc(sysdate) as created_dt
              from gambhirj.location_dex l
                  ,(select stu_id, substr(loc_id,5,6) || substr(loc_id,1,3) as loc_id
                    from gambhirj.enrollment_fex) e
              where l.loc_schl_year = ''2010''
              and l.loc_id = e.loc_id(+)
              and upper(l.loc_admin_type) IN (''INSTRUCTIONAL'')
              and l.loc_county_dist_id IN (''043901''
                            ,''057904''
                            ,''057922''
                            ,''129901''
                            ,''091903''
                            ,''043905''
                            ,''057911''
                            ,''074909''
                            ,''043919''
                            ,''070915''
                            ,''043907''
                            ,''070908''
                            ,''199901''
                            ,''199902''
                            ,''043914''
                             )
             group by l.loc_district, substr(l.loc_id,7,3) || '' - '' || l.loc_desc';
  
  execute immediate v_sql;
    
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('zero_enrollment_campuses',sysdate,'Error','zero_enrollment_campuses.getZeroEnrollments','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end getZeroEnrollments;
    
  -----------------------------------------
  -- initialize - truncate table to be used
  ----------------------------------------- 
  procedure initialize
  is
  begin
    
    execute immediate 'truncate table gambhirj.zero_enrollment_campuses_tbl'; 
      
  exception  
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
           
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('enrollment_past_withdrawal',sysdate,'Error','enrollment_past_withdrawal.initialize','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end initialize;

------------------------------
-- call package initialization 
------------------------------
begin 
   initialize;
   
end zero_enrollment_campuses;
/


spool off
