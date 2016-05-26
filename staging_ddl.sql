-----------------------------------------------------------
-- Export file for user STAGING@DATAWH                   --
-- Created by espositot on 5/26/2016, 16:48:51 16:48:51  --
-----------------------------------------------------------

set define off
spool staging_ddl.log

prompt
prompt Creating table ABSENCE_FEX
prompt ==========================
prompt
create table STAGING.ABSENCE_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_type        VARCHAR2(1) not null,
  date_id            DATE not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  period             VARCHAR2(2) not null,
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
prompt Creating table CN_APP_FEX
prompt =========================
prompt
create table STAGING.CN_APP_FEX
(
  loc_county_dist_id CHAR(6 CHAR) not null,
  stu_key            VARCHAR2(16),
  app_dt             DATE,
  app_type           VARCHAR2(10 CHAR),
  status             VARCHAR2(5 CHAR),
  description        VARCHAR2(50 CHAR),
  approval_dt        DATE,
  submitted_by       VARCHAR2(20 CHAR),
  loc_key            VARCHAR2(15),
  effective_app_dt   DATE,
  services_app       VARCHAR2(25 CHAR),
  disapproval_dt     DATE
)
tablespace DW_DEFAULT01
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
prompt Creating table CN_FEX
prompt =====================
prompt
create table STAGING.CN_FEX
(
  loc_county_dist_id CHAR(6 CHAR) not null,
  stu_key            VARCHAR2(16),
  meal_key           VARCHAR2(20 CHAR),
  services_key       VARCHAR2(20 CHAR),
  service_start_dt   DATE,
  service_end_dt     DATE,
  meals_served       VARCHAR2(10 CHAR),
  tot_family_mbrs    NUMBER(19,5),
  program_level      VARCHAR2(7 CHAR)
)
tablespace DW_DEFAULT01
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
prompt Creating table CN_MEAL_DIM_DEX
prompt ==============================
prompt
create table STAGING.CN_MEAL_DIM_DEX
(
  loc_county_dist_id CHAR(6 CHAR) not null,
  meal_key           VARCHAR2(20 CHAR),
  meal_id            VARCHAR2(10 CHAR),
  meal_desc          VARCHAR2(50 CHAR),
  meal_short_desc    VARCHAR2(10 CHAR),
  meal_cat           VARCHAR2(10 CHAR),
  meal_fed_cat       VARCHAR2(10 CHAR)
)
tablespace DW_DEFAULT01
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
prompt Creating table CN_SERVICES_DIM_DEX
prompt ==================================
prompt
create table STAGING.CN_SERVICES_DIM_DEX
(
  loc_county_dist_id  CHAR(6 CHAR) not null,
  services_key        VARCHAR2(20 CHAR),
  services_id         VARCHAR2(10 CHAR),
  services_desc       VARCHAR2(50 CHAR),
  services_short_desc VARCHAR2(10 CHAR),
  services_cat        VARCHAR2(10 CHAR),
  services_sub_cat    VARCHAR2(10 CHAR),
  services_program    VARCHAR2(10 CHAR)
)
tablespace DW_DEFAULT01
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
prompt Creating table COURSE_DEX
prompt =========================
prompt
create table STAGING.COURSE_DEX
(
  loc_county_dist_id  VARCHAR2(6) not null,
  course_key          VARCHAR2(30) not null,
  school_year         VARCHAR2(4) not null,
  course_id           VARCHAR2(10),
  course_ext          VARCHAR2(5),
  course_desc         VARCHAR2(50),
  course_type         VARCHAR2(30),
  first_elgbl_grd     VARCHAR2(2),
  last_elgbl_grd      VARCHAR2(2),
  course_adopted_dt   VARCHAR2(21),
  course_updated_dt   VARCHAR2(21),
  course_deleted_dt   VARCHAR2(21),
  course_dept         VARCHAR2(15),
  course_subject_area VARCHAR2(30),
  state_course_cd     VARCHAR2(10),
  state_course_desc   VARCHAR2(40)
)
tablespace DW_DEFAULT01
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
create table STAGING.DATE_DEX
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
alter table STAGING.DATE_DEX
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
alter index STAGING.PK_DATE_DEX nologging;

