-----------------------------------------------------------
-- Export file for user FRISCO@DATAWH                    --
-- Created by espositot on 5/26/2016, 15:49:55 15:49:55  --
-----------------------------------------------------------

set define off
spool frisco_ddl.log

prompt
prompt Creating table ABSENCE_FACT_FEX1
prompt ================================
prompt
create table FRISCO.ABSENCE_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  date_id            VARCHAR2(32),
  stu_key            VARCHAR2(16) not null,
  loc_key            VARCHAR2(15) not null,
  record_type        VARCHAR2(1),
  period             VARCHAR2(3),
  event_type         VARCHAR2(20)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table CN_APP_FEX1
prompt ==========================
prompt
create table FRISCO.CN_APP_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_key            VARCHAR2(16) not null,
  app_dt             DATE,
  app_type           VARCHAR2(10),
  status             VARCHAR2(5),
  description        VARCHAR2(50),
  approval_dt        DATE,
  submitted_by       VARCHAR2(20),
  loc_key            VARCHAR2(15),
  effective_app_dt   DATE,
  services_app       VARCHAR2(100),
  disapproval_dt     DATE
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table CN_FEX1
prompt ======================
prompt
create table FRISCO.CN_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_key            VARCHAR2(16) not null,
  meal_key           VARCHAR2(20) not null,
  services_key       VARCHAR2(20) not null,
  service_start_dt   DATE,
  service_end_dt     DATE,
  meals_served       VARCHAR2(10),
  tot_family_mbrs    NUMBER(15,5),
  program_level      VARCHAR2(7)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table CN_MEAL_DIM_DEX1
prompt ===============================
prompt
create table FRISCO.CN_MEAL_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  meal_key           VARCHAR2(20) not null,
  meal_id            VARCHAR2(10),
  meal_desc          VARCHAR2(50),
  meal_short_desc    VARCHAR2(10),
  meal_cat           VARCHAR2(10),
  meal_fed_cat       VARCHAR2(10)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table CN_SERVICES_DIM_DEX1
