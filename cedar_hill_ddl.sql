-----------------------------------------------------------
-- Export file for user CEDARHILL@DATAWH                 --
-- Created by espositot on 5/26/2016, 15:15:39 15:15:39  --
-----------------------------------------------------------

set define off
spool cedar_hill_ddl.log

prompt
prompt Creating table ADDRESS
prompt ======================
prompt
create table CEDARHILL.ADDRESS
(
  address_id NUMBER(11),
  zip_code   VARCHAR2(12)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ATND_ABSENCE_TYPE
prompt ================================
prompt
create table CEDARHILL.ATND_ABSENCE_TYPE
(
  entity_id             VARCHAR2(5),
  school_year           VARCHAR2(10),
  aat_id                VARCHAR2(1),
  aat_sdesc             VARCHAR2(15),
  aat_ldesc             VARCHAR2(30),
  aat_exc_unexc_tar_oth VARCHAR2(1),
  aat_abs_exp_isus_osus VARCHAR2(1),
  aat_cnt_in_truancy    VARCHAR2(10),
  aat_incl_in_cls_atnd  VARCHAR2(10),
  aat_incl_in_tot_atnd  VARCHAR2(10),
  live                  VARCHAR2(10),
  aat_count_in_funding  VARCHAR2(10),
  aat_funding_type      VARCHAR2(1),
  sif_atnd_type_ref_id  VARCHAR2(32),
  color_code            VARCHAR2(30),
  state_code            VARCHAR2(1),
  aat_grading_points    VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table BUILDING
prompt =======================
prompt
create table CEDARHILL.BUILDING
(
  building_id     VARCHAR2(5),
  school_id       VARCHAR2(5),
  building_sdesc  VARCHAR2(15),
  building_ldesc  VARCHAR2(30),
  combination_set VARCHAR2(10),
  address_id      VARCHAR2(10),
  live            VARCHAR2(10),
  parcel_nbr      VARCHAR2(10),
  fish_nbr        VARCHAR2(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table CALENDAR_DAY
prompt ===========================
prompt
create table CEDARHILL.CALENDAR_DAY
(
  entity_id          VARCHAR2(5),
  track              VARCHAR2(25),
  calendar_id        VARCHAR2(5),
  cal_date           VARCHAR2(14),
  cal_prds_in_day    VARCHAR2(2),
  cal_days           VARCHAR2(5),
  cal_day_nbr        VARCHAR2(5),
  cal_alt_fri        VARCHAR2(1),
  cal_min_each_prd   VARCHAR2(160),
  cal_comment        VARCHAR2(40),
  cal_day_prds_meet  VARCHAR2(320),
  live               VARCHAR2(2),
  day_time_id        VARCHAR2(1),
  cal_non_instr_days VARCHAR2(5),
  cal_zero_meet      VARCHAR2(1),
  cal_zero_min       VARCHAR2(3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table CALENDAR_MASTER
prompt ==============================
prompt
create table CEDARHILL.CALENDAR_MASTER
(
  school_year                NUMBER(9),
  entity_id                  VARCHAR2(10),
  track                      NUMBER(9),
  calendar_id                VARCHAR2(10),
  cal_str_dte                DATE,
  cal_stp_dte                DATE,
  cal_def_prds_per_day_max   NUMBER(9),
  cal_def_atnd_prds_meet     VARCHAR2(160),
  cal_def_schd_prds_meet     VARCHAR2(160),
  cal_def_day_length_mins    NUMBER(9),
  cal_def_hrs_in_yr          NUMBER(9),
  cal_formula_or_cal_method  VARCHAR2(2),
  cal_formula_nbr_of_prds    NUMBER(9),
  cal_use_zero_mod           VARCHAR2(2),
  cal_incl_zero_mod_in_cnts  VARCHAR2(2),
  live                       VARCHAR2(1),
  cal_def_nbr_non_instr_day  NUMBER(17,2),
  cal_serves_meal            VARCHAR2(1),
  cal_funding_prds           VARCHAR2(60),
  cal_avg_instr_per_week_hr  NUMBER(9),
  cal_avg_instr_per_week_min NUMBER(9),
  cal_core_days              NUMBER(17,2),
  tn_teacher_day_stop        NUMBER(9),
  tn_teacher_day_start       NUMBER(9),
  tn_instructional_program   NUMBER(9),
  tn_scheduled_days          NUMBER(9),
  tn_instructional_cal       VARCHAR2(2),
  tn_cal_number              NUMBER(9),
  calendar_type              VARCHAR2(2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index CEDARHILL.BMI_ENTITY_ID_CM on CEDARHILL.CALENDAR_MASTER (ENTITY_ID)
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
create index CEDARHILL.BMI_SCHOOL_YEAR on CEDARHILL.CALENDAR_MASTER (SCHOOL_YEAR)
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
prompt Creating table CLASS
prompt ====================
prompt
create table CEDARHILL.CLASS
(
  cor_num_id               VARCHAR2(75),
  track                    VARCHAR2(75),
  clas_section             VARCHAR2(5),
  entity_id                VARCHAR2(5),
  team_schd_id             VARCHAR2(3),
  clas_status              VARCHAR2(1),
  clas_nbr_stds_opt        VARCHAR2(75),
  clas_nbr_stds_max        VARCHAR2(75),
  clas_nbr_stds_min        VARCHAR2(75),
  clas_nbr_stds_enr_obs    VARCHAR2(75),
  clas_anytime             VARCHAR2(75),
  clas_alt_fri_flag        VARCHAR2(1),
  clas_grd_mid_when_obs    VARCHAR2(75),
  clas_wrk_female_cnts_obs VARCHAR2(75),
  clas_wrk_male_cnts_obs   VARCHAR2(75),
  clas_mst_bld_flag        VARCHAR2(75),
  clas_mst_bld_days        VARCHAR2(75),
  clas_mst_bld_dsp_days    VARCHAR2(75),
  clas_grd_reg_when_obs    VARCHAR2(75),
  clas_use_var_tch_rm      VARCHAR2(75),
  control_set_id           VARCHAR2(2),
  clas_mode_teaching       VARCHAR2(1),
  clas_coreq_id            VARCHAR2(75),
  clas_coreq_section       VARCHAR2(3),
  calendar_id              VARCHAR2(5),
  atnd_method              VARCHAR2(1),
  grd_method               VARCHAR2(1),
  use_asgn_seats           VARCHAR2(75),
  atnd_nbr_rows            VARCHAR2(75),
  atnd_nbr_cols            VARCHAR2(75),
  clas_nbr_stds_enr        VARCHAR2(75),
  clas_wrk_female_cnts     VARCHAR2(75),
  clas_wrk_male_cnts       VARCHAR2(75),
  clas_grd_reg_when        VARCHAR2(75),
  clas_grd_mid_when        VARCHAR2(75),
  use_meeting_times        VARCHAR2(75),
  clas_wgt_schd_add_on     VARCHAR2(100),
  distance_learning_ind    VARCHAR2(75),
  population_served        VARCHAR2(75),
  instructional_setting    VARCHAR2(75),
  cor_seq_code             VARCHAR2(75),
  cor_seq_code2            VARCHAR2(75),
  allow_cece               VARCHAR2(75),
  x_bilingual              VARCHAR2(75),
  sif_class_ref_id         VARCHAR2(32),
  ss_class                 VARCHAR2(75),
  bld_room_type_id         VARCHAR2(75),
  mb_clas_locked           VARCHAR2(75),
  mb_control_set_schd      VARCHAR2(75),
  mb_control_set_locked    VARCHAR2(75),
  clas_nbr_days            VARCHAR2(75),
  clas_nbr_periods         VARCHAR2(75),
  clas_nbr_teachers        VARCHAR2(75),
  x_consecutive_prds       VARCHAR2(75),
  cm_time_type             VARCHAR2(1),
  schd_categories          VARCHAR2(75),
  class_gpa_set_id_1       VARCHAR2(75),
  class_gpa_set_id_2       VARCHAR2(75),
  class_gpa_set_id_3       VARCHAR2(75),
  class_gpa_set_id_4       VARCHAR2(75),
  class_gpa_set_id_5       VARCHAR2(75),
  class_gpa_set_id_6       VARCHAR2(75),
  class_gpa_set_id_7       VARCHAR2(75),
  class_gpa_set_id_8       VARCHAR2(75),
  class_gpa_set_id_9       VARCHAR2(75),
  class_gpa_crdts_1        NUMBER(5,3),
  class_gpa_crdts_2        NUMBER(5,3),
  class_gpa_crdts_3        NUMBER(5,3),
  class_gpa_crdts_4        NUMBER(5,3),
  class_gpa_crdts_5        NUMBER(5,3),
  class_gpa_crdts_6        NUMBER(5,3),
  class_gpa_crdts_7        NUMBER(5,3),
  class_gpa_crdts_8        NUMBER(5,3),
  class_gpa_crdts_9        NUMBER(5,3),
  clas_nbr_est_stds        VARCHAR2(75),
  cm_building_id           VARCHAR2(5),
  cte_flag                 VARCHAR2(75),
  spec_ed_limit            NUMBER(5,2),
  clas_minutes_per_week    VARCHAR2(75),
  tn_service_district      VARCHAR2(75),
  tn_service_school        VARCHAR2(75),
  tn_class_type            VARCHAR2(1),
  title_iii                VARCHAR2(1),
  aide_percentage          VARCHAR2(75),
  cor_alphakey             VARCHAR2(75),
  tn_fed_funded            VARCHAR2(75),
  sr_char                  VARCHAR2(700)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table CLASS_MEET
prompt =========================
prompt
create table CEDARHILL.CLASS_MEET
(
  cor_num_id            NUMBER,
  track                 NUMBER,
  clas_section          VARCHAR2(10),
  dsp_str_trm           NUMBER,
  dsp_stp_trm           NUMBER,
  dsp_period            NUMBER,
  clas_lun_code         VARCHAR2(2),
  dsp_day_nbr           NUMBER,
  sch_str_trm           NUMBER,
  sch_stp_trm           NUMBER,
  sch_period            NUMBER,
  sch_day_nbr           NUMBER,
  atn_period            NUMBER,
  name_id               NUMBER,
  building_id           VARCHAR2(10),
  room_number           VARCHAR2(10),
  tchr_prime_flag       VARCHAR2(2),
  dsp_days_meet         VARCHAR2(20),
  sch_days_meet         VARCHAR2(20),
  atn_day_nbr           NUMBER,
  atn_days_meet         VARCHAR2(20),
  entity_id             VARCHAR2(10),
  school_year           NUMBER,
  cor_alphakey          VARCHAR2(20),
  clas_str_time         NUMBER,
  clas_stp_time         NUMBER,
  time_type             VARCHAR2(2),
  cece_type             VARCHAR2(16),
  cece_cor_num_id       NUMBER,
  x_print_meet          VARCHAR2(1),
  mb_days_schd          VARCHAR2(1),
  mb_period_schd        VARCHAR2(1),
  mb_room_schd          VARCHAR2(1),
  mb_teacher_schd       VARCHAR2(1),
  mb_days_locked        VARCHAR2(1),
  mb_period_locked      VARCHAR2(1),
  mb_room_locked        VARCHAR2(1),
  mb_teacher_locked     VARCHAR2(1),
  x_access_gradebook    VARCHAR2(1),
  x_access_ea_plus      VARCHAR2(1),
  st_rpt_code_2         VARCHAR2(8),
  st_rpt_code_1         VARCHAR2(2),
  team_teacher_training VARCHAR2(2),
  highly_qualified      VARCHAR2(2),
  cert_status           VARCHAR2(2),
  fl_period_nbr         VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table CLAS_CONTROL_SET
prompt ===============================
prompt
create table CEDARHILL.CLAS_CONTROL_SET
(
  entity_id            VARCHAR2(5),
  school_year          VARCHAR2(10),
  cor_length_set_id    VARCHAR2(3),
  control_set_id       VARCHAR2(2),
  ccs_atnd_str_dte     VARCHAR2(14),
  ccs_atnd_stp_dte     VARCHAR2(14),
  ccs_dsp_trm_lit      VARCHAR2(3),
  ccs_dsp_nbr_trms     VARCHAR2(10),
  ccs_dsp_str_trm      VARCHAR2(10),
  ccs_dsp_stp_trm      VARCHAR2(10),
  ccs_sch_nbr_trms     VARCHAR2(10),
  ccs_sch_str_trm      VARCHAR2(10),
  ccs_sch_stp_trm      VARCHAR2(10),
  ccs_desc             VARCHAR2(15),
  control_set_ref      VARCHAR2(10),
  live                 VARCHAR2(10),
  track                VARCHAR2(10),
  ccs_sem_use_trms_obs VARCHAR2(10),
  ccs_sem_use_trms     VARCHAR2(20),
  ccs_let_std_take     VARCHAR2(10),
  sif_ccs_ref_id       VARCHAR2(32),
  fl_term_xref         VARCHAR2(2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table COURSE
prompt =====================
prompt
create table CEDARHILL.COURSE
(
  cor_num_id                 VARCHAR2(10),
  area_comment_id            VARCHAR2(10),
  course_type_id             VARCHAR2(3),
  department_id              VARCHAR2(3),
  lock_group_id              VARCHAR2(5),
  schd_grd_id                VARCHAR2(10),
  subject_id                 VARCHAR2(3),
  instr_area_id              VARCHAR2(7),
  report_card_grp_id         VARCHAR2(5),
  entity_id                  VARCHAR2(5),
  school_year                VARCHAR2(10),
  cor_alphakey               VARCHAR2(10),
  cor_schd_priority          VARCHAR2(10),
  cor_grd_rng_low            VARCHAR2(10),
  cor_length_set_id          VARCHAR2(3),
  cor_status                 VARCHAR2(10),
  cor_sdesc                  VARCHAR2(15),
  cor_ldesc                  VARCHAR2(30),
  cor_tracks                 VARCHAR2(9),
  cor_has_grades             VARCHAR2(10),
  cor_has_attendance         VARCHAR2(10),
  cor_reg_lun_stdy_tran      VARCHAR2(10),
  cor_nbr_chairs_max         VARCHAR2(10),
  cor_nbr_requests           VARCHAR2(10),
  cor_fee                    NUMBER(7,2),
  cor_anytime                VARCHAR2(10),
  cor_tmp_has_skd            VARCHAR2(10),
  cor_academic_hours         NUMBER(5,3),
  cor_req_elec               VARCHAR2(10),
  cor_grd_rng_high           VARCHAR2(10),
  cor_schd_type              VARCHAR2(10),
  cor_ctrl_sets_poss         VARCHAR2(200),
  cor_est_nbr_sections       VARCHAR2(10),
  cor_team_schd_priority     VARCHAR2(10),
  gpa_set_id                 VARCHAR2(10),
  mn_cor_assign_code         VARCHAR2(10),
  mag_hs_code_id             VARCHAR2(5),
  cor_credits_good           NUMBER(5,3),
  cor_credits_gpa            NUMBER(5,3),
  cor_credits_gpa_2          NUMBER(5,3),
  mn_cor_lang_level          VARCHAR2(10),
  live                       VARCHAR2(10),
  cor_leveling_type          VARCHAR2(10),
  mn_cor_grd_level           VARCHAR2(10),
  mn_cor_prd_length          VARCHAR2(10),
  gpa_set_id_2               VARCHAR2(10),
  prev_cor_num_id            VARCHAR2(10),
  gpa_set_id_3               VARCHAR2(10),
  gpa_set_id_4               VARCHAR2(10),
  gpa_set_id_5               VARCHAR2(10),
  gpa_set_id_6               VARCHAR2(10),
  gpa_set_id_7               VARCHAR2(10),
  gpa_set_id_8               VARCHAR2(10),
  gpa_set_id_9               VARCHAR2(10),
  cor_credits_gpa_3          NUMBER(5,3),
  cor_credits_gpa_4          NUMBER(5,3),
  cor_credits_gpa_5          NUMBER(5,3),
  cor_credits_gpa_6          NUMBER(5,3),
  cor_credits_gpa_7          NUMBER(5,3),
  cor_credits_gpa_8          NUMBER(5,3),
  cor_credits_gpa_9          NUMBER(5,3),
  cor_cat_num_id             VARCHAR2(10),
  wa_dual_credit_code        VARCHAR2(10),
  wa_articulated_tech_prep   VARCHAR2(10),
  wa_direct_transcription_av VARCHAR2(10),
  cip_code                   VARCHAR2(10),
  cte_prg_code               VARCHAR2(10),
  service_id                 VARCHAR2(10),
  trans_area                 VARCHAR2(10),
  voc_ed_contact_hrs         VARCHAR2(10),
  unit_desc                  VARCHAR2(10),
  honor_roll                 VARCHAR2(10),
  wi_pi_1215_subj_topic      VARCHAR2(6),
  cece_type                  VARCHAR2(10),
  cece_cor_num_id            VARCHAR2(10),
  trn_grd_lvl_ovr            VARCHAR2(2),
  cor_repeatable             VARCHAR2(10),
  sif_cor_ref_id             VARCHAR2(32),
  cor_avail_to_oas           VARCHAR2(10),
  clas_bld_room_type_id      VARCHAR2(10),
  cor_act_nbr_sections       VARCHAR2(10),
  cor_max_nbr_requests       VARCHAR2(10),
  clas_calendar_id           VARCHAR2(5),
  clas_nbr_days              VARCHAR2(10),
  clas_nbr_periods           VARCHAR2(10),
  clas_nbr_teachers          VARCHAR2(10),
  clas_nbr_stds_min          VARCHAR2(10),
  clas_nbr_stds_opt          VARCHAR2(10),
  clas_nbr_stds_max          VARCHAR2(10),
  clas_use_meeting_times     VARCHAR2(10),
  mb_allow_mult_same_prd     VARCHAR2(10),
  mb_max_same_prd            NUMBER(5,2),
  mb_cor_rank                VARCHAR2(10),
  mb_manual_cor_rank         VARCHAR2(10),
  certification_req          VARCHAR2(10),
  wa_college_hs              VARCHAR2(10),
  wa_hecb_core_course        VARCHAR2(10),
  wa_internatl_baccal        VARCHAR2(10),
  wa_running_start           VARCHAR2(10),
  wa_tech_prep               VARCHAR2(10),
  clas_x_consecutive_prds    VARCHAR2(10),
  wi_prog_area_part          VARCHAR2(10),
  cor_core                   VARCHAR2(10),
  clas_time_type             VARCHAR2(10),
  x_allow_gpa_set_override   VARCHAR2(10),
  mn_cor_code_cpe            VARCHAR2(10),
  mn_incl_cor_in_stars       VARCHAR2(10),
  x_use_tran_glo_in_gpa      VARCHAR2(10),
  wa_adv_placement_code      VARCHAR2(6),
  x_use_tran_glo_in_earn_crd VARCHAR2(10),
  cor_grade_system           VARCHAR2(10),
  cor_grade_type             VARCHAR2(10),
  wa_honors_option           VARCHAR2(10),
  wa_recurring               VARCHAR2(10),
  egb_academic_id            VARCHAR2(30),
  egb_academic_dflt_entity   VARCHAR2(30),
  excl_from_rank             VARCHAR2(10),
  cor_nbr_alt_reqs           VARCHAR2(10),
  mi_cor_assign_code         VARCHAR2(10),
  activity_id                VARCHAR2(3),
  ut_where_taught            VARCHAR2(2),
  ut_duel_crdt_cor           VARCHAR2(10),
  ut_college_code            VARCHAR2(10),
  ut_college_crdt            NUMBER(7,2),
  wa_int_bac                 VARCHAR2(6),
  cor_academic_minutes       VARCHAR2(10),
  reading_intervention       VARCHAR2(10),
  dual_enroll_ind            VARCHAR2(10),
  schedule_method            VARCHAR2(10),
  special_program            VARCHAR2(10),
  sr_char                    VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table COURSE_EXT
prompt =========================
prompt
create table CEDARHILL.COURSE_EXT
(
  entity_id            VARCHAR2(5) not null,
  school_year          NUMBER not null,
  cor_alphakey         VARCHAR2(10) not null,
  service_id           VARCHAR2(10),
  trans_area           VARCHAR2(10),
  voc_ed_contact_hrs   NUMBER,
  cor_num_id           NUMBER not null,
  unit_desc            VARCHAR2(50),
  honor_roll           NUMBER,
  multiple_trans_areas NUMBER,
  pe_waiver_semesters  NUMBER,
  tx_aar_sem_bucket    NUMBER,
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
create bitmap index CEDARHILL.BXI_COURSE_EXT_COR_NUM_ID on CEDARHILL.COURSE_EXT (COR_NUM_ID)
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
prompt Creating table DISTRICT
prompt =======================
prompt
create table CEDARHILL.DISTRICT
(
  district_code    VARCHAR2(14) not null,
  district_name    VARCHAR2(80),
  district_state   VARCHAR2(4),
  district_type_id VARCHAR2(6),
  live             VARCHAR2(1),
  sys_wi_lea_id    VARCHAR2(8),
  address_id       VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table DIS_ACTION
prompt =========================
prompt
create table CEDARHILL.DIS_ACTION
(
  dis_action_id           VARCHAR2(3),
  dis_action_sdesc        VARCHAR2(15),
  dis_action_ldesc        VARCHAR2(30),
  dis_action_flag         VARCHAR2(1),
  dis_action_time         NUMBER(7,2),
  dis_action_susp_type    VARCHAR2(1),
  dis_action_points       NUMBER(7,2),
  dis_action_severity     VARCHAR2(10),
  dis_action_unused_char1 VARCHAR2(30),
  dis_action_unused_char2 VARCHAR2(30),
  use_in_referrals        VARCHAR2(10),
  state_act_code          VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table DIS_ACTION_DIFF_REASON
prompt =====================================
prompt
create table CEDARHILL.DIS_ACTION_DIFF_REASON
(
  diff_reason_id    VARCHAR2(2),
  diff_reason_sdesc VARCHAR2(15),
  diff_reason_ldesc VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table DIS_OFFENSE
prompt ==========================
prompt
create table CEDARHILL.DIS_OFFENSE
(
  dis_offense_id       VARCHAR2(3),
  dis_offense_sdesc    VARCHAR2(15),
  dis_offense_ldesc    VARCHAR2(30),
  dis_offense_points   NUMBER(7,2),
  live                 VARCHAR2(10),
  dis_offense_severity VARCHAR2(10),
  dis_action_id        VARCHAR2(3),
  dis_drug_related     VARCHAR2(10),
  dis_weapon_related   VARCHAR2(10),
  dis_injury_related   VARCHAR2(10),
  off_unused_char_1    VARCHAR2(30),
  off_unused_char_2    VARCHAR2(30),
  off_unused_date_1    VARCHAR2(14),
  off_unused_date_2    VARCHAR2(14),
  off_unused_dec_1     NUMBER(7,2),
  off_unused_dec_2     NUMBER(7,2),
  off_unused_int_1     VARCHAR2(10),
  off_unused_int_2     VARCHAR2(10),
  off_unused_log_1     VARCHAR2(10),
  off_unused_log_2     VARCHAR2(10),
  sys_mi_off_type      VARCHAR2(2),
  dis_felony_misdem    VARCHAR2(1),
  dis_exp_reason       VARCHAR2(2),
  use_in_referrals     VARCHAR2(10),
  dis_alcohol_related  VARCHAR2(10),
  dis_hate_related     VARCHAR2(10),
  dis_gang_related     VARCHAR2(10),
  state_off_code       VARCHAR2(10),
  bullying_related     VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ENTITY
prompt =====================
prompt
create table CEDARHILL.ENTITY
(
  entity_id                      VARCHAR2(10),
  entity_name                    VARCHAR2(60),
  school_year                    VARCHAR2(10),
  entity_type_id                 VARCHAR2(6),
  use_sub_school_flag            VARCHAR2(1),
  live                           VARCHAR2(1),
  allow_add_of_active            VARCHAR2(1),
  use_std_dst_cum                VARCHAR2(1),
  unused_char_2                  VARCHAR2(6),
  unused_char_1                  VARCHAR2(6),
  entity_type                    VARCHAR2(2),
  edline_link                    VARCHAR2(200),
  hm_fld_lbl_2c                  VARCHAR2(4),
  hm_fld_lbl_4c                  VARCHAR2(8),
  hm_fld_lbl_8c                  VARCHAR2(16),
  dis_action_email_x             VARCHAR2(1),
  dis_act_det_email_x            VARCHAR2(1),
  softcode_homeroom_label        VARCHAR2(1),
  dis_prompt_email               VARCHAR2(1),
  peims_reportable               VARCHAR2(1),
  peims_campus_type              VARCHAR2(16),
  gr_credits_to_units_factor     NUMBER,
  sif_entity_ref_id              VARCHAR2(64),
  cluster_code                   VARCHAR2(6),
  state_aware_application_server VARCHAR2(16),
  x_use_auto_gpa_audit           VARCHAR2(1),
  audit_user_or_system_wide      VARCHAR2(16),
  audit_defaults                 VARCHAR2(54),
  x_use_crs_ent_gpa_calc         VARCHAR2(1),
  crs_ent_gpa_calc_entities      VARCHAR2(16),
  wa_summer_school               VARCHAR2(1),
  wa_csrs_reporting              VARCHAR2(1),
  grad_period_to_use             NUMBER,
  x_override_def_grd_prd         VARCHAR2(1),
  entity_short_name              VARCHAR2(16),
  entity_status                  VARCHAR2(2)
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
prompt Creating table ENTITY_YEAR
prompt ==========================
prompt
create table CEDARHILL.ENTITY_YEAR
(
  entity_id    VARCHAR2(5),
  school_year  VARCHAR2(10),
  max_sch_prds VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ERP_QGT97_GENERIC_TABLE
prompt ======================================
prompt
create table CEDARHILL.ERP_QGT97_GENERIC_TABLE
(
  qgt97_unique_code VARCHAR2(16),
  qgt97_date        VARCHAR2(440),
  qgt97_logical     VARCHAR2(160),
  qgt97_dec         VARCHAR2(440),
  qgt97_int         VARCHAR2(440),
  qgt97_chr         VARCHAR2(540),
  qgt97_sort2_3     VARCHAR2(16),
  qgt97_sort2_2     VARCHAR2(16),
  qgt97_sort2_1     VARCHAR2(16),
  qgt97_sort3       VARCHAR2(16),
  qgt97_sort2       VARCHAR2(16),
  qgt97_sort1       VARCHAR2(16),
  qgt97_src_code    VARCHAR2(16),
  qgt97_src_id      NUMBER,
  qgt97_table_name  VARCHAR2(28),
  qgt97_record_id   NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_ERP_QGT97_SRC_ID on CEDARHILL.ERP_QGT97_GENERIC_TABLE (QGT97_SRC_ID)
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
create bitmap index CEDARHILL.BMI_ERP_QGT97_TABLE_NAME on CEDARHILL.ERP_QGT97_GENERIC_TABLE (QGT97_TABLE_NAME)
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
prompt Creating table ERP_SYS_CTD
prompt ==========================
prompt
create table CEDARHILL.ERP_SYS_CTD
(
  date_1     VARCHAR2(8),
  dec_1      NUMBER,
  int_2      NUMBER,
  int_1      NUMBER,
  log_2      VARCHAR2(1),
  log_1      VARCHAR2(1),
  char_2     VARCHAR2(4000),
  char_1     VARCHAR2(4000),
  end_year   NUMBER,
  start_year NUMBER,
  time_added NUMBER,
  date_added VARCHAR2(8),
  code_sdesc VARCHAR2(4000),
  code_ldesc VARCHAR2(4000),
  code_id    VARCHAR2(50),
  table_id   VARCHAR2(50),
  x_default  VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_ERP_SYS_CTD_CODE_ID on CEDARHILL.ERP_SYS_CTD (CODE_ID)
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
create bitmap index CEDARHILL.BMI_ERP_SYS_CTD_TABLE_ID on CEDARHILL.ERP_SYS_CTD (TABLE_ID)
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
prompt Creating table ERP_SYS_CTM
prompt ==========================
prompt
create table CEDARHILL.ERP_SYS_CTM
(
  unused_char_1    VARCHAR2(16),
  time_added       NUMBER,
  date_added       VARCHAR2(8),
  tbl_sdesc        VARCHAR2(100),
  tbl_ldesc        VARCHAR2(500),
  table_id         VARCHAR2(100),
  x_allow_maintain VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_ERP_SYS_CTM_TABLE_ID on CEDARHILL.ERP_SYS_CTM (TABLE_ID)
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
prompt Creating table FAMILY
prompt =====================
prompt
create table CEDARHILL.FAMILY
(
  family_id                  VARCHAR2(10),
  salutation_id              VARCHAR2(3),
  language_code              VARCHAR2(3),
  salutation_label           VARCHAR2(60),
  salutation_override        VARCHAR2(10),
  family_transportation_code VARCHAR2(11),
  x_use_hard_copy_rpt_crd    VARCHAR2(10),
  x_use_hard_copy_trans      VARCHAR2(10),
  family_common              VARCHAR2(10),
  x_use_lang_code            VARCHAR2(10),
  cy_track                   VARCHAR2(1),
  cy_track_req               VARCHAR2(10),
  ny_track                   VARCHAR2(1),
  ny_track_req               VARCHAR2(10),
  lang_survey_date           VARCHAR2(14)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table FFAMAD_ACCT_DESCS
prompt ================================
prompt
create table CEDARHILL.FFAMAD_ACCT_DESCS
(
  ffasdc_ind    VARCHAR2(8),
  ffamad_code   VARCHAR2(16),
  ffamad_fund   VARCHAR2(20),
  ffamad_desc   VARCHAR2(60),
  ffamad_sdesc  VARCHAR2(40),
  ffamad_prim   VARCHAR2(20),
  ffamad_xwalk  VARCHAR2(20),
  wa_ct_fund    NUMBER(11),
  wa_ct_dist_id VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table FFAMAM_ACCT_MST
prompt ==============================
prompt
create table CEDARHILL.FFAMAM_ACCT_MST
(
  ffamam_acct_id      NUMBER(11),
  ffamam_edited_acct  VARCHAR2(80),
  ffamg1_code         VARCHAR2(8),
  ffamam_acct_dim     VARCHAR2(240),
  ffamam_active_flag  CHAR(1),
  ffamsa_code         VARCHAR2(16),
  ffamam_sum_enc_code VARCHAR2(16),
  ffamg2_code         VARCHAR2(8),
  ffamg3_code         VARCHAR2(8),
  ffamgc_code         VARCHAR2(16),
  ffamam_acct_string  VARCHAR2(80),
  ffamam_deleted      CHAR(1),
  ffamam_on_ann_bud   VARCHAR2(2),
  ffamam_date_created VARCHAR2(10),
  ffamam_quick_key    VARCHAR2(24),
  ffamam_line         VARCHAR2(30),
  ffamam_misc_char    VARCHAR2(40)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.bmx_fafmam_acct_id_acct_mst on CEDARHILL.FFAMAM_ACCT_MST (FFAMAM_ACCT_ID)
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

prompt
prompt Creating table FFAMDH_HISTORY
prompt =============================
prompt
create table CEDARHILL.FFAMDH_HISTORY
(
  ffamdh_id                NUMBER(11),
  ffamdh_ref1              VARCHAR2(90),
  ffamdh_ref2              VARCHAR2(90),
  ffamam_acct_id           NUMBER(11),
  ffamdh_amount            NUMBER,
  name_id                  NUMBER(11),
  ffambt_code              VARCHAR2(16),
  ffamdh_desc1             VARCHAR2(4000),
  ffamdh_desc2             VARCHAR2(4000),
  ffamgd_line_nbr          NUMBER(11),
  ffamdh_source            VARCHAR2(12),
  ffamdh_batch             VARCHAR2(16),
  ffamdh_upd_date          VARCHAR2(10),
  ffamdh_amt_credit        NUMBER,
  ffamdh_amt_debit         NUMBER,
  ffamdh_sub_source        VARCHAR2(12),
  ffamdh_upd_time          NUMBER(11),
  ffamud_id                NUMBER(11),
  ffamdh_tran_date         VARCHAR2(10),
  ffamdh_create_date       VARCHAR2(10),
  ffamdh_create_time       NUMBER(11),
  ffamdh_create_by         NUMBER(11),
  ffamdh_cash_ffapbr_id    NUMBER(11),
  ffamdh_stmt_ffapbr_id    NUMBER(11),
  ffamdh_equity_id         NUMBER(11),
  ffamdh_cash_id           NUMBER(11),
  ffamdh_accrual_id        NUMBER(11),
  ffamdh_accr_rev_id       NUMBER(11),
  ffamdh_po_enc_reserve_id NUMBER(11),
  ffamdh_po_enc_offset_id  NUMBER(11),
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
create unique index CEDARHILL.XAK1_FFAMDH_DATE on CEDARHILL.FFAMDH_HISTORY (FFAMAM_ACCT_ID, FFAMDH_UPD_DATE, FFAMDH_UPD_TIME, FFAMDH_ID)
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
create unique index CEDARHILL.XPK_FFAMDH on CEDARHILL.FFAMDH_HISTORY (FFAMDH_ID)
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
prompt Creating table FFAMFA_FIS_YTD
prompt =============================
prompt
create table CEDARHILL.FFAMFA_FIS_YTD
(
  ffamfa_fis_year       VARCHAR2(4),
  ffamam_acct_id        VARCHAR2(10),
  ffamfa_amt_credit     NUMBER(12,3),
  ffamfa_beg_balance    NUMBER(12,3),
  ffamfa_amt_debit      NUMBER(12,3),
  ffamfa_org_budget     NUMBER(12,3),
  ffamfa_revisions      NUMBER(12,3),
  ffamfa_transfers      NUMBER(12,3),
  ffamfa_enc            NUMBER(12,3),
  ffamfa_dpt_budget     NUMBER(12,3),
  ffamfa_adm_budget     NUMBER(12,3),
  ffamfa_board_budget   NUMBER(12,3),
  ffamfa_budget_froze_x NUMBER(12,3),
  ffamfa_est_actual_amt NUMBER(12,3),
  ffamfa_enc_from_py    NUMBER(12,3),
  ffamfa_budget_from_py NUMBER(12,3),
  wa_transfer_in        NUMBER(12,3),
  wa_transfer_out       NUMBER(12,3),
  wa_debits             NUMBER(12,3),
  wa_credits            NUMBER(12,3),
  ffamfa_bud_adopt_dt   VARCHAR2(12),
  ffamfa_eq_sum_acct_id VARCHAR2(10),
  ffamfa_fte_projected  NUMBER(12,3),
  ffamfa_fte_est        NUMBER(7,4),
  ffamfa_fte_act        NUMBER(7,4),
  ffampt_project_number VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.bmx_ffamam_acct_id_fis_ytd on CEDARHILL.FFAMFA_FIS_YTD (FFAMAM_ACCT_ID)
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

prompt
prompt Creating table FFAMMA_MONTH_ACT
prompt ===============================
prompt
create table CEDARHILL.FFAMMA_MONTH_ACT
(
  ffamma_cal_year        NUMBER(11),
  ffamma_month           NUMBER(11),
  ffamam_acct_id         NUMBER(11),
  ffamma_amt_credit      NUMBER,
  ffamma_amt_debit       NUMBER,
  ffamma_enc             NUMBER,
  wa_debits              NUMBER,
  wa_credits             NUMBER,
  wa_transfer_out        NUMBER,
  wa_transfer_in         NUMBER,
  ffamma_original_budget NUMBER,
  ffamma_revisions       NUMBER,
  ffamma_transfers       NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.bmx_ffamam_acct_id on CEDARHILL.FFAMMA_MONTH_ACT (FFAMAM_ACCT_ID)
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
create bitmap index CEDARHILL.bmx_ffamma_cal_year on CEDARHILL.FFAMMA_MONTH_ACT (FFAMMA_CAL_YEAR)
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
prompt Creating table FTX_EMP_DEMOGRAPHIC
prompt ==================================
prompt
create table CEDARHILL.FTX_EMP_DEMOGRAPHIC
(
  name_id                NUMBER(11),
  total_exp              NUMBER(11),
  district_exp           NUMBER(11),
  pct_day_employed       NUMBER(11),
  actual_days_employed   NUMBER(11),
  position_days_employed NUMBER(11),
  fis_year               NUMBER(11)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HAABLD_BLD_CODES
prompt ===============================
prompt
create table CEDARHILL.HAABLD_BLD_CODES
(
  haabld_desc        VARCHAR2(60),
  haabld_sdesc       VARCHAR2(30),
  haabld_bld_code    VARCHAR2(10),
  haabld_state_code  VARCHAR2(20),
  haabld_misc_char_1 VARCHAR2(256),
  haabld_school_type VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HAADSC_DESCS
prompt ===========================
prompt
create table CEDARHILL.HAADSC_DESCS
(
  haadsc_code                 VARCHAR2(16),
  haadsc_desc                 VARCHAR2(60),
  haadsc_id                   NUMBER(11),
  haadsc_ind                  VARCHAR2(24),
  haadsc_old_char_code        VARCHAR2(16),
  haadsc_tecs_rpt_peims       CHAR(1),
  haadsc_tecs_trs_grp         VARCHAR2(16),
  haadsc_job_type_flag        VARCHAR2(24),
  haadsc_pa_rnd_x             CHAR(1),
  haadsc_chkwrtamt_prt_suf_x  CHAR(1),
  haadsc_chkwrtamt_suf_lit_s  VARCHAR2(16),
  haadsc_chkwrtamt_suf_lit_p  VARCHAR2(16),
  haadsc_chkwrtamt_prt_pre_x  CHAR(1),
  haadsc_chkwrtamt_prt_frac_x CHAR(1),
  haadsc_chkwrtamt_pre_lit_s  VARCHAR2(16),
  haadsc_chkwrtamt_pre_lit_p  VARCHAR2(16),
  haadsc_chkwrtamt_frac_lit_s VARCHAR2(16),
  haadsc_chkwrtamt_frac_lit_p VARCHAR2(16),
  haadsc_chkwrtdate_format    VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HAAPRO_PROFILE
prompt =============================
prompt
create table CEDARHILL.HAAPRO_PROFILE
(
  haabld_bld_code      VARCHAR2(10),
  haaety_emp_type_code VARCHAR2(10),
  name_id              NUMBER(11),
  haapro_hire_dte      VARCHAR2(10),
  haapro_term_dte      VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HLT_VACINATION
prompt =============================
prompt
create table CEDARHILL.HLT_VACINATION
(
  hlt_vacination_id       VARCHAR2(3),
  hlt_vacination_sdesc    VARCHAR2(15),
  hlt_vacination_ldesc    VARCHAR2(30),
  hlt_vac_req_spec        VARCHAR2(1),
  hlt_vacination_order    VARCHAR2(10),
  live                    VARCHAR2(10),
  hlt_illness_type_id     VARCHAR2(3),
  hlt_vac_str_school_year VARCHAR2(10),
  hlt_vac_ip_1st_yr_grds  VARCHAR2(15),
  hlt_vac_ip_2nd_yr_grds  VARCHAR2(15)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HPMCED_CERT_DTL
prompt ==============================
prompt
create table CEDARHILL.HPMCED_CERT_DTL
(
  hpmced_line_nbr           NUMBER(11),
  hpmcem_id                 NUMBER(11),
  haadsc_id_scope           NUMBER(11),
  haadsc_id_cert2           NUMBER(11),
  haadsc_id_cert1           NUMBER(11),
  hpmced_highly_qualified_x CHAR(1),
  hpmced_active_cert_x      CHAR(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HPMCEM_CERT_MST
prompt ==============================
prompt
create table CEDARHILL.HPMCEM_CERT_MST
(
  hpmcem_state        VARCHAR2(4),
  hpmcem_exp_date     VARCHAR2(10),
  hpmcem_issue_date   VARCHAR2(10),
  haadsc_id_cert_type NUMBER(11),
  hpmcem_cert_nbr     VARCHAR2(40),
  name_id             NUMBER(11),
  hpmcem_id           NUMBER(11),
  hpmcem_inst_name_id NUMBER(11),
  hpmcem_current_x    CHAR(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HTODCD_TOF_CODES
prompt ===============================
prompt
create table CEDARHILL.HTODCD_TOF_CODES
(
  htodcd_unit_type           VARCHAR2(2),
  htodrs_grp_code            VARCHAR2(2),
  htodcd_desc                VARCHAR2(60),
  htodcd_tof_code            VARCHAR2(10),
  htodcd_neg_bal_warn        VARCHAR2(16),
  htodcd_tof_sale_ratio      NUMBER(11),
  htodcd_tof_minimun_balance NUMBER,
  htodcd_tx_rd_sr_crd_x      CHAR(1),
  htodcd_display_x           CHAR(1),
  htodcd_allow_neg_tof_req_x CHAR(1),
  htodcd_misc3               VARCHAR2(16),
  htodcd_misc2               VARCHAR2(16),
  htodcd_misc1               VARCHAR2(16),
  htodcd_display_in_ea_x     CHAR(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HTODGR_GROUP_CODES
prompt =================================
prompt
create table CEDARHILL.HTODGR_GROUP_CODES
(
  htodgr_is_sick_leave CHAR(1),
  htodgr_desc          VARCHAR2(60),
  htodgr_grp_code      VARCHAR2(2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HTODHP_HPD_CODES
prompt ===============================
prompt
create table CEDARHILL.HTODHP_HPD_CODES
(
  htodhp_hpd_amt  NUMBER,
  htodhp_desc     VARCHAR2(60),
  htodhp_hpd_code VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HTODRS_REASON_CODES
prompt ==================================
prompt
create table CEDARHILL.HTODRS_REASON_CODES
(
  htodrs_desc              VARCHAR2(60),
  htodrs_reason_code       VARCHAR2(10),
  htodrs_restrictions_x    CHAR(1),
  htodrs_long_desc         VARCHAR2(163),
  htodrs_exclude_from_ea_x CHAR(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HTOTRN_TRANS
prompt ===========================
prompt
create table CEDARHILL.HTOTRN_TRANS
(
  htotrn_desc         VARCHAR2(60),
  htotrn_ltd_record   VARCHAR2(2),
  htotrn_ltd_dys      NUMBER,
  htotrn_ltd_hrs      NUMBER,
  htodhp_hpd_code     VARCHAR2(10),
  htotrn_reason_code  VARCHAR2(10),
  htoacr_code         VARCHAR2(18),
  htotrn_del_flag     VARCHAR2(2),
  htodcd_unit_type    VARCHAR2(2),
  htotrn_dys          NUMBER,
  htotrn_hrs          NUMBER,
  htodgr_grp_code     VARCHAR2(2),
  htotrn_type         VARCHAR2(2),
  htotrn_trans_date   VARCHAR2(10),
  htodcd_tof_codes    VARCHAR2(10),
  name_id             NUMBER(11),
  htotrn_id           NUMBER(11),
  htotrn_calculated_x CHAR(1),
  hpahdm_id           NUMBER(11),
  htotrn_misc3        VARCHAR2(16),
  htotrn_misc2        VARCHAR2(16),
  htotrn_misc1        VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table LOCATION
prompt =======================
prompt
create table CEDARHILL.LOCATION
(
  location_id       VARCHAR2(10),
  location_sdesc    VARCHAR2(30),
  location_ldesc    VARCHAR2(60),
  live              CHAR(1),
  loc_unused_dec_2  NUMBER(17,2),
  loc_unused_dec_1  NUMBER(17,2),
  loc_unused_char_2 VARCHAR2(16),
  loc_unused_char_1 VARCHAR2(16),
  loc_state_code    VARCHAR2(2),
  loc_unused_int_1  NUMBER,
  loc_unused_int_2  NUMBER,
  loc_unused_log_1  CHAR(1),
  loc_unused_log_2  CHAR(1),
  entity_id         VARCHAR2(10),
  st_int_2          NUMBER,
  st_int_1          NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table NAME
prompt ===================
prompt
create table CEDARHILL.NAME
(
  name_id                    NUMBER(11),
  bus_ind_type               CHAR(1),
  first_name                 VARCHAR2(30),
  middle_name                VARCHAR2(30),
  last_name                  VARCHAR2(60),
  nalphakey                  VARCHAR2(22),
  federal_id_no              VARCHAR2(18),
  address_id                 NUMBER(11),
  primary_phone              VARCHAR2(20),
  second_phone               VARCHAR2(20),
  fax_number                 VARCHAR2(20),
  confidential_code          CHAR(1),
  contact_person             VARCHAR2(60),
  comments                   VARCHAR2(240),
  internet_address           VARCHAR2(80),
  obs_x_duser                CHAR(1),
  obs_x_emer_contact         CHAR(1),
  obs_x_employer             CHAR(1),
  obs_x_feeder_school        CHAR(1),
  obs_x_guardian             CHAR(1),
  obs_x_health_professional  CHAR(1),
  obs_x_hospital             CHAR(1),
  obs_x_incl_census          CHAR(1),
  obs_x_insurance_co         CHAR(1),
  obs_x_organization         CHAR(1),
  obs_x_physician            CHAR(1),
  obs_x_staff                CHAR(1),
  obs_x_student              CHAR(1),
  obs_x_vendor               CHAR(1),
  birthdate                  VARCHAR2(10),
  gender                     VARCHAR2(2),
  marital_status             VARCHAR2(2),
  highest_ed_level_id        VARCHAR2(6),
  occupation_id              VARCHAR2(10),
  language_code              VARCHAR2(6),
  race_code                  VARCHAR2(6),
  n_employer                 NUMBER(11),
  n_organization             NUMBER(11),
  live                       CHAR(1),
  salutation_id              VARCHAR2(6),
  primary_phone_ext          VARCHAR2(10),
  second_phone_ext           VARCHAR2(10),
  obs_x_publisher            CHAR(1),
  obs_x_alumni               CHAR(1),
  alumni_grad_yr             NUMBER(11),
  addr_mail_id               NUMBER(11),
  third_phone                VARCHAR2(20),
  third_phone_ext            VARCHAR2(10),
  second_phone_type          VARCHAR2(2),
  third_phone_type           VARCHAR2(2),
  name_suffix_id             VARCHAR2(8),
  ein                        VARCHAR2(18),
  barcode_nbr                NUMBER(11),
  barcode_date               VARCHAR2(10),
  birth_place                VARCHAR2(60),
  primary_phone_cat          VARCHAR2(16),
  second_phone_cat           VARCHAR2(16),
  third_phone_cat            VARCHAR2(16),
  sif_name_ref_id            VARCHAR2(64),
  os_system_login            VARCHAR2(60),
  os_system_password         VARCHAR2(60),
  os_system_password_changed VARCHAR2(10),
  state_code                 VARCHAR2(16),
  conf_addr                  CHAR(1),
  conf_phone2                CHAR(1),
  conf_phone3                CHAR(1),
  conf_ssn                   CHAR(1),
  conf_marital_sts           CHAR(7),
  conf_dob                   CHAR(1),
  truetime_code              NUMBER(11),
  birth_city                 VARCHAR2(16),
  birth_state                VARCHAR2(16),
  birth_country              VARCHAR2(16),
  birth_county               VARCHAR2(16),
  mothers_maiden_name        VARCHAR2(60),
  birth_country_code         VARCHAR2(8),
  country_of_citizenship     VARCHAR2(8),
  country_of_residence       VARCHAR2(8),
  country_arrival_date       VARCHAR2(10),
  citizenship_status         VARCHAR2(8),
  deceased_dte               VARCHAR2(10),
  qqqblb_blob_id             NUMBER(11),
  use_biometric              CHAR(6),
  alternative_link_id        NUMBER(11),
  alternate_id               VARCHAR2(50),
  primary_phone_long_dist    VARCHAR2(1),
  custodial_parent           VARCHAR2(1),
  sexual_offender            VARCHAR2(1),
  no_connect_ed              VARCHAR2(1),
  allow_pick_up              VARCHAR2(1),
  ethnicity_hisp_x           VARCHAR2(1),
  wi_payee_id                VARCHAR2(20),
  race_verified_by           VARCHAR2(30),
  wa_race_subgroup           VARCHAR2(50),
  race_verified_date         VARCHAR2(10),
  fed_race_flags             VARCHAR2(10),
  conf_race_x                VARCHAR2(1),
  wa_ethnicity_group         VARCHAR2(6),
  conv_field_1               VARCHAR2(16),
  conv_field_2               VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create unique index CEDARHILL.XAK16NAME_ADDRESS on CEDARHILL.NAME (ADDRESS_ID, NALPHAKEY)
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
create unique index CEDARHILL.XAK18NAME_ADDR_MAIL_ID on CEDARHILL.NAME (ADDR_MAIL_ID, NAME_ID)
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
create unique index CEDARHILL.XAK2NAME_ALPHAKEY on CEDARHILL.NAME (NALPHAKEY)
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
create unique index CEDARHILL.XPKNAME on CEDARHILL.NAME (NAME_ID)
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
prompt Creating table PATH
prompt ===================
prompt
create table CEDARHILL.PATH
(
  school_year VARCHAR2(10),
  path_id     VARCHAR2(9),
  path_sdesc  VARCHAR2(15),
  path_ldesc  VARCHAR2(30),
  live        VARCHAR2(10),
  master_path VARCHAR2(30),
  misc_char   VARCHAR2(1000)
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
prompt Creating table RACE
prompt ===================
prompt
create table CEDARHILL.RACE
(
  race_code       VARCHAR2(6),
  race_sdesc      VARCHAR2(30),
  race_ldesc      VARCHAR2(50),
  live            CHAR(1),
  tecs_peims_code VARCHAR2(16),
  race_sif_id     VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table SCHD_PERIOD_TIMES
prompt ================================
prompt
create table CEDARHILL.SCHD_PERIOD_TIMES
(
  entity_id           VARCHAR2(5),
  school_year         VARCHAR2(10),
  dsp_period          VARCHAR2(10),
  clas_lun_code       VARCHAR2(1),
  day_nbr             VARCHAR2(10),
  days_meet           VARCHAR2(20),
  split_period        VARCHAR2(10),
  schd_prd_stp_time_1 VARCHAR2(10),
  schd_prd_str_time_2 VARCHAR2(10),
  schd_prd_stp_time_2 VARCHAR2(10),
  schd_prd_str_time_1 VARCHAR2(10),
  schd_period_hrs     NUMBER(5,2),
  allow_mb_to_suggest VARCHAR2(10),
  is_lunch_prd        VARCHAR2(10),
  sch_periods         VARCHAR2(50),
  spm_id              VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table SCHOOL
prompt =====================
prompt
create table CEDARHILL.SCHOOL
(
  school_id               VARCHAR2(5),
  school_principal        VARCHAR2(10),
  district_code           VARCHAR2(7),
  school_name             VARCHAR2(30),
  school_beg_grade        VARCHAR2(3),
  school_end_grade        VARCHAR2(3),
  school_phone            VARCHAR2(14),
  school_fax              VARCHAR2(14),
  school_number           VARCHAR2(10),
  school_org_number       VARCHAR2(10),
  school_kindergarden_ind VARCHAR2(1),
  school_public_private   VARCHAR2(1),
  x_chapter_1             VARCHAR2(10),
  live                    VARCHAR2(10),
  wa_remote_necessary     VARCHAR2(10),
  wa_fire_protection      VARCHAR2(1),
  wa_sch_entry_grade_lvl  VARCHAR2(2),
  wa_sch_bld_lvl          VARCHAR2(2),
  sif_sch_ref_id          VARCHAR2(32),
  building_id             VARCHAR2(5),
  in_sch_nbr              VARCHAR2(4),
  wa_title_1_reading      VARCHAR2(10),
  wa_title_1_math         VARCHAR2(10),
  title_1_type            VARCHAR2(3),
  wa_csrs_reporting       VARCHAR2(10),
  wa_summer_school        VARCHAR2(10),
  spec_ed_dept_chair      VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table SIS_ADDRESS
prompt ==========================
prompt
create table CEDARHILL.SIS_ADDRESS
(
  address_id        VARCHAR2(10),
  street_dir        VARCHAR2(50),
  street_number     VARCHAR2(10),
  street_name       VARCHAR2(50),
  street_appt       VARCHAR2(6),
  apt_lot           VARCHAR2(5),
  pobox             VARCHAR2(10),
  address2          VARCHAR2(30),
  zip_code          VARCHAR2(7),
  plus4             VARCHAR2(4),
  carrier_number    VARCHAR2(6),
  township_id       VARCHAR2(3),
  county_id         VARCHAR2(3),
  hazard_id         VARCHAR2(3),
  own_rent_code     VARCHAR2(1),
  dwelling_id       VARCHAR2(3),
  address_conf_code VARCHAR2(10),
  census_area       VARCHAR2(10),
  census_sub_area   VARCHAR2(10),
  loc_ver           VARCHAR2(12),
  loc_hor           VARCHAR2(12),
  live              VARCHAR2(10),
  old_address_key   VARCHAR2(15),
  path_id           VARCHAR2(9),
  mail_to           VARCHAR2(1),
  path_id_minority  VARCHAR2(9),
  country_id        VARCHAR2(2),
  path_id_majority  VARCHAR2(9),
  rural_box_nbr     VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table SIS_NAME
prompt =======================
prompt
create table CEDARHILL.SIS_NAME
(
  name_id                    VARCHAR2(100),
  first_name                 VARCHAR2(100),
  middle_name                VARCHAR2(100),
  last_name                  VARCHAR2(100),
  nalphakey                  VARCHAR2(100),
  federal_id_no              VARCHAR2(100),
  address_id                 VARCHAR2(100),
  primary_phone              VARCHAR2(100),
  primary_phone_ext          VARCHAR2(100),
  second_phone               VARCHAR2(100),
  second_phone_ext           VARCHAR2(500),
  second_phone_type          VARCHAR2(100),
  third_phone                VARCHAR2(100),
  third_phone_ext            VARCHAR2(100),
  third_phone_type           VARCHAR2(100),
  fax_number                 VARCHAR2(100),
  confidential_code          VARCHAR2(100),
  contact_person             VARCHAR2(300),
  comment_                   VARCHAR2(320),
  internet_address           VARCHAR2(400),
  obs_x_duser                VARCHAR2(100),
  obs_x_emer_contact         VARCHAR2(100),
  obs_x_employer             VARCHAR2(100),
  obs_x_feeder_school        VARCHAR2(100),
  obs_x_guardian             VARCHAR2(100),
  obs_x_health_professional  VARCHAR2(100),
  obs_x_hospital             VARCHAR2(100),
  obs_x_incl_census          VARCHAR2(100),
  obs_x_insurance_co         VARCHAR2(100),
  obs_x_organization         VARCHAR2(100),
  obs_x_physician            VARCHAR2(100),
  obs_x_staff                VARCHAR2(100),
  obs_x_student              VARCHAR2(100),
  obs_x_vendor               VARCHAR2(100),
  birthdate                  VARCHAR2(140),
  gender                     VARCHAR2(100),
  marital_status             VARCHAR2(100),
  highest_ed_level_id        VARCHAR2(300),
  occupation_id              VARCHAR2(500),
  language_code              VARCHAR2(300),
  race_code                  VARCHAR2(300),
  n_employer                 VARCHAR2(100),
  n_organization             VARCHAR2(100),
  live                       VARCHAR2(100),
  salutation_id              VARCHAR2(100),
  bus_ind_type               VARCHAR2(100),
  obs_x_publisher            VARCHAR2(100),
  obs_x_alumni               VARCHAR2(100),
  alumni_grad_yr             VARCHAR2(100),
  addr_mail_id               VARCHAR2(100),
  name_suffix_id             VARCHAR2(400),
  web_access_password        VARCHAR2(300),
  ein                        VARCHAR2(900),
  barcode_nbr                VARCHAR2(100),
  barcode_date               VARCHAR2(140),
  birth_place                VARCHAR2(300),
  web_encrypted_access       VARCHAR2(300),
  primary_phone_cat          VARCHAR2(300),
  second_phone_cat           VARCHAR2(300),
  third_phone_cat            VARCHAR2(300),
  sif_name_ref_id            VARCHAR2(320),
  os_system_login            VARCHAR2(300),
  os_system_password         VARCHAR2(300),
  os_system_password_changed VARCHAR2(104),
  state_code                 VARCHAR2(100),
  conf_addr                  VARCHAR2(100),
  conf_phone2                VARCHAR2(100),
  conf_phone3                VARCHAR2(100),
  conf_ssn                   VARCHAR2(100),
  conf_marital_sts           VARCHAR2(100),
  conf_dob                   VARCHAR2(100),
  truetime_code              VARCHAR2(100),
  birth_city                 VARCHAR2(200),
  birth_state                VARCHAR2(200),
  birth_country              VARCHAR2(200),
  birth_country_code         VARCHAR2(400),
  birth_county               VARCHAR2(200),
  mothers_maiden_name        VARCHAR2(300),
  country_of_citizenship     VARCHAR2(400),
  country_of_residence       VARCHAR2(400),
  country_arrival_date       VARCHAR2(140),
  citizenship_status         VARCHAR2(400),
  alternate_id               VARCHAR2(100),
  deceased_dte               VARCHAR2(140),
  qqqblb_blob_id             VARCHAR2(100),
  use_biometric              VARCHAR2(100),
  alternative_link_id        VARCHAR2(100),
  primary_phone_long_dist    VARCHAR2(100),
  custodial_parent           VARCHAR2(1),
  sexual_offender            VARCHAR2(1),
  no_connect_ed              VARCHAR2(1),
  allow_pick_up              VARCHAR2(1),
  ethnicity_hisp_x           VARCHAR2(1),
  wi_payee_id                VARCHAR2(20),
  race_verified_by           VARCHAR2(30),
  wa_race_subgroup           VARCHAR2(6),
  race_verified_date         VARCHAR2(8),
  fed_race_flags             VARCHAR2(10),
  conf_race_x                VARCHAR2(1),
  wa_ethnicity_group         VARCHAR2(6),
  conv_field_1               VARCHAR2(16),
  conv_field_2               VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMX_NAMEID on CEDARHILL.SIS_NAME (NAME_ID)
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
prompt Creating table SIS_QGT97_GENERIC_TABLE
prompt ======================================
prompt
create table CEDARHILL.SIS_QGT97_GENERIC_TABLE
(
  qgt97_unique_code VARCHAR2(100),
  qgt97_date        VARCHAR2(440),
  qgt97_logical     VARCHAR2(160),
  qgt97_dec         VARCHAR2(440),
  qgt97_int         VARCHAR2(440),
  qgt97_chr         VARCHAR2(540),
  qgt97_sort2_3     VARCHAR2(16),
  qgt97_sort2_2     VARCHAR2(16),
  qgt97_sort2_1     VARCHAR2(16),
  qgt97_sort3       VARCHAR2(16),
  qgt97_sort2       VARCHAR2(16),
  qgt97_sort1       VARCHAR2(16),
  qgt97_src_code    VARCHAR2(100),
  qgt97_src_id      NUMBER,
  qgt97_table_name  VARCHAR2(100),
  qgt97_record_id   NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_SIS_QGT97_SRC_ID on CEDARHILL.SIS_QGT97_GENERIC_TABLE (QGT97_SRC_ID)
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
create bitmap index CEDARHILL.BMI_SIS_QGT97_TABLE_NAME on CEDARHILL.SIS_QGT97_GENERIC_TABLE (QGT97_TABLE_NAME)
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
prompt Creating table SIS_SYS_CTD
prompt ==========================
prompt
create table CEDARHILL.SIS_SYS_CTD
(
  date_1     VARCHAR2(8),
  dec_1      NUMBER,
  int_2      NUMBER,
  int_1      NUMBER,
  log_2      VARCHAR2(1),
  log_1      VARCHAR2(1),
  char_2     VARCHAR2(4000),
  char_1     VARCHAR2(4000),
  end_year   NUMBER,
  start_year NUMBER,
  time_added NUMBER,
  date_added VARCHAR2(8),
  code_sdesc VARCHAR2(4000),
  code_ldesc VARCHAR2(4000),
  code_id    VARCHAR2(50),
  table_id   VARCHAR2(50),
  x_default  VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_SIS_SYS_CTD_CODE_ID on CEDARHILL.SIS_SYS_CTD (CODE_ID)
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
create bitmap index CEDARHILL.BMI_SIS_SYS_CTD_TABLE_ID on CEDARHILL.SIS_SYS_CTD (TABLE_ID)
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
prompt Creating table SIS_SYS_CTM
prompt ==========================
prompt
create table CEDARHILL.SIS_SYS_CTM
(
  unused_char_1    VARCHAR2(16),
  time_added       NUMBER,
  date_added       VARCHAR2(8),
  tbl_sdesc        VARCHAR2(100),
  tbl_ldesc        VARCHAR2(500),
  table_id         VARCHAR2(100),
  x_allow_maintain VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_SIS_SYS_CTM_TABLE_ID on CEDARHILL.SIS_SYS_CTM (TABLE_ID)
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
prompt Creating table SIS_ZIP
prompt ======================
prompt
create table CEDARHILL.SIS_ZIP
(
  zip_code       VARCHAR2(7),
  zip_city       VARCHAR2(20),
  zip_state      VARCHAR2(5),
  zip_country    VARCHAR2(10),
  live           VARCHAR2(10),
  x_dist_zip     VARCHAR2(10),
  x_validate_zip VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table SPECIAL_SERVICE
prompt ==============================
prompt
create table CEDARHILL.SPECIAL_SERVICE
(
  special_service_id       VARCHAR2(3),
  special_service_sdesc    VARCHAR2(15),
  special_service_ldesc    VARCHAR2(50),
  x_program                VARCHAR2(10),
  x_handicap               VARCHAR2(10),
  x_related_service        VARCHAR2(10),
  state_reporting_code     VARCHAR2(3),
  live                     VARCHAR2(10),
  x_transition             VARCHAR2(10),
  mn_edrs_state_code       VARCHAR2(3),
  wi_state_service         VARCHAR2(5),
  mi_elig_rule_nbr         VARCHAR2(20),
  mi_prgm_rule_nbr         VARCHAR2(20),
  mi_serv_rule_nbr         VARCHAR2(20),
  disability_elig_criteria VARCHAR2(30),
  x_medicaid_eligible      VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STAFF
prompt ====================
prompt
create table CEDARHILL.STAFF
(
  name_id                 NUMBER,
  staff_title             VARCHAR2(60),
  short_name              VARCHAR2(20),
  initials                VARCHAR2(8),
  tchr_gradebook_used     VARCHAR2(2),
  mn_tchr_file_folder_nbr NUMBER,
  x_dis_officer           VARCHAR2(1),
  x_teacher               VARCHAR2(1),
  staff_gb_filename       VARCHAR2(10),
  x_substitute            VARCHAR2(10),
  sub_assgn_access        VARCHAR2(2),
  staff_gradebook         VARCHAR2(16),
  srsd_tch_license_no     VARCHAR2(30),
  long_name               VARCHAR2(40),
  sif_staff_ref_id        VARCHAR2(64),
  x_highly_qualified      VARCHAR2(1),
  alternate_id            NUMBER,
  internet_address        VARCHAR2(40),
  staff_profile           VARCHAR2(16),
  staff_misc_char         VARCHAR2(180),
  tn_position_code        VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STAFF_TYPE
prompt =========================
prompt
create table CEDARHILL.STAFF_TYPE
(
  type_staff_id VARCHAR2(10),
  name_id       NUMBER,
  x_primary     VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT
prompt ======================
prompt
create table CEDARHILL.STUDENT
(
  student_id                 VARCHAR2(10),
  name_id                    VARCHAR2(10),
  alphakey                   VARCHAR2(11),
  other_name                 VARCHAR2(45),
  other_id                   VARCHAR2(12),
  cnv_key                    VARCHAR2(12),
  internet_address           VARCHAR2(40),
  library_card_no            VARCHAR2(15),
  grad_yr                    NUMBER,
  nxt_grad_yr                NUMBER,
  student_ecp                VARCHAR2(2),
  graduated                  VARCHAR2(10),
  retained                   VARCHAR2(10),
  resident                   VARCHAR2(10),
  district_code              VARCHAR2(7),
  attendance_area            VARCHAR2(3),
  feeder_school_id           VARCHAR2(10),
  primary_physician          VARCHAR2(10),
  student_insurance_co       VARCHAR2(10),
  med_info                   VARCHAR2(1000),
  med_note_obs               VARCHAR2(200),
  ins_nbr                    VARCHAR2(30),
  hospital_preference        VARCHAR2(10),
  transportation_id          VARCHAR2(3),
  transported                VARCHAR2(10),
  bus_info                   VARCHAR2(24),
  miles                      NUMBER(7,2),
  driver_license_no          VARCHAR2(25),
  grad_followup              VARCHAR2(18),
  x_vocational_participant   VARCHAR2(10),
  x_special_education        VARCHAR2(10),
  x_atrisk                   VARCHAR2(10),
  x_gifted_talented          VARCHAR2(10),
  x_chapter_1                VARCHAR2(10),
  x_section_504              VARCHAR2(10),
  x_section_504_accom        VARCHAR2(10),
  x_migrant                  VARCHAR2(10),
  mn_ede_nbr                 NUMBER(13),
  mn_limited_english         VARCHAR2(10),
  mn_hmbnd_serv_ind          VARCHAR2(10),
  mn_hmbnd_hrs               VARCHAR2(10),
  mn_secondary_opt_ind       VARCHAR2(10),
  mn_instr_set_id            VARCHAR2(2),
  mn_assess_hrs              VARCHAR2(10),
  mn_grad_stnd_yr            VARCHAR2(10),
  mn_trans_cat               VARCHAR2(2),
  county_id                  VARCHAR2(3),
  mo_std_desegregated        VARCHAR2(1),
  mn_lep_start_date          VARCHAR2(14),
  live                       VARCHAR2(10),
  path_id                    VARCHAR2(9),
  school_id                  VARCHAR2(5),
  nxt_yr_sch_flag            VARCHAR2(1),
  obs_bar_code_nbr           VARCHAR2(10),
  obs_bar_code_date          VARCHAR2(14),
  graduation_date            VARCHAR2(14),
  sped_fte                   NUMBER(5,2),
  unused_char_1              VARCHAR2(3),
  unused_char_2              VARCHAR2(3),
  unused_char_3              VARCHAR2(3),
  unused_int_1               VARCHAR2(10),
  unused_int_2               VARCHAR2(10),
  unused_dec_1               NUMBER(10,5),
  unused_dec_2               NUMBER(10,5),
  engl_prof                  VARCHAR2(10),
  x_iep                      VARCHAR2(10),
  x_iep_accom                VARCHAR2(10),
  wa_migrant_id              VARCHAR2(12),
  wa_migrant_lst_qual_move_d VARCHAR2(14),
  wa_migrant_advisor         VARCHAR2(10),
  wa_migrant_comment         VARCHAR2(200),
  sif_stu_ref_id             VARCHAR2(32),
  advance                    VARCHAR2(10),
  student_web_permission     VARCHAR2(10),
  lang_minority              VARCHAR2(1),
  student_gqe                VARCHAR2(1),
  in_instruction             VARCHAR2(1),
  in_gift_talented_code      VARCHAR2(2),
  in_esea_title1             VARCHAR2(1),
  wa_grad_yr                 VARCHAR2(10),
  student_in_stn             VARCHAR2(9),
  wi_native_lang_instr       VARCHAR2(10),
  wi_lep_served_prog         VARCHAR2(10),
  wi_lep_eligible            VARCHAR2(10),
  wasl_prev_passed_listening VARCHAR2(10),
  wasl_prev_passed_reading   VARCHAR2(10),
  wasl_prev_passed_writing   VARCHAR2(10),
  wasl_prev_passed_math      VARCHAR2(10),
  former_name                VARCHAR2(75),
  wi_long_term_us_std_ind    VARCHAR2(10),
  x_esl                      VARCHAR2(10),
  sd_old_ede_nbr             NUMBER(13),
  mi_merit_id_nbr            VARCHAR2(10),
  dip_code                   VARCHAR2(2),
  sd_served_in_mep           VARCHAR2(10),
  sd_served_in_sum_mep       VARCHAR2(10),
  sd_us_res_citizen_status   VARCHAR2(10),
  mi_out_of_state_std        VARCHAR2(10),
  mi_dev_ret_kg              VARCHAR2(10),
  mi_alternative_ed          VARCHAR2(10),
  twentyfirst_century_pgm    VARCHAR2(10),
  il_last_image_test         VARCHAR2(1),
  wi_1st_entry_sch_yr        VARCHAR2(10),
  in_eng_lang_accom          VARCHAR2(10),
  in_math_accom              VARCHAR2(10),
  in_special_codes           VARCHAR2(1),
  in_retake_istep            VARCHAR2(10),
  wi_testing_status          VARCHAR2(1),
  student_gradebook_id       VARCHAR2(10),
  wa_most_recent_dist_enroll VARCHAR2(14),
  wasl_prev_passed_science   VARCHAR2(10),
  med_info_critical          VARCHAR2(10),
  wi_dist_entry_override     VARCHAR2(14),
  mn_homeless                VARCHAR2(10),
  mn_ward_of_state           VARCHAR2(10),
  mn_suppl_ed_serv           VARCHAR2(10),
  x_foreign_exchange         VARCHAR2(10),
  x_immigrant                VARCHAR2(10),
  in_rnd_drg_tst_form        VARCHAR2(1),
  in_rnd_drg_tst_nbr         VARCHAR2(10),
  x_ma_elig                  VARCHAR2(10),
  medicaid_nbr               VARCHAR2(15),
  primary_dentist            VARCHAR2(10),
  full_name_lfm              VARCHAR2(60),
  regen_grad_req             VARCHAR2(10),
  addr_dropoff_id            VARCHAR2(10),
  addr_pickup_id             VARCHAR2(10),
  x_lives_with_par_guard     VARCHAR2(10),
  dist_demographic_public    VARCHAR2(10),
  dist_demographic_military  VARCHAR2(10),
  dist_demographic_high_ed   VARCHAR2(10),
  dist_demographic_local_use VARCHAR2(10),
  dist_demographic_district  VARCHAR2(10),
  bus_am_number              VARCHAR2(6),
  bus_pm_number              VARCHAR2(6),
  grad_req_plan_id           VARCHAR2(10),
  date_entered_9th_grd       VARCHAR2(14),
  wa_csrs_reporting          VARCHAR2(10),
  wa_summer_school           VARCHAR2(10),
  fee_waiver                 VARCHAR2(30),
  x_credential_type          VARCHAR2(10),
  x_fed_form_506             VARCHAR2(10),
  grad_status                VARCHAR2(10),
  native_language            VARCHAR2(3),
  alias_number               VARCHAR2(10),
  district_refferred         VARCHAR2(10),
  school_referred            VARCHAR2(10),
  fl_agency_programs         VARCHAR2(1),
  additional_school_yr_stude VARCHAR2(1),
  graduation_option          VARCHAR2(1),
  neglected_institution      VARCHAR2(4),
  x_child_of_military        VARCHAR2(10),
  immunization_status        VARCHAR2(1),
  health_examination         VARCHAR2(1),
  prog_prior_to_kinder       VARCHAR2(1),
  career_academy             VARCHAR2(3),
  prekinder_prog             VARCHAR2(1),
  career_academy_participant VARCHAR2(1),
  test_accom                 VARCHAR2(1),
  nclb_transportation        VARCHAR2(1),
  math_remediation           VARCHAR2(1),
  nclb_supplemental_services VARCHAR2(1),
  prior_district             VARCHAR2(2),
  prior_state                VARCHAR2(2),
  prior_country              VARCHAR2(2),
  educational_choice         VARCHAR2(1),
  x_hurricane_affected       VARCHAR2(10),
  x_offender_transfer        VARCHAR2(10),
  responsible_teacher_read   VARCHAR2(9),
  responsible_teacher_write  VARCHAR2(9),
  responsible_teacher_math   VARCHAR2(9),
  dropout_influences         VARCHAR2(10),
  ged_results                VARCHAR2(1),
  passed_communications      VARCHAR2(10),
  passed_mathematics         VARCHAR2(10),
  community_service_hours    VARCHAR2(10),
  met_community_service      VARCHAR2(1),
  even_start                 VARCHAR2(1),
  federal_impact_aid         VARCHAR2(1),
  first_start                VARCHAR2(1),
  major_interest             VARCHAR2(4),
  national_achievement_schol VARCHAR2(1),
  national_merit_scholar     VARCHAR2(1),
  lunch_share                VARCHAR2(1),
  read_fluency               VARCHAR2(1),
  national_hispanic_scholar  VARCHAR2(1),
  migrant_residency_date     VARCHAR2(14),
  migrant_birth_state        VARCHAR2(2),
  scholarship_award          VARCHAR2(1),
  differentiated_diploma     VARCHAR2(1),
  ib_diploma                 VARCHAR2(1),
  birthdate_verification     VARCHAR2(1),
  college_ready_diploma      VARCHAR2(1),
  grad_req_basis             VARCHAR2(2),
  career_plan_id             VARCHAR2(10),
  fefp_weekly_minutes        NUMBER(8,4),
  fte_eligibility            VARCHAR2(1),
  date_entered_us            VARCHAR2(14),
  bus_off_number             VARCHAR2(12),
  neglected_institution_2    VARCHAR2(4),
  transport_in_survey        VARCHAR2(500),
  sent_in_survey             VARCHAR2(750),
  cert_compl_type            VARCHAR2(3),
  dip_date                   VARCHAR2(14),
  medical_contact            VARCHAR2(10),
  dist_demographic_vendors   VARCHAR2(10),
  dist_demographic_media     VARCHAR2(10),
  dist_demographic_trips     VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index CEDARHILL.BMI_STUDENT_ID_STU on CEDARHILL.STUDENT (STUDENT_ID)
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
prompt Creating table STUDENT_ATND_DETAIL
prompt ==================================
prompt
create table CEDARHILL.STUDENT_ATND_DETAIL
(
  student_id          VARCHAR2(10),
  atnd_date           VARCHAR2(14),
  entity_id           VARCHAR2(5),
  school_year         VARCHAR2(10),
  alphakey            VARCHAR2(11),
  sad_parent_notified VARCHAR2(10),
  zer_mod_aat_id      VARCHAR2(1),
  zer_mod_aar_id      VARCHAR2(2),
  aat_id              VARCHAR2(200),
  aar_id              VARCHAR2(200),
  calendar_id         VARCHAR2(5),
  duser_id            VARCHAR2(12),
  atnd_trn_type       VARCHAR2(1),
  atnd_trn_date       VARCHAR2(14),
  atnd_trn_time       VARCHAR2(10),
  cece_type           VARCHAR2(1),
  cece_entity         VARCHAR2(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_CLASS
prompt ============================
prompt
create table CEDARHILL.STUDENT_CLASS
(
  cor_num_id                 VARCHAR2(20),
  track                      VARCHAR2(20),
  clas_section               VARCHAR2(5),
  alphakey                   VARCHAR2(11),
  school_year                VARCHAR2(20),
  entity_id                  VARCHAR2(5),
  semester_nbr               VARCHAR2(20),
  term_nbr                   VARCHAR2(20),
  schd_str_trm               VARCHAR2(20),
  schd_stp_trm               VARCHAR2(20),
  student_id                 VARCHAR2(20),
  schd_record_type           VARCHAR2(1),
  schd_status                VARCHAR2(1),
  schd_special_type          VARCHAR2(1),
  schd_schd_teq              VARCHAR2(2),
  schd_hst_grad_year         VARCHAR2(20),
  schd_hst_ecp               VARCHAR2(2),
  schd_trm_abs_obs           VARCHAR2(15),
  schd_trm_tdy_obs           VARCHAR2(20),
  schd_num_crds              NUMBER(5,3),
  schd_ytd_earn_crds         NUMBER(5,3),
  schd_ytd_fail_crds         NUMBER(5,3),
  schd_ytd_gpa_crds          VARCHAR2(200),
  schd_ytd_gpa_pnts          VARCHAR2(200),
  ytd_info_updated_by        VARCHAR2(20),
  ytd_info_date_updated      VARCHAR2(14),
  schd_flag1                 VARCHAR2(1),
  schd_flag2                 VARCHAR2(1),
  schd_flag3                 VARCHAR2(1),
  schd_ar_billing            VARCHAR2(1),
  schd_ar_refund_flag        VARCHAR2(1),
  schd_ar_refund_billed      VARCHAR2(1),
  schd_ar_refund_amt         NUMBER(7,2),
  schd_ar_course_fee         NUMBER(7,2),
  schd_grad_req_grp          VARCHAR2(3),
  schd_priority              VARCHAR2(20),
  grd_mid_trm_mrk_obs        VARCHAR2(50),
  grd_trm_mrk_obs            VARCHAR2(50),
  grd_sem_exm_mrk            VARCHAR2(20),
  grd_sem_mrk                VARCHAR2(20),
  grd_fnl_exm_mrk            VARCHAR2(3),
  grd_fnl_mrk                VARCHAR2(3),
  grd_ath_mrk                VARCHAR2(3),
  grd_ath_eff_date           VARCHAR2(14),
  duser_id                   VARCHAR2(12),
  grd_ath_trn_date           VARCHAR2(14),
  grd_oth_mrk                VARCHAR2(3),
  grd_oth_eff_date           VARCHAR2(14),
  grd_oth_duser_id           VARCHAR2(12),
  grd_oth_trn_date           VARCHAR2(14),
  grd_citizen_mrk_obs        VARCHAR2(50),
  seat                       VARCHAR2(20),
  schd_trm_abs               VARCHAR2(40),
  schd_trm_tdy               VARCHAR2(40),
  grd_citizen_mrk            VARCHAR2(100),
  grd_mid_trm_mrk            VARCHAR2(50),
  grd_trm_mrk                VARCHAR2(50),
  has_var_earn_crdts         VARCHAR2(20),
  earn_crdt_poss             NUMBER(5,3),
  earn_crdt_str_trm          VARCHAR2(20),
  earn_crdt_stp_trm          VARCHAR2(20),
  earn_crdt_duser_id         VARCHAR2(20),
  earn_crdt_lst_dte_upd      VARCHAR2(14),
  has_var_gpa_crdts          VARCHAR2(20),
  gpa_crdts_poss             VARCHAR2(75),
  gpa_crdts_str_trm          VARCHAR2(20),
  gpa_crdts_stp_trm          VARCHAR2(20),
  gpa_crdt_duser_id          VARCHAR2(20),
  gpa_crdt_lst_dte_upd       VARCHAR2(100),
  transfer_atnd              VARCHAR2(20),
  transfer_atnd_cor          VARCHAR2(20),
  transfer_atnd_track        VARCHAR2(20),
  transfer_atnd_section      VARCHAR2(3),
  transfer_atnd_duser_id     VARCHAR2(20),
  transfer_atnd_lst_dte_upd  VARCHAR2(14),
  wgt_schd_add_on            NUMBER(3,2),
  schd_ytd_add_on_gpa        VARCHAR2(100),
  unused_char_1              VARCHAR2(3),
  unused_char_2              VARCHAR2(3),
  unused_int_1               VARCHAR2(20),
  unused_int_2               VARCHAR2(20),
  unused_dec_1               NUMBER(10,5),
  unused_dec_2               NUMBER(10,5),
  schd_ytd_remain_crds       NUMBER(5,3),
  gpa_set_override           VARCHAR2(20),
  schd_drp_type              VARCHAR2(100),
  schd_schd_conflict_reason  VARCHAR2(1),
  service_id                 VARCHAR2(20),
  trans_area                 VARCHAR2(20),
  unit_desc                  VARCHAR2(20),
  course_type_id             VARCHAR2(3),
  trn_grd_lvl_ovr            VARCHAR2(2),
  cece_type                  VARCHAR2(1),
  cece_cor_num_id            VARCHAR2(20),
  grd_cit_earn_crds          VARCHAR2(700),
  grd_cit_fail_crds          VARCHAR2(700),
  grd_mid_earn_crds          VARCHAR2(300),
  grd_mid_fail_crds          VARCHAR2(300),
  grd_trm_earn_crds          VARCHAR2(300),
  grd_trm_fail_crds          VARCHAR2(300),
  grd_sem_earn_crds          VARCHAR2(300),
  grd_sem_fail_crds          VARCHAR2(200),
  modified_by_name_id        VARCHAR2(20),
  grade_replace_flag         VARCHAR2(1),
  sif_stu_cls_ref_id         VARCHAR2(32),
  name_id                    VARCHAR2(20),
  wn_cor_comp_date           VARCHAR2(14),
  x_use_tran_glo_in_gpa      VARCHAR2(20),
  stu_gpa_set_id_1           VARCHAR2(20),
  stu_gpa_set_id_2           VARCHAR2(20),
  stu_gpa_set_id_3           VARCHAR2(20),
  stu_gpa_set_id_4           VARCHAR2(20),
  stu_gpa_set_id_5           VARCHAR2(20),
  stu_gpa_set_id_6           VARCHAR2(20),
  stu_gpa_set_id_7           VARCHAR2(20),
  stu_gpa_set_id_8           VARCHAR2(20),
  stu_gpa_set_id_9           VARCHAR2(20),
  stu_gpa_crdts_1            NUMBER(5,3),
  stu_gpa_crdts_2            NUMBER(5,3),
  stu_gpa_crdts_3            NUMBER(5,3),
  stu_gpa_crdts_4            NUMBER(5,3),
  stu_gpa_crdts_5            NUMBER(5,3),
  stu_gpa_crdts_6            NUMBER(5,3),
  stu_gpa_crdts_7            NUMBER(5,3),
  stu_gpa_crdts_8            NUMBER(5,3),
  stu_gpa_crdts_9            NUMBER(5,3),
  x_use_tran_glo_in_earn_crd VARCHAR2(20),
  wa_honors_option           VARCHAR2(20),
  wa_repeated_for_credit     VARCHAR2(20),
  cor_schd_priority          VARCHAR2(20),
  x_tn_voc_outside_iep       VARCHAR2(20),
  ut_dual_crdt_cor           VARCHAR2(20),
  fefp_number                VARCHAR2(20),
  fte_earned                 NUMBER(4,3),
  transfer_district          VARCHAR2(2),
  transfer_school            VARCHAR2(4),
  substituted_course         VARCHAR2(7),
  fefp_weekly_minutes        NUMBER(8,4),
  cor_ernd_crdt_override     NUMBER(8,3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index CEDARHILL.BMI_GRD_MRK on CEDARHILL.STUDENT_CLASS (GRD_SEM_MRK)
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
create bitmap index CEDARHILL.BMI_SCHD_REC_TYPE on CEDARHILL.STUDENT_CLASS (SCHD_RECORD_TYPE)
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
create bitmap index CEDARHILL.BMI_SCHL_YR on CEDARHILL.STUDENT_CLASS (SCHOOL_YEAR)
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
create bitmap index CEDARHILL.BMI_STUD_CLASS_ENTITY_ID on CEDARHILL.STUDENT_CLASS (ENTITY_ID)
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
prompt Creating table STUDENT_CLASSIFICATIONS
prompt ======================================
prompt
create table CEDARHILL.STUDENT_CLASSIFICATIONS
(
  student_id     VARCHAR2(10),
  school_year    VARCHAR2(10),
  sc_record_type VARCHAR2(50),
  entity_id      VARCHAR2(5),
  sc_str_date    VARCHAR2(14),
  sc_end_date    VARCHAR2(14),
  sc_code_1      VARCHAR2(20),
  sc_code_2      VARCHAR2(3),
  sc_date_1      VARCHAR2(14),
  sc_date_2      VARCHAR2(14),
  sc_log_1       VARCHAR2(10),
  sc_log_2       VARCHAR2(10),
  sc_log_3       VARCHAR2(10),
  sc_log_4       VARCHAR2(10),
  sc_log_5       VARCHAR2(10),
  sc_log_6       VARCHAR2(10),
  sc_log_7       VARCHAR2(10),
  sc_log_8       VARCHAR2(10),
  sc_log_9       VARCHAR2(10),
  sc_log_10      VARCHAR2(10),
  sc_log_11      VARCHAR2(10),
  sc_log_12      VARCHAR2(10),
  sc_dec_1       VARCHAR2(10),
  sc_dec_2       VARCHAR2(10),
  sc_char_1      VARCHAR2(90),
  sc_char_2      VARCHAR2(150),
  sc_char_3      VARCHAR2(90),
  sc_char_4      VARCHAR2(90),
  sc_char_5      VARCHAR2(90),
  sc_int_1       VARCHAR2(10),
  sc_int_2       VARCHAR2(10),
  sc_int_3       VARCHAR2(10),
  sc_int_4       VARCHAR2(10),
  sc_int_5       VARCHAR2(10),
  sc_char_6      VARCHAR2(90),
  sc_char_7      VARCHAR2(90),
  sc_char_8      VARCHAR2(90),
  sc_char_9      VARCHAR2(90),
  sc_char_10     VARCHAR2(90),
  sc_code_3      VARCHAR2(90),
  sc_code_4      VARCHAR2(90),
  sc_dec_3       VARCHAR2(10),
  sc_dec_4       VARCHAR2(10),
  sc_code_5      VARCHAR2(3),
  sc_date_3      VARCHAR2(14),
  sc_date_4      VARCHAR2(14),
  sc_date_5      VARCHAR2(14),
  sc_dec_5       VARCHAR2(10),
  sc_dec_6       VARCHAR2(10),
  sc_date_6      VARCHAR2(14),
  sc_code_6      VARCHAR2(30),
  sc_code_7      VARCHAR2(30),
  sc_code_8      VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_CLASS_TRN
prompt ================================
prompt
create table CEDARHILL.STUDENT_CLASS_TRN
(
  cor_num_id                NUMBER,
  track                     NUMBER,
  clas_section              VARCHAR2(10),
  entity_id                 VARCHAR2(10),
  new_str_trm               NUMBER,
  old_str_trm               NUMBER,
  old_stp_trm               NUMBER,
  new_stp_trm               NUMBER,
  student_id                NUMBER,
  trn_type                  VARCHAR2(2),
  trn_prog_from             VARCHAR2(16),
  duser_id                  VARCHAR2(24),
  requested_by              VARCHAR2(60),
  trn_date                  VARCHAR2(10),
  trn_time                  NUMBER,
  trn_effect_date           VARCHAR2(10),
  sct_tran_atnd             VARCHAR2(1),
  sct_tran_atnd_cor         NUMBER,
  sct_tran_atnd_track       NUMBER,
  sct_tran_atnd_section     VARCHAR2(10),
  sct_tran_atnd_duser_id    NUMBER,
  sct_tran_atnd_lst_dte_upd VARCHAR2(10),
  cece_type                 VARCHAR2(16),
  cece_cor_num_id           NUMBER,
  sif_stu_cls_trn_ref_id    VARCHAR2(64)
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
prompt Creating table STUDENT_DIS_ACTION
prompt =================================
prompt
create table CEDARHILL.STUDENT_DIS_ACTION
(
  offense_ref_no         VARCHAR2(10),
  action_ref_no          VARCHAR2(10),
  student_id             VARCHAR2(10),
  action_date            VARCHAR2(14),
  dis_action_id          VARCHAR2(3),
  dis_action_status      VARCHAR2(1),
  entity_id              VARCHAR2(5),
  school_year            VARCHAR2(10),
  follow_up_name_id      VARCHAR2(10),
  action_time            VARCHAR2(10),
  school_id              VARCHAR2(5),
  location_id            VARCHAR2(5),
  action_comment         VARCHAR2(1024),
  action_parent_not      VARCHAR2(10),
  action_points          NUMBER(7,2),
  dis_action_flag        VARCHAR2(1),
  dis_action_time        NUMBER(7,2),
  action_time_served     NUMBER(7,2),
  dis_action_susp_type   VARCHAR2(1),
  diff_reason_id         VARCHAR2(2),
  dis_act_date_ent       VARCHAR2(14),
  dis_act_time_ent       VARCHAR2(10),
  follow_up_type         VARCHAR2(3),
  act_unused_char1       VARCHAR2(30),
  act_unused_char2       VARCHAR2(30),
  act_unused_date1       VARCHAR2(14),
  act_unused_date2       VARCHAR2(14),
  act_unused_dec1        NUMBER(7,2),
  act_unused_dec2        NUMBER(7,2),
  act_unused_int1        VARCHAR2(10),
  act_unused_int2        VARCHAR2(10),
  act_unused_log1        VARCHAR2(10),
  act_unused_log2        VARCHAR2(10),
  alternative_school     VARCHAR2(1),
  dis_act_date_ord       VARCHAR2(14),
  in_exp_sus_reason      VARCHAR2(2),
  in_exp_sus_hearing_off VARCHAR2(3),
  in_exp_alt_school      VARCHAR2(1),
  dis_officer_name_id    VARCHAR2(10),
  st_dec_1               NUMBER(7,2),
  st_char_1              VARCHAR2(256),
  st_log_1               VARCHAR2(10),
  st_log_2               VARCHAR2(10),
  st_log_3               VARCHAR2(10),
  st_log_4               VARCHAR2(10),
  st_log_5               VARCHAR2(10),
  st_log_6               VARCHAR2(10),
  st_date_1              VARCHAR2(14),
  st_int_1               VARCHAR2(10),
  st_int_2               VARCHAR2(10),
  st_int_3               VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_DIS_ACT_DET
prompt ==================================
prompt
create table CEDARHILL.STUDENT_DIS_ACT_DET
(
  offense_ref_no       VARCHAR2(10),
  action_ref_no        VARCHAR2(10),
  act_det_date         VARCHAR2(14),
  act_det_time         VARCHAR2(10),
  act_det_sts          VARCHAR2(1),
  follow_up_name_id    VARCHAR2(10),
  location_id          VARCHAR2(5),
  act_det_comment      VARCHAR2(320),
  act_det_parent_not   VARCHAR2(10),
  act_det_time_served  NUMBER(7,2),
  det_diff_reason_id   VARCHAR2(2),
  act_det_date_entered VARCHAR2(14),
  act_det_time_entered VARCHAR2(10),
  entered_by           VARCHAR2(10),
  act_det_unused_char2 VARCHAR2(30),
  act_det_unused_char1 VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_DIS_OFFENSE
prompt ==================================
prompt
create table CEDARHILL.STUDENT_DIS_OFFENSE
(
  offense_ref_no             VARCHAR2(10),
  student_id                 VARCHAR2(10),
  off_date                   VARCHAR2(14),
  dis_offense_id             VARCHAR2(3),
  entity_id                  VARCHAR2(5),
  school_year                VARCHAR2(10),
  incident_no                VARCHAR2(10),
  dis_officer_name_id        VARCHAR2(10),
  off_time                   VARCHAR2(10),
  off_ref_by_flag            VARCHAR2(1),
  off_ref_by_name_id         VARCHAR2(10),
  off_first_name             VARCHAR2(16),
  off_last_name              VARCHAR2(20),
  school_id                  VARCHAR2(5),
  location_id                VARCHAR2(5),
  off_comment                VARCHAR2(4000),
  off_parent_not             VARCHAR2(10),
  dis_offense_points         NUMBER(7,2),
  dis_date_entered           VARCHAR2(14),
  dis_time_entered           VARCHAR2(10),
  off_est_cost               NUMBER(7,2),
  off_unused_char1           VARCHAR2(30),
  off_unused_char2           VARCHAR2(30),
  off_unused_date1           VARCHAR2(14),
  off_unused_date2           VARCHAR2(14),
  off_unused_dec1            NUMBER(7,2),
  off_unused_dec2            NUMBER(7,2),
  off_unused_int1            VARCHAR2(10),
  off_unused_int2            VARCHAR2(10),
  off_unused_log1            VARCHAR2(10),
  off_unused_log2            VARCHAR2(10),
  off_time_comment           VARCHAR2(30),
  tx_campus_of_dis_resp      VARCHAR2(9),
  off_period                 VARCHAR2(10),
  sif_dis_off_ref_id         VARCHAR2(32),
  offense_referral           VARCHAR2(1),
  st_int_1                   VARCHAR2(10),
  st_char_1                  VARCHAR2(256),
  st_char_2                  VARCHAR2(256),
  st_int_2                   VARCHAR2(10),
  st_char_3                  VARCHAR2(256),
  st_int_3                   VARCHAR2(10),
  st_char_4                  VARCHAR2(256),
  st_log_1                   VARCHAR2(10),
  st_log_2                   VARCHAR2(10),
  st_log_3                   VARCHAR2(10),
  st_log_4                   VARCHAR2(10),
  st_int_4                   VARCHAR2(10),
  st_int_5                   VARCHAR2(10),
  st_char_5                  VARCHAR2(256),
  st_log_5                   VARCHAR2(10),
  st_char_6                  VARCHAR2(256),
  st_char_7                  VARCHAR2(256),
  st_char_8                  VARCHAR2(256),
  st_char_9                  VARCHAR2(256),
  st_char_10                 VARCHAR2(256),
  st_char_11                 VARCHAR2(256),
  st_int_6                   VARCHAR2(10),
  st_int_7                   VARCHAR2(10),
  st_int_8                   VARCHAR2(10),
  st_int_9                   VARCHAR2(10),
  st_int_10                  VARCHAR2(10),
  reported_to_law_enforcemen VARCHAR2(10),
  weapon_desc                VARCHAR2(1),
  incident_context           VARCHAR2(1),
  drug_desc                  VARCHAR2(1),
  st_log_6                   VARCHAR2(10),
  st_log_7                   VARCHAR2(10),
  st_log_8                   VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_ENTITY
prompt =============================
prompt
create table CEDARHILL.STUDENT_ENTITY
(
  student_id               VARCHAR2(10),
  entity_id                VARCHAR2(5),
  band_instrument_id       VARCHAR2(3),
  school_id                VARCHAR2(5),
  track                    VARCHAR2(10),
  ny_track                 VARCHAR2(10),
  calendar_id              VARCHAR2(5),
  homeroom_number          VARCHAR2(30),
  alphakey_entity          VARCHAR2(11),
  x_default_entity         VARCHAR2(10),
  advisor                  VARCHAR2(10),
  type_student_id          VARCHAR2(3),
  student_status           VARCHAR2(1),
  student_ny_status        VARCHAR2(1),
  student_full_part        VARCHAR2(1),
  student_percent_enrolled NUMBER(8,3),
  student_incl_rank        VARCHAR2(10),
  student_incl_honor_roll  VARCHAR2(10),
  student_hist_grade_level VARCHAR2(2),
  history_entity           VARCHAR2(5),
  prds_attending           VARCHAR2(100),
  student_cy_member        VARCHAR2(10),
  team_schd_id             VARCHAR2(3),
  wgt_schd_add_on          NUMBER(3,2),
  unused_char_1            VARCHAR2(3),
  unused_char_2            VARCHAR2(3),
  unused_int_1             VARCHAR2(10),
  unused_dec_1             NUMBER(10,5),
  dis_officer              VARCHAR2(10),
  cy_team_schd_id          VARCHAR2(3),
  student_entity_id        VARCHAR2(10),
  sif_sten_ref_id          VARCHAR2(32),
  cece_flag                VARCHAR2(10),
  nxt_yr_band_ins_id       VARCHAR2(3),
  cy_schedule_status       VARCHAR2(1),
  ny_schedule_status       VARCHAR2(1),
  ss_entity                VARCHAR2(5),
  ss_sch_yr                VARCHAR2(10),
  cy_schd_cat              VARCHAR2(10),
  ny_schd_cat              VARCHAR2(10),
  x_roll_ss_records        VARCHAR2(10),
  stu_promoted_retained    VARCHAR2(1),
  full_name_lfm            VARCHAR2(60),
  incl_class_count         VARCHAR2(10),
  wa_primary_school        VARCHAR2(3),
  x_signed_activity        VARCHAR2(10),
  auto_schd_priority       VARCHAR2(10),
  se_tchr_of_record        VARCHAR2(10),
  cy_track_reqs            VARCHAR2(10),
  ny_track_reqs            VARCHAR2(10),
  cy_trk_req_grp_id        VARCHAR2(10),
  ny_trk_req_grp_id        VARCHAR2(10),
  part_full_hours          VARCHAR2(1),
  promote_status           VARCHAR2(1),
  promote_status_good      VARCHAR2(2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index CEDARHILL.BMI_ENTITY_ID_SE on CEDARHILL.STUDENT_ENTITY (ENTITY_ID)
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
create index CEDARHILL.BMI_SCHOOL_ID on CEDARHILL.STUDENT_ENTITY (SCHOOL_ID)
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
create index CEDARHILL.BMI_STUDENT_ID_SE on CEDARHILL.STUDENT_ENTITY (STUDENT_ID)
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
create index CEDARHILL.BMI_X_DEFAULT on CEDARHILL.STUDENT_ENTITY (X_DEFAULT_ENTITY)
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
prompt Creating table STUDENT_EW
prompt =========================
prompt
create table CEDARHILL.STUDENT_EW
(
  entity_id                  VARCHAR2(5),
  student_id                 VARCHAR2(10),
  ew_date                    VARCHAR2(14),
  entryc_code                VARCHAR2(3),
  entry_comment              VARCHAR2(50),
  entry_duser_id             VARCHAR2(13),
  withdrawal_date            VARCHAR2(14),
  withdrawal_code            VARCHAR2(3),
  withdrawal_comment         VARCHAR2(50),
  withdrawal_duser_id        VARCHAR2(12),
  district_code              VARCHAR2(7),
  district_state             VARCHAR2(2),
  district_type_id           VARCHAR2(3),
  aid_category_id            VARCHAR2(3),
  grade_level                VARCHAR2(2),
  spec_ed_eval_status_id     VARCHAR2(3),
  last_attn_loc_id           VARCHAR2(3),
  pseo_hours                 VARCHAR2(10),
  percent_enrolled           VARCHAR2(10),
  school_id                  VARCHAR2(5),
  homeroom_number            VARCHAR2(5),
  transportation_id          VARCHAR2(3),
  attendance_days            NUMBER(6,1),
  membership_days            NUMBER(6,1),
  track                      VARCHAR2(10),
  type_student_id            VARCHAR2(12),
  calendar_id                VARCHAR2(5),
  status_end_id              VARCHAR2(3),
  absence_days               VARCHAR2(10),
  withdrawal_school_year     VARCHAR2(10),
  withdrawal_grad_yr         VARCHAR2(10),
  x_withdrawal_retained      VARCHAR2(10),
  withdrawal_code_2          VARCHAR2(3),
  withdrawal_code_3          VARCHAR2(3),
  sped_fte                   NUMBER(7,2),
  unused_char_1              VARCHAR2(5),
  unused_char_2              VARCHAR2(3),
  unused_int_1               VARCHAR2(10),
  unused_int_2               VARCHAR2(10),
  unused_dec_1               NUMBER(10,5),
  unused_dec_2               NUMBER(10,5),
  ew_sif_grade               VARCHAR2(10),
  sif_stew_ref_id            VARCHAR2(32),
  x_withdrawal_advanced      VARCHAR2(10),
  open_enrollment_flag       VARCHAR2(1),
  miles                      NUMBER(7,2),
  in_retained_reason         VARCHAR2(5),
  enrolled_in                VARCHAR2(10),
  enrolled_out               VARCHAR2(10),
  open_enrolled_type         VARCHAR2(30),
  ewh_prds_att               VARCHAR2(100),
  x_withdrawal_default_entit VARCHAR2(100),
  mn_stu_res_sch_num         VARCHAR2(10),
  mn_indep_study             VARCHAR2(10),
  mn_res_schl_id             VARCHAR2(3),
  mn_hom_bnd_srv             VARCHAR2(10),
  obs_mn_trans_dist_num      VARCHAR2(4),
  obs_mn_trans_dist_type     VARCHAR2(3),
  mn_spec_ed_instr_setting   VARCHAR2(2),
  transfer_to_dist           VARCHAR2(30),
  transfer_to_schl           VARCHAR2(4),
  wa_dist_enr_dte_at_wthdrw  VARCHAR2(14),
  residence_status           VARCHAR2(2),
  course_of_study            VARCHAR2(1),
  tn_ineligibility_status    VARCHAR2(10),
  promote_status             VARCHAR2(1),
  withdrawal_reason          VARCHAR2(3),
  promote_status_good        VARCHAR2(2),
  fl_test_schl_id            VARCHAR2(5),
  fl_enroll_schl_id          VARCHAR2(5),
  fl_instruct_schl_id        VARCHAR2(5),
  fl_instruct_distr          VARCHAR2(7),
  fl_test_distr              VARCHAR2(7)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index CEDARHILL.BMI_ENTITY_ID on CEDARHILL.STUDENT_EW (ENTITY_ID)
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
create index CEDARHILL.BMI_EW_DATE on CEDARHILL.STUDENT_EW (EW_DATE)
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
create index CEDARHILL.BMI_STUDENT_ID on CEDARHILL.STUDENT_EW (STUDENT_ID)
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
prompt Creating table STUDENT_EXT
prompt ==========================
prompt
create table CEDARHILL.STUDENT_EXT
(
  student_id                 VARCHAR2(10),
  tea_stu_id                 VARCHAR2(9),
  last_peims_sub_1_stu_id    VARCHAR2(9),
  last_peims_sub_3_stu_id    VARCHAR2(9),
  last_peims_sub_4_stu_id    VARCHAR2(9),
  use_state_assigned_id_flag VARCHAR2(10),
  bilingual                  VARCHAR2(5),
  esl                        VARCHAR2(10),
  gifted_talented            VARCHAR2(10),
  preg_rel_svcs              VARCHAR2(10),
  pep                        VARCHAR2(10),
  voc_ed                     VARCHAR2(10),
  spec_ed                    VARCHAR2(20),
  lep_ind_code               VARCHAR2(10),
  home_lang_code             VARCHAR2(2),
  par_perm_code              VARCHAR2(10),
  grad_type_code             VARCHAR2(2),
  coll_ent_ind_code          VARCHAR2(10),
  career_tech_ind_code       VARCHAR2(10),
  sgl_par_preg_teen_code     VARCHAR2(10),
  wrk_stdy_voc_supt_svc      VARCHAR2(10),
  day_care_voc_supt_srv      VARCHAR2(10),
  trns_voc_supt_svc          VARCHAR2(10),
  pri_disability             VARCHAR2(2),
  sec_disability             VARCHAR2(2),
  ter_disability             VARCHAR2(2),
  mult_disabled              VARCHAR2(10),
  chld_cnt_fund_type         VARCHAR2(10),
  ard_date                   VARCHAR2(14),
  parent_participation       VARCHAR2(10),
  ard_type                   VARCHAR2(3),
  iep_date                   VARCHAR2(14),
  eys_student                VARCHAR2(10),
  grad_plan                  VARCHAR2(10),
  indv_trans_plan            VARCHAR2(10),
  adapt_pe                   VARCHAR2(10),
  behavior_mgmt_plan         VARCHAR2(10),
  medicaid_elig              VARCHAR2(10),
  medicaid_parent_notify     VARCHAR2(10),
  stu_attr_code              VARCHAR2(2),
  campus_id_res              VARCHAR2(9),
  at_risk_ind                VARCHAR2(10),
  econ_disad_code            VARCHAR2(2),
  migrant_ind_code           VARCHAR2(10),
  immigrant_ind_code         VARCHAR2(10),
  eoc_algebra                VARCHAR2(10),
  eoc_algebra_yr             VARCHAR2(10),
  eoc_biology                VARCHAR2(10),
  eoc_biology_yr             VARCHAR2(10),
  eoc_english                VARCHAR2(10),
  eoc_english_yr             VARCHAR2(10),
  eoc_ushist                 VARCHAR2(10),
  eoc_ushist_yr              VARCHAR2(10),
  taas_array                 VARCHAR2(40),
  campus_id_acct             VARCHAR2(9),
  opt_extnd_year_pgm         VARCHAR2(10),
  ny_instr_setting_code      VARCHAR2(10),
  ssi_pro_ret_code           VARCHAR2(2),
  even_str_ind_cd            VARCHAR2(10),
  bil_esl_ss_ind_cd          VARCHAR2(10),
  taks_array                 VARCHAR2(45),
  tx_grant_elig              VARCHAR2(10),
  grant_eligible             VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STUDENT_FAMILY
prompt =============================
prompt
create table CEDARHILL.STUDENT_FAMILY
(
  student_id          VARCHAR2(10),
  family_number       VARCHAR2(10),
  family_id           VARCHAR2(10),
  rcv_report_cards    VARCHAR2(10),
  rcv_forms           VARCHAR2(10),
  obs_relationship_id VARCHAR2(5)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_VACINATION
prompt =================================
prompt
create table CEDARHILL.STUDENT_VACINATION
(
  student_id             VARCHAR2(10),
  hlt_vacination_id      VARCHAR2(50),
  vacination_no          VARCHAR2(10),
  vacination_date        VARCHAR2(14),
  vacination_dosage      NUMBER(7,2),
  vacination_comment     VARCHAR2(120),
  hlt_vacination_dose_id VARCHAR2(3),
  vacination_lot_nbr     VARCHAR2(15),
  hlt_vac_waiver_id      VARCHAR2(3),
  vacination_note        VARCHAR2(120),
  char_fld               VARCHAR2(200),
  date_fld               VARCHAR2(100),
  int_fld                VARCHAR2(100),
  dec_fld                VARCHAR2(100),
  log_fld                VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STU_CLS_CRDT_HST
prompt ===============================
prompt
create table CEDARHILL.STU_CLS_CRDT_HST
(
  scch_gpa_nbr         VARCHAR2(2),
  cor_num_id           VARCHAR2(20),
  track                VARCHAR2(10),
  clas_section         VARCHAR2(10),
  scch_add_on_gpa      VARCHAR2(20),
  scch_duser_name_id   VARCHAR2(20),
  scch_date_upd        VARCHAR2(14),
  scch_time_upd        VARCHAR2(20),
  scch_earnd_crdts_tot NUMBER(9,5),
  student_id           VARCHAR2(20),
  scch_faild_crdts_tot NUMBER(9,5),
  scch_gpa_crdts_tot   NUMBER(9,5),
  scch_gpa_pnts_tot    NUMBER(9,5),
  scch_cit_earn_crds   VARCHAR2(600),
  scch_cit_fail_crds   VARCHAR2(600),
  scch_mid_earn_crds   VARCHAR2(300),
  scch_mid_fail_crds   VARCHAR2(3000),
  scch_trm_earn_crds   VARCHAR2(300),
  scch_trm_fail_crds   VARCHAR2(300),
  scch_sem_earn_crds   VARCHAR2(100),
  scch_sem_fail_crds   VARCHAR2(100),
  scch_update_method   VARCHAR2(50),
  scch_grad_req_crdts  VARCHAR2(20)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STU_GRADE_CUM
prompt ============================
prompt
create table CEDARHILL.STU_GRADE_CUM
(
  student_id           VARCHAR2(10),
  entity_id            VARCHAR2(5),
  sgc_school_year      VARCHAR2(10),
  sgc_gpa_nbr          VARCHAR2(1),
  sgc_cum_type         VARCHAR2(5),
  sgc_cum_type_nbr     VARCHAR2(10),
  sgc_origin_entity_id VARCHAR2(5),
  sgc_rec_type         VARCHAR2(3),
  sgc_gpa_crdts        VARCHAR2(20),
  sgc_gpa_pnts         VARCHAR2(20),
  sgc_gpa_bns_pnts     VARCHAR2(20),
  sgc_gpa_gpa          VARCHAR2(20),
  sgc_add_on_gpa       VARCHAR2(20),
  sgc_add_on_gpa_div   VARCHAR2(20),
  sgc_gpa_with_add_on  VARCHAR2(20),
  sgc_earnd_crdts      VARCHAR2(20),
  sgc_faild_crdts      VARCHAR2(20),
  sgc_incl_rank        VARCHAR2(10),
  sgc_rank             VARCHAR2(10),
  sgc_nbr_in_rank      VARCHAR2(10),
  sgc_rank_value       NUMBER(9,4),
  sgc_rank_date        VARCHAR2(14),
  sgc_grad_year        VARCHAR2(10),
  grading_period_id    VARCHAR2(10),
  duser_name_id        VARCHAR2(10),
  sgc_date_upd         VARCHAR2(14),
  sgc_time_upd         VARCHAR2(10),
  sgc_api_cme_wgt_fact VARCHAR2(10),
  sgc_api_use_wgt_fact VARCHAR2(10),
  sgc_api_sme_wgt_fact VARCHAR2(10),
  sgc_rank_time        VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table T040
prompt ===================
prompt
create table CEDARHILL.T040
(
  school_year NUMBER(11),
  submission  NUMBER(11),
  e0755       VARCHAR2(6),
  e0212       VARCHAR2(12),
  e0505       VARCHAR2(18),
  e0703       VARCHAR2(34),
  e0704       VARCHAR2(28),
  e0705       VARCHAR2(50),
  e0706       VARCHAR2(2),
  e0004       VARCHAR2(2),
  e0005       VARCHAR2(2),
  e0130       VARCHAR2(4),
  e0730       VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TERM_DEFINITION
prompt ==============================
prompt
create table CEDARHILL.TERM_DEFINITION
(
  entity_id        VARCHAR2(10),
  school_year      NUMBER,
  semester_nbr     NUMBER,
  term_nbr         NUMBER,
  semester_desc    VARCHAR2(40),
  term_desc        VARCHAR2(40),
  schd_trm_str     NUMBER,
  schd_trm_stp     NUMBER,
  live             VARCHAR2(1),
  semester_lit     VARCHAR2(6),
  term_lit         VARCHAR2(10),
  track            NUMBER,
  sem_trm_str_date DATE,
  sem_trm_stp_date DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TITLE_I_PART_A
prompt =============================
prompt
create table CEDARHILL.TITLE_I_PART_A
(
  student_id               VARCHAR2(10),
  title_i_parta_ind        VARCHAR2(1),
  school_year              VARCHAR2(10),
  homeless_ind             VARCHAR2(1),
  reading_ind              VARCHAR2(1),
  mathematics_ind          VARCHAR2(1),
  science_ind              VARCHAR2(1),
  social_studies_ind       VARCHAR2(1),
  guidance_counseling_ind  VARCHAR2(1),
  social_work_services_ind VARCHAR2(1),
  health_services_ind      VARCHAR2(1),
  entity_id                VARCHAR2(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ZIP
prompt ==================
prompt
create table CEDARHILL.ZIP
(
  zip_code  VARCHAR2(12),
  zip_city  VARCHAR2(40),
  zip_state VARCHAR2(4)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating view V_EMP_DEMOGRAPHIC
prompt ===============================
prompt
create or replace force view cedarhill.v_emp_demographic as
Select "NAME_ID","TOTAL_EXP","DISTRICT_EXP","FIS_YEAR","RANK" from (select NAME_ID, TOTAL_EXP, DISTRICT_EXP, FIS_YEAR, 
    rank() over (partition by NAME_ID order by  FIS_YEAR desc) as rank 
from ftx_emp_demographic
)
where rank=1;

prompt
prompt Creating view V_ENROLLED_STUDENTS
prompt =================================
prompt
create or replace force view cedarhill.v_enrolled_students as
Select
Student_id,entity_id,
ew_date,
Case when withdrawal_date is null
          then to_char(sysdate,'YYYY-MM-DD')
          else withdrawal_date end as withdrawal_date,
rank() over(partition by student_id order by ew_date desc,entity_id desc) as ranktrans

from STUDENT_EW
where ew_date >= '2010-08-23'
and ew_date <= to_char(sysdate,'YYYY-MM-DD')
and (withdrawal_date <= to_char(sysdate,'YYYY-MM-DD') or (Withdrawal_date is null));

prompt
prompt Creating view V_STUD_GRADE_MRKS
prompt ===============================
prompt
CREATE OR REPLACE FORCE VIEW CEDARHILL.V_STUD_GRADE_MRKS AS
SELECT
student.SCHOOL_ID,
grade_mrks.ENTITY_ID,
grade_mrks.STUDENT_ID,
grade_mrks.COR_NUM_ID,
grade_mrks.CLAS_SECTION,
grade_mrks.SCHD_RECORD_TYPE,
grade_mrks.SCHD_STATUS,
grade_mrks.GRD_CITIZEN_MRK,
grade_mrks.SCHOOL_YEAR,
grade_mrks.GRADE_MARK,
grade_mrks.TERM_CODE,
grade_mrks.TERM_DESC,
grade_mrks.TERM_ORDER,
grade_mrks.EARNED_CRDS_MARK,
grade_mrks.FAILED_CRDS_MARK,
student.GRAD_YR

FROM
STUDENT student,
DW.DATE_DIM date_dim,
(SELECT
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_TRM_MRK > ' ' THEN GRD_TRM_MRK
    ELSE NULL
END AS grade_mark,
'TM' AS term_code,
'MARKING PERIOD' AS term_desc, 
2 AS term_order, 
GRD_TRM_EARN_CRDS AS EARNED_CRDS_MARK,
GRD_TRM_FAIL_CRDS AS FAILED_CRDS_MARK

FROM STUDENT_CLASS

UNION 

SELECT 
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_MID_TRM_MRK > ' ' THEN GRD_MID_TRM_MRK
    ELSE NULL
END AS grade_mark,
'MT' AS term_code,
'PROGRESS REPORT' AS term_desc,
1 AS term_order,
GRD_MID_EARN_CRDS AS EARNED_CRDS_MARK,
GRD_MID_FAIL_CRDS AS FAILED_CRDS_MARK

FROM STUDENT_CLASS

UNION 

SELECT 
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_FNL_MRK > ' ' THEN GRD_FNL_MRK
    ELSE NULL
END AS grade_mark,
'FM' AS term_code,
'FINAL' AS term_desc,
5 AS term_order,
NULL AS EARNED_CRDS_MARK,
NULL AS FAILED_CRDS_MARK 

FROM STUDENT_CLASS

UNION 

SELECT 
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_FNL_EXM_MRK > ' ' THEN GRD_FNL_EXM_MRK
    ELSE NULL
END AS grade_mark,
'FE' AS term_code,
'EXAM' AS term_desc,
6 AS term_order,
NULL AS EARNED_CRDS_MARK,
NULL AS FAILED_CRDS_MARK 

FROM STUDENT_CLASS

UNION 

SELECT 
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_SEM_EXM_MRK > ' ' THEN GRD_SEM_EXM_MRK
    ELSE NULL
END AS grade_mark,
'SE' AS term_code,
'EXAM' AS term_desc,
4 AS term_order,
NULL AS EARNED_CRDS_MARK,
NULL AS FAILED_CRDS_MARK  

FROM STUDENT_CLASS

UNION 

SELECT 
ENTITY_ID,
STUDENT_ID,
COR_NUM_ID,
CLAS_SECTION,
SCHD_RECORD_TYPE,
SCHD_STATUS,
CASE
    WHEN GRD_CITIZEN_MRK > ' ' THEN GRD_CITIZEN_MRK
    ELSE NULL
END AS grd_citizen_mrk,
SCHOOL_YEAR,
CASE
    WHEN GRD_SEM_MRK > ' ' THEN GRD_SEM_MRK
    ELSE NULL
END AS grade_mark,
'ST' AS term_code,
'SEMESTER' AS term_desc,
3 AS term_order,
GRD_SEM_EARN_CRDS AS EARNED_CRDS_MARK,
GRD_SEM_FAIL_CRDS AS FAILED_CRDS_MARK

FROM STUDENT_CLASS
) grade_mrks

WHERE student.STUDENT_ID = grade_mrks.STUDENT_ID
AND date_dim.DATE_SID = to_char(sysdate, 'YYYYMMDD')
AND grade_mrks.SCHOOL_YEAR = to_number(date_dim.SCHL_YEAR);

prompt
prompt Creating view V_T040
prompt ====================
prompt
create or replace force view cedarhill.v_t040 as
Select "SCHOOL_YEAR","E0730","E0505","RANK","E0212" from (select School_year,e0730 ,e0505 ,
    rank() over (partition by e0505 order by  School_year desc) as rank ,e0212
    from T040
    )
    where rank=1;

prompt
prompt Creating function FN_CURRENT_GRADE
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION CEDARHILL."FN_CURRENT_GRADE" (p_student_id IN varchar2)

return varchar2
is

    v_cur_grd varchar2(10);
    v_cur_yr number;

begin 

    v_cur_grd := '';
    select distinct to_number(schl_year)
                into v_cur_yr
                from dw.date_dim date_dim
                where date_dim.date_sid = to_char(sysdate, 'YYYYMMDD');


    select case
                when (12 - (student.grad_yr - v_cur_yr)) < -1 then 'EE'
                when (12 - (student.grad_yr - v_cur_yr)) = -1 then 'PK'
                when (12 - (student.grad_yr - v_cur_yr)) = 0 then 'KG'
                else lpad(to_char((12 - (student.grad_yr - v_cur_yr))),2,'0')
           end
    into v_cur_grd
    from
        student student
    where
        student.student_id = p_student_id;

    return v_cur_grd;
end;
/

prompt
prompt Creating function FN_CURR_SCHL_YR
prompt =================================
prompt
CREATE OR REPLACE FUNCTION CEDARHILL."FN_CURR_SCHL_YR"
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
prompt Creating function FN_EMPTY_ARRAY
prompt ================================
prompt
CREATE OR REPLACE FUNCTION CEDARHILL."FN_EMPTY_ARRAY" (p_valarray IN VARCHAR2)
RETURN NUMBER
IS
wrkarray VARCHAR2(4026);

BEGIN

wrkarray := p_valarray;
wrkarray := replace(translate(wrkarray,';',' '),' ','');

IF wrkarray IS NULL THEN
    RETURN 1;
ELSE
    RETURN 0;
END IF;
END;
/

prompt
prompt Creating function FN_GET_VALUE
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION CEDARHILL."FN_GET_VALUE" (p_levelno IN NUMBER, p_valsep IN VARCHAR2, p_valarray IN VARCHAR2)
RETURN VARCHAR2
IS
begpos NUMBER(4);
endpos NUMBER(4);
strlength NUMBER(4);
wrkarray VARCHAR2(4000);

BEGIN

strlength := 0;
begpos := 0;
endpos := 0;
wrkarray := NULL;
wrkarray := replace(p_valarray,' ','');

IF (p_levelno > 0) AND (wrkarray IS NOT NULL) THEN
    endpos := instr(wrkarray, p_valsep, 1, p_levelno);              -- Ending position is position of p_valsep
END IF;

IF (p_levelno < 1) OR (p_levelno IS NULL) OR (wrkarray IS NULL) THEN                                            
    RETURN NULL;                                                    -- Invalid p_levelno or p_valarray so return nothing
ELSIF (p_levelno = 1) THEN                                           
    begpos := 1;                                                    -- begpos to retrieve the first element in the array                                              
ELSIF (endpos = 0) THEN
    begpos := instr(wrkarray, p_valsep, 1,(p_levelno - 1));         -- begpos to retrieve the last or only element in the array
    IF (begpos > 0) AND (begpos < length(wrkarray)) THEN        
       begpos := begpos + 1;                                    
    END IF;
ELSE
    begpos := instr(wrkarray, p_valsep, 1,(p_levelno - 1)) + 1;     -- begpos to retrieve element from in the middle of the array
END IF;

IF (endpos = 0)  THEN                                           
    strlength := length(wrkarray);                                  -- Calculate strlength to get the last or only element in the array
    IF (begpos = 0) OR (begpos = strlength) THEN 
       strlength := 0;                                              -- No element in the array; reset strlength  
    END IF;                           
ELSE   
    strlength := endpos - begpos;                                   -- Element in the array; calculate the strlength
END IF;

IF (strlength = 0) THEN
    RETURN NULL;                                                    -- Nothing there so return nothing
ELSE 
    RETURN ( substr(wrkarray, begpos, strlength) );                 -- Return array element
END IF;

END;
/

prompt
prompt Creating function FN_GET_ARRAY_COUNT
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION CEDARHILL.FN_GET_ARRAY_COUNT(p_array_limit IN NUMBER, p_valsep IN VARCHAR2, p_valarray IN VARCHAR2)
RETURN NUMBER
IS

endpos NUMBER(4);
wrkarray VARCHAR2(4000);
v_counter NUMBER;
v_total NUMBER;

BEGIN


endpos := 0;
v_total := 0;

wrkarray := replace(p_valarray,' ','');
v_counter := 1;

IF wrkarray IS NOT NULL THEN
    endpos := p_array_limit;              -- Ending position is position of p_valsep
END IF;

IF wrkarray IS NOT NULL THEN
    while v_counter <= endpos  loop 
          if fn_get_value(v_counter,p_valsep,wrkarray) IS NOT NULL then
             v_total := v_total + 1;
          end if;
          v_counter := v_counter + 1;
    end loop;
end if;

return v_total;

end FN_GET_ARRAY_COUNT;
/


spool off
