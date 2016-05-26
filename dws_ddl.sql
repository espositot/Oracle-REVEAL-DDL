-----------------------------------------------------------
-- Export file for user DWS@DATAWH                       --
-- Created by espositot on 5/26/2016, 15:35:56 15:35:56  --
-----------------------------------------------------------

set define off
spool dws_ddl.log

prompt
prompt Creating table ATTENDANCE_RISK_FACTOR_FACT
prompt ==========================================
prompt
create table DWS.ATTENDANCE_RISK_FACTOR_FACT
(
  campus_sid               NUMBER not null,
  student_sid              NUMBER not null,
  date_sid                 NUMBER not null,
  period_absence_count     NUMBER,
  ytd_period_absence_count NUMBER,
  ytd_days_enrolled        NUMBER,
  period_absence_percent   NUMBER,
  last_update              TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table DWS.ATTENDANCE_RISK_FACTOR_FACT
  is 'Captures the results of the Risk Factor Calculation Engine for the attendance risk factor.';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.period_absence_count
  is 'The number periods the student was absent on this day.
Example: 7';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.ytd_period_absence_count
  is 'The total number of periods absent from the start of the school year unitl this date.
Example: 54';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.ytd_days_enrolled
  is 'The total number days the student has been enrolled since the start of the school year unitl this date.
Example: 132';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.period_absence_percent
  is 'The percent of instructional periods that the student has missed.
Example: .1323 (13.22%)';
comment on column DWS.ATTENDANCE_RISK_FACTOR_FACT.last_update
  is 'The datetime that the row was insert/updated';
alter table DWS.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table DWS.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table RISK_FACTOR
prompt ==========================
prompt
create table DWS.RISK_FACTOR
(
  risk_factor_sid         NUMBER not null,
  risk_factor_name        VARCHAR2(50),
  risk_factor_short_name  VARCHAR2(20),
  risk_factor_description VARCHAR2(200),
  risk_factor_duration    VARCHAR2(25),
  risk_factor_type        VARCHAR2(10),
  mandatory_flag          VARCHAR2(3),
  risk_factor_order       NUMBER(2)
)
tablespace DW_DEFAULT01
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
comment on column DWS.RISK_FACTOR.risk_factor_type
  is 'Indicates that the Factor is either a primary or secondary.
Values: Primary,
Secondary';
comment on column DWS.RISK_FACTOR.mandatory_flag
  is 'Indicates if the campus is required to select this risk factor or if it is optional.
Values: Yes/No';
comment on column DWS.RISK_FACTOR.risk_factor_order
  is 'Defines the sort order for the presentation of the risk factors.';
alter table DWS.RISK_FACTOR
  add constraint PK_RISK_FACTOR primary key (RISK_FACTOR_SID)
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
prompt Creating table CAMPUS_FACTOR_SELECTION
prompt ======================================
prompt
create table DWS.CAMPUS_FACTOR_SELECTION
(
  campus_sid      NUMBER not null,
  risk_factor_sid NUMBER not null,
  last_update     TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
create bitmap index DWS.BMI_CAMPUS_FACT_SEL_RISK_SIDFK on DWS.CAMPUS_FACTOR_SELECTION (RISK_FACTOR_SID)
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
alter table DWS.CAMPUS_FACTOR_SELECTION
  add constraint PK_CAMPUS_FACTOR_SELECTION primary key (CAMPUS_SID, RISK_FACTOR_SID)
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
alter table DWS.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_CAMPUS_D foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_RISK_FAC foreign key (RISK_FACTOR_SID)
  references DWS.RISK_FACTOR (RISK_FACTOR_SID);

prompt
prompt Creating table CAMPUS_RISK_FACTOR_DIM
prompt =====================================
prompt
create table DWS.CAMPUS_RISK_FACTOR_DIM
(
  campus_risk_factor_sid  NUMBER not null,
  district_id             VARCHAR2(20),
  campus_id               VARCHAR2(20),
  risk_factor_name        VARCHAR2(50),
  risk_factor_description VARCHAR2(200),
  risk_factor_type        VARCHAR2(10),
  risk_factor_duration    VARCHAR2(25),
  last_update             TIMESTAMP(6),
  risk_factor_order       NUMBER(2)
)
tablespace DW_DEFAULT01
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
alter table DWS.CAMPUS_RISK_FACTOR_DIM
  add constraint PK_CAMPUS_RISK_FACTOR_DIM primary key (CAMPUS_RISK_FACTOR_SID)
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
alter table DWS.CAMPUS_RISK_FACTOR_DIM
  add constraint AK_CAMPUS_RISK_FACTOR_BUS_KEY unique (DISTRICT_ID, CAMPUS_ID, RISK_FACTOR_NAME)
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
prompt Creating table DWS_GLOBAL_DEFAULT
prompt =================================
prompt
create table DWS.DWS_GLOBAL_DEFAULT
(
  campus_periods_per_day         NUMBER,
  campus_attendance_threshold    NUMBER,
  campus_passing_grade_threshold NUMBER,
  campus_default_grading_cycle   VARCHAR2(15)
)
tablespace DW_DEFAULT01
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
comment on table DWS.DWS_GLOBAL_DEFAULT
  is 'Contains default vaules that are applied at various times during system operation.';
comment on column DWS.DWS_GLOBAL_DEFAULT.campus_periods_per_day
  is 'Defines the default number of periods per day to be applied to new campuses.
Default Value = 7';
comment on column DWS.DWS_GLOBAL_DEFAULT.campus_attendance_threshold
  is 'Defines the default attendance threshold to be applied to new campuses.
Default Value = .10 (10%)';
comment on column DWS.DWS_GLOBAL_DEFAULT.campus_passing_grade_threshold
  is 'Defines the default passing grade for students at a campus to be applied to new campuses.
Default Value: 70';
comment on column DWS.DWS_GLOBAL_DEFAULT.campus_default_grading_cycle
  is 'Defines the default grading cycle at a campus to be applied to new campuses.
Default Value: 6-Weeks';

prompt
prompt Creating table EXECUTION_LOG
prompt ============================
prompt
create table DWS.EXECUTION_LOG
(
  execution_start_time TIMESTAMP(6) not null,
  campus_sid           NUMBER not null,
  process_name         VARCHAR2(20) not null,
  process_type         VARCHAR2(15),
  execution_end_time   TIMESTAMP(6),
  execution_result     VARCHAR2(15)
)
tablespace DW_DEFAULT01
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
comment on table DWS.EXECUTION_LOG
  is 'Tracks information about each run of the risk factor calculation engine or the load process.';
comment on column DWS.EXECUTION_LOG.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column DWS.EXECUTION_LOG.process_name
  is 'Name of the process being run
Example: Attendance
               CoreCourseFailure
               ';
comment on column DWS.EXECUTION_LOG.process_type
  is 'Type of process being run
Example: RCE
               District Load
               Campus Load';
comment on column DWS.EXECUTION_LOG.execution_end_time
  is 'The datetime that the engine stopped processing this risk factor';
comment on column DWS.EXECUTION_LOG.execution_result
  is 'The outcome of the execution.
Values: Successful
             Failed';
alter table DWS.EXECUTION_LOG
  add constraint PK_EXECUTION_LOG primary key (EXECUTION_START_TIME, CAMPUS_SID)
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
prompt Creating table EXECUTION_PARAMETER
prompt ==================================
prompt
create table DWS.EXECUTION_PARAMETER
(
  execution_start_time TIMESTAMP(6) not null,
  campus_sid           NUMBER not null,
  parameter_name       VARCHAR2(30) not null,
  parameter_value      VARCHAR2(20)
)
tablespace DW_DEFAULT01
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
comment on table DWS.EXECUTION_PARAMETER
  is 'Contains the parameters used in the execution of a system process.';
comment on column DWS.EXECUTION_PARAMETER.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column DWS.EXECUTION_PARAMETER.parameter_name
  is 'The name of the parameter used in the risk factor calculation.
Example: Periods Per Day
                Attendance Threshold';
comment on column DWS.EXECUTION_PARAMETER.parameter_value
  is 'The Value of the first parameter used in the risk factor calculation.
Example: 7';
alter table DWS.EXECUTION_PARAMETER
  add constraint PK_EXECUTION_PARAMETER primary key (EXECUTION_START_TIME, CAMPUS_SID, PARAMETER_NAME)
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
alter table DWS.EXECUTION_PARAMETER
  add constraint FK_EXECUTIO_REFERENCE_EXECUTIO foreign key (EXECUTION_START_TIME, CAMPUS_SID)
  references DWS.EXECUTION_LOG (EXECUTION_START_TIME, CAMPUS_SID);

prompt
prompt Creating table MERGED_STUDENT_RISK_FACTOR
prompt =========================================
prompt
create table DWS.MERGED_STUDENT_RISK_FACTOR
(
  student_sid       NUMBER not null,
  risk_factor_sid   NUMBER not null,
  flag_date_sid     NUMBER not null,
  end_date_sid      NUMBER not null,
  risk_factor_count NUMBER(1)
)
tablespace DW_DEFAULT01
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
comment on table DWS.MERGED_STUDENT_RISK_FACTOR
  is 'Combines Student_Risk_Factor_Facts for a student which might span multiple campuses into a single view of the students risk.';
comment on column DWS.MERGED_STUDENT_RISK_FACTOR.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.MERGED_STUDENT_RISK_FACTOR.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.MERGED_STUDENT_RISK_FACTOR.risk_factor_count
  is 'Measure used by report tools to count number of studnets with risk factors.
Value 1';
alter table DWS.MERGED_STUDENT_RISK_FACTOR
  add constraint PK_MERGED_STUDENT_RISK_FACTOR primary key (STUDENT_SID, RISK_FACTOR_SID, FLAG_DATE_SID)
  using index 
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
alter table DWS.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_RISK_FAC foreign key (RISK_FACTOR_SID)
  references DWS.RISK_FACTOR (RISK_FACTOR_SID);
alter table DWS.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table DWS.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_END_DATE_DIM foreign key (END_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table DWS.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);

prompt
prompt Creating table NINTH_GRD_COHORT
prompt ===============================
prompt
create table DWS.NINTH_GRD_COHORT
(
  district_id              VARCHAR2(6) not null,
  campus_key               VARCHAR2(22),
  student_key              VARCHAR2(26),
  date_entered_ninth_grade DATE,
  ninth_grade_cohort_year  VARCHAR2(4)
)
tablespace DW_DEFAULT01
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
prompt Creating table RF_DISPLAY_COLUMNS
prompt =================================
prompt
create table DWS.RF_DISPLAY_COLUMNS
(
  campus_sid               NUMBER not null,
  attendance               VARCHAR2(1),
  semester_attendance      VARCHAR2(1),
  core_crs_failure         VARCHAR2(1),
  non_core_crs_failure     VARCHAR2(1),
  sem_core_crs_failure     VARCHAR2(1),
  sem_non_core_crs_failure VARCHAR2(1),
  gpa                      VARCHAR2(1),
  deficient_credits        VARCHAR2(1),
  discipline               VARCHAR2(1),
  grade_6_8_retention      VARCHAR2(1),
  cohort                   VARCHAR2(1),
  other                    CHAR(1)
)
tablespace DW_DEFAULT01
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
alter table DWS.RF_DISPLAY_COLUMNS
  add constraint CAMPUS_SID_PK primary key (CAMPUS_SID)
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
prompt Creating table STUDENT_PERIOD_OVERRIDE
prompt ======================================
prompt
create table DWS.STUDENT_PERIOD_OVERRIDE
(
  campus_sid      NUMBER not null,
  student_sid     NUMBER not null,
  periods_per_day NUMBER,
  effective_date  DATE
)
tablespace DW_DEFAULT01
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
comment on table DWS.STUDENT_PERIOD_OVERRIDE
  is 'Overides the default campus periods per day for a particular student for the current semester.
Example: 5';
alter table DWS.STUDENT_PERIOD_OVERRIDE
  add constraint PK_STUDENT_PERIOD_OVERRIDE primary key (CAMPUS_SID, STUDENT_SID)
  using index 
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
alter table DWS.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_DIM_STU_PRD_OVERIDE foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table DWS.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_PRD_OVRD_CAMPUS_DIM foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_FACT
prompt =======================================
prompt
create table DWS.STUDENT_RISK_FACTOR_FACT
(
  campus_sid             NUMBER not null,
  student_sid            NUMBER not null,
  flag_date_sid          NUMBER not null,
  campus_risk_factor_sid NUMBER not null,
  end_date_sid           NUMBER,
  risk_factor_count      NUMBER(1),
  last_update            TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table DWS.STUDENT_RISK_FACTOR_FACT
  is 'Grain = 1 row /student/risk factor/effective date';
comment on column DWS.STUDENT_RISK_FACTOR_FACT.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.STUDENT_RISK_FACTOR_FACT.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.STUDENT_RISK_FACTOR_FACT.risk_factor_count
  is 'A measure defined for Cognos reporting; Value 1';
create index DWS.NDX_STU_RISK_FACTOR_STU_SID_FK on DWS.STUDENT_RISK_FACTOR_FACT (STUDENT_SID)
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
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint PK_STUDENT_RISK_FACTOR_FACT primary key (CAMPUS_SID, STUDENT_SID, FLAG_DATE_SID, CAMPUS_RISK_FACTOR_SID)
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
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STUDENT__REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_DIM_STU_RISK_FACTOR_F foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_END_DATE_DIM foreign key (END_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FACT_CAMP_RISK_F foreign key (CAMPUS_RISK_FACTOR_SID)
  references DWS.CAMPUS_RISK_FACTOR_DIM (CAMPUS_RISK_FACTOR_SID);
alter table DWS.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_PHASE
prompt ========================================
prompt
create table DWS.STUDENT_RISK_FACTOR_PHASE
(
  campus_sid             NUMBER not null,
  student_sid            NUMBER not null,
  date_sid               NUMBER not null,
  campus_risk_factor_sid NUMBER not null,
  risk_factor_phase      VARCHAR2(10) not null,
  risk_factor_count      NUMBER(2) not null
)
tablespace DW_DEFAULT01
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
alter table DWS.STUDENT_RISK_FACTOR_PHASE
  add constraint FK_STU_RISK_PHS_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table DWS.STUDENT_RISK_FACTOR_PHASE
  add constraint FK_STU_RISK_PHS_FACT_CAMPUS foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.STUDENT_RISK_FACTOR_PHASE
  add constraint FK_STU_RISK_PHS_RF foreign key (CAMPUS_RISK_FACTOR_SID)
  references DWS.CAMPUS_RISK_FACTOR_DIM (CAMPUS_RISK_FACTOR_SID);
alter table DWS.STUDENT_RISK_FACTOR_PHASE
  add constraint FK_STU_RISK_PHS_STU foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_PHASE_SUM
prompt ============================================
prompt
create table DWS.STUDENT_RISK_FACTOR_PHASE_SUM
(
  campus_sid        NUMBER not null,
  date_sid          NUMBER not null,
  student_sid       NUMBER not null,
  risk_factor_phase VARCHAR2(10) not null,
  risk_factor_count NUMBER(2) not null
)
tablespace DW_DEFAULT01
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
alter table DWS.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table DWS.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_FACT_CAMPUS foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_STU foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_SNAPSHOT
prompt ===========================================
prompt
create table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
(
  campus_sid                     NUMBER not null,
  student_sid                    NUMBER not null,
  date_sid                       NUMBER not null,
  attendance_flag                VARCHAR2(3),
  semester_attendance_flag       VARCHAR2(3),
  core_course_failure_flag       VARCHAR2(3),
  non_core_course_failure_flag   VARCHAR2(3),
  semester_core_crs_failure_flag VARCHAR2(3),
  semester_noncore_crs_fail_flag VARCHAR2(3),
  gpa_flag                       VARCHAR2(3),
  deficient_credits_flag         VARCHAR2(3),
  discipline_flag                VARCHAR2(3),
  grade_6_thru_8_retention_flag  VARCHAR2(3),
  cohort_flag                    VARCHAR2(3),
  other_flag                     VARCHAR2(3),
  risk_factor_count              NUMBER(2)
)
tablespace DW_DEFAULT01
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
comment on table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
  is 'Grain: 1 row/campus/student/semester

For the current semester the date reflects the date of the last execution of the risk factor calculation engine.';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.attendance_flag
  is 'Indicates that the student was flagged for attendance during this snapshot period.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.semester_attendance_flag
  is 'Indicates that the student was flagged for attendance at the end of an academic semester.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.core_course_failure_flag
  is 'Indicates that the student was flagged for failing a core course during a marking period.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.non_core_course_failure_flag
  is 'Indicates that the student was flagged for failing a non-core course during a marking period.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.semester_core_crs_failure_flag
  is 'Indicates that the student was flagged for failing a core course for a semester.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.semester_noncore_crs_fail_flag
  is 'Indicates that the student was flagged for failing a non-core course for a semester.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.gpa_flag
  is 'Indicates that the student was flagged for a GPA below minium established standard.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.deficient_credits_flag
  is 'Indicates that the student was flagged for having to few credits for a semester.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.discipline_flag
  is 'Indicates that the student was flagged for behavorial problems.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.grade_6_thru_8_retention_flag
  is 'Indicates that the student was flagged for having been retained in grades 6 through 8 one or more times.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.cohort_flag
  is 'Indicates that the student was at risk of not graduating with his/her 9th grade class.
Values: Yes, No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.other_flag
  is 'Indicates that the student has "other" secondary risk factors.  The secondary risk may include LEP, Economically Disadvantaged, SPED, etc..
Values: Yes/No';
comment on column DWS.STUDENT_RISK_FACTOR_SNAPSHOT.risk_factor_count
  is 'The total number of risk factors flagged Yes for this student on this date.
Example: 3';
create index DWS.NDX_STU_RISK_SNAPSHOT_DATE_FK on DWS.STUDENT_RISK_FACTOR_SNAPSHOT (DATE_SID)
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
alter table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint PK_STUDENT_RISK_FACTOR_SNAPSHO primary key (CAMPUS_SID, STUDENT_SID, DATE_SID)
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
alter table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_DIM_STU_RISK_SNAPSHOT foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_FACTOR_FACT_CAMPUS foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table DWS.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_SNAPSHOT_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);

prompt
prompt Creating synonym ABSENCE_REASON_DIM
prompt ===================================
prompt
create or replace synonym DWS.ABSENCE_REASON_DIM
  for CORE.ABSENCE_REASON_DIM;

prompt
prompt Creating synonym ACADEMIC_RECORD_SOURCE_DIM
prompt ===========================================
prompt
create or replace synonym DWS.ACADEMIC_RECORD_SOURCE_DIM
  for CORE.ACADEMIC_RECORD_SOURCE_DIM;

prompt
prompt Creating synonym CAMPUS_DIM
prompt ===========================
prompt
create or replace synonym DWS.CAMPUS_DIM
  for CORE.CAMPUS_DIM;

prompt
prompt Creating synonym CLASS_PERIOD_DIM
prompt =================================
prompt
create or replace synonym DWS.CLASS_PERIOD_DIM
  for CORE.CLASS_PERIOD_DIM;

prompt
prompt Creating synonym COURSE_DIM
prompt ===========================
prompt
create or replace synonym DWS.COURSE_DIM
  for CORE.COURSE_DIM;

prompt
prompt Creating synonym COURSE_DIM_REJ
prompt ===============================
prompt
create or replace synonym DWS.COURSE_DIM_REJ
  for CORE.COURSE_DIM_REJ;

prompt
prompt Creating synonym COURSE_SECTION_DIM
prompt ===================================
prompt
create or replace synonym DWS.COURSE_SECTION_DIM
  for CORE.COURSE_SECTION_DIM;

prompt
prompt Creating synonym DATE_DIM
prompt =========================
prompt
create or replace synonym DWS.DATE_DIM
  for CORE.DATE_DIM;

prompt
prompt Creating synonym DISTRICT_DIM
prompt =============================
prompt
create or replace synonym DWS.DISTRICT_DIM
  for CORE.DISTRICT_DIM;

prompt
prompt Creating synonym ETL_GRADINGPERIOD_TO_GRADETYPE
prompt ===============================================
prompt
create or replace synonym DWS.ETL_GRADINGPERIOD_TO_GRADETYPE
  for CORE.ETL_GRADINGPERIOD_TO_GRADETYPE;

prompt
prompt Creating synonym GRADE_LEVEL_DIM
prompt ================================
prompt
create or replace synonym DWS.GRADE_LEVEL_DIM
  for CORE.GRADE_LEVEL_DIM;

prompt
prompt Creating synonym GRADE_TYPE_DIM
prompt ===============================
prompt
create or replace synonym DWS.GRADE_TYPE_DIM
  for CORE.GRADE_TYPE_DIM;

prompt
prompt Creating synonym RACE_ETHNICITY_DIM
prompt ===================================
prompt
create or replace synonym DWS.RACE_ETHNICITY_DIM
  for CORE.RACE_ETHNICITY_DIM;

prompt
prompt Creating synonym SID_SEQUENCE
prompt =============================
prompt
create or replace synonym DWS.SID_SEQUENCE
  for CORE.SID_SEQUENCE;

prompt
prompt Creating synonym STATE_COURSE_DIM
prompt =================================
prompt
create or replace synonym DWS.STATE_COURSE_DIM
  for CORE.STATE_COURSE_DIM;

prompt
prompt Creating synonym STUDENT_CREDIT_FACT
prompt ====================================
prompt
create or replace synonym DWS.STUDENT_CREDIT_FACT
  for CORE.STUDENT_CREDIT_FACT;

prompt
prompt Creating synonym STUDENT_CREDIT_FACT_ERR
prompt ========================================
prompt
create or replace synonym DWS.STUDENT_CREDIT_FACT_ERR
  for CORE.STUDENT_CREDIT_FACT_ERR;

prompt
prompt Creating synonym STUDENT_CREDIT_SUMMARY_MV
prompt ==========================================
prompt
create or replace synonym DWS.STUDENT_CREDIT_SUMMARY_MV
  for CORE.STUDENT_CREDIT_SUMMARY_MV;

prompt
prompt Creating synonym STUDENT_DIM
prompt ============================
prompt
create or replace synonym DWS.STUDENT_DIM
  for CORE.STUDENT_DIM;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT
prompt ========================================
prompt
create or replace synonym DWS.STUDENT_ENROLLMENT_FACT
  for CORE.STUDENT_ENROLLMENT_FACT;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT_ERR
prompt ============================================
prompt
create or replace synonym DWS.STUDENT_ENROLLMENT_FACT_ERR
  for CORE.STUDENT_ENROLLMENT_FACT_ERR;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT_REJ
prompt ============================================
prompt
create or replace synonym DWS.STUDENT_ENROLLMENT_FACT_REJ
  for CORE.STUDENT_ENROLLMENT_FACT_REJ;

prompt
prompt Creating synonym STUDENT_GRADE_FACT
prompt ===================================
prompt
create or replace synonym DWS.STUDENT_GRADE_FACT
  for CORE.STUDENT_GRADE_FACT;

prompt
prompt Creating synonym STUDENT_GRADE_FACT_ERR
prompt =======================================
prompt
create or replace synonym DWS.STUDENT_GRADE_FACT_ERR
  for CORE.STUDENT_GRADE_FACT_ERR;

prompt
prompt Creating synonym STUDENT_GRADE_FACT_REJ
prompt =======================================
prompt
create or replace synonym DWS.STUDENT_GRADE_FACT_REJ
  for CORE.STUDENT_GRADE_FACT_REJ;

prompt
prompt Creating synonym STUDENT_PERIOD_ABSENCE_FACT
prompt ============================================
prompt
create or replace synonym DWS.STUDENT_PERIOD_ABSENCE_FACT
  for CORE.STUDENT_PERIOD_ABSENCE_FACT;

prompt
prompt Creating synonym STUDENT_PERIOD_ABS_FACT_ERR
prompt ============================================
prompt
create or replace synonym DWS.STUDENT_PERIOD_ABS_FACT_ERR
  for CORE.STUDENT_PERIOD_ABS_FACT_ERR;

prompt
prompt Creating synonym STUDENT_PERIOD_ABS_FACT_REJ
prompt ============================================
prompt
create or replace synonym DWS.STUDENT_PERIOD_ABS_FACT_REJ
  for CORE.STUDENT_PERIOD_ABS_FACT_REJ;

prompt
prompt Creating synonym TALEND_LOG_CATCHER
prompt ===================================
prompt
create or replace synonym DWS.TALEND_LOG_CATCHER
  for CORE.TALEND_LOG_CATCHER;

prompt
prompt Creating view EXECUTION_LOAD_CAMPUS_VW
prompt ======================================
prompt
create or replace force view dws.execution_load_campus_vw as
select campus.district_sid
  , campus.district_id
  , campus.campus_sid
  , campus.campus_id
  , campus.campus_name
  , campus.campus_key
  , max( elog.execution_start_time) AS  execution_start_time
  , to_char( max(elog.execution_start_time ) , 'DD-MON-yyyy') AS execution_start_date
  , elog.process_name
  , (select to_date(PARAMETER_VALUE,'YYYYMMDD')
      from EXECUTION_PARAMETER
      join EXECUTION_LOG on EXECUTION_LOG.EXECUTION_START_TIME = EXECUTION_PARAMETER.EXECUTION_START_TIME
           and EXECUTION_LOG.CAMPUS_SID = EXECUTION_PARAMETER.CAMPUS_SID
           and EXECUTION_LOG.PROCESS_NAME = 'EngineExecution'
      where EXECUTION_PARAMETER.CAMPUS_SID = campus.campus_sid
      and EXECUTION_PARAMETER.PARAMETER_NAME = 'RunDate'
      and EXECUTION_LOG.EXECUTION_START_TIME = (select max(RUN_DATE.EXECUTION_START_TIME)
            from EXECUTION_LOG RUN_DATE
            where RUN_DATE.CAMPUS_SID = campus.campus_sid
            and RUN_DATE.PROCESS_NAME = 'EngineExecution')) as run_date
from execution_log elog,  dws.campus_dim campus
where elog.process_name = 'Load'
 and  campus.campus_sid = elog.campus_sid
 group by campus.district_sid
 , campus.campus_sid
 , elog.process_name
 , CAMPUS.CAMPUS_NAME
 , campus.district_id
 , campus.campus_id
 , CAMPUS.CAMPUS_KEY;

prompt
prompt Creating view ABS_ENROLL_GRADE_VW
prompt =================================
prompt
create or replace force view dws.abs_enroll_grade_vw as
select    'TX*'|| cd.campus_id as campus_security_key,  'TX*'|| cd.district_id as district_security_key,
  dd.school_year,  cd.district_id, cd.campus_id ,  cvw.district_sid, cvw.campus_sid,
  gld.grade_level  , to_char( cvw.execution_start_time,   'YYYY-MM-DD') as  Extract_Date ,
  dd.date_sid,   dd.date_id, dd.school_day_indicator
   ,(   select count(*)
          from student_period_absence_fact spaf, student_dim
         where cvw.campus_sid = spaf.campus_sid
          and dd.date_sid = spaf.date_sid
          and spaf.student_sid  = student_dim.student_sid
          and student_dim.current_grade_level = gld.grade_level) as Per_ABS_Count

   ,(   select count(student_dim.student_sid)
         from student_dim,student_enrollment_fact, date_dim date_dim_whd, date_dim date_dim_entry
        where student_dim.campus_sid = cvw.campus_sid
          and student_dim.student_sid = student_enrollment_fact.student_sid
          and student_enrollment_fact.campus_sid = student_dim.campus_sid
          and student_dim.current_grade_level = gld.grade_level
          and date_dim_entry.date_sid = student_enrollment_fact.entry_date_sid
          and date_dim_entry.school_year = dd.school_year
          and  date_dim_whd.date_sid  = nvl(student_enrollment_fact.withdrawal_date_sid, dd.date_sid)
          and dd.date_sid >= student_enrollment_fact.entry_date_sid
          and (dd.date_sid < nvl(student_enrollment_fact.withdrawal_date_sid,dd.date_sid+1)
            or (dd.date_sid <= nvl(student_enrollment_fact.withdrawal_date_sid,dd.date_sid)
            and date_dim_whd.semester = '2' and date_dim_whd.last_day_semester = 'Yes'  ))  ) as Enrollment
   , cd.periods_per_day



from execution_load_campus_vw cvw,   date_dim dd,  campus_dim cd,  grade_level_dim gld
where dd.district_sid = cvw.district_sid and cd.campus_sid = cvw.campus_sid
    and  to_char( dd.date_id,   'YYYY-MM-DD')
          between   to_char(  cvw.execution_start_time - 90 , 'YYYY-MM-DD')
    and to_char( cvw.execution_start_time  , 'YYYY-MM-DD')
   -- and cvw.district_sid = 1  and dd.date_sid = 120110113 and  cd.campus_id = '199902002'
    and dd.school_day_indicator  = 'Instructional'
    and cd.campus_sid = cvw.campus_sid
    and (cvw.campus_sid, gld.grade_level ) in
           ( select distinct campus_sid , current_grade_level from core.student_dim )

 Order by  cd.district_id, cd.campus_id , cvw.campus_sid, gld.grade_level_order, dd.date_sid desc
;

prompt
prompt Creating view ABS_ENROLL_STU_VW
prompt ===============================
prompt
create or replace force view dws.abs_enroll_stu_vw as
select    'TX*'|| cd.campus_id as campus_security_key,  'TX*'|| cd.district_id as district_security_key,
  dd.school_year,  cd.district_id, cd.campus_id ,  cvw.district_sid, cvw.campus_sid,
  sd.current_grade_level  , sd.student_id, sd.student_sid,
  to_char( cvw.execution_start_time,   'YYYY-MM-DD') as  Extract_Date ,
  dd.date_sid,   dd.date_id, dd.school_day_indicator
   ,(   select count( distinct sd.student_sid)
          from student_period_absence_fact spaf
         where cvw.campus_sid = sd.campus_sid
          and dd.date_sid = spaf.date_sid
          and spaf.student_sid  = sd.student_sid ) as  ABS_Count

   ,(   select count(sd.student_sid)
         from  student_enrollment_fact, date_dim date_dim_whd, date_dim date_dim_entry
        where sd.campus_sid = cvw.campus_sid
          and sd.student_sid = student_enrollment_fact.student_sid
          and student_enrollment_fact.campus_sid = sd.campus_sid
          and date_dim_entry.date_sid = student_enrollment_fact.entry_date_sid
          and date_dim_entry.school_year = dd.school_year
          and  date_dim_whd.date_sid  = nvl(student_enrollment_fact.withdrawal_date_sid, dd.date_sid)
          and dd.date_sid >= student_enrollment_fact.entry_date_sid
          and (dd.date_sid < nvl(student_enrollment_fact.withdrawal_date_sid,dd.date_sid+1)
            or (dd.date_sid <= nvl(student_enrollment_fact.withdrawal_date_sid,dd.date_sid)
            and date_dim_whd.semester = '2' and date_dim_whd.last_day_semester = 'Yes'  ))  ) as Enrollment


from execution_load_campus_vw cvw,   date_dim dd,  campus_dim cd, student_dim sd

where dd.district_sid = cvw.district_sid and cd.campus_sid = cvw.campus_sid
    and sd.campus_sid = cvw.campus_sid
    and  to_char( dd.date_id,   'YYYY-MM-DD')
          between   to_char(  cvw.execution_start_time - 90 , 'YYYY-MM-DD')
    and to_char( cvw.execution_start_time  , 'YYYY-MM-DD')
    and dd.school_day_indicator  = 'Instructional'
    and cd.campus_sid = cvw.campus_sid
  Order by  cd.district_id, cd.campus_id , cvw.campus_sid, sd.current_grade_level  , sd.student_id, dd.date_sid desc;

prompt
prompt Creating view DWS_DATE_COMPARE
prompt ==============================
prompt
create or replace force view dws.dws_date_compare as
select   campus.campus_sid, campus.district_name, campus.campus_id, campus.campus_name
      ,  campus.last_update  as Campus_DIM_Update
      , (select execution_start_time from execution_load_campus_vw where campus.campus_sid =  execution_load_campus_vw.campus_sid) as Load_Date
      , (select max(last_update) from Student_DIM  where campus.campus_sid =  Student_DIM.campus_sid) as Student_UPDate

      , (select max(date_id) from student_risk_factor_fact, date_dim where campus.campus_sid =  student_risk_factor_fact.campus_sid and student_risk_factor_fact.end_date_sid = date_dim.date_sid) as Student_RF_End_Date
      , (select max(last_update) from student_risk_factor_fact where campus.campus_sid =  student_risk_factor_fact.campus_sid) as Student_RF_UPDate

      , (select max(date_id) from attendance_risk_factor_fact, date_dim where campus.campus_sid =  attendance_risk_factor_fact.campus_sid and attendance_risk_factor_fact.date_sid = date_dim.date_sid) as Attendence_RF_End_Date
      , (select max(last_update) from attendance_risk_factor_fact where campus.campus_sid =  attendance_risk_factor_fact.campus_sid) as Attendence_RF_UPDate

      , (select max(date_id) from student_credit_fact, date_dim where campus.campus_sid =  student_credit_fact.campus_sid and student_credit_fact.date_sid = date_dim.date_sid) as Student_Credit_Date
      , (select max(last_update) from student_credit_fact where campus.campus_sid = student_credit_fact.campus_sid) as Student_Credit_UPDate

      , (select max(date_id) from student_enrollment_fact, date_dim where campus.campus_sid =  student_enrollment_fact.campus_sid and student_enrollment_fact.entry_date_sid = date_dim.date_sid) as Student_Enroll_Date
      , (select max(last_update) from student_enrollment_fact where campus.campus_sid = student_enrollment_fact.campus_sid) as Student_Enroll_UPDate

      , (select max(date_id) from student_period_absence_fact, date_dim where campus.campus_sid =  student_period_absence_fact.campus_sid and student_period_absence_fact.date_sid = date_dim.date_sid) as Student_Absence_Date
      , (select max(last_update) from student_period_absence_fact where campus.campus_sid = student_period_absence_fact.campus_sid) as Student_Absence_UPDate

 from  campus_dim campus

 order by 1;

prompt
prompt Creating view FACT_REPORT
prompt =========================
prompt
create or replace force view dws.fact_report as
select "CAMPUS_DIM".district_name, "CAMPUS_DIM".campus_id,
  "CAMPUS_DIM".campus_name, date_id, student_id,full_name, risk_factor_name,
   STUDENT_RISK_FACTOR_FACT."CAMPUS_SID",STUDENT_RISK_FACTOR_FACT."STUDENT_SID",STUDENT_RISK_FACTOR_FACT."FLAG_DATE_SID",STUDENT_RISK_FACTOR_FACT."CAMPUS_RISK_FACTOR_SID",STUDENT_RISK_FACTOR_FACT."END_DATE_SID",STUDENT_RISK_FACTOR_FACT."LAST_UPDATE",STUDENT_RISK_FACTOR_FACT."RISK_FACTOR_COUNT"
    from "CAMPUS_DIM" "CAMPUS_DIM", "STUDENT_DIM" "STUDENT_DIM",
    "STUDENT_RISK_FACTOR_FACT" "STUDENT_RISK_FACTOR_FACT",
    CAMPUS_RISK_FACTOR_DIM, "DATE_DIM" "DATE_DIM" , EXECUTION_LOAD_CAMPUS_VW
   where "CAMPUS_DIM"."CAMPUS_SID"="STUDENT_RISK_FACTOR_FACT"."CAMPUS_SID"
   and CAMPUS_RISK_FACTOR_DIM.CAMPUS_RISK_FACTOR_SID  ="STUDENT_RISK_FACTOR_FACT"."CAMPUS_RISK_FACTOR_SID"
   and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_FACT"."END_DATE_SID"
   and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_FACT"."STUDENT_SID"
   and "STUDENT_RISK_FACTOR_FACT"."END_DATE_SID" = "DATE_DIM"."DATE_SID"
   and  to_char( "DATE_DIM"."DATE_ID", 'yyyy-mm-dd')  =  to_char(  EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME, 'yyyy-mm-dd')
   ORDER BY 1 , 2 , 6, 7;

prompt
prompt Creating view SNAPSHOT_REPORT
prompt =============================
prompt
create or replace force view dws.snapshot_report as
select "CAMPUS_DIM".district_name, "CAMPUS_DIM".campus_id, "CAMPUS_DIM".campus_name, date_id, student_id,full_name,  STUDENT_RISK_FACTOR_SNAPSHOT."CAMPUS_SID",STUDENT_RISK_FACTOR_SNAPSHOT."STUDENT_SID",STUDENT_RISK_FACTOR_SNAPSHOT."DATE_SID",STUDENT_RISK_FACTOR_SNAPSHOT."ATTENDANCE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."SEMESTER_ATTENDANCE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."CORE_COURSE_FAILURE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."NON_CORE_COURSE_FAILURE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."SEMESTER_CORE_CRS_FAILURE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."SEMESTER_NONCORE_CRS_FAIL_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."GPA_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."DEFICIENT_CREDITS_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."DISCIPLINE_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."GRADE_6_THRU_8_RETENTION_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."COHORT_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."OTHER_FLAG",STUDENT_RISK_FACTOR_SNAPSHOT."RISK_FACTOR_COUNT"
    from "CAMPUS_DIM" "CAMPUS_DIM", "STUDENT_DIM" "STUDENT_DIM", "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT", "RF_DISPLAY_COLUMNS" "RF_DISPLAY_COLUMNS",  "DATE_DIM" "DATE_DIM"
   where "CAMPUS_DIM"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "RF_DISPLAY_COLUMNS"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID" and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID";

prompt
prompt Creating materialized view ABS_ENROLL_GRADE_MV
prompt ==============================================
prompt
create materialized view DWS.ABS_ENROLL_GRADE_MV
refresh force on demand
as
( select campus_security_key, district_security_key,
              school_year, district_id, campus_id, district_sid,
              campus_sid, grade_level, extract_date, date_sid, date_id,
              school_day_indicator, per_abs_count, enrollment, periods_per_day
         from abs_enroll_grade_vw -- where district_sid = 1
            );

prompt
prompt Creating materialized view ABS_ENROLL_STUDENT_MV
prompt ================================================
prompt
create materialized view DWS.ABS_ENROLL_STUDENT_MV
refresh force on demand
as
( select campus_security_key, district_security_key, school_year, district_id,
   campus_id, district_sid, campus_sid, current_grade_level, student_id, student_sid,
    extract_date, date_sid, date_id, school_day_indicator, abs_count, enrollment
  from abs_enroll_stu_vw     );

prompt
prompt Creating package PKG_RISK_CALCULATION_ENGINE
prompt ============================================
prompt
create or replace package dws.pkg_Risk_Calculation_Engine is

  -- Author  : BULLC
  -- Created : 9/1/2010 3:01:09 PM
  -- Purpose : To calculate Risk Factor for student who may drop out.
  -- Change Log:
  -- 11/4/10 cbull  Added logic to prc_stu_rf_snaphot to find Semester Attendance flags
  --                from prior campuses and apply to current snapshot record.
  -- 11/5/10 cbull  Updated the fn_calc_enrolled_days to fix bug. was not calc days enrolled to run date right.
  --                Change cohort proc to set end date to default to run date.
  -- 12/10/10 cbull fixed bug in attendence and completed inital development of deficient
  --                credits risk factor procedure.
  -- 01/10/11 cbull fixed bugs in snapshot procedure to process the grades RF transactions.
  -- 01/18/11 cbull fixed bugs in def crs and snapshot, sql for currently enrolled students was
  --                returning multiple rows per student.
  --                fixed bug in fn_completed_semesters, it was failing to recognize that late enrolling
  --                students with credits had actually completed one semester.
  --                fixed bug in attendance flag resulting from multi rows in a single select query. force query to
  --                return single row.
  -- 08/29/11 cbull install new version of prc_track_student_rf_phase.
  -- 09/09/11 cbull updated snapshot procedure due to primary key violation, add if stmt to
  --                skip duplicate records.
  -- 01/05/11 CBull Fix bug where multiple falgs are created when the calculated
  --                end date is less than one day.
  -- 01/19/12 CBull Added logging of engine run date to execution log and execution parameter tables to faclilite
  --                correct counting on dashboard pie chart and detail report.  Also had no log of actual rundate.
  -- 01/25/12 CBull Modified Deficient Credits SQL due to problem with case stmt not return logical results.
  -- 05/22/12 CBull Add LEP first and second year monitoring to the secondary risk factor count in prc_stu_rf_snaphot.
  -- 10/01/12 CBull Deficient Credits: changed the school year portion to determine if run date is beyond end of school year
  --                instead of sysdate, was a problem for running the engine for prior periods.
  -- 01/22/13 CBull prc_def_cr_stu_rf_fact_refresh: Updated flag and end date sql to be <= because it failed to pull correct date on the
  --                first day of the second semester.

  -- Version Information ---
  --  $Revision$
  -- End Version Information --
  
  -- Public type declarations
  
  
  -- Public constant declarations
  

  -- Public variable declarations
  

  -- Public function and procedure declarations
  FUNCTION fn_calc_enrolled_days
     (p_student_sid number
     ,p_campus_sid number
     ,p_run_date_sid number
     ,p_school_year varchar2) return number;
     
  FUNCTION fn_completed_semesters
     (p_district_sid number
     ,p_run_date_sid number
     ,p_school_year varchar2
     ,p_entry_date date) return number;
     
  PROCEDURE prc_execution_log 
     (p_start_time IN timestamp
     ,p_campus_sid IN number
     ,p_process_name IN varchar2
     ,p_process_type IN varchar2
     ,p_end_time IN timestamp
     ,p_execution_result IN varchar2
     ,p_debug IN varchar2);
  
  PROCEDURE prc_execution_parameter 
     (p_start_time IN timestamp
     ,p_campus_sid IN number
     ,p_parameter_name IN varchar2
     ,p_parameter_value IN varchar2
     ,p_debug IN varchar2);
                                
  PROCEDURE prc_att_rf_fact_full_refresh 
     (p_campus_sid IN number
     ,p_run_date_sid IN number
     ,p_school_year IN varchar2
     ,p_period_per_day IN number
     ,p_debug IN varchar2);
     
  PROCEDURE prc_att_stu_rf_fact_refresh
    (p_district_sid IN number
    ,p_campus_sid IN number
    ,p_run_date_sid IN number
    ,p_school_year IN varchar2
    ,p_attendance_threshold IN number
    ,p_periods_per_day IN number
    ,p_campus_rf_sid IN number
    ,p_debug IN varchar2);
    
  PROCEDURE prc_cohort_stu_rf_fact_refresh
    (p_district_sid IN number
    ,p_campus_sid IN number
    ,p_run_date_sid IN number
    ,p_school_year IN varchar2
    ,p_campus_rf_sid IN number
    ,p_debug IN varchar2);
  
  PROCEDURE prc_def_cr_stu_rf_fact_refresh
    (p_district_sid IN number
    ,p_campus_sid IN number
    ,p_run_date_sid IN number
    ,p_school_year IN varchar2
    ,p_campus_rf_sid IN number
    ,p_debug IN varchar2);
    
  PROCEDURE prc_merged_student_rf
    (p_district_sid IN number
     ,p_school_year IN varchar2
     ,p_debug IN varchar2);
                             
  PROCEDURE prc_stu_rf_snaphot
    (p_campus_sid IN number
    ,p_run_date_sid IN number
    ,p_school_year IN varchar2
    ,p_debug IN varchar2
    ,p_rows_inserted OUT number);
    
  PROCEDURE prc_risk_calc_engine 
    (p_campus_id IN varchar2
    ,p_run_date_id IN varchar2
    ,p_district_id IN varchar2
    ,p_debug IN varchar2 default 'N'); 

  -- overloaded so no need to pass campus_id or debug
  procedure prc_risk_calc_engine
    (p_run_date_id IN varchar2
    ,p_district_id IN varchar2);

end pkg_Risk_Calculation_Engine;
/

prompt
prompt Creating package PKG_RISK_FACTOR_CONFIG
prompt =======================================
prompt
create or replace package dws.PKG_RISK_FACTOR_CONFIG is

  -- Author  : BULLC
  -- Created : 7/27/2012 11:47:20 AM
  -- Purpose : Maintain the risk factor configurations
  
  -- Public type declarations

  
  -- Public constant declarations


  -- Public variable declarations


  -- Public function and procedure declarations
  PROCEDURE prc_remove_campus_rf_config (p_campus_id IN varchar2);

end PKG_RISK_FACTOR_CONFIG;
/

prompt
prompt Creating procedure INSERT_DATE_TO_EXECUTION_LOG
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DWS."INSERT_DATE_TO_EXECUTION_LOG" (p_district_id varchar2
                                                        ,p_run_date varchar2)
                                                        
  /*--------------------------------------------------------------------------------------
  -- Procedure:           insert_date_to_execution_log
  --
  -- Purpose:             Inserts load date -- date data was pull from source -- record(s)
  --                      for all campuses within a district.  The record(s) inserted
  --                      into the dws.execution_log table by this procedure 
  --                      is/are required for the DWS reports to run correctly and reflect
  --                      accurate data.
  --
  -- Parms:               p_district_id = district of campuses to be updated
  --                      p_run_date = YYYYMMDD date when source load occurred
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20101115  T. Esposito  Original version
  ---------------------------------------------------------------------------------------*/                                                        
is
    
    cursor campus_cur(p_district_id varchar2) is
    select distinct campus_id
    from campus_dim 
    where district_id = p_district_id;
    
    v_start_time timestamp := systimestamp;
    v_end_time timestamp;
    v_errcode varchar2(50);
    v_errmesg varchar2(200);
    v_rec_cnt number;
    v_sql_stmt varchar2(500);
    v_date_time timestamp;
  
  --****************
  -- Main processing
  --****************   
begin
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started insert_date_to_execution_log procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);
   
    v_date_time := to_timestamp(p_run_date || '01:00:00.000','yyyymmdd hh:mi:ss.ff');
    v_sql_stmt := 'insert into execution_log (execution_start_time, campus_sid, process_name, process_type, execution_end_time, execution_result)
                   values(:bv1, :bv2, ''Load'', ''N/A'', cast(sysdate as timestamp), ''Successful'')';

    for campus_rec in campus_cur(p_district_id) loop
      execute immediate v_sql_stmt using v_date_time, campus_rec.campus_id;
      v_rec_cnt := v_rec_cnt + 1;
    end loop;
    commit;
    
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'insert_date_to_execution_log'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of insert_date_to_execution_log procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_cnt
                                         ,p_comments => 'Error in insert_date_to_execution_log procedure for district ' || p_district_id                                         
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_time, v_end_time));
      rollback;
      raise; 
                        