prompt
prompt Creating table DATE_DIM_N
prompt =========================
prompt
create table STAGING.DATE_DIM_N
(
  date_sid          FLOAT,
  date_id           DATE,
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
  schl_day_ct_10    FLOAT
)
tablespace DW_DEFAULT01
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
prompt Creating table DIS_ACT_DEX
prompt ==========================
prompt
create table STAGING.DIS_ACT_DEX
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
  act_tot_cnt        NUMBER(6)
)
tablespace DW_DEFAULT01
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
create table STAGING.DIS_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  school_year        VARCHAR2(4) not null,
  record_type        VARCHAR2(1) not null,
  event_id           VARCHAR2(30) not null,
  inc_key            VARCHAR2(15) not null,
  act_key            VARCHAR2(15) not null,
  stu_key            VARCHAR2(16) not null,
  state_grp_key      VARCHAR2(15) not null,
  loo_key            VARCHAR2(15) not null,
  event_dt           DATE,
  event_time         VARCHAR2(5),
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
  act_nbr_of_days    NUMBER(5,2),
  act_nbr_dys_servd  NUMBER(5,2),
  act_reason_dif     VARCHAR2(2),
  act_begin_dt       DATE,
  inactive_record    NUMBER(1),
  process_dt         DATE
)
tablespace DW_DEFAULT01
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
create table STAGING.DIS_INC_DEX
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
create table STAGING.DIS_LOO_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  loo_key            VARCHAR2(15) not null,
  loo_id             VARCHAR2(13),
  loo_desc           VARCHAR2(25),
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
create table STAGING.DIS_STATE_GRP_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  state_grp_key      VARCHAR2(15) not null,
  state_grp_id       VARCHAR2(13),
  state_grp_desc     VARCHAR2(35)
)
tablespace DW_DEFAULT01
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
create table STAGING.ENROLLMENT_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  date_id            DATE not null,
  cnt                CHAR(1) not null,
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
create bitmap index STAGING.BMI_CDC_LOC on STAGING.ENROLLMENT_FEX (LOC_COUNTY_DIST_ID, LOC_ID)
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
prompt Creating table ESP_DATES_FEX
prompt ============================
prompt
create table STAGING.ESP_DATES_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_key            VARCHAR2(16) not null,
  esp_key            VARCHAR2(20) not null,
  date_desc          VARCHAR2(60),
  date_value         DATE,
  event_date         DATE,
  event_date_type    VARCHAR2(15),
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
prompt Creating table ESP_DEX
prompt ======================
prompt
create table STAGING.ESP_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  esp_key            VARCHAR2(20) not null,
  esp_id             VARCHAR2(35),
  esp_desc           VARCHAR2(50),
  esp_abbr           VARCHAR2(15),
  esp_category_cd    VARCHAR2(15),
  esp_sub_category   VARCHAR2(20),
  esp_type           VARCHAR2(20)
)
tablespace DW_DEFAULT01
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
prompt Creating table ESP_STATUS_FEX
prompt =============================
prompt
create table STAGING.ESP_STATUS_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_key            VARCHAR2(16) not null,
  esp_key            VARCHAR2(20) not null,
  event_date         DATE,
  esp_ext_inst_flag  VARCHAR2(3),
  esp_instr_model    VARCHAR2(15),
  esp_test_id        VARCHAR2(10),
  esp_test_subj_area VARCHAR2(30),
  esp_test_type      VARCHAR2(10),
  esp_test_score     VARCHAR2(5),
  esp_exit_reason    VARCHAR2(15),
  esp_beg_orl_ctgry  VARCHAR2(10),
  esp_beg_wrt_ctgry  VARCHAR2(10),
  esp_cur_orl_ctgry  VARCHAR2(10),
  esp_cur_wrt_ctgry  VARCHAR2(10),
  esp_primary_cd     VARCHAR2(3),
  ese_cd_2           VARCHAR2(3),
  ese_cd_3           VARCHAR2(3),
  ese_instr_arrngmnt VARCHAR2(15),
  ese_speech_indctr  VARCHAR2(2),
  hst_subject        VARCHAR2(15),
  alt_wrt_inst_lvl   VARCHAR2(15),
  alt_rdg_inst_lvl   VARCHAR2(15),
  alt_mth_inst_lvl   VARCHAR2(15),
  alt_wrt_achv_lvl   VARCHAR2(15),
  alt_rgd_achv_lvl   VARCHAR2(15),
  alt_mth_achv_lvl   VARCHAR2(15),
  alt_wrt_baseline   VARCHAR2(15),
  alt_rdg_baseline   VARCHAR2(15),
  alt_mth_baseline   VARCHAR2(15),
  alt_sci_achv_lvl   VARCHAR2(15),
  alt_sci_baseline   VARCHAR2(15),
  alt_sci_inst_lvl   VARCHAR2(15),
  process_date       DATE,
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
prompt Creating table FUNCTION_DEX
prompt ===========================
prompt
create table STAGING.FUNCTION_DEX
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
create table STAGING.FUND_DEX
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
create table STAGING.GRADES_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_id             VARCHAR2(16) not null,
  course_id          VARCHAR2(30) not null,
  staff_id           VARCHAR2(25) not null,
  date_id            VARCHAR2(20),
  grd_lvl_id         VARCHAR2(2),
  grade_type         VARCHAR2(20) not null,
  school_year        NUMBER(4),
  grading_period     VARCHAR2(1) not null,
  from_period        VARCHAR2(2),
  to_period          VARCHAR2(2),
  sec_letter_grd     VARCHAR2(6),
  sec_nbr_grd        VARCHAR2(6),
  sec_conduct_grd    VARCHAR2(6),
  credits_attempted  NUMBER(4),
  credits_earned     NUMBER(4),
  credits_denied     NUMBER(4),
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
prompt Creating table GRADES_GPA_FEX
prompt =============================
prompt
create table STAGING.GRADES_GPA_FEX
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
create table STAGING.LEDGER_FEX
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
  fiscal_period      NUMBER(2)
)
tablespace DW_DEFAULT01
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
create table STAGING.LOCATION_DEX
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
create table STAGING.OBJECT_DEX
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
create table STAGING.PROGRAM_INTENT_DEX
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
create table STAGING.STAFF_ABSENT_FEX
(
  loc_county_dist_id  CHAR(6) not null,
  loc_key             VARCHAR2(15) not null,
  abt_key             VARCHAR2(15),
  abr_key             VARCHAR2(15),
  staff_key           VARCHAR2(16) not null,
  sta_absence_id      VARCHAR2(40 CHAR),
  sta_reason_id       VARCHAR2(2),
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
  );

