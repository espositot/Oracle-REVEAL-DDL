-----------------------------------------------------------
-- Export file for user SDM@DATAWH                       --
-- Created by espositot on 5/26/2016, 16:27:21 16:27:21  --
-----------------------------------------------------------

set define off
spool sdm_ddl.log

prompt
prompt Creating table ABSENCE_FACT
prompt ===========================
prompt
create table SDM.ABSENCE_FACT
(
  loc_county_dist_id   VARCHAR2(6) not null,
  record_type          VARCHAR2(1) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  period               VARCHAR2(8) not null,
  event_type           VARCHAR2(20),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  conformed_event_type VARCHAR2(30),
  ada_cnt              NUMBER(2,1)
)
partition by range (DATE_SID)
(
  partition CATCH_111111_All values less than (297910)
    tablespace DW_DEFAULT01
    pctfree 0
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PAST values less than (309234)
    tablespace DW_DEFAULT01
    pctfree 0
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PRIOR values less than (309599)
    tablespace DW_DEFAULT01
    pctfree 0
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_CURRENT values less than (316539)
    tablespace DW_DEFAULT01
    pctfree 0
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition CATCH_999999_All values less than (99999999)
    tablespace DW_DEFAULT01
    pctfree 0
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
create bitmap index SDM.BMI_P_CDC_ABS_FACT on SDM.ABSENCE_FACT (LOC_COUNTY_DIST_ID)
  nologging  local;
create bitmap index SDM.BMI_P_DATE_SID_ABS_FACT on SDM.ABSENCE_FACT (DATE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_LOC_SID_ABS_FACT on SDM.ABSENCE_FACT (LOC_SID)
  nologging  local;
create bitmap index SDM.BMI_P_STU_SID_ABS_FACT on SDM.ABSENCE_FACT (STU_SID)
  nologging  local;

prompt
prompt Creating table ABSENCE_FACT_PART_MOVE
prompt =====================================
prompt
create table SDM.ABSENCE_FACT_PART_MOVE
(
  loc_county_dist_id   VARCHAR2(6) not null,
  record_type          VARCHAR2(1) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  period               VARCHAR2(8) not null,
  event_type           VARCHAR2(20),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  conformed_event_type VARCHAR2(30),
  ada_cnt              NUMBER(2,1)
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
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
prompt Creating table ABSENCE_FACT_PRIORYR
prompt ===================================
prompt
create table SDM.ABSENCE_FACT_PRIORYR
(
  loc_county_dist_id   VARCHAR2(6) not null,
  record_type          VARCHAR2(1) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  period               VARCHAR2(8) not null,
  event_type           VARCHAR2(20),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  ada_cnt              NUMBER(2,1),
  conformed_event_type VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ABSENCE_FACT_TEMP
prompt ================================
prompt
create table SDM.ABSENCE_FACT_TEMP
(
  loc_county_dist_id   VARCHAR2(6) not null,
  record_type          VARCHAR2(1) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  period               VARCHAR2(8) not null,
  event_type           VARCHAR2(20),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  conformed_event_type VARCHAR2(30),
  ada_cnt              NUMBER(2,1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ABSENCE_SUMMARY_FACT
prompt ===================================
prompt
create table SDM.ABSENCE_SUMMARY_FACT
(
  record_key         VARCHAR2(50) not null,
  loc_county_dist_id VARCHAR2(6) not null,
  date_sid           NUMBER(8) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  day_abs_cnt        NUMBER(7),
  day_non_cnt        NUMBER(7),
  day_non_prd_cnt    NUMBER(7),
  day_abs_prd_cnt    NUMBER(7),
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
create bitmap index SDM.BMI_STU_SID_ABS_SUM_FACT on SDM.ABSENCE_SUMMARY_FACT (STU_SID)
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
prompt Creating table ABS_FACT_MISSING_ENRL
prompt ====================================
prompt
create table SDM.ABS_FACT_MISSING_ENRL
(
  loc_county_dist_id   VARCHAR2(6) not null,
  record_type          VARCHAR2(1) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  period               VARCHAR2(8) not null,
  event_type           VARCHAR2(20),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  conformed_event_type VARCHAR2(30),
  ada_cnt              NUMBER(2,1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table COURSE_DIM
prompt =========================
prompt
create table SDM.COURSE_DIM
(
  course_sid                   NUMBER(6) not null,
  loc_county_dist_id           VARCHAR2(6) not null,
  course_key                   VARCHAR2(35) not null,
  school_year                  NUMBER(4) not null,
  course_id                    VARCHAR2(15) not null,
  course_ext                   VARCHAR2(5),
  course_desc                  VARCHAR2(60),
  course_type                  VARCHAR2(25),
  first_elgbl_grd              VARCHAR2(2),
  last_elgbl_grd               VARCHAR2(2),
  course_adopted_dt            VARCHAR2(21),
  course_updated_dt            VARCHAR2(21),
  course_deleted_dt            VARCHAR2(21),
  course_dept                  VARCHAR2(20),
  course_subject_area          VARCHAR2(25),
  state_course_cd              VARCHAR2(10),
  state_course_desc            VARCHAR2(150),
  create_dt                    DATE not null,
  last_updt_dt                 DATE not null,
  eff_start_dt                 DATE,
  eff_end_dt                   DATE,
  cur_indicator                VARCHAR2(1) not null,
  conformed_course_type        VARCHAR2(20),
  conformed_department         VARCHAR2(30),
  conformed_subject            VARCHAR2(50),
  conformed_course_description VARCHAR2(150)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.COURSE_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.COURSE_DIM.course_key
  is 'COURSE KEY indicates the key that defines the course record.';
comment on column SDM.COURSE_DIM.school_year
  is 'SCHOOL YEAR indicates the ending year for the school year range for which this record is valid.';
comment on column SDM.COURSE_DIM.course_id
  is 'COURSE ID indicates the actual physical ID that identifies the unique course number for the school.';
comment on column SDM.COURSE_DIM.course_ext
  is 'COURSE EXTENSION indicates the course extension of the Course ID.';
comment on column SDM.COURSE_DIM.course_desc
  is 'COURSE DESCRIPTION identifies the description of the course as it appears in the scholastic course guide for the district.';
comment on column SDM.COURSE_DIM.course_type
  is 'COURSE TYPE indicates the type of scholastic program to which this course is connected.';
comment on column SDM.COURSE_DIM.first_elgbl_grd
  is 'COURSE FIRST ELIGIBLE GRADE is the grade level for which this course if first made available.';
comment on column SDM.COURSE_DIM.last_elgbl_grd
  is 'COURSE LAST ELIGIBLE GRADE is the grade level for which this course is last made available.';
comment on column SDM.COURSE_DIM.course_adopted_dt
  is 'COURSE ADOPTED DATE indicates the date the course was adopted in the district within the current school year.';
comment on column SDM.COURSE_DIM.course_updated_dt
  is 'COURSE UPDATED DATE indicates the date on which the course was updated in the district within the current school year.';
comment on column SDM.COURSE_DIM.course_deleted_dt
  is 'COURSE REMOVED DATE indicates the date on which the course was deleted from the district''s list of available courses with the current school year.';
comment on column SDM.COURSE_DIM.course_dept
  is 'DEPARTMENT indicates the primary department to which the course is assigned.';
comment on column SDM.COURSE_DIM.course_subject_area
  is 'COURSE SUBJECT AREA indicates the subject area of the course.';
comment on column SDM.COURSE_DIM.state_course_cd
  is 'STATE COURSE CD indicates the PEIMS Service ID Code.';
comment on column SDM.COURSE_DIM.state_course_desc
  is 'STATE COURSE DESC indicates the description of the PEIMS Service ID code.';
create bitmap index SDM.BMI_CDC_COURSE_DIM on SDM.COURSE_DIM (LOC_COUNTY_DIST_ID)
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
alter table SDM.COURSE_DIM
  add constraint PK_COURSE_DIM primary key (COURSE_SID)
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
alter index SDM.PK_COURSE_DIM nologging;

prompt
prompt Creating table CURRENT_INSERTS_TBL
prompt ==================================
prompt
create table SDM.CURRENT_INSERTS_TBL
(
  district_id VARCHAR2(10),
  insert_cnt  NUMBER,
  table_name  VARCHAR2(100),
  process_dt  VARCHAR2(30),
  create_dt   DATE default sysdate
)
tablespace DW_DEFAULT01
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
prompt Creating table CURRENT_REJECTS_TBL
prompt ==================================
prompt
create table SDM.CURRENT_REJECTS_TBL
(
  district_id VARCHAR2(10),
  reason      VARCHAR2(1000),
  reject_cnt  NUMBER,
  table_name  VARCHAR2(100),
  process_dt  VARCHAR2(30),
  create_dt   DATE default sysdate
)
tablespace DW_DEFAULT01
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
prompt Creating table CUR_REJ_ENROLLMENT_FACT
prompt ======================================
prompt
create table SDM.CUR_REJ_ENROLLMENT_FACT
(
  "reason"           VARCHAR2(255 CHAR) not null,
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  loc_sid            VARCHAR2(15 CHAR) not null,
  stu_sid            VARCHAR2(40 CHAR) not null,
  date_sid           VARCHAR2(15 CHAR),
  process_dt         VARCHAR2(10 CHAR),
  inactive_record    NUMBER(5),
  cnt                NUMBER(5),
  ada_enr_cnt        NUMBER(10,1),
  stu_lep_code       VARCHAR2(2 CHAR),
  stu_race           VARCHAR2(1 CHAR),
  stu_free_redu_lnch NUMBER(5),
  stu_cur_grd_lvl    VARCHAR2(25 CHAR),
  stu_primary_ese_cd VARCHAR2(2 CHAR),
  race_ethnicity_sid NUMBER(5)
)
tablespace DW_DEFAULT01
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
prompt Creating table DATE_DIM
prompt =======================
prompt
create table SDM.DATE_DIM
(
  district_id                 VARCHAR2(6) not null,
  district_sid                NUMBER(4) not null,
  date_sid                    NUMBER(8) not null,
  date_id                     DATE not null,
  date_key                    VARCHAR2(15) not null,
  calendar_month              VARCHAR2(2) not null,
  calendar_month_name         VARCHAR2(9) not null,
  calendar_month_short_name   VARCHAR2(3) not null,
  calendar_quarter            VARCHAR2(1) not null,
  calendar_week               VARCHAR2(2) not null,
  calendar_year               VARCHAR2(4) not null,
  calendar_year_month         VARCHAR2(6) not null,
  calendar_year_quarter       VARCHAR2(7) not null,
  day_of_week                 VARCHAR2(1) not null,
  day_of_week_name            VARCHAR2(9) not null,
  day_of_week_short_name      VARCHAR2(3) not null,
  fiscal_period               VARCHAR2(2),
  fiscal_quarter              VARCHAR2(1),
  fiscal_year                 VARCHAR2(4),
  fiscal_year_quarter         VARCHAR2(7),
  long_date                   VARCHAR2(18) not null,
  school_day_indicator        VARCHAR2(13),
  school_week                 VARCHAR2(2),
  school_year                 VARCHAR2(4) not null,
  school_year_description     VARCHAR2(9) not null,
  semester                    VARCHAR2(1),
  short_date                  VARCHAR2(10) not null,
  snapshot_date_indicator     VARCHAR2(3),
  weekly_enrollment_date_flag VARCHAR2(3),
  most_recent_enrollment_flag VARCHAR2(3),
  year_month_day              VARCHAR2(8) not null,
  academic_6_weeks            VARCHAR2(1),
  academic_9_weeks            VARCHAR2(1),
  academic_day                NUMBER(3),
  academic_week               VARCHAR2(2),
  first_day_academic_6_weeks  VARCHAR2(3),
  last_day_academic_6_weeks   VARCHAR2(3),
  first_day_academic_9_weeks  VARCHAR2(3),
  last_day_academic_9_weeks   VARCHAR2(3),
  first_day_semester          VARCHAR2(3),
  last_day_semester           VARCHAR2(3),
  discipline_reporting_period VARCHAR2(1),
  day_desc                    VARCHAR2(28),
  day_nbr                     NUMBER(2),
  day_short_desc              VARCHAR2(16),
  dow_desc                    VARCHAR2(9),
  dow_nbr                     NUMBER(1),
  dow_short_desc              VARCHAR2(3),
  julian_dt                   NUMBER(7),
  month_desc                  VARCHAR2(9),
  month_id                    NUMBER(6),
  month_nbr                   NUMBER(2),
  month_short_desc            VARCHAR2(3),
  schl_week                   NUMBER(2),
  schl_year                   NUMBER(4),
  schl_year_desc              VARCHAR2(9),
  week_num                    NUMBER(2),
  year_desc                   VARCHAR2(6),
  year_id                     NUMBER(4),
  yyyymmdd                    VARCHAR2(8)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index SDM.DATE_DIM_IX1 on SDM.DATE_DIM (DISTRICT_SID)
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
create bitmap index SDM.DATE_DIM_IX2 on SDM.DATE_DIM (DATE_ID)
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
create bitmap index SDM.DATE_DIM_IX3 on SDM.DATE_DIM (CALENDAR_MONTH)
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
create bitmap index SDM.DATE_DIM_IX4 on SDM.DATE_DIM (CALENDAR_MONTH_NAME)
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
create bitmap index SDM.DATE_DIM_IX5 on SDM.DATE_DIM (CALENDAR_MONTH_SHORT_NAME)
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
create bitmap index SDM.DATE_DIM_IX6 on SDM.DATE_DIM (CALENDAR_YEAR)
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
create bitmap index SDM.DATE_DIM_IX7 on SDM.DATE_DIM (FISCAL_PERIOD)
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
create bitmap index SDM.DATE_DIM_IX8 on SDM.DATE_DIM (FISCAL_QUARTER)
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
create bitmap index SDM.DATE_DIM_IX9 on SDM.DATE_DIM (FISCAL_YEAR)
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
create bitmap index SDM.DATE_DIM_IXA on SDM.DATE_DIM (SCHOOL_DAY_INDICATOR)
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
create bitmap index SDM.DATE_DIM_IXB on SDM.DATE_DIM (SCHOOL_WEEK)
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
create bitmap index SDM.DATE_DIM_IXC on SDM.DATE_DIM (SCHOOL_YEAR)
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
create bitmap index SDM.DATE_DIM_IXD on SDM.DATE_DIM (SEMESTER)
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
create bitmap index SDM.DATE_DIM_IXE on SDM.DATE_DIM (SNAPSHOT_DATE_INDICATOR)
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
create bitmap index SDM.DATE_DIM_IXF on SDM.DATE_DIM (WEEKLY_ENROLLMENT_DATE_FLAG)
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
create bitmap index SDM.DATE_DIM_IXG on SDM.DATE_DIM (MOST_RECENT_ENROLLMENT_FLAG)
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
create bitmap index SDM.DATE_DIM_IXH on SDM.DATE_DIM (YEAR_MONTH_DAY)
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
create bitmap index SDM.DATE_DIM_IXI on SDM.DATE_DIM (ACADEMIC_6_WEEKS)
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
create bitmap index SDM.DATE_DIM_IXJ on SDM.DATE_DIM (ACADEMIC_9_WEEKS)
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
create bitmap index SDM.DATE_DIM_IXK on SDM.DATE_DIM (ACADEMIC_DAY)
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
create bitmap index SDM.DATE_DIM_IXL on SDM.DATE_DIM (ACADEMIC_WEEK)
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
create bitmap index SDM.DATE_DIM_IXM on SDM.DATE_DIM (YYYYMMDD)
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
create bitmap index SDM.DATE_DIM_IXN on SDM.DATE_DIM (MONTH_ID)
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
create bitmap index SDM.DATE_DIM_IXO on SDM.DATE_DIM (MONTH_NBR)
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
create bitmap index SDM.DATE_DIM_IXP on SDM.DATE_DIM (SCHL_WEEK)
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
create bitmap index SDM.DATE_DIM_IXQ on SDM.DATE_DIM (SCHL_YEAR)
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
create bitmap index SDM.DATE_DIM_IXR on SDM.DATE_DIM (YEAR_ID)
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
create bitmap index SDM.DATE_DIM_IXT on SDM.DATE_DIM (MONTH_DESC)
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
create bitmap index SDM.DATE_DIM_IXU on SDM.DATE_DIM (WEEK_NUM)
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
create bitmap index SDM.DATE_DIM_IXV on SDM.DATE_DIM (YEAR_DESC)
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
create bitmap index SDM.DATE_DIM_IXW on SDM.DATE_DIM (DISTRICT_ID)
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
create unique index SDM.UI_DATE_DIM_PK on SDM.DATE_DIM (DATE_SID)
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
alter table SDM.DATE_DIM
  add constraint DATE_DIM_PK primary key (DATE_SID);
grant select on SDM.DATE_DIM to PUBLIC;

prompt
prompt Creating table DATE_DIM_NEW
prompt ===========================
prompt
create table SDM.DATE_DIM_NEW
(
  date_id           DATE,
  year_id           NUMBER,
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
  schl_year         NUMBER,
  fiscal_year       VARCHAR2(80 CHAR),
  fiscal_period     VARCHAR2(80 CHAR),
  schl_year_desc    VARCHAR2(255 CHAR),
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
  date_sid          INTEGER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table DATE_DIM_ORIG
prompt ============================
prompt
create table SDM.DATE_DIM_ORIG
(
  date_id           DATE not null,
  year_id           NUMBER,
  month_id          NUMBER,
  year_desc         VARCHAR2(255 CHAR),
  month_nbr         NUMBER,
  month_desc        VARCHAR2(255 CHAR),
  month_short_desc  VARCHAR2(255 CHAR),
  day_nbr           NUMBER,
  day_desc          VARCHAR2(255 CHAR) not null,
  day_short_desc    VARCHAR2(255 CHAR),
  dow_nbr           NUMBER,
  dow_desc          VARCHAR2(255 CHAR),
  dow_short_desc    VARCHAR2(255 CHAR),
  julian_dt         NUMBER,
  schl_year         NUMBER,
  fiscal_year       VARCHAR2(80 CHAR),
  fiscal_period     VARCHAR2(80 CHAR),
  schl_year_desc    VARCHAR2(255 CHAR),
  elem_grd_period   VARCHAR2(255 CHAR),
  middle_grd_period VARCHAR2(255 CHAR),
  high_grd_period   VARCHAR2(255 CHAR),
  adult_grd_period  NUMBER,
  djj_grd_period    NUMBER,
  elem_trimester    NUMBER,
  sec_semester      VARCHAR2(255 CHAR),
  sec_nine_weeks    VARCHAR2(255 CHAR),
  holiday           NUMBER,
  schl_day_ct_1     NUMBER,
  schl_day_ct_2     NUMBER,
  schl_day_ct_3     NUMBER,
  schl_day_ct_4     NUMBER,
  schl_day_ct_5     NUMBER,
  schl_day_ct_6     NUMBER,
  schl_day_ct_7     NUMBER,
  schl_day_ct_8     NUMBER,
  schl_day_ct_9     NUMBER,
  schl_day_ct_10    NUMBER,
  date_sid          INTEGER not null,
  yyyymmdd          CHAR(8) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table SDM.DATE_DIM_ORIG
  add constraint PK_DATE_DIM_ORIG primary key (DATE_SID)
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
alter index SDM.PK_DATE_DIM_ORIG nologging;

prompt
prompt Creating table DATE_DIM_SAVE
prompt ============================
prompt
create table SDM.DATE_DIM_SAVE
(
  date_sid         NUMBER(8) not null,
  date_id          DATE not null,
  schl_year_desc   VARCHAR2(9) not null,
  schl_year        NUMBER(4) not null,
  schl_week        NUMBER(2) not null,
  yyyymmdd         VARCHAR2(8) not null,
  julian_dt        NUMBER(7) not null,
  day_desc         VARCHAR2(28) not null,
  year_id          NUMBER(4) not null,
  month_nbr        NUMBER(2) not null,
  week_num         NUMBER(2) not null,
  day_nbr          NUMBER(2) not null,
  dow_desc         VARCHAR2(9) not null,
  dow_nbr          NUMBER(1) not null,
  month_id         NUMBER(6) not null,
  year_desc        VARCHAR2(6) not null,
  month_desc       VARCHAR2(9) not null,
  month_short_desc VARCHAR2(3) not null,
  day_short_desc   VARCHAR2(16) not null,
  dow_short_desc   VARCHAR2(3) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index SDM.DATE_DIM_SCHL_YEAR on SDM.DATE_DIM_SAVE (SCHL_YEAR)
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
create bitmap index SDM.DATE_DIM_SCHL_YEAR_DESC on SDM.DATE_DIM_SAVE (SCHL_YEAR_DESC)
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
create unique index SDM.PK_DATE_DIM_DATE_SID on SDM.DATE_DIM_SAVE (DATE_SID)
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
create unique index SDM.UX_DATE_DIM_DATE_ID_DATE_SID on SDM.DATE_DIM_SAVE (DATE_ID, DATE_SID)
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
prompt Creating table DIS_ACT_DIM
prompt ==========================
prompt
create table SDM.DIS_ACT_DIM
(
  loc_county_dist_id VARCHAR2(6) not null,
  act_sid            NUMBER(6) not null,
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
  create_dt          DATE not null,
  eff_start_dt       DATE,
  eff_end_dt         DATE,
  last_updt_dt       DATE not null,
  cur_indicator      CHAR(1) not null,
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
comment on column SDM.DIS_ACT_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.DIS_ACT_DIM.act_key
  is 'ACTION KEY indicates the key that defines the action record.';
comment on column SDM.DIS_ACT_DIM.act_id
  is 'ACTION ID indicates the physical ID number of the action code.';
comment on column SDM.DIS_ACT_DIM.act_desc
  is 'ACTION DESCRIPTION indicates the long description of the action.';
comment on column SDM.DIS_ACT_DIM.act_short_desc
  is 'ACTION SHORT DESCRIPTION indicates the short description of the action.';
comment on column SDM.DIS_ACT_DIM.act_type
  is 'ACTION TYPE indicates the type of action that was taken.';
comment on column SDM.DIS_ACT_DIM.act_assign_lngth
  is 'ACTION DEFAULT LENGTH indicates the amount of time that is supposed to be associated with the action.';
comment on column SDM.DIS_ACT_DIM.act_avg_lngth
  is 'ACTION AVERAGE LENGTH indicates the average length of time assigned in asociation with the action.';
comment on column SDM.DIS_ACT_DIM.act_severity
  is 'ACTION SEVERITY LEVEL indicates the rating level (severity level) of the action.';
comment on column SDM.DIS_ACT_DIM.is_expulsion
  is 'ACTION EXPULSION FLAG indicates whether or not the action is associated with an Expulsion.';
comment on column SDM.DIS_ACT_DIM.is_is_susp
  is 'ACTION IN SCHOOL SUSPENSION FLAG indicates whether or not the action is associated with an In School Suspension.';
comment on column SDM.DIS_ACT_DIM.is_oos_susp
  is 'ACTION OUT OF SCHOOL SUSPENSION FLAG indicates whether or not  the action is associated with an Out of School Suspension.';
comment on column SDM.DIS_ACT_DIM.is_corp_pnshmnt
  is 'ACTION CORP PUNISHMENT indicates this action is associated with a corporal punishment.';
comment on column SDM.DIS_ACT_DIM.is_other
  is 'ACTION OTHER FLAG indicates this action is associated with other requirements.';
comment on column SDM.DIS_ACT_DIM.is_alt_plcmnt
  is 'ACTION ALTERNATE PLACEMENT FLAG indicates this action is associated with an alternative placement of the student.';
comment on column SDM.DIS_ACT_DIM.is_schl_chg_plcmnt
  is 'ACTION SCHOOL PLACEMENT FLAG indicates this action is associated with a school change of placement action.';
comment on column SDM.DIS_ACT_DIM.act_cur_sy_cnt
  is 'ACTION CURRENT YEAR COUNT indicates the count of the number of times this action was assigned in the current school year.';
create bitmap index SDM.BMI_CDC_DIS_ACT_DIM on SDM.DIS_ACT_DIM (LOC_COUNTY_DIST_ID)
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
create index SDM.IX1DIS_ACT_DIM on SDM.DIS_ACT_DIM (ACT_SID)
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
create index SDM.IX2DIS_ACT_DIM on SDM.DIS_ACT_DIM (ACT_ID)
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
alter table SDM.DIS_ACT_DIM
  add constraint PK_DIS_ACT_DIM primary key (ACT_SID);

prompt
prompt Creating table DIS_FACT
prompt =======================
prompt
create table SDM.DIS_FACT
(
  loc_county_dist_id VARCHAR2(6) not null,
  school_year        NUMBER(4),
  record_type        VARCHAR2(1) not null,
  event_id           VARCHAR2(50) not null,
  inc_sid            NUMBER(6) not null,
  act_sid            NUMBER(6) not null,
  stu_sid            NUMBER(9) not null,
  state_grp_sid      NUMBER(6) not null,
  loo_sid            NUMBER(6) not null,
  event_dt           NUMBER,
  event_time         VARCHAR2(7),
  event_loc_sid      NUMBER(6),
  where_flag         VARCHAR2(5),
  rprtng_staff_id    VARCHAR2(15),
  invlvmnt_type      VARCHAR2(2),
  cur_grd_lvl        VARCHAR2(2),
  nbr_of_incidents   NUMBER(1),
  case_nbr           VARCHAR2(25),
  act_loc_sid        NUMBER(6) not null,
  act_dt             NUMBER,
  act_staff_id       VARCHAR2(15),
  act_staff_name     VARCHAR2(20),
  act_nbr_of_days    NUMBER(6,3),
  act_nbr_dys_servd  NUMBER(6,3),
  act_reason_dif     VARCHAR2(2),
  act_begin_dt       DATE,
  weapon_type_cd     VARCHAR2(2),
  incident_number    VARCHAR2(10),
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
comment on column SDM.DIS_FACT.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.DIS_FACT.school_year
  is 'SCHOOL YEAR indicates the school year in which the discipline event occurred.';
comment on column SDM.DIS_FACT.record_type
  is 'DISCIPLINE RECORD TYPE indicates the code used to associate actions to incidents within the event structure.';
comment on column SDM.DIS_FACT.event_id
  is 'DISCIPLINE  SIS ID indicates the actual event ID representing the unique event number.';
comment on column SDM.DIS_FACT.event_dt
  is 'CONNECTION TO DATE DIMENSION indicates the date of the event.';
comment on column SDM.DIS_FACT.event_time
  is 'EVENT TIME indicates the time that the event took place.';
comment on column SDM.DIS_FACT.where_flag
  is 'LOCAL WHERE FLAG indicates a more generic indicator of where an event occurred.';
comment on column SDM.DIS_FACT.rprtng_staff_id
  is 'STAFF FOR REPORTING indicates the staff member who reported or created the discipline referral.';
comment on column SDM.DIS_FACT.invlvmnt_type
  is 'INVOLVEMENT TYPE indicates the type of involvement that this student had in this event/incident.';
comment on column SDM.DIS_FACT.cur_grd_lvl
  is 'CURRENT GRADE LEVEL indicates the current grade level of the student involved inthis incident/action.';
comment on column SDM.DIS_FACT.nbr_of_incidents
  is 'TOTAL NUMBER OF INCIDENTS indicates the count of the total number of incidents associated with this event.';
comment on column SDM.DIS_FACT.case_nbr
  is 'CASE NUMBER indicates the case number from the court system if the law was notified and there was a resulting charge filed.';
comment on column SDM.DIS_FACT.act_dt
  is 'CONNECTION TO DATE OF ACTION indicates the date that the action was executed.';
comment on column SDM.DIS_FACT.act_staff_id
  is 'STAFF PROVIDING ACTION indicates the ID of the staff member who executed/enforced the action.';
comment on column SDM.DIS_FACT.act_staff_name
  is 'ACTION STAFF NAME indicates the name of the staff member that was associated with this action.';
comment on column SDM.DIS_FACT.act_nbr_dys_servd
  is 'ACTION NUMBER OF DAYS SERVED indicates the actual number of days served for the action event.';
comment on column SDM.DIS_FACT.act_reason_dif
  is 'ACTION DIFFERENCE REASON indicates why there was a difference between the number of days associated with this action and the number of days served with this action.';
comment on column SDM.DIS_FACT.act_begin_dt
  is 'ACTION BEGIN DATE indicates the date that the action starts.';
create bitmap index SDM.BMI_ACT_SID_DIS_FACT on SDM.DIS_FACT (ACT_SID)
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
create bitmap index SDM.BMI_CDC_DIS_FACT on SDM.DIS_FACT (LOC_COUNTY_DIST_ID)
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
create bitmap index SDM.BMI_DIS_FACT_RECORD_TYPE on SDM.DIS_FACT (RECORD_TYPE)
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
create bitmap index SDM.BMI_INC_SID_DIS_FACT on SDM.DIS_FACT (INC_SID)
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
create bitmap index SDM.BMI_LOO_SID_DIS_FACT on SDM.DIS_FACT (LOO_SID)
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
create bitmap index SDM.BMI_STGRP_SID_DIS_FACT on SDM.DIS_FACT (STATE_GRP_SID)
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
create bitmap index SDM.BMI_STU_SID_DIS_FACT on SDM.DIS_FACT (STU_SID)
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
create index SDM.IX_DIS_FACT_EVENT_ID on SDM.DIS_FACT (EVENT_ID)
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
create unique index SDM.UX_DIS_FACT_EVENT_STU_RECTYP on SDM.DIS_FACT (EVENT_ID, STU_SID, RECORD_TYPE)
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
prompt Creating table DIS_INC_DIM
prompt ==========================
prompt
create table SDM.DIS_INC_DIM
(
  loc_county_dist_id VARCHAR2(6) not null,
  inc_sid            NUMBER(6) not null,
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
  cta_flag           NUMBER(1),
  create_dt          DATE not null,
  eff_start_dt       DATE,
  eff_end_dt         DATE,
  last_updt_dt       DATE not null,
  cur_indicator      CHAR(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.DIS_INC_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.DIS_INC_DIM.inc_key
  is 'INCIDENT KEY indicates the key that defines the incident record.';
comment on column SDM.DIS_INC_DIM.inc_id
  is 'INCIDENT ID indicates the incident code that identifies the disciplinary infraction.';
comment on column SDM.DIS_INC_DIM.inc_desc
  is 'INCIDENT DESCRIPTION indicates the description of the incident.';
comment on column SDM.DIS_INC_DIM.inc_short_desc
  is 'INCIDENT SHORT DESCRIPTION indicates the short description of the incident.';
comment on column SDM.DIS_INC_DIM.inc_type
  is 'INCIDENT TYPE indicates the classification type of the incident.';
comment on column SDM.DIS_INC_DIM.inc_severity
  is 'INCIDENT SEVERITY indicates the severity level of the incident.';
comment on column SDM.DIS_INC_DIM.inc_cur_sy_cnt
  is 'INCIDENT USAGE CURRENT YEAR indicates the number of occurrences of this incident for the current school year.';
comment on column SDM.DIS_INC_DIM.inc_tot_cnt
  is 'INCIDENT USAGE LIFETIME indicates the total number of occurrences of this incident since the incident was created.';
comment on column SDM.DIS_INC_DIM.is_drug
  is 'INCIDENT DRUG FLAG indicates whether or not this incident is drug related.';
comment on column SDM.DIS_INC_DIM.is_hate_crime
  is 'INCIDENT HATE CRIME FLAG indicates whether or not this incident is hate crime related.';
comment on column SDM.DIS_INC_DIM.is_weapon
  is 'INCIDENT WEAPON FLAG indicates whether or not this incident is weapon related.';
comment on column SDM.DIS_INC_DIM.is_bullying
  is 'INCIDENT BULLYING FLAG indicates whether or not this incident involved bullying.';
create bitmap index SDM.BMI_CDC_DIS_INC_DIM on SDM.DIS_INC_DIM (LOC_COUNTY_DIST_ID)
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
alter table SDM.DIS_INC_DIM
  add constraint PK_DIS_INC_DIM primary key (INC_SID)
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
alter index SDM.PK_DIS_INC_DIM nologging;

prompt
prompt Creating table DIS_LOO_DIM
prompt ==========================
prompt
create table SDM.DIS_LOO_DIM
(
  loo_sid            NUMBER(6) not null,
  loc_county_dist_id VARCHAR2(6) not null,
  loo_key            VARCHAR2(15) not null,
  loo_id             VARCHAR2(13),
  loo_desc           VARCHAR2(30),
  loo_short_desc     VARCHAR2(15),
  loo_grp            NUMBER(2),
  loo_use_cnt        NUMBER(1),
  loo_event_cnt      NUMBER(6),
  loo_inc_cnt        NUMBER(6),
  loo_act_cnt        NUMBER(6),
  create_dt          DATE not null,
  last_updt_dt       DATE not null,
  eff_start_dt       DATE,
  eff_end_dt         DATE,
  cur_indicator      VARCHAR2(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.DIS_LOO_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.DIS_LOO_DIM.loo_key
  is 'LOCATION OF OCCURRENCE KEY indicates the key that defines the location of  occurrence record.';
comment on column SDM.DIS_LOO_DIM.loo_id
  is 'LOCATION OF OCCURRENCE ID indicates the physical location of occurrence ID of where the event/incident occurred.';
comment on column SDM.DIS_LOO_DIM.loo_desc
  is 'LOCATION OF OCCURRENCE DESCRIPTION indicates the description of the location of the occurrence.';
comment on column SDM.DIS_LOO_DIM.loo_short_desc
  is 'LOCATION OF OCCURRENCE SHORT DESCRIPTION indicates the short description of the location of the occurrence.';
comment on column SDM.DIS_LOO_DIM.loo_grp
  is 'LOCATION OF OCCURRENCE GROUPING indicates a code that can be used to group locations together.';
comment on column SDM.DIS_LOO_DIM.loo_use_cnt
  is 'COUNT OF LOO USAGE indicates the number of times this location code has been used.';
comment on column SDM.DIS_LOO_DIM.loo_event_cnt
  is 'NUMBER OF DISCIPLINE EVENTS indicates the count of discipline events for this location.';
comment on column SDM.DIS_LOO_DIM.loo_inc_cnt
  is 'NUMBER OF DISCIPLINE INCIDENTS FOR THIS LOO indicates the count of discipline incidents for this location.';
comment on column SDM.DIS_LOO_DIM.loo_act_cnt
  is 'NUMBER OF DISCIPLINE ACTIONS FOR THIS LOO indicates the count of discipline actions for this location.';
create bitmap index SDM.BMI_CDC_DIS_LOO_DIM on SDM.DIS_LOO_DIM (LOC_COUNTY_DIST_ID)
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
alter table SDM.DIS_LOO_DIM
  add constraint PK_DIS_LOO_DIM primary key (LOO_SID)
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
alter index SDM.PK_DIS_LOO_DIM nologging;

prompt
prompt Creating table DIS_STATE_GRP_DIM
prompt ================================
prompt
create table SDM.DIS_STATE_GRP_DIM
(
  state_grp_sid      NUMBER(6) not null,
  loc_county_dist_id VARCHAR2(6) not null,
  state_grp_key      VARCHAR2(15) not null,
  state_grp_id       VARCHAR2(13),
  state_grp_desc     VARCHAR2(50),
  create_dt          DATE not null,
  eff_start_dt       DATE,
  eff_end_dt         DATE,
  last_updt_dt       DATE not null,
  cur_indicator      VARCHAR2(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.DIS_STATE_GRP_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.DIS_STATE_GRP_DIM.state_grp_key
  is 'STATE GROUP KEY indicates the key that defines the discipline state group record.';
comment on column SDM.DIS_STATE_GRP_DIM.state_grp_id
  is 'STATE GROUP ID indicates the physical state group ID of the state grouping requirements.';
comment on column SDM.DIS_STATE_GRP_DIM.state_grp_desc
  is 'STATE GROUP DESCRIPTION indicates the description of the state grouping code.';
create bitmap index SDM.BMI_CDC_DIS_STATE_GRP_DIM on SDM.DIS_STATE_GRP_DIM (LOC_COUNTY_DIST_ID)
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
create index SDM.IX1DIS_STATE_GRP_DIM on SDM.DIS_STATE_GRP_DIM (STATE_GRP_SID)
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
create index SDM.IX2DIS_STATE_GRP_DIM on SDM.DIS_STATE_GRP_DIM (STATE_GRP_ID)
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
alter table SDM.DIS_STATE_GRP_DIM
  add constraint PK_DIS_STATE_GRP_DIM primary key (STATE_GRP_SID);

prompt
prompt Creating table ENROLLMENTS_PAST_STU_WD
prompt ======================================
prompt
create table SDM.ENROLLMENTS_PAST_STU_WD
(
  year_month_day     VARCHAR2(8) not null,
  stu_withdrawl_dt   DATE,
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd VARCHAR2(2),
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

prompt
prompt Creating table ENROLLMENT_CNTS_TBL
prompt ==================================
prompt
create table SDM.ENROLLMENT_CNTS_TBL
(
  enrollments NUMBER,
  district    VARCHAR2(24),
  campus      VARCHAR2(69)
)
tablespace DW_DEFAULT01
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
prompt Creating table ENROLLMENT_FACT
prompt ==============================
prompt
create table SDM.ENROLLMENT_FACT
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd VARCHAR2(2),
  ada_enr_cnt        NUMBER(2,1),
  race_ethnicity_sid NUMBER(4)
)
partition by range (DATE_SID)
(
  partition CATCH_111111_All values less than (297910)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PAST values less than (309234)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PRIOR values less than (309599)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_CURRENT values less than (316539)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition CATCH_999999_All values less than (99999999)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
create bitmap index SDM.BMI_P_CDC_ENROLL_FACT on SDM.ENROLLMENT_FACT (LOC_COUNTY_DIST_ID)
  nologging  local;
create bitmap index SDM.BMI_P_DATE_SID_ENROLL_FACT on SDM.ENROLLMENT_FACT (DATE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_FRL_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_FREE_REDU_LNCH)
  nologging  local;
create bitmap index SDM.BMI_P_GRD_LVL_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_CUR_GRD_LVL)
  nologging  local;
create bitmap index SDM.BMI_P_LEP_CODE_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_LEP_CODE)
  nologging  local;
create bitmap index SDM.BMI_P_LOC_SID_ENROLL_FACT on SDM.ENROLLMENT_FACT (LOC_SID)
  nologging  local;
create bitmap index SDM.BMI_P_PRIM_ESE_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_PRIMARY_ESE_CD)
  nologging  local;
create bitmap index SDM.BMI_P_STU_RACE_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_RACE)
  nologging  local;
create bitmap index SDM.BMI_P_STU_SID_ENROLL_FACT on SDM.ENROLLMENT_FACT (STU_SID)
  nologging  local;

prompt
prompt Creating table ENROLLMENT_FACT_PART2011
prompt =======================================
prompt
create table SDM.ENROLLMENT_FACT_PART2011
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd VARCHAR2(2),
  ada_enr_cnt        NUMBER(2,1),
  race_ethnicity_sid NUMBER(4)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ENROLLMENT_FACT_STEP1
prompt ====================================
prompt
create table SDM.ENROLLMENT_FACT_STEP1
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd VARCHAR2(2),
  ada_enr_cnt        NUMBER(2,1)
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
prompt Creating table ENROLLMENT_FACT_STEP2
prompt ====================================
prompt
create table SDM.ENROLLMENT_FACT_STEP2
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd CHAR(1),
  ada_enr_cnt        NUMBER(2,1)
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
prompt Creating table ENROLLMENT_FACT_TEST
prompt ===================================
prompt
create table SDM.ENROLLMENT_FACT_TEST
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  date_sid           NUMBER,
  cnt                NUMBER(1) not null,
  inactive_record    NUMBER(1),
  process_dt         DATE not null,
  stu_lep_code       NUMBER(1),
  stu_race           VARCHAR2(1),
  stu_free_redu_lnch NUMBER(1),
  stu_cur_grd_lvl    VARCHAR2(25),
  stu_primary_ese_cd VARCHAR2(2),
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
  );

prompt
prompt Creating table ENROLLMENT_PAST_WITHDRAW_TBL
prompt ===========================================
prompt
create table SDM.ENROLLMENT_PAST_WITHDRAW_TBL
(
  school_year        VARCHAR2(4),
  year_month_day     VARCHAR2(8),
  stu_withdrawl_dt   DATE,
  loc_county_dist_id VARCHAR2(6),
  stu_sid            NUMBER(9),
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
  );

prompt
prompt Creating table ENR_PASS_WTH
prompt ===========================
prompt
create table SDM.ENR_PASS_WTH
(
  school_year        VARCHAR2(4) not null,
  year_month_day     VARCHAR2(8) not null,
  stu_withdrawl_dt   DATE,
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  process_dt         DATE not null
)
tablespace DW_DEFAULT01
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
prompt Creating table ETHNICITY_DIM
prompt ============================
prompt
create table SDM.ETHNICITY_DIM
(
  ethnicity_sid        NUMBER(2) not null,
  ethnicity_key        CHAR(1),
  ethnicity_code       CHAR(1) not null,
  ethnicity_desc       VARCHAR2(50) not null,
  ethnicity_desc_short VARCHAR2(10) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table SDM.ETHNICITY_DIM
  add constraint PK_ETHNICITY_DIM primary key (ETHNICITY_SID)
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

prompt
prompt Creating table ETL_LOAD_VALIDATION
prompt ==================================
prompt
create table SDM.ETL_LOAD_VALIDATION
(
  load_validation_type VARCHAR2(20) not null,
  district_sid         NUMBER(4) not null,
  validation_date_sid  NUMBER(8) not null,
  load_date_sid        NUMBER(8),
  data_valid_flag      VARCHAR2(3),
  most_recent_flag     VARCHAR2(3)
)
tablespace DW_DEFAULT01
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
comment on column SDM.ETL_LOAD_VALIDATION.load_validation_type
  is 'Ex. Enrollment, Absence';
comment on column SDM.ETL_LOAD_VALIDATION.validation_date_sid
  is 'The date for which the data was validated';
comment on column SDM.ETL_LOAD_VALIDATION.load_date_sid
  is 'The date the district data was loaded';
comment on column SDM.ETL_LOAD_VALIDATION.data_valid_flag
  is 'Values: Yes, No';
comment on column SDM.ETL_LOAD_VALIDATION.most_recent_flag
  is 'Values: Yes, No';
create bitmap index SDM.BMI_MOST_RECENT_FLAG on SDM.ETL_LOAD_VALIDATION (MOST_RECENT_FLAG)
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
alter table SDM.ETL_LOAD_VALIDATION
  add constraint PK_ETL_LOAD_VALIDATION primary key (VALIDATION_DATE_SID, LOAD_VALIDATION_TYPE)
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
alter index SDM.PK_ETL_LOAD_VALIDATION nologging;

prompt
prompt Creating table FACT_COUNTS_TBL
prompt ==============================
prompt
create table SDM.FACT_COUNTS_TBL
(
  sanity_gid  NUMBER,
  district_id VARCHAR2(6),
  dbschema    VARCHAR2(20),
  table_name  VARCHAR2(40),
  row_cnt     NUMBER,
  created_dt  DATE
)
tablespace DW_DEFAULT01
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
prompt Creating table GRADES_GPA_FACT
prompt ==============================
prompt
create table SDM.GRADES_GPA_FACT
(
  loc_county_dist_id VARCHAR2(6) not null,
  stu_sid            NUMBER(9) not null,
  date_sid           NUMBER,
  grd_lvl_id         VARCHAR2(2),
  grading_period     VARCHAR2(2),
  school_year        NUMBER(4) not null,
  gpa_grade          NUMBER(7,4),
  gpa_grade2         NUMBER(7,4),
  gpa_grade3         NUMBER(7,4),
  gpa_grade4         NUMBER(7,4),
  tot_periods        VARCHAR2(2),
  tot_grades         VARCHAR2(2),
  process_dt         DATE not null,
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
comment on column SDM.GRADES_GPA_FACT.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.GRADES_GPA_FACT.grading_period
  is 'MARKING PERIOD indicates the grading period to which this Grades GPA fact applies.';
comment on column SDM.GRADES_GPA_FACT.school_year
  is 'SCHOOL YEAR indicates the school year for which this GPA is assigned.';
comment on column SDM.GRADES_GPA_FACT.gpa_grade
  is 'GPA indicates the grade point average.';
comment on column SDM.GRADES_GPA_FACT.tot_periods
  is 'TOTAL PERIODS indicates the total number of periods for which the grades have been accumulated.';
comment on column SDM.GRADES_GPA_FACT.tot_grades
  is 'TOTAL POINTS indicates the total number of grading points.';
create bitmap index SDM.BMI_CDC_GRADES_GPA_FACT on SDM.GRADES_GPA_FACT (LOC_COUNTY_DIST_ID)
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
create bitmap index SDM.BMI_DATE_SID_GRADES_GPA_FACT on SDM.GRADES_GPA_FACT (DATE_SID)
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
create bitmap index SDM.BMI_STU_SID_GRADES_GPA_FACT on SDM.GRADES_GPA_FACT (STU_SID)
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
create unique index SDM.UX_GRADES_GPA_FACT_STU_DT_GRDP on SDM.GRADES_GPA_FACT (STU_SID, DATE_SID, GRADING_PERIOD)
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
prompt Creating table GRADE_FACT
prompt =========================
prompt
create table SDM.GRADE_FACT
(
  date_sid                    NUMBER not null,
  loc_county_dist_id          VARCHAR2(6) not null,
  stu_sid                     NUMBER(9) not null,
  loc_sid                     NUMBER(6) not null,
  staff_sid                   NUMBER(6) not null,
  course_sid                  NUMBER(6) not null,
  grd_lvl_id                  VARCHAR2(2),
  grade_type                  VARCHAR2(20) not null,
  school_year                 NUMBER(4),
  grading_period              VARCHAR2(1) not null,
  from_period                 VARCHAR2(8),
  to_period                   VARCHAR2(8),
  sec_letter_grd              VARCHAR2(6),
  sec_nbr_grd                 VARCHAR2(6),
  sec_conduct_grd             VARCHAR2(6),
  elem_performance            VARCHAR2(6),
  elem_mark                   VARCHAR2(6),
  elem_effort                 VARCHAR2(6),
  credits_attempted           NUMBER(6,2),
  credits_earned              NUMBER(6,2),
  credits_denied              NUMBER(6,2),
  process_dt                  DATE,
  inactive_record             NUMBER(1),
  grade_conformed_type        VARCHAR2(200),
  numeric_grade               NUMBER(5,2),
  cnt_grades_below_70         NUMBER,
  cnt_grades_from_70_below_80 NUMBER,
  cnt_grades_from_80_below_90 NUMBER,
  cnt_grades_90_and_above     NUMBER,
  cnt_grades_issued           NUMBER
)
partition by range (DATE_SID)
(
  partition CATCH_111111_All values less than (297910)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PAST values less than (309234)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PRIOR values less than (309599)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_CURRENT values less than (316539)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition CATCH_999999_All values less than (99999999)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
create bitmap index SDM.BMI_P_CDC_GRADE_FACT on SDM.GRADE_FACT (LOC_COUNTY_DIST_ID)
  nologging  local;
create bitmap index SDM.BMI_P_CRS_SID_GRADE_FACT on SDM.GRADE_FACT (COURSE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_DATE_SID_GRADE_FACT on SDM.GRADE_FACT (DATE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_GRD_LVL_GRADE_FACT on SDM.GRADE_FACT (GRD_LVL_ID)
  nologging  local;
create bitmap index SDM.BMI_P_LOC_SID_GRADE_FACT on SDM.GRADE_FACT (LOC_SID)
  nologging  local;
create bitmap index SDM.BMI_P_SCHL_YR_GRADE_FACT on SDM.GRADE_FACT (SCHOOL_YEAR)
  nologging  local;
create bitmap index SDM.BMI_P_STAFF_SID_GRADE_FACT on SDM.GRADE_FACT (STAFF_SID)
  nologging  local;
create bitmap index SDM.BMI_P_STU_SID_GRADE_FACT on SDM.GRADE_FACT (STU_SID)
  nologging  local;
create unique index SDM.UX_GRADE_FT_STU_CRS_GRD_PRD_T2 on SDM.GRADE_FACT (STU_SID, COURSE_SID, GRADE_TYPE, GRADING_PERIOD, SCHOOL_YEAR)
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
prompt Creating table GRADE_FACT_PART_MOVE
prompt ===================================
prompt
create table SDM.GRADE_FACT_PART_MOVE
(
  date_sid                    NUMBER not null,
  loc_county_dist_id          VARCHAR2(6) not null,
  stu_sid                     NUMBER(9) not null,
  loc_sid                     NUMBER(6) not null,
  staff_sid                   NUMBER(6) not null,
  course_sid                  NUMBER(6) not null,
  grd_lvl_id                  VARCHAR2(2),
  grade_type                  VARCHAR2(20) not null,
  school_year                 NUMBER(4),
  grading_period              VARCHAR2(1) not null,
  from_period                 VARCHAR2(8),
  to_period                   VARCHAR2(8),
  sec_letter_grd              VARCHAR2(6),
  sec_nbr_grd                 VARCHAR2(6),
  sec_conduct_grd             VARCHAR2(6),
  elem_performance            VARCHAR2(6),
  elem_mark                   VARCHAR2(6),
  elem_effort                 VARCHAR2(6),
  credits_attempted           NUMBER(6,2),
  credits_earned              NUMBER(6,2),
  credits_denied              NUMBER(6,2),
  process_dt                  DATE,
  inactive_record             NUMBER(1),
  grade_conformed_type        VARCHAR2(200),
  numeric_grade               NUMBER(5,2),
  cnt_grades_below_70         NUMBER,
  cnt_grades_from_70_below_80 NUMBER,
  cnt_grades_from_80_below_90 NUMBER,
  cnt_grades_90_and_above     NUMBER,
  cnt_grades_issued           NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table GRADE_LEVEL_DIM
prompt ==============================
prompt
create table SDM.GRADE_LEVEL_DIM
(
  grade_level_sid        NUMBER(3) not null,
  grade_level_key        VARCHAR2(2),
  grade_level_code       VARCHAR2(2) not null,
  grade_level_desc       VARCHAR2(30) not null,
  grade_level_desc_short VARCHAR2(10) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table SDM.GRADE_LEVEL_DIM
  add constraint PK_GRADE_LEVEL_DIM primary key (GRADE_LEVEL_SID)
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

prompt
prompt Creating table HIST_REJECTS_TBL
prompt ===============================
prompt
create table SDM.HIST_REJECTS_TBL
(
  district_id VARCHAR2(10),
  reason      VARCHAR2(1000),
  reject_cnt  NUMBER,
  table_name  VARCHAR2(100),
  process_dt  VARCHAR2(100),
  create_dt   DATE
)
tablespace DW_DEFAULT01
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
prompt Creating table HIST_REJ_ABSENCE_FACT
prompt ====================================
prompt
create table SDM.HIST_REJ_ABSENCE_FACT
(
  "reason"             VARCHAR2(255 CHAR) not null,
  loc_county_dist_id   VARCHAR2(6 CHAR) not null,
  loc_id               VARCHAR2(15 CHAR) not null,
  record_type          VARCHAR2(1 CHAR) not null,
  date_id              VARCHAR2(15 CHAR),
  event_type           VARCHAR2(20 CHAR),
  stu_id               VARCHAR2(40 CHAR) not null,
  period               VARCHAR2(8 CHAR) not null,
  process_dt           VARCHAR2(75 CHAR),
  inactive_record      NUMBER(5),
  conformed_event_type VARCHAR2(200 CHAR)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_DIS_FACT
prompt ================================
prompt
create table SDM.HIST_REJ_DIS_FACT
(
  "reason"            VARCHAR2(255 CHAR) not null,
  loc_county_dist_id  VARCHAR2(6 CHAR) not null,
  school_year         VARCHAR2(4 CHAR),
  record_type         VARCHAR2(1 CHAR) not null,
  event_id            VARCHAR2(50 CHAR) not null,
  inc_sid             VARCHAR2(15 CHAR) not null,
  act_sid             VARCHAR2(15 CHAR) not null,
  stu_sid             VARCHAR2(40 CHAR) not null,
  "State_Grp_SID"     VARCHAR2(15 CHAR) not null,
  loo_sid             VARCHAR2(15 CHAR),
  "Event_Dt"          VARCHAR2(15 CHAR),
  "Event_Time"        VARCHAR2(5 CHAR),
  event_loc_sid       VARCHAR2(15 CHAR),
  "Where_Flag"        VARCHAR2(5 CHAR),
  rprtng_staff_id     VARCHAR2(15 CHAR),
  "Invlvmnt_Type"     VARCHAR2(2 CHAR),
  "Cur_Grd_Lvl"       VARCHAR2(2 CHAR),
  "Weapon_Type_cd"    VARCHAR2(2 CHAR),
  "Nbr_Of_Incidents"  NUMBER(5),
  "Case_Nbr"          VARCHAR2(25 CHAR),
  "Act_Loc_SID"       VARCHAR2(15 CHAR),
  "Act_Dt"            VARCHAR2(15 CHAR),
  "Act_Staff_ID"      VARCHAR2(15 CHAR),
  "Act_Nbr_Of_Days"   NUMBER(6,3),
  "Act_Nbr_Dys_Servd" NUMBER(6,3),
  "Act_Reason_Dif"    VARCHAR2(2 CHAR),
  "Act_Begin_Dt"      DATE,
  incident_number     VARCHAR2(10 CHAR),
  process_dt          VARCHAR2(75 CHAR),
  inactive_record     NUMBER(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_ENROLLMENT_FACT
prompt =======================================
prompt
create table SDM.HIST_REJ_ENROLLMENT_FACT
(
  "reason"           VARCHAR2(255 CHAR) not null,
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  loc_sid            VARCHAR2(15 CHAR) not null,
  stu_sid            VARCHAR2(40 CHAR) not null,
  date_sid           VARCHAR2(15 CHAR),
  process_dt         VARCHAR2(75 CHAR),
  inactive_record    NUMBER(5),
  cnt                NUMBER(5),
  ada_enr_cnt        NUMBER(10,1),
  stu_lep_code       VARCHAR2(2 CHAR),
  stu_race           VARCHAR2(1 CHAR),
  stu_free_redu_lnch NUMBER(5),
  stu_cur_grd_lvl    VARCHAR2(25 CHAR),
  stu_primary_ese_cd VARCHAR2(2 CHAR)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_GRADES_GPA_FACT
prompt =======================================
prompt
create table SDM.HIST_REJ_GRADES_GPA_FACT
(
  "reason"           VARCHAR2(255 CHAR) not null,
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  stu_id             VARCHAR2(40 CHAR) not null,
  date_id            VARCHAR2(15 CHAR),
  grade_lvl_id       VARCHAR2(2 CHAR),
  grading_period     VARCHAR2(2 CHAR),
  school_year        VARCHAR2(4 CHAR),
  gpa_grade          NUMBER(10,4),
  gpa_grade3         NUMBER(10,4),
  gpa_grade4         NUMBER(10,4),
  tot_periods        VARCHAR2(2 CHAR),
  gpa_grade2         NUMBER(10,4),
  tot_grades         VARCHAR2(2 CHAR),
  process_dt         VARCHAR2(75 CHAR),
  inactive_record    NUMBER(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_GRADE_FACT
prompt ==================================
prompt
create table SDM.HIST_REJ_GRADE_FACT
(
  "reason"                    VARCHAR2(255 CHAR) not null,
  loc_county_dist_id          VARCHAR2(6 CHAR) not null,
  "Student"                   VARCHAR2(40 CHAR) not null,
  "Course"                    VARCHAR2(35 CHAR) not null,
  "Staff"                     VARCHAR2(25 CHAR) not null,
  "Date"                      VARCHAR2(15 CHAR),
  grade_lvl_id                VARCHAR2(2 CHAR),
  grade_type                  VARCHAR2(20 CHAR) not null,
  school_year                 VARCHAR2(4 CHAR),
  grading_period              VARCHAR2(1 CHAR) not null,
  from_period                 VARCHAR2(8 CHAR),
  to_period                   VARCHAR2(8 CHAR),
  sec_letter_grd              VARCHAR2(6 CHAR),
  sec_nbr_grd                 VARCHAR2(6 CHAR),
  sec_conduct_grd             VARCHAR2(6 CHAR),
  credits_attempted           NUMBER(10,2),
  credits_earned              NUMBER(10,2),
  credits_denied              NUMBER(10,2),
  process_dt                  VARCHAR2(75 CHAR),
  inactive_record             NUMBER(5),
  grade_conformed_type        VARCHAR2(200 CHAR),
  numeric_grade               FLOAT,
  "Location"                  VARCHAR2(15 CHAR),
  cnt_grades_below_70         FLOAT,
  cnt_grades_from_70_below_80 FLOAT,
  cnt_grades_from_80_below_90 FLOAT,
  cnt_grades_90_and_above     FLOAT,
  cnt_grades_issued           FLOAT
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_STAFF_ABSENT_FACT
prompt =========================================
prompt
create table SDM.HIST_REJ_STAFF_ABSENT_FACT
(
  "reason"            VARCHAR2(255 CHAR) not null,
  loc_county_dist_id  CHAR(6 CHAR) not null,
  loc_sid             VARCHAR2(15 CHAR) not null,
  abt_sid             VARCHAR2(40 CHAR),
  abr_sid             VARCHAR2(40 CHAR),
  staff_sid           VARCHAR2(16 CHAR) not null,
  sta_date_sid        VARCHAR2(15 CHAR),
  sta_absence_id      VARCHAR2(40 CHAR),
  sta_reason_id       VARCHAR2(8 CHAR),
  sta_substitute_id   VARCHAR2(10 CHAR),
  sta_substitute_name VARCHAR2(35 CHAR),
  sta_substitute_type VARCHAR2(2 CHAR),
  sta_dur_days        FLOAT,
  sta_hrs_leave       FLOAT,
  process_dt          VARCHAR2(75)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_STAFF_SCHDL_FACT
prompt ========================================
prompt
create table SDM.HIST_REJ_STAFF_SCHDL_FACT
(
  "reason"           VARCHAR2(255 CHAR) not null,
  loc_county_dist_id VARCHAR2(6 CHAR) not null,
  record_key         VARCHAR2(51 CHAR),
  course_sid         VARCHAR2(35 CHAR),
  staff_sid          VARCHAR2(16 CHAR),
  staff_id           VARCHAR2(20 CHAR),
  schl_year          VARCHAR2(4 CHAR),
  loc_sid            VARCHAR2(15 CHAR),
  section_id         VARCHAR2(18 CHAR),
  term               VARCHAR2(5 CHAR),
  from_period        VARCHAR2(8 CHAR),
  to_period          VARCHAR2(8 CHAR),
  cert_flag          VARCHAR2(5 CHAR),
  from_dt            DATE,
  from_date          DATE,
  from_hour          VARCHAR2(2 CHAR),
  from_minute        VARCHAR2(2 CHAR),
  to_dt              DATE,
  to_date            DATE,
  to_hour            NUMBER(10),
  to_minute          NUMBER(10),
  mnts_per_week      NUMBER(10),
  day_1              NUMBER(10),
  day_2              NUMBER(10),
  day_3              NUMBER(10),
  day_4              NUMBER(10),
  day_5              NUMBER(10),
  day_6              NUMBER(10),
  nbr_dys_in_week    NUMBER(10),
  max_seats          NUMBER(10),
  occupancy_term_1   NUMBER(5),
  occupancy_term_2   NUMBER(5),
  building           NUMBER(5),
  room               VARCHAR2(15 CHAR),
  fefp_funding_nbr   VARCHAR2(2 CHAR),
  fte_elgblty_flag   NUMBER(5),
  from_grd_lvl       VARCHAR2(2 CHAR),
  to_grd_lvl         VARCHAR2(2 CHAR),
  grd_elgblty_flag   VARCHAR2(1 CHAR),
  drpout_prev_flag   NUMBER(5),
  bell_schdl         VARCHAR2(2 CHAR),
  calendar_1         VARCHAR2(1 CHAR),
  calendar_2         VARCHAR2(1 CHAR),
  calendar_3         VARCHAR2(1 CHAR),
  calendar_4         VARCHAR2(1 CHAR),
  instructional_stng VARCHAR2(3 CHAR),
  class_hours        NUMBER(5),
  voc_subprgrm       NUMBER(5),
  occup_cmpltn_pts   NUMBER(5),
  program_lngth      NUMBER(5),
  fee_type_1         VARCHAR2(8 CHAR),
  fee_amt_1          NUMBER(10,2),
  fee_type_2         NUMBER(10,2),
  fee_amt_2          NUMBER(10,2),
  fee_type_3         NUMBER(10,2),
  fee_amt_3          NUMBER(10,2),
  fee_type_4         NUMBER(10,2),
  fee_amt_4          NUMBER(10,2),
  fee_type_5         NUMBER(10,2),
  fee_amt_5          NUMBER(10,2),
  fee_type_6         NUMBER(10,2),
  fee_amt_6          NUMBER(10,2),
  fee_type_7         NUMBER(10,2),
  fee_amt_7          NUMBER(10,2),
  fee_type_8         NUMBER(10,2),
  fee_amt_8          NUMBER(10,2),
  fee_type_9         NUMBER(10,2),
  fee_amt_9          NUMBER(10,2),
  voc_intent         VARCHAR2(2 CHAR),
  incarceration_flag NUMBER(5),
  voc_spcl_inittivs  NUMBER(5),
  voc_stng           NUMBER(5),
  adlt_spcl_inittivs NUMBER(5),
  day_night_indctr   NUMBER(5),
  gateway_program    NUMBER(5),
  fmly_ltrcy_program NUMBER(5),
  dual_enrlmt_indctr VARCHAR2(2 CHAR),
  co_enrl_stu_indctr NUMBER(5),
  hgly_qlified_tchr  NUMBER(5),
  scheduling_mthd    VARCHAR2(10 CHAR),
  section_team       VARCHAR2(3 CHAR),
  spec_ed_flag       VARCHAR2(1 CHAR),
  inactive_record    NUMBER(5),
  process_dt         VARCHAR2(75 CHAR)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table HIST_REJ_STU_SCHEDULE_FACT
prompt =========================================
prompt
create table SDM.HIST_REJ_STU_SCHEDULE_FACT
(
  "reason"           VARCHAR2(255 CHAR) not null,
  loc_county_dist_id CHAR(6 CHAR) not null,
  record_key         VARCHAR2(51 CHAR),
  staff_sched_key    VARCHAR2(55 CHAR) not null,
  school_year        CHAR(4),
  stu_sid            VARCHAR2(40 CHAR) not null,
  loc_sid            VARCHAR2(15 CHAR) not null,
  course_sid         VARCHAR2(35 CHAR),
  section            VARCHAR2(18 CHAR),
  from_dt            VARCHAR2(15 CHAR),
  from_time_hour     NUMBER(2),
  from_time_min      NUMBER(2),
  from_period        VARCHAR2(8 CHAR),
  to_dt              VARCHAR2(15 CHAR),
  to_time_hour       NUMBER(2),
  to_time_min        NUMBER(2),
  to_period          VARCHAR2(8 CHAR),
  term_code          VARCHAR2(2 CHAR),
  status             VARCHAR2(16 CHAR),
  fte_pgm_code       CHAR(1 CHAR),
  fte_eligibility    VARCHAR2(40 CHAR),
  occup_comp_pts     CHAR(2 CHAR),
  sub_program        VARCHAR2(40 CHAR),
  grading_eligiblity VARCHAR2(40 CHAR),
  rspbl_rdng_instr   CHAR(1 CHAR),
  rspbl_writ_instr   CHAR(1 CHAR),
  rspbl_math_instr   CHAR(1 CHAR),
  rspbl_sci_instr    CHAR(1 CHAR),
  extract_date       VARCHAR2(255 CHAR),
  from_date          TIMESTAMP(6),
  to_date            TIMESTAMP(6),
  process_dt         VARCHAR2(75 CHAR),
  inactive_record    VARCHAR2(255 CHAR)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table LOCATION_BURST
prompt =============================
prompt
create table SDM.LOCATION_BURST
(
  entry_id    VARCHAR2(30),
  ldap_group  VARCHAR2(19),
  ou          VARCHAR2(6),
  recipient   VARCHAR2(50),
  r10location VARCHAR2(9),
  burst_type  VARCHAR2(1),
  camiddir    VARCHAR2(155),
  camid       VARCHAR2(155)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index SDM.IX1LOCATION_BURST on SDM.LOCATION_BURST (ENTRY_ID)
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
create index SDM.IX2LOCATION_BURST on SDM.LOCATION_BURST (RECIPIENT)
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

prompt
prompt Creating table LOCATION_BURST_ERRORS
prompt ====================================
prompt
create table SDM.LOCATION_BURST_ERRORS
(
  entry_id    VARCHAR2(30),
  ldap_group  VARCHAR2(19),
  ou          VARCHAR2(6),
  recipient   VARCHAR2(50),
  r10location VARCHAR2(9),
  burst_type  VARCHAR2(1),
  camiddir    VARCHAR2(155),
  camid       VARCHAR2(155)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create index SDM.IX1LOCATION_BURST_ERRORS on SDM.LOCATION_BURST_ERRORS (ENTRY_ID)
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
create index SDM.IX2LOCATION_BURST_ERRORS on SDM.LOCATION_BURST_ERRORS (RECIPIENT)
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

prompt
prompt Creating table LOCATION_BURST_REPORTS
prompt =====================================
prompt
create table SDM.LOCATION_BURST_REPORTS
(
  unique_id   VARCHAR2(6) not null,
  recipient   VARCHAR2(100),
  report_name VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index SDM.bmi_loc_burst_rpt_recipient on SDM.LOCATION_BURST_REPORTS (RECIPIENT)
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
prompt Creating table LOCATION_DIM
prompt ===========================
prompt
create table SDM.LOCATION_DIM
(
  loc_sid                NUMBER(6) not null,
  loc_district           VARCHAR2(25),
  loc_county_dist_id     VARCHAR2(6) not null,
  loc_area_id            VARCHAR2(20 CHAR),
  loc_key                VARCHAR2(15) not null,
  loc_id                 VARCHAR2(21),
  loc_area_long_id       VARCHAR2(10),
  loc_area_desc          VARCHAR2(30 CHAR),
  loc_area_shrt_desc     VARCHAR2(7 CHAR),
  loc_desc               VARCHAR2(50),
  loc_short_desc         VARCHAR2(40),
  loc_abbrev             VARCHAR2(25),
  loc_principal_name     VARCHAR2(35),
  loc_state_type         VARCHAR2(35),
  loc_local_type         VARCHAR2(35),
  loc_addr_1             VARCHAR2(35 CHAR),
  loc_addr_2             VARCHAR2(35),
  loc_city               VARCHAR2(25 CHAR),
  loc_state              VARCHAR2(20 CHAR),
  loc_zip                VARCHAR2(20 CHAR),
  loc_admin_type         VARCHAR2(20) not null,
  loc_attendnce_goal     NUMBER(6),
  loc_schl_year          VARCHAR2(4),
  loc_phone              VARCHAR2(20 CHAR),
  loc_principal_ext      NUMBER(5),
  loc_term               VARCHAR2(20 CHAR),
  loc_periods            NUMBER(2),
  loc_fte_hrs            NUMBER(3),
  loc_square_footage     NUMBER(6),
  loc_cost               NUMBER(8),
  loc_aaa_flag           VARCHAR2(1),
  loc_title_1_flag       VARCHAR2(1),
  loc_frl_quartile       NUMBER(4),
  loc_ch_ed_cd           VARCHAR2(20 CHAR),
  loc_imp_target         VARCHAR2(20 CHAR),
  loc_target_asst_flag   VARCHAR2(5 CHAR),
  loc_uil_classification VARCHAR2(10 CHAR),
  create_dt              DATE not null,
  last_updt_dt           DATE not null,
  eff_start_date         DATE not null,
  eff_end_date           DATE,
  cur_indicator          VARCHAR2(1 CHAR) not null,
  loc_test_key           VARCHAR2(25),
  instructional_type     VARCHAR2(11),
  district_logo_url      VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.LOCATION_DIM.loc_district
  is 'DISTRICT NAME  indicates the school district to which this location belongs.';
comment on column SDM.LOCATION_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.LOCATION_DIM.loc_area_id
  is 'LOCATION AREA ID indicates the ID value for the area.';
comment on column SDM.LOCATION_DIM.loc_key
  is 'LOCATION KEY indicates the key that defines the location record.';
comment on column SDM.LOCATION_DIM.loc_id
  is 'LOCATION ID indicates the school code, or business organization code.';
comment on column SDM.LOCATION_DIM.loc_area_long_id
  is 'LOCATION AREA LONG ID indicates the long version of the ID.';
comment on column SDM.LOCATION_DIM.loc_area_desc
  is 'AREA DESCRIPTION indicates the description for the area.';
comment on column SDM.LOCATION_DIM.loc_area_shrt_desc
  is 'AREA SHORT DESCRIPTION inidcates the short alpha name of the location.';
comment on column SDM.LOCATION_DIM.loc_desc
  is 'LOCATION DESCRIPTION indicates the long name of the school or non-instructional location.';
comment on column SDM.LOCATION_DIM.loc_abbrev
  is 'SCHOOL ABBREVIATION indicates the abbreviation for the school or non-instructional location.';
comment on column SDM.LOCATION_DIM.loc_principal_name
  is 'PRINCIPAL NAME indicates the name of the principal for the school.';
comment on column SDM.LOCATION_DIM.loc_state_type
  is 'LOCATION STATE TYPE indicates the state definition of type of location.';
comment on column SDM.LOCATION_DIM.loc_local_type
  is 'LOCATION LOCAL TYPE indicates the local district definition of type of location.';
comment on column SDM.LOCATION_DIM.loc_addr_1
  is 'LOCATION ADDRESS 1 indicates the first address line for the physical location.';
comment on column SDM.LOCATION_DIM.loc_addr_2
  is 'LOCATION ADDRESS 2 indicates the second address line for the physical location.';
comment on column SDM.LOCATION_DIM.loc_city
  is 'LOCATION CITY indicates the city of the physical location';
comment on column SDM.LOCATION_DIM.loc_state
  is 'LOCATION STATE indicates the state of the physical location.';
comment on column SDM.LOCATION_DIM.loc_zip
  is 'LOCATION ZIP indicates the postal zip code of the physical location.  This should be the zip+4 code.';
comment on column SDM.LOCATION_DIM.loc_admin_type
  is 'TYPE OF ADMINISTRATOR indicates the administration type for this location.';
comment on column SDM.LOCATION_DIM.loc_attendnce_goal
  is 'ATTENDANCE GOAL indicates the attendance goal of the location.';
comment on column SDM.LOCATION_DIM.loc_schl_year
  is 'SCHOOL YEAR indicates the school year for which this record is valid.';
comment on column SDM.LOCATION_DIM.loc_phone
  is 'LOCATION PHONE indicates the telephone number of the physical location.';
comment on column SDM.LOCATION_DIM.loc_principal_ext
  is 'ADMINISTRATORS PHONE for the school type, indicates the extension at that school of the principal.';
comment on column SDM.LOCATION_DIM.loc_term
  is 'LOCATION TERM indicates the term type that the location uses.';
comment on column SDM.LOCATION_DIM.loc_periods
  is 'LOCATION PERIODS indicates the number of periods used for the location. (for school type locations)';
comment on column SDM.LOCATION_DIM.loc_square_footage
  is 'LOCATION SQUARE FOOTAGE indicates the square footage of this location.';
comment on column SDM.LOCATION_DIM.loc_cost
  is 'LOCATION COST GROUPING indicates cost groupings in which this locaition belongs.';
comment on column SDM.LOCATION_DIM.loc_aaa_flag
  is 'LOCATION AAA FLAG indicates whether or not this location is an AAA school.';
comment on column SDM.LOCATION_DIM.loc_title_1_flag
  is 'IS TITLE1 SCHOOLWIDE indicates whether or not this school is considered Title 1 school-wide.';
comment on column SDM.LOCATION_DIM.loc_frl_quartile
  is 'LOCATION FRL QUARTILE indicates the FRL (Free Reduced Lunch) quartile in which this location belongs.';
comment on column SDM.LOCATION_DIM.loc_ch_ed_cd
  is 'PRIMARY EDUCATION PROGRAM TYPE indicates the primary type of education program delivered at this location.';
comment on column SDM.LOCATION_DIM.loc_imp_target
  is 'IMPROVEMENT TARGET indicates the assigned improvement target for the location.';
comment on column SDM.LOCATION_DIM.loc_target_asst_flag
  is 'TARGETED ASSISTANCE indicates whether or not this location is identified for any targeted assistance programs.';
comment on column SDM.LOCATION_DIM.loc_uil_classification
  is 'UIL CLASSIFICATION indicates the classification of the location as defined by University Interscholastic League (UIL)';
create bitmap index SDM.BMI_CDC_LOCATION_DIM on SDM.LOCATION_DIM (LOC_COUNTY_DIST_ID)
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
create index SDM.IX_LOCATION_DIM_LOC_KEY on SDM.LOCATION_DIM (LOC_KEY)
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
create index SDM.IX_LOCATION_ID on SDM.LOCATION_DIM (LOC_ID)
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
alter table SDM.LOCATION_DIM
  add constraint PK_LOCATION_DIM primary key (LOC_SID)
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
alter index SDM.PK_LOCATION_DIM nologging;

prompt
prompt Creating table MV_CAPABILITIES_TABLE
prompt ====================================
prompt
create table SDM.MV_CAPABILITIES_TABLE
(
  statement_id    VARCHAR2(30),
  mvowner         VARCHAR2(30),
  mvname          VARCHAR2(30),
  capability_name VARCHAR2(30),
  possible        CHAR(1),
  related_text    VARCHAR2(2000),
  related_num     NUMBER,
  msgno           INTEGER,
  msgtxt          VARCHAR2(2000),
  seq             NUMBER
)
tablespace DW_DEFAULT01
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
prompt Creating table NINTH_GRD_COHORT
prompt ===============================
prompt
create table SDM.NINTH_GRD_COHORT
(
  district_id              VARCHAR2(6) not null,
  campus_key               VARCHAR2(22),
  student_key              VARCHAR2(26),
  date_entered_ninth_grade DATE,
  ninth_grade_cohort       VARCHAR2(4)
)
tablespace DW_DEFAULT01
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
prompt Creating table PARTITION_DATE_RANGES
prompt ====================================
prompt
create table SDM.PARTITION_DATE_RANGES
(
  range_id         NUMBER(4) not null,
  range_name       VARCHAR2(20) not null,
  range_desc       VARCHAR2(20) not null,
  school_year_from VARCHAR2(4) not null,
  school_year_to   VARCHAR2(4) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table PARTITION_TBL
prompt ============================
prompt
create table SDM.PARTITION_TBL
(
  district_sid  NUMBER(4) not null,
  district_id   VARCHAR2(6) not null,
  district_name VARCHAR2(20) not null,
  name_part     VARCHAR2(30) not null,
  school_year   VARCHAR2(4) not null,
  min_date_sid  NUMBER(8),
  max_date_sid  NUMBER(8)
)
tablespace DW_DEFAULT01
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
prompt Creating table PROMPT_CEMRT_CURR_ENRLMT_DATE
prompt ============================================
prompt
create table SDM.PROMPT_CEMRT_CURR_ENRLMT_DATE
(
  loc_county_dist_id VARCHAR2(6),
  enrlmt_as_of_date  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_CURR_GRADE_LEVEL
prompt ============================================
prompt
create table SDM.PROMPT_CEMRT_CURR_GRADE_LEVEL
(
  loc_county_dist_id   VARCHAR2(6),
  loc_id               VARCHAR2(21),
  stu_cur_grd_lvl      VARCHAR2(2),
  stu_cur_grd_lvl_desc VARCHAR2(16)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_ETHNICITY
prompt =====================================
prompt
create table SDM.PROMPT_CEMRT_ETHNICITY
(
  stu_ethnicity_short VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_FREE_REDU_LNCH
prompt ==========================================
prompt
create table SDM.PROMPT_CEMRT_FREE_REDU_LNCH
(
  stu_free_redu_lnch          CHAR(1) not null,
  stu_free_redu_lnch_cnt      CHAR(1),
  stu_free_redu_lnch_ind      VARCHAR2(3),
  stu_free_redu_lnch_ind_desc VARCHAR2(30)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_GENDER
prompt ==================================
prompt
create table SDM.PROMPT_CEMRT_GENDER
(
  stu_gender      VARCHAR2(1),
  stu_gender_desc VARCHAR2(9)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_LEP
prompt ===============================
prompt
create table SDM.PROMPT_CEMRT_LEP
(
  stu_lep_code     VARCHAR2(2),
  stu_lep_ind      VARCHAR2(3),
  stu_lep_ind_desc VARCHAR2(6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_PROFICIENCY_DIFF
prompt ============================================
prompt
create table SDM.PROMPT_CEMRT_PROFICIENCY_DIFF
(
  proficiency_diff      VARCHAR2(6),
  proficiency_diff_desc VARCHAR2(21)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_PROFICIENCY_LEVEL
prompt =============================================
prompt
create table SDM.PROMPT_CEMRT_PROFICIENCY_LEVEL
(
  proficiency_level      VARCHAR2(2),
  proficiency_level_desc VARCHAR2(21)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_SPEC_ED
prompt ===================================
prompt
create table SDM.PROMPT_CEMRT_SPEC_ED
(
  stu_primary_ese_cd       CHAR(1),
  stu_primary_ese_ind      VARCHAR2(3),
  stu_primary_ese_ind_desc VARCHAR2(26)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_SUBJECT_NAME
prompt ========================================
prompt
create table SDM.PROMPT_CEMRT_SUBJECT_NAME
(
  subject_name VARCHAR2(15),
  subject_desc VARCHAR2(15)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_CEMRT_TEST_TAKEN
prompt ======================================
prompt
create table SDM.PROMPT_CEMRT_TEST_TAKEN
(
  test_taken VARCHAR2(8)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table PROMPT_DIS_INC_DIM
prompt =================================
prompt
create table SDM.PROMPT_DIS_INC_DIM
(
  inc_type       VARCHAR2(5),
  inc_desc       VARCHAR2(50),
  inc_short_desc VARCHAR2(25)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table RACE_ETHNICITY_DIM
prompt =================================
prompt
create table SDM.RACE_ETHNICITY_DIM
(
  race_ethnicity_sid             NUMBER(4) not null,
  race_ethnicity_key             VARCHAR2(6) not null,
  ethnicity                      VARCHAR2(7),
  ethnicity_description          VARCHAR2(19),
  american_indian_alaska_native  VARCHAR2(7),
  amer_indian_alaskan_desc       VARCHAR2(36),
  asian                          VARCHAR2(7),
  asian_description              VARCHAR2(9),
  black_or_african_american      VARCHAR2(7),
  black_african_amer_desc        VARCHAR2(29),
  native_hawaiian_pacific_island VARCHAR2(7),
  hawaiian_pacific_island_desc   VARCHAR2(42),
  white                          VARCHAR2(7),
  white_description              VARCHAR2(9),
  two_or_more_races              VARCHAR2(3),
  race_ethnicity_long_desc       VARCHAR2(140),
  race_ethnicity_short_desc      VARCHAR2(80),
  fed_category                   VARCHAR2(80)
)
tablespace DW_DEFAULT01
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
comment on table SDM.RACE_ETHNICITY_DIM
  is 'Idenitfies the ethnicity and race selections of a person.';
comment on column SDM.RACE_ETHNICITY_DIM.race_ethnicity_sid
  is 'Surrogate key';
comment on column SDM.RACE_ETHNICITY_DIM.race_ethnicity_key
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
------   =   Unknown
';
comment on column SDM.RACE_ETHNICITY_DIM.ethnicity
  is 'Indicates that the individual selected Hispanic/Latino(Yes) or Not Hispanic/Latino(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.ethnicity_description
  is 'Values:
Hispanic/Latino
Not Hispanic/Latino';
comment on column SDM.RACE_ETHNICITY_DIM.american_indian_alaska_native
  is 'Indicates that the individual selected American Indian/Alaska Native(Yes) or Not American Indian/Alaska Native(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.amer_indian_alaskan_desc
  is 'Values:
American Indian or Alaska Native
Not American Indian or Alaska Native';
comment on column SDM.RACE_ETHNICITY_DIM.asian
  is 'Indicates that the individual selected Asian(Yes) or Not Asian(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.asian_description
  is 'Values:
Asian
Not Asian';
comment on column SDM.RACE_ETHNICITY_DIM.black_or_african_american
  is 'Indicates that the individual selected Black or African American(Yes) or Not Black or African American(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.black_african_amer_desc
  is 'Values:
Black or African American
Not Black or African American';
comment on column SDM.RACE_ETHNICITY_DIM.native_hawaiian_pacific_island
  is 'Indicates that the individual selected Native Hawaiian or Pacific Islander(Yes) or Not Native Hawaiian or Pacific Islander(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.hawaiian_pacific_island_desc
  is 'Values:
Native Hawaiian/Other Pacific Islander
Not Native Hawaiian/Other Pacific Islander';
comment on column SDM.RACE_ETHNICITY_DIM.white
  is 'Indicates that the individual selected White(Yes) or Not White(No).
Values:
Yes
No';
comment on column SDM.RACE_ETHNICITY_DIM.white_description
  is 'Values:
White
Not White';
comment on column SDM.RACE_ETHNICITY_DIM.two_or_more_races
  is 'Indicates that two or more races were selected.
Example:
Asian, White';
comment on column SDM.RACE_ETHNICITY_DIM.race_ethnicity_long_desc
  is 'The verbose description of the selected races.
Example:
Hispanic/Latino, American Indian or Alaska Native, Asian, Black or African American, Native Hawaiian/Other Pacific_Islander, White

Black or African American, White';
comment on column SDM.RACE_ETHNICITY_DIM.race_ethnicity_short_desc
  is 'A short abbreviated description of the races selected.
Example:
Hispanic, Amer. Indian/Alaska Nat. , Asian, Black, Hawaiian/Pacific Is., White

Black, White';
comment on column SDM.RACE_ETHNICITY_DIM.fed_category
  is 'The Federal Category description of the races selected.';
alter table SDM.RACE_ETHNICITY_DIM
  add constraint PK_RACE_ETHNICITY_DIM primary key (RACE_ETHNICITY_SID)
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
alter table SDM.RACE_ETHNICITY_DIM
  add constraint AK_RACE_ETH_DIM_BUS_K_RACE_ETH unique (RACE_ETHNICITY_KEY)
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

prompt
prompt Creating table REWRITE_TABLE
prompt ============================
prompt
create table SDM.REWRITE_TABLE
(
  statement_id   VARCHAR2(30),
  mv_owner       VARCHAR2(30),
  mv_name        VARCHAR2(30),
  sequence       INTEGER,
  query          VARCHAR2(2000),
  query_block_no INTEGER,
  rewritten_txt  VARCHAR2(2000),
  message        VARCHAR2(512),
  pass           VARCHAR2(3),
  mv_in_msg      VARCHAR2(30),
  measure_in_msg VARCHAR2(30),
  join_back_tbl  VARCHAR2(30),
  join_back_col  VARCHAR2(30),
  original_cost  INTEGER,
  rewritten_cost INTEGER,
  flags          INTEGER,
  reserved1      INTEGER,
  reserved2      VARCHAR2(10)
)
tablespace DW_DEFAULT01
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
prompt Creating table SANITY_CHECKS
prompt ============================
prompt
create table SDM.SANITY_CHECKS
(
  sanity_run_gid  NUMBER,
  sanity_desc     VARCHAR2(100),
  district        VARCHAR2(30),
  log_file        VARCHAR2(200),
  table_name      VARCHAR2(35),
  cur_recs_loaded NUMBER,
  cur_recs_failed NUMBER,
  cur_pct_failed  NUMBER(5,2),
  create_date     DATE default SYSDATE
)
tablespace DW_DEFAULT01
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
prompt Creating table SNAPSHOT_ENROLLMENT
prompt ==================================
prompt
create table SDM.SNAPSHOT_ENROLLMENT
(
  loc_county_dist_id     VARCHAR2(6) not null,
  stu_sid                NUMBER(9) not null,
  loc_sid                NUMBER(6) not null,
  date_sid               NUMBER,
  recent_enroll_date_sid CHAR(5),
  cnt                    NUMBER(1) not null,
  inactive_record        NUMBER(1),
  process_dt             DATE not null,
  stu_lep_code           NUMBER(1),
  stu_race               VARCHAR2(1),
  stu_free_redu_lnch     NUMBER(1),
  stu_cur_grd_lvl        VARCHAR2(25),
  stu_primary_ese_cd     VARCHAR2(2),
  ada_enr_cnt            NUMBER(2,1),
  race_ethnicity_sid     NUMBER(4)
)
tablespace DW_DEFAULT01
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
prompt Creating table STAFF_ABSENT_FACT
prompt ================================
prompt
create table SDM.STAFF_ABSENT_FACT
(
  loc_county_dist_id  VARCHAR2(6) not null,
  loc_sid             NUMBER(6) not null,
  abt_sid             NUMBER(6),
  abr_sid             NUMBER(6),
  staff_sid           NUMBER(6) not null,
  sta_date_sid        NUMBER,
  process_dt          DATE,
  sta_absence_id      VARCHAR2(40),
  sta_reason_id       VARCHAR2(8),
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
comment on column SDM.STAFF_ABSENT_FACT.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
create unique index SDM.UXSTAFF_ABS_STAFF_DATE_TYPE_ID on SDM.STAFF_ABSENT_FACT (STAFF_SID, STA_DATE_SID, ABT_SID, STA_ABSENCE_ID)
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
prompt Creating table STAFF_ABSENT_FACT_PRIORYR
prompt ========================================
prompt
create table SDM.STAFF_ABSENT_FACT_PRIORYR
(
  loc_county_dist_id  VARCHAR2(6) not null,
  loc_sid             NUMBER(6) not null,
  abt_sid             NUMBER(6),
  abr_sid             NUMBER(6),
  staff_sid           NUMBER(6) not null,
  sta_date_sid        NUMBER,
  sta_absence_id      VARCHAR2(40),
  sta_reason_id       VARCHAR2(8),
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
prompt Creating table STAFF_ABSENT_REASON_DIM
prompt ======================================
prompt
create table SDM.STAFF_ABSENT_REASON_DIM
(
  loc_county_dist_id VARCHAR2(6) not null,
  abr_sid            INTEGER not null,
  abr_key            VARCHAR2(40) not null,
  abr_id             VARCHAR2(40) not null,
  abr_description    VARCHAR2(50),
  abr_grouping       VARCHAR2(40),
  abr_ytd_count      NUMBER,
  abr_total_count    NUMBER,
  create_dt          DATE not null,
  last_updt_dt       DATE not null,
  eff_start_dt       DATE not null,
  eff_end_dt         DATE,
  cur_indicator      CHAR(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.STAFF_ABSENT_REASON_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STAFF_ABSENT_REASON_DIM.abr_key
  is 'STAFF ABSENT REASON  KEY indicates the key that defines the staff absence reason record.';
comment on column SDM.STAFF_ABSENT_REASON_DIM.abr_id
  is 'STAFF ABSENT REASON ID indicates the business ID for the staff absent reason.';
comment on column SDM.STAFF_ABSENT_REASON_DIM.abr_description
  is 'ABSENT REASON DESCRIPTION indicates the description of the absence reason.';
comment on column SDM.STAFF_ABSENT_REASON_DIM.abr_grouping
  is 'STAFF ABSENT REASON GROUPING indicates  a code available for grouping Staff Absent reasons for reporting purposes.';
comment on column SDM.STAFF_ABSENT_REASON_DIM.abr_total_count
  is 'TOTAL COUNT indicates the lifetime count of usage of staff absent reason.';

prompt
prompt Creating table STAFF_ABSENT_TYPE_DIM
prompt ====================================
prompt
create table SDM.STAFF_ABSENT_TYPE_DIM
(
  loc_county_dist_id VARCHAR2(6) not null,
  abt_sid            INTEGER not null,
  abt_key            VARCHAR2(40) not null,
  abt_id             VARCHAR2(40) not null,
  abt_description    VARCHAR2(50),
  abt_grouping       VARCHAR2(40),
  abt_ytd_count      NUMBER,
  abt_total_count    NUMBER,
  create_dt          DATE not null,
  last_updt_dt       DATE not null,
  eff_start_dt       DATE not null,
  eff_end_dt         DATE,
  cur_indicator      CHAR(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.STAFF_ABSENT_TYPE_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STAFF_ABSENT_TYPE_DIM.abt_key
  is 'STAFF ABSENT TYPE KEY indicates the key that defines the staff absence record.';
comment on column SDM.STAFF_ABSENT_TYPE_DIM.abt_id
  is 'STAFF ABSENT TYPE ID indicates the business ID of the staff absence type.';
comment on column SDM.STAFF_ABSENT_TYPE_DIM.abt_description
  is 'ABSENT TYPE DESCRIPTION indicates the description of the staff absence type.';

prompt
prompt Creating table STAFF_DIM
prompt ========================
prompt
create table SDM.STAFF_DIM
(
  loc_county_dist_id        VARCHAR2(25) not null,
  staff_sid                 NUMBER(6) not null,
  staff_key                 VARCHAR2(16) not null,
  staff_id                  VARCHAR2(9),
  staff_full_name           VARCHAR2(70),
  staff_last_name           VARCHAR2(35),
  staff_middle_name         VARCHAR2(35),
  staff_first_name          VARCHAR2(35),
  staff_city                VARCHAR2(35),
  staff_state               VARCHAR2(25),
  staff_zip                 VARCHAR2(10),
  staff_edu_lvl             VARCHAR2(10),
  staff_ethnicity           VARCHAR2(45),
  staff_gender              VARCHAR2(1),
  staff_type                VARCHAR2(35),
  staff_job_code            VARCHAR2(30),
  staff_job_code_dt         DATE,
  staff_yrs_in_jb_cd        NUMBER(2),
  staff_yrs_ttl_exp         NUMBER(2),
  staff_growth_plan         VARCHAR2(20),
  create_dt                 DATE not null,
  last_updt_dt              DATE not null,
  eff_start_dt              DATE not null,
  eff_end_dt                DATE,
  cur_indicator             CHAR(1) not null,
  staff_race                VARCHAR2(1),
  race_ethnicity_sid        NUMBER(4),
  race_ethnicity_short_desc VARCHAR2(80)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.STAFF_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STAFF_DIM.staff_key
  is 'STAFF KEY indicates the key that defines the staff record.';
comment on column SDM.STAFF_DIM.staff_id
  is 'STAFF ID indicates the staff code as generated by the district Student Information System (SIS) to which this staff member belongs.';
comment on column SDM.STAFF_DIM.staff_full_name
  is 'STAFF FULL NAME indicates the full name of the staff member.';
comment on column SDM.STAFF_DIM.staff_last_name
  is 'STAFF LAST NAME indicates the last name of the staff member.';
comment on column SDM.STAFF_DIM.staff_first_name
  is 'STAFF FIRST NAME indicates the first name of the staff member.';
comment on column SDM.STAFF_DIM.staff_city
  is 'STAFF CITY indicates the name of the city in which the staff member resides.';
comment on column SDM.STAFF_DIM.staff_state
  is 'STAFF STATE indicates the name of the state in which the staff member resides.';
comment on column SDM.STAFF_DIM.staff_zip
  is 'STAFF ZIP indicates the postal zip code of the staff member.  This should be the zip+4 code.';
comment on column SDM.STAFF_DIM.staff_edu_lvl
  is 'STAFF EDUCATION LEVEL indicates the highest education level attained by the staff member.';
comment on column SDM.STAFF_DIM.staff_ethnicity
  is 'STAFF ETHNICITY indicates the ethnicity of the staff member.';
comment on column SDM.STAFF_DIM.staff_gender
  is 'STAFF GENDER indicates the gender of the staff member.';
comment on column SDM.STAFF_DIM.staff_type
  is 'STAFF TYPE indicates the type of staff member the individual.';
comment on column SDM.STAFF_DIM.staff_job_code
  is 'STAFF JOB CODE indicates the job code of the staff member.';
comment on column SDM.STAFF_DIM.staff_job_code_dt
  is 'STAFF JOB CODE DATE indicates the date that this job code was first assigned to the staff member.';
comment on column SDM.STAFF_DIM.staff_yrs_in_jb_cd
  is 'STAFF YEARS IN JOB indicates the number of years experience that this staff member has had in this job code.';
comment on column SDM.STAFF_DIM.staff_yrs_ttl_exp
  is 'STAFF YEARS TOTAL EXPERIENCE indicates the total number of years as derived and loaded into the staging area.';
comment on column SDM.STAFF_DIM.staff_growth_plan
  is 'STAFF GROWTH PLAN indicates a specific growth/staff development plan in which a staff member participates.';
comment on column SDM.STAFF_DIM.race_ethnicity_short_desc
  is 'Concatenation of the students selected ethnicity and race(s)';
create bitmap index SDM.BMI_CDC_STAFF_DIM on SDM.STAFF_DIM (LOC_COUNTY_DIST_ID)
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
alter table SDM.STAFF_DIM
  add constraint PK_STAFF_DIM primary key (STAFF_SID)
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
alter index SDM.PK_STAFF_DIM nologging;

prompt
prompt Creating table STAFF_PAC_DIM
prompt ============================
prompt
create table SDM.STAFF_PAC_DIM
(
  sta_pac_sid      NUMBER(6) not null,
  record_type_cd   VARCHAR2(2) not null,
  record_type_desc VARCHAR2(30) not null,
  eff_start_dt     TIMESTAMP(6) not null,
  eff_end_dt       TIMESTAMP(6),
  create_dt        TIMESTAMP(6) not null,
  lst_upd_dt       TIMESTAMP(6) not null,
  cur_ind          VARCHAR2(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table STAFF_SCHDL_FACT
prompt ===============================
prompt
create table SDM.STAFF_SCHDL_FACT
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_key         VARCHAR2(51) not null,
  course_sid         NUMBER(6) not null,
  staff_sid          NUMBER(6) not null,
  schl_year          VARCHAR2(4),
  loc_sid            NUMBER(6) not null,
  section_id         VARCHAR2(18) not null,
  staff_id           VARCHAR2(20),
  term               VARCHAR2(5) not null,
  from_period        VARCHAR2(8),
  to_period          VARCHAR2(8),
  cert_flag          VARCHAR2(5),
  from_dt            DATE,
  from_hour          VARCHAR2(2),
  from_minute        VARCHAR2(2),
  to_dt              DATE,
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
  process_dt         DATE not null,
  inactive_record    NUMBER(1),
  from_date          DATE,
  to_date            DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.STAFF_SCHDL_FACT.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STAFF_SCHDL_FACT.record_key
  is 'RECORD KEY indiates the composit key that allows a direct join to the Student Schedule Fact.';
comment on column SDM.STAFF_SCHDL_FACT.schl_year
  is 'SCHOOL YEAR indicates the school year associated with the staff schedule entry.';
comment on column SDM.STAFF_SCHDL_FACT.section_id
  is 'SECTION ID indicates the ID of the section associated with the staff schedule entry.';
comment on column SDM.STAFF_SCHDL_FACT.staff_id
  is 'STAFF ID indicates the ID of actual physical staff ID number from the source system.';
comment on column SDM.STAFF_SCHDL_FACT.term
  is 'TERM indicates the term of the staff schedule course section.';
comment on column SDM.STAFF_SCHDL_FACT.from_period
  is 'STARTING PERIOD OF SECTION indicates the beginning period of the course within the staff schedule for a given day.';
comment on column SDM.STAFF_SCHDL_FACT.to_period
  is 'ENDING PERIOD OF SECTION indicates the ending period of the course within the staff schedule for a given day.';
comment on column SDM.STAFF_SCHDL_FACT.cert_flag
  is 'CERTIFICATION FLAG indicates the certification flag.';
comment on column SDM.STAFF_SCHDL_FACT.from_hour
  is 'START HOUR OF SECTION indicates the hour the class/section is taught.';
comment on column SDM.STAFF_SCHDL_FACT.from_minute
  is 'START MINUTE OF SECTION indicates the minute the class/section starts and expressed as number of minutes past the hour.';
comment on column SDM.STAFF_SCHDL_FACT.to_hour
  is 'END HOUR OF SECTION indicates the ending hour for this class/section.';
comment on column SDM.STAFF_SCHDL_FACT.to_minute
  is 'END MINUTE OF SECTION indicates the ending minute for the class/section and expressed as number of minutes past the hour.';
comment on column SDM.STAFF_SCHDL_FACT.mnts_per_week
  is 'MINUTES PER WEEK indicates the number of minutes per week the class/section is offered.';
comment on column SDM.STAFF_SCHDL_FACT.day_1
  is 'DAY 1 OF SECTION indicates the first day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.day_2
  is 'DAY 2 OF SECTION indicates the second day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.day_3
  is 'DAY 3 OF SECTION indicates the third day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.day_4
  is 'DAY 4 OF SECTION indicates the fourth day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.day_5
  is 'DAY 5 OF SECTION indicates the fifth day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.day_6
  is 'DAY 6 OF SECTION indicates the sixth day of the physical week on which the class is taught.';
comment on column SDM.STAFF_SCHDL_FACT.nbr_dys_in_week
  is 'NUMBER OF DAYS/WEEK indicates the number of days per week that this class/section meets.';
comment on column SDM.STAFF_SCHDL_FACT.max_seats
  is 'MAXIMUM SEATS indicates the maximum number of students who can be scheduled for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.occupancy_term_1
  is 'ACTUAL OCCUPANCY TERM 1 indicates the actual accupancy (number of students) of this class during the first term that it was taught.';
comment on column SDM.STAFF_SCHDL_FACT.occupancy_term_2
  is 'ACTUAL OCCUPANCY TERM 2 indicates the actual accupancy (number of students) of this class during the second term that it was taught.';
comment on column SDM.STAFF_SCHDL_FACT.building
  is 'BUILDING OF SECTION indicates the physical building in which the course/section meets.';
comment on column SDM.STAFF_SCHDL_FACT.room
  is 'ROOM OF SECTION indicates the physical room in which the course/section meets.';
comment on column SDM.STAFF_SCHDL_FACT.fefp_funding_nbr
  is 'SPECIAL FUNDING SOURCE indicates a funding number that identifies  whether or not a specific class belongs to a special funding progam.';
comment on column SDM.STAFF_SCHDL_FACT.fte_elgblty_flag
  is 'FTE ELIGIBILITY indicates whether or not this course/section is eligible for inclusion in calculations for full time enrollment. (FTE)';
comment on column SDM.STAFF_SCHDL_FACT.from_grd_lvl
  is 'LOWEST GRADE LEVEL OF SECTION indicates  the beginning grade level for which the course/section is available.';
comment on column SDM.STAFF_SCHDL_FACT.to_grd_lvl
  is 'HIGHEST GRADE LEVEL OF SECTION indicates the highest grad elevel for which the course/section is available.';
comment on column SDM.STAFF_SCHDL_FACT.grd_elgblty_flag
  is 'GRADE ELIGIBILITY is a flag that indicates if this course/section will be assigned a grade.';
comment on column SDM.STAFF_SCHDL_FACT.drpout_prev_flag
  is 'DROPOUT STATUS is a flag that indicates the course/section is available to someone who previously dropped out of the class.';
comment on column SDM.STAFF_SCHDL_FACT.bell_schdl
  is 'BELL SCHEDULE indicates the bell schedule to which this course/section is assigned.';
comment on column SDM.STAFF_SCHDL_FACT.calendar_1
  is 'CALENDAR 1 indicates a code to identify which calendar program this course/section is used against.';
comment on column SDM.STAFF_SCHDL_FACT.calendar_2
  is 'CALENDAR 2 indicates a second code to identify which calendar program this course/section is used against.';
comment on column SDM.STAFF_SCHDL_FACT.calendar_3
  is 'CALENDAR 3 indicates a third code to identify which calendar program this course/section is used against.';
comment on column SDM.STAFF_SCHDL_FACT.calendar_4
  is 'CALENDAR 4 indicates a fourth code to identify which calendar program this course/section is used against.';
comment on column SDM.STAFF_SCHDL_FACT.instructional_stng
  is 'INSTRUCTIONAL SETTING indicates the instructional setting in which this course/section is to be taught.';
comment on column SDM.STAFF_SCHDL_FACT.class_hours
  is 'TOTAL CLASS HOURS indicates the total calss hours associated with this class/section.';
comment on column SDM.STAFF_SCHDL_FACT.voc_subprgrm
  is 'VOCATIONAL PROGRAM CODE indicates the code to identify the vocational sub-program which this course/section is part of.';
comment on column SDM.STAFF_SCHDL_FACT.occup_cmpltn_pts
  is 'OCCUPATIONAL FLAG indicates the number of occupational completion points available from the course/section.';
comment on column SDM.STAFF_SCHDL_FACT.program_lngth
  is 'PROGRAM LENGTH indicates the code to identify the total length of the program to which this course/section belongs.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_1
  is 'FEE TYPE 1 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_1
  is 'FEE 1 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_2
  is 'FEE TYPE 2 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_2
  is 'FEE 2 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_3
  is 'FEE TYPE 3 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_3
  is 'FEE 3 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_4
  is 'FEE TYPE 4 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_4
  is 'FEE 4 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_5
  is 'FEE TYPE 5 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_5
  is 'FEE 5 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_6
  is 'FEE TYPE 6 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_6
  is 'FEE 6 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_7
  is 'FEE TYPE 7 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_7
  is 'FEE 7 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_8
  is 'FEE TYPE 8 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_8
  is 'FEE 8 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_type_9
  is 'FEE TYPE 9 indicates the types of fees which are collected for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.fee_amt_9
  is 'FEE 9 AMOUNT indicates fees that may be associated with this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.voc_intent
  is 'VOCATIONAL PROGRAM FLAG indicates a flag to identify whether or not this class/section is part of a vocational program.';
comment on column SDM.STAFF_SCHDL_FACT.incarceration_flag
  is 'INCARCERATION FLAG indicates a flag, when set to true, that identifies the course/section as being offered at a location where students are incarcerated.';
comment on column SDM.STAFF_SCHDL_FACT.voc_spcl_inittivs
  is 'VOCATIONAL SPECIAL INITIATIVES indicates a flag to identify whether or not a course/section belongs to a special vocational initiatives program.';
comment on column SDM.STAFF_SCHDL_FACT.voc_stng
  is 'VOCATIONAL SETTING indicates the vocational setting in which the course/section will be taught.';
comment on column SDM.STAFF_SCHDL_FACT.adlt_spcl_inittivs
  is 'ADULT SPEC INITIATIVES indicates whether or not the course/section belongs to an adult education special initiatives program.';
comment on column SDM.STAFF_SCHDL_FACT.day_night_indctr
  is 'DAY/NIGHT INDICATOR indicates whether this course/section is offered during the daytime or nighttime sessions.';
comment on column SDM.STAFF_SCHDL_FACT.gateway_program
  is 'GATEWAY PROGRAM FLAG indicates whether this course/section is part of an established Gateway Program.';
comment on column SDM.STAFF_SCHDL_FACT.fmly_ltrcy_program
  is 'FAMILY LITERACY FLAG indicates whether this course/section is part of Family Literacy Programs.';
comment on column SDM.STAFF_SCHDL_FACT.dual_enrlmt_indctr
  is 'DUAL ENROLLMENT FLAG indicates whether this course/section is available for dual enrollment status.';
comment on column SDM.STAFF_SCHDL_FACT.co_enrl_stu_indctr
  is 'CO ENROLLMENT FLAG indicates whether or not this course/section is available to co-enrolled students.';
comment on column SDM.STAFF_SCHDL_FACT.hgly_qlified_tchr
  is 'HQT STATUS indicates whether or not this class/section is being taught by a teacher who has obtained Highly Qualified Teacher status.';
comment on column SDM.STAFF_SCHDL_FACT.scheduling_mthd
  is 'SCHEDULING METHOD indicates which scheduling method the district uses for this course/section.';
comment on column SDM.STAFF_SCHDL_FACT.section_team
  is 'SECTION TEAM indicates the team which may be assigned to the section of students for intensive or program support.';
comment on column SDM.STAFF_SCHDL_FACT.spec_ed_flag
  is 'SPECIAL ED FLAG indicates whether this course/section is a special education delivery.';
comment on column SDM.STAFF_SCHDL_FACT.from_date
  is 'START DATE OF SECTION indicates the date the class/section is first taught, beginning date.';
comment on column SDM.STAFF_SCHDL_FACT.to_date
  is 'END DATE OF SECTION indicates the ending date for this class/section.';
create bitmap index SDM.BMI_CDC_STAFF_SCHDL_FACT on SDM.STAFF_SCHDL_FACT (LOC_COUNTY_DIST_ID)
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
create bitmap index SDM.BMI_CRS_SID_STAFF_SCHDL_FACT on SDM.STAFF_SCHDL_FACT (COURSE_SID)
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
create bitmap index SDM.BMI_LOC_SID_STAFF_SCHDL_FACT on SDM.STAFF_SCHDL_FACT (LOC_SID)
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
create bitmap index SDM.BMI_REC_KEY_STAFF_SCHDL_FACT on SDM.STAFF_SCHDL_FACT (RECORD_KEY)
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
create bitmap index SDM.BMI_STAFF_SID_STAFF_SCHDL_FACT on SDM.STAFF_SCHDL_FACT (STAFF_SID)
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
create unique index SDM.UXSFSCH_CS_STF_SEC_PD_TM_CDC_Y on SDM.STAFF_SCHDL_FACT (COURSE_SID, STAFF_SID, SECTION_ID, FROM_PERIOD, TERM, LOC_COUNTY_DIST_ID, SCHL_YEAR)
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
prompt Creating table STUDENT_DIM
prompt ==========================
prompt
create table SDM.STUDENT_DIM
(
  stu_sid                        NUMBER(9) not null,
  loc_county_dist_id             VARCHAR2(6) not null,
  loc_district                   VARCHAR2(25),
  stu_key                        VARCHAR2(40) not null,
  stu_id                         VARCHAR2(16),
  stu_id_2                       VARCHAR2(11),
  stu_full_name                  VARCHAR2(75),
  stu_last_name                  VARCHAR2(30),
  stu_first_name                 VARCHAR2(25),
  stu_middle_name                VARCHAR2(25),
  stu_birth_dt                   DATE,
  stu_addr_1                     VARCHAR2(40),
  stu_addr_2                     VARCHAR2(40),
  stu_city                       VARCHAR2(40),
  stu_state                      VARCHAR2(3),
  stu_zip                        VARCHAR2(10),
  stu_study_area_cd              VARCHAR2(30),
  stu_phone_1                    VARCHAR2(30),
  stu_phone_2                    VARCHAR2(30),
  stu_phone_3                    VARCHAR2(30),
  stu_gender                     VARCHAR2(1),
  stu_race                       VARCHAR2(1),
  stu_ethnicity                  VARCHAR2(40),
  stu_free_redu_lnch             NUMBER(1),
  stu_last_schl                  VARCHAR2(51),
  stu_cur_schl                   VARCHAR2(51),
  stu_next_schl                  VARCHAR2(51),
  stu_last_grd_lvl               VARCHAR2(25),
  stu_cur_grd_lvl                VARCHAR2(25),
  stu_next_grd_lvl               VARCHAR2(25),
  stu_last_hmroom                VARCHAR2(6),
  stu_cur_hmroom                 VARCHAR2(6),
  stu_next_hmroom                VARCHAR2(6),
  stu_cumulative_gpa             NUMBER(8,5),
  stu_cumulative_gpa_2           NUMBER(8,5),
  stu_cumulative_gpa_3           NUMBER(8,5),
  stu_cumulative_gpa_4           NUMBER(8,5),
  stu_honors_gpa                 NUMBER(8,5),
  stu_class_rank                 NUMBER(6),
  stu_class_rank_2               NUMBER(6),
  stu_class_rank_3               NUMBER(6),
  stu_class_rank_4               NUMBER(6),
  stu_entry_dt                   DATE,
  stu_withdrawl_dt               DATE,
  stu_withdrawl_cd               VARCHAR2(80),
  stu_nbr_of_rtntns              NUMBER(1),
  stu_present_cnt                NUMBER(3),
  stu_tardy_cnt                  NUMBER(3),
  stu_abs_unv_cnt                NUMBER(3),
  stu_abs_exc_cnt                NUMBER(3),
  stu_abs_unexc_cnt              NUMBER(3),
  stu_dis_event_cnt              NUMBER(3),
  stu_dis_inc_cnt                NUMBER(3),
  stu_dis_act_cnt                NUMBER(3),
  stu_oos_susp_dys               NUMBER(5,2),
  stu_oos_susp_cnt               NUMBER(3),
  stu_is_susp_dys                NUMBER(5,2),
  stu_is_susp_cnt                NUMBER(3),
  stu_det_dys                    NUMBER(5,2),
  stu_det_cnt                    NUMBER(3),
  stu_bus_susp_dys               NUMBER(5,2),
  stu_bus_susp_cnt               NUMBER(3),
  stu_altplc_sus_dys             NUMBER(5,2),
  stu_plcpen_exp_dys             NUMBER(5,2),
  stu_plc_il_exp_dys             NUMBER(5,2),
  stu_lst_dis_ev_dt              DATE,
  stu_lst_dis_act_dt             DATE,
  stu_lst_oos_dt                 DATE,
  stu_lst_is_dt                  DATE,
  stu_lst_det_dt                 DATE,
  stu_credits_atmptd             NUMBER(4,2),
  stu_credits_ernd               NUMBER(4,2),
  stu_grad_dt                    DATE,
  stu_grad_type                  VARCHAR2(40),
  stu_flag_504                   NUMBER(1),
  stu_lep_code                   VARCHAR2(2),
  stu_lep_entry_dt               DATE,
  stu_lep_exit_dt                DATE,
  stu_pri_lang                   VARCHAR2(30),
  stu_sec_lang                   VARCHAR2(30),
  stu_parent_lang                VARCHAR2(30),
  stu_beg_9_grd_yr               NUMBER(4),
  stu_aip_participat             VARCHAR2(12),
  stu_birth_cntry                VARCHAR2(40),
  stu_dt_entrd_cntry             DATE,
  stu_sup_acad_imp               VARCHAR2(12),
  stu_last_team                  VARCHAR2(4),
  stu_cur_team                   VARCHAR2(4),
  stu_next_team                  VARCHAR2(4),
  stu_primary_ese_cd             VARCHAR2(2),
  stu_erly_clg_entry             NUMBER(1),
  stu_inrly_clg_ntry             NUMBER(1),
  stu_single_parent              NUMBER(1),
  stu_homeless                   NUMBER(1),
  stu_proret_lst_yr              VARCHAR2(25),
  stu_in_intnsv_rdng             NUMBER(1),
  stu_in_intnsv_math             NUMBER(1),
  stu_in_intnsv_la               NUMBER(1),
  stu_is_veteran                 NUMBER(1),
  stu_is_handicapped             NUMBER(1),
  stu_is_teen_parent             NUMBER(1),
  stu_smrschl_status             NUMBER(1),
  stu_is_at_risk                 NUMBER(1),
  stu_is_migrant                 NUMBER(1),
  stu_is_tag                     NUMBER(1),
  stu_is_immigrant               NUMBER(1),
  stu_ale_status                 VARCHAR2(2),
  stu_pk_status                  VARCHAR2(2),
  stu_live_with_cd               VARCHAR2(10),
  stu_title1_status              VARCHAR2(25),
  stu_506_status                 VARCHAR2(25),
  stu_mile_dist                  NUMBER(3),
  stu_trans_zone                 VARCHAR2(5),
  stu_parent_ed_lvl              VARCHAR2(25),
  stu_allocated_schl             VARCHAR2(20),
  stu_transfer_reason            VARCHAR2(80),
  schl_yr                        VARCHAR2(4),
  data_date                      DATE,
  stu_inoculations               VARCHAR2(50),
  stu_uil                        VARCHAR2(25),
  stu_dose_in_series             VARCHAR2(25),
  stu_immunization_dt            DATE,
  stu_dtp                        VARCHAR2(30),
  create_dt                      DATE not null,
  lst_updt_dt                    DATE not null,
  eff_start_dt                   DATE not null,
  eff_end_dt                     DATE,
  cur_indicator                  CHAR(1) not null,
  stu_prior_year_snapshot_flag   VARCHAR2(3),
  stu_current_year_snapshot_flag VARCHAR2(3),
  stu_currently_enrolled_flag    VARCHAR2(3),
  race_ethnicity_sid             NUMBER(4),
  race_ethnicity_short_desc      VARCHAR2(80)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.STUDENT_DIM.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STUDENT_DIM.stu_key
  is 'STUDENT KEY indicates the key that defines the student record.';
comment on column SDM.STUDENT_DIM.stu_id
  is 'STUDENT ID indicates the physical student ID assigned by the district to the student.';
comment on column SDM.STUDENT_DIM.stu_id_2
  is 'STUDENT ID #2 indicates the State ID number for the student.';
comment on column SDM.STUDENT_DIM.stu_full_name
  is 'STUDENT FULL NAME indicates the full name of the student.';
comment on column SDM.STUDENT_DIM.stu_last_name
  is 'STUDENT LAST NAME indicates the last name of the student.';
comment on column SDM.STUDENT_DIM.stu_first_name
  is 'STUDENT FIRST NAME indicates the first name of the student..';
comment on column SDM.STUDENT_DIM.stu_middle_name
  is 'STUDENT MIDDLE NAME indicates the middle name or initial of the student.';
comment on column SDM.STUDENT_DIM.stu_birth_dt
  is 'STUDENT BIRTH DATE indicates the birth date of the student.';
comment on column SDM.STUDENT_DIM.stu_addr_1
  is 'STUDENT ADDR 1 indicates the first address line of the student''s contact address.';
comment on column SDM.STUDENT_DIM.stu_addr_2
  is 'STUDENT ADDR 2 indicates the second address line of the student''s contact address.';
comment on column SDM.STUDENT_DIM.stu_city
  is 'STUDENT CITY indicates the name of the city of the student''s contact address.';
comment on column SDM.STUDENT_DIM.stu_state
  is 'STUDENT STATE indicates the name of the state of the student''s contact address.';
comment on column SDM.STUDENT_DIM.stu_zip
  is 'STUDENT ZIP indicates the postal zip code of the student''s contact address.';
comment on column SDM.STUDENT_DIM.stu_study_area_cd
  is 'STUDENT STUDY AREA indicates the study area code of the student address.  This is the geographical location of the student''s residence.';
comment on column SDM.STUDENT_DIM.stu_phone_1
  is 'STUDENT PHONE 1 indicates the first contact phone number for the student.';
comment on column SDM.STUDENT_DIM.stu_phone_2
  is 'STUDENT PHONE 2 indicates the second contact phone number for the student.';
comment on column SDM.STUDENT_DIM.stu_phone_3
  is 'STUDENT PHONE 3 indicates the third contact phone number for the student.';
comment on column SDM.STUDENT_DIM.stu_gender
  is 'STUDENT GENDER indicates the gender of the student.';
comment on column SDM.STUDENT_DIM.stu_race
  is 'STUDENT RACE indicates the race of the student.';
comment on column SDM.STUDENT_DIM.stu_ethnicity
  is 'STUDENT ETHNICITY indicates the ethnicity of the student.';
comment on column SDM.STUDENT_DIM.stu_last_schl
  is 'STUDENT LAST SCHOOL indicates the LOCATION ID of the school the student attended the prior year.';
comment on column SDM.STUDENT_DIM.stu_cur_schl
  is 'STUDENT CURRENT SCHOOL indicates the LOCATION ID of the school the student current attends.';
comment on column SDM.STUDENT_DIM.stu_next_schl
  is 'STUDENT NEXT SCHOOL indicates the LOCATION ID of the school the student will attend next school year.';
comment on column SDM.STUDENT_DIM.stu_last_grd_lvl
  is 'STUDENT LAST GRADE LEVEL indicates the last grade level in which the student was enrolled.';
comment on column SDM.STUDENT_DIM.stu_cur_grd_lvl
  is 'STUDENT CURRENT GRADE LEVEL indicates the grade level in which the student is currently enrolled.';
comment on column SDM.STUDENT_DIM.stu_last_hmroom
  is 'STUDENT LAST HOMEROOM indicates the homeroom in which the student was last assigned.';
comment on column SDM.STUDENT_DIM.stu_cur_hmroom
  is 'STUDENT CURRENT HOMEROOM indicates the homeroom in which the student is currently assigned.';
comment on column SDM.STUDENT_DIM.stu_next_hmroom
  is 'STUDENT NEXT HOMEROOM indicates the homeroom in which the student will be assigned next.';
comment on column SDM.STUDENT_DIM.stu_cumulative_gpa
  is 'STUDENT CUMULATIVE GPA indicates the current GPA as it related "to-date" to the student.';
comment on column SDM.STUDENT_DIM.stu_cumulative_gpa_2
  is 'STUDENT CUMULATIVE GPA 2 indicates the second GPA value for the student.';
comment on column SDM.STUDENT_DIM.stu_cumulative_gpa_3
  is 'STUDENT CUMULATIVE GPA3 indicates the third GPA value for the student.';
comment on column SDM.STUDENT_DIM.stu_cumulative_gpa_4
  is 'STUDENT CUMULATIVE GPA 4 indicates the fourth GPA value for the student.';
comment on column SDM.STUDENT_DIM.stu_honors_gpa
  is 'STUDENT HONORS GPA indicates the honors GPA value for the student.';
comment on column SDM.STUDENT_DIM.stu_class_rank
  is 'STUDENT CLASS RANK indicates the current class rank that this student has within their graduating class at their high school.';
comment on column SDM.STUDENT_DIM.stu_class_rank_2
  is 'STUDENT CLASS RANK 2 indicates the second class rank value for the student.';
comment on column SDM.STUDENT_DIM.stu_class_rank_3
  is 'STUDENT CLASS RANK 3 indicates the third class rank value for the student.';
comment on column SDM.STUDENT_DIM.stu_class_rank_4
  is 'STUDENT CLASS RANK 4 indicates the fourth class rank value for the student.';
comment on column SDM.STUDENT_DIM.stu_entry_dt
  is 'STUDENT ENTRY DATE indicates the date the student entered the school.';
comment on column SDM.STUDENT_DIM.stu_nbr_of_rtntns
  is 'STUDENT NUMBER OF RETENTIONS indicates the number of times the student has been retained.';
comment on column SDM.STUDENT_DIM.stu_present_cnt
  is 'STUDENT DAYS PRESENT indicates the total number of days the student has been present for in the current school year.';
comment on column SDM.STUDENT_DIM.stu_tardy_cnt
  is 'STUDENT NUMBER OF TARDIES indicates the number of tardy counts the student has for the current school year.';
comment on column SDM.STUDENT_DIM.stu_abs_unv_cnt
  is 'STUDENT UNVERIFIED ABSENT COUNT indicates the number of unverified absences the student has for the current school year.';
comment on column SDM.STUDENT_DIM.stu_abs_exc_cnt
  is 'STUDENT EXCUSED ABSENT COUNT indicates the number of excused absences the student has for the current school year.';
comment on column SDM.STUDENT_DIM.stu_abs_unexc_cnt
  is 'STUDENT UNEXCUSED ABSENT COUNT indicates the number of unexcused absences the student has for the current school year.';
comment on column SDM.STUDENT_DIM.stu_dis_event_cnt
  is 'STUDENT DISCIPLINE EVENT COUNT indicates the number of discipline events for this student.';
comment on column SDM.STUDENT_DIM.stu_dis_inc_cnt
  is 'STUDENT INCIDENT COUNT indicates the number of discipline incidents for this student.';
comment on column SDM.STUDENT_DIM.stu_dis_act_cnt
  is 'STUDENT ACTION COUNT indicates the count of discipline actions for this student.';
comment on column SDM.STUDENT_DIM.stu_oos_susp_cnt
  is 'STUDENT OUT OF SCHOOL SUSPENSION COUNT indicates the total number of Out of School (OSS) Suspensions for this student.';
comment on column SDM.STUDENT_DIM.stu_is_susp_dys
  is 'STUDENT IN SCHOOL SUSPENSION DAYS indicates the total number of In-School (IS) Suspension days for this student.';
comment on column SDM.STUDENT_DIM.stu_is_susp_cnt
  is 'STUDENT IN SCHOOL SUSPENSION COUNT indicates the total number of In-School (IS) Suspensions for this student.';
comment on column SDM.STUDENT_DIM.stu_det_dys
  is 'STUDENT DETENTION DAYS indicates the total number of detention days for the student.';
comment on column SDM.STUDENT_DIM.stu_det_cnt
  is 'STUDENT DETENTION CNT indicates the total number of detentions for the student.';
comment on column SDM.STUDENT_DIM.stu_bus_susp_dys
  is 'STUDENT BUS SUSPENSION DAYS indicates the total number of bus suspension days for the student.';
comment on column SDM.STUDENT_DIM.stu_bus_susp_cnt
  is 'STUDENT BUS SUSPENSION CNT indicates the total number of bus suspensions for the student.';
comment on column SDM.STUDENT_DIM.stu_altplc_sus_dys
  is 'STUDENT ALTERNATE PLACEMENT SUSPENSION DAYS indicates the alternate placement suspension days for the student.';
comment on column SDM.STUDENT_DIM.stu_plcpen_exp_dys
  is 'STUDENT ALTERNATE PLACEMENT SUSPENSION CNT indicates the total number of days a student was expelled from school while awaiting alternate placement for the student.';
comment on column SDM.STUDENT_DIM.stu_plc_il_exp_dys
  is 'STUDENT PLACEMENT LOCATION indicates the total number of days of placement in an alternate program instead of being expelled from school for the student.';
comment on column SDM.STUDENT_DIM.stu_lst_dis_ev_dt
  is 'STUDENT LAST DISCIPLINE EVEN DATE indicates the date of the last discipline event for the student.';
comment on column SDM.STUDENT_DIM.stu_lst_dis_act_dt
  is 'STUDENT LAST DISCIPLINE ACTION DATE indicates the date of the last discipline action for the student.';
comment on column SDM.STUDENT_DIM.stu_lst_oos_dt
  is 'STUDENT LAST OUT OF SCHOOL SUSPENSION DATE indicates the date of the last Out-Of-School (OSS) Suspension for the student.';
comment on column SDM.STUDENT_DIM.stu_lst_is_dt
  is 'STUDENT LAST IN SCHOOL SUSPENSION DATE indicates the date of the last In-School Suspension for the student.';
comment on column SDM.STUDENT_DIM.stu_lst_det_dt
  is 'STUDENT LAST DETENTION DATE indicates the date of the last detention for the student.';
comment on column SDM.STUDENT_DIM.stu_credits_atmptd
  is 'STUDENT CREDITS ATTEMPTED indicates the total number of credits the student has attempted.';
comment on column SDM.STUDENT_DIM.stu_credits_ernd
  is 'STUDENT CREDITS EARNED indicates the total number of credits the student has earned.';
comment on column SDM.STUDENT_DIM.stu_grad_dt
  is 'STUDENT GRADUATION DATE indicates the graduation date of the student.';
comment on column SDM.STUDENT_DIM.stu_grad_type
  is 'STUDENT GRADUATION TYPE indicates the graduation type that this student earned.';
comment on column SDM.STUDENT_DIM.stu_flag_504
  is 'STUDENT 504 STATUS indicates whether or not the student is a 504 qualifying student.';
comment on column SDM.STUDENT_DIM.stu_lep_code
  is 'STUDENT LEP CODE indicates whether or not the student is identified as Limited English Proficient (LEP)';
comment on column SDM.STUDENT_DIM.stu_lep_entry_dt
  is 'STUDENT LEP ENTRY DATE indicates the date that the student was identified as Limited English Proficient (LEP)';
comment on column SDM.STUDENT_DIM.stu_lep_exit_dt
  is 'STUDENT LEP EXIT DATE indicates the date that the student was no longer identified as Limited English Proficient (LEP)';
comment on column SDM.STUDENT_DIM.stu_pri_lang
  is 'STUDENT PRIMARY LANGUAGE indicates the student''s primary language.';
comment on column SDM.STUDENT_DIM.stu_sec_lang
  is 'STUDENT SECONDARY LANGUAGE indicates the student''s seconday language.';
comment on column SDM.STUDENT_DIM.stu_parent_lang
  is 'STUDENT PARENTS LANGUAGE indicates the language of the student''s parents.';
comment on column SDM.STUDENT_DIM.stu_beg_9_grd_yr
  is 'STUDENT START 9TH GRADE YEAR indicates the year in which the student started their 9th grade year.';
comment on column SDM.STUDENT_DIM.stu_aip_participat
  is 'STUDENT AIP PARTICIPATION indicates whether or not this student participates in an Academic Improvement Program.';
comment on column SDM.STUDENT_DIM.stu_birth_cntry
  is 'STUDENT BIRTH COUNTY indicates the student''s coutry of origin (or birth)';
comment on column SDM.STUDENT_DIM.stu_dt_entrd_cntry
  is 'STUDENT DATE ENTERED COUNTY indicates the date the student entered the country.';
comment on column SDM.STUDENT_DIM.stu_sup_acad_imp
  is 'STUDENT SUPPLEMENTAL ACADEMIC IMPROVEMENT PLAN indicates whether or not a student is participating in a supplemental academic improvement program.';
comment on column SDM.STUDENT_DIM.stu_last_team
  is 'STUDENT LAST TEAM indicates the last year''s team assigned to the student at the school.';
comment on column SDM.STUDENT_DIM.stu_cur_team
  is 'STUDENT CURRENT TEAM indicates the current team assigned to the student at the school.';
comment on column SDM.STUDENT_DIM.stu_next_team
  is 'STUDENT NEXT TEAM indicates the next team that will be assigned to the student at the school.';
comment on column SDM.STUDENT_DIM.stu_primary_ese_cd
  is 'STUDENT PRIMARY ESE CODE indicates whether or not a student is enrolled in an ESE program.';
comment on column SDM.STUDENT_DIM.stu_erly_clg_entry
  is 'STUDENT EARLY COLLEGE ENTRY PROGRAM indicates whether or not a student is eligible for early college entry.';
comment on column SDM.STUDENT_DIM.stu_inrly_clg_ntry
  is 'STUDENT EARLY COLLEGE ENTRY indicates whether or not the student is currently enrolled in an early college entry program.';
comment on column SDM.STUDENT_DIM.stu_single_parent
  is 'STUDENT SINGLE PARENT indicates if a student is a member of a single parent household.';
comment on column SDM.STUDENT_DIM.stu_homeless
  is 'STUDENT HOMELESS indicates whether or not a student is currently a member of a homeless family.';
comment on column SDM.STUDENT_DIM.stu_proret_lst_yr
  is 'STUDENT PROMOTED/RETAINED LAST YEAR indicates whether the student was promoted or retained at the end of the prior school year.';
comment on column SDM.STUDENT_DIM.stu_in_intnsv_rdng
  is 'STUDENT INTENSIVE READING PROGRAM indicates whether the student is enrolled in an intensive reading program.';
comment on column SDM.STUDENT_DIM.stu_in_intnsv_math
  is 'STUDENT INTENSIVE MATH PROGRAM indicates whether the student is enrolled in an intensive math program.';
comment on column SDM.STUDENT_DIM.stu_in_intnsv_la
  is 'STUDENT INTENSIVE LA PROGRAM indicates whether the student is enrolled in an intensive Language Arts program.';
comment on column SDM.STUDENT_DIM.stu_is_veteran
  is 'STUDENT VETERAN FLAG indicates whether the student is a veteran.';
comment on column SDM.STUDENT_DIM.stu_is_handicapped
  is 'STUDENT HANDICAPPED indicates whether the student is handicapped.';
comment on column SDM.STUDENT_DIM.stu_is_teen_parent
  is 'STUDENT TEEN PARENT FLAG indicates whether the student is a teen parent.';
comment on column SDM.STUDENT_DIM.stu_smrschl_status
  is 'STUDENT SUMMER SCHOOL FLAG indicates whether or not the student has been recommended and subsequently accepted in summer school enrollment.';
comment on column SDM.STUDENT_DIM.stu_is_at_risk
  is 'STUDENT IS AT RISK indicates whether or not the student is identified as at-risk of dropping out of school.';
comment on column SDM.STUDENT_DIM.stu_is_migrant
  is 'STUDENT IS MIGRANT indicated whether or not the student is enrolled in the school as part of a migrant worker program.';
comment on column SDM.STUDENT_DIM.stu_is_tag
  is 'STUDENT IS TALENTED/GIFTED indicates whether or not the student is cureently a part of the Talented and Gifted program.';
comment on column SDM.STUDENT_DIM.stu_is_immigrant
  is 'STUDENT IS IMMIGRANT indicates whether or not the student is an immigrant.';
comment on column SDM.STUDENT_DIM.stu_ale_status
  is 'STUDENT ALE STATUS indicates whether or not the student is in Alternative Learning Environment Programs.';
comment on column SDM.STUDENT_DIM.stu_pk_status
  is 'STUDENT PRE K STATUS indicates whether the student is in Pre Kindergarten programs.';
comment on column SDM.STUDENT_DIM.stu_live_with_cd
  is 'STUDENT LIVES WITH CODE indicates who the student lives with.';
comment on column SDM.STUDENT_DIM.stu_title1_status
  is 'STUDENT TITLE 1 STATUS indicates whether the student is receiving Title 1 services.';
comment on column SDM.STUDENT_DIM.stu_506_status
  is 'STUDENT 506 STATUS indicates the 506 status of the student.';
comment on column SDM.STUDENT_DIM.stu_mile_dist
  is 'DISTANCE TRANSPORTED indicates the distance the student is transported each day.';
comment on column SDM.STUDENT_DIM.stu_trans_zone
  is 'TRANSPORTATION ZONE indicates the transportation zone used to identify geographic location of the student.';
comment on column SDM.STUDENT_DIM.stu_parent_ed_lvl
  is 'PARENTS EDUCATION LEVEL indicates the education level of the student''s parents.';
comment on column SDM.STUDENT_DIM.stu_allocated_schl
  is 'STUDENT ALLOCATED SCHOOL indicates the school the student would attend based upon their address within school boundaries.';
comment on column SDM.STUDENT_DIM.stu_transfer_reason
  is 'STUDENT TRANSFER REASON indicates a reason the student is attending a different school than the allocated school.';
comment on column SDM.STUDENT_DIM.schl_yr
  is 'STUDENT SCHOOL YEAR indicates the school year to which the student record belongs.';
comment on column SDM.STUDENT_DIM.stu_inoculations
  is 'INOCULATION indicates the';
comment on column SDM.STUDENT_DIM.stu_uil
  is 'STUDENT UIL ELIGIBILITY indicates whether or not the student is eligible to participate in Univeristy Interscholastic League (UIL) governed activities.';
comment on column SDM.STUDENT_DIM.stu_dose_in_series
  is 'DOSE IN SERIES indicates';
comment on column SDM.STUDENT_DIM.stu_immunization_dt
  is 'IMMUNIZATION DATE indicates';
comment on column SDM.STUDENT_DIM.stu_dtp
  is 'IMMUNIZATION DESCRIPTION indicates the description of the immunization.';
comment on column SDM.STUDENT_DIM.stu_prior_year_snapshot_flag
  is 'Yes - DENOTES THAT THE STUDENT WAS ENROLLED ON THE SNAPSHOT DATE LAST SCHOOL YEAR';
comment on column SDM.STUDENT_DIM.stu_current_year_snapshot_flag
  is 'Yes - DENOTES THAT THE STUDENT WAS ENROLLED ON THE SNAPSHOT DATE THIS SCHOOL YEAR';
comment on column SDM.STUDENT_DIM.stu_currently_enrolled_flag
  is 'Yes - DENOTES THAT THE STUDENT IS ENROLLED AS OF THE MOST RECENT VALID ENROLLMENT DATE';
create bitmap index SDM.BMI_CDC_STUDENT_DIM on SDM.STUDENT_DIM (LOC_COUNTY_DIST_ID)
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
create index SDM.IX_STUDENT_FLAG_504 on SDM.STUDENT_DIM (STU_FLAG_504)
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
create index SDM.IX_STUDENT_FREE_REDU_LNCH on SDM.STUDENT_DIM (STU_FREE_REDU_LNCH)
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
create index SDM.IX_STUDENT_ID on SDM.STUDENT_DIM (STU_ID)
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
create index SDM.IX_STUDENT_PRIMARY_ESE_CD on SDM.STUDENT_DIM (STU_PRIMARY_ESE_CD)
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
create bitmap index SDM.bmi_stu_cur_grd_lvl on SDM.STUDENT_DIM (STU_CUR_GRD_LVL)
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
create bitmap index SDM.bmi_stu_cur_schl on SDM.STUDENT_DIM (STU_CUR_SCHL)
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
create bitmap index SDM.bmi_stu_key on SDM.STUDENT_DIM (STU_KEY)
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
create bitmap index SDM.bmi_stu_race on SDM.STUDENT_DIM (STU_RACE)
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
create bitmap index SDM.bmi_student_ethnicity on SDM.STUDENT_DIM (STU_ETHNICITY)
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
create bitmap index SDM.bmi_student_id_2 on SDM.STUDENT_DIM (STU_ID_2)
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
create bitmap index SDM.bmi_student_lep_code on SDM.STUDENT_DIM (STU_LEP_CODE)
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
alter table SDM.STUDENT_DIM
  add constraint PK_STUDENT_DIM primary key (STU_SID)
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
alter index SDM.PK_STUDENT_DIM nologging;

prompt
prompt Creating table STUDENT_DIM_HISTORY
prompt ==================================
prompt
create table SDM.STUDENT_DIM_HISTORY
(
  stu_sid                        NUMBER(9) not null,
  loc_county_dist_id             VARCHAR2(6) not null,
  loc_district                   VARCHAR2(25),
  stu_key                        VARCHAR2(40) not null,
  stu_id                         VARCHAR2(16),
  stu_id_2                       VARCHAR2(11),
  stu_full_name                  VARCHAR2(75),
  stu_last_name                  VARCHAR2(30),
  stu_first_name                 VARCHAR2(25),
  stu_middle_name                VARCHAR2(25),
  stu_birth_dt                   DATE,
  stu_addr_1                     VARCHAR2(40),
  stu_addr_2                     VARCHAR2(40),
  stu_city                       VARCHAR2(40),
  stu_state                      VARCHAR2(3),
  stu_zip                        VARCHAR2(10),
  stu_study_area_cd              VARCHAR2(30),
  stu_phone_1                    VARCHAR2(30),
  stu_phone_2                    VARCHAR2(30),
  stu_phone_3                    VARCHAR2(30),
  stu_gender                     VARCHAR2(1),
  stu_race                       VARCHAR2(1),
  stu_ethnicity                  VARCHAR2(40),
  stu_free_redu_lnch             NUMBER(1),
  stu_last_schl                  VARCHAR2(51),
  stu_cur_schl                   VARCHAR2(51),
  stu_next_schl                  VARCHAR2(51),
  stu_last_grd_lvl               VARCHAR2(25),
  stu_cur_grd_lvl                VARCHAR2(25),
  stu_next_grd_lvl               VARCHAR2(25),
  stu_last_hmroom                VARCHAR2(6),
  stu_cur_hmroom                 VARCHAR2(6),
  stu_next_hmroom                VARCHAR2(6),
  stu_cumulative_gpa             NUMBER(8,5),
  stu_cumulative_gpa_2           NUMBER(8,5),
  stu_cumulative_gpa_3           NUMBER(8,5),
  stu_cumulative_gpa_4           NUMBER(8,5),
  stu_honors_gpa                 NUMBER(8,5),
  stu_class_rank                 NUMBER(6),
  stu_class_rank_2               NUMBER(6),
  stu_class_rank_3               NUMBER(6),
  stu_class_rank_4               NUMBER(6),
  stu_entry_dt                   DATE,
  stu_withdrawl_dt               DATE,
  stu_withdrawl_cd               VARCHAR2(80),
  stu_nbr_of_rtntns              NUMBER(1),
  stu_present_cnt                NUMBER(3),
  stu_tardy_cnt                  NUMBER(3),
  stu_abs_unv_cnt                NUMBER(3),
  stu_abs_exc_cnt                NUMBER(3),
  stu_abs_unexc_cnt              NUMBER(3),
  stu_dis_event_cnt              NUMBER(3),
  stu_dis_inc_cnt                NUMBER(3),
  stu_dis_act_cnt                NUMBER(3),
  stu_oos_susp_dys               NUMBER(5,2),
  stu_oos_susp_cnt               NUMBER(3),
  stu_is_susp_dys                NUMBER(5,2),
  stu_is_susp_cnt                NUMBER(3),
  stu_det_dys                    NUMBER(5,2),
  stu_det_cnt                    NUMBER(3),
  stu_bus_susp_dys               NUMBER(5,2),
  stu_bus_susp_cnt               NUMBER(3),
  stu_altplc_sus_dys             NUMBER(5,2),
  stu_plcpen_exp_dys             NUMBER(5,2),
  stu_plc_il_exp_dys             NUMBER(5,2),
  stu_lst_dis_ev_dt              DATE,
  stu_lst_dis_act_dt             DATE,
  stu_lst_oos_dt                 DATE,
  stu_lst_is_dt                  DATE,
  stu_lst_det_dt                 DATE,
  stu_credits_atmptd             NUMBER(4,2),
  stu_credits_ernd               NUMBER(4,2),
  stu_grad_dt                    DATE,
  stu_grad_type                  VARCHAR2(40),
  stu_flag_504                   NUMBER(1),
  stu_lep_code                   VARCHAR2(2),
  stu_lep_entry_dt               DATE,
  stu_lep_exit_dt                DATE,
  stu_pri_lang                   VARCHAR2(30),
  stu_sec_lang                   VARCHAR2(30),
  stu_parent_lang                VARCHAR2(30),
  stu_beg_9_grd_yr               NUMBER(4),
  stu_aip_participat             VARCHAR2(12),
  stu_birth_cntry                VARCHAR2(40),
  stu_dt_entrd_cntry             DATE,
  stu_sup_acad_imp               VARCHAR2(12),
  stu_last_team                  VARCHAR2(4),
  stu_cur_team                   VARCHAR2(4),
  stu_next_team                  VARCHAR2(4),
  stu_primary_ese_cd             VARCHAR2(2),
  stu_erly_clg_entry             NUMBER(1),
  stu_inrly_clg_ntry             NUMBER(1),
  stu_single_parent              NUMBER(1),
  stu_homeless                   NUMBER(1),
  stu_proret_lst_yr              VARCHAR2(25),
  stu_in_intnsv_rdng             NUMBER(1),
  stu_in_intnsv_math             NUMBER(1),
  stu_in_intnsv_la               NUMBER(1),
  stu_is_veteran                 NUMBER(1),
  stu_is_handicapped             NUMBER(1),
  stu_is_teen_parent             NUMBER(1),
  stu_smrschl_status             NUMBER(1),
  stu_is_at_risk                 NUMBER(1),
  stu_is_migrant                 NUMBER(1),
  stu_is_tag                     NUMBER(1),
  stu_is_immigrant               NUMBER(1),
  stu_ale_status                 VARCHAR2(2),
  stu_pk_status                  VARCHAR2(2),
  stu_live_with_cd               VARCHAR2(10),
  stu_title1_status              VARCHAR2(25),
  stu_506_status                 VARCHAR2(25),
  stu_mile_dist                  NUMBER(3),
  stu_trans_zone                 VARCHAR2(5),
  stu_parent_ed_lvl              VARCHAR2(25),
  stu_allocated_schl             VARCHAR2(20),
  stu_transfer_reason            VARCHAR2(80),
  schl_yr                        VARCHAR2(4),
  data_date                      DATE,
  stu_inoculations               VARCHAR2(50),
  stu_uil                        VARCHAR2(25),
  stu_dose_in_series             VARCHAR2(25),
  stu_immunization_dt            DATE,
  stu_dtp                        VARCHAR2(30),
  create_dt                      DATE not null,
  lst_updt_dt                    DATE not null,
  eff_start_dt                   DATE not null,
  eff_end_dt                     DATE,
  cur_indicator                  CHAR(1) not null,
  stu_prior_year_snapshot_flag   VARCHAR2(3),
  stu_current_year_snapshot_flag VARCHAR2(3),
  stu_currently_enrolled_flag    VARCHAR2(3),
  dml_op                         CHAR(1),
  op_user                        VARCHAR2(30),
  op_terminal                    VARCHAR2(30),
  change_ts                      DATE
)
tablespace DW_DEFAULT01
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
create bitmap index SDM.BMI_CDC_STUDENT_DIM_HISTORY on SDM.STUDENT_DIM_HISTORY (LOC_COUNTY_DIST_ID)
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

prompt
prompt Creating table STUDENT_ENROLLMENT_STAGE
prompt =======================================
prompt
create table SDM.STUDENT_ENROLLMENT_STAGE
(
  loc_county_dist_id          VARCHAR2(6) not null,
  school_year                 VARCHAR2(4) not null,
  stu_id                      VARCHAR2(16) not null,
  student_sid                 NUMBER not null,
  loc_id                      VARCHAR2(21),
  loc_sid                     NUMBER(8),
  date_sid_begin              NUMBER(8),
  date_sid_end                NUMBER(8),
  academic_day_begin          NUMBER(8),
  academic_dayd_end           NUMBER(8),
  date_id_begin               DATE,
  date_id_end                 DATE,
  entry_date_sid              NUMBER,
  withdrawal_date_sid         NUMBER,
  enrollment_transaction_type VARCHAR2(32),
  days_enrolled               NUMBER,
  create_dt                   DATE not null,
  last_updt_dt                DATE not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_ENROLLMENT_STAGE_GAP
prompt ===========================================
prompt
create table SDM.STUDENT_ENROLLMENT_STAGE_GAP
(
  loc_county_dist_id          VARCHAR2(6) not null,
  school_year                 VARCHAR2(4) not null,
  stu_id                      VARCHAR2(16) not null,
  student_sid                 NUMBER not null,
  loc_id                      VARCHAR2(21) not null,
  loc_sid                     NUMBER(8) not null,
  gap_begin                   NUMBER(8) not null,
  gap_end                     NUMBER(8) not null,
  date_sid_begin              NUMBER(8),
  date_sid_end                NUMBER(8),
  academic_day_begin          NUMBER(8),
  academic_dayd_end           NUMBER(8),
  date_id_begin               DATE,
  date_id_end                 DATE,
  entry_date_sid              NUMBER,
  withdrawal_date_sid         NUMBER,
  enrollment_transaction_type VARCHAR2(32),
  days_enrolled               NUMBER,
  create_dt                   DATE not null,
  last_updt_dt                DATE not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STU_SCHEDULE_FACT
prompt ================================
prompt
create table SDM.STU_SCHEDULE_FACT
(
  loc_county_dist_id VARCHAR2(6) not null,
  record_key         VARCHAR2(51),
  staff_sched_key    VARCHAR2(55) not null,
  school_year        NUMBER(4) not null,
  stu_sid            NUMBER(9) not null,
  loc_sid            NUMBER(6) not null,
  course_sid         NUMBER(6) not null,
  section            VARCHAR2(18),
  from_dt            NUMBER,
  from_time_hour     VARCHAR2(2),
  from_time_min      VARCHAR2(2),
  from_period        VARCHAR2(8),
  to_dt              NUMBER,
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
  rspbl_sci_instr    VARCHAR2(1),
  process_dt         DATE not null,
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
comment on column SDM.STU_SCHEDULE_FACT.loc_county_dist_id
  is 'COUNTY DISTRICT CODE indicates a code for the district providing service to the student.  Each school district in Texas is assigned a unique COUNTY DISTRICT CODE by the Texas Education Agency. (TEA)';
comment on column SDM.STU_SCHEDULE_FACT.record_key
  is 'SCHEDULE RECORD KEY indicates the key establishing unique occurrence of staff member.';
comment on column SDM.STU_SCHEDULE_FACT.staff_sched_key
  is 'STAFF SCHEDULING KEY indicates the staff ID used in the transaction system.';
comment on column SDM.STU_SCHEDULE_FACT.school_year
  is 'SCHOOL YEAR indicates the school year for the student schedule.';
comment on column SDM.STU_SCHEDULE_FACT.section
  is 'SECTION ID indicates the section number used for the identification of a unique occurrence of a class/staff/location.';
comment on column SDM.STU_SCHEDULE_FACT.from_dt
  is 'BEGINNING DATE OF CLASS indicates the first day the student was scheduled in the class.';
comment on column SDM.STU_SCHEDULE_FACT.from_time_hour
  is 'BEGINNING TIME OF CLASS indicates the beginning time of class as scheduled.';
comment on column SDM.STU_SCHEDULE_FACT.from_period
  is 'STARTING PERIOD FOR SECTION indicates the starting period number for which the student is attending this course.';
comment on column SDM.STU_SCHEDULE_FACT.to_dt
  is 'END DATE OF SECTION indicates the last day the student took the class.';
comment on column SDM.STU_SCHEDULE_FACT.to_time_hour
  is 'END HOUR OF SECTION indicates the ending time of the class as scheduled.';
comment on column SDM.STU_SCHEDULE_FACT.to_time_min
  is 'END OF MINUTE OF SECTION indicates the ending time of the class as scheduled and expressed as minutes past the hour.';
comment on column SDM.STU_SCHEDULE_FACT.to_period
  is 'END PERIOD OF SECTION indicates the ending period number for which the student is attending this course.';
comment on column SDM.STU_SCHEDULE_FACT.term_code
  is 'TERM indicates the term in which the class is offered.';
comment on column SDM.STU_SCHEDULE_FACT.status
  is 'STATUS indicates whether or not the student is still scheduled in the class.';
comment on column SDM.STU_SCHEDULE_FACT.fte_pgm_code
  is 'FTE PGM CODE indicates the code identifying the FTE amount assigned as staff.';
comment on column SDM.STU_SCHEDULE_FACT.fte_eligibility
  is 'FTE ELIGIBILITY indicates whether or not this class contributes to FTE calculations.';
comment on column SDM.STU_SCHEDULE_FACT.occup_comp_pts
  is 'OCCUPATIONAL COMPLETE indicates the number of occupational completion points to which this class contributes, if the district is tracking occupation completion points.';
comment on column SDM.STU_SCHEDULE_FACT.sub_program
  is 'SUB PROGRAM indicates the sub grouping of classes used for reporting purposes.';
comment on column SDM.STU_SCHEDULE_FACT.rspbl_rdng_instr
  is 'RESPONSIBLE READING INSTRUCTOR indicates the staff member associated with reading for this class.';
comment on column SDM.STU_SCHEDULE_FACT.rspbl_writ_instr
  is 'RESPONSIBLE WRITING INSTRUCTOR indicates the staff member associated with writing for this class.';
comment on column SDM.STU_SCHEDULE_FACT.rspbl_math_instr
  is 'RESPONSIBLE MATH INSTRUCTOR indicates the staff member associated with math for this class.';
comment on column SDM.STU_SCHEDULE_FACT.rspbl_sci_instr
  is 'RESPONSIBLE SCIENCE INSTRUCTOR indicates the staff member associated with science for this class.';
create bitmap index SDM.BMI_CDC_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (LOC_COUNTY_DIST_ID)
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
create bitmap index SDM.BMI_CRS_SID_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (COURSE_SID)
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
create bitmap index SDM.BMI_FR_DATE_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (FROM_DT)
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
create bitmap index SDM.BMI_LOC_SID_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (LOC_SID)
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
create bitmap index SDM.BMI_STU_SCHD_FACT_STULOCYR on SDM.STU_SCHEDULE_FACT (STU_SID, LOC_COUNTY_DIST_ID, SCHOOL_YEAR)
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
create bitmap index SDM.BMI_STU_SID_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (STU_SID)
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
create bitmap index SDM.BMI_ST_SCH_KEY_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (STAFF_SCHED_KEY)
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
create bitmap index SDM.BMI_TO_DATE_STU_SCHED_FACT on SDM.STU_SCHEDULE_FACT (TO_DT)
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
create unique index SDM.UX_STU_SCHED_STU_CRS_PRD_TERM on SDM.STU_SCHEDULE_FACT (STU_SID, COURSE_SID, FROM_PERIOD, TERM_CODE, SCHOOL_YEAR)
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
prompt Creating table TEST_DIM
prompt =======================
prompt
create table SDM.TEST_DIM
(
  test_sid         NUMBER(6) not null,
  test_dim_id      VARCHAR2(75) not null,
  test_id          VARCHAR2(5) not null,
  test_name        VARCHAR2(5) not null,
  version_id       VARCHAR2(2),
  version_name     VARCHAR2(2),
  subject_id       VARCHAR2(2) not null,
  subject_name     VARCHAR2(15) not null,
  sub_test_id      VARCHAR2(2) not null,
  sub_test_name    VARCHAR2(20) not null,
  objective_id     VARCHAR2(30) not null,
  objective_name   VARCHAR2(160) not null,
  question_num     NUMBER(3) not null,
  question_name    VARCHAR2(2),
  char_bckt_1      VARCHAR2(16),
  char_bckt_2      VARCHAR2(16) not null,
  char_bckt_3      VARCHAR2(7) not null,
  char_bckt_4      VARCHAR2(3) not null,
  char_bckt_5      VARCHAR2(29) not null,
  char_bckt_6      VARCHAR2(3) not null,
  char_bckt_7      VARCHAR2(17) not null,
  char_bckt_8      VARCHAR2(15) not null,
  char_bckt_9      VARCHAR2(7) not null,
  char_bckt_10     VARCHAR2(5) not null,
  char_bckt_11     VARCHAR2(25),
  char_bckt_12     VARCHAR2(25) not null,
  int_bckt_1       VARCHAR2(21),
  int_bckt_2       VARCHAR2(21),
  int_bckt_3       VARCHAR2(24),
  int_bckt_4       VARCHAR2(31),
  int_bckt_5       VARCHAR2(22),
  int_bckt_6       VARCHAR2(22),
  int_bckt_7       VARCHAR2(22),
  int_bckt_8       VARCHAR2(18),
  int_bckt_9       VARCHAR2(12),
  int_bckt_10      VARCHAR2(17),
  float_bckt_1     VARCHAR2(20),
  eff_start_dt     DATE not null,
  eff_end_dt       DATE,
  create_dt        DATE not null,
  lst_updt_dt      DATE not null,
  cur_indicator    VARCHAR2(1) not null,
  max_pnts_per_obj NUMBER(3),
  grade            VARCHAR2(2),
  objective_num    VARCHAR2(2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column SDM.TEST_DIM.test_dim_id
  is 'TEST DIMENSION ID indicates the unique number made from the combination of the Test ID, Version ID, Subject ID, and Sub Test ID used to generate the SID.';
comment on column SDM.TEST_DIM.test_id
  is 'TEST ID indicates the identifier for the test type.';
comment on column SDM.TEST_DIM.test_name
  is 'TEST NAME indicates the name description for the test.';
comment on column SDM.TEST_DIM.version_id
  is 'TEST VERSION ID indicates the identifier for the version of a particular test.';
comment on column SDM.TEST_DIM.version_name
  is 'TEST VERSION NAME indicates the same as version ID but the different items are separated by a period (''.'') to easily identify the year, grade and version.';
comment on column SDM.TEST_DIM.subject_id
  is 'TEST SUBJECT ID indicates the ID of the subject area of an assessment test.';
comment on column SDM.TEST_DIM.subject_name
  is 'TEST SUBJECT NAME indicates the name of the subject area of an assessment test.';
comment on column SDM.TEST_DIM.sub_test_id
  is 'SUB TEST ID indicates the unique identifier for the sub-test within an assessment test.';
comment on column SDM.TEST_DIM.sub_test_name
  is 'SUB TEST NAME indicates the name of the sub-test within a subject area.';
comment on column SDM.TEST_DIM.objective_id
  is 'OBJECTIVE ID indicates the ID of the objective of an assessment test.';
comment on column SDM.TEST_DIM.objective_name
  is 'OBJECTIVE NAME indicates the name of the objective of an assessment test.';
comment on column SDM.TEST_DIM.question_num
  is 'QUESTION NUMBER indicates the number of the question on the assessment test.';
comment on column SDM.TEST_DIM.question_name
  is 'QUESTION NAME indicates the name of the question on the assessment test.';
create bitmap index SDM.BMI_SUBJECT_NAME_TEST_DIM on SDM.TEST_DIM (SUBJECT_NAME)
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
create bitmap index SDM.BMI_SUB_TEST_ID on SDM.TEST_DIM (SUB_TEST_ID)
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
create bitmap index SDM.BMI_TEST_DIM_TEST_ID on SDM.TEST_DIM (TEST_ID)
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
create index SDM.TESTDIMIDS_SID_SUBJ_SUBT_VR_NM on SDM.TEST_DIM (TEST_SID, SUBJECT_ID, SUB_TEST_ID, VERSION_ID, TEST_NAME)
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
create index SDM.TESTDIMIDS_TST_SUBJ_SUBT_VR_NM on SDM.TEST_DIM (TEST_DIM_ID, SUBJECT_ID, SUB_TEST_ID, VERSION_ID, TEST_NAME)
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
create index SDM.TEST_DIM_SID_TEST_DIM_ID on SDM.TEST_DIM (TEST_SID, TEST_DIM_ID)
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
create unique index SDM.TEST_DIM_TEST_DIM_ID on SDM.TEST_DIM (TEST_DIM_ID)
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
alter table SDM.TEST_DIM
  add constraint PK_TEST_DIM primary key (TEST_SID)
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
alter index SDM.PK_TEST_DIM nologging;

prompt
prompt Creating table TEST_FACT
prompt ========================
prompt
create table SDM.TEST_FACT
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_sid             NUMBER(6) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  char_bckt_1          VARCHAR2(9),
  char_bckt_2          VARCHAR2(9),
  char_bckt_3          VARCHAR2(15),
  char_bckt_4          VARCHAR2(2),
  char_bckt_5          VARCHAR2(2),
  char_bckt_6          VARCHAR2(2),
  char_bckt_7          VARCHAR2(2),
  char_bckt_8          VARCHAR2(2),
  char_bckt_9          VARCHAR2(2),
  char_bckt_10         VARCHAR2(2),
  char_bckt_11         VARCHAR2(2),
  char_bckt_12         VARCHAR2(2),
  int_bckt_1           NUMBER(5),
  int_bckt_2           NUMBER(5),
  int_bckt_3           NUMBER(5),
  int_bckt_4           NUMBER(5),
  int_bckt_5           NUMBER(5),
  int_bckt_6           NUMBER(5),
  int_bckt_7           NUMBER(5),
  int_bckt_8           NUMBER(5),
  int_bckt_9           NUMBER(5),
  int_bckt_10          NUMBER(5),
  float_bckt_1         NUMBER(5,2),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  test_type_cd         VARCHAR2(1),
  test_mode_cd         VARCHAR2(5),
  accommodated_ind     VARCHAR2(1),
  accom_presentation   VARCHAR2(1),
  accom_response       VARCHAR2(1),
  accom_setting        VARCHAR2(1),
  accom_timing         VARCHAR2(1),
  accom_braille        VARCHAR2(1),
  accom_lrg_print      VARCHAR2(1),
  accom_dyslexia       VARCHAR2(1),
  accom_oral_admin     VARCHAR2(1),
  online_test          VARCHAR2(1),
  aeis_campus          VARCHAR2(1),
  ayp_campus           VARCHAR2(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  test_num             VARCHAR2(2),
  test_version         VARCHAR2(1),
  test_desc            VARCHAR2(22),
  subject_name         VARCHAR2(15),
  test_program_cd      VARCHAR2(5),
  test_language_cd     VARCHAR2(1),
  retest_ind           VARCHAR2(1),
  gender               VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  econ_dis             VARCHAR2(1),
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
  race_ethnicity_sid   NUMBER(4)
)
partition by range (DATE_SID)
(
  partition CATCH_111111_All values less than (297910)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PAST values less than (309234)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PRIOR values less than (309599)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_CURRENT values less than (316539)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition CATCH_999999_All values less than (99999999)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
create bitmap index SDM.BMI_P_CDC_TEST_FACT on SDM.TEST_FACT (LOC_COUNTY_DIST_ID)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_10_TEST_FACT on SDM.TEST_FACT (CHAR_BCKT_10)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_11_TEST_FACT on SDM.TEST_FACT (CHAR_BCKT_11)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_12_TEST_FACT on SDM.TEST_FACT (CHAR_BCKT_12)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_1_TEST_FACT on SDM.TEST_FACT (CHAR_BCKT_1)
  nologging  local;
create bitmap index SDM.BMI_P_DATESID_TEST_FACT on SDM.TEST_FACT (DATE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_LOC_TEST_FACT on SDM.TEST_FACT (LOC_SID)
  nologging  local;
create bitmap index SDM.BMI_P_RACE_TEST_FACT on SDM.TEST_FACT (RACE_ETHNICITY_SID)
  nologging  local;
create bitmap index SDM.BMI_P_RES_TYP_TST_FACT on SDM.TEST_FACT (TEST_RESULT_TYPE)
  nologging  local;
create bitmap index SDM.BMI_P_STU_TEST_FACT on SDM.TEST_FACT (STU_SID)
  nologging  local;
create bitmap index SDM.BMI_P_TEST_SID_TEST_FACT on SDM.TEST_FACT (TEST_SID)
  nologging  local;
create index SDM.IX_TEST_REPORT_PROMPTS2 on SDM.TEST_FACT (DATE_SID, LOC_SID, TEST_SID, CHAR_BCKT_10, CHAR_BCKT_12)
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
prompt Creating table TEST_FACT_PART2011
prompt =================================
prompt
create table SDM.TEST_FACT_PART2011
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_sid             NUMBER(6) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  char_bckt_1          VARCHAR2(9),
  char_bckt_2          VARCHAR2(9),
  char_bckt_3          VARCHAR2(15),
  char_bckt_4          VARCHAR2(2),
  char_bckt_5          VARCHAR2(2),
  char_bckt_6          VARCHAR2(2),
  char_bckt_7          VARCHAR2(2),
  char_bckt_8          VARCHAR2(2),
  char_bckt_9          VARCHAR2(2),
  char_bckt_10         VARCHAR2(2),
  char_bckt_11         VARCHAR2(2),
  char_bckt_12         VARCHAR2(2),
  int_bckt_1           NUMBER(5),
  int_bckt_2           NUMBER(5),
  int_bckt_3           NUMBER(5),
  int_bckt_4           NUMBER(5),
  int_bckt_5           NUMBER(5),
  int_bckt_6           NUMBER(5),
  int_bckt_7           NUMBER(5),
  int_bckt_8           NUMBER(5),
  int_bckt_9           NUMBER(5),
  int_bckt_10          NUMBER(5),
  float_bckt_1         NUMBER(5,2),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  test_type_cd         VARCHAR2(1),
  test_mode_cd         VARCHAR2(5),
  accommodated_ind     VARCHAR2(1),
  accom_presentation   VARCHAR2(1),
  accom_response       VARCHAR2(1),
  accom_setting        VARCHAR2(1),
  accom_timing         VARCHAR2(1),
  accom_braille        VARCHAR2(1),
  accom_lrg_print      VARCHAR2(1),
  accom_dyslexia       VARCHAR2(1),
  accom_oral_admin     VARCHAR2(1),
  online_test          VARCHAR2(1),
  aeis_campus          VARCHAR2(1),
  ayp_campus           VARCHAR2(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  test_num             VARCHAR2(2),
  test_version         VARCHAR2(1),
  test_desc            VARCHAR2(22),
  subject_name         VARCHAR2(15),
  test_program_cd      VARCHAR2(5),
  test_language_cd     VARCHAR2(1),
  retest_ind           VARCHAR2(1),
  gender               VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  econ_dis             VARCHAR2(1),
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
  race_ethnicity_sid   NUMBER(4)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TEST_SUMMARY_FACT
prompt ================================
prompt
create table SDM.TEST_SUMMARY_FACT
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_sid             NUMBER(6) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  char_bckt_1          VARCHAR2(9 CHAR),
  char_bckt_2          VARCHAR2(9 CHAR),
  char_bckt_3          VARCHAR2(15),
  char_bckt_4          VARCHAR2(2 CHAR),
  char_bckt_5          VARCHAR2(2 CHAR),
  char_bckt_6          VARCHAR2(2 CHAR),
  char_bckt_7          VARCHAR2(2 CHAR),
  char_bckt_8          VARCHAR2(2 CHAR),
  char_bckt_9          VARCHAR2(2 CHAR),
  char_bckt_10         VARCHAR2(2),
  int_bckt_1           NUMBER(5),
  int_bckt_2           NUMBER(5),
  int_bckt_3           NUMBER(5),
  int_bckt_4           NUMBER(5),
  int_bckt_5           NUMBER(5),
  int_bckt_6           NUMBER(5),
  int_bckt_7           NUMBER(5),
  int_bckt_8           NUMBER(5),
  int_bckt_9           NUMBER(5),
  int_bckt_10          NUMBER(5),
  float_bckt_1         NUMBER(5,2),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  char_bckt_11         VARCHAR2(2),
  char_bckt_12         VARCHAR2(2),
  test_type_cd         CHAR(1),
  test_mode_cd         VARCHAR2(5),
  accommodated_ind     CHAR(1),
  accom_presentation   CHAR(1),
  accom_response       CHAR(1),
  accom_setting        CHAR(1),
  accom_timing         CHAR(1),
  accom_braille        CHAR(1),
  accom_lrg_print      CHAR(1),
  accom_dyslexia       CHAR(1),
  accom_oral_admin     CHAR(1),
  online_test          CHAR(1),
  aeis_campus          CHAR(1),
  ayp_campus           CHAR(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  test_num             VARCHAR2(2),
  test_version         VARCHAR2(1),
  test_desc            VARCHAR2(22),
  subject_name         VARCHAR2(15),
  test_program_cd      VARCHAR2(5),
  test_language_cd     VARCHAR2(1),
  retest_ind           VARCHAR2(1),
  gender               VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  econ_dis             VARCHAR2(1),
  vertical_scale_score NUMBER(5),
  tpm_score            NUMBER(5),
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
  race_ethnicity_sid   NUMBER(4)
)
partition by range (DATE_SID)
(
  partition CATCH_111111_All values less than (297910)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PAST values less than (309234)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_PRIOR values less than (309599)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition ROYSE_199902_CURRENT values less than (316539)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition CATCH_999999_All values less than (99999999)
    tablespace DW_DEFAULT01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 80K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
create bitmap index SDM.BMI_P_CDC_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (LOC_COUNTY_DIST_ID)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_10_TST_SUM_FCT on SDM.TEST_SUMMARY_FACT (CHAR_BCKT_10)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_1_TST_SUM_FACT on SDM.TEST_SUMMARY_FACT (CHAR_BCKT_1)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_2_TST_SUM_FACT on SDM.TEST_SUMMARY_FACT (CHAR_BCKT_2)
  nologging  local;
create bitmap index SDM.BMI_P_CHAR_BCKT_3_TST_SUM_FACT on SDM.TEST_SUMMARY_FACT (CHAR_BCKT_3)
  nologging  local;
create bitmap index SDM.BMI_P_DATE_SID_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (DATE_SID)
  nologging  local;
create bitmap index SDM.BMI_P_INACTIVE_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (INACTIVE_RECORD)
  nologging  local;
create bitmap index SDM.BMI_P_LOC_SID_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (LOC_SID)
  nologging  local;
create bitmap index SDM.BMI_P_RACE_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (RACE_ETHNICITY_SID)
  nologging  local;
create bitmap index SDM.BMI_P_RES_TYP_TST_SUM_FACT on SDM.TEST_SUMMARY_FACT (TEST_RESULT_TYPE)
  nologging  local;
create bitmap index SDM.BMI_P_STU_SID_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (STU_SID)
  nologging  local;
create bitmap index SDM.BMI_P_TEST_SID_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (TEST_SID)
  nologging  local;
create index SDM.GUI_MK1_TEST_SUM_FACT on SDM.TEST_SUMMARY_FACT (DATE_SID, LOC_COUNTY_DIST_ID, TEST_SID, CHAR_BCKT_1, CHAR_BCKT_10, TEST_TYPE_CD, CHAR_BCKT_12, TEST_MODE_CD, ACCOMMODATED_IND)
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
prompt Creating table TEST_SUMMARY_FACT_PART2011
prompt =========================================
prompt
create table SDM.TEST_SUMMARY_FACT_PART2011
(
  loc_county_dist_id   VARCHAR2(6) not null,
  test_sid             NUMBER(6) not null,
  date_sid             NUMBER,
  stu_sid              NUMBER(9) not null,
  loc_sid              NUMBER(6) not null,
  char_bckt_1          VARCHAR2(9 CHAR),
  char_bckt_2          VARCHAR2(9 CHAR),
  char_bckt_3          VARCHAR2(15),
  char_bckt_4          VARCHAR2(2 CHAR),
  char_bckt_5          VARCHAR2(2 CHAR),
  char_bckt_6          VARCHAR2(2 CHAR),
  char_bckt_7          VARCHAR2(2 CHAR),
  char_bckt_8          VARCHAR2(2 CHAR),
  char_bckt_9          VARCHAR2(2 CHAR),
  char_bckt_10         VARCHAR2(2),
  int_bckt_1           NUMBER(5),
  int_bckt_2           NUMBER(5),
  int_bckt_3           NUMBER(5),
  int_bckt_4           NUMBER(5),
  int_bckt_5           NUMBER(5),
  int_bckt_6           NUMBER(5),
  int_bckt_7           NUMBER(5),
  int_bckt_8           NUMBER(5),
  int_bckt_9           NUMBER(5),
  int_bckt_10          NUMBER(5),
  float_bckt_1         NUMBER(5,2),
  process_dt           DATE not null,
  inactive_record      NUMBER(1),
  char_bckt_11         VARCHAR2(2),
  char_bckt_12         VARCHAR2(2),
  test_type_cd         CHAR(1),
  test_mode_cd         VARCHAR2(5),
  accommodated_ind     CHAR(1),
  accom_presentation   CHAR(1),
  accom_response       CHAR(1),
  accom_setting        CHAR(1),
  accom_timing         CHAR(1),
  accom_braille        CHAR(1),
  accom_lrg_print      CHAR(1),
  accom_dyslexia       CHAR(1),
  accom_oral_admin     CHAR(1),
  online_test          CHAR(1),
  aeis_campus          CHAR(1),
  ayp_campus           CHAR(1),
  quantile             VARCHAR2(5),
  lexile               VARCHAR2(5),
  test_num             VARCHAR2(2),
  test_version         VARCHAR2(1),
  test_desc            VARCHAR2(22),
  subject_name         VARCHAR2(15),
  test_program_cd      VARCHAR2(5),
  test_language_cd     VARCHAR2(1),
  retest_ind           VARCHAR2(1),
  gender               VARCHAR2(1),
  ethnicity            VARCHAR2(1),
  econ_dis             VARCHAR2(1),
  vertical_scale_score NUMBER(5),
  tpm_score            NUMBER(5),
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
  race_ethnicity_sid   NUMBER(4)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TMP_DWS_STU_IDS
prompt ==============================
prompt
create table SDM.TMP_DWS_STU_IDS
(
  student  VARCHAR2(10),
  district VARCHAR2(10),
  campus   VARCHAR2(10)
)
tablespace DW_DEFAULT01
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
prompt Creating sequence SEQ_SANITY_GID
prompt ================================
prompt
create sequence SDM.SEQ_SANITY_GID
minvalue 1
maxvalue 999999999999999999999999999
start with 817
increment by 1
nocache;

prompt
prompt Creating synonym ETL_LOAD_DIM
prompt =============================
prompt
create or replace synonym SDM.ETL_LOAD_DIM
  for ZEUS.ETL_LOAD_DIM;

prompt
prompt Creating synonym PBMS_ISS_DISTRICT_SUM_FACT
prompt ===========================================
prompt
create or replace synonym SDM.PBMS_ISS_DISTRICT_SUM_FACT
  for EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT;

prompt
prompt Creating synonym PBMS_ISS_LOCATION_SUM_FACT
prompt ===========================================
prompt
create or replace synonym SDM.PBMS_ISS_LOCATION_SUM_FACT
  for EMPOWER.PBMS_ISS_LOCATION_SUM_FACT;

prompt
prompt Creating synonym PBMS_ISS_PLACEMENT_FACT
prompt ========================================
prompt
create or replace synonym SDM.PBMS_ISS_PLACEMENT_FACT
  for EMPOWER.PBMS_ISS_PLACEMENT_FACT;

prompt
prompt Creating synonym PBMS_ISS_STUDENT_FACT
prompt ======================================
prompt
create or replace synonym SDM.PBMS_ISS_STUDENT_FACT
  for EMPOWER.PBMS_ISS_STUDENT_FACT;

prompt
prompt Creating synonym PERFORMANCE_LEVEL_DIM
prompt ======================================
prompt
create or replace synonym SDM.PERFORMANCE_LEVEL_DIM
  for EMPOWER.PERFORMANCE_LEVEL_DIM;

prompt
prompt Creating view DISTRICT_DIM
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW SDM.DISTRICT_DIM
(district_sid, district_id, district_name, esc_region, square_miles, logo_url, current_academic_day, current_academic_week, previous_academic_week, school_year_current, school_year_previous)
AS
SELECT DIST."DISTRICT_SID",DIST."DISTRICT_ID",DIST."DISTRICT_NAME",DIST."ESC_REGION",DIST."SQUARE_MILES",DIST."LOGO_URL"
, DT.ACADEMIC_DAY, DT.ACADEMIC_WEEK, TO_CHAR(TO_NUMBER(DT.ACADEMIC_WEEK) - 1,'FM00'), 
DT.SCHOOL_YEAR, TO_CHAR(TO_NUMBER(DT.SCHOOL_YEAR) - 1)
FROM EMPOWER.DISTRICT_DIM DIST
LEFT JOIN SDM.DATE_DIM DT
ON DT.DISTRICT_SID = DIST.DISTRICT_SID
WHERE DT.MOST_RECENT_ENROLLMENT_FLAG = 'Yes';

prompt
prompt Creating view V_ABSENCE_FACT
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW SDM.V_ABSENCE_FACT AS
SELECT AF."LOC_COUNTY_DIST_ID",AF."RECORD_TYPE",AF."DATE_SID",AF."STU_SID",AF."LOC_SID",AF."PERIOD",AF."EVENT_TYPE",AF."PROCESS_DT",AF."INACTIVE_RECORD",AF."CONFORMED_EVENT_TYPE",AF."ADA_CNT", 1
FROM ABSENCE_FACT AF;

prompt
prompt Creating view V_CURRENT_PART_NAME
prompt =================================
prompt
create or replace force view sdm.v_current_part_name as
select DISTINCT PARTITION_NAME
    from USER_TAB_PARTITIONS
    where PARTITION_NAME like '%CURRENT'
   order by 1;

prompt
prompt Creating view V_CURRENT_YR_DATE_DIM
prompt ===================================
prompt
create or replace force view sdm.v_current_yr_date_dim as
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where a.school_year = (select b.school_year from date_dim b where b.date_id = to_char(sysdate) and rownum = 1)
union all
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where year_month_day = '20991231';

prompt
prompt Creating view V_DDL_BACKUP
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW SDM.V_DDL_BACKUP AS
SELECT
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
            ALL_TABLES 
    )
    union all 
    (   select owner,index_name as objname ,'INDEX' as objtype, '2' as 
                    objtypeorder 
                from
                    ALL_INDEXES 
        )
    union all 
    (   select
                    owner,view_name as objname, 'VIEW' as objtype , '3' as 
                    objtypeorder 
                from
                    ALL_VIEWS 
        )
    union all 
    (   select
                    owner,constraint_name as objname , 'CONSTRAINT' as objtype, 
                    '4' as objtypeorder 
                from
                    ALL_CONSTRAINTS 
        )
    union all 
    (   select
                    sequence_owner,sequence_name as objname , 'SEQUENCES' as objtype, 
                    '5' as objtypeorder 
                from
                    ALL_SEQUENCES
        )    
 union all 
    (   select
                    owner,dimension_name as objname , 'DIMENSIONS' as objtype, 
                    '6' as objtypeorder 
                from
                    ALL_DIMENSIONS
        ) 
    order by
        objtypeorder,objname ) objectlist 
where
    objectlist.objname not like 'BIN$%'
/* end */;

prompt
prompt Creating view V_FIXUP_SIDS
prompt ==========================
prompt
create or replace force view sdm.v_fixup_sids as
with q as
/* copyright 2007-2008 Region 10 Education Service Center.  All Rights Reserved **/
(select
 table_name,column_name,num_nulls,num_distinct,nullable,data_type,data_precision,data_scale,data_length,last_analyzed,
CASE
WHEN column_name like '%SID' and data_type='NUMBER' and data_Scale=0 and data_precision is null
THEN null
WHEN column_name like '%SID'
THEN 'alter table '||table_name|| ' modify '||column_name||' number(*,0)
go' 
ELSE null
END as sql_type_ads,

CASE
WHEN ((num_nulls=0 and num_distinct>0) 
      or column_name like '%_SID' 
or column_name like '%_KEY'
 or column_name ='LOC_COUNTY_DIST_ID' )and nullable='Y' 
THEN to_char(')
go
alter table '||table_name|| ' modify ('||column_name||' not null'
)
END as sql_nullable_ads

from user_tab_columns
--where column_name like '%SID'
) 
select 
CASE
when (sql_type_ads is not null
or sql_nullable_ads is not null)
then 'Problem'
else 'OK'
end
as ColGood,

CASE
when (sql_type_ads is not null and sql_nullable_ads is  null)
then 'type'
when (sql_type_ads is  null and sql_nullable_ads is not null)
then 'nulls'
when (sql_type_ads is not null and sql_nullable_ads is not null)
then 'nulls,type'
else 'OK'
end
as Problem

,q.TABLE_NAME,q.COLUMN_NAME,
q.SQL_TYPE_ADS,
qnull.col_rank as null_ord,
CASE
WHEN qnull.col_rank=1
THEN q.SQL_NULLABLE_ADS
WHEN qnull.col_rank>1
THEN ','||qnull.column_name||' not null' 
END as SQL_NULLABLE_ADS
,q.NUM_NULLS,q.num_distinct,q.NULLABLE,
q.DATA_TYPE,q.DATA_PRECISION,q.DATA_SCALE,q.DATA_LENGTH,q.last_analyzed
from q, 
  
   (  select table_name,column_name,
     rank() over (partition by table_name order by column_name) as col_rank
     from q 
     where SQL_NULLABLE_ADS is not null 
     group by table_name,column_name
   ) qnull
where q.table_name=qnull.table_name(+)
and q.column_name=qnull.column_name(+)

order by ColGood desc,Problem desc,q.column_name,q.table_name
;

prompt
prompt Creating view V_FIXUP_USABLE
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW SDM.V_FIXUP_USABLE AS
SELECT COLGOOD,
    PROBLEM,
    TABLE_NAME,
    COLUMN_NAME,
    SQL_TYPE_ADS,
    NULL_ORD,
    SQL_NULLABLE_ADS,
    NUM_NULLS,
    NUM_DISTINCT,
    NULLABLE,
    DATA_TYPE,
    DATA_PRECISION,
    DATA_SCALE,
    DATA_LENGTH,
    LAST_ANALYZED 
FROM SDM.V_FIXUP_SIDS
where problem != 'OK';

prompt
prompt Creating view V_PRIOR_YR_DATE_DIM
prompt =================================
prompt
create or replace force view sdm.v_prior_yr_date_dim as
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where a.school_year = (select b.school_year from date_dim b where b.date_id = to_char(add_months(sysdate,-12)) and rownum = 1)
union all
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where year_month_day = '20991231';

prompt
prompt Creating view V_SDM_DICTIONARY_CHECK
prompt ====================================
prompt
CREATE OR REPLACE FORCE VIEW SDM.V_SDM_DICTIONARY_CHECK AS
select "SDM_TABCOL","SDM_TABLE","SDM_COLUMN","ERROR_STATUS","COLUMN_DEFINITION","COMMON_NAME","TN","CN","UT_TABCOL","COLUMN_ID","NULLABLE","NUM_NULLS","NUM_DISTINCT","DATA_TYPE","DATA_LENGTH" from 
(with uc as
(   SELECT
                                regexp_replace(TABLE_NAME,'GRADE\w?_FACT','GRADES_FACT') AS tn,COLUMN_NAME AS cn, 
                                TABLE_NAME ||'.'||COLUMN_NAME AS 
                                ut_tabcol,column_id,nullable,num_nulls,num_distinct,data_type,data_length
                            FROM
                                user_tab_columns
)
SELECT
etl.sdm_tabcol,etl.sdm_table,etl.sdm_column,
    CASE 
        WHEN etl.SDM_TABCOL=uc.ut_tabcol 
        THEN 'matches' 
        ELSE 'missing from dictionary' 
    END                                                                                                             
    AS error_status , etl.
    "Column Definition" AS COLUMN_DEFINITION, etl."Common Name" AS 
    COMMON_NAME,uc.* 
FROM
    dw.etl_dictionary etl, 
    
    uc
WHERE
    etl.SDM_TABCOL(+)=uc.ut_tabcol
UNION ALL

SELECT
etl.sdm_tabcol,etl.sdm_table,etl.sdm_column,
    'missing from databasey'                                                                                                              
    AS error_status ,  etl.
    "Column Definition" AS COLUMN_DEFINITION, etl."Common Name" AS 
    COMMON_NAME ,uc.*
FROM
    dw.etl_dictionary etl, 
    uc
WHERE
    etl.SDM_TABLE=uc.tn
    and uc.column_id=1
    and sdm_tabcol not in  (select distinct ut_tabcol from uc )
);

prompt
prompt Creating view V_SDM_UPDATECOLCOMMENTS
prompt =====================================
prompt
create or replace force view sdm.v_sdm_updatecolcomments as
select 'comment on column ' || sdm_table ||'.' ||sdm_column
|| ' is '''|| regexp_replace(COLUMN_DEFINITION,'''','''''',1,0)||'''
go' as sql_comment
from v_sdm_dictionary_check where error_status='matches';

prompt
prompt Creating view V_STAFF_CURRENT_YR_DATE_DIM
prompt =========================================
prompt
create or replace force view sdm.v_staff_current_yr_date_dim as
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where a.school_year = (select b.school_year from date_dim b where b.date_id = to_char(sysdate) and rownum = 1)
and a.calendar_month != '07'
union all
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where a.school_year = (select b.school_year from date_dim b where b.date_id = to_char(sysdate - 365) and rownum = 1)
and a.calendar_month = '07'
union all
select a."DISTRICT_ID",a."DISTRICT_SID",a."DATE_SID",a."DATE_ID",a."DATE_KEY",a."CALENDAR_MONTH",a."CALENDAR_MONTH_NAME",a."CALENDAR_MONTH_SHORT_NAME",a."CALENDAR_QUARTER",a."CALENDAR_WEEK",a."CALENDAR_YEAR",a."CALENDAR_YEAR_MONTH",a."CALENDAR_YEAR_QUARTER",a."DAY_OF_WEEK",a."DAY_OF_WEEK_NAME",a."DAY_OF_WEEK_SHORT_NAME",a."FISCAL_PERIOD",a."FISCAL_QUARTER",a."FISCAL_YEAR",a."FISCAL_YEAR_QUARTER",a."LONG_DATE",a."SCHOOL_DAY_INDICATOR",a."SCHOOL_WEEK",a."SCHOOL_YEAR",a."SCHOOL_YEAR_DESCRIPTION",a."SEMESTER",a."SHORT_DATE",a."SNAPSHOT_DATE_INDICATOR",a."WEEKLY_ENROLLMENT_DATE_FLAG",a."MOST_RECENT_ENROLLMENT_FLAG",a."YEAR_MONTH_DAY",a."ACADEMIC_6_WEEKS",a."ACADEMIC_9_WEEKS",a."ACADEMIC_DAY",a."ACADEMIC_WEEK",a."FIRST_DAY_ACADEMIC_6_WEEKS",a."LAST_DAY_ACADEMIC_6_WEEKS",a."FIRST_DAY_ACADEMIC_9_WEEKS",a."LAST_DAY_ACADEMIC_9_WEEKS",a."FIRST_DAY_SEMESTER",a."LAST_DAY_SEMESTER",a."DAY_DESC",a."DAY_NBR",a."DAY_SHORT_DESC",a."DOW_DESC",a."DOW_NBR",a."DOW_SHORT_DESC",a."JULIAN_DT",a."MONTH_DESC",a."MONTH_ID",a."MONTH_NBR",a."MONTH_SHORT_DESC",a."SCHL_WEEK",a."SCHL_YEAR",a."SCHL_YEAR_DESC",a."WEEK_NUM",a."YEAR_DESC",a."YEAR_ID",a."YYYYMMDD"
from date_dim a
where year_month_day = '20991231';

prompt
prompt Creating materialized view MV_CHART_ATTENDANCE_BY_USER
prompt ======================================================
prompt
create materialized view SDM.MV_CHART_ATTENDANCE_BY_USER
using no index
refresh complete on demand
as
select
 mv_location_burst.user_camid
,sum(case when location_count.min_pct <= .949 then 1 else 0 end) as count_of_campuses
,'Some Days 94.9% Or below' as Attendance_Percentage_Desc
,sum(case when location_count.min_pct <= .949 then 1 else 0 end) as count_below_95
,sum(case when location_count.min_pct >= .95 then 1 else 0 end) as count_above_95
,location_count.County_District_Id
,location_count.from_date
,location_count.to_date
from (
    select distinct
    loc_min_pct.County_District_Id
    ,loc_min_pct.loc_id
    ,loc_min_pct.from_date
    ,loc_min_pct.to_date
    ,min(campus_attendance_percent) over(partition by county_district_id,loc_id) as min_pct
    from (
        select
          Campus.loc_county_dist_id as County_District_Id
        , Campus.loc_id
        , Campus.loc_desc
        , Campus.loc_district
        , Campus.loc_state_type
        , Campus.enrollment_date
        , Campus.from_date
        , Campus.to_date
        , Campus.ada_enrollment_count
        , Campus.ada_absence_count
        , case
              when campus.ada_enrollment_count = 0 and Campus.loc_state_type = 'ALTERNATIVE' then 1
              when Campus.ada_enrollment_count = 0 then 0
              else round((Campus.ada_enrollment_count - Campus.ada_absence_count)/Campus.ada_enrollment_count,3)
          end as campus_attendance_percent
        from
            (select
              location_dim.loc_county_dist_id
            , location_dim.loc_id
            , location_dim.loc_desc
            , location_dim.loc_district
            , location_dim.loc_state_type
            , date_dim.date_id as enrollment_date
            , date_dim.to_date as to_date
            , date_dim.to_date - 11 as from_date
            , nvl((select sum(enrollment_fact.ada_enr_cnt) from enrollment_fact
                  where enrollment_fact.date_sid = date_dim.date_sid
                        and enrollment_fact.loc_sid = location_dim.loc_sid),0) as ada_enrollment_count
            , nvl((select sum(absence_fact.ada_cnt) from absence_fact
                  where absence_fact.date_sid = date_dim.date_sid
                        and absence_fact.loc_sid = location_dim.loc_sid
                        and absence_fact.record_type= 'D'),0) as ada_absence_count
            from
            location_dim
            join (select dd.district_id, dd.date_sid, dd.date_id, dd.short_date,dd.school_year, dd1.date_id as to_date
                    from date_dim dd
                    join
                      (select date_dim.date_id, date_dim.district_id
                        from
                        date_dim
                        where most_recent_enrollment_flag = 'Yes') dd1
                    on dd.district_id = dd1.district_id
                  where dd.date_id between dd1.date_id - 11 and  dd1.date_id
                  and dd.academic_day >0) date_dim
             on date_dim.district_id = location_dim.loc_county_dist_id
            where
                location_dim.loc_schl_year = date_dim.school_year
            and location_dim.loc_admin_type = 'Instructional'
            and location_dim.instructional_type != 'N/A'
            and location_dim.cur_indicator = 'Y'
            ) campus
        ) loc_min_pct
     ) location_count
    join (select distinct user_camid, loc_id from mv_location_burst) mv_location_burst
    on location_count.loc_id = mv_location_burst.loc_id
group by
 mv_location_burst.user_camid
,location_count.County_District_Id
,location_count.from_date
,location_count.to_date

union

select
 mv_location_burst.user_camid
,sum(case when location_count.min_pct >= .95 then 1 else 0 end) as count_of_campuses
,'All Days Above 95%' as Attendance_Percentage_Desc
,sum(case when location_count.min_pct <= .949 then 1 else 0 end) as count_below_95
,sum(case when location_count.min_pct >= .95 then 1 else 0 end) as count_above_95
,location_count.County_District_Id
,location_count.from_date
,location_count.to_date
from (
    select distinct
    loc_min_pct.County_District_Id
    ,loc_min_pct.loc_id
    ,loc_min_pct.from_date
    ,loc_min_pct.to_date
    ,min(campus_attendance_percent) over(partition by county_district_id,loc_id) as min_pct
    from (
        select
          Campus.loc_county_dist_id as County_District_Id
        , Campus.loc_id
        , Campus.loc_desc
        , Campus.loc_district
        , Campus.enrollment_date
        , Campus.from_date
        , Campus.to_date
        , Campus.ada_enrollment_count
        , Campus.ada_absence_count
        , case
              when campus.ada_enrollment_count = 0 and Campus.loc_state_type = 'ALTERNATIVE' then 1
              when Campus.ada_enrollment_count = 0 then 0
              else round((Campus.ada_enrollment_count - Campus.ada_absence_count)/Campus.ada_enrollment_count,3)
          end as campus_attendance_percent
        from
            (select
              location_dim.loc_county_dist_id
            , location_dim.loc_id
            , location_dim.loc_desc
            , location_dim.loc_district
            , location_dim.loc_state_type
            , date_dim.date_id as enrollment_date
            , date_dim.to_date as to_date
            , date_dim.to_date - 11 as from_date
            , nvl((select sum(enrollment_fact.ada_enr_cnt) from enrollment_fact
                  where enrollment_fact.date_sid = date_dim.date_sid
                        and enrollment_fact.loc_sid = location_dim.loc_sid),0) as ada_enrollment_count
            , nvl((select sum(absence_fact.ada_cnt) from absence_fact
                  where absence_fact.date_sid = date_dim.date_sid
                        and absence_fact.loc_sid = location_dim.loc_sid
                        and absence_fact.record_type= 'D'),0) as ada_absence_count
            from
            location_dim
            join (select dd.district_id, dd.date_sid, dd.date_id, dd.short_date,dd.school_year, dd1.date_id as to_date
                    from date_dim dd
                    join
                      (select date_dim.date_id, date_dim.district_id
                        from
                        date_dim
                        where most_recent_enrollment_flag = 'Yes') dd1
                    on dd.district_id = dd1.district_id
                  where dd.date_id between dd1.date_id - 11 and  dd1.date_id
                  and dd.academic_day >0) date_dim
             on date_dim.district_id = location_dim.loc_county_dist_id
            where
                location_dim.loc_schl_year = date_dim.school_year
            and location_dim.loc_admin_type = 'Instructional'
            and location_dim.instructional_type != 'N/A'
            and location_dim.cur_indicator = 'Y'
            ) campus
        ) loc_min_pct
     ) location_count
    join (select distinct user_camid, loc_id from mv_location_burst) mv_location_burst
    on location_count.loc_id = mv_location_burst.loc_id
group by
 mv_location_burst.user_camid
,location_count.County_District_Id
,location_count.from_date
,location_count.to_date;

prompt
prompt Creating materialized view MV_CHART_ATTEND_DRILL_THRU
prompt =====================================================
prompt
create materialized view SDM.MV_CHART_ATTEND_DRILL_THRU
using no index
refresh complete on demand
enable query rewrite
as
select
          Campus.loc_county_dist_id as County_District_Id
        , Campus.loc_id
        , Campus.loc_desc
        , Campus.loc_district
        , Campus.loc_state_type
        , Campus.enrollment_date
        , Campus.from_date
        , Campus.to_date
        , Campus.ada_enrollment_count
        , Campus.ada_absence_count
        , case
              when campus.ada_enrollment_count = 0 and Campus.loc_state_type = 'ALTERNATIVE' then 1
              when Campus.ada_enrollment_count = 0 then 0
              else round((Campus.ada_enrollment_count - Campus.ada_absence_count)/Campus.ada_enrollment_count,3)
          end as campus_attendance_percent
        from
            (select
              location_dim.loc_county_dist_id
            , location_dim.loc_id
            , location_dim.loc_desc
            , location_dim.loc_district
            , location_dim.loc_state_type
            , date_dim.date_id as enrollment_date
            , date_dim.to_date as to_date
            , date_dim.to_date - 11 as from_date
            , nvl((select sum(enrollment_fact.ada_enr_cnt) from enrollment_fact
                  where enrollment_fact.date_sid = date_dim.date_sid
                        and enrollment_fact.loc_sid = location_dim.loc_sid),0) as ada_enrollment_count
            , nvl((select sum(absence_fact.ada_cnt) from absence_fact
                  where absence_fact.date_sid = date_dim.date_sid
                        and absence_fact.loc_sid = location_dim.loc_sid
                        and absence_fact.record_type= 'D'),0) as ada_absence_count
            from
            location_dim
            join (select dd.district_id, dd.date_sid, dd.date_id, dd.short_date,dd.school_year, dd1.date_id as to_date
                    from date_dim dd
                    join
                      (select date_dim.date_id, date_dim.district_id
                        from
                        date_dim
                        where most_recent_enrollment_flag = 'Yes') dd1
                    on dd.district_id = dd1.district_id
                  where dd.date_id between dd1.date_id - 11 and  dd1.date_id
                  and dd.academic_day >0) date_dim
             on date_dim.district_id = location_dim.loc_county_dist_id
            where
                location_dim.loc_schl_year = date_dim.school_year
            and location_dim.loc_admin_type = 'Instructional'
            and location_dim.instructional_type != 'N/A'
            and location_dim.cur_indicator = 'Y'
            ) campus;

prompt
prompt Creating materialized view MV_CHART_ENROLLMENT_USER_NAME
prompt ========================================================
prompt
create materialized view SDM.MV_CHART_ENROLLMENT_USER_NAME
using no index
refresh complete on demand
enable query rewrite
as
select
  mv_location_burst.user_camid as user_camid
, district_loc_cnt.loc_county_dist_id as county_district_id
, district_loc_cnt.loc_district as district_name
, district_loc_cnt.current_school_year_desc as school_year_description
, district_loc_cnt.as_of_date
, district_loc_cnt.prior_year_date
, district_loc_cnt.academic_week
, sum(district_loc_cnt.current_enrollment) as enrollment_count_current
, sum(district_loc_cnt.prior_enrollment) as enrollment_count_previous
, case
  when sum(district_loc_cnt.prior_enrollment) = 0
       and sum(district_loc_cnt.current_enrollment) = 0 then 0
  when sum(district_loc_cnt.prior_enrollment) = 0 then 1
  else (sum(district_loc_cnt.current_enrollment)- sum(district_loc_cnt.prior_enrollment))
        / sum(district_loc_cnt.prior_enrollment)
  end as enrollment_change_percentage

from  (select
        location_dates.loc_county_dist_id
      , location_dates.loc_district
      , location_dates.district_logo_url
      , location_dates.loc_id
      , location_dates.loc_desc
      , location_dates.current_school_year
      , location_dates.current_school_year_desc
      , location_dates.current_enrollment
      , location_dates.prior_school_year
      , location_dates.prior_enrollment
      , location_dates.as_of_date
      , location_dates.prior_year_date
      , location_dates.ACADEMIC_WEEK
      from   (select distinct
               location_dim.loc_county_dist_id
              ,location_dim.loc_district
              ,location_dim.district_logo_url
              ,location_dim.loc_id
              ,location_dim.loc_desc
              ,current_dt.DATE_SID as current_date_sid
              ,current_dt.SCHOOL_YEAR as current_school_year
              ,current_dt.SCHOOL_YEAR_DESCRIPTION as current_school_year_desc
              ,current_dt.date_id as as_of_date
              ,prior_date.date_id as prior_year_date
              ,prior_date.DATE_SID as prior_date_sid
              ,prior_date.SCHOOL_YEAR as prior_school_year
              ,nvl((select sum(en1.cnt) from enrollment_fact en1
                                        join location_dim ld1 on ld1.loc_sid = en1.loc_sid
                               where en1.date_sid = current_dt.DATE_SID
                                     and ld1.loc_id = location_dim.loc_id
                                     and location_dim.loc_county_dist_id = en1.loc_county_dist_id),0) as current_enrollment
              ,nvl((select sum(en2.cnt) from enrollment_fact en2
                                        join location_dim ld2 on ld2.loc_sid = en2.loc_sid
                               where en2.date_sid = prior_date.DATE_SID
                                     and location_dim.loc_id = ld2.loc_id
                                     and location_dim.loc_county_dist_id = en2.loc_county_dist_id),0) as prior_enrollment
              ,current_dt.ACADEMIC_WEEK
              from  location_dim
              join date_dim current_dt on current_dt.DISTRICT_ID = location_dim.loc_county_dist_id
                                         and most_recent_enrollment_flag = 'Yes'
              join date_dim prior_date on prior_date.DISTRICT_ID = location_dim.loc_county_dist_id
                                        and prior_date.academic_week = current_dt.ACADEMIC_WEEK
                                        and prior_date.SCHOOL_YEAR = current_dt.SCHOOL_YEAR -1
                                        and prior_date.WEEKLY_ENROLLMENT_DATE_FLAG = 'Yes'
              where location_dim.loc_sid in (select distinct loc_sid from enrollment_fact)
                    ) location_dates
              ) district_loc_cnt
       join (select distinct user_camid, loc_id from mv_location_burst) mv_location_burst
            on district_loc_cnt.loc_id = mv_location_burst.loc_id
group by
  mv_location_burst.user_camid
, district_loc_cnt.loc_county_dist_id
, district_loc_cnt.loc_district
, district_loc_cnt.current_school_year_desc
, district_loc_cnt.as_of_date
, district_loc_cnt.prior_year_date
, district_loc_cnt.academic_week;

prompt
prompt Creating materialized view MV_CHART_GRADES_BY_DEPT
prompt ==================================================
prompt
create materialized view SDM.MV_CHART_GRADES_BY_DEPT
using no index
refresh complete on demand
enable query rewrite
as
select
    MV_LOCATION_DIM.LOC_COUNTY_DIST_ID
  , MV_LOCATION_DIM.LOC_ID
  , MV_LOCATION_DIM.LOC_DESC
  , MV_LOCATION_DIM.LOC_DISTRICT
  , COURSE_DIM.CONFORMED_DEPARTMENT
  , GRADE_FACT.GRADE_CONFORMED_TYPE
  , GRADE_FACT.GRADING_PERIOD
  , SUM(GRADE_FACT.CNT_GRADES_90_AND_ABOVE)     as CNT_GRADES_90_AND_ABOVE
  , SUM(GRADE_FACT.CNT_GRADES_FROM_80_BELOW_90) as CNT_GRADES_FROM_80_BELOW_90
  , SUM(GRADE_FACT.CNT_GRADES_FROM_70_BELOW_80) as CNT_GRADES_FROM_70_BELOW_80
  , SUM(GRADE_FACT.CNT_GRADES_BELOW_70)         as CNT_GRADES_BELOW_70
 from
   SDM.COURSE_DIM COURSE_DIM
 , SDM.GRADE_FACT GRADE_FACT
 , SDM.MV_LOCATION_DIM MV_LOCATION_DIM
 where
       GRADE_FACT.LOC_SID              = MV_LOCATION_DIM.LOC_SID
   and GRADE_FACT.COURSE_SID           = COURSE_DIM.COURSE_SID
   and GRADE_FACT.LOC_SID              = MV_LOCATION_DIM.LOC_SID
   --and GRADE_FACT.SCHOOL_YEAR          = MV_LOCATION_DIM.SCHOOL_YEAR_CURRENT
   and grade_fact.school_year = '2011'
   and GRADE_FACT.GRD_LVL_ID           in ('6', '7', '8', '9', '06', '07', '08', '09', '10', '11', '12')
   and GRADE_FACT.GRADING_PERIOD       = '1'
   and GRADE_FACT.GRADE_CONFORMED_TYPE = 'Semester'
 group by
     MV_LOCATION_DIM.LOC_ID
  , MV_LOCATION_DIM.LOC_COUNTY_DIST_ID
  , MV_LOCATION_DIM.LOC_DESC
  , MV_LOCATION_DIM.LOC_DISTRICT
  , COURSE_DIM.CONFORMED_DEPARTMENT
  , GRADE_FACT.GRADE_CONFORMED_TYPE
  , GRADE_FACT.GRADING_PERIOD;

prompt
prompt Creating materialized view MV_CHART_GRADES_BY_GRADE_LEVEL
prompt =========================================================
prompt
create materialized view SDM.MV_CHART_GRADES_BY_GRADE_LEVEL
using no index
refresh complete on demand
as
select
  mv_location_burst.user_camid as user_camid
, COUNTY_DISTRICT_ID
, current_school_year_desc as prior_school_year_desc
, grade_level as grade_levels
, sum("Grades_<70") as "grades_<70"
, sum("Grades_70-79") as "grades_70-79"
, sum("Grades_80-89") as "grades_80-89"
, sum("Grades_90+") as "grades_>90"
, sum(total_number_of_grades) as total_number_of_grades
from (
select distinct
  location_dim.loc_county_dist_id as COUNTY_DISTRICT_ID
, location_dim.loc_id as LOCATION_ID
, location_dim.loc_desc as LOCATION_DESCRIPTION
, location_dim.loc_district as DISTRICT_NAME
, location_dim.current_school_year_desc
, to_char(grade_fact.grd_lvl_id,'fm99') as grade_level
, sum(cnt_grades_below_70) as "Grades_<70"
, sum(cnt_grades_from_70_below_80) as "Grades_70-79"
, sum(cnt_grades_from_80_below_90) as "Grades_80-89"
, sum(cnt_grades_90_and_above) as "Grades_90+"
, count(*) as total_number_of_grades
from mv_location_dim location_dim
join grade_fact on location_dim.loc_sid = grade_fact.loc_sid

where
    grade_fact.grade_conformed_type = 'Semester'
and grade_fact.grd_lvl_id in  ('06','07','08','09','10','11','12','6','7','8','9')
and grade_fact.grading_period = '1'
--and grade_fact.school_year = location_dim.school_year_current
and grade_fact.school_year = '2011'
and grade_fact.numeric_grade is not null

group by
  location_dim.loc_county_dist_id
, location_dim.loc_id
, location_dim.loc_desc
, location_dim.loc_district
, grade_fact.grd_lvl_id
, current_school_year_desc
) t
join (select distinct user_camid, loc_id, district_id from mv_location_burst) mv_location_burst
            on (t.LOCATION_ID = mv_location_burst.loc_id
               and t.COUNTY_DISTRICT_ID = mv_location_burst.district_id)
group by  mv_location_burst.user_camid, COUNTY_DISTRICT_ID, current_school_year_desc, grade_level;

prompt
prompt Creating materialized view MV_CHART_GRADES_BY_STAFF_EXP
prompt =======================================================
prompt
create materialized view SDM.MV_CHART_GRADES_BY_STAFF_EXP
using no index
refresh complete on demand
as
select
  user_camid
, COUNTY_DISTRICT_ID
, staff_experience
, prior_school_year_desc
, date_dim.short_date as as_of_date
, "grades_90+"
, "grades_80-89"
, "grades_70-79"
, "grades_<70"
, total_grades
from
(
select -- User Grades by staff experience
  mv_location_burst.user_camid
, loc_counts.COUNTY_DISTRICT_ID
, loc_counts.staff_experience
, loc_counts.prior_school_year_desc
, sum(loc_counts."Grades_90+") as "grades_90+"
, sum(loc_counts."Grades_80-89") as "grades_80-89"
, sum(loc_counts."Grades_70-79") as "grades_70-79"
, sum(loc_counts."Grades_<70") as "grades_<70"
, sum(loc_counts.total_number_of_grades) as total_grades
from (
      --Grades by staff experience and location
      select grade_fact.loc_county_dist_id as COUNTY_DISTRICT_ID
      , location_dim.loc_id as LOCATION_ID
      , location_dim.loc_desc as LOCATION_DESCRIPTION
      , location_dim.current_school_year_desc as prior_school_year_desc
      , CASE
          WHEN staff_dim.staff_yrs_ttl_exp  =  0 THEN '0'
          WHEN staff_dim.staff_yrs_ttl_exp  between  1  and 3  THEN '1-3'
          WHEN staff_dim.staff_yrs_ttl_exp  between 4 and 6  THEN '4-6'
          WHEN staff_dim.staff_yrs_ttl_exp  between 7 and 12  THEN '7-12'
          WHEN staff_dim.staff_yrs_ttl_exp  >12  THEN '13+'
          ELSE  'Unknown'
        END as staff_experience
      , sum(cnt_grades_below_70) as "Grades_<70"
      , sum(cnt_grades_from_70_below_80) as "Grades_70-79"
      , sum(cnt_grades_from_80_below_90) as "Grades_80-89"
      , sum(cnt_grades_90_and_above) as "Grades_90+"
      , count(*) as total_number_of_grades
      from grade_fact
      join staff_dim on staff_dim.staff_sid = grade_fact.staff_sid
      left join mv_location_dim location_dim on location_dim.loc_sid = grade_fact.loc_sid
      where
          grade_fact.grade_conformed_type = 'Semester'
      and grade_fact.grd_lvl_id in ('6','7','8','9','10','11','12','06','07','08','09')
      and grade_fact.grading_period = '1'
--      and grade_fact.school_year = location_dim.school_year_current
      and grade_fact.school_year = '2011'
      and grade_fact.numeric_grade is not null
      group by
        grade_fact.loc_county_dist_id
      , location_dim.loc_id
      , location_dim.loc_desc
      , location_dim.current_school_year_desc
      , CASE
          WHEN (staff_dim.staff_yrs_ttl_exp  =  0) THEN '0'
          WHEN staff_dim.staff_yrs_ttl_exp  between  1  and 3  THEN '1-3'
          WHEN staff_dim.staff_yrs_ttl_exp  between 4 and 6  THEN '4-6'
          WHEN staff_dim.staff_yrs_ttl_exp  between 7 and 12  THEN '7-12'
          WHEN staff_dim.staff_yrs_ttl_exp  >12  THEN '13+'
          ELSE  'Unknown'
        end
      ) loc_counts
      join (select distinct user_camid, loc_id, district_id from mv_location_burst) mv_location_burst
            on (loc_counts.LOCATION_ID = mv_location_burst.loc_id
               and loc_counts.COUNTY_DISTRICT_ID = mv_location_burst.district_id)

group by   mv_location_burst.user_camid
           , loc_counts.COUNTY_DISTRICT_ID
           , loc_counts.staff_experience
           , loc_counts.prior_school_year_desc
) t
join date_dim on date_dim.district_id = county_district_id
              and date_dim.most_recent_enrollment_flag = 'Yes';

prompt
prompt Creating materialized view MV_DID_NOT_PASS
prompt ==========================================
prompt
create materialized view SDM.MV_DID_NOT_PASS
using no index
refresh complete on demand
enable query rewrite
as
select
  "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID"  "LOC_COUNTY_DIST_ID",
  "TEST_FACT"."LOC_COUNTY_DIST_ID"  "LOC_COUNTY_DIST_ID2",
  "STUDENT_DIM"."LOC_COUNTY_DIST_ID" "LOC_COUNTY_DIST_ID3",
    "DATE_DIM"."DISTRICT_ID" "DISTRICT_ID",
      "SUBJECT_ID", "TEST_FACT"."CHAR_BCKT_11",


"MV_LOCATION_DIM"."LOC_DESC"  ,
"TEST_FACT"."CHAR_BCKT_10" ,

"TEST_DIM"."SUBJECT_NAME"  ,
"STUDENT_DIM"."STU_ID"  ,
"STUDENT_DIM"."STU_FULL_NAME"  ,
"TEST_FACT"."CHAR_BCKT_12"  ,
"TEST_DIM"."OBJECTIVE_NUM"  ,
 "TEST_FACT"."CHAR_BCKT_3"  ,
 "TEST_FACT"."CHAR_BCKT_5"  ,
 "DATE_DIM"."DATE_ID"   ,
 "TEST_DIM"."QUESTION_NUM"

 from "SDM"."MV_LOCATION_DIM" "MV_LOCATION_DIM",
 "SDM"."TEST_FACT" "TEST_FACT",
 "SDM"."TEST_DIM" "TEST_DIM",
 "SDM"."STUDENT_DIM" "STUDENT_DIM",
 "SDM"."DATE_DIM" "DATE_DIM"
 where "TEST_RESULT_TYPE" = 'Preliminary'
  -- and "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID"='129901'
  -- and "TEST_FACT"."LOC_COUNTY_DIST_ID"='129901'
  -- and "STUDENT_DIM"."LOC_COUNTY_DIST_ID"='129901'
  -- and "DATE_DIM"."DISTRICT_ID"='129901'

-- and "TEST_DIM"."SUBJECT_ID"=CAST( :PQ1 AS VARCHAR( 2 CHAR ) )


 and "TEST_FACT"."CHAR_BCKT_11"='3'
 and "STUDENT_DIM"."CUR_INDICATOR"='Y'
 and ("TEST_DIM"."TEST_ID"='1001' or "TEST_DIM"."TEST_ID"='2001')
 and "TEST_DIM"."SUB_TEST_ID"='30'
 and "MV_LOCATION_DIM"."LOC_SID"="TEST_FACT"."LOC_SID"
 and "TEST_DIM"."TEST_SID"="TEST_FACT"."TEST_SID"
 and "DATE_DIM"."DATE_SID"="TEST_FACT"."DATE_SID"
 and "STUDENT_DIM"."STU_SID"="TEST_FACT"."STU_SID";

prompt
prompt Creating materialized view MV_DRILL_THRU
prompt ========================================
prompt
create materialized view SDM.MV_DRILL_THRU
using no index
refresh complete on demand
enable query rewrite
as
select
STUDENT_DIM."STU_CUR_SCHL" as 	SD_STU_CUR_SCHL,
STUDENT_DIM."LOC_COUNTY_DIST_ID" as 	SD_LOC_COUNTY_DIST_ID,
MV_LOCATION_DIM."LOC_ID" as 	LOC_LOC_ID,
MV_LOCATION_DIM."LOC_COUNTY_DIST_ID" as 	LOC_LOC_COUNTY_DIST_ID,
ENROLLMENT_FACT."LOC_COUNTY_DIST_ID" as 	ENR_LOC_COUNTY_DIST_ID,
STUDENT_DIM."STU_CUR_GRD_LVL" as 	SD_STU_CUR_GRD_LVL,
DATE_DIM."DATE_ID" as 	DATE_DATE_ID,
STUDENT_DIM."STU_FREE_REDU_LNCH" as 	SD_STU_FREE_REDU_LNCH,
STUDENT_DIM."STU_ETHNICITY" as 	SD_STU_ETHNICITY,

STUDENT_DIM."STU_FULL_NAME" as 	SD_STU_FULL_NAME,
STUDENT_DIM."STU_GENDER" as 	SD_STU_GENDER,
STUDENT_DIM."STU_LEP_CODE" as 	SD_STU_LEP_CODE,
DATE_DIM."SCHOOL_YEAR" as 	DATE_SCHOOL_YEAR,
STUDENT_DIM."STU_PRIMARY_ESE_CD" as 	SD_STU_PRIMARY_ESE_CD,
STUDENT_DIM."STU_ID" as 	SD_STU_ID,
MV_LOCATION_DIM."CURRENT_ACADEMIC_DAY" as 	LOC_CURRENT_ACADEMIC_DAY,
DATE_DIM."ACADEMIC_DAY" as 	DATE_ACADEMIC_DAY,
DATE_DIM."SNAPSHOT_DATE_INDICATOR"	DATE_SNAPSHOT_DATE_INDICATOR,

DATE_DIM."DISTRICT_ID" as 	DATE_DISTRICT_ID,
ENROLLMENT_FACT."STU_SID" as 	ENR_STU_SID,
STUDENT_DIM."STU_SID" as 	SD_STU_SID,
MV_LOCATION_DIM."LOC_SID" as 	LOC_LOC_SID,
ENROLLMENT_FACT."LOC_SID" as 	ENR_LOC_SID,
DATE_DIM."DATE_SID" as 	DATE_DATE_SID,
ENROLLMENT_FACT."DATE_SID" as	ENR_DATE_SID

 from "SDM"."ENROLLMENT_FACT" "ENROLLMENT_FACT",
 "SDM"."STUDENT_DIM" "STUDENT_DIM",
  "SDM"."MV_LOCATION_DIM" "MV_LOCATION_DIM",
   "SDM"."DATE_DIM" "DATE_DIM"
 where   "ENROLLMENT_FACT"."LOC_COUNTY_DIST_ID"='043901'
 and  "DATE_DIM"."DISTRICT_ID"='043901'

 and "DATE_DIM"."SCHOOL_YEAR"="MV_LOCATION_DIM"."SCHOOL_YEAR_CURRENT"
 and ("DATE_DIM"."ACADEMIC_DAY"="MV_LOCATION_DIM"."CURRENT_ACADEMIC_DAY"
     or "DATE_DIM"."SNAPSHOT_DATE_INDICATOR"='Yes')
  and "ENROLLMENT_FACT"."STU_SID"="STUDENT_DIM"."STU_SID"
  and "MV_LOCATION_DIM"."LOC_SID"="ENROLLMENT_FACT"."LOC_SID"
  and "DATE_DIM"."DATE_SID"="ENROLLMENT_FACT"."DATE_SID";

prompt
prompt Creating materialized view MV_ENROLLMENT_FACT_LOC_DT
prompt ====================================================
prompt
CREATE MATERIALIZED VIEW SDM.MV_ENROLLMENT_FACT_LOC_DT
USING NO INDEX
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
  LOC_COUNTY_DIST_ID
, LOC_SID
, DATE_SID
, SUM(ADA_ENR_CNT) AS ADA_ENR_CNT
, SUM(CNT)         AS CNT
FROM ENROLLMENT_FACT
GROUP BY
  LOC_COUNTY_DIST_ID
, LOC_SID
, DATE_SID;

prompt
prompt Creating materialized view MV_LOCATION_BURST
prompt ============================================
prompt
create materialized view SDM.MV_LOCATION_BURST
using no index
refresh complete on demand
enable query rewrite
as
select
  B.USER_NAME
, L.LOC_SID
, L.LOC_ID
, B.DISTRICT_ID
, B.USER_EMAIL_ADDRESS
, B.USER_CAMID
, B.USER_CAMIDDIR
FROM (
			SELECT
        RECIPIENT AS USER_EMAIL_ADDRESS
      , CAMID AS USER_CAMID
      , CAMIDDIR AS USER_CAMIDDIR
      , OU AS DISTRICT_ID
			, substr(camid, instr(camid,'uid=',1)+4, instr(camid,',ou=',1)-instr(camid,'uid=',1)-4) USER_NAME
			from LOCATION_BURST
			WHERE BURST_TYPE = 'D'
			) B
    JOIN LOCATION_DIM L ON B.DISTRICT_ID = L.LOC_COUNTY_DIST_ID
UNION
select
  B.USER_NAME
, L.LOC_SID
, L.LOC_ID
, B.DISTRICT_ID
, B.USER_EMAIL_ADDRESS
, B.USER_CAMID
, B.USER_CAMIDDIR
FROM (
			select
        RECIPIENT AS USER_EMAIL_ADDRESS
      , CAMID AS USER_CAMID
      , CAMIDDIR AS USER_CAMIDDIR
			, substr(R10LOCATION,1,6) AS DISTRICT_ID, R10LOCATION AS LOC_ID
			, substr(camid, instr(camid,'uid=',1)+4, instr(camid,',ou=',1)-instr(camid,'uid=',1)-4) USER_NAME
			FROM LOCATION_BURST
			WHERE BURST_TYPE = 'L'
			) B
    JOIN LOCATION_DIM L ON B.LOC_ID = L.LOC_ID;

prompt
prompt Creating materialized view MV_LOCATION_DIM
prompt ==========================================
prompt
create materialized view SDM.MV_LOCATION_DIM
using no index
refresh complete on demand
enable query rewrite
as
select
  LOC.*
, DT.ACADEMIC_DAY as CURRENT_ACADEMIC_DAY
, DT.ACADEMIC_WEEK as CURRENT_ACADEMIC_WEEK
, TO_CHAR(TO_NUMBER(DT.ACADEMIC_WEEK) - 1,'FM00') as PREVIOUS_ACADEMIC_WEEK
, DT.SCHOOL_YEAR as SCHOOL_YEAR_CURRENT
, TO_CHAR(TO_NUMBER(DT.SCHOOL_YEAR) - 1) as SCHOOL_YEAR_PREVIOUS
, DT.school_year_description as CURRENT_SCHOOL_YEAR_DESC
, TO_CHAR(TO_NUMBER(DT.SCHOOL_YEAR)-2) || '/' || TO_CHAR(TO_NUMBER(DT.SCHOOL_YEAR) - 1) as PRIOR_SCHOOL_YEAR_DESC
FROM LOCATION_DIM LOC
LEFT JOIN SDM.DATE_DIM DT
ON DT.DISTRICT_ID = loc.loc_county_dist_id and DT.MOST_RECENT_ENROLLMENT_FLAG = 'Yes'
WHERE LOC.loc_admin_type = 'Instructional'
or loc.loc_id = 'Unknown';

prompt
prompt Creating materialized view MV_SNAPSHOT
prompt ======================================
prompt
CREATE MATERIALIZED VIEW SDM.MV_SNAPSHOT
USING NO INDEX
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
  "DATE_DIM"."ACADEMIC_DAY"  as     "DATE_DIM.ACADEMIC_DAY",
  "DATE_DIM"."DATE_ID"  as     "DATE_ID",
  "DATE_DIM"."DATE_SID"  as     "DATE_SID",
  "DATE_DIM"."DISTRICT_ID"  as      "DATE_DIM.DISTRICT_ID",
  "DATE_DIM"."SCHOOL_YEAR"  as     "SCHOOL_YEAR",
  "DATE_DIM"."SNAPSHOT_DATE_INDICATOR"  as     "SNAPSHOT_DATE_INDICATOR",
  "ENROLLMENT_FACT"."DATE_SID"  as     "DATE_SID2",
  "ENROLLMENT_FACT"."LOC_SID"  as      "LOC_SID2",
  "ENROLLMENT_FACT"."STU_SID"  as      "STU_SID2",
  "ENROLLMENT_FACT"."LOC_COUNTY_DIST_ID"  as  "LOC_COUNTY_DIST_ID2",
  "MV_LOCATION_DIM"."CURRENT_ACADEMIC_DAY"  as  "CURRENT_ACADEMIC_DAY",
  "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID"  as     "LOC_COUNTY_DIST_ID",
  "MV_LOCATION_DIM"."LOC_ID"  as     "LOC_ID",
  "MV_LOCATION_DIM"."LOC_SID"  as     "LOC_SID",
  "MV_LOCATION_DIM"."SCHOOL_YEAR_CURRENT"  as     "SCHOOL_YEAR_CURRENT",
  "STUDENT_DIM"."LOC_COUNTY_DIST_ID"  as     "LOC_COUNTY_DIST_ID3",
  "STUDENT_DIM"."SCHL_YR"  as     "SCHL_YR",
  "STUDENT_DIM"."STU_CUR_GRD_LVL"  as     "STU_CUR_GRD_LVL",
  "STUDENT_DIM"."STU_CUR_SCHL"  as     "STU_CUR_SCHL",
  "STUDENT_DIM"."STU_ETHNICITY"  as     "STU_ETHNICITY",
  "STUDENT_DIM"."STU_FREE_REDU_LNCH"  as     "STU_FREE_REDU_LNCH",
  "STUDENT_DIM"."STU_GENDER"  as     "STU_GENDER",
  "STUDENT_DIM"."STU_ID"  as     "STU_ID",
  "STUDENT_DIM"."STU_SID"  as     "STU_SID",
  "STUDENT_DIM"."STU_LEP_CODE"  as     "STU_LEP_CODE",
  "STUDENT_DIM"."STU_PRIMARY_ESE_CD"  as     "STU_PRIMARY_ESE_CD"
from SDM.ENROLLMENT_FACT ENROLLMENT_FACT,
 SDM.STUDENT_DIM STUDENT_DIM,
 SDM.MV_LOCATION_DIM MV_LOCATION_DIM,
 SDM.DATE_DIM DATE_DIM
where ENROLLMENT_FACT.LOC_COUNTY_DIST_ID =  '043901'
and  DATE_DIM.DISTRICT_ID = ENROLLMENT_FACT.LOC_COUNTY_DIST_ID
and DATE_DIM.SCHOOL_YEAR=MV_LOCATION_DIM.SCHOOL_YEAR_CURRENT
and (DATE_DIM.ACADEMIC_DAY=MV_LOCATION_DIM.CURRENT_ACADEMIC_DAY
 or DATE_DIM.SNAPSHOT_DATE_INDICATOR='Yes')
 and ENROLLMENT_FACT.STU_SID=STUDENT_DIM.STU_SID
 and MV_LOCATION_DIM.LOC_SID=ENROLLMENT_FACT.LOC_SID
 and DATE_DIM.DATE_SID=ENROLLMENT_FACT.DATE_SID
 and "ENROLLMENT_FACT"."LOC_COUNTY_DIST_ID" = "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID";

prompt
prompt Creating materialized view MV_SNAPSHOT2
prompt =======================================
prompt
CREATE MATERIALIZED VIEW SDM.MV_SNAPSHOT2
USING NO INDEX
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT
"DATE_DIM"."DATE_SID" as D_DATE_SID,
"DATE_DIM"."DISTRICT_ID" as D_DATE_CDC,
"DATE_DIM"."SCHL_YEAR" as D_SCHL_YEAR,
"STUDENT_DIM"."LOC_COUNTY_DIST_ID",
"STUDENT_DIM"."STU_CUR_SCHL",
"STUDENT_DIM"."STU_ID" as S_STU_ID ,
"STUDENT_DIM"."STU_SID" as S_STU_SID ,
"TEST_DIM"."SUBJECT_NAME",
"TEST_DIM"."TEST_ID" as TD_TEST_ID,
"TEST_DIM"."TEST_SID" as TD_TEST_SID,
"TEST_SUMMARY_FACT"."ACCOMMODATED_IND",
"TEST_SUMMARY_FACT"."CHAR_BCKT_1",
"TEST_SUMMARY_FACT"."CHAR_BCKT_10",
"TEST_SUMMARY_FACT"."CHAR_BCKT_11",
"TEST_SUMMARY_FACT"."DATE_SID"  as T_DATE_SID,
"TEST_SUMMARY_FACT"."LOC_COUNTY_DIST_ID" as T_DATE_CDC,
"TEST_SUMMARY_FACT"."STU_SID" as TS_STU_SID,
"TEST_SUMMARY_FACT"."TEST_MODE_CD" as TS_TEST_MODE_C,
"TEST_SUMMARY_FACT"."TEST_SID" as TS_TEST_SID,
"TEST_SUMMARY_FACT"."TEST_TYPE_CD"  as TS_TEST_TYPE_CD

 from "SDM"."DATE_DIM" "DATE_DIM",
 "SDM"."TEST_SUMMARY_FACT" "TEST_SUMMARY_FACT",
 "SDM"."STUDENT_DIM" "STUDENT_DIM",
 "SDM"."TEST_DIM" "TEST_DIM"
 where   "DATE_DIM"."DISTRICT_ID"= '043901'
 and  "TEST_SUMMARY_FACT"."LOC_COUNTY_DIST_ID"='043901'
 and "DATE_DIM"."SCHL_YEAR"="DATE_DIM"."SCHL_YEAR"
 and "TEST_SUMMARY_FACT"."CHAR_BCKT_1"='S'
 and ("TEST_DIM"."TEST_ID"='1001' or "TEST_DIM"."TEST_ID"='2001')
 and "TEST_DIM"."SUB_TEST_ID"='10'
 and "DATE_DIM"."DATE_SID"="TEST_SUMMARY_FACT"."DATE_SID"
 and "TEST_DIM"."TEST_SID"="TEST_SUMMARY_FACT"."TEST_SID"
 and "TEST_SUMMARY_FACT"."STU_SID"="STUDENT_DIM"."STU_SID";

prompt
prompt Creating materialized view MV_TEST_LOC_SUMMARY
prompt ==============================================
prompt
create materialized view SDM.MV_TEST_LOC_SUMMARY
using no index
refresh complete on demand
enable query rewrite
as
select
 "TEST_DIM"."SUBJECT_ID",  "DATE_DIM"."DATE_ID", "TEST_FACT"."CHAR_BCKT_10", "TEST_FACT"."CHAR_BCKT_12",
 "STUDENT_DIM"."STU_CUR_SCHL", "STUDENT_DIM"."LOC_COUNTY_DIST_ID" AS  STU_DIST  ,
 "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID" AS LOC_DIST , "DATE_DIM"."DISTRICT_ID" AS DATE_DIST , "TEST_FACT"."LOC_COUNTY_DIST_ID"  AS TF_LOC ,
 "MV_LOCATION_DIM"."LOC_ID",  "TEST_DIM"."QUESTION_NUM" , "TEST_DIM"."OBJECTIVE_NUM" , "TEST_FACT"."CHAR_BCKT_3" ,
case when "DATE_DIM"."SCHL_YEAR"<=2009 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' else "TEST_FACT"."CHAR_BCKT_1" end when "DATE_DIM"."SCHL_YEAR">=2010 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' when "TEST_FACT"."CHAR_BCKT_5"='N' then 'Not Correct' else ' ' end end , count("TEST_FACT"."CHAR_BCKT_1") over (partition by "TEST_DIM"."QUESTION_NUM", "TEST_DIM"."OBJECTIVE_NAME", case when "DATE_DIM"."SCHL_YEAR">=2010 then 'N/A in Selected School Year' else "TEST_FACT"."CHAR_BCKT_2" end , case when "DATE_DIM"."SCHL_YEAR"<=2009 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' else "TEST_FACT"."CHAR_BCKT_1" end when "DATE_DIM"."SCHL_YEAR">=2010 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' when "TEST_FACT"."CHAR_BCKT_5"='N' then 'Not Correct' else ' ' end end , case case when "DATE_DIM"."SCHL_YEAR"<=2009 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' else "TEST_FACT"."CHAR_BCKT_1" end when "DATE_DIM"."SCHL_YEAR">=2010 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' when "TEST_FACT"."CHAR_BCKT_5"='N' then 'Not Correct' else ' ' end end when 'Correct' then 'z2' when 'Not Answered' then 'z1' else "TEST_FACT"."CHAR_BCKT_1" end , "TEST_FACT"."CHAR_BCKT_3", "TEST_DIM"."OBJECTIVE_NUM") , "TEST_DIM"."OBJECTIVE_NAME" ,
  case when "DATE_DIM"."SCHL_YEAR">=2010 then 'N/A in Selected School Year' else "TEST_FACT"."CHAR_BCKT_2" end , case case when "DATE_DIM"."SCHL_YEAR"<=2009 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' else "TEST_FACT"."CHAR_BCKT_1" end when "DATE_DIM"."SCHL_YEAR">=2010 then case when "TEST_FACT"."CHAR_BCKT_5"='Y' then 'Correct' when "TEST_FACT"."CHAR_BCKT_1"='*' then 'Not Answered' when "TEST_FACT"."CHAR_BCKT_5"='N' then 'Not Correct' else ' ' end end when 'Correct' then 'z2' when 'Not Answered' then 'z1' else "TEST_FACT"."CHAR_BCKT_1" end , min("TEST_DIM"."OBJECTIVE_NAME") over (partition by "TEST_DIM"."QUESTION_NUM") , min(case when "DATE_DIM"."SCHL_YEAR">=2010 then 'N/A in Selected School Year' else "TEST_FACT"."CHAR_BCKT_2" end ) over (partition by "TEST_DIM"."QUESTION_NUM") , min("TEST_DIM"."OBJECTIVE_NUM") over (partition by "TEST_DIM"."QUESTION_NUM") , min("TEST_FACT"."CHAR_BCKT_3") over (partition by "TEST_DIM"."QUESTION_NUM")
  from "SDM"."TEST_DIM" "TEST_DIM", "SDM"."TEST_FACT" "TEST_FACT", "SDM"."DATE_DIM" "DATE_DIM",
  "SDM"."MV_LOCATION_DIM" "MV_LOCATION_DIM", "SDM"."STUDENT_DIM" "STUDENT_DIM"
  where /*"TEST_DIM"."SUBJECT_ID"=CAST( '20' AS VARCHAR( 2 CHAR ) )
  and "MV_LOCATION_DIM"."LOC_ID"=CAST( '043901102' AS VARCHAR( 9 CHAR ) )
  and "DATE_DIM"."DATE_ID"='01-APR-2009' and "TEST_FACT"."CHAR_BCKT_10"=CAST( '05' AS VARCHAR( 2 CHAR ) )
   and */ "TEST_FACT"."CHAR_BCKT_12"=CAST( 'E' AS VARCHAR( 2 CHAR ) )
   and "STUDENT_DIM"."STU_ID"<>'999' and ("TEST_DIM"."TEST_ID"='1001' or "TEST_DIM"."TEST_ID"='2001')
   and "TEST_DIM"."SUB_TEST_ID"='30' and "TEST_DIM"."TEST_SID"="TEST_FACT"."TEST_SID"
   and "DATE_DIM"."DATE_SID"="TEST_FACT"."DATE_SID" and "STUDENT_DIM"."STU_SID"="TEST_FACT"."STU_SID"
   and "MV_LOCATION_DIM"."LOC_SID"="TEST_FACT"."LOC_SID"
   and "STUDENT_DIM"."STU_CUR_SCHL" in ('043901001', '043901002', '043901044', '043901102')
    and "STUDENT_DIM"."LOC_COUNTY_DIST_ID"='043901'
    and "MV_LOCATION_DIM"."LOC_ID" in ('043901001', '043901002', '043901044', '043901102')
    and "MV_LOCATION_DIM"."LOC_COUNTY_DIST_ID"='043901' and "DATE_DIM"."DISTRICT_ID"='043901'
    and "TEST_FACT"."LOC_COUNTY_DIST_ID"='043901';

prompt
prompt Creating materialized view MV_TEST_PROMPT
prompt =========================================
prompt
create materialized view SDM.MV_TEST_PROMPT
using no index
refresh complete on demand
enable query rewrite
as
select distinct "TEST_FACT"."LOC_COUNTY_DIST_ID", "DATE_DIM"."DISTRICT_ID", "DATE_DIM"."DATE_ID", "DATE_DIM"."DATE_SID"
   , "TEST_DIM"."SUBJECT_ID", "TEST_DIM"."SUBJECT_NAME"
   , "TEST_DIM"."TEST_SID" , "TEST_DIM"."TEST_ID", "TEST_DIM"."SUB_TEST_ID"
   , "TEST_FACT"."CHAR_BCKT_10",  "TEST_FACT"."CHAR_BCKT_12"
 from "SDM"."TEST_FACT" "TEST_FACT", "SDM"."TEST_DIM" "TEST_DIM", "SDM"."DATE_DIM" "DATE_DIM"
 where  "TEST_FACT"."LOC_COUNTY_DIST_ID" ="DATE_DIM"."DISTRICT_ID"
 and "TEST_DIM"."TEST_SID"="TEST_FACT"."TEST_SID"
 and "DATE_DIM"."DATE_SID"="TEST_FACT"."DATE_SID";

prompt
prompt Creating materialized view MV_TEST_PROMPT2
prompt ==========================================
prompt
create materialized view SDM.MV_TEST_PROMPT2
using no index
refresh complete on demand
enable query rewrite
as
select distinct "TEST_FACT"."LOC_COUNTY_DIST_ID", "DATE_DIM"."DISTRICT_ID", "DATE_DIM"."DATE_ID", "DATE_DIM"."DATE_SID"
   , "TEST_DIM"."SUBJECT_ID", "TEST_DIM"."SUBJECT_NAME"
   , "TEST_DIM"."TEST_SID" , "TEST_DIM"."TEST_ID", "TEST_DIM"."SUB_TEST_ID"
   , "TEST_FACT"."CHAR_BCKT_10",  "TEST_FACT"."CHAR_BCKT_12"
 from "SDM"."TEST_FACT" "TEST_FACT", "SDM"."TEST_DIM" "TEST_DIM", "SDM"."DATE_DIM" "DATE_DIM"
 where  "TEST_FACT"."LOC_COUNTY_DIST_ID" ="DATE_DIM"."DISTRICT_ID"
 and "TEST_DIM"."TEST_SID"="TEST_FACT"."TEST_SID"
 and "DATE_DIM"."DATE_SID"="TEST_FACT"."DATE_SID";

prompt
prompt Creating package CURRENT_REJECTS
prompt ================================
prompt
CREATE OR REPLACE PACKAGE SDM."CURRENT_REJECTS" is
  ---------------------------------------------------------------------
  -- Package Spec:        current_rejects 
  --
  -- Purpose:             code to populate table for Confluence 
  --                      CURRENT_REKECTS page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100401  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
  type r_cursor is ref cursor;
  
  procedure getCurrentRejects;

end current_rejects;
/

prompt
prompt Creating package ENROLLMENT_PAST_WITHDRAWAL
prompt ===========================================
prompt
CREATE OR REPLACE PACKAGE SDM."ENROLLMENT_PAST_WITHDRAWAL" is
  ---------------------------------------------------------------------
  --
  -- Package Spec:        enrollment_past_withdrawal 
  --
  -- Purpose:             code to populate table for Confluence 
  --                      ENROLLMENTS PAST WITHDRAWAL page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100406  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
  procedure getEnrollPassWith; 
    
end enrollment_past_withdrawal;
/

prompt
prompt Creating package ETL_GATHER_STATS
prompt =================================
prompt
CREATE OR REPLACE PACKAGE SDM."ETL_GATHER_STATS" is

  -------------------------------------------------------------------
  -- Package Body:        etl_gather_stats
  --
  -- Purpose:             procs to gather stats on tables, alter 
  --                      indices on partitions, build global indices
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100601  T. Esposito  Original version
  -------------------------------------------------------------------
  
  procedure alter_bmi_indexes;
  procedure build_global_indexes;  
  procedure do_compute_stats (p_owner varchar2);
  procedure do_estimate_stats (p_owner varchar2);
 
end etl_gather_stats;
/

prompt
prompt Creating package GET_FACT_COUNTS
prompt ================================
prompt
CREATE OR REPLACE PACKAGE SDM."GET_FACT_COUNTS" as
 ---------------------------------------------------------------------
  -- Package Spec:        fact_counts
  --
  -- Purpose:             code to populate table for Confluence 
  --                      fact table counts page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100419  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
  type r_cursor is ref cursor;
  procedure getFactTables(schema_name varchar2);

end get_fact_counts;
/

prompt
prompt Creating package PKG_EMPOWER_POST_PROCESSING
prompt ============================================
prompt
create or replace package sdm.pkg_empower_post_processing is

  --**************************************************************************
  -- 
  -- Package: pkg_empower_post_processing
  --
  -- Purpose: package containing any post-processing steps after Empower Load.
  --
  -- Procedures: prc_encrypt_student_ssn -- changes ssn on student_dim to some
  --                                        given pattern.     
  --
  -- Revision History
  -- Date             Author            Remarks
  -- 1/3/2011         T. Esposito       Original version
  --
  --**************************************************************************
   
  procedure prc_encrypt_student_ssn(p_pattern student_dim.stu_id_2%type
                                   ,p_array_size pls_integer default 100);
                               
end pkg_empower_post_processing;
/

prompt
prompt Creating package PKG_UPDATE_DATE_DIM_NEW_YEAR
prompt =============================================
prompt
CREATE OR REPLACE PACKAGE SDM."PKG_UPDATE_DATE_DIM_NEW_YEAR" is
  /*
  Author  : CARLSONP
  Created : 6/23/2010 3:13:02 PM
  Purpose : Updates the new school years' district specific dates.
  
  Revision History
  Date      Author       Remarks
  
    */

  function fn_school_week(v_date in number) return number;
  procedure prc_update_date_dim_new_year(p_school_year in varchar2);
end pkg_update_date_dim_new_year;
/

prompt
prompt Creating function FN_CURR_SCHL_YR_CHAR
prompt ======================================
prompt
CREATE OR REPLACE FUNCTION SDM."FN_CURR_SCHL_YR_CHAR"
return varchar2
is
    v_cur_yr varchar2(4);
begin 

    select distinct school_year
    into v_cur_yr
    from date_dim 
    where date_id = trunc(sysdate);

    return v_cur_yr;
end;
/

prompt
prompt Creating procedure PART_ROW_COUNT
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE SDM."PART_ROW_COUNT"
IS
   table_name VARCHAR2(50)  ;
   part_name  VARCHAR2(50)  ;
   rows_cnt    NUMBER  := 0 ; 
  
  CURSOR cur_parts IS
    select     TABLE_NAME  , PARTITION_NAME  
     from USER_TAB_PARTITIONS
     where   TABLE_NAME   like '%_FACT'   
     ORDER BY 1,2 ; 
BEGIN
  OPEN cur_parts;
  LOOP
    FETCH cur_parts INTO table_name, part_name ;
     EXIT WHEN cur_parts%NOTFOUND;
  
   rows_cnt := 0 ; 
   
   execute immediate 'select count(*) from ' || table_name || ' PARTITION( ' || part_name || ' ) '
   into rows_cnt  ;
   
       dbms_output.put_line( table_name || ' ----  ' || part_name || ' -----  ' || rows_cnt ); 
 

 END LOOP;
CLOSE cur_parts;   
END;
/

prompt
prompt Creating procedure PRC_UPDATE_DATE_DIM
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SDM."PRC_UPDATE_DATE_DIM" (v_school_year in varchar2) is

begin
--update school_day_indicator based on etl_district_dates table
update date_dim_test dd
set school_day_indicator = (select ed.district_date_type from etl_district_dates ed
                            where ed.district_sid = dd.district_sid
                            and ed.date_id = dd.date_id
                            and ed.district_date_type in ('Professional','Non-Academic'))
where dd.school_year = v_school_year;

--update school_day_indicator for weekend days to 'Non-Academic' except when not null
update date_dim_test
set school_day_indicator = 'Non-Academic'
where to_char(date_id,'D') in ('1','7')
and school_day_indicator is null
and school_year = v_school_year;

--update first_day_academic_6_weeks
update date_dim_test
set first_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Six Weeks', 'Begin Second Six Weeks','Begin Third Six Weeks','Begin Fourth Six Weeks','Begin Fifth Six Weeks','Begin Sixth Six Weeks'))
and school_year = v_school_year;

--update last_day_academic_6_weeks
update date_dim_test
set last_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Six Weeks', 'End Second Six Weeks','End Third Six Weeks','End Fourth Six Weeks','End Fifth Six Weeks','End Sixth Six Weeks'))
and school_year = v_school_year;

--update first_day_academic_9_weeks
update date_dim_test
set first_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Nine Weeks', 'Begin Second Nine Weeks','Begin Third Nine Weeks','Begin Fourth Nine Weeks'))
and school_year = v_school_year;

--update last_day_academic_9_weeks
update date_dim_test
set last_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Nine Weeks', 'End Second Nine Weeks','End Third Nine Weeks','End Fourth Nine Weeks'))
and school_year = v_school_year;

--update first_day_semester
update date_dim_test
set first_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Semester', 'Begin Second Semester'))
and school_year = v_school_year;

--update last_day_semester
update date_dim_test
set last_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Semester', 'End Second Semester'))
and school_year = v_school_year;

--update academic_6_weeks 1
update date_dim_test
set academic_6_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_6_weeks 2
update date_dim_test
set academic_6_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_6_weeks 3
update date_dim_test
set academic_6_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_6_weeks 4
update date_dim_test
set academic_6_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_6_weeks 5
update date_dim_test
set academic_6_weeks = 5
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_6_weeks 6
update date_dim_test
set academic_6_weeks = 6
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_9_weeks 1
update date_dim_test
set academic_9_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_9_weeks 2
update date_dim_test
set academic_9_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_9_weeks 3
update date_dim_test
set academic_9_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update academic_9_weeks 4
update date_dim_test
set academic_9_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update semester 1
update date_dim_test
set semester = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update semester 2
update date_dim_test
set semester = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = v_school_year;

--update discipline_reporting_period 1
update date_dim_test d1
set discipline_reporting_period = 1
where date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = v_school_year);

--update discipline_reporting_period 2
update date_dim_test d1
set discipline_reporting_period = 2
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = v_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = v_school_year);

--update discipline_reporting_period 3
update date_dim_test d1
set discipline_reporting_period = 3
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = v_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = v_school_year);

--update discipline_reporting_period 4
update date_dim_test d1
set discipline_reporting_period = 4
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = v_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = v_school_year);

--update discipline_reporting_period 5
update date_dim_test d1
set discipline_reporting_period = 5
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = v_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = v_school_year);

--update discipline_reporting_period 6
update date_dim_test d1
set discipline_reporting_period = 6
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = v_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12);

--update school_day_indicator to 'Non-Academic' prior to school start and after school ends
update date_dim_test d1
set school_day_indicator = 'Non-Academic'
where (date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id - 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.first_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = v_school_year))

or (date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 6
    and school_year = v_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12));

--update the null school_day_indicators to 'Instructional'
update date_dim_test
set school_day_indicator = 'Instructional'
where school_day_indicator is null
and school_year = v_school_year;

--update snapshot_date_indicator
update date_dim_test
set snapshot_date_indicator = 'No'
where school_year = v_school_year;

update date_dim_test
set snapshot_date_indicator = 'Yes'
where date_id = '29-OCT-2011';

--update academic_week
update date_dim_test d1
set academic_week =
  (with academic_week_tbl as
   (select date_sid, lpad(dense_rank() over (partition by district_sid order by fn_school_week(date_id)),2,'0') academic_week
    from date_dim_test where school_year = v_school_yearand school_day_indicator = 'Instructional')

   select academic_week from academic_week_tbl
   where academic_week_tbl.date_sid = d1.date_sid)
where school_year = v_school_year
and school_day_indicator = 'Instructional';

update date_dim_test
set academic_week =
(with tmp_academic_week as
    (select distinct district_sid, school_week, academic_week
    from date_dim_test
    where school_day_indicator = 'Instructional'
    and school_year = v_school_year),

 tmp_non_istr as
    (select tmp_academic_week.district_sid, date_dim_test.date_id ,tmp_academic_week.academic_week
    from date_dim_test
    join tmp_academic_week
    on date_dim_test.school_week = tmp_academic_week.school_week
    and date_dim_test.district_sid = tmp_academic_week.district_sid
    where to_char(date_id,'d') not in (1,7)
    and school_year = v_school_year
    and date_dim_test.academic_week = '00')

    select academic_week
    from tmp_non_istr
    where date_dim_test.date_id = tmp_non_istr.date_id
    and date_dim_test.district_sid = tmp_non_istr.district_sid)

where school_year = v_school_year
and academic_week = '00'

update date_dim_test d1
set academic_week = '00'
where academic_week is null
and school_year = v_school_year;

-- update academic_day
update date_dim_test d1
  set academic_day =
    (with instructional_day as
       (select date_sid, date_id, rank() over (partition by district_sid order by date_id) as academic_day
               from date_dim_test
               where school_day_indicator = 'Instructional'
               and school_year = v_school_year
               order by date_id)

       select instructional_day.academic_day
               from instructional_day
               where instructional_day.date_sid = d1.date_sid)
where school_year = v_school_year
and school_day_indicator = 'Instructional';

-- update weekly_enrollment_date_flag
update date_dim_test
set weekly_enrollment_date_flag = 'No'
where school_year = v_school_year;

update date_dim_test d1
set weekly_enrollment_date_flag = 'Yes'
where date_id in
(with non_thurs_load as
 (select district_sid, max(date_id) date_id
 from date_dim_test d1
 where academic_week in (select academic_week
                         from date_dim_test d2
                         where to_char(date_id,'d') = 5
                         and school_day_indicator != 'Instructional'
                         and school_year = v_school_year
                         and academic_week <> '00'
                         and d1.district_sid = d2.district_sid)
 and school_day_indicator = 'Instructional'
 and school_year = v_school_year
 group by district_sid, academic_week)

 select date_id from non_thurs_load n1 where n1.district_sid = d1.district_sid)

and school_year = v_school_year;

update date_dim_test
set weekly_enrollment_date_flag = 'Yes'
where to_char(date_id,'d') = 5
and school_day_indicator = 'Instructional'
and school_year = v_school_year;
end;
/

prompt
prompt Creating procedure PRC_UPDATE_DATE_DIM_NEW_YEAR
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE SDM."PRC_UPDATE_DATE_DIM_NEW_YEAR" (p_school_year in varchar2) is

begin
--update school_day_indicator based on etl_district_dates table
update date_dim_test dd
set school_day_indicator = (select ed.district_date_type from etl_district_dates ed
                            where ed.district_sid = dd.district_sid
                            and ed.date_id = dd.date_id
                            and ed.district_date_type in ('Professional','Non-Academic'))
where dd.school_year = p_school_year;

--update school_day_indicator for weekend days to 'Non-Academic' except when not null
update date_dim_test
set school_day_indicator = 'Non-Academic'
where to_char(date_id,'D') in ('1','7')
and school_day_indicator is null
and school_year = p_school_year;

--update first_day_academic_6_weeks
update date_dim_test
set first_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Six Weeks', 'Begin Second Six Weeks','Begin Third Six Weeks','Begin Fourth Six Weeks','Begin Fifth Six Weeks','Begin Sixth Six Weeks'))
and school_year = p_school_year;

--update last_day_academic_6_weeks
update date_dim_test
set last_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Six Weeks', 'End Second Six Weeks','End Third Six Weeks','End Fourth Six Weeks','End Fifth Six Weeks','End Sixth Six Weeks'))
and school_year = p_school_year;

--update first_day_academic_9_weeks
update date_dim_test
set first_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Nine Weeks', 'Begin Second Nine Weeks','Begin Third Nine Weeks','Begin Fourth Nine Weeks'))
and school_year = p_school_year;

--update last_day_academic_9_weeks
update date_dim_test
set last_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Nine Weeks', 'End Second Nine Weeks','End Third Nine Weeks','End Fourth Nine Weeks'))
and school_year = p_school_year;

--update first_day_semester
update date_dim_test
set first_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('Begin First Semester', 'Begin Second Semester'))
and school_year = p_school_year;

--update last_day_semester
update date_dim_test
set last_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim_test.district_sid
                 and etl_district_dates.date_id = date_dim_test.date_id
                 and etl_district_dates.district_date_type in ('End First Semester', 'End Second Semester'))
and school_year = p_school_year;

--update academic_6_weeks 1
update date_dim_test
set academic_6_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 2
update date_dim_test
set academic_6_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 3
update date_dim_test
set academic_6_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 4
update date_dim_test
set academic_6_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 5
update date_dim_test
set academic_6_weeks = 5
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 6
update date_dim_test
set academic_6_weeks = 6
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 1
update date_dim_test
set academic_9_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 2
update date_dim_test
set academic_9_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 3
update date_dim_test
set academic_9_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 4
update date_dim_test
set academic_9_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update semester 1
update date_dim_test
set semester = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update semester 2
update date_dim_test
set semester = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Semester'
                        and etl_district_dates.district_sid = date_dim_test.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update discipline_reporting_period 1
update date_dim_test d1
set discipline_reporting_period = 1
where date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year);
    
--update discipline_reporting_period 2
update date_dim_test d1
set discipline_reporting_period = 2
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = p_school_year);

--update discipline_reporting_period 3
update date_dim_test d1
set discipline_reporting_period = 3
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = p_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = p_school_year);
    
--update discipline_reporting_period 4
update date_dim_test d1
set discipline_reporting_period = 4
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = p_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = p_school_year);

--update discipline_reporting_period 5
update date_dim_test d1
set discipline_reporting_period = 5
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = p_school_year)
and (select date_id
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = p_school_year);
    
--update discipline_reporting_period 6
update date_dim_test d1
set discipline_reporting_period = 6
where date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = p_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12);

--update school_day_indicator to 'Non-Academic' prior to school start and after school ends
update date_dim_test d1
set school_day_indicator = 'Non-Academic'
where (date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id - 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.first_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year))
    
or (date_id between (select date_id + 1
    from date_dim_test d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 6
    and school_year = p_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12));
    
--update the null school_day_indicators to 'Instructional'
update date_dim_test
set school_day_indicator = 'Instructional'
where school_day_indicator is null
and school_year = p_school_year;

--update snapshot_date_indicator
update date_dim_test
set snapshot_date_indicator = 'No'
where school_year = p_school_year;

update date_dim_test
set snapshot_date_indicator = 'Yes'
where date_id = '29-OCT-2011';

--update academic_week
update date_dim_test d1
set academic_week = 
  (with academic_week_tbl as
   (select date_sid, lpad(dense_rank() over (partition by district_sid order by fn_school_week(date_id)),2,'0') academic_week
    from date_dim_test
    where school_year = p_school_year
    and school_day_indicator = 'Instructional')
    
   select academic_week from academic_week_tbl
   where academic_week_tbl.date_sid = d1.date_sid)
where school_year = p_school_year
and school_day_indicator = 'Instructional';

update date_dim_test
set academic_week =
(with tmp_academic_week as
    (select distinct district_sid, school_week, academic_week
    from date_dim_test
    where school_day_indicator = 'Instructional'
    and school_year = p_school_year),
    
 tmp_non_istr as
    (select tmp_academic_week.district_sid, date_dim_test.date_id ,tmp_academic_week.academic_week
    from date_dim_test
    join tmp_academic_week
    on date_dim_test.school_week = tmp_academic_week.school_week
    and date_dim_test.district_sid = tmp_academic_week.district_sid
    where to_char(date_id,'d') not in (1,7)
    and school_year = p_school_year
    and date_dim_test.academic_week = '00')
    
    select academic_week
    from tmp_non_istr
    where date_dim_test.date_id = tmp_non_istr.date_id
    and date_dim_test.district_sid = tmp_non_istr.district_sid)
    
where school_year = p_school_year
and academic_week = '00';

update date_dim_test d1
set academic_week = '00'
where academic_week is null
and school_year = p_school_year;

-- update academic_day
update date_dim_test d1
  set academic_day = 
    (with instructional_day as
       (select date_sid, date_id, rank() over (partition by district_sid order by date_id) as academic_day
               from date_dim_test
               where school_day_indicator = 'Instructional'
               and school_year = p_school_year
               order by date_id)
               
       select instructional_day.academic_day
               from instructional_day
               where instructional_day.date_sid = d1.date_sid)
where school_year = p_school_year
and school_day_indicator = 'Instructional';

-- update weekly_enrollment_date_flag
update date_dim_test
set weekly_enrollment_date_flag = 'No'
where school_year = p_school_year;

update date_dim_test d1
set weekly_enrollment_date_flag = 'Yes'
where date_id in
(with non_thurs_load as
 (select district_sid, max(date_id) date_id
 from date_dim_test d1
 where academic_week in (select academic_week
                         from date_dim_test d2
                         where to_char(date_id,'d') = 5
                         and school_day_indicator != 'Instructional'
                         and school_year = p_school_year
                         and academic_week <> '00'
                         and d1.district_sid = d2.district_sid)
 and school_day_indicator = 'Instructional'
 and school_year = p_school_year
 group by district_sid, academic_week)
 
 select date_id from non_thurs_load n1 where n1.district_sid = d1.district_sid)
 
and school_year = p_school_year;

update date_dim_test
set weekly_enrollment_date_flag = 'Yes'
where to_char(date_id,'d') = 5
and school_day_indicator = 'Instructional'
and school_year = p_school_year;
end;
/

prompt
prompt Creating procedure PROC_LOAD_ENROLLMENTS_STUDENT
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE SDM."PROC_LOAD_ENROLLMENTS_STUDENT"
                            (v_begin_date date
                             ,v_end_date date
                             ,v_district_id enrollment_fact.loc_county_dist_id%TYPE
                             ,v_stu_sid enrollment_fact.stu_sid%TYPE) as

v_enrollments enrollment_fact%ROWTYPE;

-- Get the date range
cursor c_enroll_dates is select district_sid
                   ,date_sid
                   ,date_id
                
           from date_dim
           
           where date_id between v_begin_date and v_end_date
           and district_id = v_district_id
           and school_day_indicator = 'Instructional'
           
           order by date_id;

begin

-- Get the row to copy
select * into v_enrollments
       from enrollment_fact
       where enrollment_fact.date_sid = 
                 (select date_sid from date_dim where date_id = 
                              (select max(date_id)
                               from date_dim
                               join enrollment_fact
                               on date_dim.date_sid = enrollment_fact.date_sid
                               where date_id < v_begin_date
                               and district_id = v_district_id
                               and school_day_indicator = 'Instructional'
                               and stu_sid = v_stu_sid)
                  and district_id = v_district_id)
        and stu_sid = v_stu_sid
        and loc_county_dist_id = v_district_id;
        
          begin

-- Load the enrollments               
              for date_rec in c_enroll_dates loop
              insert into enrollment_fact_test values
                          (v_enrollments.loc_county_dist_id
                          ,v_enrollments.stu_sid
                          ,v_enrollments.loc_sid
                          ,date_rec.date_sid
                          ,v_enrollments.cnt
                          ,v_enrollments.inactive_record
                          ,v_enrollments.process_dt
                          ,v_enrollments.stu_lep_code
                          ,v_enrollments.stu_race
                          ,v_enrollments.stu_free_redu_lnch
                          ,v_enrollments.stu_cur_grd_lvl
                          ,v_enrollments.stu_primary_ese_cd
                          ,v_enrollments.ada_enr_cnt);
                          
              end loop;
           end;       
end;
/

prompt
prompt Creating package body CURRENT_REJECTS
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE BODY SDM."CURRENT_REJECTS" is
  ---------------------------------------------------------------------
  -- Package Body:        current_rejects 
  --
  -- Purpose:             populate table for Confluence CURRENT_REKECTS 
  --                      page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100401  T. Esposito  Original version
  --
  ---------------------------------------------------------------------


  v_errcode number;
  v_errmesg varchar2(200);
 
  ---------------------------------------------------------
  -- calcInserts - get the total number of records inserted 
  --               for each FACT table.
  ---------------------------------------------------------
  
  procedure calcInserts (
          table_name   in varchar2,
          cursor_name  in out r_cursor)
  is
  
    pragma autonomous_transaction;
    v_sql varchar2(2000);
    
  begin
    v_sql := 'select l.loc_county_dist_id, count(*) as inserted_recs, process_dt
              from ' || table_name || ' t
                  ,(select distinct loc_county_dist_id
                    from location_dim) l
              where l.loc_county_dist_id = t.loc_county_dist_id
              and   t.process_dt >= sysdate - 6
              group by l.loc_county_dist_id, t.process_dt
              order by l.loc_county_dist_id';

    open cursor_name for v_sql;
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := (substr(sqlerrm,1,200)||dbms_utility.format_error_backtrace);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('current_rejects',sysdate,'Error','currect_rejects.selectTotals','E',v_errcode,table_name || '-' || v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end calcInserts;
    
  ---------------------------------------------------------
  -- calcRejects - get the total number of records rejected
  --               for each FACT table.
  ---------------------------------------------------------

  procedure calcRejects (
          table_name   in varchar2,
          cursor_name  in out r_cursor)
  is
  
    pragma autonomous_transaction;
    v_sql varchar2(2000);
        
  begin
    v_sql := 'select l.loc_county_dist_id, count(*) as rejects, "reason", t.process_dt
              from ' || table_name || ' t
                  ,(select distinct loc_county_dist_id
                    from location_dim) l
              where l.loc_county_dist_id = t.loc_county_dist_id
              group by l.loc_county_dist_id, "reason", t.process_dt
              order by l.loc_county_dist_id';

    open cursor_name for v_sql;
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('current_rejects',sysdate,'Error','currect_rejects.selectRejects','E',v_errcode,table_name || '-' || v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end calcRejects;
  
  --
  -- Get reject tables 
  --

  procedure getCurrentRejects 
  is
    
    pragma autonomous_transaction;         
    cursor sel_curs is
    select table_name
      from all_tables
     where table_name like 'CUR_REJ%'
       and table_name NOT IN ('CUR_REJ_ABSENCE_SUMMARY_FACT')
--                            ,'CUR_REJ_ESP_STATUS_FACT'
--                             ,'CUR_REJ_STAFF_SCHD_FACT'
--                             ,'CUR_REJ_STAFF_ABSENT_FACT')
       and owner = 'SDM';
       
    refc1 r_cursor; 
    refc2 r_cursor;    
       
    v_dist_id    varchar2(6);
    v_reason     varchar2(1000);
    v_rejectCnt  number;  
    v_insertCnt  number;
    v_processDt  varchar2(100);
    v_table_name varchar2(35);
    v_action_name varchar2(100);
      
  begin
    
    -- get insertcounts
    v_action_name := 'insert current_inserts';
    for sel_rec in sel_curs loop
      v_table_name := sel_rec.table_name;
      calcInserts(substr(sel_rec.table_name,9,length(sel_rec.table_name)), refc1);
      loop
        fetch refc1 into v_dist_id, v_insertCnt, v_processDt;
        exit when refc1%notfound;
        insert into current_inserts_tbl values(v_dist_id
                                              ,v_insertCnt
                                              ,substr(sel_rec.table_name,9,length(sel_rec.table_name))
                                              ,v_processDt
                                              ,sysdate);
      end loop;
      commit;
    end loop;  -- end of 'for' loop for getting inserts
   
    -- get reject counts 
    v_action_name := 'insert current_rejects';
    for sel_rec in sel_curs loop
      v_table_name := sel_rec.table_name;
      calcRejects(sel_rec.table_name, refc2);
      loop
        fetch refc2 into v_dist_id, v_rejectCnt, v_reason, v_processDt;
        exit when refc2%notfound;
        insert into current_rejects_tbl values(v_dist_id
                                              ,v_reason
                                              ,v_rejectCnt
                                              ,substr(sel_rec.table_name,9,length(sel_rec.table_name))
                                              ,v_processDt
                                              ,sysdate);
      end loop;
      commit;
    end loop;  -- end of 'for' loop for getting rejects
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := (v_action_name || ' - ' || substr(sqlerrm,1,200)||dbms_utility.format_error_backtrace);
           
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('current_rejects',sysdate,'Error','currect_rejects.getRejTables','E',v_errcode,v_table_name || '-' || v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end getCurrentRejects;
  
  ------------------------------------------
  -- initialize - truncate tables to be used
  ------------------------------------------ 
  procedure initialize
  is
  begin
    execute immediate 'truncate table current_rejects_tbl'; 
    execute immediate 'truncate table current_inserts_tbl'; 
  
  exception  
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
           
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('current_rejects',sysdate,'Error','currect_rejects.initialize','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end initialize;

------------------------------
-- call package initialization 
------------------------------
begin 
   initialize;
  
end current_rejects;
/

prompt
prompt Creating package body ENROLLMENT_PAST_WITHDRAWAL
prompt ================================================
prompt
CREATE OR REPLACE PACKAGE BODY SDM."ENROLLMENT_PAST_WITHDRAWAL" is
  ---------------------------------------------------------------------
  --
  -- Package Body:        enrollment_past_withdrawal 
  --
  -- Purpose:             populate table for Confluence 
  --                      ENROLLMENTS PAST WITHDRAWAL page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100406  T. Esposito  Original version
  --
  ---------------------------------------------------------------------
 
  v_errcode number;
  v_errmesg varchar2(200);
 
  ----------------------------------------------------------------
  -- getEnrollPassWith - populate sdm.enrollment_past_withdraw_tbl
  --                     table with data for all years.
  ----------------------------------------------------------------
  procedure getEnrollPassWith 
  is
    v_sql varchar2(2000);
    
  begin
    v_sql := 'insert into sdm.enrollment_past_withdraw_tbl
              select c.school_year
                    ,c.year_month_day
                    ,b.stu_withdrawl_dt
                    ,a.loc_county_dist_id
                    ,a.stu_sid
                    ,a.process_dt 
               from sdm.enrollment_fact a 
               join sdm.student_dim b
                 on a.stu_sid = b.stu_sid
               join sdm.date_dim c
                 on a.date_sid = c.date_sid
              where c.year_month_day > to_char(b.stu_withdrawl_dt,''YYYYMMDD'')';
  
  execute immediate v_sql;
  commit;
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('enrollment_past_withdrawal',sysdate,'Error','enrollment_past_withdrawal.enrollPassWith','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end getEnrollPassWith;
    
  ------------------------------------------
  -- initialize - truncate tables to be used
  ------------------------------------------ 
  procedure initialize
  is
  begin
    
    execute immediate 'truncate table sdm.enrollment_past_withdraw_tbl'; 
      
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
   
end enrollment_past_withdrawal;
/

prompt
prompt Creating package body ETL_GATHER_STATS
prompt ======================================
prompt
CREATE OR REPLACE PACKAGE BODY SDM."ETL_GATHER_STATS" is

  ----------------------------------------------------------------
  -- Package Body:        etl_gather_stats
  --
  -- Purpose:             gather stats on tables, alter indices on 
  --                      partitions, build global indices.  Replaces
  --                      SDM_STATS job (i.e. run_sdm_stats.bat).
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100601  T. Esposito  Original version
  ----------------------------------------------------------------

  v_errcode number;
  v_errmesg varchar2(200);
  
  --+++++++++++++++++++++
  -- Alter bitmap indices
  --+++++++++++++++++++++
  procedure alter_bmi_indexes 
  is
    type indexlist is varray(20) of varchar2(50);
    type partitionlist is varray(500) of varchar2(25);
    
    va_index indexlist;
    va_partition partitionlist;

  begin
     
    -- sdm partition indices as of 20100601
    va_index := indexlist('bmi_p_cdc_enroll_fact','bmi_p_cdc_grade_fact','bmi_p_crs_sid_grade_fact',
                 'bmi_p_date_sid_enroll_fact','bmi_p_date_sid_grade_fact','bmi_p_frl_enroll_fact',
                 'bmi_p_grd_lvl_enroll_fact','bmi_p_grd_lvl_enroll_fact','bmi_p_grd_lvl_grade_fact',
                 'bmi_p_lep_code_enroll_fact','bmi_p_loc_sid_enroll_fact','bmi_p_loc_sid_grade_fact',
                 'bmi_p_prim_ese_enroll_fact','bmi_p_schl_yr_grade_fact','bmi_p_staff_sid_grade_fact',
                 'bmi_p_stu_race_enroll_fact','bmi_p_stu_sid_enroll_fact',' bmi_p_stu_sid_grade_fact');     
    
    -- table partitions as of 20100601
    va_partition :=  partitionlist('allen_043901_current','cedar_057904_current','coppe_057922_current', 
                     'crand_129901_current','denis_091903_current','frisc_043905_current',
                     'highl_057911_current','irvin_057912_current','leona_074909_current',
                     'lovej_043919_current','maype_070915_current','mckin_043907_current',
                     'midlo_070908_current','richa_057916_current','rockw_199901_current',
                     'royse_199902_current','wylie_043914_current');                       
   
    -- loop thru partitions(inner), then indices(outer)
    for x in va_index.first..va_index.last 
    loop
      for y in va_partition.first..va_partition.last 
      loop
        execute immediate 'alter index ' || va_index(x) || ' rebuild partition '
                        || va_partition(y) || ' compute statistics nologging'; 
       
        insert into empowerstaging.etl_event_log
        (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
        values
        ('etl_gather_stats',sysdate,'info','alter_bmi_indexes','i',0,'success partition: ' || va_partition(y) || ' , index: ' || va_index(x),user,userenv('terminal')); 
       
        commit;               
      end loop;
    end loop;
    
    exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'error','alter_bmi_indexes','e',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
    
  end alter_bmi_indexes;
 
  --+++++++++++++++++++++
  -- Build global indexes 
  --+++++++++++++++++++++
  procedure build_global_indexes 
  is
    type indexlist is varray(5) of varchar2(50);
    va_index indexlist;
  
  begin
    
    -- sdm global indices as of 20100601
    va_index := indexlist('ux_abs_fact_stu_date_period2',
                          'ux_enroll_fact_stu_date2',
                          'ux_grade_ft_stu_crs_grd_prd_t2');
    
    for x in va_index.first..va_index.last 
    loop
      execute immediate 'alter index ' || va_index(x) || ' rebuild nologging'; 
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'info','build_global_indexes','i',0,'success index: ' || va_index(x),user,userenv('terminal')); 
       
      commit;  
    end loop;
    
    exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'error','build_global_indexes','e',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  
  end build_global_indexes;  
  
  --++++++++++++++++++++++
  -- Do compute statistics 
  --++++++++++++++++++++++
  procedure do_compute_stats (p_owner varchar2)
  is
    type tablelist is varray(25) of varchar2(50);
    va_table tablelist;
  
  begin
    
  -- sdm list of table to compute stats
    va_table := tablelist('absence_summary_fact','course_dim','dis_act_dim','dis_fact','dis_inc_dim','dis_loo_dim',
                 'dis_state_grp_dim','esp_dim','esp_status_fact','fund_dim','grade_fact','ledger_fact',
                 'location_dim','program_intent_dim','staff_absent_reason_dim','staff_absent_type_dim',
                 'staff_absent_fact','staff_dim','staff_qualifications_dim','staff_qualifications_fact',
                 'staff_schdl_fact','stu_schedule_fact','transaction_fact');
    
    for x in va_table.first..va_table.last 
    loop
      dbms_stats.gather_table_stats(ownname=>p_owner,tabname=>va_table(x),cascade=>true);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'info','do_compute_stats','i',0,'success table: ' || va_table(x),user,userenv('terminal')); 
       
      commit;  
    end loop;
    
    exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'error','do_compute_stats','e',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
    
  end do_compute_stats;
  
  --++++++++++++++++++++++++++++++++++
  -- Do estimate 20 percent statistics 
  --++++++++++++++++++++++++++++++++++
  procedure do_estimate_stats (p_owner varchar2)
  is
    type tablelist is varray(25) of varchar2(50);
    va_table tablelist;
  
  begin
    
    -- sdm list of table to estimate 20% stats
    va_table := tablelist('absence_fact','enrollment_fact','esp_dates_fact','function_dim',
                          'grades_gpa_fact','student_dim','student_dim_history');
    
    for x in va_table.first..va_table.last 
    loop
      dbms_stats.gather_table_stats(ownname=>p_owner,tabname=>va_table(x),estimate_percent=>20,cascade=>true);
   
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'info','do_estimate_stats','i',0,'success table: ' || va_table(x),user,userenv('terminal')); 
       
      commit;
    end loop;
    
    exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('etl_gather_stats',sysdate,'error','do_estimate_stats','e',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
    
  end do_estimate_stats;
 
end etl_gather_stats;
/

prompt
prompt Creating package body GET_FACT_COUNTS
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE BODY SDM."GET_FACT_COUNTS" as
  ---------------------------------------------------------------------
  -- Package Body:        fact_counts
  --
  -- Purpose:             populate table for Confluence fact_counts
  --                      page.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20100419  T. Esposito  Original version
  --
  ---------------------------------------------------------------------

  v_errcode number;
  v_errmesg varchar2(200);
 
  ---------------------------------------------------------
  -- calcInserts - get the total number of records inserted 
  --               for each FACT table.
  ---------------------------------------------------------
  
  procedure calcRowCounts (
          table_name   in varchar2,
          cursor_name  in out r_cursor)
  is
  
    v_sql varchar2(2000);
    
  begin
    v_sql := 'select count(*)
                    ,loc_county_dist_id
              from ' || table_name || ' e
              group by loc_county_dist_id';

    open cursor_name for v_sql;
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('get_fact_counts',sysdate,'Error','get_fact_counts.calcRowCounts','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end calcRowCounts;
    
  --
  -- Get fact tables 
  --

  procedure getFactTables (
          schema_name  in varchar2)
  is
  
    TYPE factTblType IS VARRAY(100) OF VARCHAR2(35);
    fact_tbls factTblType := factTblType();
    refc1 r_cursor; 
    v_distId   varchar2(6);
    v_recCnt    number; 
    v_today      date := sysdate; 
    v_sanity_gid number;
          
  begin
     
    -- get sanity gid
    select sdm.seq_sanity_gid.nextval 
    into v_sanity_gid
    from dual;
    
    if upper(schema_name) = 'SDM' then
      fact_tbls := factTblType('ABSENCE_FACT',
                          'DIS_FACT',
                          'ENROLLMENT_FACT',
                          'ESP_DATES_FACT',
                          'ESP_STATUS_FACT',
                          'GRADE_FACT',
                          'GRADES_GPA_FACT',
                          'LEDGER_FACT',
                          'STAFF_ABSENT_FACT',
                          'STAFF_QUALIFICATIONS_FACT',
                          'STAFF_SCHDL_FACT',
                          'STU_SCHEDULE_FACT',
                          'TRANSACTION_FACT');
    elsif upper(schema_name) = 'GAMBHIRJ' then
       fact_tbls := factTblType('ABSENCE_FEX',
                          'DIS_FEX',
                          'ENROLLMENT_FEX',
                          'ESP_DATES_FEX',
                          'ESP_STATUS_FEX',
                          'GRADES_FEX',
                          'GRADES_GPA_FEX',
                          'LEDGER_FACT',
                          'STAFF_ABSENT_FEX',
                          'STAFF_QUALIFICATIONS_FEX',
                          'STAFF_SCHDL_FEX',
                          'STU_SCHEDULE_FEX',
                          'TRANSACTION_FEX');
    elsif upper(schema_name) = 'DW' then
       fact_tbls := factTblType('ABSENCE_FACT_FEX1',
                          'DIS_FACT_FEX1',
                          'ENROLLMENT_FACT_FEX1',
                          'ESP_DATES_FACT_FEX1',
                          'ESP_STATUS_FACT_FEX1',
                          'GRADES_FACT_FEX1',
                          'GRADES_GPA_FACT_FEX1',
                          'LEDGER_FACT_FEX1',
                          'STAFF_ABSENT_FACT_FEX1',
                          'STAFF_QUALIFICATIONS_FACT_FEX1',
                          'STAFF_SCHDL_FACT_FEX1',
                          'STU_SCHEDULE_FACT_FEX1',
                          'TRANSACTION_FACT_FEX1'); 
    end if;   
                   
    -- get table row counts
    for indx in fact_tbls.first .. fact_tbls.last 
    loop
      calcRowCounts(fact_tbls(indx), refc1);
      loop
        fetch refc1 into v_recCnt, v_distId;
        exit when refc1%notfound;
        insert into sdm.fact_counts_tbl values(v_sanity_gid 
                                              ,v_distId
                                              ,upper(schema_name)
                                              ,fact_tbls(indx)
                                              ,v_recCnt  
                                              ,v_today);
      end loop;  -- end of simple loop to insert table row counts
      commit;
    end loop;  -- end of 'for' loop for processing all table row counts
         
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
           
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('get_fact_counts',sysdate,'Error','get_fact_counts.getRejTables','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end getFactTables;
    
end get_fact_counts;
/

prompt
prompt Creating package body PKG_EMPOWER_POST_PROCESSING
prompt =================================================
prompt
create or replace package body sdm.pkg_empower_post_processing is

  --**************************************************************************
  -- 
  -- Procedure:  prc_encrypt_student_ssn -- changes ssn on student_dim to some pattern.     
  --
  -- Parameters: p_pattern    -- change ssn to this 9 byte character string
  --             p_array_size -- bulk collect limit array size
  --  
  -- Note:       processing time -- 1:45 mins (1/3/2011)
  --             
  -- Revision History
  -- Date             Author            Remarks
  -- 1/3/2011         T. Esposito       Original version
  --
  --**************************************************************************
  
  procedure prc_encrypt_student_ssn(p_pattern student_dim.stu_id_2%type
                                   ,p_array_size pls_integer default 100)
  is
  
  type t_array is table of student_dim.stu_sid%type;
  c_student t_array;

  cursor cur_sel_stu is
  select stu_sid
  from student_dim;
  
  v_errcode    zeus.etl_event_log.error_code%type;
  v_errmesg    zeus.etl_event_log.error_message%type;
  v_start_time zeus.etl_event_log.start_time%type;
  v_end_time   zeus.etl_event_log.end_time%type;
  v_row_cnt    zeus.etl_event_log.rows_affected_count%type;
  
  begin
    v_start_time := systimestamp;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'Start'
                                         ,p_source_name => 'SDM - encrypt_student_ssn'
                                         ,p_status => 'Running'
                                         ,p_error_code => null
                                         ,p_error_message => null
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started encrypt_student_ssn procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => null
                                         ,p_elapsed_time => null);
   
    open cur_sel_stu;
    
    -- update student_dim stu_id_2 (ssn)
    loop
      fetch cur_sel_stu bulk collect into c_student limit p_array_size;

      forall i in c_student.first..c_student.last
      update student_dim 
      set stu_id_2 = p_pattern
      where student_dim.stu_sid = c_student(i)
      and stu_id_2 != p_pattern;
  
      commit;
      v_row_cnt := v_row_cnt + cur_sel_stu%rowcount;
      exit when cur_sel_stu%notfound;
      c_student.delete();
    end loop;
    close cur_sel_stu;
    
    v_end_time := systimestamp; 
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'End'
                                         ,p_source_name => 'SDM - encrypt_student_ssn'
                                         ,p_status => 'Success'
                                         ,p_error_code => null
                                         ,p_error_message => null
                                         ,p_rows_affected_count => v_row_cnt
                                         ,p_comments => 'Completed encrypt_student_ssn procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time
                                                                                                  ,v_end_time));
                                                                                                  
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'SDM - encrypt_student_ssn'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_row_cnt
                                         ,p_comments => 'Error in encrypt_student_ssn procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time
                                                                                                  ,v_end_time));
      rollback;
      raise; 
  end prc_encrypt_student_ssn;
  
end pkg_empower_post_processing;
/

prompt
prompt Creating package body PKG_UPDATE_DATE_DIM_NEW_YEAR
prompt ==================================================
prompt
CREATE OR REPLACE PACKAGE BODY SDM."PKG_UPDATE_DATE_DIM_NEW_YEAR" is
/*------------------------------------------------------------------------------
Package Body:        pkg_update_date_dim_new_year 
Purpose:             Updates the new school years' district specific dates.
 
Revision History
Date      Author       Remarks
20100623  P.Carlson    Original version
--------------------------------------------------------------------------------*/
 
  v_errcode number;
  v_errmesg varchar2(200);

----------------------- Get the school_week starting from 8/1.

function fn_school_week (v_date in date) return number as

v_school_start_date date;
v_school_week varchar2(2);
v_calc_date date;

begin

  select to_date( '8/1/'||  case when to_number(to_char(v_date,'mm')) < 8 
          then to_number(to_char(v_date,'yyyy')) -1
          else to_number(to_char(v_date,'yyyy')) end,'mm/dd/yyyy') into v_school_start_date from dual;
          
  select next_day(v_school_start_date,'sunday') - 7 into v_calc_date from dual;
          
  select ceil((v_date - v_calc_date)/7)  into v_school_week from dual;
       
  return v_school_week;
end fn_school_week;

---------------------- Update the district specific dates for the new year
procedure prc_update_date_dim_new_year (p_school_year in varchar2, p_snapshot date) is
  
v_error_object varchar2(250);

begin
--update school_day_indicator based on etl_district_dates table
v_error_object := 'School Day Indicator 1';
update date_dim dd
set school_day_indicator = (select ed.district_date_type from empower.etl_district_dates ed
                            where ed.district_sid = dd.district_sid
                            and ed.date_id = dd.date_id
                            and ed.district_date_type in ('Professional','Non-Academic'))
where dd.school_year = p_school_year;


--update school_day_indicator for weekend days to 'Non-Academic' except when not null
v_error_object := 'School Day Indicator 2';
update date_dim
set school_day_indicator = 'Non-Academic'
where to_char(date_id,'D') in ('1','7')
and school_day_indicator is null
and school_year = p_school_year;

--update first_day_academic_6_weeks
v_error_object := 'First Day Academic 6 Weeks';
update date_dim
set first_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('Begin First Six Weeks', 'Begin Second Six Weeks','Begin Third Six Weeks','Begin Fourth Six Weeks','Begin Fifth Six Weeks','Begin Sixth Six Weeks'))
and school_year = p_school_year;

--update last_day_academic_6_weeks
v_error_object := 'Last Day Academic 6 Weeks';
update date_dim
set last_day_academic_6_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('End First Six Weeks', 'End Second Six Weeks','End Third Six Weeks','End Fourth Six Weeks','End Fifth Six Weeks','End Sixth Six Weeks'))
and school_year = p_school_year;

--update first_day_academic_9_weeks
v_error_object := 'First Day Academic 9 Weeks';
update date_dim
set first_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('Begin First Nine Weeks', 'Begin Second Nine Weeks','Begin Third Nine Weeks','Begin Fourth Nine Weeks'))
and school_year = p_school_year;

--update last_day_academic_9_weeks
v_error_object := 'Last Day Academic 9 Weeks';
update date_dim
set last_day_academic_9_weeks = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('End First Nine Weeks', 'End Second Nine Weeks','End Third Nine Weeks','End Fourth Nine Weeks'))
and school_year = p_school_year;

--update first_day_semester
v_error_object := 'First Day Semester';
update date_dim
set first_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('Begin First Semester', 'Begin Second Semester'))
and school_year = p_school_year;

--update last_day_semester
v_error_object := 'Last Day Semester';
update date_dim
set last_day_semester = 'Yes'
where date_id in (select date_id from etl_district_dates
                 where etl_district_dates.district_sid = date_dim.district_sid
                 and etl_district_dates.date_id = date_dim.date_id
                 and etl_district_dates.district_date_type in ('End First Semester', 'End Second Semester'))
and school_year = p_school_year;

--update academic_6_weeks 1
v_error_object := 'First Academic 6 Weeks';
update date_dim
set academic_6_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 2
v_error_object := 'Second Academic 6 Weeks';
update date_dim
set academic_6_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 3
v_error_object := 'Third Academic 6 Weeks';
update date_dim
set academic_6_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 4
v_error_object := 'Fourth Academic 6 Weeks';
update date_dim
set academic_6_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 5
v_error_object := 'Fifth Academic 6 Weeks';
update date_dim
set academic_6_weeks = 5
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fifth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_6_weeks 6
v_error_object := 'Sixth Academic 6 Weeks';
update date_dim
set academic_6_weeks = 6
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Sixth Six Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 1
v_error_object := 'First Academic 9 Weeks';
update date_dim
set academic_9_weeks = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 2
v_error_object := 'Second Academic 9 Weeks';
update date_dim
set academic_9_weeks = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 3
v_error_object := 'Third Academic 9 Weeks';
update date_dim
set academic_9_weeks = 3
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Third Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update academic_9_weeks 4
v_error_object := 'Fourth Academic 9 Weeks';
update date_dim
set academic_9_weeks = 4
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Fourth Nine Weeks'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update semester 1
v_error_object := 'First Semester';
update date_dim
set semester = 1
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin First Semester'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End First Semester'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update semester 2
v_error_object := 'Second Semester';
update date_dim
set semester = 2
where date_id between (select date_id from etl_district_dates where district_date_type = 'Begin Second Semester'
                        and etl_district_dates.district_sid = date_dim.district_sid)
              and (select date_id from etl_district_dates where district_date_type = 'End Second Semester'
                        and etl_district_dates.district_sid = date_dim.district_sid)
and (school_day_indicator <> 'Non-Academic' or school_day_indicator is null)
and school_year = p_school_year;

--update discipline_reporting_period 1
v_error_object := 'Discipline Reporting Period 1';
update date_dim d1
set discipline_reporting_period = 1
where date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year);
    
--update discipline_reporting_period 2
v_error_object := 'Discipline Reporting Period 2';
update date_dim d1
set discipline_reporting_period = 2
where date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year)
and (select date_id
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = p_school_year);

--update discipline_reporting_period 3
v_error_object := 'Discipline Reporting Period 3';
update date_dim d1
set discipline_reporting_period = 3
where date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 2
    and school_year = p_school_year)
and (select date_id
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = p_school_year);
    
--update discipline_reporting_period 4
v_error_object := 'Discipline Reporting Period 4';
update date_dim d1
set discipline_reporting_period = 4
where date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 3
    and school_year = p_school_year)
and (select date_id
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = p_school_year);

--update discipline_reporting_period 5
v_error_object := 'Discipline Reporting Period 5';
update date_dim d1
set discipline_reporting_period = 5
where date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 4
    and school_year = p_school_year)
and (select date_id
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = p_school_year);
    
--update discipline_reporting_period 6
v_error_object := 'Discipline Reporting Period 6';
update date_dim d1
set discipline_reporting_period = 6
where date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 5
    and school_year = p_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12);

--update school_day_indicator to 'Non-Academic' prior to school start and after school ends
v_error_object := 'School Day Indicator Summer';
update date_dim d1
set school_day_indicator = 'Non-Academic'
where (date_id between to_date('08/01/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY')
and (select date_id - 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.first_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 1
    and school_year = p_school_year))
    
or (date_id between (select date_id + 1
    from date_dim d2
    where d2.district_sid = d1.district_sid
    and d2.last_day_academic_6_weeks = 'Yes'
    and d2.academic_6_weeks = 6
    and school_year = p_school_year)
    and add_months(to_date('07/31/'||to_char(sysdate,'yyyy'),'MM/DD/YYYY'),12));
    
--update the null school_day_indicators to 'Instructional'
v_error_object := 'School Day Indicator Null';
update date_dim
set school_day_indicator = 'Instructional'
where school_day_indicator is null
and school_year = p_school_year;

--update snapshot_date_indicator
v_error_object := 'Snapshot Date';
update date_dim
set snapshot_date_indicator = 'No'
where school_year = p_school_year;

update date_dim
set snapshot_date_indicator = 'Yes'
where date_id = p_snapshot;

--update academic_week
v_error_object := 'Academic Week';
update date_dim d1
set academic_week = 
  (with academic_week_tbl as
   (select date_sid, lpad(dense_rank() over (partition by district_sid order by fn_school_week(date_id)),2,'0') academic_week
    from date_dim
    where school_year = p_school_year
    and school_day_indicator = 'Instructional')
    
   select academic_week from academic_week_tbl
   where academic_week_tbl.date_sid = d1.date_sid)
where school_year = p_school_year
and school_day_indicator = 'Instructional';

update date_dim
set academic_week =
(with tmp_academic_week as
    (select distinct district_sid, school_week, academic_week
    from date_dim
    where school_day_indicator = 'Instructional'
    and school_year = p_school_year),
    
 tmp_non_istr as
    (select tmp_academic_week.district_sid, date_dim.date_id ,tmp_academic_week.academic_week
    from date_dim
    join tmp_academic_week
    on date_dim.school_week = tmp_academic_week.school_week
    and date_dim.district_sid = tmp_academic_week.district_sid
    where to_char(date_id,'d') not in (1,7)
    and school_year = p_school_year
    and date_dim.academic_week = '00')
    
    select academic_week
    from tmp_non_istr
    where date_dim.date_id = tmp_non_istr.date_id
    and date_dim.district_sid = tmp_non_istr.district_sid)
    
where school_year = p_school_year
and academic_week = '00';

update date_dim d1
set academic_week = '00'
where academic_week is null
and school_year = p_school_year;

-- update academic_day
v_error_object := 'Academic Day';
update date_dim d1
  set academic_day = 
    (with instructional_day as
       (select date_sid, date_id, rank() over (partition by district_sid order by date_id) as academic_day
               from date_dim
               where school_day_indicator = 'Instructional'
               and school_year = p_school_year
               order by date_id)
               
       select instructional_day.academic_day
               from instructional_day
               where instructional_day.date_sid = d1.date_sid)
where school_year = p_school_year
and school_day_indicator = 'Instructional';

-- update weekly_enrollment_date_flag
v_error_object := 'Weekly Enrollment Flag';
update date_dim
set weekly_enrollment_date_flag = 'No'
where school_year = p_school_year;

update date_dim d1
set weekly_enrollment_date_flag = 'Yes'
where date_id in
(with non_thurs_load as
 (select district_sid, max(date_id) date_id
 from date_dim d1
 where academic_week in (select academic_week
                         from date_dim d2
                         where to_char(date_id,'d') = 5
                         and school_day_indicator != 'Instructional'
                         and school_year = p_school_year
                         and academic_week <> '00'
                         and d1.district_sid = d2.district_sid)
 and school_day_indicator = 'Instructional'
 and school_year = p_school_year
 group by district_sid, academic_week)
 
 select date_id from non_thurs_load n1 where n1.district_sid = d1.district_sid)
 
and school_year = p_school_year;

update date_dim
set weekly_enrollment_date_flag = 'Yes'
where to_char(date_id,'d') = 5
and school_day_indicator = 'Instructional'
and school_year = p_school_year;



exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      (v_error_object,sysdate,'Error','pkg_update_date_dim_new_year.prc_update_date_dim_new_year','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
  end prc_update_date_dim_new_year;
--------------------------------Insert new school year rows into the 
/*begin
  insert into sdm.etl_load_validation
  (load_validation_type, district_sid, validation_date_sid, load_date_sid, data_valid_flag, most_recent_flag)
  values
  (select 'ENROLLMENT', DISTRICT_SID, */
  
end pkg_update_date_dim_new_year;
/

prompt
prompt Creating trigger STUDENT_DIM_TRG
prompt ================================
prompt
create or replace trigger sdm."STUDENT_DIM_TRG"
  after update or delete on sdm.student_dim  
  for each row
declare

  pragma autonomous_transaction;
  v_errcode number;
  v_errmesg varchar2(200);
  v_dml_op  varchar2(1);

begin

  if updating then
    v_dml_op := 'U';
  elsif deleting then
    v_dml_op := 'D';
  end if;
 
  insert into sdm.student_dim_history (
     stu_sid
    ,loc_county_dist_id
    ,loc_district
    ,stu_key
    ,stu_id
    ,stu_id_2
    ,stu_full_name
    ,stu_last_name
    ,stu_first_name
    ,stu_middle_name
    ,stu_birth_dt
    ,stu_addr_1
    ,stu_addr_2
    ,stu_city
    ,stu_state
    ,stu_zip
    ,stu_study_area_cd
    ,stu_phone_1
    ,stu_phone_2
    ,stu_phone_3
    ,stu_gender
    ,stu_race
    ,stu_ethnicity
    ,stu_free_redu_lnch
    ,stu_last_schl
    ,stu_cur_schl
    ,stu_next_schl
    ,stu_last_grd_lvl
    ,stu_cur_grd_lvl
    ,stu_next_grd_lvl
    ,stu_last_hmroom
    ,stu_cur_hmroom
    ,stu_next_hmroom
    ,stu_cumulative_gpa
    ,stu_cumulative_gpa_2
    ,stu_cumulative_gpa_3
    ,stu_cumulative_gpa_4
    ,stu_honors_gpa
    ,stu_class_rank
    ,stu_class_rank_2
    ,stu_class_rank_3
    ,stu_class_rank_4 
    ,stu_entry_dt
    ,stu_withdrawl_dt
    ,stu_withdrawl_cd
    ,stu_nbr_of_rtntns
    ,stu_present_cnt
    ,stu_tardy_cnt
    ,stu_abs_unv_cnt
    ,stu_abs_exc_cnt
    ,stu_abs_unexc_cnt
    ,stu_dis_event_cnt
    ,stu_dis_inc_cnt
    ,stu_dis_act_cnt
    ,stu_oos_susp_dys
    ,stu_oos_susp_cnt
    ,stu_is_susp_dys
    ,stu_is_susp_cnt
    ,stu_det_dys
    ,stu_det_cnt
    ,stu_bus_susp_dys
    ,stu_bus_susp_cnt
    ,stu_altplc_sus_dys
    ,stu_plcpen_exp_dys
    ,stu_plc_il_exp_dys
    ,stu_lst_dis_ev_dt
    ,stu_lst_dis_act_dt
    ,stu_lst_oos_dt
    ,stu_lst_is_dt
    ,stu_lst_det_dt
    ,stu_credits_atmptd
    ,stu_credits_ernd
    ,stu_grad_dt
    ,stu_grad_type
    ,stu_flag_504
    ,stu_lep_code
    ,stu_lep_entry_dt
    ,stu_lep_exit_dt
    ,stu_pri_lang
    ,stu_sec_lang
    ,stu_parent_lang
    ,stu_beg_9_grd_yr
    ,stu_aip_participat
    ,stu_birth_cntry
    ,stu_dt_entrd_cntry
    ,stu_sup_acad_imp
    ,stu_last_team
    ,stu_cur_team
    ,stu_next_team
    ,stu_primary_ese_cd
    ,stu_erly_clg_entry
    ,stu_inrly_clg_ntry
    ,stu_single_parent
    ,stu_homeless
    ,stu_proret_lst_yr
    ,stu_in_intnsv_rdng
    ,stu_in_intnsv_math
    ,stu_in_intnsv_la
    ,stu_is_veteran
    ,stu_is_handicapped
    ,stu_is_teen_parent
    ,stu_smrschl_status
    ,stu_is_at_risk
    ,stu_is_migrant
    ,stu_is_tag
    ,stu_is_immigrant
    ,stu_ale_status
    ,stu_pk_status
    ,stu_live_with_cd
    ,stu_title1_status
    ,stu_506_status
    ,stu_mile_dist
    ,stu_trans_zone
    ,stu_parent_ed_lvl
    ,stu_allocated_schl
    ,stu_transfer_reason
    ,schl_yr
    ,data_date
    ,stu_inoculations
    ,stu_uil
    ,stu_dose_in_series
    ,stu_immunization_dt
    ,stu_dtp
    ,create_dt
    ,lst_updt_dt
    ,eff_start_dt
    ,eff_end_dt
    ,cur_indicator
    ,stu_prior_year_snapshot_flag
    ,stu_current_year_snapshot_flag
    ,stu_currently_enrolled_flag
    ,dml_op    
    ,op_user
    ,op_terminal
    ,change_ts )
  values (
        :old.stu_sid
        ,:old.loc_county_dist_id
        ,:old.loc_district
        ,:old.stu_key
        ,:old.stu_id
        ,'*********'
        ,:old.stu_full_name
        ,:old.stu_last_name
        ,:old.stu_first_name
        ,:old.stu_middle_name
        ,:old.stu_birth_dt
        ,:old.stu_addr_1
        ,:old.stu_addr_2
        ,:old.stu_city
        ,:old.stu_state
        ,:old.stu_zip
        ,:old.stu_study_area_cd
        ,:old.stu_phone_1
        ,:old.stu_phone_2
        ,:old.stu_phone_3
        ,:old.stu_gender
        ,:old.stu_race
        ,:old.stu_ethnicity
        ,:old.stu_free_redu_lnch
        ,:old.stu_last_schl
        ,:old.stu_cur_schl
        ,:old.stu_next_schl
        ,:old.stu_last_grd_lvl
        ,:old.stu_cur_grd_lvl
        ,:old.stu_next_grd_lvl
        ,:old.stu_last_hmroom
        ,:old.stu_cur_hmroom
        ,:old.stu_next_hmroom
        ,:old.stu_cumulative_gpa
        ,:old.stu_cumulative_gpa_2
        ,:old.stu_cumulative_gpa_3
        ,:old.stu_cumulative_gpa_4
        ,:old.stu_honors_gpa
        ,:old.stu_class_rank
        ,:old.stu_class_rank_2
        ,:old.stu_class_rank_3
        ,:old.stu_class_rank_4 
        ,:old.stu_entry_dt
        ,:old.stu_withdrawl_dt
        ,:old.stu_withdrawl_cd
        ,:old.stu_nbr_of_rtntns
        ,:old.stu_present_cnt
        ,:old.stu_tardy_cnt
        ,:old.stu_abs_unv_cnt
        ,:old.stu_abs_exc_cnt
        ,:old.stu_abs_unexc_cnt
        ,:old.stu_dis_event_cnt
        ,:old.stu_dis_inc_cnt
        ,:old.stu_dis_act_cnt
        ,:old.stu_oos_susp_dys
        ,:old.stu_oos_susp_cnt
        ,:old.stu_is_susp_dys
        ,:old.stu_is_susp_cnt
        ,:old.stu_det_dys
        ,:old.stu_det_cnt
        ,:old.stu_bus_susp_dys
        ,:old.stu_bus_susp_cnt
        ,:old.stu_altplc_sus_dys
        ,:old.stu_plcpen_exp_dys
        ,:old.stu_plc_il_exp_dys
        ,:old.stu_lst_dis_ev_dt
        ,:old.stu_lst_dis_act_dt
        ,:old.stu_lst_oos_dt
        ,:old.stu_lst_is_dt
        ,:old.stu_lst_det_dt
        ,:old.stu_credits_atmptd
        ,:old.stu_credits_ernd
        ,:old.stu_grad_dt
        ,:old.stu_grad_type
        ,:old.stu_flag_504
        ,:old.stu_lep_code
        ,:old.stu_lep_entry_dt
        ,:old.stu_lep_exit_dt
        ,:old.stu_pri_lang
        ,:old.stu_sec_lang
        ,:old.stu_parent_lang
        ,:old.stu_beg_9_grd_yr
        ,:old.stu_aip_participat
        ,:old.stu_birth_cntry
        ,:old.stu_dt_entrd_cntry
        ,:old.stu_sup_acad_imp
        ,:old.stu_last_team
        ,:old.stu_cur_team
        ,:old.stu_next_team
        ,:old.stu_primary_ese_cd
        ,:old.stu_erly_clg_entry
        ,:old.stu_inrly_clg_ntry
        ,:old.stu_single_parent
        ,:old.stu_homeless
        ,:old.stu_proret_lst_yr
        ,:old.stu_in_intnsv_rdng
        ,:old.stu_in_intnsv_math
        ,:old.stu_in_intnsv_la
        ,:old.stu_is_veteran
        ,:old.stu_is_handicapped
        ,:old.stu_is_teen_parent
        ,:old.stu_smrschl_status
        ,:old.stu_is_at_risk
        ,:old.stu_is_migrant
        ,:old.stu_is_tag
        ,:old.stu_is_immigrant
        ,:old.stu_ale_status
        ,:old.stu_pk_status
        ,:old.stu_live_with_cd
        ,:old.stu_title1_status
        ,:old.stu_506_status
        ,:old.stu_mile_dist
        ,:old.stu_trans_zone
        ,:old.stu_parent_ed_lvl
        ,:old.stu_allocated_schl
        ,:old.stu_transfer_reason
        ,:old.schl_yr
        ,:old.data_date
        ,:old.stu_inoculations
        ,:old.stu_uil
        ,:old.stu_dose_in_series
        ,:old.stu_immunization_dt
        ,:old.stu_dtp
        ,:old.create_dt
        ,:old.lst_updt_dt
        ,:old.eff_start_dt
        ,:old.eff_end_dt
        ,:old.cur_indicator
        ,:old.stu_prior_year_snapshot_flag
        ,:old.stu_current_year_snapshot_flag
        ,:old.stu_currently_enrolled_flag
        ,v_dml_op    
        ,user
        ,userenv('terminal')
        ,sysdate );
  
  commit;
  
  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := SUBSTR(sqlerrm,1,200);
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      ('student_dim_trg',sysdate,'Error','student_dim_trg','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      
end student_dim_trg;
/


spool off