prompt ===================================
prompt
create table FRISCO.CN_SERVICES_DIM_DEX1
(
  loc_county_dist_id  VARCHAR2(6) not null,
  services_key        VARCHAR2(20) not null,
  services_id         VARCHAR2(10),
  services_desc       VARCHAR2(200),
  services_short_desc VARCHAR2(40),
  services_cat        VARCHAR2(10),
  services_sub_cat    VARCHAR2(40),
  services_program    VARCHAR2(40)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.COURSE_DIM_DEX1
(
  loc_county_dist_id  VARCHAR2(6) not null,
  course_key          VARCHAR2(30) not null,
  school_year         CHAR(4) not null,
  course_id           VARCHAR2(15),
  course_ext          VARCHAR2(5),
  course_desc         VARCHAR2(40),
  course_type         VARCHAR2(25),
  first_elgbl_grd     VARCHAR2(2),
  last_elgbl_grd      VARCHAR2(2),
  course_dept         VARCHAR2(20),
  course_subject_area VARCHAR2(25),
  state_course_cd     VARCHAR2(10),
  state_course_desc   VARCHAR2(60),
  course_adopted_dt   VARCHAR2(21),
  course_deleted_dt   VARCHAR2(21),
  course_updated_dt   VARCHAR2(21)
)
tablespace DW_DEFAULT03
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
create index FRISCO.COURSE_KEY on FRISCO.COURSE_DIM_DEX1 (COURSE_KEY)
  tablespace DW_DEFAULT03
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
create index FRISCO.IX_COURSE_ID on FRISCO.COURSE_DIM_DEX1 (COURSE_ID)
  tablespace DW_DEFAULT03
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
prompt Creating table DIS_ACT_DIM_DEX1
prompt ===============================
prompt
create table FRISCO.DIS_ACT_DIM_DEX1
(
  loc_county_dist_id  VARCHAR2(6) not null,
  act_key             VARCHAR2(15) not null,
  act_id              VARCHAR2(13),
  act_type            VARCHAR2(5),
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
  is_schll_chg_plcmnt NUMBER
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index FRISCO.PK_DIS_ACT_DIM_DEX1 on FRISCO.DIS_ACT_DIM_DEX1 (ACT_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table DIS_FACT_FEX1
prompt ============================
prompt
create table FRISCO.DIS_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  school_year        VARCHAR2(4) not null,
  record_type        VARCHAR2(1),
  stu_key            VARCHAR2(16) not null,
  event_id           VARCHAR2(50),
  cur_grd_lvl        VARCHAR2(2),
  nbr_of_incidents   CHAR(2),
  is_hate_crime      CHAR(1),
  is_alcohol         CHAR(1),
  is_drug            CHAR(1),
  is_weapon          CHAR(1),
  is_gang            CHAR(1),
  was_law_notified   CHAR(1),
  invlvmnt_type      VARCHAR2(2),
  where_flag         VARCHAR2(5),
  weapon_type_cd     VARCHAR2(2),
  loo_key            VARCHAR2(15),
  inc_key            VARCHAR2(15),
  event_loc_key      VARCHAR2(15),
  event_dt           VARCHAR2(32),
  event_time         VARCHAR2(5),
  rprtng_staff_id    VARCHAR2(15),
  state_grp_id       VARCHAR2(55),
  case_nbr           VARCHAR2(25),
  act_nbr_of_days    VARCHAR2(83),
  act_key            VARCHAR2(15),
  act_loc_key        VARCHAR2(15),
  act_dt             VARCHAR2(32),
  act_staff_id       VARCHAR2(15),
  act_begin_dt       VARCHAR2(32),
  act_nbr_dys_servd  VARCHAR2(10),
  act_reason_dif     VARCHAR2(2)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.DIS_INC_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  inc_key            VARCHAR2(15),
  inc_id             VARCHAR2(13),
  inc_short_desc     VARCHAR2(25),
  inc_type           VARCHAR2(5),
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
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index FRISCO.PK_DIS_INC_DIM_DEX1 on FRISCO.DIS_INC_DIM_DEX1 (INC_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table DIS_LOO_DIM_DEX1
prompt ===============================
prompt
create table FRISCO.DIS_LOO_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  loo_key            VARCHAR2(15),
  loo_id             VARCHAR2(13),
  loo_short_desc     VARCHAR2(15),
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
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index FRISCO.PK_DIS_LOO_DIM_DEX1 on FRISCO.DIS_LOO_DIM_DEX1 (LOO_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table DIS_STATE_GRP_DIM_DEX1
prompt =====================================
prompt
create table FRISCO.DIS_STATE_GRP_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  state_grp_key      VARCHAR2(15),
  state_grp_id       VARCHAR2(13),
  state_grp_desc     CHAR(50)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index FRISCO.PK_DIS_STATE_GRP_DIM_DEX1 on FRISCO.DIS_STATE_GRP_DIM_DEX1 (STATE_GRP_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table ENROLLMENT_FACT_FEX1
prompt ===================================
prompt
create table FRISCO.ENROLLMENT_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  stu_key            VARCHAR2(16),
  loc_key            VARCHAR2(15),
  date_id            VARCHAR2(10),
  enr_cnt            CHAR(1),
  ada_enr_cnt        NUMBER(2,1)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index FRISCO.bmi_enrl_fact_cdc_ on FRISCO.ENROLLMENT_FACT_FEX1 (LOC_COUNTY_DIST_ID)
  tablespace DW_DEFAULT03
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
create bitmap index FRISCO.bmi_enrl_fact_date_id on FRISCO.ENROLLMENT_FACT_FEX1 (DATE_ID)
  tablespace DW_DEFAULT03
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
create bitmap index FRISCO.bmi_enrl_fact_loc_key on FRISCO.ENROLLMENT_FACT_FEX1 (LOC_KEY)
  tablespace DW_DEFAULT03
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
create bitmap index FRISCO.bmi_enrl_fact_stu_key on FRISCO.ENROLLMENT_FACT_FEX1 (STU_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table ESP_DATES_FACT_FEX1
prompt ==================================
prompt
create table FRISCO.ESP_DATES_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  stu_key            VARCHAR2(16),
  esp_key            VARCHAR2(20),
  date_desc          VARCHAR2(60),
  date_value         VARCHAR2(32),
  event_date         VARCHAR2(32),
  event_date_type    VARCHAR2(15)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table ESP_DIM_DEX1
prompt ===========================
prompt
create table FRISCO.ESP_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  esp_id             VARCHAR2(35),
  esp_abbr           VARCHAR2(15),
  esp_desc           VARCHAR2(50),
  esp_category_cd    VARCHAR2(15),
  esp_sub_category   VARCHAR2(20),
  esp_key            VARCHAR2(20) not null,
  esp_type           VARCHAR2(20),
  cnt                NUMBER
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.ESP_DIM_DEX1
  add constraint PK_ESP_DIM_DEX1 primary key (ESP_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table ESP_STATUS_FACT_FEX1
prompt ===================================
prompt
create table FRISCO.ESP_STATUS_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  stu_key            VARCHAR2(16),
  event_date         VARCHAR2(32),
  esp_key            VARCHAR2(20),
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
  alt_sci_inst_lvl   VARCHAR2(15)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table FUNCTION_DIM_DEX1
prompt ================================
prompt
create table FRISCO.FUNCTION_DIM_DEX1
(
  loc_county_dist_id   VARCHAR2(6),
  function_key         VARCHAR2(15) not null,
  function_id          VARCHAR2(7),
  function_major       VARCHAR2(7),
  function_major_desc  VARCHAR2(50),
  function_detail      VARCHAR2(7),
  function_detail_desc VARCHAR2(50)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.FUNCTION_DIM_DEX1
  add constraint PK_FUNCTION_DIM_DEX1 primary key (FUNCTION_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table FUND_DIM_DEX1
prompt ============================
prompt
create table FRISCO.FUND_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  fund_key           VARCHAR2(15) not null,
  fund_id            VARCHAR2(7),
  fund_desc          VARCHAR2(50),
  fund_type_desc     VARCHAR2(50),
  fund_type          VARCHAR2(7)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.FUND_DIM_DEX1
  add constraint PK_FUND_DIM_DEX1 primary key (FUND_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table GRADES_FACT_FEX1
prompt ===============================
prompt
create table FRISCO.GRADES_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  stu_key            VARCHAR2(16),
  course_key         VARCHAR2(30),
  course_id          VARCHAR2(14),
  staff_key          VARCHAR2(16),
  school_year        CHAR(4),
  grade_lvl_id       VARCHAR2(2),
  grading_period     VARCHAR2(2),
  grades_type        VARCHAR2(53),
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  sec_nbr_grd        VARCHAR2(10),
  sec_conduct_grd    VARCHAR2(3),
  sec_letter_grd     VARCHAR2(4),
  credits_attempted  NUMBER(6,3),
  credits_earned     NUMBER(7,3),
  credits_denied     CHAR(1),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(15)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.GRADES_GPA_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_key            VARCHAR2(16) not null,
  date_id            VARCHAR2(32) not null,
  grade_lvl_id       VARCHAR2(2),
  grading_period     VARCHAR2(2),
  school_year        CHAR(4),
  gpa_grade          NUMBER(7,4),
  gpa_2              NUMBER(8,4),
  gpa_3              NUMBER(8,4),
  gpa_4              NUMBER(8,4),
  tot_periods        VARCHAR2(2),
  tot_grades         VARCHAR2(2),
  gpa_gpa2           FLOAT,
  gpa_gpa3           FLOAT,
  gpa_gpa4           FLOAT,
  tot_points         VARCHAR2(256)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.LEDGER_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  fund_key           VARCHAR2(15),
  function_key       VARCHAR2(15),
  object_key         VARCHAR2(15),
  progarm_intent_key VARCHAR2(15),
  loc_key            VARCHAR2(15),
  ledger_type        VARCHAR2(5),
  amount             VARCHAR2(340),
  budget             VARCHAR2(340),
  appropriation      CHAR(340),
  encumbrances       CHAR(340),
  fiscal_year        VARCHAR2(4),
  fiscal_period      VARCHAR2(4),
  local_option_code  VARCHAR2(3)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.LOCATION_DIM_DEX1
(
  loc_county_dist_id     VARCHAR2(6),
  loc_district           VARCHAR2(25),
  loc_id                 VARCHAR2(21),
  loc_desc               VARCHAR2(50),
  loc_shrt_desc          VARCHAR2(40),
  loc_abbrev             VARCHAR2(25),
  loc_principal_name     VARCHAR2(35),
  loc_state_type         VARCHAR2(2),
  loc_local_type         VARCHAR2(35),
  loc_addr_1             VARCHAR2(140),
  loc_addr_2             VARCHAR2(35),
  loc_city               VARCHAR2(24),
  loc_state              VARCHAR2(2),
  loc_zip                VARCHAR2(10),
  loc_schl_year          VARCHAR2(4),
  loc_phone              VARCHAR2(20),
  loc_term               VARCHAR2(80),
  loc_periods            NUMBER(2),
  loc_ch_ed_cd           VARCHAR2(80),
  loc_attendnce_goal     CHAR(1),
  loc_cost               CHAR(1),
  loc_frl_quartile       CHAR(1),
  loc_area_desc          VARCHAR2(120),
  loc_title_1_flag       VARCHAR2(1),
  loc_principal_ext      CHAR(4),
  loc_admin_type         VARCHAR2(20),
  loc_aaa_flag           VARCHAR2(1),
  loc_square_footage     CHAR(1),
  loc_target_asst_flag   VARCHAR2(20),
  loc_area_id            VARCHAR2(80),
  loc_uil_classification VARCHAR2(40),
  loc_area_long_id       VARCHAR2(10),
  loc_fte_hours          CHAR(1),
  loc_area_shrt_desc     VARCHAR2(28),
  loc_imp_target         VARCHAR2(80),
  loc_key                VARCHAR2(15) not null
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.LOCATION_DIM_DEX1
  add constraint PK_LOCATION_DIM_DEX1 primary key (LOC_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table OBJECT_DIM_DEX1
prompt ==============================
prompt
create table FRISCO.OBJECT_DIM_DEX1
(
  loc_county_dist_id     VARCHAR2(6),
  object_key             VARCHAR2(15) not null,
  object_id              VARCHAR2(10),
  obj_account_class      VARCHAR2(10),
  obj_account_class_desc VARCHAR2(100),
  obj_major              VARCHAR2(10),
  obj_major_desc         VARCHAR2(100),
  obj_detail             VARCHAR2(10),
  obj_detail_desc        VARCHAR2(125),
  object_desc            VARCHAR2(100)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.OBJECT_DIM_DEX1
  add constraint PK_OBJECT_DIM_DEX1 primary key (OBJECT_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table PROGRAM_INTENT_DIM_DEX1
prompt ======================================
prompt
create table FRISCO.PROGRAM_INTENT_DIM_DEX1
(
  loc_county_dist_id  VARCHAR2(6),
  program_intent_key  VARCHAR2(15),
  program_intent_code VARCHAR2(7),
  program_intent_desc VARCHAR2(125)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table SPEC_ED_EMP_FACT_FEX1
prompt ====================================
prompt
create table FRISCO.SPEC_ED_EMP_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(15),
  staff_key          VARCHAR2(16),
  svpr_cd            VARCHAR2(10),
  sped_grd           VARCHAR2(10),
  bldg_code          VARCHAR2(10),
  tecert_cd          VARCHAR2(10),
  sped_aide          VARCHAR2(10),
  prds_cd            VARCHAR2(10),
  sped_icm           VARCHAR2(10),
  per_range          VARCHAR2(10),
  consul_hrs         VARCHAR2(10),
  instruc_hrs        VARCHAR2(10),
  lic_end            VARCHAR2(10)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table SPEC_ED_REFERRAL_FACT_FEX1
prompt =========================================
prompt
create table FRISCO.SPEC_ED_REFERRAL_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(15),
  stu_key            VARCHAR2(16),
  grade_level        VARCHAR2(10),
  ell                VARCHAR2(10),
  res_lea            VARCHAR2(10),
  priv_stud          VARCHAR2(10),
  priv_schname       VARCHAR2(10),
  trans_partc        VARCHAR2(10),
  ref_date           DATE,
  parent_cons        VARCHAR2(25),
  eval_date          DATE,
  sped_plac          VARCHAR2(10),
  early_interv       VARCHAR2(10),
  ref_comp           VARCHAR2(10)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table SPEC_ED_SERVICES_FACT_FEX1
prompt =========================================
prompt
create table FRISCO.SPEC_ED_SERVICES_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(15),
  stu_key            VARCHAR2(16),
  temp_student       VARCHAR2(10),
  resid_lea          VARCHAR2(10),
  headst             VARCHAR2(10),
  charter_sch        VARCHAR2(10),
  private_school     VARCHAR2(10),
  prds_cd            VARCHAR2(10),
  fedpl_cd           VARCHAR2(10),
  pgmtyp             VARCHAR2(10),
  exit_status        VARCHAR2(10),
  exit_date          DATE,
  grade_level        VARCHAR2(10),
  ell                VARCHAR2(10),
  services_segment   VARCHAR2(10),
  entry_date         DATE,
  withd_date         DATE,
  exit_code          VARCHAR2(10),
  type_serv          VARCHAR2(10),
  oth_servs          VARCHAR2(10),
  begin_date         DATE,
  end_date           DATE
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.STAFF_ABSENT_FACT_FEX1
(
  loc_county_dist_id  VARCHAR2(6) not null,
  sta_absence_id      VARCHAR2(40),
  staff_key           VARCHAR2(16),
  abt_key             VARCHAR2(15),
  sta_reason_id       VARCHAR2(8),
  sta_date_id         VARCHAR2(10),
  loc_key             VARCHAR2(15),
  sta_substitute_id   VARCHAR2(10),
  sta_substitute_name VARCHAR2(35),
  sta_substitute_type VARCHAR2(8),
  abr_key             VARCHAR2(15),
  sta_dur_days        NUMBER,
  sta_hrs_leave       NUMBER
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index FRISCO.PK_STAFF_ABSENT_FACT_FEX1 on FRISCO.STAFF_ABSENT_FACT_FEX1 (STA_ABSENCE_ID)
  tablespace DW_DEFAULT03
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
prompt Creating table STAFF_ABSENT_RSN_DIM_DEX1
prompt ========================================
prompt
create table FRISCO.STAFF_ABSENT_RSN_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  abr_key            VARCHAR2(15) not null,
  abr_id             VARCHAR2(40),
  abr_description    VARCHAR2(50),
  abr_grouping       VARCHAR2(40),
  abr_ytd_count      NUMBER,
  abr_total_count    NUMBER
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table FRISCO.STAFF_ABSENT_RSN_DIM_DEX1
  add constraint PK_STAFF_ABSENT_RSN_DIM_DEX1 primary key (ABR_KEY)
  using index 
  tablespace DW_DEFAULT03
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
prompt Creating table STAFF_ABSENT_TYPE_DIM_DEX1
prompt =========================================
prompt
create table FRISCO.STAFF_ABSENT_TYPE_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  abt_key            VARCHAR2(15),
  abt_id             VARCHAR2(40),
  abt_description    VARCHAR2(50),
  abt_grouping       VARCHAR2(40),
  abt_ytd_count      NUMBER,
  abt_total_count    NUMBER
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index FRISCO.PK_ST_ABS_TYPE_DIM_DEX1 on FRISCO.STAFF_ABSENT_TYPE_DIM_DEX1 (ABT_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table STAFF_DIM_DEX1
prompt =============================
prompt
create table FRISCO.STAFF_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  staff_key          VARCHAR2(16),
  staff_id           VARCHAR2(7),
  staff_full_name    VARCHAR2(70),
  staff_last_name    VARCHAR2(35),
  staff_first_name   VARCHAR2(35),
  staff_city         VARCHAR2(35),
  staff_state        VARCHAR2(2),
  staff_zip          VARCHAR2(10),
  staff_edu_lvl      VARCHAR2(10),
  staff_race         VARCHAR2(25),
  staff_ethnicity    VARCHAR2(45),
  staff_gender       VARCHAR2(1),
  staff_type         VARCHAR2(35),
  staff_job_code     VARCHAR2(30),
  staff_job_code_dt  VARCHAR2(10),
  staff_yrs_in_jb_cd VARCHAR2(2),
  staff_yrs_ttl_exp  VARCHAR2(3),
  staff_growth_plan  VARCHAR2(20),
  staff_middle_name  VARCHAR2(35)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.STAFF_QUALIFICATIONS_DIM_DEX1
(
  loc_county_dist_id    VARCHAR2(6),
  qlf_key               VARCHAR2(25),
  qlf_category          VARCHAR2(25),
  qlf_category_desc     VARCHAR2(50),
  qlf_subject_area      VARCHAR2(25),
  qlf_subject_area_desc VARCHAR2(50),
  qlf_type              VARCHAR2(25),
  qlf_type_desc         VARCHAR2(50),
  qlf_sub_type          VARCHAR2(25),
  qlf_sub_type_desc     VARCHAR2(50),
  qlf_id                VARCHAR2(15),
  qlf_description       VARCHAR2(80),
  qlf_contrbutes_to     VARCHAR2(25),
  qlf_credit_type       VARCHAR2(25)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index FRISCO.PK_QLF_KEY on FRISCO.STAFF_QUALIFICATIONS_DIM_DEX1 (QLF_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table STAFF_QUALIFICATIONS_FACT_FEX1
prompt =============================================
prompt
create table FRISCO.STAFF_QUALIFICATIONS_FACT_FEX1
(
  loc_county_dist_id   VARCHAR2(6),
  staff_key            VARCHAR2(16),
  qualification_key    VARCHAR2(25),
  earned_date_id       VARCHAR2(40),
  issue_date_id        VARCHAR2(40),
  expiration_date_id   VARCHAR2(40),
  activity_name        VARCHAR2(200),
  activity_description VARCHAR2(300),
  points_earned        VARCHAR2(40),
  credits_earned       VARCHAR2(40),
  hours_earned         VARCHAR2(40),
  score1               VARCHAR2(40),
  score2               VARCHAR2(40),
  score3               VARCHAR2(40),
  score4               VARCHAR2(40),
  score5               VARCHAR2(40),
  growth_plan          VARCHAR2(40)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
create table FRISCO.STAFF_SCHDL_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  loc_key            VARCHAR2(15),
  course_key         VARCHAR2(30),
  staff_key          VARCHAR2(16),
  schl_year          VARCHAR2(4),
  section_id         VARCHAR2(18),
  term               VARCHAR2(5),
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  max_seats          NUMBER(6),
  occupancy_term_1   VARCHAR2(4),
  occupancy_term_2   VARCHAR2(4),
  building           VARCHAR2(3),
  room               VARCHAR2(15),
  fefp_funding_nbr   VARCHAR2(2),
  scheduling_mthd    VARCHAR2(10),
  from_grd_lvl       VARCHAR2(2),
  to_grd_lvl         VARCHAR2(2),
  instructional_stng VARCHAR2(3),
  record_key         VARCHAR2(51),
  fte_elgblty_flag   CHAR(1),
  occup_cmpltn_pts   NUMBER(3),
  to_date            VARCHAR2(9),
  adlt_spcl_inittivs CHAR(1),
  bell_schdl         VARCHAR2(1),
  calendar_1         VARCHAR2(1),
  calendar_2         VARCHAR2(1),
  calendar_3         VARCHAR2(1),
  calendar_4         VARCHAR2(1),
  cert_flag          VARCHAR2(5),
  class_hours        CHAR(1),
  co_enrl_stu_indctr CHAR(1),
  day_1              CHAR(1),
  day_2              CHAR(1),
  day_3              CHAR(1),
  day_4              CHAR(1),
  day_5              CHAR(1),
  day_6              CHAR(1),
  day_night_indctr   CHAR(1),
  drpout_prev_flag   CHAR(1),
  dual_enrlmt_indctr VARCHAR2(2),
  fee_amt_1          CHAR(1),
  fee_amt_2          CHAR(1),
  fee_amt_3          CHAR(1),
  fee_amt_4          CHAR(1),
  fee_amt_5          CHAR(1),
  fee_amt_6          CHAR(1),
  fee_amt_7          CHAR(1),
  fee_amt_8          CHAR(1),
  fee_amt_9          CHAR(1),
  fee_type_1         VARCHAR2(8),
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
  grd_elgblty_flag   VARCHAR2(1),
  hgly_qlified_tchr  CHAR(1),
  incarceration_flag CHAR(1),
  mnts_per_week      CHAR(1),
  nbr_dys_in_week    CHAR(1),
  program_lngth      CHAR(1),
  section_team       VARCHAR2(3),
  spec_ed_flag       VARCHAR2(1),
  to_hour            VARCHAR2(2),
  to_minute          VARCHAR2(2),
  voc_intent         VARCHAR2(2),
  voc_spcl_inittivs  CHAR(1),
  voc_stng           CHAR(1),
  voc_subprgrm       CHAR(1),
  staff_id           VARCHAR2(20),
  grading_eligiblity VARCHAR2(1),
  grade              VARCHAR2(4000)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index FRISCO.IX_SSFACT_COURSEKEY on FRISCO.STAFF_SCHDL_FACT_FEX1 (COURSE_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table STUDENT_DIM_DEX1
prompt ===============================
prompt
create table FRISCO.STUDENT_DIM_DEX1
(
  loc_county_dist_id   VARCHAR2(6),
  stu_key              VARCHAR2(16),
  stu_id               VARCHAR2(16),
  stu_id_2             VARCHAR2(11),
  stu_full_name        VARCHAR2(75),
  stu_last_name        VARCHAR2(25),
  stu_first_name       VARCHAR2(25),
  stu_middle_name      VARCHAR2(25),
  stu_birth_dt         VARCHAR2(32),
  stu_addr_1           VARCHAR2(40),
  stu_addr_2           VARCHAR2(40),
  stu_city             VARCHAR2(40),
  stu_state            VARCHAR2(3),
  stu_zip              VARCHAR2(10),
  stu_study_area_cd    VARCHAR2(30),
  stu_phone_1          VARCHAR2(30),
  stu_phone_2          VARCHAR2(30),
  stu_phone_3          VARCHAR2(30),
  stu_gender           VARCHAR2(1),
  stu_race             VARCHAR2(2),
  stu_ethnicity        VARCHAR2(40),
  stu_free_rduc_lnch   VARCHAR2(40),
  stu_last_schl        VARCHAR2(51),
  stu_cur_schl         VARCHAR2(51),
  stu_next_schl        VARCHAR2(51),
  stu_last_grd_lvl     VARCHAR2(25),
  stu_cur_grd_lvl      VARCHAR2(25),
  stu_nxt_grd_lvl      VARCHAR2(5),
  stu_last_hmroom      VARCHAR2(6),
  stu_cur_hmroom       VARCHAR2(6),
  stu_next_hmroom      VARCHAR2(6),
  stu_cumulative_gpa   NUMBER(8,5),
  stu_cumulative_gpa_2 NUMBER(8,5),
  stu_cumulative_gpa_3 NUMBER(8,5),
  stu_cumulative_gpa_4 NUMBER(8,5),
  stu_honors_gpa       NUMBER(8,5),
  stu_class_rank       NUMBER(6),
  stu_class_rank_2     NUMBER(6),
  stu_class_rank_3     NUMBER(6),
  stu_class_rank_4     NUMBER(6),
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
  stu_credits_atmptd   NUMBER(4,2),
  stu_credits_ernd     NUMBER(4,2),
  stu_grad_dt          VARCHAR2(32),
  stu_grad_type        VARCHAR2(40),
  stu_flag_504         CHAR(1),
  stu_lep_code         VARCHAR2(2),
  stu_lep_entry_dt     VARCHAR2(32),
  stu_lep_exit_dt      VARCHAR2(32),
  stu_pri_lang         VARCHAR2(30),
  stu_sec_lang         VARCHAR2(30),
  stu_parent_lang      VARCHAR2(30),
  stu_beg_9_grd_yr     VARCHAR2(32),
  stu_aip_participat   VARCHAR2(12),
  stu_birth_cntry      VARCHAR2(40),
  stu_dt_entrd_cntry   VARCHAR2(32),
  stu_sup_acad_imp     VARCHAR2(12),
  stu_last_team        VARCHAR2(4),
  stu_cur_team         VARCHAR2(4),
  stu_next_team        VARCHAR2(4),
  stu_primary_ese_cd   VARCHAR2(2),
  stu_erly_clg_entry   CHAR(1),
  stu_inrly_clg_ntry   VARCHAR2(40),
  stu_single_parent    CHAR(1),
  stu_homeless         VARCHAR2(1),
  stu_proret_lst_yr    VARCHAR2(25),
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
  stu_ale_status       VARCHAR2(2),
  stu_pk_status        VARCHAR2(2),
  stu_live_with_cd     VARCHAR2(10),
  stu_title1_status    VARCHAR2(25),
  stu_506_status       VARCHAR2(25),
  stu_mile_dist        CHAR(1),
  stu_trans_zone       NUMBER,
  stu_parent_ed_lvl    VARCHAR2(25),
  stu_allocated_schl   VARCHAR2(20),
  stu_transfer_reason  VARCHAR2(80),
  schl_yr              VARCHAR2(4),
  stu_inoculations     VARCHAR2(50),
  stu_alloc_district   VARCHAR2(6),
  stu_resid_district   VARCHAR2(6),
  stu_uil              VARCHAR2(25),
  stu_dose_in_series   VARCHAR2(25),
  stu_immunization_dt  VARCHAR2(32),
  stu_dtp              VARCHAR2(30),
  race_ethnicity_key   VARCHAR2(6)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index FRISCO.IX_STU_DIM_STUKEY on FRISCO.STUDENT_DIM_DEX1 (STU_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table STU_DIM_OLD_STURACE
prompt ==================================
prompt
create table FRISCO.STU_DIM_OLD_STURACE
(
  loc_county_dist_id   VARCHAR2(6),
  stu_key              VARCHAR2(16),
  stu_id               VARCHAR2(16),
  stu_id_2             VARCHAR2(11),
  stu_full_name        VARCHAR2(75),
  stu_last_name        VARCHAR2(25),
  stu_first_name       VARCHAR2(25),
  stu_middle_name      VARCHAR2(25),
  stu_birth_dt         VARCHAR2(32),
  stu_addr_1           VARCHAR2(40),
  stu_addr_2           VARCHAR2(40),
  stu_city             VARCHAR2(40),
  stu_state            VARCHAR2(3),
  stu_zip              VARCHAR2(10),
  stu_study_area_cd    VARCHAR2(30),
  stu_phone_1          VARCHAR2(30),
  stu_phone_2          VARCHAR2(30),
  stu_phone_3          VARCHAR2(30),
  stu_gender           VARCHAR2(1),
  stu_race             VARCHAR2(2),
  stu_ethnicity        VARCHAR2(40),
  stu_free_rduc_lnch   VARCHAR2(40),
  stu_last_schl        VARCHAR2(51),
  stu_cur_schl         VARCHAR2(51),
  stu_next_schl        VARCHAR2(51),
  stu_last_grd_lvl     VARCHAR2(25),
  stu_cur_grd_lvl      VARCHAR2(25),
  stu_nxt_grd_lvl      VARCHAR2(5),
  stu_last_hmroom      VARCHAR2(6),
  stu_cur_hmroom       VARCHAR2(6),
  stu_next_hmroom      VARCHAR2(6),
  stu_cumulative_gpa   NUMBER(8,5),
  stu_cumulative_gpa_2 NUMBER(8,5),
  stu_cumulative_gpa_3 NUMBER(8,5),
  stu_cumulative_gpa_4 NUMBER(8,5),
  stu_honors_gpa       NUMBER(8,5),
  stu_class_rank       NUMBER(6),
  stu_class_rank_2     NUMBER(6),
  stu_class_rank_3     NUMBER(6),
  stu_class_rank_4     NUMBER(6),
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
  stu_credits_atmptd   NUMBER(4,2),
  stu_credits_ernd     NUMBER(4,2),
  stu_grad_dt          VARCHAR2(32),
  stu_grad_type        VARCHAR2(40),
  stu_flag_504         CHAR(1),
  stu_lep_code         VARCHAR2(2),
  stu_lep_entry_dt     VARCHAR2(32),
  stu_lep_exit_dt      VARCHAR2(32),
  stu_pri_lang         VARCHAR2(30),
  stu_sec_lang         VARCHAR2(30),
  stu_parent_lang      VARCHAR2(30),
  stu_beg_9_grd_yr     VARCHAR2(32),
  stu_aip_participat   VARCHAR2(12),
  stu_birth_cntry      VARCHAR2(40),
  stu_dt_entrd_cntry   VARCHAR2(32),
  stu_sup_acad_imp     VARCHAR2(12),
  stu_last_team        VARCHAR2(4),
  stu_cur_team         VARCHAR2(4),
  stu_next_team        VARCHAR2(4),
  stu_primary_ese_cd   VARCHAR2(2),
  stu_erly_clg_entry   CHAR(1),
  stu_inrly_clg_ntry   VARCHAR2(40),
  stu_single_parent    CHAR(1),
  stu_homeless         VARCHAR2(1),
  stu_proret_lst_yr    VARCHAR2(25),
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
  stu_ale_status       VARCHAR2(2),
  stu_pk_status        VARCHAR2(2),
  stu_live_with_cd     VARCHAR2(10),
  stu_title1_status    VARCHAR2(25),
  stu_506_status       VARCHAR2(25),
  stu_mile_dist        CHAR(1),
  stu_trans_zone       NUMBER,
  stu_parent_ed_lvl    VARCHAR2(25),
  stu_allocated_schl   VARCHAR2(20),
  stu_transfer_reason  VARCHAR2(80),
  schl_yr              VARCHAR2(4),
  stu_inoculations     VARCHAR2(50),
  stu_alloc_district   VARCHAR2(6),
  stu_resid_district   VARCHAR2(6),
  stu_uil              VARCHAR2(25),
  stu_dose_in_series   VARCHAR2(25),
  stu_immunization_dt  VARCHAR2(32),
  stu_dtp              VARCHAR2(30)
)
tablespace DW_DEFAULT03
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
create index FRISCO.IX_STU_DIM_O_STUKEY on FRISCO.STU_DIM_OLD_STURACE (STU_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table STU_SCHEDULE_FACT_FEX1
prompt =====================================
prompt
create table FRISCO.STU_SCHEDULE_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  record_key         VARCHAR2(51),
  staff_sched_key    VARCHAR2(55),
  school_year        CHAR(4),
  stu_key            VARCHAR2(16),
  loc_key            VARCHAR2(15),
  course_key         VARCHAR2(30),
  section            VARCHAR2(18),
  from_dt            VARCHAR2(21),
  from_time_hour     VARCHAR2(2),
  from_time_min      VARCHAR2(2),
  from_period        VARCHAR2(8),
  to_dt              VARCHAR2(21),
  to_time_hour       VARCHAR2(2),
  to_time_min        VARCHAR2(2),
  to_period          VARCHAR2(8),
  term_code          VARCHAR2(2),
  status             VARCHAR2(16),
  fte_pgm_code       VARCHAR2(1),
  fte_eligibility    VARCHAR2(1),
  occup_comp_pts     VARCHAR2(25),
  sub_program        VARCHAR2(40),
  grading_eligiblity VARCHAR2(1),
  rspbl_rdng_instr   VARCHAR2(1),
  rspbl_writ_instr   VARCHAR2(1),
  rspbl_math_instr   VARCHAR2(1),
  rspbl_sci_instr    VARCHAR2(1)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index FRISCO.IX_STU_STAFF_SCHED_KEY on FRISCO.STU_SCHEDULE_FACT_FEX1 (STAFF_SCHED_KEY)
  tablespace DW_DEFAULT03
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
prompt Creating table TRANSACTION_FACT_FEX1
prompt ====================================
prompt
create table FRISCO.TRANSACTION_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  transaction_id     CHAR(25),
  fund_key           VARCHAR2(15),
  function_key       VARCHAR2(15),
  object_key         VARCHAR2(15),
  date_id            VARCHAR2(20),
  loc_key            VARCHAR2(15),
  transaction_code   VARCHAR2(16),
  amount             FLOAT,
  batch              VARCHAR2(8),
  program_intent_key VARCHAR2(15),
  fiscal_year        VARCHAR2(4),
  fiscal_period      VARCHAR2(4),
  local_option_code  VARCHAR2(3)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index FRISCO.BIX_TRANSACTION_FACT_FEX1_CDC on FRISCO.TRANSACTION_FACT_FEX1 (LOC_COUNTY_DIST_ID)
  tablespace DW_DEFAULT03
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
prompt Creating table TRANS_EQUIP_DIM_DEX1
prompt ===================================
prompt
create table FRISCO.TRANS_EQUIP_DIM_DEX1
(
  loc_county_dist_id VARCHAR2(6),
  bus_key            VARCHAR2(25),
  bus_id             VARCHAR2(15),
  permit_num         VARCHAR2(25),
  state_inspect      VARCHAR2(25),
  sum_inspect        VARCHAR2(25),
  sticker_num        VARCHAR2(25),
  vin_num            VARCHAR2(50),
  chassis_make       VARCHAR2(25),
  chassis_year       VARCHAR2(25),
  body_make          VARCHAR2(25),
  body_year          VARCHAR2(25),
  primary_use        VARCHAR2(25),
  capacity           VARCHAR2(25),
  fuel_type          VARCHAR2(25),
  prim_handicap      VARCHAR2(25),
  wheelchair_lift    VARCHAR2(25),
  purch_method       VARCHAR2(25),
  purch_amt          VARCHAR2(25),
  purch_date         DATE
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table TRANS_PER_FACT_FEX1
prompt ==================================
prompt
create table FRISCO.TRANS_PER_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(128),
  loc_key            VARCHAR2(15),
  staff_key          VARCHAR2(16),
  cdl_num            VARCHAR2(40),
  physical_date      VARCHAR2(32),
  driv_rec           VARCHAR2(40),
  crim_back          VARCHAR2(40),
  drug_test          VARCHAR2(40),
  inserv_train       VARCHAR2(40)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table TRANS_ROUTE_FACT_FEX1
prompt ====================================
prompt
create table FRISCO.TRANS_ROUTE_FACT_FEX1
(
  loc_county_dist_id VARCHAR2(6),
  date_id            VARCHAR2(32),
  bus_key            VARCHAR2(25),
  trans_type_id      VARCHAR2(60),
  stu_key            VARCHAR2(16),
  staff_key          VARCHAR2(16),
  loc_key            VARCHAR2(15)
)
tablespace DW_DEFAULT03
  pctfree 10
  initrans 1
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
prompt Creating table tstme
prompt ====================
prompt
create table FRISCO.tstme
(
  "abc" VARCHAR2(25)
)
tablespace DW_DEFAULT03
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