prompt
prompt Creating table STAFF_ABSENT_REASON_DEX
prompt ======================================
prompt
create table STAGING.STAFF_ABSENT_REASON_DEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  abr_key            VARCHAR2(15) not null,
  abr_id             VARCHAR2(5) not null,
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
create table STAGING.STAFF_ABSENT_TYPE_DEX
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
create table STAGING.STAFF_DEX
(
  loc_county_dist_id CHAR(6) not null,
  staff_key          VARCHAR2(16) not null,
  staff_id           VARCHAR2(7),
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
  staff_growth_plan  VARCHAR2(25)
)
tablespace DW_DEFAULT01
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
create table STAGING.STAFF_FUNC_DEX
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
  );

prompt
prompt Creating table STAFF_PAC_DIM_DEX
prompt ================================
prompt
create table STAGING.STAFF_PAC_DIM_DEX
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
  );

prompt
prompt Creating table STAFF_QUALIFICATIONS_DIM_DEX
prompt ===========================================
prompt
create table STAGING.STAFF_QUALIFICATIONS_DIM_DEX
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
  );

prompt
prompt Creating table STAFF_QUALIFICATIONS_FACT_FEX
prompt ============================================
prompt
create table STAGING.STAFF_QUALIFICATIONS_FACT_FEX
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
  );

prompt
prompt Creating table STAFF_RESP_FACT_FEX
prompt ==================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  payr_act_cd        VARCHAR2(2 CHAR) not null,
  fund_cd            VARCHAR2(3 CHAR) not null,
  function_cd        VARCHAR2(2 CHAR) not null,
  obj_cd             VARCHAR2(4 CHAR) not null,
  org_cd             VARCHAR2(3 CHAR) not null,
  fiscal_yr          VARCHAR2(1 CHAR) not null,
  nbr_dys_empl       VARCHAR2(3 CHAR) not null,
  pct_day_empl       VARCHAR2(3 CHAR) not null,
  role_key           VARCHAR2(3 CHAR),
  svc_id             VARCHAR2(8 CHAR),
  svc_cnt            FLOAT,
  budgeted_amt       NUMBER(38,6)
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_RESP_FACT_FEX1
prompt ===================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  payr_act_cd        VARCHAR2(2 CHAR) not null,
  fund_cd            VARCHAR2(3 CHAR) not null,
  function_cd        VARCHAR2(2 CHAR) not null,
  obj_cd             VARCHAR2(4 CHAR) not null,
  org_cd             VARCHAR2(3 CHAR) not null,
  fiscal_yr          VARCHAR2(1 CHAR) not null,
  payr_amt           NUMBER(38),
  nbr_dys_empl       NUMBER(38),
  pct_day_empl       NUMBER(10,2),
  prog_intent_cd     VARCHAR2(2 CHAR) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_RESP_FACT_FEX2