end insert_date_to_execution_log;
/

prompt
prompt Creating package body PKG_RISK_CALCULATION_ENGINE
prompt =================================================
prompt
create or replace package body dws.pkg_risk_calculation_engine is

  -- Private type declarations
  
  
  -- Private constant declarations
  

  -- Private variable declarations


  -- Function and procedure implementations
/*----------------------------------------------------------------------------------------------------------
 *  Function: fn_completed_semesters  
 *  
 *  A function to return the students total number of completed semester since entering the ninth grade.
 *  Example: IN: p_district_sid => 1 p_school_year => 2011 p_run_date_sid => 120101130 
 *               p_school_year, p_entry_date(ninth grade entry date)  RESULT: 6 
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_student_sid                       The date sid which the process is being run.
 *---------------------------------------------------------------------------------------------------------*/
FUNCTION fn_completed_semesters(p_district_sid number,p_run_date_sid number, p_school_year varchar2, p_entry_date date)
return number is

  v_end_date          date       := to_date(substr(p_run_date_sid,-8),'YYYYMMDD');
  v_last_day_semester date       := '';
  v_start_school_year varchar(4) := '';
  v_in_between_years  number     := 0;
  v_total_semesters   number     := 0;
  v_student_first_semester varchar2(5) := 'False';
  