prompt ===================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX2
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  role_id            VARCHAR2(3 CHAR) not null,
  svc_id             VARCHAR2(8 CHAR),
  beg_time           VARCHAR2(5 CHAR),
  end_time           VARCHAR2(5 CHAR),
  mult_svc_ind_cd    VARCHAR2(1 CHAR),
  nbr_stu_cls        VARCHAR2(3 CHAR),
  esc_ssa_sta_ind_cd VARCHAR2(1 CHAR)
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_RESP_FACT_FEX3
prompt ===================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX3
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  payr_act_cd        VARCHAR2(2 CHAR) not null,
  fund_cd            VARCHAR2(3 CHAR) not null,
  function_cd        VARCHAR2(2 CHAR) not null,
  obj_cd             VARCHAR2(4 CHAR) not null,
  org_cd             VARCHAR2(3 CHAR) not null,
  fiscal_yr          VARCHAR2(1 CHAR) not null,
  payr_amt           NUMBER(38),
  nbr_dys_empl       NUMBER(38),
  pct_day_empl       NUMBER(19,2),
  role_key           VARCHAR2(3 CHAR),
  svc_id             VARCHAR2(8 CHAR),
  beg_time           VARCHAR2(5 CHAR),
  end_time           VARCHAR2(5 CHAR),
  mult_svc_ind_cd    VARCHAR2(20 CHAR),
  nbr_stu_cls        VARCHAR2(3 CHAR),
  esc_ssa_sta_ind_cd VARCHAR2(1 CHAR),
  prog_intent_cd     VARCHAR2(2 CHAR) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_RESP_FACT_FEX4
prompt ===================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX4
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  role_key           VARCHAR2(3 CHAR) not null,
  svc_cnt            FLOAT
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_RESP_FACT_FEX5
prompt ===================================
prompt
create table STAGING.STAFF_RESP_FACT_FEX5
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_cnt            FLOAT
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_ROLE_CD_DIM_DEX
prompt ====================================
prompt
create table STAGING.STAFF_ROLE_CD_DIM_DEX
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
  );

prompt
prompt Creating table STAFF_ROLE_CD_DIM_DEX1
prompt =====================================
prompt
create table STAGING.STAFF_ROLE_CD_DIM_DEX1
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
  );