begin

-- check to see if the student has been in HS for less than one semester if so return 0 --
if v_end_date -  p_entry_date < 120 then 
  begin
    select 'True'
    into v_student_first_semester 
    from date_dim entry_date
    where 
    entry_date.semester = (select max(run_date.semester) 
                          from date_dim run_date
                          where run_date.district_sid = p_district_sid
                          and run_date.school_year = p_school_year
                          and run_date.date_id between to_date(substr(p_run_date_sid,2),'YYYYMMDD') - 10 
                                      and to_date(substr(p_run_date_sid,2),'YYYYMMDD') + 10)
    and entry_date.date_id = p_entry_date 
    and entry_date.district_sid = p_district_sid;
    
    if v_student_first_semester = 'True' then -- if the semesters are equal then student is still in first semester of HS.
      v_total_semesters := 0;
      return v_total_semesters;
      --dbms_output.put_line('Less than one semester: '||v_total_semesters); 
    end if;
    
    exception
      when no_data_found then
           null; -- when no data found, studnet is NOT in their first semester so continue processing
  end;   
end if;

-- determine v_start_school_year --
if to_char(p_entry_date,'MM') between '08' and '12' then
  v_start_school_year := to_char(p_entry_date,'YYYY') + 1;
else 
  v_start_school_year := to_char(p_entry_date,'YYYY');
end if;

-- process the first year --
if p_school_year <> v_start_school_year then
  if to_char(p_entry_date,'MM') between '08' and '12' then
    v_total_semesters := v_total_semesters + 2;
  else 
    v_total_semesters := v_total_semesters + 1;
  end if;
end if;

-- process the last year --
select date_dim.date_id
into v_last_day_semester
from date_dim
where date_dim.district_sid = p_district_sid
      and date_dim.school_year = p_school_year
      and date_dim.semester = '2'
      and date_dim.last_day_semester = 'Yes';
        
if v_end_date >= v_last_day_semester then 
  v_total_semesters := v_total_semesters + 2;
else
  select date_dim.date_id
  into v_last_day_semester
  from date_dim
  where date_dim.district_sid = p_district_sid
        and date_dim.school_year = p_school_year
        and date_dim.semester = '1'
        and date_dim.last_day_semester = 'Yes';
  if v_end_date >= v_last_day_semester then 
    v_total_semesters := v_total_semesters + 1;
  end if;
end if;

-- process the in between years --
if p_school_year <> v_start_school_year then
  v_in_between_years := to_number(p_school_year) - to_number(v_start_school_year) - 1;

  v_total_semesters := v_total_semesters + (v_in_between_years * 2);
end if;

return v_total_semesters;
--dbms_output.put_line('final: '||v_total_semesters);  
end fn_completed_semesters;  
/*----------------------------------------------------------------------------------------------------------
 *  Function: fn_student_enrl_campus  
 *  
 *  A function to return the students enrolled campus based on the school year and student sid.
 *  Example: IN: p_student_sid => 234234 p_school_year => 2011  RESULT: 23124 
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_student_sid                       The date sid which the process is being run.
 *---------------------------------------------------------------------------------------------------------*/
FUNCTION fn_student_last_enrl_campus(p_student_sid number, p_school_year varchar2) return number is
  v_campus_id number;
begin
  select stu_campus.campus_id 
    into v_campus_id
    from 
        (select campus_id 
        from student_enrollment_fact
        join date_dim on date_dim.date_sid = student_enrollment_fact.entry_date_sid
        join campus_dim on campus_dim.campus_sid = student_enrollment_fact.campus_sid 
        where date_dim.school_year = p_school_year
        and student_enrollment_fact.student_sid = p_student_sid
        order by student_enrollment_fact.entry_date_sid desc
              , student_enrollment_fact.withdrawal_date_sid nulls first) stu_campus
    where rownum = 1;
  return(v_campus_id);
end fn_student_last_enrl_campus;
/*----------------------------------------------------------------------------------------------------------
 *  Function: fn_get_school_year  
 *  
 *  A function to return the school year based on the run date sid.
 *  Example: IN: 120100515  RESULT: 2010 
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_run_date_sid                       The date sid which the process is being run.
 *---------------------------------------------------------------------------------------------------------*/
FUNCTION fn_get_school_year (p_run_date_sid number) 
RETURN number
IS  
  v_school_year varchar2(4);
   
BEGIN
  
  select date_dim.school_year 
    into v_school_year 
    from date_dim
    where date_dim.date_sid = p_run_date_sid;
    
  RETURN(v_school_year);
END fn_get_school_year;
/*----------------------------------------------------------------------------------------------------------
 *  Function: fn_calc_enrolled_days  
 *  
 *  A function to calculate the number days a student has been enrolled at a campus based on the 
 *  Student_Enrollment_Fact transactions and the date being requested. 
 *
 *  NOTE: Returns -1 if the days enrolled = 0.  This is to prevent division by zero in a query using this function.
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_student_sid                        The sid of the student
 *    p_campus_sid                         The sid of the campus
 *    p_run_date_sid                       The date sid inclusive of the enrollment period for which the 
 *                                         count is desired.
 *---------------------------------------------------------------------------------------------------------*/

FUNCTION fn_calc_enrolled_days (p_student_sid IN number, p_campus_sid IN number, p_run_date_sid IN number, p_school_year IN varchar2 ) 
RETURN number
IS

  type t_student_enrollment is table of student_enrollment_fact%rowtype;
  v_stu_enrl_collection t_student_enrollment;
  v_days_enrolled number := 0;
  v_total_days_enrl number := 0;

  BEGIN
    
  -- retrieve enrollment records for the student at the specified campus based on the date sid  
  select student_enrollment_fact.*
  bulk collect into v_stu_enrl_collection
  from student_enrollment_fact 
  join date_dim on date_dim.date_sid = student_enrollment_fact.entry_date_sid
  and date_dim.date_sid <= p_run_date_sid 
  and date_dim.school_year = p_school_year
  where student_sid = p_student_sid 
   and campus_sid = p_campus_sid
  order by student_enrollment_fact.student_sid
        ,student_enrollment_fact.entry_date_sid;
  
  if v_stu_enrl_collection.count > 0 then -- if 1 or more enrollments then loop thru them
    
    for i in v_stu_enrl_collection.first..v_stu_enrl_collection.last
      loop
        -- DEBUG code --
/*          dbms_output.put_line('campus=>'||v_stu_enrl_collection(i).campus_sid
                      ||' stu=>'||v_stu_enrl_collection(i).student_sid
                      ||' edt=>'||v_stu_enrl_collection(i).entry_date_sid
                      ||' wdt=>'||v_stu_enrl_collection(i).withdrawal_date_sid
                      ||' dysenrl=>'||v_stu_enrl_collection(i).days_enrolled
                      ||' ldt=>'||v_stu_enrl_collection(i).last_update
                      ||' glvl=>'||v_stu_enrl_collection(i).grade_level_sid);*/
        -- end debug code ---
        
        v_days_enrolled := 0; -- reset to zero to avoid incorrect counts
        
        if v_stu_enrl_collection(i).withdrawal_date_sid <= p_run_date_sid then

          if v_stu_enrl_collection(i).days_enrolled > 0 then
            -- use the computed number of days on the enrollment fact
            v_total_days_enrl :=  v_total_days_enrl + v_stu_enrl_collection(i).days_enrolled;
          else
            -- compute the days enrolled to be safe because the days enrolled may be missing
            select count(1) 
            into v_days_enrolled
            from date_dim dd
            where dd.school_day_indicator = 'Instructional'
            and dd.date_sid >= v_stu_enrl_collection(i).entry_date_sid 
            and (dd.date_sid < nvl(v_stu_enrl_collection(i).withdrawal_date_sid,p_run_date_sid)
            or (dd.date_sid <= nvl(v_stu_enrl_collection(i).withdrawal_date_sid,p_run_date_sid)
            and dd.semester = '2' and dd.last_day_semester = 'Yes'));
       
            v_total_days_enrl :=  v_total_days_enrl + v_days_enrolled;
          end if;
          
        else  -- compute number of days up to the run date
          select count(1) 
          into v_days_enrolled
          from date_dim dd
          where dd.school_day_indicator = 'Instructional'
          and dd.date_sid between v_stu_enrl_collection(i).entry_date_sid and p_run_date_sid;
     
          v_total_days_enrl :=  v_total_days_enrl + v_days_enrolled;
        end if;
      end loop;
    -- if the result of the comutation is zero days enrolled set the result to -1
    if v_total_days_enrl = 0 then
      v_total_days_enrl := -1; -- set to -1 to avoid division by zero in subsequent process
    end if;
    
  else -- there is one or zero enrollment records to process
    v_total_days_enrl := -1; -- set to -1 to avoid division by zero in subsequent process
  end if;      
 
  RETURN(v_total_days_enrl);
END fn_calc_enrolled_days;

/*------------------------------------------------------------------------------
Procedure:           prc_execution_log 
Purpose:             Logs executions and runtime parameters for the DWS.
Input:               Start_Time - The execution start time of the process.
                     Campus_sid - The sid of the campus being processed.
                     Process_type - what kind of process is being run, e.g. RCE, CampusLoad
                     Process_Name - The name of the process being run, e.g. Attendance.
                     end_time - The exection end time.
                     Execution_Result - Successful/Failed/Warning.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_execution_log (p_start_time IN timestamp
                             , p_campus_sid IN number
                             , p_process_name IN varchar2
                             , p_process_type IN varchar2
                             , p_end_time IN timestamp
                             , p_execution_result IN varchar2
                             , p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_execution_log';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         :=0;
    v_errcode         number;
    v_errmesg         varchar2(200);

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;
   
   insert into execution_log
     (execution_start_time
     , campus_sid
     , process_name
     , process_type
     , execution_end_time
     , execution_result)
   values
     (p_start_time
     , p_campus_sid
     , p_process_name
     , p_process_type
     , p_end_time
     , p_execution_result);
   
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure (Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_execution_log;

/*------------------------------------------------------------------------------
Procedure:           prc_execution_parameter 
Purpose:             Logs executions and runtime parameters for the DWS.
Input:               Start_Time - The execution start time of the process.
                     Campus_sid - The sid of the campus being processed.
                     Parameter_Name - e.g. Periods Per Day, Attendance Threshold
                     Parameter_Value - e.g. 7,.1

Revision History
Date      Author       Remarks
20100908  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_execution_parameter (p_start_time IN timestamp
                             , p_campus_sid IN number
                             , p_parameter_name IN varchar2
                             , p_parameter_value IN varchar2
                             , p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_execution_parameter';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         :=0;
    v_errcode         number;
    v_errmesg         varchar2(200);

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;
   
   insert into execution_parameter
     (execution_start_time
     , campus_sid
     , parameter_name
     , parameter_value)
   values
     (p_start_time
     , p_campus_sid
     , p_parameter_name
     , p_parameter_value);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure (Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_execution_parameter;

/*------------------------------------------------------------------------------
Procedure:           prc_delete_campus_att_rf_fact 
Purpose:             Deletes the attendance risk factor fact data for a campus for 
                     the specified school year.
Input:               Campus_sid - The sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_campus_att_rf_fact (p_campus_sid IN number, p_school_year IN varchar2, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_campus_att_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- delete rows --
   delete attendance_risk_factor_fact
   where attendance_risk_factor_fact.campus_sid = p_campus_sid
   and attendance_risk_factor_fact.date_sid in 
       (select date_sid from date_dim dateDimSub 
          where dateDimSub.school_year = p_school_year);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_campus_att_rf_fact;

/*------------------------------------------------------------------------------
Procedure:           prc_att_rf_fact_full_refresh 
Purpose:             Calculates period percent absences based on enrollment and 
                     the campus periods per day.  Performs a full school year refresh
                     of the data.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_att_rf_fact_full_refresh (p_campus_sid IN number, p_run_date_sid IN number, p_school_year IN varchar2, p_period_per_day IN number, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_att_rf_fact_full_refresh';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;
    e_dws_district_error exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- Delete Prior data from attendance_risk_factor_fact --
   prc_delete_campus_att_rf_fact(p_campus_sid,p_school_year,p_debug);
    
   --  insert rows into attendance_risk_factor_fact --
   insert /*+ APPEND */ into attendance_risk_factor_fact
    (select 
    campus_sid,
    student_sid,
    date_sid,
    period_absence_count,
    ytd_period_absence_count,
    ytd_days_enrolled,
    ytd_period_absence_count/(ytd_days_enrolled*p_period_per_day) as period_absence_percent,
    systimestamp as last_update
    from 
    (
      select distinct 
      student_dim.student_sid
      ,campus_dim.campus_sid
      ,date_dim.date_sid
      ,count(*) as period_absence_count
      ,sum(count(1)) over (partition by student_dim.student_sid
             order by student_dim.student_sid,date_dim.date_sid) as ytd_period_absence_count
      ,pkg_risk_calculation_engine.fn_calc_enrolled_days(p_student_sid => student_dim.student_sid,
                                                         p_campus_sid => campus_dim.campus_sid,
                                                         p_run_date_sid => date_dim.date_sid,
                                                         p_school_year => p_school_year) as ytd_days_enrolled
      from student_period_absence_fact
      join student_dim on student_dim.student_sid = student_period_absence_fact.student_sid
      join campus_dim  on campus_dim.campus_sid = student_period_absence_fact.campus_sid
      join date_dim    on date_dim.date_sid = student_period_absence_fact.date_sid 
           and date_dim.school_year = p_school_year
      join absence_reason_dim on absence_reason_dim.absence_reason_sid = student_period_absence_fact.absence_reason_sid 
           and absence_reason_dim.exclude_absence_reason = 'No'
      join class_period_dim on class_period_dim.class_period_sid = student_period_absence_fact.class_period_sid
           and class_period_dim.exclude_class_period = 'No'
      where student_period_absence_fact.campus_sid = p_campus_sid
            and student_dim.student_sid > 0
      group by student_dim.student_sid
      ,campus_dim.campus_sid
      ,date_dim.date_sid
    ) stu_abs_calc);

   v_rows_affected := SQL%ROWCOUNT; 
   if v_rows_affected = 0 then 
     raise e_no_rows_found;
   end if;
    
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Stopped','',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_att_rf_fact_full_refresh;

/*------------------------------------------------------------------------------
Procedure:           prc_delete_att_student_rf_fact 
Purpose:             Deletes the attendance risk factor fact data for a campus for 
                     the specified school year from student_risk_factor_fact.
Input:               Campus_sid - The sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date      Author       Remarks
20100914  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_att_student_rf_fact (p_campus_rf_sid IN number, p_school_year IN varchar2,p_campus_rf_semester_sid IN number, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_att_student_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
   end if;
   -- delete rows --
   delete student_risk_factor_fact
   where (student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_sid
          or student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_semester_sid)
   and student_risk_factor_fact.flag_date_sid in 
       (select date_sid from date_dim dateDimSub 
          where dateDimSub.school_year = p_school_year);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_att_student_rf_fact;


/*------------------------------------------------------------------------------
Procedure:           prc_att_stu_rf_fact_refresh 
Purpose:             Translates student period absences that are greater than the 
                     threshold defined for the campus into student_risk_factor_fact
                     records.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
201110105 C.Bull       Fix bug where multiple falgs are created when the calculated
                       end date is less than one day.
--------------------------------------------------------------------------------*/
PROCEDURE prc_att_stu_rf_fact_refresh(p_district_sid IN number
                                    ,p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_attendance_threshold IN number
                                    ,p_periods_per_day IN number
                                    ,p_campus_rf_sid IN number
                                    , p_debug IN varchar2) is
    -- Logging Variables --                                
    v_proc_name                     varchar2(100)  := 'pkg_risk_calculation_engine.prc_att_stu_rf_fact_refresh';
    v_start_datetime                timestamp      := SYSTIMESTAMP;
    v_end_datetime                  timestamp      := SYSTIMESTAMP;
    v_rows_affected                 number         := 0;
    -- Processing Variables --
    v_days_to_clear                 number         := 0;
    v_end_date_sid                  number         := 0;
    v_end_1st_semester              pls_integer    := 0; -- index of the end of the first semester
    v_end_2nd_semester              pls_integer    := 0; -- index of the end of the second semester
    v_2nd_sem_flag_end_date_sid     number         := 0; -- date sid for the end of the second semester attendance flag
    v_campus_rf_semester_sid        number         := 0;
    v_number_of_days                pls_integer    := 0; -- the number of academic days between risk factor end and start date
    v_previous                      pls_integer    := 1; -- index used for merging risk factor records
    j                               pls_integer    := 0; -- index used for v_stu_rf_collection
    k                               pls_integer    := 0; -- index used for semester attendance flags
    n                               pls_integer    := 0; -- index used for building v_insert_list
    b_flag_date                     boolean        := false;
    -- Exception Variables --
    v_errcode                       number;
    v_errmesg                       varchar2(200);
    e_no_rows_found                 exception;
    e_dws_district_error            exception;
    
    -- Collection Variables --
    TYPE t_index_pointer IS TABLE OF PLS_INTEGER;
    v_insert_list t_index_pointer := t_index_pointer(); -- List of rows from collection to insert
    
    TYPE t_att_rf_fact is table of attendance_risk_factor_fact%ROWTYPE;
    v_att_rf_collection t_att_rf_fact;
    
    TYPE r_date_dim is RECORD ( 
         dateSID              date_dim.date_sid%TYPE,
         EndSemesterFlag      date_dim.last_day_semester%TYPE,
         Semester             date_dim.semester%TYPE);
    TYPE t_date_type is table of r_date_dim INDEX BY pls_integer;
    v_date_collection t_date_type;
    
    TYPE t_student_rf_fact is table of student_risk_factor_fact%ROWTYPE;
    v_stu_rf_collection t_student_rf_fact := t_student_rf_fact();
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select 
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from dws.campus_risk_factor_dim
      join dws.campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
           and campus_dim.campus_sid = p_campus_sid
      where campus_risk_factor_dim.risk_factor_name = 'Previous Semester Attendance';   
     exception
      when no_data_found then
       v_campus_rf_semester_sid := p_campus_rf_sid; -- set to 'Attendance' campus_risk_factor_dim member
   end; 

   -- Delete Prior data from Student_risk_factor_fact for this campus/school year --
   prc_delete_att_student_rf_fact(p_campus_rf_sid,p_school_year,v_campus_rf_semester_sid,p_debug);
  
   -- collect academic days from date_dim for the run date school year that was passed in as a parm --
   select 
     date_dim.date_sid 
     ,date_dim.last_day_semester
     ,date_dim.semester
   bulk collect into v_date_collection
   from dws.date_dim 
   where date_dim.school_year = p_school_year 
         and date_dim.school_day_indicator = 'Instructional'
         and district_sid = p_district_sid
   order by date_dim.date_sid;

   -- set semester end date variables --
   for i in v_date_collection.first..v_date_collection.last
     loop 
       if v_date_collection(i).EndSemesterFlag = 'Yes'
         and v_date_collection(i).Semester = '1' then 
         v_end_1st_semester := i; -- set variable to the index value that points to the date_sid for semester 1
       elsif  v_date_collection(i).EndSemesterFlag = 'Yes'
         and v_date_collection(i).Semester = '2' then 
         v_end_2nd_semester := i; -- set variable to the index value that points to the date_sid for semester 2
       end if;
     end loop;
   
   -- determine semester 2 flag end date --
   -- Semester 2 end date should be set to the day before the end of semester 1
   -- of the next school year.
   -- if the date_dim does not contain data for the next school year then set 
   -- the semester 2 end date to the max date of 12/31/2999.
      select nvl(max(date_dim.date_sid),p_district_sid || '29991231')
        into v_2nd_sem_flag_end_date_sid
        from date_dim
        where date_dim.district_sid = p_district_sid
          and date_dim.school_year = to_char(to_number(p_school_year) + 1)
          and date_dim.semester = '1'
          and date_dim.date_id < 
              (Select dd.date_id from date_dim dd
                where dd.district_sid = p_district_sid
                  and dd.school_year = to_char(to_number(p_school_year) + 1)
                  and dd.semester = '1' 
                  and dd.last_day_semester = 'Yes');
   
   -- collect period absences greater than threshold             -- 
   -- or meet the > 14 period absences in the first 20 days rule --
   -- 09/11/11 - changed to 2 * the priods per day  in the first 20 days from 
   -- the hard coded 14 days to accomodate shools that only take attendance 
   -- once per day.
   select 
     Campus_sid
     ,student_sid
     ,attendance_risk_factor_fact.date_sid
     ,period_absence_count
     ,ytd_period_absence_count
     ,ytd_days_enrolled
     ,period_absence_percent
     ,attendance_risk_factor_fact.last_update
   bulk collect into v_att_rf_collection
   from dws.attendance_risk_factor_fact 
   join dws.date_dim  on date_dim.date_sid = attendance_risk_factor_fact.date_sid
        and date_dim.school_year = p_school_year
   where ((period_absence_percent >= p_attendance_threshold and ytd_days_enrolled > 20)
       or (ytd_days_enrolled <= 20 and ytd_period_absence_count >= (2*p_periods_per_day)))
       and campus_sid = p_campus_sid
       and attendance_risk_factor_fact.date_sid <= p_run_date_sid
   order by student_sid,date_sid;
   
   if v_att_rf_collection.count = 0 then 
     raise e_no_rows_found;
   end if;   
   
   -- first row in v_att_rf_collection is the first flag date 
   -- for the first student.  v_stu_rf_collection holds the student_risk_factor_fact
   -- records as they are constructed.

   for i in v_att_rf_collection.first..v_att_rf_collection.last
     loop   
       -- if b_flag_date is false then the next record is the start of a new 
       -- attendance flag period.  it will be set back to false when an end 
       -- date is set.
       if not b_flag_date then
         v_stu_rf_collection.extend;
         j := j + 1;  -- j is the index for the student risk factor collection and is mananged manually
         v_stu_rf_collection(j).campus_sid := v_att_rf_collection(i).campus_sid;
         v_stu_rf_collection(j).student_sid := v_att_rf_collection(i).student_sid;
         v_stu_rf_collection(j).flag_date_sid := v_att_rf_collection(i).date_sid;
         v_stu_rf_collection(j).campus_risk_factor_sid := p_campus_rf_sid;
         v_stu_rf_collection(j).last_update := systimestamp;
         v_stu_rf_collection(j).risk_factor_count := 1;
         b_flag_date := TRUE;
       end if;
       -- -------------------
       -- compute end date --
       -- -------------------
       -- the number of days for the flag to clear is calculated mathmatically using the following formula
       -- number of days to clear = floor( ( (total periods absent / number of periods per day ) / attendance threshold) - total days enrolled) )
       -- where floor is function that rounds down to the the nearest whole integer.
       v_days_to_clear := floor(((v_att_rf_collection(i).ytd_period_absence_count/p_periods_per_day)/p_attendance_threshold)-v_att_rf_collection(i).ytd_days_enrolled);
       
       -- The date collection contains only the academic days. We need to loop through the
       -- date collection to find the index value that points to the date_sid for the flag date.
       -- Once this is found, we can add the days_to_clear to the index of the date collection to find the index of the 
       -- date_sid of the end_date.  If the result of adding the days to the index is greater than
       -- the number of items in our date collection then the date is beyond the end of the school year
       -- so the end date is set to the last day of school.
       for x in v_date_collection.first..v_date_collection.last
         loop
           if v_date_collection(x).dateSID = v_att_rf_collection(i).date_sid then
             if (x + v_days_to_clear) > v_date_collection.last then -- check if computed date is beyond end of school year
               If p_run_date_sid < v_date_collection(v_date_collection.last).dateSID then -- check if run date is prior to last day of school
                 v_end_date_sid := p_run_date_sid;  -- if run date prior to last day of school use run date for end date
               else
                 v_end_date_sid := v_date_collection(v_date_collection.last).dateSID; -- set to last day of school
               end if;
             else
               if p_run_date_sid < v_date_collection(x + v_days_to_clear).dateSID then -- check if run date is prior to computed end date
                 v_end_date_sid := p_run_date_sid; -- if run date prior to computed end date use run date for end date
               else
                 v_end_date_sid := v_date_collection(x + v_days_to_clear).dateSID; -- set to calculated end date
               end if;
             end if;
             exit; -- found the date sid on which the flag will clear so exit the loop
           end If;
         end loop;
       -- --------------------------------  
       -- determine the actual end date --  
       -- --------------------------------
       -- The computed end date may or may not be the actual end date as the student might have
       -- had additional period absences before the end date.  Therefore, it is necessary to peek
       -- ahead to the next record in the collection to determine this:
       -- if this is the last record in the collection or the last record for this student  
       -- or the end date is less than the students next period absence date then use the calculated end date
       -- Else proceed to the next period absence record.
       if i = v_att_rf_collection.last
         or v_att_rf_collection(i).student_sid <>  v_att_rf_collection(i+1).student_sid
         or(v_att_rf_collection(i).student_sid =  v_att_rf_collection(i+1).student_sid
           and v_end_date_sid < v_att_rf_collection(i+1).date_sid) then
         v_stu_rf_collection(j).end_date_sid := v_end_date_sid;
         b_flag_date := FALSE;
         
       -- determine semester flags -- 
         k := j; -- k is used to ensure that we always point to the correct record in the v_stu_rf_collection in the event that we add a semester flag
         If v_date_collection(v_end_1st_semester).dateSID 
           between v_stu_rf_collection(k).flag_date_sid and v_stu_rf_collection(k).end_date_sid then
           v_stu_rf_collection.extend;
           j := j + 1;  -- j is the index for the student risk factor collection and is mananged manually
           v_stu_rf_collection(j).campus_sid := v_stu_rf_collection(k).campus_sid;
           v_stu_rf_collection(j).student_sid := v_stu_rf_collection(k).student_sid;
           v_stu_rf_collection(j).flag_date_sid := v_date_collection(v_end_1st_semester).dateSID; -- set it to the last day of the 1st semester
           v_stu_rf_collection(j).end_date_sid := v_date_collection(v_end_2nd_semester - 1).dateSID; -- set it to the day before the end of the 2nd semester
           v_stu_rf_collection(j).campus_risk_factor_sid := v_campus_rf_semester_sid;
           v_stu_rf_collection(j).last_update := systimestamp;
           v_stu_rf_collection(j).risk_factor_count := 1;
         end if;
         
         if v_date_collection(v_end_2nd_semester).dateSID 
           between v_stu_rf_collection(k).flag_date_sid and v_stu_rf_collection(k).end_date_sid then
           v_stu_rf_collection.extend;
           j := j + 1;  -- j is the index for the student risk factor collection and is mananged manually
           v_stu_rf_collection(j).campus_sid := v_stu_rf_collection(k).campus_sid;
           v_stu_rf_collection(j).student_sid := v_stu_rf_collection(k).student_sid;
           v_stu_rf_collection(j).flag_date_sid := v_date_collection(v_end_2nd_semester).dateSID;  -- set it to the last day of the 1st semester
           v_stu_rf_collection(j).end_date_sid := v_2nd_sem_flag_end_date_sid; -- set it to the computed end date for the 2nd semester flag
           v_stu_rf_collection(j).campus_risk_factor_sid := v_campus_rf_semester_sid;
           v_stu_rf_collection(j).last_update := systimestamp;
           v_stu_rf_collection(j).risk_factor_count := 1;
         end if;
       end if;
     end loop;
   
   -- We need to loop through the newly created risk factors one more time to merge any
   -- one day flags that were created because the calculated end date was only one 1 or less.
   if p_debug in ('D','TD','TDI') then
     dbms_output.put_line('********  Attendance RF output prior to merge ********');
   end if;
   for i in v_stu_rf_collection.first..v_stu_rf_collection.last
     loop
       -- Debug Code --
       if p_debug in ('D','TD','TDI') then
         dbms_output.put_line(' campus=>'|| v_stu_rf_collection(i).campus_sid
          ||' stu=>'|| v_stu_rf_collection(i).student_sid
          ||' flag=>'|| v_stu_rf_collection(i).flag_date_sid
          ||' crf=>'|| v_stu_rf_collection(i).campus_risk_factor_sid
          ||' enddt=>'|| v_stu_rf_collection(i).end_date_sid
          ||' lst=>'|| v_stu_rf_collection(i).last_update
          ||' cnt=>'|| v_stu_rf_collection(i).risk_factor_count);
       end if;
       -- end debug code --
       if v_stu_rf_collection(i).campus_risk_factor_sid <> v_campus_rf_semester_sid then
         
         if i <> v_stu_rf_collection.first
           and v_stu_rf_collection(i).student_sid = v_stu_rf_collection(v_previous).student_sid then
           -- select from the date dim the number of academic days between the flag date of the 
           -- current row and the end date of the prior row.
           select count(school_day_indicator) 
           into v_number_of_days
           from date_dim
           where date_dim.date_sid > v_stu_rf_collection(v_previous).end_date_sid
             and date_dim.date_sid <= v_stu_rf_collection(i).flag_date_sid
             and date_dim.school_day_indicator = 'Instructional';
             
           if v_number_of_days = 1 then -- there is no gap between the flags so merge them
             -- set the end date of the previous row to the end date of the current row
             v_stu_rf_collection(v_previous).end_date_sid := v_stu_rf_collection(i).end_date_sid;
             -- delete the current row
             v_stu_rf_collection.DELETE(i);
           else -- there is a gap of more than one academic day so move up the previous flag and move on
                -- to the next record
             v_previous := i;
             n := n + 1;  -- n is the index for v_inserted list
             v_insert_list.EXTEND; -- add a new row to the inserted list
             v_insert_list(n) := i; -- add the index for the current row to the inserted list
           end if;
         else -- found a new student, set the previous index = to the current record and
              -- add it to the insert list
           v_previous := i; 
           n := n + 1;
           v_insert_list.EXTEND;
           v_insert_list(n) := i;
         end if;
       else -- found a semester attendance flag, add it to insert list
         n := n + 1; 
         v_insert_list.EXTEND;
         v_insert_list(n) := i;
       end if;
       
     end loop;    
   
   -- load data into student_risk_factor_fact table --
   -- Debug Code --
   if p_debug in ('D','TD','TDI') then
     dbms_output.put_line('********  Attendance RF output prior to insert ********');
   end if;
   if p_debug in ('D','TD','TDI') then
     for i in v_insert_list.first..v_insert_list.last
       loop
         dbms_output.put_line(' campus=>'|| v_stu_rf_collection(v_insert_list(i)).campus_sid
          ||' stu=>'|| v_stu_rf_collection(v_insert_list(i)).student_sid
          ||' flag=>'|| v_stu_rf_collection(v_insert_list(i)).flag_date_sid
          ||' crf=>'|| v_stu_rf_collection(v_insert_list(i)).campus_risk_factor_sid
          ||' enddt=>'|| v_stu_rf_collection(v_insert_list(i)).end_date_sid
          ||' lst=>'|| v_stu_rf_collection(v_insert_list(i)).last_update
          ||' cnt=>'|| v_stu_rf_collection(v_insert_list(i)).risk_factor_count);
       end loop;
   end if;
   -- end debug code --
       
   -- Insert the attendance risk factors into the risk factor fact table --    
   if v_insert_list.count > 0 then 
    forall i in values of v_insert_list
     insert into student_risk_factor_fact
         ( campus_sid
         , student_sid
         , flag_date_sid
         , campus_risk_factor_sid
         , end_date_sid
         , last_update
         , risk_factor_count)
     values
         (  v_stu_rf_collection(i).campus_sid
          , v_stu_rf_collection(i).student_sid
          , v_stu_rf_collection(i).flag_date_sid
          , v_stu_rf_collection(i).campus_risk_factor_sid
          , v_stu_rf_collection(i).end_date_sid
          , v_stu_rf_collection(i).last_update
          , v_stu_rf_collection(i).risk_factor_count);
    end if;
            
    
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_att_stu_rf_fact_refresh;

/*------------------------------------------------------------------------------
Procedure:           prc_delete_cohort_stu_rf_fact 
Purpose:             Deletes the cohort risk factor fact data for a campus for 
                     the specified school year from student_risk_factor_fact.
Input:               Campus_rf_sid - The risk factor sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date      Author       Remarks
20100914  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_cohort_stu_rf_fact (p_campus_rf_sid IN number, p_school_year IN varchar2, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_cohort_stu_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
   end if;
   -- delete rows --
   delete student_risk_factor_fact
   where student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_sid
   and student_risk_factor_fact.flag_date_sid in 
       (select date_sid from date_dim dateDimSub 
          where dateDimSub.school_year = p_school_year);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_cohort_stu_rf_fact;


/*------------------------------------------------------------------------------
Procedure:           prc_cohort_stu_rf_fact_refresh 
Purpose:             Translates student period absences that are greater than the 
                     threshold defined for the campus into student_risk_factor_fact
                     records.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_cohort_stu_rf_fact_refresh(p_district_sid IN number
                                    ,p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_campus_rf_sid IN number
                                    ,p_debug IN varchar2) is
     
    -- logging variables --                               
    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_cohort_stu_rf_fact_refresh';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    -- processing variables --
    v_rows_affected         number       := 0;
    j                       pls_integer  := 0;
    v_last_day_school_SID   date_dim.date_sid%TYPE;  -- date sid for the last day of school
    b_determine_end_date    boolean      := FALSE;
    -- exception variables -- 
    v_errcode               number;
    v_errmesg               varchar2(200);
    e_no_rows_found         exception;
    e_dws_district_error    exception;
    
    -- collection variables --
    TYPE r_student_cohort is RECORD ( 
         CampusSID            campus_dim.campus_sid%TYPE,
         StudentSID           student_dim.student_sid%TYPE,
         EntryDateSID         date_dim.date_sid%TYPE,
         WithdrawalDateSID    date_dim.date_sid%TYPE,
         CohortFlag           student_risk_factor_snapshot.cohort_flag%TYPE);
    TYPE t_student_cohort is table of r_student_cohort INDEX BY pls_integer;
    v_stu_cohort_collection t_student_cohort;
    
    TYPE t_student_rf_fact is table of student_risk_factor_fact%ROWTYPE;
    v_stu_rf_collection t_student_rf_fact := t_student_rf_fact();

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   -- Delete Prior data from Student_risk_factor_fact for this campus/school year --
   prc_delete_cohort_stu_rf_fact(p_campus_rf_sid,p_school_year,p_debug);
   
   -- Get the date sid for the last day of school --
   select date_dim.date_sid
    into v_last_day_school_SID
    from date_dim
    where date_dim.district_sid = p_district_sid
    and date_dim.school_year = p_school_year
    and date_dim.semester = 2
    and date_dim.last_day_semester = 'Yes';
   
   -- collect students and their cohort flags based on enrollment grade levels   -- 
    select distinct
     student_enrollment_fact.campus_sid
     ,student_enrollment_fact.student_sid
     ,student_enrollment_fact.entry_date_sid
     ,student_enrollment_fact.withdrawal_date_sid
     , case 
         when grade_level_dim.grade_level <
           (12 - (to_number(student_dim.ninth_grade_cohort) - to_number(date_dim.school_year))) then 'Yes'
         else 'No'
       end as Cohort_flag
     bulk collect into v_stu_cohort_collection
     from student_enrollment_fact 
     join grade_level_dim on grade_level_dim.grade_level_sid = student_enrollment_fact.grade_level_sid
     join student_dim on student_dim.student_sid = student_enrollment_fact.student_sid
     join date_dim on date_dim.date_sid = student_enrollment_fact.entry_date_sid
     where REGEXP_LIKE (trim(student_dim.ninth_grade_cohort), '^[0-9]*$')
     and student_enrollment_fact.campus_sid = p_campus_sid
     and date_dim.school_year = p_school_year
     and grade_level_dim.grade_level between '09' and '12'
     order by   student_enrollment_fact.campus_sid
               ,student_enrollment_fact.student_sid
               ,student_enrollment_fact.entry_date_sid;
   
   if v_stu_cohort_collection.count = 0 then 
     raise e_no_rows_found;
   end if;   

   -- process rows to find students with the cohort flag --
   for i in v_stu_cohort_collection.first..v_stu_cohort_collection.last
     loop   
       -- debug code --
       if p_debug in ('D','TD','TDI') then
         dbms_output.put_line('cmp==>'||v_stu_cohort_collection(i).CampusSID
              ||' stu==>'||v_stu_cohort_collection(i).StudentSID
              ||' Ed==>'||v_stu_cohort_collection(i).EntryDateSID
              ||' Wd==>'||v_stu_cohort_collection(i).WithdrawalDateSID
              ||' cf==>'||v_stu_cohort_collection(i).CohortFlag);  
       end if;
       -- end debug code --
       -- if the CohortFlag = Yes and b_determine_end_date is False then we have a new
       -- student to process so add the risk factor to the v_stu_rf_collection.
       if v_stu_cohort_collection(i).CohortFlag = 'Yes'
          and NOT b_determine_end_date  then
         v_stu_rf_collection.extend;
         j := j + 1;  -- j is the index for the student risk factor collection and is mananged manually
         v_stu_rf_collection(j).campus_sid := v_stu_cohort_collection(i).CampusSID;
         v_stu_rf_collection(j).student_sid := v_stu_cohort_collection(i).StudentSID;
         v_stu_rf_collection(j).flag_date_sid := v_stu_cohort_collection(i).EntryDateSID; 
         v_stu_rf_collection(j).campus_risk_factor_sid := p_campus_rf_sid;
         v_stu_rf_collection(j).last_update := systimestamp;
         v_stu_rf_collection(j).risk_factor_count := 1;       
         
         if i = v_stu_cohort_collection.last then
           -- this is the last record in the collection therefore we need to set the flag end date 
           -- to the lesser of the withdrawal date, p_run_date, or the last day of school.
           if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
              if v_stu_cohort_collection(i).WithdrawalDateSID <= p_run_date_sid then
                 v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
              elsif p_run_date_sid <= v_last_day_school_SID then
                 v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
              else 
                 v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
              end if;
            else 
               -- the withdrawal date is null which means the student is still enrolled therefore
               -- use the lessor of the p_run_date_sid or the last day of school.
               if p_run_date_sid <= v_last_day_school_SID then
                  v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
               else 
                 v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
               end if;
             end if;
           exit; -- exit the loop now as no further porcessing is needed.
         end if;
         
         if (v_stu_cohort_collection(i).StudentSID =  v_stu_cohort_collection(i+1).StudentSID
             and v_stu_cohort_collection(i+1).CohortFlag = 'No') then
             -- the next record is for the same student but the cohort flag ends as of the 
             -- withdrawal date of the current record.
             if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
               v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
             else -- for some reason the withdrawal date is null so use the entry date of the next enrollment
               v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i+1).EntryDateSID;
             end if;
         elsif v_stu_cohort_collection(i).StudentSID =  v_stu_cohort_collection(i+1).StudentSID then
             -- the next record is for the same student but the cohort flag is Yes so we need to 
             -- determine if there is a gap in the enrollment of more than 1 day.  If the gap is 
             -- greater than 1 day we need to determine the end date and treat the next record like a
             -- new risk factor transaction.  Otherwise assume it is a status change enrollment record and
             -- continue iterating through the records to determine the end date of the risk factor that
             -- we created for the current student.
             if (to_date(substr(v_stu_cohort_collection(i+1).EntryDateSID,-8,8),'YYYYMMDD') - 
               to_date(substr(v_stu_cohort_collection(i).WithdrawalDateSID ,-8,8),'YYYYMMDD')) <= 1          
              then
               b_determine_end_date := TRUE; -- process the next record to determine the end date
             else -- There is a gap in the students enrollment > than 1 day, set the end date for this RF transaction
               if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
                 v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
               else -- for some reason the withdrawal date is null so use the entry date of the next enrollment
                 v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i+1).EntryDateSID;
               end if;
               b_determine_end_date := FALSE; -- create a new rf transaction for the next record
             end if;
         elsif v_stu_cohort_collection(i).StudentSID <>  v_stu_cohort_collection(i+1).StudentSID then
             -- the next record is for a different student therefore we need to set the flag end date 
             -- to the lesser of the withdrawal date, p_run_date, or the last day of school.
             if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
               if v_stu_cohort_collection(i).WithdrawalDateSID <= p_run_date_sid then
                  v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
               elsif p_run_date_sid <= v_last_day_school_SID then
                  v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
               else 
                  v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
               end if;
             else 
                -- the withdrawal date is null which means the student is still enrolled therefore
                -- use the lessor of the p_run_date_sid or the last day of school.
                if p_run_date_sid <= v_last_day_school_SID then
                  v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
                else 
                  v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
                end if;
             end if;
             b_determine_end_date := FALSE; -- reset flag to process the next student
         end if; 
       
       else
         if b_determine_end_date then 
           if (v_stu_cohort_collection(i).StudentSID =  v_stu_cohort_collection(i+1).StudentSID
               and v_stu_cohort_collection(i+1).CohortFlag = 'No') then
               -- the next record is for the same student but the cohort flag ends as of the 
               -- withdrawal date of the current record.
               if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
                 v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
               else -- for some reason the withdrawal date is null so use the entry date of the next enrollment
                 v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i+1).EntryDateSID;
               end if;
           elsif v_stu_cohort_collection(i).StudentSID <>  v_stu_cohort_collection(i+1).StudentSID then
               -- the next record is for a different student therefore we need to set the flag end date 
               -- to the lesser of the withdrawal date, p_run_date, or the last day of school.
               if v_stu_cohort_collection(i).WithdrawalDateSID is not null then
                 if v_stu_cohort_collection(i).WithdrawalDateSID <= p_run_date_sid then
                    v_stu_rf_collection(j).end_date_sid := v_stu_cohort_collection(i).WithdrawalDateSID;
                 elsif p_run_date_sid <= v_last_day_school_SID then
                    v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
                 else 
                    v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
                 end if;
               else 
                  -- the withdrawal date is null which means the student is still enrolled therefore
                  -- use the lessor of the p_run_date_sid or the last day of school.
                  if p_run_date_sid <= v_last_day_school_SID then
                    v_stu_rf_collection(j).end_date_sid := p_run_date_sid;
                  else 
                    v_stu_rf_collection(j).end_date_sid := v_last_day_school_SID;
                  end if;
               end if;
    
               b_determine_end_date := FALSE; -- reset flag to process the next student
           end if; 
         end if;
       end if;
       
     end loop;
 
   -- load data into student_risk_factor_fact table --
   if v_stu_rf_collection.count > 0 then 

   
      for i in v_stu_rf_collection.first..v_stu_rf_collection.last
         loop
          if p_debug in ('D','TD','TDI') then
             dbms_output.put_line('cmp==>'||v_stu_rf_collection(i).campus_sid
                  ||' stu==>'||v_stu_rf_collection(i).student_sid
                  ||' flag==>'||v_stu_rf_collection(i).flag_date_sid
                  ||' end==>'||v_stu_rf_collection(i).end_date_sid
                  ||' crf==>'||v_stu_rf_collection(i).campus_risk_factor_sid
                  ||' lud==>'||v_stu_rf_collection(i).last_update
                  ||' cnt==>'||v_stu_rf_collection(i).risk_factor_count);  
           end if;
         
           insert into student_risk_factor_fact
             ( campus_sid
             , student_sid
             , flag_date_sid
             , campus_risk_factor_sid
             , end_date_sid
             , last_update
             , risk_factor_count)
           values
             (  v_stu_rf_collection(i).campus_sid
              , v_stu_rf_collection(i).student_sid
              , v_stu_rf_collection(i).flag_date_sid
              , v_stu_rf_collection(i).campus_risk_factor_sid
              , v_stu_rf_collection(i).end_date_sid
              , v_stu_rf_collection(i).last_update
              , v_stu_rf_collection(i).risk_factor_count);
         end loop;
   else
     if p_debug in ('I','TI','TDI') then
     	v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'Found Students but none were flagged for this campus.';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
     end if;
   end if;    
             
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_cohort_stu_rf_fact_refresh;


/*------------------------------------------------------------------------------
Procedure:           prc_delete_def_cr_stu_rf_fact 
Purpose:             Deletes the Deficient Credit risk factor fact data for a campus for 
                     the specified school year from student_risk_factor_fact.
Input:               Campus_rf_sid - The risk factor sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date      Author       Remarks
20100914  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_def_cr_stu_rf_fact (p_campus_rf_sid IN number, p_school_year IN varchar2, p_run_date_sid IN number, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_def_cr_stu_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- delete rows --
   delete student_risk_factor_fact
   where student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_sid
   and student_risk_factor_fact.end_date_sid > p_run_date_sid
   and student_risk_factor_fact.flag_date_sid in 
       (select date_sid from date_dim dateDimSub 
          where dateDimSub.school_year = p_school_year);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_def_cr_stu_rf_fact;

/*------------------------------------------------------------------------------
Procedure:           prc_def_cr_stu_rf_fact_refresh 
Purpose:             Identifies students that have not earned sufficent course credits 
                     based on the number of semester complete since they entered the ninth
                     grade.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
10/01/12  C.Bull       changed the school year portion to determine if run date is beyond end of school year
                       instead of sysdate. was a problem for running the engine for prior periods.
01/22/13  C.Bull       Update flag and end date sql to be <= because it failed to pull correct date on the
                       first day of the second semester.
--------------------------------------------------------------------------------*/
PROCEDURE prc_def_cr_stu_rf_fact_refresh(p_district_sid IN number
                                    ,p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_campus_rf_sid IN number
                                    ,p_debug IN varchar2) is
     
    -- logging variables --                               
    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_def_cr_stu_rf_fact_refresh';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    -- processing variables --
    v_rows_affected            number       := 0;
    v_flag_date_sid            number       := 0;
    v_end_date_sid             number       := 0;
    v_student_rf_end_date_sid  number       := 0;
    v_semester                varchar2(1)     := '';
    -- exception variables -- 
    v_errcode               number;
    v_errmesg               varchar2(200);
    e_no_rows_found         exception;
    e_dws_district_error    exception;
    
    -- collection variables --
    TYPE t_index_pointer IS TABLE OF PLS_INTEGER;
    v_update_list t_index_pointer := t_index_pointer();
    v_insert_list t_index_pointer := t_index_pointer();
    
    TYPE t_student_list is table of student_dim.student_sid%TYPE INDEX BY pls_integer;
    v_stu_list_collection t_student_list;
    
    TYPE t_student_rf_fact is table of student_risk_factor_fact%ROWTYPE;
    v_stu_rf_collection t_student_rf_fact := t_student_rf_fact();
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
   zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- Delete Prior data from Student_risk_factor_fact for this campus, school year and
   -- where the end_date sid is greater than the run_date_sid.
   prc_delete_def_cr_stu_rf_fact(p_campus_rf_sid,p_school_year,p_run_date_sid,p_debug);
   
   -- based on the run date pull the current or most recently completed semester --
   
   select max(date_dim.semester) as semester
   into v_semester
   from date_dim
   where date_dim.school_year = p_school_year
     and date_dim.date_sid <= p_run_date_sid
     and district_sid = p_district_sid;
   
   -- collect currently enrolled students for this campus with less than -- 
   -- 3 credits earned per semester based on grade level--
   -- 10/01/12 changed the school year portion to determine if run date is beyond end of school year
   -- instead of sysdate. was a problem for running the engine for prior periods.
  select -- produce list of only student sids who are deficient
   student_sid
   bulk collect into v_stu_list_collection
   from (
    select -- determine deficent credits
     def_credits.student_sid
    ,def_credits.grade_level
    ,def_credits.total_student_credits
    ,def_credits.end_of_year
    ,case 
       when grade_level = '09' and v_semester = '2' and to_number(def_credits.end_of_year) = -99 and def_credits.total_student_credits < 3 Then 'Yes'
       when grade_level = '09' and v_semester = '2' and to_number(def_credits.end_of_year) = 100 and def_credits.total_student_credits < 6 Then 'Yes'
       when grade_level = '10' and v_semester = '1' and def_credits.total_student_credits  < 6   Then 'Yes'
       when grade_level = '10' and v_semester = '2' and to_number(def_credits.end_of_year) = -99 and def_credits.total_student_credits < 9 Then 'Yes'
       when grade_level = '10' and v_semester = '2' and to_number(def_credits.end_of_year) = 100 and def_credits.total_student_credits < 12 Then 'Yes'
       when grade_level = '11' and v_semester = '1' and def_credits.total_student_credits  < 12  Then 'Yes'
       when grade_level = '11' and v_semester = '2' and to_number(def_credits.end_of_year) = -99 and def_credits.total_student_credits < 15 Then 'Yes'
       when grade_level = '11' and v_semester = '2' and to_number(def_credits.end_of_year) = 100 and def_credits.total_student_credits < 18 Then 'Yes'
       when grade_level = '12' and v_semester = '1' and def_credits.total_student_credits  < 18  Then 'Yes'
       when grade_level = '12' and v_semester = '2' and to_number(def_credits.end_of_year) = -99 and def_credits.total_student_credits < 21 Then 'Yes'
       when grade_level = '12' and v_semester = '2' and to_number(def_credits.end_of_year) = 100 and def_credits.total_student_credits < 24 Then 'Yes'
       Else 'No' end as def_credit_flag
       ,case 
       when grade_level = '09'  and v_semester = 2 and to_number(def_credits.end_of_year) = -99 Then 3
       when grade_level = '09'  and v_semester = 2 and to_number(def_credits.end_of_year) = 100 Then 6
       when grade_level = '10'  and v_semester = '1' Then 6
       when grade_level = '10'  and v_semester = 2 and to_number(def_credits.end_of_year) = -99 Then 9
       when grade_level = '10'  and v_semester = 2 and to_number(def_credits.end_of_year) = 100 Then 12
       when grade_level = '11'  and v_semester = '1' Then 12
       when grade_level = '11'  and v_semester = 2 and to_number(def_credits.end_of_year) = -99 Then 15
       when grade_level = '11'  and v_semester = 2 and to_number(def_credits.end_of_year) = 100 Then 18
       when grade_level = '12'  and v_semester = '1' Then 18
       when grade_level = '12'  and v_semester = 2 and to_number(def_credits.end_of_year) = -99 Then 21
       when grade_level = '12'  and v_semester = 2 and to_number(def_credits.end_of_year) = 100 Then 24
       Else 0
    End as requiredCredits
    from (
    select -- sum total credits,  --
     total_credits.student_sid
    ,total_credits.grade_level
    ,total_credits.end_of_year
    ,sum(total_credits.credits_earned) as total_student_credits
    from (
      Select -- collect student credits --
      enrolled_student.student_sid
      ,enrolled_student.grade_level
      ,student_credit_fact.credits_earned
      ,school_year.end_of_year
      from (select student_enrollment_fact.student_sid -- select all students currently enrolled as of a school year and date --
            ,grade_level_dim.grade_level
            from student_enrollment_fact 
            join grade_level_dim on grade_level_dim.grade_level_sid = student_enrollment_fact.grade_level_sid
            join date_dim date_dim_whd on date_dim_whd.date_sid = nvl(student_enrollment_fact.withdrawal_date_sid, p_run_date_sid)
            join date_dim date_dim_entry on date_dim_entry.date_sid = student_enrollment_fact.entry_date_sid
                                         and date_dim_entry.school_year = p_school_year
            where student_enrollment_fact.campus_sid =  p_campus_sid
            and p_run_date_sid >= student_enrollment_fact.entry_date_sid
            and (p_run_date_sid < nvl(student_enrollment_fact.withdrawal_date_sid,p_run_date_sid+1)
            or (p_run_date_sid <= nvl(student_enrollment_fact.withdrawal_date_sid,p_run_date_sid)
            and date_dim_whd.semester = '2' 
            and date_dim_whd.last_day_semester = 'Yes'))) enrolled_student
      join student_credit_fact on student_credit_fact.student_sid = enrolled_student.student_sid
      join date_dim on date_dim.date_sid = student_credit_fact.date_sid 
                   and date_dim.school_year <= p_school_year
      join (select district_sid  -- determine if the run date is beyond the end of the school year
            ,date_id
            ,case
            when trunc(to_date(substr(p_run_date_sid,-8,8),'YYYYMMDD')) > date_dim.date_id then 100
            else -99
            end as end_of_year
            from date_dim
            where date_dim.school_year = case
                                          when to_char(to_date(substr(p_run_date_sid,-8,8),'YYYYMMDD'),'MM')<08 then substr(p_run_date_sid,-8,4)
                                          else to_char(to_number(substr(p_run_date_sid,-8,4))+1)
                                          end
               and date_dim.last_day_semester = 'Yes'
               and date_dim.semester = '2') school_year
             on school_year.district_sid = replace(student_credit_fact.date_sid,substr(student_credit_fact.date_sid,-8))
      where enrolled_student.student_sid <> -1
        and student_credit_fact.credits_earned <> 0
       ) total_credits
      group by   total_credits.student_sid
                 ,total_credits.grade_level
                 ,total_credits.end_of_year
      ) def_credits
    )final
   where def_credit_flag = 'Yes';
   
   if v_stu_list_collection.count = 0 then 
     raise e_no_rows_found;
   end if;   
   
   -- determine flag and end date sids --
   -- Based on the run date, determine the first day of the current/last completed semester for the flag date --
   -- Based on the run date, Use the run date for the end date unless it falls outside of the semester then use 
   -- the end date of the last completed semester.
   -- the first day of the current/last semester --
   select date_sid
   into v_flag_date_sid
   from date_dim
   where date_dim.district_sid = p_district_sid
     and date_dim.school_year = p_school_year
     and date_dim.first_day_semester = 'Yes'
     and date_dim.semester = 
         (select max(semester)
          from date_dim
           where date_dim.district_sid = p_district_sid
            and date_dim.school_year = p_school_year
             and date_dim.date_sid <= p_run_date_sid);
   -- the last day of the current/last semester -- 
   select date_sid
   into v_end_date_sid
   from date_dim
   where date_dim.district_sid = p_district_sid
     and date_dim.school_year = p_school_year
     and date_dim.last_day_semester = 'Yes'
     and date_dim.semester = 
         (select max(semester)
          from date_dim
           where date_dim.district_sid = p_district_sid
            and date_dim.school_year = p_school_year
             and date_dim.date_sid <= p_run_date_sid);
   
   if v_end_date_sid > p_run_date_sid then
     v_end_date_sid := p_run_date_sid; -- use the run date if before the end of the semester --
   end if;

   if p_debug in ('D','TD','TDI') then
         dbms_output.put_line('Deficient Credits Proc List');
   end if;
       
   -- process rows to build student risk factor facts for each student with deficient credits --
   for i in v_stu_list_collection.first..v_stu_list_collection.last
     loop   
       if p_debug in ('D','TD','TDI') then
         dbms_output.put_line(' camp==>'||p_campus_sid||
                             ' stu==>'||v_stu_list_collection(i)||
                             ' fd==>'||v_flag_date_sid||
                             ' fd==>'||v_end_date_sid||
                             ' fd==>'||p_campus_rf_sid);
       end if;
       -- end debug code -- 
       v_stu_rf_collection.extend;
       v_stu_rf_collection(i).campus_sid := p_campus_sid;
       v_stu_rf_collection(i).student_sid := v_stu_list_collection(i);
       v_stu_rf_collection(i).flag_date_sid := v_flag_date_sid; 
       v_stu_rf_collection(i).end_date_sid := v_end_date_sid;
       v_stu_rf_collection(i).campus_risk_factor_sid := p_campus_rf_sid;
       v_stu_rf_collection(i).last_update := systimestamp;
       v_stu_rf_collection(i).risk_factor_count := 1;       

       -- check to see if record already exists in student risk factor fact
       -- if it does then add index to update list else add index to insert list
       -- these lists of pointers will be used in the forall statments.
       begin
         select student_risk_factor_fact.end_date_sid
         into v_student_rf_end_date_sid
         from student_risk_factor_fact
         where student_risk_factor_fact.student_sid = v_stu_list_collection(i)
           and student_risk_factor_fact.campus_sid = p_campus_sid
           and student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_sid
           and student_risk_factor_fact.flag_date_sid = v_flag_date_sid;
         -- the record already exist so add a pointer to the update list so that
         -- the end date can be updated unless the end date is already the same then do nothing.
         if v_student_rf_end_date_sid <> v_end_date_sid then
           v_update_list.extend;
           v_update_list(v_update_list.last) := i;
         end if;

         exception
           when no_data_found then
             -- the record was not found so we need to add the pointer to the insert
             -- list.
             v_insert_list.extend; 
             v_insert_list(v_insert_list.last) := i;
       end;

     end loop;

   -- update defiecient credit records in student_risk_factor_fact table --
   if v_update_list.count > 0 then 
      forall i in values of v_update_list
           update student_risk_factor_fact
             set student_risk_factor_fact.end_date_sid = v_stu_rf_collection(i).end_date_sid
            where student_risk_factor_fact.campus_sid = v_stu_rf_collection(i).campus_sid
             and student_risk_factor_fact.student_sid = v_stu_rf_collection(i).student_sid
             and student_risk_factor_fact.flag_date_sid = v_stu_rf_collection(i).flag_date_sid
             and student_risk_factor_fact.campus_risk_factor_sid = v_stu_rf_collection(i).campus_risk_factor_sid;

      v_rows_affected := v_rows_affected + SQL%ROWCOUNT;
   end if;
   
   -- insert new defiecient credit records into student_risk_factor_fact table --
   if v_insert_list.count > 0 then 
      forall i in values of v_insert_list
           insert into student_risk_factor_fact
             ( campus_sid
             , student_sid
             , flag_date_sid
             , campus_risk_factor_sid
             , end_date_sid
             , last_update
             , risk_factor_count)
           values
             (  v_stu_rf_collection(i).campus_sid
              , v_stu_rf_collection(i).student_sid
              , v_stu_rf_collection(i).flag_date_sid
              , v_stu_rf_collection(i).campus_risk_factor_sid
              , v_stu_rf_collection(i).end_date_sid
              , v_stu_rf_collection(i).last_update
              , v_stu_rf_collection(i).risk_factor_count);
              
      v_rows_affected := v_rows_affected + SQL%ROWCOUNT;
   end if;    
 
   commit; -- the forall seems to need an explicit commit.
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Stopped',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_def_cr_stu_rf_fact_refresh;