prompt
prompt Creating table STAFF_SCHDL_FEX
prompt ==============================
prompt
create table STAGING.STAFF_SCHDL_FEX
(
  record_key         VARCHAR2(37),
  course_id          VARCHAR2(55),
  staff_key          VARCHAR2(55),
  schl_year          VARCHAR2(4),
  loc_id             VARCHAR2(55),
  section_id         NUMBER,
  staff_id           NUMBER,
  term               VARCHAR2(5),
  from_period        VARCHAR2(3),
  to_period          VARCHAR2(3),
  cert_flag          NUMBER,
  from_date          DATE,
  from_hour          VARCHAR2(2),
  from_minute        VARCHAR2(2),
  to_date            DATE,
  to_hour            NUMBER,
  to_minute          NUMBER,
  mnts_per_week      NUMBER,
  day_1              NUMBER,
  day_2              NUMBER,
  day_3              NUMBER,
  day_4              NUMBER,
  day_5              NUMBER,
  day_6              NUMBER,
  nbr_dys_in_week    NUMBER,
  max_seats          NUMBER,
  occupancy_term_1   NUMBER,
  occupancy_term_2   NUMBER,
  building           NUMBER,
  room               VARCHAR2(15),
  fefp_funding_nbr   NUMBER,
  fte_elgblty_flag   NUMBER,
  from_grd_lvl       VARCHAR2(2),
  to_grd_lvl         VARCHAR2(2),
  grd_elgblty_flag   NUMBER,
  drpout_prev_flag   NUMBER,
  bell_schdl         NUMBER,
  calendar_1         NUMBER,
  calendar_2         NUMBER,
  calendar_3         NUMBER,
  calendar_4         NUMBER,
  instructional_stng VARCHAR2(2),
  class_hours        NUMBER,
  voc_subprgrm       NUMBER,
  occup_cmpltn_pts   NUMBER,
  program_lngth      NUMBER,
  fee_type_1         VARCHAR2(8),
  fee_amt_1          NUMBER(7,2),
  fee_type_2         NUMBER,
  fee_amt_2          NUMBER,
  fee_type_3         NUMBER,
  fee_amt_3          NUMBER,
  fee_type_4         NUMBER,
  fee_amt_4          NUMBER,
  fee_type_5         NUMBER,
  fee_amt_5          NUMBER,
  fee_type_6         NUMBER,
  fee_amt_6          NUMBER,
  fee_type_7         NUMBER,
  fee_amt_7          NUMBER,
  fee_type_8         NUMBER,
  fee_amt_8          NUMBER,
  fee_type_9         NUMBER,
  fee_amt_9          NUMBER,
  voc_intent         VARCHAR2(2),
  incarceration_flag NUMBER,
  voc_spcl_inittivs  NUMBER,
  voc_stng           NUMBER,
  adlt_spcl_inittivs NUMBER,
  day_night_indctr   NUMBER,
  gateway_program    NUMBER,
  fmly_ltrcy_program NUMBER,
  dual_enrlmt_indctr VARCHAR2(2),
  co_enrl_stu_indctr NUMBER,
  hgly_qlified_tchr  NUMBER,
  scheduling_mthd    NUMBER,
  section_team       VARCHAR2(3),
  spec_ed_flag       VARCHAR2(1),
  process_dt         DATE,
  inactive_record    NUMBER
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
prompt Creating table STAFF_SCHEDULE_FEX
prompt =================================
prompt
create table STAGING.STAFF_SCHEDULE_FEX
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_key         VARCHAR2(51),
  course_id          VARCHAR2(30),
  staff_key          VARCHAR2(16),
  schl_year          VARCHAR2(4),
  loc_id             VARCHAR2(15),
  section_id         VARCHAR2(10),
  staff_id           VARCHAR2(20),
  term               VARCHAR2(5),
  from_period        VARCHAR2(3),
  to_period          VARCHAR2(3),
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
  bell_schdl         VARCHAR2(1),
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
prompt Creating table STAFF_SVC_DIM_DEX
prompt ================================
prompt
create table STAGING.STAFF_SVC_DIM_DEX
(
  record_type_cd    VARCHAR2(8 CHAR) not null,
  record_type_ident VARCHAR2(8 CHAR),
  record_type_desc  VARCHAR2(255 CHAR) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_SVC_DIM_DEX1
prompt =================================
prompt
create table STAGING.STAFF_SVC_DIM_DEX1
(
  record_type_cd    VARCHAR2(8 CHAR) not null,
  record_type_ident VARCHAR2(8 CHAR),
  record_type_desc  VARCHAR2(255 CHAR) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_DEX
prompt ==========================
prompt
create table STAGING.STUDENT_DEX
(
  loc_county_dist_id   CHAR(6),
  loc_district         VARCHAR2(25),
  stu_key              VARCHAR2(40) not null,
  stu_id               VARCHAR2(16),
  stu_id_2             VARCHAR2(11),
  stu_full_name        VARCHAR2(75),
  stu_last_name        VARCHAR2(25),
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
  stu_dtp              VARCHAR2(30)
)
tablespace DW_DEFAULT01
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
create table STAGING.STUDENT_SCHEDULE_FEX
(
  loc_county_dist_id CHAR(6) not null,
  record_key         VARCHAR2(51),
  staff_sched_key    VARCHAR2(55) not null,
  school_year        CHAR(4) not null,
  stu_id             VARCHAR2(16) not null,
  loc_id             VARCHAR2(15) not null,
  course_id          VARCHAR2(30),
  section            VARCHAR2(15),
  from_dt            VARCHAR2(32 CHAR),
  from_time_hour     CHAR(2 CHAR),
  from_time_min      CHAR(2 CHAR),
  from_period        VARCHAR2(2 CHAR),
  to_time_hour       CHAR(2 CHAR),
  to_time_min        CHAR(2 CHAR),
  to_period          VARCHAR2(2 CHAR),
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
create table STAGING.TAKS_ELA_DEX1
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
create table STAGING.TAKS_ELA_FEX1
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
create table STAGING.TAKS_ITEM_DEX1
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
create table STAGING.TAKS_ITEM_DEX2
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
create table STAGING.TAKS_ITEM_DEX3
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
create index STAGING.TAKS_DEX3_OBJID_QNUM_SUBID on STAGING.TAKS_ITEM_DEX3 (OBJECTIVE_ID, QUESTION_NUM, SUBJECT_ID)
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
create unique index STAGING.TAKS_ITEM_DEX3_TEST_DIM_ID on STAGING.TAKS_ITEM_DEX3 (TEST_DIM_ID)
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
create table STAGING.TAKS_ITEM_LVL_FEX1
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
create table STAGING.TAKS_OBJ_DEX1
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
create table STAGING.TAKS_OBJ_LVL_FEX1
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
create table STAGING.TAKS_SUBJECT_DEX1
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
create table STAGING.TAKS_WRITING_DEX1
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
create table STAGING.TAKS_WRITING_FEX1
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
prompt Creating table TEST
prompt ===================
prompt
create table STAGING.TEST
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  staff_key          VARCHAR2(16 CHAR),
  loc_key            VARCHAR2(10 CHAR),
  payr_act_cd        VARCHAR2(2 CHAR) not null,
  fund_cd            VARCHAR2(3 CHAR) not null,
  function_cd        VARCHAR2(2 CHAR) not null,
  obj_cd             VARCHAR2(4 CHAR) not null,
  org_cd             VARCHAR2(3 CHAR) not null,
  fiscal_yr          VARCHAR2(1 CHAR) not null,
  prog_intent_cd     VARCHAR2(2 CHAR) not null,
  payr_amt           VARCHAR2(6 CHAR) not null,
  nbr_dys_empl       VARCHAR2(3 CHAR) not null,
  pct_day_empl       VARCHAR2(3 CHAR) not null,
  role_key           VARCHAR2(3 CHAR),
  svc_id             VARCHAR2(8 CHAR),
  svc_amt            FLOAT
)
tablespace DW_DEFAULT01
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
prompt Creating table TEST_DEX
prompt =======================
prompt
create table STAGING.TEST_DEX
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
create index STAGING.TEST_DEX_TEST_DIM_ID on STAGING.TEST_DEX (TEST_DIM_ID)
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
create table STAGING.TEST_FEX
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_dim_id        VARCHAR2(50),
  date_id            VARCHAR2(10 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  stu_id             VARCHAR2(9 CHAR) not null,
  test_id            VARCHAR2(5),
  char_bk_1          VARCHAR2(9 CHAR),
  char_bk_2          VARCHAR2(9 CHAR),
  char_bk_3          VARCHAR2(15),
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR),
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  char_bk_11         VARCHAR2(2),
  int_bk_1           VARCHAR2(5),
  int_bk_2           VARCHAR2(5),
  int_bk_3           VARCHAR2(2 CHAR),
  int_bk_4           VARCHAR2(2),
  int_bk_5           VARCHAR2(2),
  int_bk_6           VARCHAR2(2 CHAR),
  int_bk_7           VARCHAR2(2 CHAR),
  int_bk_8           VARCHAR2(2 CHAR),
  int_bk_9           VARCHAR2(2 CHAR),
  int_bk_10          VARCHAR2(2 CHAR),
  float_bk_1         VARCHAR2(6),
  float_bk_2         CHAR(2 CHAR),
  float_bk_3         CHAR(2 CHAR),
  float_bk_4         CHAR(2 CHAR),
  float_bk_5         CHAR(2 CHAR),
  float_bk_6         CHAR(2 CHAR),
  float_bk_7         CHAR(2 CHAR),
  float_bk_8         CHAR(2 CHAR),
  float_bk_9         CHAR(2 CHAR),
  float_bk_10        CHAR(2 CHAR),
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
create bitmap index STAGING.BMI_CDC_TEST_FEX on STAGING.TEST_FEX (LOC_COUNTY_DIST_ID)
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
create index STAGING.TESTFEXIDS_STU_TEST_LOC_DIST on STAGING.TEST_FEX (STU_ID, TEST_DIM_ID, LOC_ID, LOC_COUNTY_DIST_ID)
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
create table STAGING.TEST_SUMMARY_FEX
(
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  test_dim_id        VARCHAR2(50),
  date_id            VARCHAR2(10 CHAR) not null,
  loc_id             VARCHAR2(16 CHAR),
  stu_id             VARCHAR2(9 CHAR) not null,
  char_bk_1          VARCHAR2(9),
  char_bk_2          VARCHAR2(9) not null,
  char_bk_3          VARCHAR2(15) not null,
  char_bk_4          VARCHAR2(2 CHAR) not null,
  char_bk_5          VARCHAR2(2 CHAR) not null,
  char_bk_6          VARCHAR2(2 CHAR) not null,
  char_bk_7          VARCHAR2(2 CHAR) not null,
  char_bk_8          VARCHAR2(2 CHAR) not null,
  char_bk_9          VARCHAR2(2 CHAR) not null,
  char_bk_10         VARCHAR2(2 CHAR) not null,
  int_bk_1           VARCHAR2(5),
  int_bk_2           VARCHAR2(5),
  int_bk_3           VARCHAR2(2 CHAR),
  int_bk_4           CHAR(2 CHAR),
  int_bk_5           CHAR(2 CHAR),
  int_bk_6           VARCHAR2(2 CHAR),
  int_bk_7           VARCHAR2(2 CHAR),
  int_bk_8           VARCHAR2(2 CHAR),
  int_bk_9           VARCHAR2(2 CHAR),
  int_bk_10          VARCHAR2(2 CHAR),
  float_bk_1         VARCHAR2(6),
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
create bitmap index STAGING.BMI_CDC_TEST_SUMMARY_FEX on STAGING.TEST_SUMMARY_FEX (LOC_COUNTY_DIST_ID)
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
create table STAGING.TEST_TAKS_SUB_FEX1
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
create table STAGING.TRANSACTION_FEX
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
prompt Creating table TRANS_EQUIP_DIM_DEX
prompt ==================================
prompt
create table STAGING.TRANS_EQUIP_DIM_DEX
(
  loc_county_dist_id VARCHAR2(6),
  bus_key            VARCHAR2(25 CHAR),
  bus_id             VARCHAR2(15 CHAR),
  permit_num         VARCHAR2(25 CHAR),
  state_inspect      VARCHAR2(25 CHAR),
  sum_inspect        VARCHAR2(25 CHAR),
  sticker_num        VARCHAR2(25 CHAR),
  vin_num            VARCHAR2(50 CHAR),
  chassis_make       VARCHAR2(25 CHAR),
  chassis_year       VARCHAR2(25 CHAR),
  body_make          VARCHAR2(25 CHAR),
  body_year          VARCHAR2(25 CHAR),
  primary_use        VARCHAR2(25 CHAR),
  capacity           VARCHAR2(25 CHAR),
  fuel_type          VARCHAR2(25 CHAR),
  prim_handicap      VARCHAR2(25 CHAR),
  wheelchair_lift    VARCHAR2(25 CHAR),
  purch_method       VARCHAR2(25 CHAR),
  purch_amt          VARCHAR2(25 CHAR),
  purch_date         DATE
)
tablespace DW_DEFAULT01
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
prompt Creating table TRANS_PER_FACT_FEX
prompt =================================
prompt
create table STAGING.TRANS_PER_FACT_FEX
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32 CHAR),
  loc_key            VARCHAR2(15),
  staff_key          VARCHAR2(16),
  cdl_num            VARCHAR2(10 CHAR),
  physical_date      VARCHAR2(32 CHAR),
  driv_rec           VARCHAR2(10 CHAR),
  crim_back          VARCHAR2(10 CHAR),
  drug_test          VARCHAR2(10 CHAR),
  inserv_train       VARCHAR2(10 CHAR)
)
tablespace DW_DEFAULT01
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
prompt Creating table TRANS_ROUTE_FACT_FEX
prompt ===================================
prompt
create table STAGING.TRANS_ROUTE_FACT_FEX
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32 CHAR),
  bus_key            VARCHAR2(25 CHAR),
  trans_type_id      VARCHAR2(15 CHAR),
  stu_key            VARCHAR2(40),
  staff_key          VARCHAR2(16),
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
  );


spool off