/*------------------------------------------------------------------------------
Procedure:           prc_delete_core_crs_rf_fact 
Purpose:             Deletes the non-core/core course and semester non-core/core course risk factor 
                     fact data for a campus for the specified school year from 
                     student_risk_factor_fact.
Input:               Campus_sid - The sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date        Author       Remarks
2011-01-13  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_core_crs_rf_fact (p_campus_rf_sid IN number, p_school_year IN varchar2, p_campus_rf_semester_sid IN number, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_core_crs_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
   end if;
   -- delete rows --
   delete student_risk_factor_fact
   where (student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_sid
          or student_risk_factor_fact.campus_risk_factor_sid = p_campus_rf_semester_sid)
   and student_risk_factor_fact.flag_date_sid in 
       (select date_sid from date_dim dateDimSub 
          where dateDimSub.school_year = p_school_year);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_core_crs_rf_fact;


/*------------------------------------------------------------------------------
Procedure:           prc_core_crs_rf_refresh 
Purpose:             Translates student Marking Period and Semester failing grades into  
                     student_risk_factor_facts.  For either Core Course Failures or 
                     Semester Core Courses Failures.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
20111110  c.Bull       Added "and student_grade_fact.student_sid > 0" to the sql
                       that pulls the main data to prevent the pulling of data for
                       the "unknown" student record.
--------------------------------------------------------------------------------*/
PROCEDURE prc_core_crs_rf_refresh(p_district_sid IN number
                                    ,p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_passing_grade_threshold IN number
                                    ,p_campus_rf_sid IN number
                                    ,p_debug IN varchar2) is
                                    
    v_proc_name                     varchar2(100)  := 'pkg_risk_calculation_engine.prc_core_crs_rf_refresh';
    v_start_datetime                timestamp      := SYSTIMESTAMP;
    v_end_datetime                  timestamp      := SYSTIMESTAMP;
    v_rows_affected                 number         := 0;
    v_2nd_sem_flag_end_date_sid     number         := 0; -- date sid for the end of the second semester flag
    v_1st_sem_flag_end_date_sid     number         := 0; -- date sid for the end of the first semester flag
    v_campus_rf_semester_sid        number         := 0;
    v_last_day_1st_semester         number         := 0;
    v_last_day_2nd_semester         number         := 0;
    v_default_grading_cycle         campus_dim.default_grading_cycle%TYPE;

    -- exception variables
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;
    
    -- collections
    TYPE r_date_dim is RECORD ( 
         dateSID              date_dim.date_sid%TYPE,
         EndSixWeeksFlag      date_dim.last_day_academic_6_weeks%TYPE,
         EndNineWeeksFlag     date_dim.last_day_academic_9_weeks%TYPE,
         EndSemesterFlag      date_dim.last_day_semester%TYPE,
         Semester             date_dim.semester%TYPE);
    TYPE t_date_type is table of r_date_dim INDEX BY pls_integer;
    v_date_collection t_date_type;
    
    TYPE r_student_rf_fact is RECORD (
         campus_sid                  student_risk_factor_fact.campus_sid%TYPE,
         student_sid                 student_risk_factor_fact.student_sid%TYPE,
         flag_date_sid               student_risk_factor_fact.flag_date_sid%TYPE,
         campus_risk_factor_sid      student_risk_factor_fact.campus_risk_factor_sid%TYPE,
         end_date_sid                student_risk_factor_fact.end_date_sid%TYPE,
         risk_factor_count           student_risk_factor_fact.risk_factor_count%TYPE);
    TYPE t_student_rf_fact is table of r_student_rf_fact INDEX BY pls_integer;
    v_stu_rf_collection t_student_rf_fact;
    
    TYPE t_end_date is table of number INDEX BY pls_integer;
    v_6wks_end_date_array t_end_date;
    v_9wks_end_date_array t_end_date;
    v_6weeks_end_date pls_integer := 0;
    v_9weeks_end_date pls_integer := 0;
    v_first_time_6wks boolean := True;
    v_first_time_9wks boolean := True;
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select 
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from dws.campus_risk_factor_dim
      join dws.campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
           and campus_dim.campus_sid = p_campus_sid
      where campus_risk_factor_dim.risk_factor_name = 'Semester Core Course Failure';   
     exception
      when no_data_found then
       v_campus_rf_semester_sid := p_campus_rf_sid; -- set to 'Attendance' campus_risk_factor_dim member
   end; 

   -- Delete Prior data from Student_risk_factor_fact for this campus/school year --
   prc_delete_core_crs_rf_fact(p_campus_rf_sid,p_school_year,v_campus_rf_semester_sid,p_debug);
  
   -- collect date records where last day of the period, i.e. 6 weeks, equals 'Yes' for the run date school year that was passed in as a parm --
   select 
     date_dim.date_sid 
     ,date_dim.last_day_academic_6_weeks
     ,date_dim.last_day_academic_9_weeks
     ,date_dim.last_day_semester
     ,date_dim.semester
   bulk collect into v_date_collection
   from dws.date_dim 
   where date_dim.school_year = p_school_year 
         and date_dim.school_day_indicator = 'Instructional'
         and district_sid = p_district_sid
   order by date_dim.date_sid;
   
   if p_debug in ('D','TD','TDI') then
      DBMS_Output.PUT_LINE('Core:number of date_dim rows returned: '||v_date_collection.count);
   end if;
   
   -- set grade cycle array and 1st semester end date variable --
   for i in v_date_collection.first..v_date_collection.last
     loop 
       if v_date_collection(i).EndSixWeeksFlag = 'Yes' then
         if not v_first_time_6wks then
           v_6wks_end_date_array(v_6weeks_end_date) := v_date_collection(i-1).dateSid;
           v_6weeks_end_date  := v_date_collection(i).dateSid;
           
           if v_date_collection(i).EndSemesterFlag = 'Yes' then
             v_6weeks_end_date  := v_date_collection(i).dateSid;
             v_6wks_end_date_array(v_6weeks_end_date) := v_date_collection(i).dateSid;
             v_first_time_6wks := True;
           end if;
         else 
           v_6weeks_end_date  := v_date_collection(i).dateSid;
           v_first_time_6wks := false;
         end if;
         
         if not v_first_time_9wks then
           v_9wks_end_date_array(v_9weeks_end_date) := v_date_collection(i-1).dateSid;
            v_9weeks_end_date := v_date_collection(i).dateSid;
         else 
           v_9weeks_end_date  := v_date_collection(i).dateSid;
           v_first_time_9wks := false;
         end if;
       end if;
      
       if  v_date_collection(i).EndSemesterFlag = 'Yes' then
         if v_date_collection(i).Semester = '1' then
           v_last_day_1st_semester := v_date_collection(i).dateSid;
         elsif v_date_collection(i).Semester = '2' then 
           v_last_day_2nd_semester := v_date_collection(i).dateSid;
           v_1st_sem_flag_end_date_sid := v_date_collection(i-1).dateSid; -- set variable to the date_sid for day before the end of semester 2
         end if;
       end if;
     end loop;
   
   -- determine semester 2 flag end date --
   -- Semester 2 end date should be set to the day before the end of semester 1
   -- of the next school year.
   -- if the date_dim does not contain data for the next school year then set 
   -- the semester 2 end date to the max date of 12/31/2999.
      select nvl(max(date_dim.date_sid),p_district_sid || '29991231')
        into v_2nd_sem_flag_end_date_sid
        from date_dim
        where date_dim.district_sid = p_district_sid
          and date_dim.school_year = p_school_year + 1
          and date_dim.semester = '1'
          and date_dim.date_id < 
              (Select dd.date_id from date_dim dd
                where dd.district_sid = p_district_sid
                  and dd.school_year = p_school_year + 1
                  and dd.semester = '1' 
                  and dd.last_day_semester = 'Yes');
   
   -- collect the student risk factor facts without end dates    -- 
   -- that are below the campus passing grade threshold          --
    select distinct
       Stu_grades.campus_sid
      ,Stu_grades.student_sid
      ,Stu_grades.flag_date_sid
      ,campus_risk_factor_dim.campus_risk_factor_sid
      ,Stu_grades.end_date_sid
      ,Stu_grades.risk_factor_count
    bulk collect into v_stu_rf_collection
    from (
      select student_grade_fact.campus_sid
        , student_grade_fact.student_sid
        , grade_type_dim.grade_type
        , case 
          when course_section_dim.core_course_flag = 'Yes' then 'Yes'
          when state_course_dim.core_course_flag = 'Yes' then 'Yes'
          else 'No'
          end as core_course_flag
        ,student_grade_fact.date_sid as flag_date_sid
        ,null as end_date_sid
        , 1 as risk_factor_count   
        , student_grade_fact.number_grade
      from student_grade_fact
      join grade_type_dim on grade_type_dim.grade_type_sid = student_grade_fact.grade_type_sid
      join course_section_dim on course_section_dim.course_section_sid = student_grade_fact.course_section_sid
      join state_course_dim on state_course_dim.state_course_sid = student_grade_fact.state_course_sid
      join date_dim on date_dim.date_sid = student_grade_fact.date_sid 
                    and date_dim.school_year = p_school_year
      where grade_type_dim.grade_type in ('MARKING PERIOD','SEMESTER') 
            and student_grade_fact.number_grade < p_passing_grade_threshold
            and student_grade_fact.campus_sid = p_campus_sid
            and student_grade_fact.date_sid <= p_run_date_sid
            and student_grade_fact.student_sid > 0
      ) Stu_grades
    join campus_dim on campus_dim.campus_sid = Stu_grades.campus_sid 
    join campus_risk_factor_dim on campus_risk_factor_dim.campus_id = campus_dim.campus_id 
         and campus_risk_factor_dim.risk_factor_name =
         case 
             when Stu_grades.grade_type = 'MARKING PERIOD' and Stu_grades.core_course_flag = 'Yes' then 'Core Course Failure'
             when Stu_grades.grade_type = 'SEMESTER' and Stu_grades.core_course_flag = 'Yes' then 'Semester Core Course Failure'     
         end
    order by Stu_grades.student_sid,Stu_grades.flag_date_sid;   
     
     if v_stu_rf_collection.count = 0 then 
       raise e_no_rows_found;
     end if;   
   
   -- Retrieve the campus default grading cycle
   select campus_dim.default_grading_cycle
   into v_default_grading_cycle
   from campus_dim
   where campus_dim.campus_sid = p_campus_sid;
      
   -- We already constructed the student risk factor facts in the above sql. 
   -- Now we need to assign the end_date_sid.
   for i in v_stu_rf_collection.first..v_stu_rf_collection.last
     loop   
       -- -------------------
       -- Assign end date --
       -- -------------------
       -- ASSUMPTION: The flag date matches the end of a grade cycle or semester and the 
       -- proper flags have been set in the date_dim for these days.
       -- the v_6wks_end_date_array/v_9wks_end_date_array is an associative array where the period
       -- end date is the key and the value is the end date.  If a key match fails then the end date
       -- will be set to the flag date because the program does not now how to handle it as the assumption
       -- will have been violated. 
       if  p_campus_rf_sid = v_stu_rf_collection(i).campus_risk_factor_sid then
          if  v_default_grading_cycle = '6-Weeks' or v_default_grading_cycle is null then
            begin
              v_stu_rf_collection(i).end_date_sid := v_6wks_end_date_array(v_stu_rf_collection(i).flag_date_sid);
              exception
                when no_data_found then
                  v_stu_rf_collection(i).end_date_sid := v_stu_rf_collection(i).flag_date_sid;
                  if p_debug in ('D','TD','TDI') then
                     DBMS_Output.PUT_LINE('Core: Not in array ');
                  end if;
            end;
          elsif v_default_grading_cycle = '9-Weeks' Then
            begin
              v_stu_rf_collection(i).end_date_sid := v_9wks_end_date_array(v_stu_rf_collection(i).flag_date_sid);
              exception
                when no_data_found then
                  v_stu_rf_collection(i).end_date_sid := v_stu_rf_collection(i).flag_date_sid;
                  if p_debug in ('D','TD','TDI') then
                     DBMS_Output.PUT_LINE('Core: Not in array ');
                  end if;
            end;
        end if;
       elsif v_campus_rf_semester_sid = v_stu_rf_collection(i).campus_risk_factor_sid then
         if v_stu_rf_collection(i).flag_date_sid = v_last_day_1st_semester then
            v_stu_rf_collection(i).end_date_sid := v_1st_sem_flag_end_date_sid;
         elsif v_stu_rf_collection(i).flag_date_sid = v_last_day_2nd_semester then
            v_stu_rf_collection(i).end_date_sid := v_2nd_sem_flag_end_date_sid;
         end if;
       end if;                 
     end loop;
 
   -- load data into student_risk_factor_fact table --
   for i in v_stu_rf_collection.first..v_stu_rf_collection.last
     loop
       -- Debug Code --
       if p_debug in ('D','TD','TDI') then
         dbms_output.put_line('Core: campus=>'|| v_stu_rf_collection(i).campus_sid
          ||' stu=>'|| v_stu_rf_collection(i).student_sid
          ||' flag=>'|| v_stu_rf_collection(i).flag_date_sid
          ||' crf=>'|| v_stu_rf_collection(i).campus_risk_factor_sid
          ||' enddt=>'|| v_stu_rf_collection(i).end_date_sid
          ||' cnt=>'|| v_stu_rf_collection(i).risk_factor_count);
       end if;
       -- end debug code --
     
       insert into student_risk_factor_fact
         ( campus_sid
         , student_sid
         , flag_date_sid
         , campus_risk_factor_sid
         , end_date_sid
         , last_update
         , risk_factor_count)
       values
         (  v_stu_rf_collection(i).campus_sid
          , v_stu_rf_collection(i).student_sid
          , v_stu_rf_collection(i).flag_date_sid
          , v_stu_rf_collection(i).campus_risk_factor_sid
          , v_stu_rf_collection(i).end_date_sid
          , systimestamp
          , v_stu_rf_collection(i).risk_factor_count);
     end loop;
            
    
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_core_crs_rf_refresh;

/*------------------------------------------------------------------------------
Procedure:           prc_non_core_crs_rf_refresh 
Purpose:             Translates student Marking Period and Semester failing grades into  
                     student_risk_factor_facts.  For either Non-Core Course Failures or 
                     Semester Non-Core Courses Failures.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100902  C.Bull       Original version
20111110  c.Bull       Added "and student_grade_fact.student_sid > 0" to the sql
                       that pulls the main data to prevent the pulling of data for
                       the "unknown" student record.
--------------------------------------------------------------------------------*/
PROCEDURE prc_non_core_crs_rf_refresh(p_district_sid IN number
                                    ,p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_passing_grade_threshold IN number
                                    ,p_campus_rf_sid IN number
                                    ,p_debug IN varchar2) is
                                    
    v_proc_name                     varchar2(100)  := 'pkg_risk_calculation_engine.prc_non_core_crs_rf_refresh';
    v_start_datetime                timestamp      := SYSTIMESTAMP;
    v_end_datetime                  timestamp      := SYSTIMESTAMP;
    v_rows_affected                 number         := 0;
    v_2nd_sem_flag_end_date_sid     number         := 0; -- date sid for the end of the second semester flag
    v_1st_sem_flag_end_date_sid     number         := 0; -- date sid for the end of the first semester flag
    v_campus_rf_semester_sid        number         := 0;
    v_last_day_1st_semester         number         := 0;
    v_last_day_2nd_semester         number         := 0;
    v_default_grading_cycle         campus_dim.default_grading_cycle%TYPE;

    -- exception variables
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;
    
    -- collections
    TYPE r_date_dim is RECORD ( 
         dateSID              date_dim.date_sid%TYPE,
         EndSixWeeksFlag      date_dim.last_day_academic_6_weeks%TYPE,
         EndNineWeeksFlag     date_dim.last_day_academic_9_weeks%TYPE,
         EndSemesterFlag      date_dim.last_day_semester%TYPE,
         Semester             date_dim.semester%TYPE);
    TYPE t_date_type is table of r_date_dim INDEX BY pls_integer;
    v_date_collection t_date_type;
    
    TYPE r_student_rf_fact is RECORD (
         campus_sid                  student_risk_factor_fact.campus_sid%TYPE,
         student_sid                 student_risk_factor_fact.student_sid%TYPE,
         flag_date_sid               student_risk_factor_fact.flag_date_sid%TYPE,
         campus_risk_factor_sid      student_risk_factor_fact.campus_risk_factor_sid%TYPE,
         end_date_sid                student_risk_factor_fact.end_date_sid%TYPE,
         risk_factor_count           student_risk_factor_fact.risk_factor_count%TYPE);
    TYPE t_student_rf_fact is table of r_student_rf_fact INDEX BY pls_integer;
    v_stu_rf_collection t_student_rf_fact;
    
    TYPE t_end_date is table of number INDEX BY pls_integer;
    v_6wks_end_date_array t_end_date;
    v_9wks_end_date_array t_end_date;
    v_6weeks_end_date pls_integer := 0;
    v_9weeks_end_date pls_integer := 0;
    v_first_time_6wks boolean := True;
    v_first_time_9wks boolean := True;
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select 
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from dws.campus_risk_factor_dim
      join dws.campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
           and campus_dim.campus_sid = p_campus_sid
      where campus_risk_factor_dim.risk_factor_name = 'Semester Non-Core Course Failure';   
     exception
      when no_data_found then
       v_campus_rf_semester_sid := p_campus_rf_sid; -- set to 'Attendance' campus_risk_factor_dim member
   end; 

   -- Delete Prior data from Student_risk_factor_fact for this campus/school year --
   prc_delete_core_crs_rf_fact(p_campus_rf_sid,p_school_year,v_campus_rf_semester_sid,p_debug);
  
   -- collect date records where last day of the period, i.e. 6 weeks, equals 'Yes' for the run date school year that was passed in as a parm --
   select 
     date_dim.date_sid 
     ,date_dim.last_day_academic_6_weeks
     ,date_dim.last_day_academic_9_weeks
     ,date_dim.last_day_semester
     ,date_dim.semester
   bulk collect into v_date_collection
   from dws.date_dim 
   where date_dim.school_year = p_school_year 
         and date_dim.school_day_indicator = 'Instructional'
         and district_sid = p_district_sid
   order by date_dim.date_sid;
   
   if p_debug in ('D','TD','TDI') then
      DBMS_Output.PUT_LINE('Non-Core: number of date_dim rows returned: '||v_date_collection.count);
   end if;
   
   -- set grade cycle array and 1st semester end date variable --
   for i in v_date_collection.first..v_date_collection.last
     loop 
       if v_date_collection(i).EndSixWeeksFlag = 'Yes' then
         if not v_first_time_6wks then
           v_6wks_end_date_array(v_6weeks_end_date) := v_date_collection(i-1).dateSid;
           v_6weeks_end_date  := v_date_collection(i).dateSid;
           
           if v_date_collection(i).EndSemesterFlag = 'Yes' then
             v_6weeks_end_date  := v_date_collection(i).dateSid;
             v_6wks_end_date_array(v_6weeks_end_date) := v_date_collection(i).dateSid;
             v_first_time_6wks := True;
           end if;
         else 
           v_6weeks_end_date  := v_date_collection(i).dateSid;
           v_first_time_6wks := false;
         end if;
         
         if not v_first_time_9wks then
           v_9wks_end_date_array(v_9weeks_end_date) := v_date_collection(i-1).dateSid;
            v_9weeks_end_date := v_date_collection(i).dateSid;
         else 
           v_9weeks_end_date  := v_date_collection(i).dateSid;
           v_first_time_9wks := false;
         end if;
       end if;
      
       if  v_date_collection(i).EndSemesterFlag = 'Yes' then
         if v_date_collection(i).Semester = '1' then
           v_last_day_1st_semester := v_date_collection(i).dateSid;
         elsif v_date_collection(i).Semester = '2' then 
           v_last_day_2nd_semester := v_date_collection(i).dateSid;
           v_1st_sem_flag_end_date_sid := v_date_collection(i-1).dateSid; -- set variable to the date_sid for day before the end of semester 2
         end if;
       end if;
     end loop;
   
   -- determine semester 2 flag end date --
   -- Semester 2 end date should be set to the day before the end of semester 1
   -- of the next school year.
   -- if the date_dim does not contain data for the next school year then set 
   -- the semester 2 end date to the max date of 12/31/2999.
      select nvl(max(date_dim.date_sid),p_district_sid || '29991231')
        into v_2nd_sem_flag_end_date_sid
        from date_dim
        where date_dim.district_sid = p_district_sid
          and date_dim.school_year = p_school_year + 1
          and date_dim.semester = '1'
          and date_dim.date_id < 
              (Select dd.date_id from date_dim dd
                where dd.district_sid = p_district_sid
                  and dd.school_year = p_school_year + 1
                  and dd.semester = '1' 
                  and dd.last_day_semester = 'Yes');
   
   -- collect the student risk factor facts without end dates    -- 
   -- that are below the campus passing grade threshold          --
    select distinct
       Stu_grades.campus_sid
      ,Stu_grades.student_sid
      ,Stu_grades.flag_date_sid
      ,campus_risk_factor_dim.campus_risk_factor_sid
      ,Stu_grades.end_date_sid
      ,Stu_grades.risk_factor_count
    bulk collect into v_stu_rf_collection
    from (
      select student_grade_fact.campus_sid
        , student_grade_fact.student_sid
        , grade_type_dim.grade_type
        , case 
          when course_section_dim.core_course_flag = 'Yes' then 'Yes'
          when state_course_dim.core_course_flag = 'Yes' then 'Yes'
          else 'No'
          end as core_course_flag
        ,student_grade_fact.date_sid as flag_date_sid
        ,null as end_date_sid
        , 1 as risk_factor_count   
        , student_grade_fact.number_grade
      from student_grade_fact
      join grade_type_dim on grade_type_dim.grade_type_sid = student_grade_fact.grade_type_sid
      join course_section_dim on course_section_dim.course_section_sid = student_grade_fact.course_section_sid
      join state_course_dim on state_course_dim.state_course_sid = student_grade_fact.state_course_sid
      join date_dim on date_dim.date_sid = student_grade_fact.date_sid 
                    and date_dim.school_year = p_school_year
      where grade_type_dim.grade_type in ('MARKING PERIOD','SEMESTER') 
            and student_grade_fact.number_grade < p_passing_grade_threshold
            and student_grade_fact.campus_sid = p_campus_sid
            and student_grade_fact.date_sid <= p_run_date_sid
            and student_grade_fact.student_sid > 0
      ) Stu_grades
    join campus_dim on campus_dim.campus_sid = Stu_grades.campus_sid 
    join campus_risk_factor_dim on campus_risk_factor_dim.campus_id = campus_dim.campus_id 
         and campus_risk_factor_dim.risk_factor_name =
         case 
             when Stu_grades.grade_type = 'MARKING PERIOD' and Stu_grades.core_course_flag = 'No' then 'Non-Core Course Failure'
             when Stu_grades.grade_type = 'SEMESTER' and Stu_grades.core_course_flag = 'No' then 'Semester Non-Core Course Failure' 
         end
    order by Stu_grades.student_sid,Stu_grades.flag_date_sid;   
     
     if v_stu_rf_collection.count = 0 then 
       raise e_no_rows_found;
     end if;   
   
   -- Retrieve the campus default grading cycle
   select campus_dim.default_grading_cycle
   into v_default_grading_cycle
   from campus_dim
   where campus_dim.campus_sid = p_campus_sid;
      
   -- We already constructed the student risk factor facts in the above sql. 
   -- Now we need to assign the end_date_sid.
   for i in v_stu_rf_collection.first..v_stu_rf_collection.last
     loop   
       -- -------------------
       -- Assign end date --
       -- -------------------
       -- ASSUMPTION: The flag date matches the end of a grade cycle or semester and the 
       -- proper flags have been set in the date_dim for these days.
       -- the v_6wks_end_date_array/v_9wks_end_date_array is an associative array where the period
       -- end date is the key and the value is the end date.  If a key match fails then the end date
       -- will be set to the flag date because the program does not now how to handle it as the assumption
       -- will have been violated. 
       if  p_campus_rf_sid = v_stu_rf_collection(i).campus_risk_factor_sid then
          if  v_default_grading_cycle = '6-Weeks' or v_default_grading_cycle is null then
            begin
              v_stu_rf_collection(i).end_date_sid := v_6wks_end_date_array(v_stu_rf_collection(i).flag_date_sid);
              exception
                when no_data_found then
                  v_stu_rf_collection(i).end_date_sid := v_stu_rf_collection(i).flag_date_sid;
                  if p_debug in ('D','TD','TDI') then
                     DBMS_Output.PUT_LINE('Non-Core:  Not in array ');
                  end if;
            end;
          elsif v_default_grading_cycle = '9-Weeks' Then
            begin
              v_stu_rf_collection(i).end_date_sid := v_9wks_end_date_array(v_stu_rf_collection(i).flag_date_sid);
              exception
                when no_data_found then
                  v_stu_rf_collection(i).end_date_sid := v_stu_rf_collection(i).flag_date_sid;
                  if p_debug in ('D','TD','TDI') then
                     DBMS_Output.PUT_LINE('Non-Core:  Not in array ');
                  end if;
            end;
        end if;
       elsif v_campus_rf_semester_sid = v_stu_rf_collection(i).campus_risk_factor_sid then
         if v_stu_rf_collection(i).flag_date_sid = v_last_day_1st_semester then
            v_stu_rf_collection(i).end_date_sid := v_1st_sem_flag_end_date_sid;
         elsif v_stu_rf_collection(i).flag_date_sid = v_last_day_2nd_semester then
            v_stu_rf_collection(i).end_date_sid := v_2nd_sem_flag_end_date_sid;
         end if;
       end if;                 
     end loop;
 
   -- load data into student_risk_factor_fact table --
   for i in v_stu_rf_collection.first..v_stu_rf_collection.last
     loop
       -- Debug Code --
       if p_debug in ('D','TD','TDI') then
         dbms_output.put_line('Non-Core:  campus=>'|| v_stu_rf_collection(i).campus_sid
          ||' stu=>'|| v_stu_rf_collection(i).student_sid
          ||' flag=>'|| v_stu_rf_collection(i).flag_date_sid
          ||' crf=>'|| v_stu_rf_collection(i).campus_risk_factor_sid
          ||' enddt=>'|| v_stu_rf_collection(i).end_date_sid
          ||' cnt=>'|| v_stu_rf_collection(i).risk_factor_count);
       end if;
       -- end debug code --
     
       insert into student_risk_factor_fact
         ( campus_sid
         , student_sid
         , flag_date_sid
         , campus_risk_factor_sid
         , end_date_sid
         , last_update
         , risk_factor_count)
       values
         (  v_stu_rf_collection(i).campus_sid
          , v_stu_rf_collection(i).student_sid
          , v_stu_rf_collection(i).flag_date_sid
          , v_stu_rf_collection(i).campus_risk_factor_sid
          , v_stu_rf_collection(i).end_date_sid
          , systimestamp
          , v_stu_rf_collection(i).risk_factor_count);
     end loop;
            
    
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_non_core_crs_rf_refresh;
/*------------------------------------------------------------------------------
Procedure:           prc_delete_merged_student_rf 
Purpose:             Deletes the data for district for 
                     the specified school year from merged_student_risk_factor.
Input:               school_year - The school year of the data to delete.
                     
Revision History
Date      Author       Remarks
20101025  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_merged_student_rf (p_district_sid IN number, p_school_year IN varchar2, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_merged_student_rf';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- delete rows --
   delete merged_student_risk_factor
   where merged_student_risk_factor.flag_date_sid in 
         (select date_dim.date_sid 
           from date_dim
           where date_dim.school_year = p_school_year
             and date_dim.district_sid = p_district_sid)
         or merged_student_risk_factor.end_date_sid in 
         (select date_dim.date_sid 
           from date_dim
           where date_dim.school_year = p_school_year
             and date_dim.district_sid = p_district_sid);
   
   v_rows_affected := SQL%ROWCOUNT;   
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_merged_student_rf;

/*------------------------------------------------------------------------------
Procedure:           prc_merged_student_rf 
Purpose:             Merges student_risk_factor_fact transactions for students across 
                     multiple campuses into the merged_student_risk_factor table to create
                     a single view of the student risk over the school year.
Input:               District_sid - The sid of the district for this run of the engine.
                     School_year - The school year of the run of the engine.
                                
Revision History
Date      Author       Remarks
20111020  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_merged_student_rf(p_district_sid IN number
                             ,p_school_year IN varchar2
                             ,p_debug IN varchar2) is
    -- logging variables --                                
    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_merged_student_rf';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         := 0;
    -- processing variables --
    j                 pls_integer    := 0; -- index for v_stu_snapshot_collection
    v_prev_ndx        pls_integer    := 1; -- Used to track the previous risk factor for merging
    -- exception variables --
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;
    e_dws_district_error exception;
    -- collection variables --
    TYPE r_rf_trans is RECORD ( 
          studentSID                    merged_student_risk_factor.student_sid%TYPE
        , riskFactorSID                 merged_student_risk_factor.risk_factor_sid%TYPE
        , flagDateSID                   merged_student_risk_factor.flag_date_sid%TYPE
        , endDateSID                    merged_student_risk_factor.end_date_sid%TYPE);
        
    TYPE t_rf_trans_type is table of r_rf_trans INDEX BY pls_integer;
    v_rf_trans_collection t_rf_trans_type;
    
    TYPE t_merged_student_rf is table of merged_student_risk_factor%ROWTYPE;
    v_merged_stu_collection t_merged_student_rf := t_merged_student_rf();
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  District_sid = '||p_district_sid||' School Year = '|| p_school_year||' District_sid = '||p_district_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- delete the old merged records for the district --
   prc_delete_merged_student_rf (p_district_sid,p_school_year,p_debug);
   
   -- collect the risk factor transactions for the district --
   select distinct student_risk_factor_fact.student_sid
         ,risk_factor.risk_factor_sid
         ,student_risk_factor_fact.flag_date_sid
         ,student_risk_factor_fact.end_date_sid
     bulk collect into v_rf_trans_collection
     from student_risk_factor_fact
     join campus_risk_factor_dim
       on student_risk_factor_fact.campus_risk_factor_sid =
          campus_risk_factor_dim.campus_risk_factor_sid
     join risk_factor
       on risk_factor.risk_factor_name =
          campus_risk_factor_dim.risk_factor_name
     join date_dim
       on ((date_dim.date_sid = student_risk_factor_fact.flag_date_sid
            and date_dim.school_year = p_school_year) 
            or (date_dim.date_sid = student_risk_factor_fact.end_date_sid
            and date_dim.school_year = p_school_year))
      and date_dim.district_sid = p_district_sid
    order by student_risk_factor_fact.student_sid
            ,risk_factor.risk_factor_sid
            ,student_risk_factor_fact.flag_date_sid
            ,student_risk_factor_fact.end_date_sid desc;
            
   if v_rf_trans_collection.count = 0 then -- If no rows to process raise warning and stop
      raise e_no_rows_found;
   end if;
   --  debug code --
   if p_debug in ('D','TD','TDI') then
     dbms_output.put_line('-- Merged student rf preprocessed data -- Row Count = '||v_rf_trans_collection.count);
     for i in v_rf_trans_collection.first..v_rf_trans_collection.last
       loop
         dbms_output.put_line(' stu==>'||v_rf_trans_collection(i).studentSID
              ||' RF==>'||v_rf_trans_collection(i).riskFactorSID
              ||' flgdate==>'||v_rf_trans_collection(i).flagDateSID
              ||' enddate==>'||v_rf_trans_collection(i).endDateSID);
     end loop;
     end if;
     -- end debug code --

   -- process the risk factor transactions --  
   for i in v_rf_trans_collection.first..v_rf_trans_collection.last
     loop
       
       if i = v_rf_trans_collection.first then
          -- load the first record into the v_merged_stu_collection
          j := j + 1; -- Increment j 
          v_merged_stu_collection.extend; -- add the first element to the collection
          v_merged_stu_collection(j).student_sid := v_rf_trans_collection(i).studentSID;
          v_merged_stu_collection(j).risk_factor_sid := v_rf_trans_collection(i).riskFactorSID;
          v_merged_stu_collection(j).flag_date_sid := v_rf_trans_collection(i).flagDateSID;
          v_merged_stu_collection(j).end_date_sid := v_rf_trans_collection(i).endDateSID;
          v_merged_stu_collection(j).risk_factor_count := 1;
          v_prev_ndx := i; -- set prev index to the current record
       
       else
         -- if current record in the collection is 
         -- for a different student,risk factor, or the flag date is not less than the previous 
         -- end date then add this record to the collection and move up the previous index.
         if v_rf_trans_collection(i).studentSID =  v_rf_trans_collection(v_prev_ndx).studentSID 
            and v_rf_trans_collection(i).riskFactorSID = v_rf_trans_collection(v_prev_ndx).riskFactorSID 
            and v_rf_trans_collection(i).flagDateSID <= v_rf_trans_collection(v_prev_ndx).endDateSID then
              if v_rf_trans_collection(i).endDateSID > v_rf_trans_collection(v_prev_ndx).endDateSID then
                -- if the end date of the current record is greater than the end date of the previous
                -- record then update the previous records end date.  If not keep the end date of the 
                -- previous record and move on to the next record.
                v_merged_stu_collection(j).end_date_sid := v_rf_trans_collection(i).endDateSID;
              end if;
         else -- new student record, add it to the collection
            j := j + 1;  
            v_merged_stu_collection.extend; 
            v_merged_stu_collection(j).student_sid := v_rf_trans_collection(i).studentSID;
            v_merged_stu_collection(j).risk_factor_sid := v_rf_trans_collection(i).riskFactorSID;
            v_merged_stu_collection(j).flag_date_sid := v_rf_trans_collection(i).flagDateSID;
            v_merged_stu_collection(j).end_date_sid := v_rf_trans_collection(i).endDateSID;
            v_merged_stu_collection(j).risk_factor_count := 1;
            v_prev_ndx := i;
         end if;    
       end if;         
     end loop;
  
     -- ------------------------------------------------
     -- insert rows into merged_student_risk_factor   --
     -- ------------------------------------------------
     --  debug code --
     if p_debug in ('D','TD','TDI') then
       dbms_output.put_line('-- Merged student rf MEREGED data -- Row count = '||v_merged_stu_collection.count);
       for i in v_merged_stu_collection.first..v_merged_stu_collection.last
         loop
           dbms_output.put_line(' stu==>'||v_merged_stu_collection(i).student_sid
                ||' RF==>'||v_merged_stu_collection(i).risk_factor_sid
                ||' flgdate==>'||v_merged_stu_collection(i).flag_date_sid
                ||' enddate==>'||v_merged_stu_collection(i).end_date_sid);
         end loop;
       end if;
       -- end debug code --
       
       if v_merged_stu_collection.count > 0 then 
         forall i in v_merged_stu_collection.first..v_merged_stu_collection.last
           insert into merged_student_risk_factor
             (student_sid
             , risk_factor_sid
             , flag_date_sid
             , end_date_sid
             , risk_factor_count)
           values
             (v_merged_stu_collection(i).student_sid
             ,v_merged_stu_collection(i).risk_factor_sid
             ,v_merged_stu_collection(i).flag_date_sid
             ,v_merged_stu_collection(i).end_date_sid
             ,v_merged_stu_collection(i).risk_factor_count);
        end if;     
        
        commit;
        
   -- set the number of rows processed and pass out the rows inserted ---    
   if v_merged_stu_collection is null then
     v_rows_affected := 0;
   else
     v_rows_affected := v_merged_stu_collection.count;
   end if;
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( District_sid = '||p_district_sid||' School Year = '|| p_school_year||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
      
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_merged_student_rf;
/*------------------------------------------------------------------------------
Procedure:           prc_delete_student_rf_snapshot 
Purpose:             Deletes the data for a campus for 
                     the specified school year from student_risk_factor_snapshot.
Input:               Campus_sid - The sid of the campus data to delete.
                     school_year - The school of the data to delete.
                                
Revision History
Date      Author       Remarks
20100914  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_student_rf_snapshot (p_campus_sid IN number, p_debug IN varchar2) is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_student_rf_snapshot';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- delete rows --
   delete student_risk_factor_snapshot
   where student_risk_factor_snapshot.campus_sid = p_campus_sid;
   
   v_rows_affected := SQL%ROWCOUNT;   
   commit;
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
END prc_delete_student_rf_snapshot;
/*------------------------------------------------------------------------------
Procedure:           prc_stu_rf_snaphot 
Purpose:             Translates student_risk_factor_fact transactions into periodic 
                     snapshots for a campus and load them into student_risk_factor_snapshot.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.
                                
Revision History
Date      Author       Remarks
20100915  C.Bull       Original version
05/22/12  CBull        Added LEP first and second year monitoring to the record, SQL, and secondary risk factor count
                       case statement.
--------------------------------------------------------------------------------*/
PROCEDURE prc_stu_rf_snaphot(p_campus_sid IN number
                             ,p_run_date_sid IN number
                             ,p_school_year IN varchar2
                             ,p_debug IN varchar2
                             ,p_rows_inserted OUT number) is
                                    
    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_stu_rf_snaphot';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         := 0;
    j                 pls_integer    := 0; -- index for v_stu_snapshot_collection
    b_first_row       boolean        := TRUE;
    v_rf_count        number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found      exception;
    e_dws_district_error exception;
    
    TYPE r_rf_trans is RECORD ( 
         campusSID                      student_risk_factor_fact.campus_sid%TYPE
        , studentSID                    student_risk_factor_fact.student_sid%TYPE
        , flagDateSID                   student_risk_factor_fact.flag_date_sid%TYPE
        , endDateSID                    student_risk_factor_fact.end_date_sid%TYPE
        , riskFactorName                campus_risk_factor_dim.risk_factor_name%TYPE 
        , ninthGradeCohort              student_dim.ninth_grade_cohort%TYPE
        , limitedEnglishProficiency     student_dim.limited_english_proficiency%TYPE
        , lepMonitor1stYear             student_dim.lep_first_year_monitoring%Type
        , lepMonitor2ndYear             student_dim.lep_second_year_monitoring%Type
        , immigrant                     student_dim.immigrant%TYPE
        , migrant                       student_dim.migrant%TYPE
        , economicallyDisadvantaged     student_dim.economically_disadvantaged%TYPE
        , specialEducation              student_dim.special_education%TYPE);
    TYPE t_rf_trans_type is table of r_rf_trans INDEX BY pls_integer;
    v_rf_trans_collection t_rf_trans_type;
    
    TYPE t_student_rf_snapshot is table of student_risk_factor_snapshot%ROWTYPE;
    v_stu_snapshot_collection t_student_rf_snapshot := t_student_rf_snapshot();
         
BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;
   
   -- initialize the the rows inserted variable otherwise it will return null when no rows inserted --
   p_rows_inserted := 0;
   
   -- delete the old snapshots for the campus --
   prc_delete_student_rf_snapshot (p_campus_sid,p_debug);
   
   -- collect the risk factor transactions for the campus --
   select enrolled_student.campus_sid
      , merged_student_risk_factor.student_sid
      , merged_student_risk_factor.flag_date_sid
      , merged_student_risk_factor.end_date_sid
      , risk_factor.risk_factor_name   
      , student_dim.ninth_grade_cohort 
      , student_dim.limited_english_proficiency 
      , student_dim.lep_first_year_monitoring
      , student_dim.lep_second_year_monitoring
      , student_dim.immigrant  
      , student_dim.migrant  
      , student_dim.economically_disadvantaged   
      , student_dim.special_education  
      bulk collect into v_rf_trans_collection
      from merged_student_risk_factor
      join risk_factor on merged_student_risk_factor.risk_factor_sid = risk_factor.risk_factor_sid
      join student_dim on student_dim.student_sid = merged_student_risk_factor.student_sid 
      join (select  student_enrollment_fact.campus_sid -- select all students currently enrolled as of a school year and date --
            ,student_enrollment_fact.student_sid 
            ,grade_level_dim.grade_level
            from student_enrollment_fact 
            join grade_level_dim on grade_level_dim.grade_level_sid = student_enrollment_fact.grade_level_sid
            join date_dim date_dim_whd on date_dim_whd.date_sid = nvl(student_enrollment_fact.withdrawal_date_sid, p_run_date_sid)
            join date_dim date_dim_entry on date_dim_entry.date_sid = student_enrollment_fact.entry_date_sid
                                         and date_dim_entry.school_year = p_school_year
            where student_enrollment_fact.campus_sid =  p_campus_sid
            and p_run_date_sid >= student_enrollment_fact.entry_date_sid
            and (p_run_date_sid < nvl(student_enrollment_fact.withdrawal_date_sid,p_run_date_sid+1)
            or (p_run_date_sid <= nvl(student_enrollment_fact.withdrawal_date_sid,p_run_date_sid)
            and date_dim_whd.semester = '2' 
            and date_dim_whd.last_day_semester = 'Yes'))) enrolled_student
            on enrolled_student.student_sid = merged_student_risk_factor.student_sid
      WHERE p_run_date_sid between merged_student_risk_factor.flag_date_sid and merged_student_risk_factor.end_date_sid   
      order by merged_student_risk_factor.student_sid;
      
   if v_rf_trans_collection.count = 0 then -- If no rows to process raise warning and stop
      raise e_no_rows_found;
   end if;

   -- process the risk factor transactions --  
   for i in v_rf_trans_collection.first..v_rf_trans_collection.last
     loop
       -- b_first_row identifies that the next row is the first row for a student and 
       -- therefore the v_stu_snapshot_collection needs to be extended and basic data 
       -- loaded for the student, campus, and date.  The Flags are all default to 'No'.
       if b_first_row = TRUE then
          j := j + 1; -- Increment j 
          v_rf_count := 0; -- reset risk factor count to zero
          v_stu_snapshot_collection.extend; -- add the first element to the collection
          v_stu_snapshot_collection(j).campus_sid := v_rf_trans_collection(i).campusSID;
          v_stu_snapshot_collection(j).student_sid := v_rf_trans_collection(i).studentSID;
          v_stu_snapshot_collection(j).date_sid := p_run_date_sid;
          
          -- default all flags to 'No' --
          v_stu_snapshot_collection(j).attendance_flag := 'No'; 
          v_stu_snapshot_collection(j).semester_attendance_flag := 'No'; 
          v_stu_snapshot_collection(j).core_course_failure_flag := 'No';
          v_stu_snapshot_collection(j).semester_core_crs_failure_flag := 'No';
          v_stu_snapshot_collection(j).gpa_flag := 'No';
          v_stu_snapshot_collection(j).deficient_credits_flag := 'No';
          v_stu_snapshot_collection(j).non_core_course_failure_flag := 'No';
          v_stu_snapshot_collection(j).semester_noncore_crs_fail_flag := 'No';
          v_stu_snapshot_collection(j).discipline_flag := 'No';
          v_stu_snapshot_collection(j).grade_6_thru_8_retention_flag := 'No';
          v_stu_snapshot_collection(j).other_flag := 'No';
          v_stu_snapshot_collection(j).cohort_flag := 'No';
           
          b_first_row := FALSE;      
       end if;
       -- This case statement simply switchs(pivots) the flags to 'Yes' for each flag the student received.
       case v_rf_trans_collection(i).riskFactorName  
         when 'Attendance'  Then 
           v_stu_snapshot_collection(j).attendance_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Previous Semester Attendance'  Then 
           v_stu_snapshot_collection(j).semester_attendance_flag := 'Yes'; 
           v_rf_count := v_rf_count + 1; 
         when 'Core Course Failure'  Then 
           v_stu_snapshot_collection(j).core_course_failure_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Semester Core Course Failure' Then 
           v_stu_snapshot_collection(j).semester_core_crs_failure_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'GPA' Then 
           v_stu_snapshot_collection(j).gpa_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Deficient Credits'  Then 
           v_stu_snapshot_collection(j).deficient_credits_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Non-Core Course Failure'  Then 
           v_stu_snapshot_collection(j).non_core_course_failure_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Semester Non-Core Course Failure' Then 
           v_stu_snapshot_collection(j).semester_noncore_crs_fail_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Discipline' Then 
           v_stu_snapshot_collection(j).discipline_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when 'Grade 6_8 Retention' Then 
           v_stu_snapshot_collection(j).grade_6_thru_8_retention_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         when '9th Grade Cohort' Then 
           v_stu_snapshot_collection(j).cohort_flag := 'Yes';
           v_rf_count := v_rf_count + 1; 
         else null;
       end case;
       -- if we reach the end of the risk factor transactions or next record in the collection is 
       -- for a different student then close out this snapshot record.
       if i = v_rf_trans_collection.last
         or v_rf_trans_collection(i).studentSID <>  v_rf_trans_collection(i+1).studentSID then
 
         -- secondary flag -- 
         -- if the student has any one of the secondary indicators on student_dim set to 'Yes' then
         -- the Other_flag is set to 'Yes'.
         case  
           when v_rf_trans_collection(i).limitedEnglishProficiency = 'Yes'  Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes'; 
             v_rf_count := v_rf_count + 1; 
           when v_rf_trans_collection(i).lepMonitor1stYear = 'Yes'  Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes'; 
             v_rf_count := v_rf_count + 1;
           when v_rf_trans_collection(i).lepMonitor2ndYear = 'Yes'  Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes'; 
             v_rf_count := v_rf_count + 1;
           when v_rf_trans_collection(i).immigrant = 'Yes'                  Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes'; 
             v_rf_count := v_rf_count + 1; 
           when v_rf_trans_collection(i).migrant = 'Yes'                    Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes';
             v_rf_count := v_rf_count + 1; 
           when v_rf_trans_collection(i).economicallyDisadvantaged = 'Yes'  Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes';
             v_rf_count := v_rf_count + 1; 
           when v_rf_trans_collection(i).specialEducation = 'Yes'           Then 
             v_stu_snapshot_collection(j).other_flag := 'Yes';
             v_rf_count := v_rf_count + 1; 
           else v_stu_snapshot_collection(j).other_flag := 'No';
         end case;
      
         -- set the risk factor count --
         v_stu_snapshot_collection(j).risk_factor_count := v_rf_count; 
         
         -- reset the b_first_row flag to TRUE to pick the next row as a new student --
         b_first_row := TRUE;
         
       end if;    
                
     end loop;

     -- ------------------------------------------------
     -- insert rows into student_risk_factor_snapshot --
     -- ------------------------------------------------
     if p_debug in ('D','TD','TDI') then
       for i in v_stu_snapshot_collection.first..v_stu_snapshot_collection.last
         loop
         --  debug code --
         
           dbms_output.put_line('cmp==>'||v_stu_snapshot_collection(i).campus_sid
                ||' stu==>'||v_stu_snapshot_collection(i).student_sid
                ||' date==>'||v_stu_snapshot_collection(i).date_sid
                ||' Att==>'||v_stu_snapshot_collection(i).attendance_flag
                ||' SemAtt==>'||v_stu_snapshot_collection(i).semester_attendance_flag
                ||' cf==>'||v_stu_snapshot_collection(i).cohort_flag
                ||' OF==>'||v_stu_snapshot_collection(i).other_flag
                ||' CNT==>'||v_stu_snapshot_collection(i).risk_factor_count);
         end loop;
       end if;
       -- end debug code --
       if v_stu_snapshot_collection.count > 0 then
         forall i in v_stu_snapshot_collection.first..v_stu_snapshot_collection.last
           insert into student_risk_factor_snapshot
             (campus_sid
             , student_sid
             , date_sid
             , attendance_flag
             , semester_attendance_flag
             , core_course_failure_flag
             , semester_core_crs_failure_flag           
             , gpa_flag
             , deficient_credits_flag
             , non_core_course_failure_flag
             , semester_noncore_crs_fail_flag
             , discipline_flag
             , grade_6_thru_8_retention_flag
             , other_flag
             , cohort_flag
             , risk_factor_count)
           values
             (v_stu_snapshot_collection(i).campus_sid
              ,v_stu_snapshot_collection(i).student_sid
              ,v_stu_snapshot_collection(i).date_sid
              ,v_stu_snapshot_collection(i).attendance_flag
              ,v_stu_snapshot_collection(i).semester_attendance_flag
              ,v_stu_snapshot_collection(i).core_course_failure_flag
              ,v_stu_snapshot_collection(i).semester_core_crs_failure_flag
              ,v_stu_snapshot_collection(i).gpa_flag
              ,v_stu_snapshot_collection(i).deficient_credits_flag
              ,v_stu_snapshot_collection(i).non_core_course_failure_flag
              ,v_stu_snapshot_collection(i).semester_noncore_crs_fail_flag
              ,v_stu_snapshot_collection(i).discipline_flag
              ,v_stu_snapshot_collection(i).grade_6_thru_8_retention_flag
              ,v_stu_snapshot_collection(i).other_flag
              ,v_stu_snapshot_collection(i).cohort_flag
              ,v_stu_snapshot_collection(i).risk_factor_count);
           
         commit;
           
       end if;

   -- set the number of rows processed and pass out the rows inserted ---    
   if v_stu_snapshot_collection is null then
     v_rows_affected := 0;
     p_rows_inserted := 0;
   else
     v_rows_affected := v_stu_snapshot_collection.count;
     p_rows_inserted := v_stu_snapshot_collection.count;
   end if;
   
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception
    when e_dws_district_error then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
	      v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
      
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
      
end prc_stu_rf_snaphot;
/*------------------------------------------------------------------------------
Procedure:           prc_track_student_rf_phase 
Purpose:             Identifies which students have been added, removed, or
                     remain in the student_risk_factor_snapshot table for a 
                     campus.
Input:               Campus_sid - The sid of the campus data to delete.
                     run_date_sid - The date_sid for this run of the engine that
                                  corresponds to the snapshot date.
                     district_sid - the sid of the district the campus belongs to
  
Revision History
Date      Author       Remarks
20101027  J Smtih      Original version
20101124  C.Bull       modified and add to RCE
20110711  J Smith      modified DWS-1010 - Only Process on Friday (kind of) 
20110829  C. Bull      Cleaned up code, changed day of week lookup to be procedural
                       rather than a database lookup, and passed in the district_sid.
--------------------------------------------------------------------------------*/

procedure prc_track_student_rf_phase 
          (p_district_sid IN number
          , p_campus_sid IN number
          , p_run_date_sid IN number
          , p_debug IN varchar2) 
  is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_track_student_rf_phase';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;
   
    type string_array is varray(10000) of  varchar2(10);
    type number_array is varray(10000) of  number;
     
    a_phase           string_array;
    a_student_sid     number_array;
    v_this_Friday     number := 0 ; 
    v_prior_Friday    number := 0 ; 
    v_Friday_Flag     varchar2(1) := '' ;
    v_day_of_week     varchar2(10);

begin
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Run_date_sid= '||p_run_date_sid||' Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;
   
  -- Determine the day of the week based on the run date 
  select trim(to_char(to_date(substr(to_char(p_run_date_sid),-8,8),'YYYYMMDD'),'DAY')) 
  into v_day_of_week
  from Dual;
   
   -- change to Saturday - Monday 7/15/2011  
  if   v_day_of_week =  'SATURDAY' or 
       v_day_of_week =  'SUNDAY'   or 
       v_day_of_week =  'MONDAY'   or
       v_day_of_week =  'TUESDAY'  then  
        
       v_errmesg     := 'Processing the file as if it is Friday ';
       v_Friday_flag := 'Y' ; 
     else 
       v_errmesg     := 'No processing today - Normal ';
       v_Friday_flag := 'N'  ; 
  end if;    
    
  -- Only process Fridays 
  If  v_Friday_flag = 'Y'  then 
  
    -- Find the most recent Friday   
    select date_dim.date_sid   
    into v_this_Friday  
    from date_dim
     where date_dim.district_sid = p_district_sid
       and date_dim.date_sid =  (select max(max_date.date_sid ) 
                               from date_dim max_date  
                              where max_date.district_sid = p_district_sid
                                and max_date.day_of_week = '6'
                                and max_date.date_sid <= p_run_date_sid  )  ; 
    
    -- get date from last load --
    select max(student_risk_factor_phase_sum.date_sid)
    into v_prior_Friday
    from student_risk_factor_phase_sum 
    join campus_dim  on campus_dim.campus_sid = student_risk_factor_phase_sum.campus_sid 
         and campus_dim.district_sid = p_district_sid
    where student_risk_factor_phase_sum.date_sid < v_this_Friday;
    -- if no prior load then set to date minus 7 so all will be added --   
    if v_prior_Friday is null then
      select d1.date_sid  into v_prior_Friday  
        from date_dim d1
       where date_id = ( select ( d2.date_id - 7 ) 
                           from date_dim d2
                          where d2.date_sid = v_this_Friday 
                            and d1.district_sid = d2.district_sid ) ;
    end if;  
              
    -- delete any current rows for re-running on the same Friday and campus --
    delete  from  student_risk_factor_phase_sum
            where  campus_sid =  p_campus_sid  
              and  date_sid = v_this_friday; 

    -- get the students who have been removed and insert them --
    select 'Removed', e.student_sid 
      bulk collect into a_phase, a_student_sid
      from student_risk_factor_phase_sum  e 
      where e.campus_sid = p_campus_sid  
       and date_sid =   v_prior_Friday 
       and risk_factor_phase <> 'Removed'   
       and  e.student_sid not in ( select s.student_sid 
             from student_risk_factor_snapshot s 
            where s.campus_sid = e.campus_sid ); 

    if a_phase.count > 0 then
      for indx in a_phase.first..a_phase.last loop
        insert into STUDENT_RISK_FACTOR_PHASE_SUM (CAMPUS_SID, DATE_SID, STUDENT_SID, RISK_FACTOR_PHASE, RISK_FACTOR_COUNT)
           values (p_campus_sid, v_this_Friday, a_student_sid(indx), a_phase(indx), -1);
      end loop;
    end if;   
      
     -- get the students who Remain and insert them --
     select 'Remain', e.student_sid 
      bulk collect into a_phase, a_student_sid
      from student_risk_factor_phase_sum  e 
      where e.campus_sid = p_campus_sid
       and date_sid =   v_prior_Friday 
       and risk_factor_phase <> 'Removed'   
       and  e.student_sid  in ( select s.student_sid 
                     from student_risk_factor_snapshot s 
                    where s.campus_sid = e.campus_sid
                    and s.date_sid = p_run_date_sid ) ; 

     if a_phase.COUNT > 0 then
       for indx in a_phase.first..a_phase.last loop
        insert into student_risk_factor_phase_sum (campus_sid, date_sid, student_sid, risk_factor_phase, risk_factor_count)
           values (p_campus_sid, v_this_friday, a_student_sid(indx), a_phase(indx), 1);
        end loop;
     end if ; 
   
     -- get the students who have been added and insert them -- 
     select 'Added', s.student_sid  
     bulk collect into a_phase, a_student_sid
     from student_risk_factor_snapshot s 
     where s.campus_sid = p_campus_sid 
       and s.date_sid = p_run_date_sid
       and ( s.student_sid in  ( select e.student_sid
                    from student_risk_factor_phase_sum  e 
                   where e.campus_sid = s.campus_sid 
                     and date_sid = v_prior_Friday 
                     and risk_factor_phase =  'Removed' )  
       or s.student_sid not in ( select e.student_sid
                    from student_risk_factor_phase_sum  e 
                   where e.campus_sid = s.campus_sid 
                     and date_sid = v_prior_Friday  ) );

     if a_phase.count > 0 then
        for indx in a_phase.first..a_phase.last loop
           insert into student_risk_factor_phase_sum (campus_sid, date_sid, student_sid, risk_factor_phase, risk_factor_count)
             values (p_campus_sid, v_this_friday, a_student_sid(indx), a_phase(indx), 1);
        end loop;
     end if ; 
     
   end if;  -- Friday Flag        
   
   commit;
   
   -- log end time --
   if p_debug in ('t','td','ti','tdi') then
     v_end_datetime := systimestamp;
     zeus.pkg_utilities.proc_etl_log_event(v_proc_name,'information','p/l sql','ended',null,null,v_rows_affected,('end '||v_proc_name||' procedure.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_get_elapsed_time(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('Parms: District_SID= '||p_district_sid||' Run_date_sid= '||p_run_date_sid||' Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
end prc_track_student_rf_phase;

/*------------------------------------------------------------------------------
Procedure:           prc_sem_att_max_dt_cln_up 
Purpose:             Identifies student_risk_factor_fact records for the 'Semester Attendance'
                     flag that were created with the max data sid of 29991231 because the  
                     district date dim was not populated for the next school year and attempts.
                     to populate the end_date_sid with the correct date. This is a clean up procedure.
Input:               district_sid - The sid of the campus data to delete.
                     run_date_sid - The date_sid for this run of the engine that
                                  corresponds to the snapshot date.
                                
Revision History
Date      Author       Remarks
20101027  SMITHJ       Original version
20101124  C.Bull       modified and add to RCE
--------------------------------------------------------------------------------*/
PROCEDURE prc_sem_att_max_dt_cln_up (p_district_sid IN number
                                     ,p_district_id IN varchar2
                                     ,p_debug IN varchar2) is 

  v_proc_name       varchar2(100)    := 'pkg_risk_calculation_engine.prc_sem_att_max_dt_cln_up';
  v_start_datetime  timestamp        := SYSTIMESTAMP;
  v_end_datetime    timestamp        := SYSTIMESTAMP;
  v_rows_affected   number           := 0; 
  v_2nd_sem_flag_end_date_sid number := 0;

  v_errcode         number;
  v_errmesg         varchar2(200);
  e_no_rows_found   exception;
     
  TYPE r_student_rf_fact is RECORD ( 
       campusSid              student_risk_factor_fact.campus_sid%TYPE,
       studentSid             student_risk_factor_fact.student_sid%TYPE,
       flagDateSid            student_risk_factor_fact.flag_date_sid%TYPE,
       schoolYear             date_dim.school_year%TYPE,
       endDateSid             student_risk_factor_fact.end_date_sid%TYPE,
       campusRiskFactorSid    student_risk_factor_fact.campus_risk_factor_sid%TYPE);

  TYPE t_student_rf_fact is table of r_student_rf_fact INDEX BY pls_integer;
  v_stu_rf_collection t_student_rf_fact;

begin
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('District_sid= '||p_district_sid||' District_id = '||p_district_id||'.'),v_start_datetime,null,null );
   end if;

   -- get the risk factor tranactions that have a max date sid in the end date
   -- for this this district for semester attendance.
   select student_risk_factor_fact.campus_sid
					,student_risk_factor_fact.student_sid
					,student_risk_factor_fact.flag_date_sid
					,date_dim.school_year
					,student_risk_factor_fact.end_date_sid
					,student_risk_factor_fact.campus_risk_factor_sid 
      bulk collect into v_stu_rf_collection
			from student_risk_factor_fact 
			join campus_risk_factor_dim
				on campus_risk_factor_dim.campus_risk_factor_sid =
					 student_risk_factor_fact.campus_risk_factor_sid
			 and campus_risk_factor_dim.district_id = p_district_id
			 and campus_risk_factor_dim.risk_factor_name = 'Previous Semester Attendance'
			join date_dim
				on date_dim.date_sid = student_risk_factor_fact.flag_date_sid
		 where substr(to_char(student_risk_factor_fact.end_date_sid), -8) = '29991231';

    if v_stu_rf_collection.count > 0 then -- only process the following if rows where found

      -- determine semester 2 flag end date --
      -- Semester 2 end date should be set to the day before the end of semester 1
      -- of the next school year.
      -- if the date_dim does not contain data for the next school year then set 
      -- the semester 2 end date to the max date of 12/31/2999.
      select nvl(max(date_dim.date_sid), p_district_sid || '29991231')
        into v_2nd_sem_flag_end_date_sid
        from date_dim
       where date_dim.district_sid = p_district_sid
         and date_dim.school_year = v_stu_rf_collection(1).schoolYear + 1
         and date_dim.semester = '1'
         and date_dim.date_id <
             (Select dd.date_id
                from date_dim dd
               where dd.district_sid = p_district_sid
                 and dd.school_year = v_stu_rf_collection(1).schoolYear + 1
                 and dd.semester = '1'
                 and dd.last_day_semester = 'Yes');

     -- date_dim for this district does not exist if the above query
     -- returns the max date sid, if it does then there is no need to process the update.
     if substr(to_char(v_2nd_sem_flag_end_date_sid), -8) <> '29991231' then
        forall i in v_stu_rf_collection.first .. v_stu_rf_collection.last
          update student_risk_factor_fact
             set student_risk_factor_fact.end_date_sid = v_2nd_sem_flag_end_date_sid
           where student_risk_factor_fact.campus_sid = v_stu_rf_collection(i).campusSid
             and student_risk_factor_fact.student_sid = v_stu_rf_collection(i).studentSid
             and student_risk_factor_fact.flag_date_sid = v_stu_rf_collection(i).flagDateSid
             and student_risk_factor_fact.campus_risk_factor_sid = v_stu_rf_collection(i).campusRiskFactorSid;
     end if;
     
     -- get the total number of rows updated --
     v_rows_affected := SQL%ROWCOUNT;
     
     -- apply the update --
     commit;

   end if;
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
   
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;   
end prc_sem_att_max_dt_cln_up;

/*------------------------------------------------------------------------------
Procedure:           prc_risk_calc_engine 
Purpose:             The driver program for calculating students with drop out risk 
                     factors.
Input:               Campus_id - The id of the campus for this run of the engine.
                       (overides district_id).
                     Run_date - Format YYYYMMDD. The date for this run of the engine.
                     District_id - The id of the district to run for all campuses. (optional)
                     Debug - the valid debug options are
                           N - none (Default)
                           T - Trace to follow procedure execution
                           D - Activates all DBMS_output. YOU MUST INCREASE THE TEST OUPUT
                               BUFFER SIZE ON THE DBMS OUTPUT TAB TO HANDLE LARGE AMOUNT OF OUTPUT.
                           I - Informational Messages.
                           TI - Trace and Informational messages.
                           TD - both Trace and DBMS_Output.
                           TDI - Trace, DBMS_Output, and Informational messages.
                           All other values will be ignored and processing will continue.
                                
Revision History
Date      Author       Remarks
20100903  C.Bull       Original version
20111126  C.Bull       Added Call to prc_merged_student_rf and post processing loop
                       for the snapshot and other tasks.
01/19/11  CBull        Added logging of engine run date to execution log and execution parameter tables to faclilite
                       correct counting on dashboard pie chart and detail report.  Also had no log of actual rundate.
--------------------------------------------------------------------------------*/
PROCEDURE prc_risk_calc_engine (p_campus_id IN varchar2
                               , p_run_date_id IN varchar2
                               , p_district_id IN varchar2
                               , p_debug varchar2 default 'N') is 

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_risk_calc_engine';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4)    := ' ';
    v_run_date_sid    number         := 0;
    v_total_snapshot_rows number     := 0;
    v_rows_inserted       number     := 0;
    v_debug           varchar2(3)    := p_debug;
    v_errcode         number;
    v_errmesg         varchar2(200)  :=' ';
    e_no_rows_found   exception;
    e_campus_required exception;
    e_campus_not_found exception;
    
    TYPE r_campus_record IS RECORD (
      DistrictSID           campus_dim.district_sid%TYPE,
      DistrictID            campus_dim.district_id%TYPE,
      CampusSID             campus_dim.campus_sid%TYPE,
      CampusID              campus_dim.campus_id%TYPE,
      RiskFactorName        campus_risk_factor_dim.risk_factor_name%TYPE,
      Campus_RF_SID         campus_risk_factor_dim.campus_risk_factor_sid%TYPE,
      PeriodsPerDay         campus_dim.periods_per_day%TYPE,
      AttendanceThreshold   campus_dim.attendance_threshold%TYPE,
      PassingGradeThreshold  campus_dim.passing_grade_threshold%TYPE);
      
    TYPE t_campus_type IS TABLE OF r_campus_record INDEX BY pls_integer;
    
    v_campus_collection t_campus_type;

    
BEGIN
   -- log start time --
   zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Parms=( District_id='||p_district_id||' Campus_sid= '||p_campus_id||' Run_date_id= '|| p_run_date_id||' with debug option '||p_debug||'.'),v_start_datetime,null,null );

   -- validate debug values --
   if v_debug not in ('N','T','TD','D','I','TDI','TI') Then
     v_debug := 'N';
   end if;
   
   -- collect the campus information
   if p_campus_id is NULL  then
     if p_district_id is NULL  then
       raise e_campus_required;
     else
       select -- pull all campuses for the specified district
          campus_dim.district_sid
          ,campus_dim.district_id
          ,campus_dim.campus_sid
          ,campus_dim.campus_id
          ,campus_risk_factor_dim.risk_factor_name
          ,campus_risk_factor_dim.campus_risk_factor_sid
          ,case 
          when risk_factor_name = 'Attendance' then 
           campus_dim.periods_per_day
          else null
          end as periods_per_day
          ,case 
          when risk_factor_name = 'Attendance' then 
           campus_dim.attendance_threshold
          else null
          end as Attendance_threshold
          ,campus_dim.passing_grade_threshold
          bulk collect into v_campus_collection
          from campus_risk_factor_dim
          join campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
          where campus_risk_factor_dim.district_id = p_district_id
          order by campus_dim.campus_sid;

       if v_campus_collection.count = 0 then -- If no rows to process raise warning and stop
          raise e_no_rows_found;
       end if;
     end if;
   else
     select -- pull only the campus specified
        campus_dim.district_sid
        ,campus_dim.district_id
        ,campus_dim.campus_sid
        ,campus_dim.campus_id
        ,risk_factor_name
        ,campus_risk_factor_dim.campus_risk_factor_sid
        ,case 
        when risk_factor_name = 'Attendance' then 
         periods_per_day
        else null
        end as periods_per_day
        ,case 
        when risk_factor_name = 'Attendance' then 
         Attendance_threshold
        else null
        end as Attendance_threshold
        ,campus_dim.passing_grade_threshold
        bulk collect into v_campus_collection
        from campus_risk_factor_dim
        join campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
        where campus_risk_factor_dim.campus_id = p_campus_id;

     if v_campus_collection.count = 0 then -- If no rows to process raise warning and stop
        raise e_campus_not_found;
     end if;
   end if;

   -- get the date sid and school year for the run date --
   select 
     date_dim.date_sid
     ,date_dim.school_year
     into v_run_date_sid, v_school_year
     from date_dim
     where date_dim.year_month_day = p_run_date_id
           and date_dim.district_sid = v_campus_collection(1).DistrictSID;
   
   --  logic would go here to determine if there was a load or just 
   --  a config change what should be done. Full re-fresh or update
   
   -- Process the campuses and their risk factors
   for i in v_campus_collection.first..v_campus_collection.last
     loop

       case v_campus_collection(i).RiskFactorName   
         when 'Attendance' then
         -- Process attendance risk factor --
         prc_att_rf_fact_full_refresh(v_campus_collection(i).CampusSID
                                      ,v_run_date_sid 
                                      ,v_school_year
                                      ,v_campus_collection(i).PeriodsPerDay
                                      ,v_debug);
         -- update the Student_Risk_Factor_Fact for attendance --
         prc_att_stu_rf_fact_refresh(v_campus_collection(i).DistrictSID
                                    ,v_campus_collection(i).CampusSID
                                    ,v_run_date_sid
                                    ,v_school_year
                                    ,v_campus_collection(i).AttendanceThreshold
                                    ,v_campus_collection(i).PeriodsPerDay
                                    ,v_campus_collection(i).Campus_RF_SID
                                    ,v_debug);
         -- log execution --
         prc_execution_log(v_start_datetime
                           ,v_campus_collection(i).CampusSID
                           ,'Attendance'
                           ,'RCE'
                           ,systimestamp
                           ,'Successful'
                           ,v_debug);
         -- log parameters --
         prc_execution_parameter(v_start_datetime
                                 ,v_campus_collection(i).CampusSID
                                 ,'PeriodsPerDay'
                                 ,v_campus_collection(i).PeriodsPerDay
                                 ,v_debug);
         prc_execution_parameter(v_start_datetime
                                 ,v_campus_collection(i).CampusSID
                                 ,'AttendanceThreshold'
                                 ,v_campus_collection(i).AttendanceThreshold
                                 ,v_debug);
       when '9th Grade Cohort' then
         prc_cohort_stu_rf_fact_refresh(v_campus_collection(i).DistrictSID
                                    ,v_campus_collection(i).CampusSID
                                    ,v_run_date_sid
                                    ,v_school_year
                                    ,v_campus_collection(i).Campus_RF_SID
                                    ,v_debug);
       when 'Deficient Credits' then
         prc_def_cr_stu_rf_fact_refresh(p_district_sid => v_campus_collection(i).DistrictSID
                                     ,p_campus_sid     => v_campus_collection(i).CampusSID
                                     ,p_run_date_sid   => v_run_date_sid
                                     ,p_school_year    => v_school_year
                                     ,p_campus_rf_sid  => v_campus_collection(i).Campus_RF_SID
                                     ,p_debug          => v_debug);
       when 'Core Course Failure' then
         prc_core_crs_rf_refresh(p_district_sid => v_campus_collection(i).DistrictSID
                                    ,p_campus_sid => v_campus_collection(i).CampusSID
                                    ,p_run_date_sid => v_run_date_sid
                                    ,p_school_year => v_school_year
                                    ,p_passing_grade_threshold => v_campus_collection(i).PassingGradeThreshold
                                    ,p_campus_rf_sid => v_campus_collection(i).Campus_RF_SID
                                    ,p_debug => v_debug);
       when 'Non-Core Course Failure' then
         prc_non_core_crs_rf_refresh(p_district_sid => v_campus_collection(i).DistrictSID
                                    ,p_campus_sid => v_campus_collection(i).CampusSID
                                    ,p_run_date_sid => v_run_date_sid
                                    ,p_school_year => v_school_year
                                    ,p_passing_grade_threshold => v_campus_collection(i).PassingGradeThreshold
                                    ,p_campus_rf_sid => v_campus_collection(i).Campus_RF_SID
                                    ,p_debug => v_debug);
       else null; -- do nothing --
       end case;
     end loop;    
     
     -- Re-load the merged_student_risk_factor table for all campuses within the district 
     -- If even one campus was changed it couple affect the risk factors of students that
     -- have transfer to other campuses.
     prc_merged_student_rf(p_district_sid => v_campus_collection(1).DistrictSID
                             ,p_school_year => v_school_year
                             ,p_debug => v_debug);
                             
     -- for each campus in this run execute the post processing tasks such as cleaning up 
     -- any max date sids, loading the snapshot table and the risk_factor_phase table.
     for i in v_campus_collection.first..v_campus_collection.last
     loop   
       -- Create/update student_risk_factor_snapshot --
       if v_campus_collection.last = i 
         or v_campus_collection(i).CampusID <> v_campus_collection(i+1).CampusID then

          -- clean up any semester attendance student_risk_factor_facts that have a max date in
          -- the end_date_sid whenever possible.
          prc_sem_att_max_dt_cln_up (p_district_sid => v_campus_collection(i).DistrictSID
                                     ,p_district_id => v_campus_collection(i).DistrictID
                                     ,p_debug => v_debug); 

          -- generate the snapshot records --
          prc_stu_rf_snaphot(v_campus_collection(i).CampusSID
                             ,v_run_date_sid
                             ,v_school_year
                             ,v_debug
                             ,v_rows_inserted);
                             
           -- total up the number of snapshot rows inserted during this run --
           v_total_snapshot_rows := v_rows_inserted + v_total_snapshot_rows;

           -- Update the student_risk_factor_phase_sum table for each campus --
           prc_track_student_rf_phase (v_campus_collection(i).DistrictSID
                                       ,v_campus_collection(i).CampusSID
                                       ,v_run_date_sid
                                       ,v_debug);
       end if;
     end loop;
     
   -- log engine execution --
   v_start_datetime := SYSTIMESTAMP; --update the time to avoid PK violation
   for i in v_campus_collection.first..v_campus_collection.last
     loop
       if i = v_campus_collection.first 
         or v_campus_collection(i).CampusSID <> v_campus_collection(i-1).CampusSID then
         prc_execution_log(v_start_datetime
                           ,v_campus_collection(i).CampusSID
                           ,'EngineExecution'
                           ,'RCE'
                           ,systimestamp
                           ,'Successful'
                           ,v_debug);
         -- log parameters --
         prc_execution_parameter(v_start_datetime
                                 ,v_campus_collection(i).CampusSID
                                 ,'RunDate'
                                 ,p_run_date_id
                                 ,v_debug);
         if p_district_id is not NULL then
           prc_execution_parameter(v_start_datetime
                                   ,v_campus_collection(i).CampusSID
                                   ,'DistrictID'
                                   ,p_district_id
                                   ,v_debug);   
         else
           prc_execution_parameter(v_start_datetime
                                   ,v_campus_collection(i).CampusSID
                                   ,'CampusID'
                                   ,p_campus_id
                                   ,v_debug); 
         end if;
       end if;
     end loop;  
   -- log end time --
   v_end_datetime := SYSTIMESTAMP;
   zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_total_snapshot_rows,('End '||v_proc_name),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    -- Error handling --
    exception
    when e_campus_required then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'Campus parameter was not specified and is required if District not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_id||' Run_date_sid = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_campus_not_found then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'The specified Campus was not found!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'WARNING','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ( Campus = '||p_campus_id||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      
    when e_no_rows_found then
	    v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'No rows found to process based on the specified parameters!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'WARNING','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_id = '||p_campus_id||' Run_date_id = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
  
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_id = '||p_campus_id||' Run_date_id = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
end prc_risk_calc_engine;

-- Overloaded prc_risk_calc_engine() so no need to pass campus_id.
-- 11/10/10 tesposito  
procedure prc_risk_calc_engine (p_run_date_id IN varchar2, p_district_id IN varchar2) is 
    v_campus_id varchar2(20);
    v_debug     varchar2(2) := 'N';
begin
  
    prc_risk_calc_engine (p_campus_id => v_campus_id
                         ,p_run_date_id => p_run_date_id
                         ,p_district_id => p_district_id
                         ,p_debug => v_debug);
  
end prc_risk_calc_engine;

END pkg_risk_calculation_engine;
/

prompt
prompt Creating package body PKG_RISK_FACTOR_CONFIG
prompt ============================================
prompt
create or replace package body dws.PKG_RISK_FACTOR_CONFIG is

  -- Private type declarations
  
  -- Private constant declarations

  -- Private variable declarations

  -- Function and procedure implementations

/* -------------------------------------------------------------
   Name: prc_remove_campus_rf_config
Purpose: This procedure removes the data associated with a campus that was 
         previously processed using the risk calculation engine.
 Inputs: Campus_id - Example, 057904001  the 9 digit campus identifier
Outputs: None.

Log:
Date     By     Descritpion
-------- ------ -------------------------------------------
07-30-12 CBull  Orignal Creation

--------------------------------------------------------------- */
procedure prc_remove_campus_rf_config (p_campus_id IN varchar2)
  as
  
  v_campus_sid number;
  e_campus_is_null exception;
  
  begin
    
    if p_campus_id is not null then
       -- get the campus sid --
       select campus_dim.campus_sid 
         into v_campus_sid
         from campus_dim
        where campus_dim.campus_id = p_campus_id;
        -- Delete the associated risk factor data --
        delete from attendance_risk_factor_fact
           where attendance_risk_factor_fact.campus_sid = v_campus_sid;
           
        delete from student_risk_factor_fact
           where student_risk_factor_fact.campus_sid = v_campus_sid;
           
        delete from student_risk_factor_phase_sum
           where student_risk_factor_phase_sum.campus_sid = v_campus_sid;
           
        delete from student_risk_factor_snapshot
           where student_risk_factor_snapshot.campus_sid = v_campus_sid;
        -- delete the configuration data --
        delete from rf_display_columns
           where rf_display_columns.campus_sid = v_campus_sid;
           
        delete from campus_risk_factor_dim
           where campus_risk_factor_dim.campus_id = p_campus_id;
           
        delete from campus_factor_selection
           where campus_factor_selection.campus_sid = v_campus_sid;
        commit;
    else
      raise e_campus_is_null; -- the campus id was passed in as null --
    end if;
    
    exception
    when no_data_found then
      raise_application_error(-20101, 'Campus was not found');
    when e_campus_is_null then
      raise_application_error(-20102, 'You Must Supply A Campus Id (Ex: 999999001)');
      
end prc_remove_campus_rf_config;

end PKG_RISK_FACTOR_CONFIG;
/

prompt
prompt Creating trigger MAINTAIN_CAMPUS_SELECTIONS
prompt ===========================================
prompt
create or replace trigger dws.maintain_campus_selections
  before insert on campus_factor_selection  
  for each row
declare
  v_record_found           varchar2(3);

  -- campus_risk_factor_dim variables --
  v_district_id             varchar(20);
  v_campus_id               varchar(20);
  v_risk_factor_name        varchar(50);
  v_risk_factor_description varchar(200);
  v_risk_factor_type        varchar(10);
  v_risk_factor_duration    varchar(25);
  v_risk_factor_order       number(2) := 0;

  -- rf_display_columns variables --
  v_attendance                  varchar(3) := 'N';
  v_semester_attendance         varchar(3) := 'N';
  v_core_crs_failure            varchar(3) := 'N';
  v_non_core_crs_failure        varchar(3) := 'N';
  v_sem_core_crs_failure        varchar(3) := 'N';
  v_sem_non_core_crs_failure    varchar(3) := 'N';
  v_gpa                         varchar(3) := 'N';
  v_deficient_credits           varchar(3) := 'N';
  v_discipline                  varchar(3) := 'N';
  v_grade_6_8_retention         varchar(3) := 'N';
  v_cohort                      varchar(3) := 'N';
  v_other                       varchar(3) := 'N';

begin
  
  select 
  district_id,
  campus_id
  into v_district_id, v_campus_id
  from campus_dim
  where campus_dim.campus_sid = :NEW.campus_sid;
  
  select
  risk_factor_name,
  risk_factor_description,
  risk_factor_type,
  risk_factor_duration,
  risk_factor_order
  into v_risk_factor_name,
  v_risk_factor_description,
  v_risk_factor_type,
  v_risk_factor_duration,
  v_risk_factor_order
  from risk_factor
  where risk_factor.risk_factor_sid = :NEW.risk_factor_sid;
  
  begin
    select 'Yes'
    into v_record_found
    from campus_risk_factor_dim
    where campus_risk_factor_dim.risk_factor_name = v_risk_factor_name
      and campus_risk_factor_dim.campus_id = v_campus_id;
    exception
      when no_data_found then
        v_record_found := 'No';
  end;
  
  if v_record_found = 'No' then
        
    insert into campus_risk_factor_dim (
       campus_risk_factor_sid
      ,district_id
      ,campus_id
      ,risk_factor_name
      ,risk_factor_description
      ,risk_factor_type
      ,risk_factor_duration
      ,last_update
      ,risk_factor_order)
    values (
       sid_sequence.nextval
      ,v_district_id
      ,v_campus_id
      ,v_risk_factor_name
      ,v_risk_factor_description
      ,v_risk_factor_type
      ,v_risk_factor_duration
      ,systimestamp
      ,v_risk_factor_order
    );
    
  end if;

  -- process rf display columns --
  
  case v_risk_factor_name
    when 'Attendance' then v_attendance := 'Y';
    when 'Previous Semester Attendance' then v_semester_attendance := 'Y';
    when 'Core Course Failure' then v_core_crs_failure := 'Y';
    when 'Non-Core Course Failure' then v_non_core_crs_failure := 'Y';
    when 'Semester Core Course Failure' then v_sem_core_crs_failure := 'Y';
    when 'Semester Non-Core Course Failure' then v_sem_non_core_crs_failure := 'Y';
    when 'GPA' then v_gpa := 'Y';
    when 'Deficient Credits' then v_deficient_credits := 'Y';
    when 'Discipline' then v_discipline := 'Y';
    when 'Grade 6-8 Retention' then v_grade_6_8_retention := 'Y';
    when '9th Grade Cohort' then v_cohort := 'Y';
  end case;
  v_other := 'Y';
  
  begin
    select 'Yes'
    into v_record_found
    from rf_display_columns
    where rf_display_columns.campus_sid = :NEW.campus_sid;
    exception
      when no_data_found then
        v_record_found := 'No';
  end;
  
  if v_record_found = 'No' then 
    insert into rf_display_columns
     ( campus_sid
     , attendance
     , semester_attendance
     , core_crs_failure
     , non_core_crs_failure
     , sem_core_crs_failure
     , sem_non_core_crs_failure
     , gpa
     , deficient_credits
     , discipline
     , grade_6_8_retention
     , cohort
     , other)
    values(
       :NEW.campus_sid
     , v_attendance
     , v_semester_attendance
     , v_core_crs_failure
     , v_non_core_crs_failure
     , v_sem_core_crs_failure
     , v_sem_non_core_crs_failure
     , v_gpa
     , v_deficient_credits
     , v_discipline
     , v_grade_6_8_retention
     , v_cohort
     , v_other);
  else
    case v_risk_factor_name
      when 'Attendance' then
        update rf_display_columns
          set rf_display_columns.attendance = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Previous Semester Attendance' then 
        update rf_display_columns
          set rf_display_columns.semester_attendance = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Core Course Failure' then 
        update rf_display_columns
          set rf_display_columns.core_crs_failure = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Non-Core Course Failure' then 
        update rf_display_columns
          set rf_display_columns.non_core_crs_failure = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Semester Core Course Failure' then 
        update rf_display_columns
          set rf_display_columns.sem_core_crs_failure = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Semester Non-Core Course Failure' then 
        update rf_display_columns
          set rf_display_columns.sem_non_core_crs_failure = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'GPA' then 
        update rf_display_columns
          set rf_display_columns.gpa = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Deficient Credits' then 
        update rf_display_columns
          set rf_display_columns.deficient_credits = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Discipline' then 
        update rf_display_columns
          set rf_display_columns.discipline = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when 'Grade 6-8 Retention' then 
        update rf_display_columns
          set rf_display_columns.grade_6_8_retention = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
      when '9th Grade Cohort' then 
        update rf_display_columns
          set rf_display_columns.cohort = 'Y'
          where rf_display_columns.campus_sid = :NEW.campus_sid;
    end case;
  end if;

end maintain_campus_selections;
/


spool off
