-----------------------------------------------------------
-- Export file for user CORE@DATAWH                      --
-- Created by espositot on 5/26/2016, 15:27:28 15:27:28  --
-----------------------------------------------------------

set define off
spool core_ddl.log

prompt
prompt Creating table DISTRICT_DIM
prompt ===========================
prompt
create table CORE.DISTRICT_DIM
(
  district_sid   NUMBER not null,
  district_id    VARCHAR2(20) not null,
  district_area  VARCHAR2(30),
  district_name  VARCHAR2(75),
  address        VARCHAR2(100),
  address_line_2 VARCHAR2(100),
  city           VARCHAR2(50),
  state_code     VARCHAR2(2),
  postal_code    VARCHAR2(10),
  county         VARCHAR2(50),
  district_key   VARCHAR2(20),
  last_update    TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table CORE.DISTRICT_DIM
  is 'A local education agency.
Example: Dallas Independent School District';
comment on column CORE.DISTRICT_DIM.district_area
  is 'The educational area or region in which the district is located.
Example: Region 10
';
comment on column CORE.DISTRICT_DIM.district_key
  is 'Uniquely identifies a district.  A concatenation of state code and district id.
Example: TX*043901';
alter table CORE.DISTRICT_DIM
  add constraint PK_DISTRICT_DIM primary key (DISTRICT_SID)
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
alter table CORE.DISTRICT_DIM
  add constraint AK_DISTRICT_BUS_KEY unique (DISTRICT_KEY)
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
prompt Creating table ABSENCE_REASON_DIM
prompt =================================
prompt
create table CORE.ABSENCE_REASON_DIM
(
  absence_reason_sid         NUMBER not null,
  district_sid               NUMBER not null,
  absence_reason_code        VARCHAR2(20) not null,
  absence_reason_description VARCHAR2(50),
  absence_reason_key         VARCHAR2(40),
  last_update                TIMESTAMP(6) not null,
  exclude_absence_reason     VARCHAR2(3) default 'No' not null
)
tablespace DW_DEFAULT01
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
comment on table CORE.ABSENCE_REASON_DIM
  is 'The reason that a student missed instruction such as excused or unexcused.';
comment on column CORE.ABSENCE_REASON_DIM.absence_reason_key
  is 'The business key for an absence reason.  The concatenation of state code, district id and absence reason code.
Example: TX*043901*Doctors Appointment';
comment on column CORE.ABSENCE_REASON_DIM.exclude_absence_reason
  is 'Indicates that the Absence Reason should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table CORE.ABSENCE_REASON_DIM
  add constraint PK_ABSENCE_REASON_DIM primary key (ABSENCE_REASON_SID)
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
alter table CORE.ABSENCE_REASON_DIM
  add constraint AK_ABS_RSN_BUS_KEY unique (ABSENCE_REASON_KEY)
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
alter table CORE.ABSENCE_REASON_DIM
  add constraint FK_ABSENCE__REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references CORE.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ACADEMIC_RECORD_SOURCE_DIM
prompt =========================================
prompt
create table CORE.ACADEMIC_RECORD_SOURCE_DIM
(
  academic_source_code        VARCHAR2(1) not null,
  academic_source_description VARCHAR2(20)
)
tablespace DW_DEFAULT01
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
comment on table CORE.ACADEMIC_RECORD_SOURCE_DIM
  is 'Indicates the where the record of academic achievement came from, classroom, transfer, exam, etc...';
comment on column CORE.ACADEMIC_RECORD_SOURCE_DIM.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column CORE.ACADEMIC_RECORD_SOURCE_DIM.academic_source_description
  is 'Describes the Academic Source Code.
Examples: Transfer,
                 Classroom,
                 Exam,
                 Online';
create unique index CORE.PK_CREDIT_TYPE_DIM on CORE.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE)
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
alter table CORE.ACADEMIC_RECORD_SOURCE_DIM
  add constraint PK_ACADEMIC_RECORD_SOURCE_DIM primary key (ACADEMIC_SOURCE_CODE);

prompt
prompt Creating table AD_CAMPUS_XREF
prompt =============================
prompt
create table CORE.AD_CAMPUS_XREF
(
  campus_sid_new   NUMBER,
  campus_sid_old   NUMBER,
  district_sid_new NUMBER,
  district_sid_old NUMBER,
  district_id_new  VARCHAR2(20),
  district_id_old  VARCHAR2(20),
  campus_id_new    VARCHAR2(20),
  campus_id_old    VARCHAR2(20),
  campus_key_new   VARCHAR2(40),
  campus_key_old   VARCHAR2(40)
)
tablespace DW_DEFAULT01
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
prompt Creating table AD_FIRST_NAME
prompt ============================
prompt
create table CORE.AD_FIRST_NAME
(
  name_sid   NUMBER not null,
  first_name VARCHAR2(50) not null,
  gender     VARCHAR2(6) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table AD_LAST_NAME
prompt ===========================
prompt
create table CORE.AD_LAST_NAME
(
  name_sid  NUMBER not null,
  last_name VARCHAR2(50)
)
tablespace DW_DEFAULT01
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
prompt Creating table AD_SCHOOL_NAME
prompt =============================
prompt
create table CORE.AD_SCHOOL_NAME
(
  name_sid    NUMBER not null,
  school_name VARCHAR2(50)
)
tablespace DW_DEFAULT01
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
prompt Creating table AD_STREET_NAME
prompt =============================
prompt
create table CORE.AD_STREET_NAME
(
  name_sid    NUMBER not null,
  street_name VARCHAR2(50) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table AD_STUDENT_XREF
prompt ==============================
prompt
create table CORE.AD_STUDENT_XREF
(
  student_sid_old  NUMBER not null,
  student_sid_new  NUMBER not null,
  student_id_new   VARCHAR2(25) not null,
  student_id_old   VARCHAR2(25) not null,
  district_sid_new NUMBER not null,
  district_sid_old NUMBER not null,
  district_id_new  VARCHAR2(20) not null,
  district_id_old  VARCHAR2(20) not null,
  campus_id_old    VARCHAR2(20) not null,
  campus_id_new    VARCHAR2(20) not null,
  campus_sid       NUMBER not null,
  campus_sid_new   NUMBER not null
)
tablespace DW_DEFAULT01
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
prompt Creating table CAMPUS_DIM
prompt =========================
prompt
create table CORE.CAMPUS_DIM
(
  campus_sid              NUMBER not null,
  district_sid            NUMBER not null,
  district_id             VARCHAR2(20),
  district_name           VARCHAR2(75),
  campus_id               VARCHAR2(20) not null,
  campus_name             VARCHAR2(75),
  campus_short_name       VARCHAR2(30),
  periods_per_day         NUMBER,
  attendance_threshold    NUMBER,
  campus_key              VARCHAR2(40),
  last_update             TIMESTAMP(6),
  passing_grade_threshold NUMBER,
  default_grading_cycle   VARCHAR2(15)
)
tablespace DW_DEFAULT01
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
comment on table CORE.CAMPUS_DIM
  is 'Identifies a physical location where a instruction takes place.

Issues:
1) May need an "OFF CAMPUS" dimension row for courses, grades and credits that come from off campus sources such as college, distance learning, etc.';
comment on column CORE.CAMPUS_DIM.campus_name
  is 'Full name of the campus.
Example: McKinney Central High School,
               Frisco High School';
comment on column CORE.CAMPUS_DIM.campus_short_name
  is 'Short name of the campus
Example: Central,
               Frisco HS';
comment on column CORE.CAMPUS_DIM.periods_per_day
  is 'The number of scheduled periods per day at this campus.
Example: 7
8
4 (for A/B block schedule)';
comment on column CORE.CAMPUS_DIM.attendance_threshold
  is 'The percentage threshold by which students will be flagged for the attendance risk factor.
Example: .10 - 10%
               .08 - 8%';
comment on column CORE.CAMPUS_DIM.campus_key
  is 'Uniquely identifies a campus. A concatenation of the state code, district id, and campus id.
Example: TX*043901*043901001';
comment on column CORE.CAMPUS_DIM.passing_grade_threshold
  is 'Defines the lowest pasing number grade at this campus.
Example: 70 (default),
                60,
                80';
comment on column CORE.CAMPUS_DIM.default_grading_cycle
  is 'Defines the grading cycle to be used by the core/non-core risk factor for this campus.
Values: 6-Weeks,
             9-Weeks';
create bitmap index CORE.BMI_CAMPUS_DIM_DISTRICT_FK on CORE.CAMPUS_DIM (DISTRICT_SID)
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
alter table CORE.CAMPUS_DIM
  add constraint PK_CAMPUS_DIM primary key (CAMPUS_SID)
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
alter table CORE.CAMPUS_DIM
  add constraint AK_CAMPUS_DIM_BUS_KEY unique (CAMPUS_KEY)
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
alter table CORE.CAMPUS_DIM
  add constraint FK_CAMPUS_D_RELATIONS_DISTRICT foreign key (DISTRICT_SID)
  references CORE.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table CLASS_PERIOD_DIM
prompt ===============================
prompt
create table CORE.CLASS_PERIOD_DIM
(
  class_period_sid     NUMBER not null,
  campus_sid           NUMBER not null,
  class_period         VARCHAR2(3),
  class_period_key     VARCHAR2(25),
  last_update          TIMESTAMP(6),
  exclude_class_period VARCHAR2(3) default 'No' not null
)
tablespace DW_DEFAULT01
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
comment on table CORE.CLASS_PERIOD_DIM
  is 'Identifies the division of the day assigned the a particular class of instruction.';
comment on column CORE.CLASS_PERIOD_DIM.class_period_sid
  is 'Surrogate Key for Class Period Dim.';
comment on column CORE.CLASS_PERIOD_DIM.campus_sid
  is 'The Campus Sid of the campus that owns the class periods.';
comment on column CORE.CLASS_PERIOD_DIM.class_period
  is 'The time slot that class of instruction meets.
Example: 01,
                02,
                10
                M01,
                M24,
                KG,
                PK';
comment on column CORE.CLASS_PERIOD_DIM.class_period_key
  is 'The business key for the district class periods.
Example: TX*057904*057905001*001
                TX*043901*043901003*M13';
comment on column CORE.CLASS_PERIOD_DIM.last_update
  is 'Date time that the row was inserted or updated.';
comment on column CORE.CLASS_PERIOD_DIM.exclude_class_period
  is 'Indicates that the Class Period should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table CORE.CLASS_PERIOD_DIM
  add constraint PK_CLASS_PERIOD_DIM primary key (CLASS_PERIOD_SID)
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
alter table CORE.CLASS_PERIOD_DIM
  add constraint AK_CLASS_PERIOD_DIM_BUS_KEY unique (CLASS_PERIOD_KEY)
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
alter table CORE.CLASS_PERIOD_DIM
  add constraint FK_CLASS_PE_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table CLASS_PERIOD_DIM_REJ
prompt ===================================
prompt
create table CORE.CLASS_PERIOD_DIM_REJ
(
  class_period_sid     NUMBER,
  campus_sid           NUMBER,
  class_period         VARCHAR2(3),
  class_period_key     VARCHAR2(25),
  last_update          TIMESTAMP(6),
  exclude_class_period VARCHAR2(3),
  errorcode            VARCHAR2(255),
  errormessage         VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
prompt Creating table COURSE_DIM
prompt =========================
prompt
create table CORE.COURSE_DIM
(
  course_sid               NUMBER not null,
  district_sid             NUMBER,
  campus_id                VARCHAR2(20),
  course_code              VARCHAR2(15),
  course_description       VARCHAR2(150),
  school_year              VARCHAR2(4),
  state_course_code        VARCHAR2(15),
  state_course_description VARCHAR2(150),
  core_course_flag         VARCHAR2(3),
  course_key               VARCHAR2(30),
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
comment on table CORE.COURSE_DIM
  is 'A state or locally define curriculum of instruction.';
comment on column CORE.COURSE_DIM.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column CORE.COURSE_DIM.campus_id
  is 'Identifes the campus that owns this particular course.
example: 888888002';
comment on column CORE.COURSE_DIM.course_code
  is 'The local distrcit/campus identifier for course.';
comment on column CORE.COURSE_DIM.course_description
  is 'The local name or description of course.';
comment on column CORE.COURSE_DIM.school_year
  is 'The applicable school year for this course.
Example: 2010';
comment on column CORE.COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column CORE.COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column CORE.COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column CORE.COURSE_DIM.course_key
  is 'The business key for the course consisting of State Abbrev||"*"||Campus ID||"*"||School Year(YYYY)||''*''||Local Course Code
Example: TX*043901002*2010*439204';
alter table CORE.COURSE_DIM
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
alter table CORE.COURSE_DIM
  add constraint COURSE_DIM_AK unique (COURSE_KEY)
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
alter table CORE.COURSE_DIM
  add constraint FK_COURSE_D_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references CORE.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table COURSE_SECTION_DIM
prompt =================================
prompt
create table CORE.COURSE_SECTION_DIM
(
  course_section_sid       NUMBER not null,
  campus_id                VARCHAR2(20),
  course_code              VARCHAR2(15),
  course_description       VARCHAR2(150),
  course_section_number    VARCHAR2(15),
  school_year              VARCHAR2(4),
  term                     VARCHAR2(1),
  state_course_code        VARCHAR2(15),
  state_course_description VARCHAR2(150),
  core_course_flag         VARCHAR2(3),
  course_section_key       VARCHAR2(50),
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
comment on table CORE.COURSE_SECTION_DIM
  is 'Identifies a scheduled course.';
comment on column CORE.COURSE_SECTION_DIM.course_section_sid
  is 'Surrogate key for the Course Section Dim.';
comment on column CORE.COURSE_SECTION_DIM.campus_id
  is 'Identifies the Campus where this section of the course is taught.
Example: 19902002
';
comment on column CORE.COURSE_SECTION_DIM.course_code
  is 'Identifies the Course being taught.
Example: 1001';
comment on column CORE.COURSE_SECTION_DIM.course_description
  is 'Describes the Course being taught.
Example: ENGLISH 1  ';
comment on column CORE.COURSE_SECTION_DIM.course_section_number
  is 'Identifies the Course Section being taught.
Example: 001';
comment on column CORE.COURSE_SECTION_DIM.school_year
  is 'Describes the school year for the Course Section being taught.
Example: 2011';
comment on column CORE.COURSE_SECTION_DIM.term
  is 'Identifes the period of time the Course Section is being taught during the school year.
Example: 1 (Semester or trimester)
                2 (Semester or trimester),
                3 (trimester),
                 Y (Full Year)';
comment on column CORE.COURSE_SECTION_DIM.state_course_code
  is 'Identifies the associated State course for the Course Section being taught.
Example: 03220100';
comment on column CORE.COURSE_SECTION_DIM.state_course_description
  is 'Describes the associated State course for the Course Section being taught.
Example: English I (1 Unit) (ENG 1)';
comment on column CORE.COURSE_SECTION_DIM.core_course_flag
  is 'Identifies if the Course Section being taught is a Core Course.
Values: Yes/No';
comment on column CORE.COURSE_SECTION_DIM.course_section_key
  is 'The Busines Key for the Course Section Dim consisting of the state code, campus id, school year,course code, section number, term.
Example: TX*199902002*2011*1001*001*Y';
comment on column CORE.COURSE_SECTION_DIM.last_update
  is 'The Date/Time the row as last inserted or updated.';
alter table CORE.COURSE_SECTION_DIM
  add constraint PK_COURSE_SECTION_DIM primary key (COURSE_SECTION_SID)
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
alter table CORE.COURSE_SECTION_DIM
  add constraint AK_COURSE_SECTION_DIM_COURSE_S unique (COURSE_SECTION_KEY)
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

prompt
prompt Creating table DATE_DIM
prompt =======================
prompt
create table CORE.DATE_DIM
(
  date_sid                   NUMBER not null,
  district_sid               NUMBER not null,
  date_id                    DATE not null,
  calendar_year              VARCHAR2(4) not null,
  calendar_year_quarter      VARCHAR2(7) not null,
  calendar_quarter           VARCHAR2(1) not null,
  calendar_year_month        VARCHAR2(6) not null,
  calendar_month             VARCHAR2(2) not null,
  calendar_month_name        VARCHAR2(9) not null,
  calendar_month_short_name  VARCHAR2(3) not null,
  calendar_week              VARCHAR2(2) not null,
  day_of_week                VARCHAR2(1) not null,
  day_of_week_name           VARCHAR2(9) not null,
  day_of_week_short_name     VARCHAR2(3) not null,
  school_year                VARCHAR2(4) not null,
  school_year_description    VARCHAR2(9) not null,
  school_week                VARCHAR2(2),
  year_month_day             VARCHAR2(8) not null,
  short_date                 VARCHAR2(10) not null,
  long_date                  VARCHAR2(18) not null,
  school_day_indicator       VARCHAR2(13),
  academic_6_weeks           VARCHAR2(1),
  academic_9_weeks           VARCHAR2(1),
  semester                   VARCHAR2(1),
  first_day_academic_6_weeks VARCHAR2(3),
  last_day_academic_6_weeks  VARCHAR2(3),
  first_day_academic_9_weeks VARCHAR2(3),
  last_day_academic_9_weeks  VARCHAR2(3),
  first_day_semester         VARCHAR2(3),
  last_day_semester          VARCHAR2(3),
  date_key                   VARCHAR2(30),
  last_update                TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table CORE.DATE_DIM
  is 'Identifies the common and districts specific calendars.';
comment on column CORE.DATE_DIM.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.DATE_DIM.district_sid
  is 'Surrogate key';
comment on column CORE.DATE_DIM.date_id
  is 'A specific day of the year';
comment on column CORE.DATE_DIM.calendar_year
  is 'Example: 2009';
comment on column CORE.DATE_DIM.calendar_year_quarter
  is 'Example: 2009 Q1';
comment on column CORE.DATE_DIM.calendar_quarter
  is 'Example: 1';
comment on column CORE.DATE_DIM.calendar_year_month
  is 'Example: 200912';
comment on column CORE.DATE_DIM.calendar_month
  is 'Example: 12';
comment on column CORE.DATE_DIM.calendar_month_name
  is 'Example: December';
comment on column CORE.DATE_DIM.calendar_month_short_name
  is 'Example: Dec';
comment on column CORE.DATE_DIM.calendar_week
  is 'Example: 50';
comment on column CORE.DATE_DIM.day_of_week
  is 'The number representing the day of the week
Values:
1 (Sunday)
2 (Monday)
3 (Tuesday)
4 (Wednesday)
5 (Thursday)
6 (Friday)
7 (Saturday)
';
comment on column CORE.DATE_DIM.day_of_week_name
  is 'Example: Thursday';
comment on column CORE.DATE_DIM.day_of_week_short_name
  is 'Example: Thu';
comment on column CORE.DATE_DIM.school_year
  is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column CORE.DATE_DIM.school_year_description
  is 'Example: 2009/2010';
comment on column CORE.DATE_DIM.school_week
  is 'Example: 24';
comment on column CORE.DATE_DIM.year_month_day
  is 'Example: 20091215';
comment on column CORE.DATE_DIM.short_date
  is 'Example: 12/15/2009';
comment on column CORE.DATE_DIM.long_date
  is 'Example: December 15, 2009';
comment on column CORE.DATE_DIM.school_day_indicator
  is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column CORE.DATE_DIM.academic_6_weeks
  is 'Identifies the 6 weeks period associated with the academic day.  Non-academic days are set to ''0''.
Values:
1
2
3
4
5
6
0 - non-instructional days';
comment on column CORE.DATE_DIM.academic_9_weeks
  is 'Identifies the 9 weeks period associated with the academic day.  Non-academic days are set to ''0''.
Values:
1
2
3
4
5
6
7
8
9
0 - non-instructional days';
comment on column CORE.DATE_DIM.semester
  is 'Example: 1';
comment on column CORE.DATE_DIM.first_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.last_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.first_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.last_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.first_day_semester
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.last_day_semester
  is 'Values: Yes/No';
comment on column CORE.DATE_DIM.date_key
  is 'The unique business key for a date.  The concatenation of state code, district id, and date(YYYYMMDD)
Example: TX*043901*20100715';
alter table CORE.DATE_DIM
  add constraint PK_DATE_DIM primary key (DATE_SID)
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
alter table CORE.DATE_DIM
  add constraint AK_DATE_DIM_BUS_KEY unique (DATE_KEY)
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
alter table CORE.DATE_DIM
  add constraint FK_DATE_DIM_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references CORE.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ETL_GRADINGPERIOD_TO_GRADETYPE
prompt =============================================
prompt
create table CORE.ETL_GRADINGPERIOD_TO_GRADETYPE
(
  cdm_grading_period VARCHAR2(35),
  period_number      VARCHAR2(1),
  cycle_type         VARCHAR2(4)
)
tablespace DW_DEFAULT01
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
comment on table CORE.ETL_GRADINGPERIOD_TO_GRADETYPE
  is 'Converts CDM grading period to CORE Grade_Type as well as identifing the associated period number.';
comment on column CORE.ETL_GRADINGPERIOD_TO_GRADETYPE.cdm_grading_period
  is 'The GradingPeriod from the TSDS CDM model.
Example: First Six Weeks,
                Second Nine Weeks,
                Second Semester';
comment on column CORE.ETL_GRADINGPERIOD_TO_GRADETYPE.period_number
  is 'Grading Period for specific Grade Type';
comment on column CORE.ETL_GRADINGPERIOD_TO_GRADETYPE.cycle_type
  is 'Values(Six, Nine, Sem).  Used to Access Date_DIM in common loader.';

prompt
prompt Creating table GRADE_LEVEL_DIM
prompt ==============================
prompt
create table CORE.GRADE_LEVEL_DIM
(
  grade_level_sid         NUMBER(2) not null,
  grade_level             VARCHAR2(2),
  grade_level_description VARCHAR2(30),
  grade_level_order       NUMBER(2)
)
tablespace DW_DEFAULT01
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
comment on table CORE.GRADE_LEVEL_DIM
  is 'Identifies the student grade level.
Example: 01
                PK
                KG
                12';
comment on column CORE.GRADE_LEVEL_DIM.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column CORE.GRADE_LEVEL_DIM.grade_level
  is 'Identifies a students assigned grade.
Example: 01
                02
                12';
comment on column CORE.GRADE_LEVEL_DIM.grade_level_description
  is 'Describes a grade level.
Example: First Grade
               Second Grade
               Twelth Grade';
comment on column CORE.GRADE_LEVEL_DIM.grade_level_order
  is 'Indicates the order of the grade levels for sorting.
Example: 1
                2
                3
';
alter table CORE.GRADE_LEVEL_DIM
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
prompt Creating table GRADE_TYPE_DIM
prompt =============================
prompt
create table CORE.GRADE_TYPE_DIM
(
  grade_type_sid         NUMBER not null,
  grade_type             VARCHAR2(25),
  grade_type_description VARCHAR2(150),
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
comment on table CORE.GRADE_TYPE_DIM
  is 'Identifies the period in time the grade occured.
Example: Progess Report
               Marking Period
               6 Weeks
               Semester
               Exam
';
comment on column CORE.GRADE_TYPE_DIM.grade_type_sid
  is 'Surrogate Key for the Grade Type dim';
comment on column CORE.GRADE_TYPE_DIM.grade_type
  is 'Describes what type of grade.
Example: Six Weeks,
                Semester,
                Progress Report,
                Exam,
                Final';
comment on column CORE.GRADE_TYPE_DIM.grade_type_description
  is 'The Full Description of the grade type.
Example: The six weeks grade revceived by the student';
comment on column CORE.GRADE_TYPE_DIM.last_update
  is 'The data time this row was last insert/updated';
alter table CORE.GRADE_TYPE_DIM
  add constraint PK_GRADE_TYPE_DIM primary key (GRADE_TYPE_SID)
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

prompt
prompt Creating table RACE_ETHNICITY_DIM
prompt =================================
prompt
create table CORE.RACE_ETHNICITY_DIM
(
  race_ethnicity_sid             NUMBER(4) not null,
  yes_no_key                     VARCHAR2(6),
  binary_key                     VARCHAR2(6),
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
  );
comment on table CORE.RACE_ETHNICITY_DIM
  is 'Idenitfies the ethnicity and race selections of a person.';
comment on column CORE.RACE_ETHNICITY_DIM.race_ethnicity_sid
  is 'Surrogate key';
comment on column CORE.RACE_ETHNICITY_DIM.yes_no_key
  is 'A look up key based on Y and N flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column CORE.RACE_ETHNICITY_DIM.binary_key
  is 'A look up key based on 1 and 0 flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column CORE.RACE_ETHNICITY_DIM.race_ethnicity_key
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
comment on column CORE.RACE_ETHNICITY_DIM.ethnicity
  is 'Indicates that the individual selected Hispanic/Latino(Yes) or Not Hispanic/Latino(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.ethnicity_description
  is 'Values:
Hispanic/Latino
Not Hispanic/Latino';
comment on column CORE.RACE_ETHNICITY_DIM.american_indian_alaska_native
  is 'Indicates that the individual selected American Indian/Alaska Native(Yes) or Not American Indian/Alaska Native(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.amer_indian_alaskan_desc
  is 'Values:
American Indian or Alaska Native
Not American Indian or Alaska Native';
comment on column CORE.RACE_ETHNICITY_DIM.asian
  is 'Indicates that the individual selected Asian(Yes) or Not Asian(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.asian_description
  is 'Values:
Asian
Not Asian';
comment on column CORE.RACE_ETHNICITY_DIM.black_or_african_american
  is 'Indicates that the individual selected Black or African American(Yes) or Not Black or African American(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.black_african_amer_desc
  is 'Values:
Black or African American
Not Black or African American';
comment on column CORE.RACE_ETHNICITY_DIM.native_hawaiian_pacific_island
  is 'Indicates that the individual selected Native Hawaiian or Pacific Islander(Yes) or Not Native Hawaiian or Pacific Islander(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.hawaiian_pacific_island_desc
  is 'Values:
Native Hawaiian/Other Pacific Islander
Not Native Hawaiian/Other Pacific Islander';
comment on column CORE.RACE_ETHNICITY_DIM.white
  is 'Indicates that the individual selected White(Yes) or Not White(No).
Values:
Yes
No';
comment on column CORE.RACE_ETHNICITY_DIM.white_description
  is 'Values:
White
Not White';
comment on column CORE.RACE_ETHNICITY_DIM.two_or_more_races
  is 'Indicates that two or more races were selected.
Example:
Asian, White';
comment on column CORE.RACE_ETHNICITY_DIM.race_ethnicity_long_desc
  is 'The verbose description of the selected races.
Example:
Hispanic/Latino, American Indian or Alaska Native, Asian, Black or African American, Native Hawaiian/Other Pacific_Islander, White

Black or African American, White';
comment on column CORE.RACE_ETHNICITY_DIM.race_ethnicity_short_desc
  is 'A short abbreviated description of the races selected.
Example:
Hispanic, Amer. Indian/Alaska Nat. , Asian, Black, Hawaiian/Pacific Is., White

Black, White';
alter table CORE.RACE_ETHNICITY_DIM
  add constraint PK_RACE_ETHNICITY_DIM primary key (RACE_ETHNICITY_SID)
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
alter table CORE.RACE_ETHNICITY_DIM
  add constraint AK_RACE_ETH_DIM_BUS_K_RACE_ETH unique (RACE_ETHNICITY_KEY)
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

prompt
prompt Creating table SO_DISTRICT_COPY
prompt ===============================
prompt
create table CORE.SO_DISTRICT_COPY
(
  ldap_email     VARCHAR2(100),
  ldap_user_id   VARCHAR2(100),
  ldap_user_name VARCHAR2(100),
  ldap_district  VARCHAR2(100)
)
tablespace DW_DEFAULT01
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
prompt Creating table SO_EMAIL_LDAP
prompt ============================
prompt
create table CORE.SO_EMAIL_LDAP
(
  ldap_email     VARCHAR2(100),
  ldap_user_id   VARCHAR2(100),
  ldap_user_name VARCHAR2(100),
  ldap_district  VARCHAR2(100),
  ldap_campus    VARCHAR2(100),
  ldap_source    CHAR(1)
)
tablespace DW_DEFAULT01
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
prompt Creating table SO_LDAP_EXPORT
prompt =============================
prompt
create table CORE.SO_LDAP_EXPORT
(
  ldap_text  VARCHAR2(255),
  ldap_value VARCHAR2(255),
  trans_nbr  VARCHAR2(25),
  trans_type VARCHAR2(5),
  line_nbr   NUMBER
)
tablespace DW_DEFAULT01
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
create bitmap index CORE.BMI_TRANS_NBR on CORE.SO_LDAP_EXPORT (TRANS_NBR)
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
create bitmap index CORE.BMI_TRANS_TYPE on CORE.SO_LDAP_EXPORT (TRANS_TYPE)
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
prompt Creating table STATE_COURSE_DIM
prompt ===============================
prompt
create table CORE.STATE_COURSE_DIM
(
  state_course_sid         NUMBER not null,
  state_code               VARCHAR2(2) not null,
  state_course_code        VARCHAR2(15),
  state_course_description VARCHAR2(150),
  core_course_flag         VARCHAR2(3),
  state_course_key         VARCHAR2(20),
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
comment on table CORE.STATE_COURSE_DIM
  is 'Contains all of the state defined courses.';
comment on column CORE.STATE_COURSE_DIM.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column CORE.STATE_COURSE_DIM.state_code
  is 'The upper case two character state code for this course.
Example: TX';
comment on column CORE.STATE_COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column CORE.STATE_COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column CORE.STATE_COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column CORE.STATE_COURSE_DIM.state_course_key
  is 'The business key used to look state courses. Consisting of the state code * state course code
Example: TX*049304939';
alter table CORE.STATE_COURSE_DIM
  add constraint PK_STATE_COURSE_DIM primary key (STATE_COURSE_SID)
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
alter table CORE.STATE_COURSE_DIM
  add constraint AK_STATE_COURSE_AK_STATE_CO unique (STATE_COURSE_KEY)
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
prompt Creating table STUDENT_DIM
prompt ==========================
prompt
create table CORE.STUDENT_DIM
(
  student_sid                    NUMBER not null,
  district_sid                   NUMBER not null,
  first_name                     VARCHAR2(50),
  middle_name                    VARCHAR2(50),
  last_name                      VARCHAR2(50),
  full_name                      VARCHAR2(100),
  student_id                     VARCHAR2(25),
  current_grade_level            VARCHAR2(3),
  currently_enrolled_flag        VARCHAR2(3),
  address                        VARCHAR2(100),
  address_line_2                 VARCHAR2(100),
  city                           VARCHAR2(50),
  state_code                     VARCHAR2(2),
  postal_code                    VARCHAR2(10),
  phone_number                   VARCHAR2(15),
  secondary_phone_number         VARCHAR2(15),
  additional_phone_number        VARCHAR2(15),
  date_of_birth                  DATE,
  gender                         VARCHAR2(6),
  ethnicity                      VARCHAR2(3),
  american_indian_alaska_native  VARCHAR2(3),
  asian                          VARCHAR2(3),
  black_or_african_american      VARCHAR2(3),
  native_hawaiian_pacific_island VARCHAR2(3),
  white                          VARCHAR2(3),
  two_or_more_races              VARCHAR2(3),
  race_ethnicity_short_desc      VARCHAR2(80),
  primary_language               VARCHAR2(20),
  ninth_grade_cohort             VARCHAR2(4),
  limited_english_proficiency    VARCHAR2(3),
  lep_first_year_monitoring      VARCHAR2(3),
  lep_second_year_monitoring     VARCHAR2(3),
  immigrant                      VARCHAR2(3),
  migrant                        VARCHAR2(3),
  economically_disadvantaged     VARCHAR2(3),
  special_education              VARCHAR2(3),
  meal_eligibility               VARCHAR2(30),
  primary_disability             VARCHAR2(40),
  secondary_disability           VARCHAR2(40),
  tertiary_disability            VARCHAR2(40),
  date_entered_ninth_grade       DATE,
  student_photo                  BLOB,
  race_ethnicity_key             VARCHAR2(6),
  campus_security_key            VARCHAR2(20),
  district_security_key          VARCHAR2(20),
  student_key                    VARCHAR2(50),
  last_update                    TIMESTAMP(6),
  campus_sid                     NUMBER,
  campus_id                      VARCHAR2(20)
)
tablespace DW_DEFAULT01
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
comment on table CORE.STUDENT_DIM
  is 'Identifies a person who receives instruction from a district/campus.';
comment on column CORE.STUDENT_DIM.postal_code
  is 'Students zip code. may include plus 4. Example: 75444-3333';
comment on column CORE.STUDENT_DIM.phone_number
  is 'Students Primary contact phone number digits only.  Example: 5558884444';
comment on column CORE.STUDENT_DIM.gender
  is 'Students Gender Values: Male/Female';
comment on column CORE.STUDENT_DIM.ethnicity
  is 'Hispanic or Not. Values Yes, No';
comment on column CORE.STUDENT_DIM.american_indian_alaska_native
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.asian
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.black_or_african_american
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.native_hawaiian_pacific_island
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.white
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.two_or_more_races
  is 'Values Yes, No';
comment on column CORE.STUDENT_DIM.race_ethnicity_short_desc
  is 'Concatenation of Student ethnicity and races.
Example: Hispanic, Amer. Indian/Alaskan. , Asian, Black';
comment on column CORE.STUDENT_DIM.primary_language
  is 'Students primary spoken language.  Example: Spanish';
comment on column CORE.STUDENT_DIM.ninth_grade_cohort
  is 'The calculated year of graduation based on the year the student entered the ninth grade.';
comment on column CORE.STUDENT_DIM.limited_english_proficiency
  is 'Students who are unable to communicate effectively in English because their primary language is not English and they have not developed fluency in the English language.
Values: Yes/No';
comment on column CORE.STUDENT_DIM.lep_first_year_monitoring
  is 'Students who are in first year monitoring for limited english proficiency.
values: Yes/No';
comment on column CORE.STUDENT_DIM.lep_second_year_monitoring
  is 'Students who are in second year monitoring for limited english proficiency.
values: Yes/No';
comment on column CORE.STUDENT_DIM.immigrant
  is 'Students who are not naturalized citizens of the United States.
Values: Yes/No';
comment on column CORE.STUDENT_DIM.migrant
  is 'Student whose family frequently moves to follow seasonal work patterns.
Values: Yes/No';
comment on column CORE.STUDENT_DIM.economically_disadvantaged
  is 'An indication of inadequate financial condition of a student''s family, as determined by family income,
number of family members/dependents, participation in public assistance programs, and/or other
characteristics considered relevant by federal, state, and local policy.
Values: Yes/No';
comment on column CORE.STUDENT_DIM.special_education
  is 'Indicates that a student is participating a special education program.
Values: Yes/No';
comment on column CORE.STUDENT_DIM.meal_eligibility
  is 'Eligibility status for School food Service Programs
examples:  Free
               , Full Price
              , Reduced Price,
              , Unknown
';
comment on column CORE.STUDENT_DIM.primary_disability
  is 'The type of primary disability recorded in the student''s IEP (Individualized Education Program)
Examples: Emotional Disturbance,
	Autism,
	Other Health Impairment,
	Orthopedic Impairment,
	Auditory Impairment,
	Unknown,
	Visual Impairment,
	Mental RetardationMental Retardation,
	Speech ImpairmentSpeech Impairment,
	Speech Impairment,
	Learning DisabilityLearning Disability,
	Visual ImpairmentVisual Impairment,
	AutismAutism,
	Mental Retardation,
	Noncategorical Early Childhood,
	Traumatic Brain Injury,
	Learning Disability,
	Auditory ImpairmentAuditory Impairment
';
comment on column CORE.STUDENT_DIM.secondary_disability
  is 'The type of secondary disability recorded in the student''s IEP (Individualized Education Program)
Examples: Emotional Disturbance,
	Autism,
	Other Health Impairment,
	Orthopedic Impairment,
	Auditory Impairment,
	Unknown,
	Visual Impairment,
	Speech ImpairmentSpeech Impairment,
	Speech Impairment,
	Learning DisabilityLearning Disability,
	Developmental Delay,
	AutismAutism,
	Mental Retardation,
	Noncategorical Early Childhood,
	Learning Disability,
';
comment on column CORE.STUDENT_DIM.tertiary_disability
  is 'The type of tertiary disability recorded in the student''s IEP (Individualized Education Program)
Examples: Emotional Disturbance,
	Other Health Impairment,
	Unknown,
	Visual Impairment,
	Speech ImpairmentSpeech Impairment,
	Speech Impairment,
	Mental Retardation,
	Learning Disability,
';
comment on column CORE.STUDENT_DIM.date_entered_ninth_grade
  is 'The date the student start the ninth grade.
Example: 8/24/2008';
comment on column CORE.STUDENT_DIM.student_photo
  is 'A picture of the student.';
comment on column CORE.STUDENT_DIM.race_ethnicity_key
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

The Ethnicity column works independently of the race columns.  The race columns are to be taken as a set such that
, assuming the ethnicity column was set to Hispanic, if all the race columns are null then the key value would be  H-----.
But so long as at least one race was selected then all remaining race columns should be set to false as in H0A000.

Example:
000B0W    =   "Black or African American" and  White
00A00W    =   Asian, White
H-----  = Hispanic, race unknown
-I00B00 = Unknown Ethnicity, Black
------   =   Unknown
';
comment on column CORE.STUDENT_DIM.campus_security_key
  is 'The students current campus within the district.  A Concatenation of state code, district code, and campus id.
Example: OK*0923084*009';
comment on column CORE.STUDENT_DIM.district_security_key
  is 'The Current district of the student used to restrict data for security.
A concatenation of state code and district id.
Example: OK*8394839';
comment on column CORE.STUDENT_DIM.student_key
  is 'The business key for student.  A concatenation of State code, District id, and Student Id.';
comment on column CORE.STUDENT_DIM.campus_sid
  is 'Identifies the SID of the students currently enrolled campus.';
comment on column CORE.STUDENT_DIM.campus_id
  is 'Identifies the Campus Id of the students currently enrolled campus.';
create bitmap index CORE.BMI_STU_DIM_DISTRICT_SID_FK on CORE.STUDENT_DIM (DISTRICT_SID)
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
alter table CORE.STUDENT_DIM
  add constraint PK_STUDENT_DIM primary key (STUDENT_SID)
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
alter table CORE.STUDENT_DIM
  add constraint AK_STUDENT_DIM_BUS_KEY unique (STUDENT_KEY)
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
alter table CORE.STUDENT_DIM
  add constraint FK_STUDENT_DISTRICT_DIM foreign key (DISTRICT_SID)
  references CORE.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table STUDENT_CREDIT_FACT
prompt ==================================
prompt
create table CORE.STUDENT_CREDIT_FACT
(
  student_credit_fact_sid NUMBER not null,
  campus_sid              NUMBER not null,
  course_sid              NUMBER not null,
  state_course_sid        NUMBER not null,
  student_sid             NUMBER not null,
  date_sid                NUMBER not null,
  academic_source_code    VARCHAR2(1) not null,
  credits_earned          NUMBER(5,3),
  local_credits_earned    VARCHAR2(5),
  last_update             TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table CORE.STUDENT_CREDIT_FACT
  is 'captures the number of credits a student has recieved for the successful completion of course.

Grain: 1 row/student/campus/date/course

Credits will be set to the date of 6/15/school year.';
comment on column CORE.STUDENT_CREDIT_FACT.student_credit_fact_sid
  is 'A surrogate key for the fact.';
comment on column CORE.STUDENT_CREDIT_FACT.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column CORE.STUDENT_CREDIT_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column CORE.STUDENT_CREDIT_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.STUDENT_CREDIT_FACT.credits_earned
  is 'The number of credits earned by a student for a particular course.
Example: 1.0,
                0.5,
                0.25
                0.333';
comment on column CORE.STUDENT_CREDIT_FACT.local_credits_earned
  is 'This is the value for credits earned from the source.
Examples: 10
                  5
                  NC';
alter table CORE.STUDENT_CREDIT_FACT
  add constraint PK_STUDENT_CREDIT_FACT primary key (STUDENT_CREDIT_FACT_SID)
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
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references CORE.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_COURSE_DIM foreign key (COURSE_SID)
  references CORE.COURSE_DIM (COURSE_SID);
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references CORE.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table CORE.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_CREDIT_FACT_ERR
prompt ======================================
prompt
create table CORE.STUDENT_CREDIT_FACT_ERR
(
  exception_type       VARCHAR2(75),
  campus_sid           NUMBER,
  campus_key           VARCHAR2(20),
  course_sid           NUMBER,
  course_key           VARCHAR2(30),
  state_course_sid     NUMBER,
  state_course_key     VARCHAR2(20),
  student_sid          NUMBER,
  student_key          VARCHAR2(20),
  date_sid             NUMBER,
  date_key             VARCHAR2(20),
  academic_source_code VARCHAR2(1),
  last_update          TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_CREDIT_FACT_REJ
prompt ======================================
prompt
create table CORE.STUDENT_CREDIT_FACT_REJ
(
  student_credit_fact_sid NUMBER not null,
  campus_sid              NUMBER not null,
  course_sid              NUMBER not null,
  state_course_sid        NUMBER not null,
  student_sid             NUMBER not null,
  date_sid                NUMBER not null,
  academic_source_code    VARCHAR2(1) not null,
  credits_earned          NUMBER(5,3),
  local_credits_earned    VARCHAR2(5),
  last_update             TIMESTAMP(6),
  errorcode               VARCHAR2(255),
  errormessage            VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_ENROLLMENT_FACT
prompt ======================================
prompt
create table CORE.STUDENT_ENROLLMENT_FACT
(
  campus_sid          NUMBER not null,
  student_sid         NUMBER not null,
  entry_date_sid      NUMBER not null,
  grade_level_sid     NUMBER(2) not null,
  withdrawal_date_sid NUMBER,
  days_enrolled       NUMBER,
  last_update         DATE
)
tablespace DW_DEFAULT01
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
comment on column CORE.STUDENT_ENROLLMENT_FACT.entry_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.STUDENT_ENROLLMENT_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column CORE.STUDENT_ENROLLMENT_FACT.withdrawal_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.STUDENT_ENROLLMENT_FACT.last_update
  is 'Date that this records was last updated';
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint PK_STUDENT_ENROLLMENT_FACT primary key (CAMPUS_SID, STUDENT_SID, ENTRY_DATE_SID, GRADE_LEVEL_SID)
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
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint FK_STUDENT__REFERENCE_GRADE_LE foreign key (GRADE_LEVEL_SID)
  references CORE.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_DIM_STUDENT_ENRL foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENRL_TRANS_DATE_DIM foreign key (ENTRY_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENROLL_CAMPUS_DIM foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table CORE.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_REF_WITHDRAW_DATE_DIM foreign key (WITHDRAWAL_DATE_SID)
  references CORE.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_ENROLLMENT_FACT_ERR
prompt ==========================================
prompt
create table CORE.STUDENT_ENROLLMENT_FACT_ERR
(
  load_sid            NUMBER,
  exception_type      VARCHAR2(200),
  district_sid        NUMBER,
  campus_key          VARCHAR2(50),
  campus_sid          NUMBER,
  student_key         VARCHAR2(50),
  student_sid         NUMBER,
  entry_date_sid      NUMBER,
  grade_level         VARCHAR2(50),
  grade_level_sid     NUMBER,
  last_update         TIMESTAMP(6),
  entry_date_key      VARCHAR2(50),
  withdrawal_date_key VARCHAR2(50),
  withdrawal_date_sid NUMBER
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_ENROLLMENT_FACT_REJ
prompt ==========================================
prompt
create table CORE.STUDENT_ENROLLMENT_FACT_REJ
(
  campus_sid          NUMBER not null,
  student_sid         NUMBER not null,
  entry_date_sid      NUMBER not null,
  grade_level_sid     NUMBER(2) not null,
  withdrawal_date_sid NUMBER,
  days_enrolled       NUMBER,
  last_update         DATE,
  errorcode           VARCHAR2(255),
  errormessage        VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_GRADE_FACT
prompt =================================
prompt
create table CORE.STUDENT_GRADE_FACT
(
  campus_sid           NUMBER not null,
  student_sid          NUMBER not null,
  date_sid             NUMBER not null,
  grade_type_sid       NUMBER not null,
  course_section_sid   NUMBER not null,
  state_course_sid     NUMBER not null,
  grade_level_sid      NUMBER(2) not null,
  academic_source_code VARCHAR2(1) not null,
  number_grade         NUMBER(6,2),
  letter_grade         VARCHAR2(2),
  last_update          TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table CORE.STUDENT_GRADE_FACT
  is 'Captures a students grade.
Grain = 1 Row/ student/Course Section/date/Grade Type';
comment on column CORE.STUDENT_GRADE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.STUDENT_GRADE_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column CORE.STUDENT_GRADE_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column CORE.STUDENT_GRADE_FACT.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column CORE.STUDENT_GRADE_FACT.number_grade
  is 'The numerical grade received by a student.
Example: 100,
                 75.6
                 50.07';
comment on column CORE.STUDENT_GRADE_FACT.letter_grade
  is 'The letter grade received by a student.
Example: A,
                B,
                 P,
                 NG';
comment on column CORE.STUDENT_GRADE_FACT.last_update
  is 'The date/time the row was inserted or updated.';
alter table CORE.STUDENT_GRADE_FACT
  add constraint PK_STUDENT_GRADE_FACT primary key (STUDENT_SID, GRADE_TYPE_SID, DATE_SID, COURSE_SECTION_SID, STATE_COURSE_SID, CAMPUS_SID)
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
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_COURSE_SEC foreign key (COURSE_SECTION_SID)
  references CORE.COURSE_SECTION_DIM (COURSE_SECTION_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references CORE.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references CORE.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_LEVEL_DIM foreign key (GRADE_LEVEL_SID)
  references CORE.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table CORE.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_TYPE foreign key (GRADE_TYPE_SID)
  references CORE.GRADE_TYPE_DIM (GRADE_TYPE_SID);

prompt
prompt Creating table STUDENT_GRADE_FACT_ERR
prompt =====================================
prompt
create table CORE.STUDENT_GRADE_FACT_ERR
(
  load_sid           NUMBER,
  exception_type     VARCHAR2(200),
  campus_sid         NUMBER default -2,
  student_sid        NUMBER default -2,
  student_key        VARCHAR2(50),
  grade_type_sid     NUMBER default -2,
  grade_type         VARCHAR2(50),
  course_section_sid NUMBER default -2,
  course_section_key VARCHAR2(50),
  state_course_sid   NUMBER default -2,
  state_course_key   VARCHAR2(50),
  grade_level_sid    NUMBER(2) default -2,
  last_update        TIMESTAMP(6),
  date_sid           NUMBER,
  district_sid       NUMBER,
  school_year        VARCHAR2(4),
  cycle_type         VARCHAR2(4),
  period_number      VARCHAR2(1),
  grading_period     VARCHAR2(35)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_GRADE_FACT_REJ
prompt =====================================
prompt
create table CORE.STUDENT_GRADE_FACT_REJ
(
  campus_sid           NUMBER not null,
  student_sid          NUMBER not null,
  date_sid             NUMBER not null,
  grade_type_sid       NUMBER not null,
  course_section_sid   NUMBER not null,
  state_course_sid     NUMBER not null,
  grade_level_sid      NUMBER(2) not null,
  academic_source_code VARCHAR2(1) not null,
  number_grade         NUMBER(6,2),
  letter_grade         VARCHAR2(2),
  last_update          TIMESTAMP(6),
  errorcode            VARCHAR2(255),
  errormessage         VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_PERIOD_ABSENCE_FACT
prompt ==========================================
prompt
create table CORE.STUDENT_PERIOD_ABSENCE_FACT
(
  campus_sid           NUMBER not null,
  student_sid          NUMBER not null,
  date_sid             NUMBER not null,
  class_period_sid     NUMBER not null,
  absence_reason_sid   NUMBER not null,
  period_absence_count NUMBER(1),
  last_update          TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
comment on table CORE.STUDENT_PERIOD_ABSENCE_FACT
  is 'Transactional fact to record when a student is abscent from a class period.';
comment on column CORE.STUDENT_PERIOD_ABSENCE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column CORE.STUDENT_PERIOD_ABSENCE_FACT.period_absence_count
  is 'A measure for this fact table.  Value: 1';
create index CORE.NDX_STU_PRD_ABS_DATE_SID_FK on CORE.STUDENT_PERIOD_ABSENCE_FACT (DATE_SID)
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
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint PK_STUDENT_PERIOD_ABSENCE_FACT primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, CLASS_PERIOD_SID)
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
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_ABR_RSN_PRD_ABSENCE_FACT foreign key (ABSENCE_REASON_SID)
  references CORE.ABSENCE_REASON_DIM (ABSENCE_REASON_SID);
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_DIM_STU_PRD_ABS_FACT foreign key (STUDENT_SID)
  references CORE.STUDENT_DIM (STUDENT_SID);
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CAMPUS_DIM foreign key (CAMPUS_SID)
  references CORE.CAMPUS_DIM (CAMPUS_SID);
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CLASS_PER_DIM foreign key (CLASS_PERIOD_SID)
  references CORE.CLASS_PERIOD_DIM (CLASS_PERIOD_SID);
alter table CORE.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_FACT_DATE_DIM foreign key (DATE_SID)
  references CORE.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_PERIOD_ABS_FACT_ERR
prompt ==========================================
prompt
create table CORE.STUDENT_PERIOD_ABS_FACT_ERR
(
  exception_type     VARCHAR2(200),
  studentkey         VARCHAR2(50),
  student_sid        NUMBER,
  studentidcampuskey VARCHAR2(50),
  campus_sid         NUMBER,
  absencecampuskey   VARCHAR2(50),
  absencereasonkey   VARCHAR2(50),
  absence_reason_sid NUMBER,
  absencedatekey     VARCHAR2(50),
  classperiodkey     VARCHAR2(50),
  class_period_sid   NUMBER,
  district_sid       NUMBER,
  date_sid           NUMBER,
  last_update        TIMESTAMP(6)
)
tablespace DW_DEFAULT01
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
prompt Creating table STUDENT_PERIOD_ABS_FACT_REJ
prompt ==========================================
prompt
create table CORE.STUDENT_PERIOD_ABS_FACT_REJ
(
  campus_sid           NUMBER not null,
  student_sid          NUMBER not null,
  date_sid             NUMBER not null,
  class_period_sid     NUMBER not null,
  absence_reason_sid   NUMBER not null,
  period_absence_count NUMBER(1),
  last_update          TIMESTAMP(6),
  errorcode            VARCHAR2(255),
  errormessage         VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
prompt Creating table TALEND_ETL_PROCESS
prompt =================================
prompt
create table CORE.TALEND_ETL_PROCESS
(
  extract_date   VARCHAR2(20) not null,
  lea            VARCHAR2(10) not null,
  lea_name       VARCHAR2(50) not null,
  state          VARCHAR2(2) not null,
  environment    VARCHAR2(10) not null,
  product        VARCHAR2(4) not null,
  school_year    VARCHAR2(10),
  active_status  VARCHAR2(4) not null,
  extract_status VARCHAR2(10) not null,
  load_status    VARCHAR2(10) not null,
  load_date      VARCHAR2(20),
  last_update    DATE default SYSDATE not null
)
tablespace DW_DEFAULT01
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
alter table CORE.TALEND_ETL_PROCESS
  add constraint PK_TALEND_ETL_PROCESS primary key (EXTRACT_DATE, LEA, LEA_NAME, STATE, ENVIRONMENT, PRODUCT, ACTIVE_STATUS, EXTRACT_STATUS, LOAD_STATUS)
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

prompt
prompt Creating table TALEND_FLOW_METER_CATCHER
prompt ========================================
prompt
create table CORE.TALEND_FLOW_METER_CATCHER
(
  moment            TIMESTAMP(6),
  pid               VARCHAR2(20),
  father_pid        VARCHAR2(20),
  root_pid          VARCHAR2(20),
  system_pid        NUMBER,
  project           VARCHAR2(50),
  job               VARCHAR2(50),
  job_repository_id VARCHAR2(255),
  job_version       VARCHAR2(255),
  context           VARCHAR2(50),
  origin            VARCHAR2(255),
  label             VARCHAR2(255),
  count             NUMBER,
  reference         NUMBER,
  thresholds        VARCHAR2(255),
  source_type       VARCHAR2(20),
  environment       VARCHAR2(20),
  extract_date      VARCHAR2(20),
  lea               VARCHAR2(10),
  lea_name          VARCHAR2(50),
  action            VARCHAR2(50)
)
tablespace DW_DEFAULT01
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
create index CORE.IX_ACTION_TFC on CORE.TALEND_FLOW_METER_CATCHER (ACTION)
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
create index CORE.IX_EXTRACT_DATE_TFC on CORE.TALEND_FLOW_METER_CATCHER (EXTRACT_DATE)
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
create index CORE.IX_JOB_TFC on CORE.TALEND_FLOW_METER_CATCHER (JOB)
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
create index CORE.IX_LABEL_TFC on CORE.TALEND_FLOW_METER_CATCHER (LABEL)
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
create index CORE.IX_LEA_NAME_TFC on CORE.TALEND_FLOW_METER_CATCHER (LEA_NAME)
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
create index CORE.IX_LEA_TFC on CORE.TALEND_FLOW_METER_CATCHER (LEA)
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
create index CORE.IX_MOMENT_TFC on CORE.TALEND_FLOW_METER_CATCHER (MOMENT)
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
prompt Creating table TALEND_LEA_CONTEXTS
prompt ==================================
prompt
create table CORE.TALEND_LEA_CONTEXTS
(
  batch_gid     NUMBER,
  lea_uid       VARCHAR2(20) not null,
  lea_id        VARCHAR2(20) not null,
  lea_name      VARCHAR2(50) not null,
  lea_type      VARCHAR2(10) not null,
  environment   VARCHAR2(50) not null,
  product_id    VARCHAR2(10) not null,
  product_name  VARCHAR2(10) not null,
  src_data_dir  VARCHAR2(100),
  src_logs_dir  VARCHAR2(100),
  tgt_data_dir  VARCHAR2(100),
  tgt_logs_dir  VARCHAR2(100),
  ftp_ip        VARCHAR2(20),
  ftp_port      NUMBER(5),
  ftp_login     VARCHAR2(20),
  ftp_pwd       VARCHAR2(20),
  db_host       VARCHAR2(20),
  db_port       VARCHAR2(6),
  db_database   VARCHAR2(20),
  db_schema     VARCHAR2(20),
  db_username   VARCHAR2(20),
  db_password   VARCHAR2(20),
  last_modified DATE default SYSDATE not null
)
tablespace DW_DEFAULT01
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
prompt Creating table TALEND_LOG_CATCHER
prompt =================================
prompt
create table CORE.TALEND_LOG_CATCHER
(
  moment       TIMESTAMP(6),
  pid          VARCHAR2(20),
  root_pid     VARCHAR2(20),
  father_pid   VARCHAR2(20),
  project      VARCHAR2(50),
  job          VARCHAR2(255),
  context      VARCHAR2(50),
  priority     NUMBER(3),
  type         VARCHAR2(255),
  origin       VARCHAR2(255),
  message      VARCHAR2(255),
  code         NUMBER(6),
  source_type  VARCHAR2(20),
  environment  VARCHAR2(20),
  extract_date VARCHAR2(20),
  lea          VARCHAR2(10),
  lea_name     VARCHAR2(50)
)
tablespace DW_DEFAULT01
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
create index CORE.IX_EXTRACT_DATE_TLC on CORE.TALEND_LOG_CATCHER (EXTRACT_DATE)
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
create index CORE.IX_JOB_TLC on CORE.TALEND_LOG_CATCHER (JOB)
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
create index CORE.IX_LEA_NAME_TLC on CORE.TALEND_LOG_CATCHER (LEA_NAME)
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
create index CORE.IX_LEA_TLC on CORE.TALEND_LOG_CATCHER (LEA)
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
create index CORE.IX_MOMENT_TLC on CORE.TALEND_LOG_CATCHER (MOMENT)
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
prompt Creating table TALEND_STAT_CATCHER
prompt ==================================
prompt
create table CORE.TALEND_STAT_CATCHER
(
  moment            TIMESTAMP(6),
  pid               VARCHAR2(20),
  father_pid        VARCHAR2(20),
  root_pid          VARCHAR2(20),
  system_pid        NUMBER,
  project           VARCHAR2(50),
  job               VARCHAR2(50),
  job_repository_id VARCHAR2(255),
  job_version       VARCHAR2(255),
  context           VARCHAR2(50),
  origin            VARCHAR2(255),
  message_type      VARCHAR2(255),
  message           VARCHAR2(255),
  duration          NUMBER,
  source_type       VARCHAR2(20),
  environment       VARCHAR2(20),
  extract_date      VARCHAR2(20),
  lea               VARCHAR2(10),
  lea_name          VARCHAR2(50)
)
tablespace DW_DEFAULT01
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
create index CORE.IX_EXTRACT_DATE_TSC on CORE.TALEND_STAT_CATCHER (EXTRACT_DATE)
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
create index CORE.IX_JOB_TSC on CORE.TALEND_STAT_CATCHER (JOB)
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
create index CORE.IX_LEA_NAME_TSC on CORE.TALEND_STAT_CATCHER (LEA_NAME)
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
create index CORE.IX_LEA_TSC on CORE.TALEND_STAT_CATCHER (LEA)
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
create index CORE.IX_MOMENT_TSC on CORE.TALEND_STAT_CATCHER (MOMENT)
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
prompt Creating sequence SID_SEQUENCE
prompt ==============================
prompt
create sequence CORE.SID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 42800817
increment by 1
cache 20;

prompt
prompt Creating synonym SDM_DATE_DIM
prompt =============================
prompt
create or replace synonym CORE.SDM_DATE_DIM
  for SDM.DATE_DIM;

prompt
prompt Creating view REVEAL_LEA_CONTEXTS
prompt =================================
prompt
create or replace force view core.reveal_lea_contexts as
select "BATCH_GID","LEA_UID","LEA_ID","LEA_NAME","LEA_TYPE","ENVIRONMENT","PRODUCT_ID","PRODUCT_NAME","SRC_DATA_DIR","SRC_LOGS_DIR","TGT_DATA_DIR","TGT_LOGS_DIR","FTP_IP","FTP_PORT","FTP_LOGIN","FTP_PWD","DB_HOST","DB_PORT","DB_DATABASE","DB_SCHEMA","DB_USERNAME","DB_PASSWORD","LAST_MODIFIED" from TALEND_LEA_CONTEXTS;

prompt
prompt Creating view REVEAL_LOG_CATCHER
prompt ================================
prompt
create or replace force view core.reveal_log_catcher as
select "MOMENT","PID","ROOT_PID","FATHER_PID","PROJECT","JOB","CONTEXT","PRIORITY","TYPE","ORIGIN","MESSAGE","CODE" from talend_log_catcher;

prompt
prompt Creating materialized view STUDENT_CREDIT_SUMMARY_MV
prompt ====================================================
prompt
create materialized view CORE.STUDENT_CREDIT_SUMMARY_MV
refresh complete on demand
as
select  distinct
    student_sid
    ,current_grade_level
    ,total_student_credits
    ,case
       when current_grade_level = '09'
         and to_number(total_credits.end_of_year) = -99
         and total_credits.v_semester = '2' Then 3
       when current_grade_level = '09'
         and total_credits.v_semester = '2'
         and to_number(total_credits.end_of_year) = 100 Then 6
       when current_grade_level = '09'
         and to_number(total_credits.end_of_year) = -99
         and total_credits.v_semester = '2' Then 3
       when current_grade_level = '10'
         and v_semester = '1' Then 6
       when current_grade_level = '10'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100 Then 12
       when current_grade_level = '10'
         and v_semester = '2' Then 9
       when current_grade_level = '11'
         and v_semester = '1' Then 12
         when current_grade_level = '11'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100 Then 18
       when current_grade_level = '11'
         and v_semester = '2' Then 15
       when current_grade_level = '12'
         and v_semester = '1' Then 18
       when current_grade_level = '12'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100 Then 24
       when current_grade_level = '12'
         and v_semester = '2' Then 21
       Else 0
    End as ON_TRACK_CREDITS
    ,case
      when current_grade_level = '09'
         and total_credits.v_semester = '2'
         and to_number(total_credits.end_of_year) = -99
         and total_student_credits < 3 Then 'Off-Track'
       when current_grade_level = '09'
         and total_credits.v_semester = '2'
         and to_number(total_credits.end_of_year) = 100
         and total_student_credits < 6 Then 'Off-Track'
       when current_grade_level = '10'
         and v_semester = '1'
         and total_student_credits < 6 Then 'Off-Track'
       when current_grade_level = '10'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = -99
         and total_student_credits < 9 Then 'Off-Track'
       when current_grade_level = '10'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100
         and total_student_credits < 12 Then 'Off-Track'
       when current_grade_level = '11'
         and v_semester = '1'
         and total_student_credits < 12 Then 'Off-Track'
       when current_grade_level = '11'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = -99
         and total_student_credits < 15 Then 'Off-Track'
       when current_grade_level = '11'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100
         and total_student_credits < 18 Then 'Off-Track'
       when current_grade_level = '12'
         and v_semester = '1'
         and total_student_credits < 18 Then 'Off-Track'
       when current_grade_level = '12'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = -99
         and total_student_credits < 21 Then 'Off-Track'
       when current_grade_level = '12'
         and v_semester = '2'
         and to_number(total_credits.end_of_year) = 100
         and total_student_credits < 24 Then 'Off-Track'
       Else 'On-Track'
    End as def_credit_flag
    , sysdate as AS_OF_DATE
    from (
      Select -- sum up total credits --
      student_dim.student_sid
      ,student_dim.current_grade_level
      ,v_semester
      ,school_year.end_of_year
      ,sum(student_credit_fact.credits_earned) as total_student_credits
      from  student_dim
      join student_credit_fact on student_credit_fact.student_sid = student_dim.student_sid
      join (select date_dim.district_sid, max(date_dim.semester) as v_semester
             from date_dim
             join (select campus_dim.district_sid
                         ,trunc(max(execution_log.execution_end_time)) as run_date
                    from dws.execution_log
                    join campus_dim
                    on execution_log.campus_sid = campus_dim.campus_sid
                 where execution_log.process_name = 'Load'
                 group by campus_dim.district_sid
                 ) engine_run_date
                on engine_run_date.district_sid = date_dim.district_sid
             where date_dim.school_year = case
                                          when to_char(engine_run_date.run_date,'MM')<08 then to_char(engine_run_date.run_date,'YYYY')
                                          else to_char(to_number(to_char(engine_run_date.run_date,'YYYY'))+1)
                                          end
               and date_dim.date_id <= trunc(engine_run_date.run_date)
               group by date_dim.district_sid
               ) semester
             on semester.district_sid = student_dim.district_sid
      join (select date_dim.district_sid
            ,date_dim.date_id
            ,case
            when trunc(engine_run_date.run_date)> date_dim.date_id then 100
            else -99
            end as end_of_year
            from date_dim
            join (select campus_dim.district_sid
                         ,trunc(max(execution_log.execution_end_time)) as run_date
                    from dws.execution_log
                    join campus_dim
                    on execution_log.campus_sid = campus_dim.campus_sid
                 where execution_log.process_name = 'Load'
                 group by campus_dim.district_sid
                 ) engine_run_date
                on engine_run_date.district_sid = date_dim.district_sid

            where date_dim.school_year = case
                                          when to_char(engine_run_date.run_date,'MM')<08 then to_char(engine_run_date.run_date,'YYYY')
                                          else to_char(to_number(to_char(engine_run_date.run_date,'YYYY'))+1)
                                          end
               and date_dim.last_day_semester = 'Yes'
               and date_dim.semester = 2) school_year
             on school_year.district_sid = student_dim.district_sid
      where student_dim.currently_enrolled_flag = 'Yes'
      group by  student_dim.student_sid
                ,student_dim.current_grade_level
                ,v_semester
                ,school_year.end_of_year
      ) total_credits;

prompt
prompt Creating package PKG_CORE_LOAD_PROCESSING
prompt =========================================
prompt
create or replace package core.pkg_core_load_processing is

  /*---------------------------------------------------------------------------------
  -- Package:           pkg_core_load_processing
  --
  -- Purpose:           Contains procedures that effect core load processing.
  --
  -- Procedures:        delete_facts() - deletes fact rows in fact table
  --                    prc_clean_up_rej_err - Removes old records from the err and rej
  --                        tables in core.
  --                          
  -- Revision History
  -- Date      Author       Remarks
  -- 20110112  T. Esposito  Original version
  -- 20110721  C. Bull      Added prc_clean_up_rej_err
  ---------------------------------------------------------------------------------*/
 
  procedure delete_facts(p_district_id in varchar2
                        ,p_fact_table  in varchar2
                        ,p_school_year in varchar2); 
                        
  procedure prc_clean_up_rej_err(p_retention_period number default 30);

end pkg_core_load_processing;
/

prompt
prompt Creating package PKG_CORE_UTILITIES
prompt ===================================
prompt
CREATE OR REPLACE PACKAGE CORE."PKG_CORE_UTILITIES" is

  -- Author  : BULLC
  -- Created : 4/26/2011 1:39:43 PM
  -- Purpose : VARIOUS CORE UTILITY PROCEDURES AND FUNCTIONS
  
  -- Public type declarations

  
  -- Public constant declarations


  -- Public variable declarations


  -- Public function and procedure declarations
  procedure prc_core_refresh_mv(p_mv_list IN varchar2);
  procedure prc_core_refresh_mv;

end PKG_CORE_UTILITIES;
/

prompt
prompt Creating package PKG_EMAIL
prompt ==========================
prompt
create or replace package core.PKG_EMAIL is

  -- Author  : BULLC
  -- Created : 3/1/2012 10:19:00 AM
  -- Purpose : Procs that send emails
  
  -- Public type declarations
    
  -- Public constant declarations
  
  -- Public variable declarations
  
  -- Public function and procedure declarations
  procedure prc_rvl_students_added_email (debug IN boolean default FALSE);

end PKG_EMAIL;
/

prompt
prompt Creating package PKG_ENROLLMENT_POST_PROCESSING
prompt ===============================================
prompt
create or replace package core.pkg_enrollment_post_processing is

  /*------------------------------------------------------------------------------
  -- Package:             student_days_enrolled
  -- Purpose:             Calculates total days enrolled for a student and 
  --                      should be run after every the enrollment_fact load.
  --
  -- Procedures:          enrollment_post() - updates student_dim
  --                      upd_stu_enr_days() - updates student_enrollment_fact enrolled days
  --                      insert_date_to_execution_log() - inserts extract date into execution log
  --    
  -- Revision History
  -- Date      Author       Remarks
  -- 20101108  T. Esposito  Original version
  -- 20110218  C. Bull      Added prc_upd_grd_fact_grd_lvl
  --------------------------------------------------------------------------------*/
  
  procedure enrollment_post(p_district_key in varchar2
                           ,p_school_year in varchar2);
  
  procedure upd_stu_enr_days(p_district_id in varchar2
                            ,p_extract_date in varchar2
                            ,p_school_year in varchar2); 
                            
  procedure insert_date_to_execution_log(p_district_id varchar2
                                        ,p_run_date varchar2);  
  
  procedure prc_upd_grd_fact_grd_lvl(p_district_id varchar2
                                        ,p_school_year varchar2);                        

end pkg_enrollment_post_processing;
/

prompt
prompt Creating procedure PRC_SDM_TO_DWS_DATE_DIM
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE CORE."PRC_SDM_TO_DWS_DATE_DIM"
(p_school_year in varchar2 default '****', p_district in varchar2 default '******') 
as 
    v_proc_name       varchar2(100)  := 'pkg_sdm_connector.prc_load_sdm_date_dim';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(20);
    v_rows_affected   number         := 0;
    v_prev_dist_sid   number         := -99;
    v_errcode         number;
    v_errmesg         varchar2(200);
    TYPE t_date_dim   IS TABLE OF dws.date_dim%rowtype INDEX BY pls_integer;
    v_date_collection t_date_dim;
    e_no_rows_found      exception;
    e_dws_district_error exception;

begin
   -- proc loads core date_dim for one district and school year at a time from sdm.date_dim. --
   -- log start time --
   zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure ('||p_school_year||' school years); Districts = '||p_district||'.'),v_start_datetime,null,null );

   -- Raise error if district input is empty --
   if p_district = '******' or p_district is null then
      raise e_dws_district_error;
   end if;
   
   -- Default the School Year if not present --
   if p_school_year = '****' or p_school_year is null then
      v_school_year := 
        case 
         when to_char(sysdate,'MMDD')>= '0801' then to_char(to_number(to_char(sysdate,'YYYY'))+1)
         else to_char(sysdate,'YYYY')
         end;
   else
       v_school_year := p_school_year;
   end if;
   
   -- build dynamic sql statement --
       execute immediate 
       'select district_dim.district_sid||year_month_day as date_sid,
       district_dim.district_sid as district_sid,
       date_id,
       calendar_year,
       calendar_year_quarter,
       calendar_quarter,
       calendar_year_month,
       calendar_month,
       calendar_month_name,
       calendar_month_short_name,
       calendar_week,
       day_of_week,
       day_of_week_name,
       day_of_week_short_name,
       school_year,
       school_year_description,
       school_week,
       year_month_day,
       short_date,
       long_date,
       school_day_indicator,
       academic_6_weeks,
       academic_9_weeks,
       semester,
       first_day_academic_6_weeks,
       last_day_academic_6_weeks,
       first_day_academic_9_weeks,
       last_day_academic_9_weeks,
       first_day_semester,
       last_day_semester,
       ''TX*''||district_dim.district_id||''*''||year_month_day as date_key,
       systimestamp as last_update 
       from sdm_date_dim date_dim
       join district_dim on district_dim.district_id = date_dim.district_id
       where date_dim.school_year =' || v_school_year || ' and  district_dim.district_id  = '|| p_district
    bulk collect into v_date_collection;
 
   if v_date_collection.count = 0 then 
     raise e_no_rows_found;
   end if;
   
   -- insert rows into dws.date_dim --
   for i in v_date_collection.first..v_date_collection.last
     loop
          insert into dws.date_dim 
          values 
          (v_date_collection(i).date_sid,
           v_date_collection(i).district_sid,
           v_date_collection(i).date_id,
           v_date_collection(i).calendar_year,
           v_date_collection(i).calendar_year_quarter,
           v_date_collection(i).calendar_quarter,
           v_date_collection(i).calendar_year_month,
           v_date_collection(i).calendar_month,
           v_date_collection(i).calendar_month_name,
           v_date_collection(i).calendar_month_short_name,
           v_date_collection(i).calendar_week,
           v_date_collection(i).day_of_week,
           v_date_collection(i).day_of_week_name,
           v_date_collection(i).day_of_week_short_name,
           v_date_collection(i).school_year,
           v_date_collection(i).school_year_description,
           v_date_collection(i).school_week,
           v_date_collection(i).year_month_day,
           v_date_collection(i).short_date,
           v_date_collection(i).long_date,
           v_date_collection(i).school_day_indicator,
           v_date_collection(i).academic_6_weeks,
           v_date_collection(i).academic_9_weeks,
           v_date_collection(i).semester,
           v_date_collection(i).first_day_academic_6_weeks,
           v_date_collection(i).last_day_academic_6_weeks,
           v_date_collection(i).first_day_academic_9_weeks,
           v_date_collection(i).last_day_academic_9_weeks,
           v_date_collection(i).first_day_semester,
           v_date_collection(i).last_day_semester,
           v_date_collection(i).date_key,
           v_date_collection(i).last_update
            );
            
        -- insert one UNKNOWN dimension member with -1 sid for each unique district --
/*       if v_prev_dist_sid <> v_date_collection(i).district_sid then
          insert into date_dim
            (date_sid,
             district_sid,
             date_id,
             calendar_year,
             calendar_year_quarter,
             calendar_quarter,
             calendar_year_month,
             calendar_month,
             calendar_month_name,
             calendar_month_short_name,
             calendar_week,
             day_of_week,
             day_of_week_name,
             day_of_week_short_name,
             year_month_day,
             short_date,
             long_date,
             school_day_indicator,
             School_year,
             school_year_description,
             date_key,
             last_update) 
            values 
            (v_date_collection(i).district_sid||'29991231',
             v_date_collection(i).district_sid,
             to_date('29991231','YYYYMMDD'),
             '2999',
             '2999 Q4',
             '4',
             '299912',
             '12',
             'December',
             'Dec',
             '53',
             '3',
             'TUESDAY',
             'TUE',
             '29991231',
             '12/31/2999',
             'December 31, 2999',
             'Non-Academic',
             'N/A',
             'N/A',
             substr(v_date_collection(i).date_key,1,10)||'*29991231',
             v_date_collection(i).last_update );
             
          v_prev_dist_sid := v_date_collection(i).district_sid;
        end if;    */
            
        v_rows_affected := v_rows_affected + 1;
      end loop;
    commit; 
    
   -- log end time --
   v_end_datetime := SYSTIMESTAMP;
   zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('Start '||v_proc_name||' Procedure ('||v_school_year||' school year(s)); Districts = '||p_district||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year(s)); Districts = '||p_district||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'No rows found to process based on the specified parameters!';
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'WARNING','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year(s)); Districts = '||p_district||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
  
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year(s)); Districts = '||p_district||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
end prc_sdm_to_dws_date_dim;
/

prompt
prompt Creating package body PKG_CORE_LOAD_PROCESSING
prompt ==============================================
prompt
create or replace package body core.pkg_core_load_processing is

  procedure delete_facts(p_district_id in varchar2
                        ,p_fact_table  in varchar2
                        ,p_school_year in varchar2) 
  is
  /*---------------------------------------------------------------------------------
  -- Procedure:           delete_facts
  --
  -- Purpose:             Deletes fact records by district, school_year and fact_table.
  --                      Usually run as part of the scheduled load process before 
  --                      loading next batch load of data.
  --
  -- Delete by column:    student_enrollment_fact.entry_date_sid
  --                      All others by date_sid
  --                          
  -- Input:               p_district_id  = district id
  --                      p_fact_table   = fact table to delete recs 
  --                      p_school_year  = school year of data to be deleted
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20110112  T. Esposito  Original version
  --
  ---------------------------------------------------------------------------------*/
  
  v_start_date_sid           date_dim.date_sid%type;  
  v_end_date_sid             date_dim.date_sid%type;  
  v_start_time               zeus.etl_event_log.start_time%TYPE := systimestamp;
  v_end_time                 zeus.etl_event_log.end_time%TYPE;
  v_errcode                  zeus.etl_event_log.error_code%TYPE;
  v_errmesg                  zeus.etl_event_log.error_message%TYPE;
  v_rows_affected            number := 0;
  v_district_sid             date_dim.date_sid%type;
  
  --*************
  -- Main program
  --*************
  begin    
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'CORE - delete_facts'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => v_rows_affected
                                         ,p_comments => 'Started delete_facts procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);
                   
  select min(date_sid), max(date_sid) , district_sid
  into v_start_date_sid, v_end_date_sid, v_district_sid
  from date_dim
  where district_sid = (select district_sid
                          from district_dim
                         where district_id = p_district_id)
  and school_year = p_school_year
  group by district_sid;

BEGIN
  if upper(p_fact_table) = upper('student_enrollment_fact') or
     upper(p_fact_table) = upper('student_enrollment_fact_err')
  then
    execute immediate 'delete ' || p_fact_table ||
                      ' where entry_date_sid between ' || v_start_date_sid || ' and ' || v_end_date_sid;
    v_rows_affected := sql%rowcount;                  
  else
    if upper(p_fact_table) = upper('student_credit_fact') or
       upper(p_fact_table) = upper('student_credit_fact_err')
    then 
        execute immediate 'delete ' || p_fact_table ||
                      ' where date_sid like '||'''' || v_district_sid || '%' || '''' ;
        v_rows_affected := sql%rowcount;
    else
    execute immediate 'delete ' || p_fact_table ||
                      ' where date_sid between ' || v_start_date_sid || ' and ' || v_end_date_sid;
    end if;
    v_rows_affected := sql%rowcount;                  
  end if;
  
  EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
  
  commit;

END;
  
  --rollback;
  v_end_time := systimestamp;
      
  if v_rows_affected = 0 then  -- issue warning if no rows updated
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'WARN'
                                       ,p_source_name => 'CORE - delete_facts'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '-1'
                                       ,p_error_message => 'No rows deleted in ' || p_fact_table || ' for ' || p_district_id || ' school year ' || p_school_year
                                       ,p_rows_affected_count => v_rows_affected
                                       ,p_comments => 'The delete_facts procedure ended'
                                       ,p_start_time => NULL
                                       ,p_end_time => NULL
                                       ,p_elapsed_time => NULL);
  
  else
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE - delete_facts'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => 'Rows deleted from ' || p_fact_table || ' for ' || p_district_id || ' school year ' || p_school_year
                                       ,p_rows_affected_count => v_rows_affected 
                                       ,p_comments => 'Successful completion of delete_facts procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
     
  end if;
                    
  --***************************
  -- Exception handling section
  --***************************
  exception
  when NO_DATA_FOUND then NULL;
  when others then
    v_errcode  := sqlcode;
    v_errmesg  := substr(sqlerrm,1,200);
    v_end_time := systimestamp;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE - delete_facts'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Error in delete_facts procedure on ' || p_fact_table || ' for ' || p_district_id || ' school year ' || p_school_year
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time
                                                                                                  ,v_end_time));
    rollback;
    raise; 
      
  end delete_facts;
  
  procedure prc_clean_up_rej_err(p_retention_period number default 30)
  is                                                      
  /*--------------------------------------------------------------------------------------
  -- Procedure:           prc_clean_up_rej_err
  --
  -- Purpose:             This proc collects from the user_tables system view the names of all
  --                      tables with the suffix _err and _rej. It then deletes the any row older than
  --                      sysdate - the p_retention_period from the tables. Based on the default it
  --                      it keeps the last 30 days of rejects and error rows.
  --
  -- Parms:               p_retention_period = the number of days of rows to keep.
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20110721  C. Bull      Original version
  ---------------------------------------------------------------------------------------*/                                                        
   
 
  v_start_time    timestamp          := systimestamp;
  v_end_time      timestamp;
  v_errcode       varchar2(50);
  v_errmesg       varchar2(200);
  v_rec_cnt       number             :=0;
  sql_stmt        varchar2(1000);
  
  TYPE table_list_type is VARRAY(50) of varchar2(30);
  table_list table_list_type; -- list of tables to process
 
  --****************
  -- Main processing
  --****************   
  begin
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'prc_clean_up_rej_err'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started prc_clean_up_rej_err procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);

    -- pull the list of tables to process from the system view 
    select table_name 
    bulk collect into table_list
    from user_tables
    where table_name like '%_ERR'
    or table_name like '%_REJ'
    order by table_name;
    
    -- delete the old rows based on the last_update column
    for i in table_list.first..table_list.last
      loop
        sql_stmt := 'delete from '||table_list(i)||'
          where last_update < trunc(sysdate)- '||p_retention_period;
        execute immediate sql_stmt;
        -- set row count
        v_rec_cnt := sql%rowcount; 
        zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'prc_clean_up_rej_err'
                                       ,p_status => 'Running'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Deleted '||v_rec_cnt||' rows from '||table_list(i)
                                       ,p_start_time => systimestamp
                                       ,p_end_time => NULL
                                       ,p_elapsed_time => NULL);
        v_rec_cnt := 0;
        sql_stmt := '';
      end loop;  
    commit;
    
    v_end_time := systimestamp;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'prc_clean_up_rej_err'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of prc_clean_up_rej_err procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when no_data_found then  -- no tables to process
      null;
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'prc_clean_up_rej_err'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_cnt
                                         ,p_comments => 'Error in prc_clean_up_rej_err procedure'                                        
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise; 
                        
  end prc_clean_up_rej_err;
  
end pkg_core_load_processing;
/

prompt
prompt Creating package body PKG_CORE_UTILITIES
prompt ========================================
prompt
CREATE OR REPLACE PACKAGE BODY CORE."PKG_CORE_UTILITIES" is

  -- Private type declarations

  
  -- Private constant declarations


  -- Private variable declarations


  -- Function and procedure implementations

procedure prc_core_refresh_mv (p_mv_list IN varchar2) is

begin
    DBMS_MVIEW.refresh(p_mv_list);
end prc_core_refresh_mv;

procedure prc_core_refresh_mv is

  v_staleness varchar2(25) := '';

begin
  select ALL_MVIEWS.STALENESS
  into v_staleness
  from ALL_MVIEWS
  where ALL_MVIEWS.MVIEW_NAME = 'STUDENT_CREDIT_SUMMARY_MV';
  -- determine if the view needs to be recompiled --
  if v_staleness = 'NEEDS_COMPILE' then
    Execute immediate 'ALTER MATERIALIZED VIEW CORE.STUDENT_CREDIT_SUMMARY_MV COMPILE';
    v_staleness := '';
  end if;
  
  DBMS_MVIEW.refresh('CORE.STUDENT_CREDIT_SUMMARY_MV');
  
  select ALL_MVIEWS.STALENESS
  into v_staleness
  from ALL_MVIEWS
  where ALL_MVIEWS.MVIEW_NAME = 'STUDENT_CREDIT_SUMMARY_MV';
  -- determine if the view needs to be recompiled --
  if v_staleness = 'NEEDS_COMPILE' then
    Execute immediate 'ALTER MATERIALIZED VIEW CORE.STUDENT_CREDIT_SUMMARY_MV COMPILE';
  end if;
  
end prc_core_refresh_mv;

end PKG_CORE_UTILITIES;
/

prompt
prompt Creating package body PKG_EMAIL
prompt ===============================
prompt
create or replace package body core.PKG_EMAIL is

  -- Private type declarations
  type t_stringList is varray(100) of varchar2(50); 
  -- Private constant declarations
  c_crlf        VARCHAR2(2)  := chr(13)||chr(10);
  -- Private variable declarations
  
  -- Function and procedure implementations
/*----------------------------------------------------------------------------------------------------------
 *  Function: fn_split_numeric  
 *  
 *  A helper function to split a comma delimited list into an array. 
 *  Example: Converts 2009,2010 into 2009
 *                                   2010
 *                              
 *   RETURNS: VARRY 
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_list                               The comma delimited list tobe converted.
 *---------------------------------------------------------------------------------------------------------*/

FUNCTION fn_split (p_list varchar2)

return t_stringList
is

 v_strings t_stringlist := t_stringlist();
 i number := 1;

begin

  loop
    if REGEXP_SUBSTR(p_list,'[0-9A-Z\*]+',1,i,'i') is not null then
      v_strings.extend; -- extend the array
      v_strings(i) := REGEXP_SUBSTR(p_list,'[0-9A-Z\*]+',1,i); -- load each element to array
      i := i + 1; 
    else
      exit; -- exit loop after last element
    end if;
  end loop;
      
  return v_strings;
end fn_split;
  /*
  Weekly Email Process 
  Feb 2012 - John C. Smith   Initial Implementation 
  20120301 - Bull C.         Produtionized and Implementation
  */
  procedure prc_rvl_students_added_email (debug IN boolean default FALSE) as
  
    vInHandle        utl_file.file_type;
    vNewLine         VARCHAR2(250);-- Input line
    v_tag            VARCHAR2(300);  
    v_data           VARCHAR2(300);  
    v_colon          number ;  
    v_data_l         number ; 
    v_flag           char(1);  
    v_type           char(1); 
    v_trans          VARCHAR2(20);
    v_TotalInserted  number ; 
    --- Email 
    v_ldap_campus    VARCHAR2(30);
    v_campus_name    VARCHAR2(60);
    v_ldap_email     VARCHAR2(90);
    v_ldap_user_id   VARCHAR2(90);
    v_ldap_user_name VARCHAR2(50);
    v_ldap_district  VARCHAR2(50);
    v_email_body     VARCHAR2(3000);  --used for debugging
    v_date_sid       number ; 
    v_date           Date ; 
    v_added          number ; 
    v_added_char     VARCHAR2(4);
    v_remained       number ; 
    v_removed        number ; 
    
    v_time           VARCHAR2(50) ; 
    
    v_From           VARCHAR2(80) := 'reveal@schoolviz.org';
    v_Recipient      VARCHAR2(80) := 'reveal@schoolviz.org';
    v_r10_admin      VARCHAR2(80) := 'reveal@schoolviz.org';
    v_Subject        VARCHAR2(80) := '';
     
    v_person_email_cnt    number ;  
    v_email_sent_cnt      number := 0;
    
    l_table_end        clob    ;  
    l_body_html        clob    ; 
    l_body_table       clob    ; 
    l_line             clob   := ' <br>'  ;   
    l_par_start        clob   := ' <p> '  ;   
    l_par_end          clob   := ' </p>'  ;    
    v_link             clob   := '<a href="https://reveal.schoolviz.org/ibmcognos/cgi-bin/cognos.cgi?b_action=xts.run&m=portal/cc.xts&gohome="> Link to Reveal</a>' ; 
    v_mime_type        VARCHAR2(30)  :=  'text/html; charset=us-ascii'; 
    
    -- logging --
    v_jobname     zeus.etl_event_log.job_name%TYPE  := 'pkg_email.prc_rvl_students_added_email';
    v_start_time  timestamp := systimestamp;
    v_end_time    timestamp;
    v_errcode     varchar2(50);
    v_errmesg     varchar2(200);
    v_comment     varchar2(200);
    
    type so_email_ldap_t    is table of so_email_ldap%rowtype;
    v_so_email_users        so_email_ldap_t;
    v_campus_split          t_stringList := t_stringList();
    
   CURSOR email_person IS
      select distinct 
          ldap_email
        , ldap_user_id
        , ldap_user_name
        , ldap_district   
        from so_email_ldap so  
        where ldap_district  != 'TX*199902'   
       /* and  ldap_user_id in ( --'blainel@rcisd.org', 'bowersc@rcisd.org' , 'jacobsd@rcisd.org', 
                                --'nolanj@rcisd.org', 'vernella.readus@chisd.net', 'zamorap@rcisd.org'
                                'barrerad@rcisd.org', 'brownsd@rcisd.org' , 'jacobsd@rcisd.org'  )*/   
        order by ldap_district , ldap_email  ;  
   -- excludes Collegiate High School, Joe Wilson Intermediate, and West Intermediate schools for cedar hill.
   -- after these are removed from processing the 'and cd.campus_id not in ('057904103','057904109','057904003')'
   -- clause can be removed.
   CURSOR email_campus IS
      select   ldap_campus
             , campus_name 
         from so_email_ldap so
            , campus_dim cd 
            , district_dim dd
         where ldap_email =  v_ldap_email 
           and ldap_district = v_ldap_district  
           and cd.campus_key = ldap_campus 
           and cd.district_sid = dd.district_sid
           and dd.district_key = v_ldap_district 
           and cd.campus_id not in ('057904103','057904109','057904003') 
         order by LDAP_EMAIL
                , LDAP_CAMPUS 
                , campus_name  ; 

  BEGIN

    zeus.pkg_utilities.proc_etl_log_event(p_job_name => v_jobname
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'PL/SQL'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);
                                         
    -- Convert the file into a table to process 
    vInHandle := utl_file.fopen('UTL_FILE_DIR', 'dws.ldif', 'R');

    delete From SO_LDAP_EXPORT; 
   
     LOOP
       BEGIN
         utl_file.get_line(vInHandle, vNewLine);
         
          v_colon := instr(vNewLine, ':');
          v_tag := trim(SUBSTR(vNewLine, 1, v_colon ));
          v_tag := trim(REPLACE(REPLACE(v_tag, CHR(10), ''), CHR(13), '')); 
          v_data := trim(SUBSTR(vNewLine,  v_colon+1, (length (vNewLine) - v_colon + 1)   ));
          v_data := trim(REPLACE(REPLACE(v_data, CHR(10), ''), CHR(13), '')); 
          v_data_l := Length (v_data) ; 
      
     --  Only keeping the data we need
         v_flag := 'N'; 
    CASE v_tag
         WHEN '# entry-id:'   THEN v_flag := 'Y';     v_type := 'A';   v_trans := v_data;  
         WHEN 'mail:'         THEN v_flag := 'Y';     v_type := 'B'; 
         WHEN 'uid:'          THEN v_flag := 'Y';     v_type := 'C'; 
         WHEN 'cn:'           THEN v_flag := 'Y';     v_type := 'D'; 
         WHEN 'r10cdn:'       THEN v_flag := 'Y';     v_type := 'E'; 
         WHEN 'r10location:'  THEN v_flag := 'Y';     v_type := 'F'; 
         ELSE v_flag := 'N';
    END CASE;

      --   Build the LDAP Extract Table 
      IF v_flag = 'Y'  THEN
          INSERT INTO SO_LDAP_EXPORT
          (LDAP_TEXT, TRANS_NBR, TRANS_TYPE, LDAP_VALUE, LINE_NBR)
          VALUES
          (vNewLine, v_trans, v_type, v_data, v_TotalInserted );
          v_TotalInserted :=  v_TotalInserted + 1 ;
      end if; 
         
       EXCEPTION
         WHEN OTHERS THEN
           EXIT;
       END;
     END LOOP;
     utl_file.fclose(vInHandle);
     
     if debug then   
       SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS') into v_time FROM DUAL;
       dbms_output.put_line( 'End of File Extract --- '  ||  v_time   );
     end if;
     
     delete from SO_DISTRICT_COPY ; 
     delete from SO_EMAIL_LDAP ; 
       
     commit ; 
     --  DISTRICT ONLY  
      
    INSERT INTO SO_DISTRICT_COPY (LDAP_EMAIL, LDAP_USER_ID, LDAP_USER_NAME, LDAP_DISTRICT )  
    
       select 
         B.LDAP_VALUE AS EMAIL
       , C.LDAP_VALUE AS USER_ID
       , D.LDAP_VALUE AS USER_NAME
       , TRIM(E.LDAP_VALUE) AS DISTIRCT 
       from  SO_LDAP_EXPORT B
             , SO_LDAP_EXPORT C
             , SO_LDAP_EXPORT D
             , SO_LDAP_EXPORT E 
       where B.TRANS_TYPE = 'B'  
         AND C.TRANS_TYPE = 'C' 
         AND D.TRANS_TYPE = 'D' 
         AND E.TRANS_TYPE = 'E' 
         AND B.TRANS_NBR = C.TRANS_NBR 
         AND B.TRANS_NBR = D.TRANS_NBR 
         AND B.TRANS_NBR = E.TRANS_NBR
         AND B.TRANS_NBR NOT IN (SELECT F.TRANS_NBR 
                                 FROM SO_LDAP_EXPORT F   
                                 WHERE  F.TRANS_TYPE = 'F' )  ; 
    
    -- EXPLODE DISTRICTS TO CAMPUS USERS 
    INSERT INTO  SO_EMAIL_LDAP  (LDAP_EMAIL, LDAP_USER_ID, LDAP_USER_NAME, LDAP_DISTRICT, LDAP_CAMPUS, LDAP_SOURCE )  
    
    SELECT DC.LDAP_EMAIL
          , DC.LDAP_USER_ID
          , DC.LDAP_USER_NAME
          , DC.LDAP_DISTRICT
          , CD.CAMPUS_KEY 
          , 'D'
       FROM SO_DISTRICT_COPY DC 
           , CAMPUS_DIM CD
           , DISTRICT_DIM DD
       WHERE CD.DISTRICT_SID = DD.DISTRICT_SID 
         AND  DC.LDAP_DISTRICT = DD.DISTRICT_KEY ; 
       
    --- CAMPUS ONLY  STRAIGHT TO EMAIL TABLE 
    INSERT INTO SO_EMAIL_LDAP (LDAP_EMAIL, LDAP_USER_ID, LDAP_USER_NAME, LDAP_DISTRICT, LDAP_CAMPUS, LDAP_SOURCE )  
   
       select B.LDAP_VALUE  
             , C.LDAP_VALUE  
             , D.LDAP_VALUE  
             , E.LDAP_VALUE  
             , F.LDAP_VALUE 
             , 'C'
       from  SO_LDAP_EXPORT B
           , SO_LDAP_EXPORT C
           , SO_LDAP_EXPORT D
           , SO_LDAP_EXPORT E
           , SO_LDAP_EXPORT F 
          WHERE B.TRANS_TYPE = 'B' 
          and C.TRANS_TYPE = 'C' 
          AND D.TRANS_TYPE = 'D' 
          AND E.TRANS_TYPE = 'E' 
          AND F.TRANS_TYPE = 'F' 
          AND B.TRANS_NBR = C.TRANS_NBR 
          AND B.TRANS_NBR = D.TRANS_NBR  
          AND B.TRANS_NBR = E.TRANS_NBR 
          AND B.TRANS_NBR = F.TRANS_NBR;
      
     --- REMOVE ALL REGION10 ACCOUNTS FROM THE EMAIL TABLE 
    DELETE  FROM SO_EMAIL_LDAP WHERE UPPER(LDAP_EMAIL)  LIKE '%REGION10%' ; 
    DELETE  FROM SO_EMAIL_LDAP WHERE UPPER(LDAP_EMAIL)  LIKE '%SOMEWHERE%' ; 
    DELETE  FROM SO_EMAIL_LDAP WHERE UPPER(LDAP_EMAIL)  LIKE '%ANYWHERE%' ; 
    DELETE  FROM SO_EMAIL_LDAP WHERE UPPER(LDAP_EMAIL)  LIKE '%DIRTEST%' ;

    commit ; 
    
    if debug then     
      SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS') into v_time FROM DUAL;
      dbms_output.put_line( 'End of Translate & Load  --- '  ||  v_time   );
    end if;
  
  --
  -- some rows have comma delimited list of campuses, these need to be split into multiple rows.
  --
    select * 
    bulk collect into v_so_email_users
    from so_email_ldap
    where ldap_campus like '%,%';
    
    for i in v_so_email_users.first..v_so_email_users.last
      loop
        v_campus_split := fn_split(v_so_email_users(i).ldap_campus);
        for x in v_campus_split.first..v_campus_split.last
          loop
            -- insert a new row for each campus
            insert into so_email_ldap
            (ldap_email,
             ldap_user_id,
             ldap_user_name,
             ldap_district,
             ldap_campus,
             ldap_source)
            values
            (v_so_email_users(i).ldap_email,
             v_so_email_users(i).ldap_user_id,
             v_so_email_users(i).ldap_user_name,
             v_so_email_users(i).ldap_district,
             v_campus_split(x),
             v_so_email_users(i).ldap_source);
           end loop;
         -- delete the old record with the comma delimited campuses
         delete so_email_ldap
            where ldap_user_id = v_so_email_users(i).ldap_user_id
              and ldap_district = v_so_email_users(i).ldap_district
              and ldap_campus =  v_so_email_users(i).ldap_campus;
         v_campus_split.delete;
      end loop;
  
  /*
     Build Emails 
  */

    ---  Loop to find people 
   OPEN email_person  ;
    LOOP
      FETCH email_person  
       into v_ldap_email, v_ldap_user_id, v_ldap_user_name, v_ldap_district ; 
      EXIT WHEN email_person %NOTFOUND;
      
        ---  Get District Dates            
        select max(p.date_sid) into v_date_sid  
          from  dws.STUDENT_RISK_FACTOR_PHASE_SUM p
              , campus_dim c
              , district_dim d 
         where c.campus_sid = p.campus_sid   
           and c.district_sid = d.district_sid  
           and d.district_key = v_ldap_district  ;
         
        select  date_id into v_date 
        from date_dim 
        where date_sid = v_date_sid;
        
        v_email_body := ''; 
        v_person_email_cnt  := 0 ; 
        l_table_end :=  ''; 
        
        if debug then
           dbms_output.put_line( ' User Found: ' ||  v_ldap_user_name   || '      Email:  ' ||  v_ldap_email    );
        end if;
        
        ---  Loop to find campus details & build the body       
          
         OPEN email_campus  ;
          LOOP
            FETCH email_campus  
             into  v_ldap_campus, v_campus_name ; 
            EXIT WHEN email_campus %NOTFOUND;
            
          v_added     := 0  ; 
          v_remained  := 0  ; 
          v_removed   := 0  ; 
          
           select   count(*) into v_added
             from dws.STUDENT_RISK_FACTOR_PHASE_SUM p
                , campus_dim c
            where p.campus_sid = c.campus_sid  
              and c.campus_key = v_ldap_campus
              and date_sid = v_date_sid  
              and risk_factor_phase = 'Added' ;

           ---   Feb 2012 Adam only wants to show the Added
                         
           If v_added > 0 then -- add back the following if desired ==> + v_remained + v_removed
              --- debug code --
              if debug then
                v_email_body :=  c_crlf || ' ' || v_campus_name || ' (' || replace(v_ldap_campus,'TX*','') || ') ' ||  c_crlf ||
                             '  Added:     ' ||  v_added    || c_crlf  ; 
                         --   || '  Remained:  ' ||  v_remained || c_crlf 
                         --   || '  Removed:   ' ||  v_removed  || c_crlf ;
                dbms_output.put_line( v_email_body  );  
              end if;
              
              v_person_email_cnt  :=  v_person_email_cnt + 1  ; 
              If v_person_email_cnt  = 1 then               
                 l_body_table :=  ' <table border="1"  align="left">' || '<tr><td width="300">Campus</td><td width="100" align="center">Added</td> </tr> ';  
              End if;     
              v_added_char :=  v_added; 
              v_added_char :=  lpad(v_added_char, 4); 
              
              l_body_table := l_body_table || '   <tr> <td>' || v_campus_name || ' (' || replace(v_ldap_campus,'TX*','') || ') '  || '</td> <td align="center"> ' || v_added_char || '</td>  </tr> '   || '&nbsp &nbsp  '  ; 
              l_table_end := l_table_end || '  &nbsp &nbsp  ' ||  l_line   ;
              
              /*if debug then
                 dbms_output.put_line( 'Every Line >>>>' ||  l_body_table  );  --- Testing  
              end if;*/
                     
           end if ;      
          END LOOP;  
        CLOSE email_campus ;   

     ---   Send the mail 
     
     
      v_Recipient   := v_ldap_email;  
      v_Subject     := 'Student Status Changes as of: ' ||  to_char( v_date, 'FMMonth DD, YYYY' );
    
     If v_person_email_cnt >= 1 then  
       
       if debug then
           dbms_output.put_line( ' Email to :  ' ||  v_ldap_email     );
           dbms_output.put_line( ' Subject  :  Student Status Changes as of: ' ||  to_char( v_date, 'FMMonth DD, YYYY' )) ; 
           dbms_output.put_line( ' From     :  reveal@schoolviz.org '    );
           dbms_output.put_line( '   '    );
       end if;
     
       l_table_end :=  ' </table>  &nbsp &nbsp  ' ||  l_line ||   l_line   || l_table_end  ;
       l_body_table := l_body_table ||  l_table_end  ;

   
      -- v_body := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

       l_body_html := '<html>
                          <head>
                            <style type="text/css">
                              body{font-family: Arial, Helvetica, sans-serif;
                                   font-size:10pt; 
                                   background-color:#ffffff;}

                              span.sig{font-style:italic;
                                       font-weight:bold;
                                       color:#811919;}
                            </style>
                          </head>
                          <body>'||utl_tcp.crlf;
       
       l_body_html := l_body_html ||'<p>  Dear ' || v_ldap_user_name  ||',   </p>' ;
       l_body_html := l_body_html ||'<p>  </p>' ;
   
       l_body_html := l_body_html ||'<p>  Below is a count of students who have been added to the dropout risk factor list in the past week.   </p>' ;

       l_body_html := l_body_html ||  l_par_start;
       l_body_html := l_body_html ||  l_body_table ; 
      
       l_body_html := l_body_html ||  l_par_end   ||utl_tcp.crlf; 
       l_body_html := l_body_html ||'<cr>  </body>' ;
       l_body_html := l_body_html ||'  <body> <p>  </p>' ;
   
       l_body_html := l_body_html ||'&nbsp &nbsp   <p>  Please use the following link to review the details in the Reveal DWS application, ' ;
       l_body_html := l_body_html || v_link  || '.' ||  l_line ;
       l_body_html := l_body_html ||'  Once you log on use the graph in the upper right quadrant to drill thru to see the students added. ' ;
    
       l_body_html := l_body_html ||'<p>  </p>'||utl_tcp.crlf;

       l_body_html := l_body_html ||'    Sincerely,<br />'||utl_tcp.crlf;
       l_body_html := l_body_html ||'    <span class="sig">The Reveal Team</span><br />'||utl_tcp.crlf;
       l_body_html := l_body_html ||'  </body>   </html> ' ;
    

       /* Send the email   */ 
          
       UTL_MAIL.SEND (
          sender =>            v_From ,
          recipients =>        v_Recipient , 
          cc  =>               '', 
          bcc =>               'reveal@schoolviz.org', 
          subject =>           v_Subject ,
          message =>           l_body_html,
          mime_type =>         v_mime_type,
          priority =>          '' 
          );
      v_email_sent_cnt := v_email_sent_cnt + 1;
      else
        if debug then
           dbms_output.put_line( ' Email NOT sent to :  ' ||  v_ldap_email);
           dbms_output.put_line( '   ');
        end if;
      end if ; 

     
     END LOOP;
  CLOSE email_person ;   
       
   --  Clean up   -- 05/07/2012 removed this to be able to view data
 --  delete From SO_LDAP_EXPORT;  
 --  delete from SO_DISTRICT_COPY ; 
 --  delete from SO_EMAIL_LDAP ; 
   
   -- send notification email to R10 Administrator --
   if not debug then
      l_body_html := '<html>
                          <head>
                            <style type="text/css">
                              body{font-family: Arial, Helvetica, sans-serif;
                                   font-size:10pt; 
                                   background-color:#ffffff;}

                              span.sig{font-style:italic;
                                       font-weight:bold;
                                       color:#811919;}
                            </style>
                          </head>
                          <body>'||utl_tcp.crlf;
       
       l_body_html := l_body_html ||'<p>  Dear ' || v_r10_admin  ||',   </p>' ;
       l_body_html := l_body_html ||'<p>  </p>' ;
   
       l_body_html := l_body_html ||'<p>  The Reveal Student Status Changes Mass Email for the past week ';  
       l_body_html := l_body_html ||'has been sent out to '||to_char(v_email_sent_cnt)||' recipients.</p>' ;

       l_body_html := l_body_html ||'<cr>  </body>' ;
       l_body_html := l_body_html ||'  <body> <p>  </p>' ;
   
       l_body_html := l_body_html ||'    Sincerely,<br />'||utl_tcp.crlf;
       l_body_html := l_body_html ||'    <span class="sig">The Reveal Team</span><br />'||utl_tcp.crlf;
       l_body_html := l_body_html ||'  </body>   </html> ' ;
    

       /* Send the email   */ 
          
       UTL_MAIL.SEND (
          sender =>            v_From ,
          recipients =>        v_r10_admin , 
          cc  =>               '', 
          bcc =>               '', 
          subject =>           'Student Status Changes Mass Email' ,
          message =>           l_body_html,
          mime_type =>         v_mime_type,
          priority =>          '' 
          );
   end if;
   
   if debug then   
     SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS') into v_time FROM DUAL;
     dbms_output.put_line( 'End of Emails  --- '  ||  v_time   );
   end if;
 
    -- log end of proc --
    v_end_time := systimestamp;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => v_jobname
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'PL/SQL'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_email_sent_cnt
                                       ,p_comments => 'Successful completion of procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      v_comment  := 'Error at line number'||substr(sys.DBMS_UTILITY.format_error_backtrace,1,180);
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_person_email_cnt
                                         ,p_comments => v_comment                          
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise;                                  
  end prc_rvl_students_added_email;


end PKG_EMAIL;
/

prompt
prompt Creating package body PKG_ENROLLMENT_POST_PROCESSING
prompt ====================================================
prompt
create or replace package body core.pkg_enrollment_post_processing is
  
  /*------------------------------------------------------------------------------
  Procedure:           Enrollment_post
  Purpose:             Updates attribute columns on student_dim table based on 
                       enrollment/withdrawal transaction data in student_enrollment_fact
                       Should be run after every enrollment load
                       Updates these columns:
                             campus_security_key
                             current_grade_level
                             currently_enrolled_flag
  Input:               District Key - The district key of the students to update
  Revision History
  Date      Author       Remarks
  20100915  A.Warner     Original version
  20101008  A.Warner     Changed campus_security_key to keep state abbrev prefix for TX also;
                         So now it is just a straight copy of campus_dim.campus_key
                         Also added default values if no enrollment records found for a student
  20101024  T. Esposito  Added 'grade_level_dim.grade_level_sid desc' to 'order by' clause of
                         'student_last_campus' cursor to get most recent grade_level. (removed)
  20101102  T. Esposito  Added minimal exception handling. Added minimal process logging.
  20101104  T. Esposito  Added code to update campus_sid and campus_id in CORE.STUDENT_DIM.
  20110218  C. Bull      Add prc_upd_grd_fact_grd_lvl

  To do:
  * Asap...Handle case where student enrolled concurrently in multiple campuses 
  and most recently withdrew from one but NOT BOTH - thus the current code
  would see her as not enrolled and also assign incorrect campus sec key & grade level.
  To fix, probably need another cursor to loop through all the campuses student
  has ever been enrolled in, and see if still enrolled in any of them...
  if so grab the campus sec key and gradel level from that campus
  * Asap...Add error handling and logging
  * Some day...Replace the logic for assignment of campus_security_key to allow for multiple campuses
  (currently we only grant security for the current or most recent campus, but we
  would like to grant security to any campus the student has attended recently)
  ** need to add campus_sid_2 and campus_id_2 (DDL and logic) to support previous 
     campus functionality. (T. Esposito)
  --------------------------------------------------------------------------------*/
  
  procedure enrollment_post(p_district_key in varchar2
                           ,p_school_year in varchar2)
  is

  -- define local variables
  v_student_key student_dim.student_key%type;
  v_campus_security_key student_dim.campus_security_key%type;
  v_currently_enrolled_flag student_dim.currently_enrolled_flag%type;
  v_current_grade_level student_dim.current_grade_level%type;
  v_campus_sid student_dim.campus_sid%type;
  v_campus_id student_dim.campus_id%type;

  -- define administrative variables
  v_rec_count number;
  v_start_time timestamp := SYSTIMESTAMP;
  v_end_time timestamp;
  v_errcode varchar2(50);
  v_errmesg varchar2(200);
 
  -- this cursor returns all 
  -- the students in the given district
  cursor student_cursor is 
  select 
      student_dim.student_sid,  
      student_dim.student_key,
      student_dim.campus_security_key, 
      student_dim.current_grade_level,
      student_dim.currently_enrolled_flag,
      student_dim.last_update,
      student_dim.district_security_key,
      student_dim.campus_sid,
      student_dim.campus_id
  from
       student_dim,
       district_dim
   where student_dim.district_sid = district_dim.district_sid
    and district_dim.district_key = p_district_key
  for update of student_dim.campus_security_key
             ,student_dim.current_grade_level
             ,student_dim.currently_enrolled_flag
             ,student_dim.campus_sid
             ,student_dim.campus_id;

  -- this cursor returns the student's enrollment fact records
  -- sorted so that the most recent enrollment or withdrawal record appears FIRST
  -- this is the only record that is used
  cursor student_last_campus is 
  select 
       campus_dim.campus_key campus_security_key,
       grade_level_dim.grade_level grd,
       decode(student_enrollment_fact.withdrawal_date_sid, null
             ,'Yes'
             ,'No') currently_enrolled_flag,
       campus_dim.campus_sid,
       campus_dim.campus_id
  from
       date_dim,
       student_enrollment_fact,
       campus_dim,
       student_dim,
       grade_level_dim
  where date_dim.date_sid = student_enrollment_fact.entry_date_sid
       and campus_dim.campus_sid = student_enrollment_fact.campus_sid
       and student_dim.student_sid = student_enrollment_fact.student_sid
       and grade_level_dim.grade_level_sid = student_enrollment_fact.grade_level_sid
       and student_dim.student_key = v_student_key
       and date_dim.school_year = p_school_year
  order by 
       decode(student_enrollment_fact.withdrawal_date_sid,null
             ,to_date('12/31/2999','MM/DD/YYYY')
             ,date_dim.date_id) desc
      ,grade_level_dim.grade_level desc           
      ,campus_dim.campus_id asc;

  --****************
  -- Main processing
  --****************
  begin
  zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE post enrollment procedure'
                                       ,p_status => 'Started'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => 0
                                       ,p_comments => 'Started enrollment post-processing'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => NULL
                                       ,p_elapsed_time => NULL );
  
  --dbms_output.put_line('Starting enrollment_post for district '||p_district_key||'...');

  -- initialize record count
  v_rec_count := 0;

  -- loop through all the district's students in student_dim
  -- note that if we ever do type 2 on student we need to filter the cursor for the active student record
  for cur_stu_rec in student_cursor loop
    
    v_student_key := cur_stu_rec.student_key; -- set current student key
    
    open student_last_campus;   -- open the student last campus cursor

    -- fetch the campus security key,
    -- currently enrolled flag, and current grade level for the student
    fetch student_last_campus into v_campus_security_key
                                  ,v_current_grade_level
                                  ,v_currently_enrolled_flag
                                  ,v_campus_sid
                                  ,v_campus_id;

    -- set defaults if no enrollments found
    if student_last_campus%NOTFOUND then
       v_campus_security_key := 'NA';
       v_current_grade_level := 'UNK';
       v_currently_enrolled_flag := 'No';
       v_campus_sid := -1;
       v_campus_id  := 'UNK';
    end if;
    
    close student_last_campus;   -- close the cursor
   
    -- debug only
    --dbms_output.put_line('   Processing student '||v_student_key||': campus_seckey = '||v_campus_security_key||' cur_grd = '||v_current_grade_level||' cur_enr = '||v_currently_enrolled_flag);
   
    -- update the student dim row using 
    -- where current of the student cursor
    update student_dim
    set campus_security_key = v_campus_security_key, 
        currently_enrolled_flag = v_currently_enrolled_flag,
        current_grade_level = v_current_grade_level,
        campus_sid = v_campus_sid,
        campus_id = v_campus_id,
        last_update = systimestamp
    where current of student_cursor;
 
    v_rec_count := v_rec_count + 1;  -- increment counter
      
  end loop;
 
  commit;
   
  v_end_time := SYSTIMESTAMP;
  zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE post enrollment procedure'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_count
                                       ,p_comments => 'Successful completion of enrollment post-processing'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time) );

  --dbms_output.put_line('Completed enrollment_post, '||v_rec_count||' rows updated.');

  --***********************
  -- Error handling section
  --***********************
  exception
  when others then
    v_errcode := sqlcode;
    v_errmesg := substr(sqlerrm,1,200);
    v_end_time := SYSTIMESTAMP;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE post enrollment procedure'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_count
                                         ,p_comments => 'Error in enrollment post-processing'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time) );
    rollback;
    raise;
  
  end Enrollment_Post;
  
  procedure upd_stu_enr_days(p_district_id in varchar2
                            ,p_extract_date in varchar2
                            ,p_school_year in varchar2) 
  is
  /*---------------------------------------------------------------------------------
  -- Procedure:           upd_stu_enr_days
  --
  -- Purpose:             Calculates total days enrolled for a student and 
  --                      should be run after every enrollment_fact load per district.
  --
  -- Updated columns:     student_enrollment_fact.days_enrolled
  --                          
  -- Input:               p_district_id  = district id
  --                      p_extract_date = YYYYMMDD date when extract process was run
  --                      p_school_year  = school year of data to be updated
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20101119  T. Esposito  Original version
  -- 20101208  T. Esposito  Added flter on entry_date_sid for given school_year.
  -- 20110921  C. Bull      Bug-Fix DWS-1503: Added Join to district_dim to constrain the date_dim look up
  --                        in the sub-select to the called district. It was returning the sid for the
  --                        wrong district causing it to update mutiple school years. 
  --
  ---------------------------------------------------------------------------------*/

  -- cursor to get enrolled days per student
  cursor cur_stu_enr(p_school_year varchar2
                    ,v_extract_date_sid number
                    ,p_district_id varchar2) is
    select count(1) as days_enrolled
         ,campus_sid
         ,student_sid
         ,entry_date_sid
         ,grade_level_sid   
    from date_dim 
        ,student_enrollment_fact  
    where date_dim.school_day_indicator = 'Instructional'
    and date_dim.school_year = p_school_year
    and date_dim.date_sid >= student_enrollment_fact.entry_date_sid 
    and (date_dim.date_sid < nvl(student_enrollment_fact.withdrawal_date_sid, v_extract_date_sid) 
    or (date_dim.date_sid <= nvl(student_enrollment_fact.withdrawal_date_sid, v_extract_date_sid) 
        and date_dim.semester = '2' and date_dim.last_day_semester = 'Yes'))
    and student_enrollment_fact.campus_sid in (select campus_sid
                                               from campus_dim
                                               where district_id = p_district_id) 
    and student_enrollment_fact.entry_date_sid >= (select min(date_sid)
                                                   from date_dim
                                                   join district_dim on district_dim.district_sid = date_dim.district_sid
                                                                     and district_dim.district_id = p_district_id
                                                   where date_dim.school_year = p_school_year)                                            
    group by campus_sid
            ,student_sid
            ,entry_date_sid
            ,grade_level_sid;

  -- define variables
  v_start_time               zeus.etl_event_log.start_time%type := systimestamp;
  v_end_time                 zeus.etl_event_log.end_time%type;
  v_errcode                  zeus.etl_event_log.error_code%type;
  v_errmesg                  zeus.etl_event_log.error_message%type;
  v_extract_date_sid         core.date_dim.date_sid%type;
  v_rows_affected            number := 0;

  --*************
  -- Main program
  --*************
  begin  
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'CORE - upd_stu_enr_days'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started upd_stu_enr_days procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);
   
    -- get extract_date_sid for day extract was executed                                     
    select date_sid 
    into v_extract_date_sid
    from date_dim 
      join district_dim 
      using (district_sid)
    where year_month_day = p_extract_date
    and district_id = p_district_id;
      
    for r_enr_rec in cur_stu_enr(p_school_year 
                                ,v_extract_date_sid
                                ,p_district_id)
    loop  
           
      execute immediate 
        'update core.student_enrollment_fact
            set days_enrolled = :bv1
               ,last_update   = sysdate
          where campus_sid    = :bv2
          and student_sid     = :bv3
          and entry_date_sid  = :bv4
          and grade_level_sid = :bv5'
      using r_enr_rec.days_enrolled
           ,r_enr_rec.campus_sid
           ,r_enr_rec.student_sid
           ,r_enr_rec.entry_date_sid
           ,r_enr_rec.grade_level_sid;
           
      v_rows_affected := v_rows_affected + sql%rowcount;     
  
    end loop;
    commit;
    
    if v_rows_affected = 0 then  -- issue warning if no rows updated
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'WARN'
                                       ,p_source_name => 'CORE - upd_stu_enr_days'
                                       ,p_status => 'Continued'
                                       ,p_error_code => '-1'
                                       ,p_error_message => 'No rows updated in student_enrollment_fact'
                                       ,p_rows_affected_count => 0
                                       ,p_comments => 'The upd_stu_enr_days procedure will continue'
                                       ,p_start_time => NULL
                                       ,p_end_time => NULL
                                       ,p_elapsed_time => NULL);
  
    else
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE - upd_stu_enr_days'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rows_affected 
                                       ,p_comments => 'Successful completion of upd_stu_enr_days procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
     
    end if;
                    
    --***************************
    -- Exception handling section
    --***************************
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE - upd_stu_enr_days'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Error in upd_stu_enr_days procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time
                                                                                                  ,v_end_time));
      rollback;
      raise; 
      
  end upd_stu_enr_days;
  
  procedure insert_date_to_execution_log(p_district_id varchar2
                                        ,p_run_date varchar2)
  is                                                      
  /*--------------------------------------------------------------------------------------
  -- Procedure:           insert_date_to_execution_log
  --
  -- Purpose:             Inserts load date -- date data was pull from source -- record(s)
  --                      for all campuses within a district.  The record(s) inserted
  --                      into the dws.execution_log table by this procedure 
  --                      are required for the DWS reports to run correctly and reflect
  --                      accurate data.  The Start_Date_Time reflects the extract_date_time
  --                      and End_Date_Time reflects the load date and time.
  --
  -- Parms:               p_district_id = district of campuses to be updated
  --                      p_run_date = YYYYMMDD date when source load occurred
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20101115  T. Esposito  Original version
  -- 20110502  C. Bull      Converted Start Date Time to full timestamp was being set to 1:00.000
  ---------------------------------------------------------------------------------------*/                                                        
   
  cursor campus_cur(p_district_id varchar2) is
    select distinct campus_sid
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
   
    v_date_time := to_timestamp(p_run_date,'yyyymmdd_hh24miss.ff6'); -- to_timestamp(p_run_date || '01:00:00.000','yyyymmdd hh:mi:ss.ff'); Replaced 05/02/11 CBull
    v_sql_stmt := 'insert into dws.execution_log (execution_start_time, campus_sid, process_name, process_type, execution_end_time, execution_result)
                   values(:bv1, :bv2, ''Load'', ''N/A'', cast(sysdate as timestamp), ''Successful'')';
    
    for campus_rec in campus_cur(p_district_id) loop
      execute immediate v_sql_stmt using v_date_time, campus_rec.campus_sid;
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
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when dup_val_on_index then  -- if dup row then ignore error
      null;
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
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise; 
                        
  end insert_date_to_execution_log;
                                             
procedure prc_upd_grd_fact_grd_lvl(p_district_id varchar2
                                   ,p_school_year in varchar2)
  is                                                      
  /*--------------------------------------------------------------------------------------
  -- Procedure:           prc_upd_grd_fact_grd_lvl
  --
  -- Purpose:             The common loader for grade fact sets the grade_level_sid to -1(Unknown)
  --                      for all student+grade_facts within a district.  This procedure collects
  --                      all of these grade facts and updates the grade fact sid to the proper value 
  --                      based on the students grade level on their enrollment as determined by thier
  --                      campus_sid and grade date_sid.
  --
  -- Parms:               p_district_id = district of campuses to be updated
  --                      p_run_date = YYYYMMDD date when source load occurred
  --
  -- Revision History
  -- Date      Author       Remarks
  -- 20101115  T. Esposito  Original version
  ---------------------------------------------------------------------------------------*/                                                        
   
 
  v_start_time timestamp := systimestamp;
  v_end_time timestamp;
  v_errcode varchar2(50);
  v_errmesg varchar2(200);
  v_rec_cnt number;

 
  --****************
  -- Main processing
  --****************   
  begin
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'INFO'
                                         ,p_source_name => 'prc_upd_grd_fact_grd_lvl'
                                         ,p_status => 'Started'
                                         ,p_error_code => '0'
                                         ,p_error_message => NULL
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Started prc_upd_grd_fact_grd_lvl procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => NULL
                                         ,p_elapsed_time => NULL);


     update 
      (select student_grade_fact.campus_sid
        ,student_grade_fact.date_sid
        ,student_grade_fact.student_sid
        ,student_grade_fact.grade_level_sid
        ,campus_dim.district_id
        ,student_dim.current_grade_level
        from student_grade_fact
        join campus_dim on student_grade_fact.campus_sid = campus_dim.campus_sid
                        and campus_dim.district_id = p_district_id
        join date_dim on student_grade_fact.date_sid = date_dim.date_sid
             and date_dim.school_year = p_school_year
        join student_dim on student_dim.student_sid = student_grade_fact.student_sid 
        where  student_grade_fact.grade_level_sid = -1
             and student_grade_fact.student_sid <> -1) student_grade_fact
     set student_grade_fact.grade_level_sid = 
         nvl((select student_enrollment_fact.grade_level_sid
              from student_enrollment_fact
              join date_dim on date_dim.date_sid = student_enrollment_fact.entry_date_sid
                            and date_dim.school_year = p_school_year
              where student_enrollment_fact.campus_sid = student_grade_fact.campus_sid
              and student_enrollment_fact.student_sid = student_grade_fact.student_sid
              and student_enrollment_fact.entry_date_sid <= student_grade_fact.date_sid 
              and (student_enrollment_fact.withdrawal_date_sid is null 
                   or student_enrollment_fact.withdrawal_date_sid > student_grade_fact.date_sid))
             ,nvl((select grade_level_dim.grade_level_sid from grade_level_dim 
                  where student_grade_fact.current_grade_level = grade_level_dim.grade_level),-1));

    -- set row count
    v_rec_cnt := sql%rowcount;

    commit;
    
    v_end_time := systimestamp;
    zeus.pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'prc_upd_grd_fact_grd_lvl'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of prc_upd_grd_fact_grd_lvl procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when no_data_found then  -- no grades to process
      null;
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
                                         ,p_elapsed_time => zeus.pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise; 
                        
  end prc_upd_grd_fact_grd_lvl;
                                             
end pkg_enrollment_post_processing;
/

prompt
prompt Creating trigger TRG_ABS_RSN_DIM_LAST_UPDATE
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_ABS_RSN_DIM_LAST_UPDATE"
  before insert or update on absence_reason_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_abs_rsn_dim_last_update;
/

prompt
prompt Creating trigger TRG_CAMPUS_DIM_LAST_UPDATE
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_CAMPUS_DIM_LAST_UPDATE"
  before insert or update on campus_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_campus_dim_last_update;
/

prompt
prompt Creating trigger TRG_CLASS_PRD_DIM_LAST_UPDATE
prompt ==============================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_CLASS_PRD_DIM_LAST_UPDATE"
  before insert or update on class_period_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_class_prd_dim_last_update;
/

prompt
prompt Creating trigger TRG_COURSE_DIM_LAST_UPDATE
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_COURSE_DIM_LAST_UPDATE"
  before insert or update on course_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_course_dim_last_update;
/

prompt
prompt Creating trigger TRG_CRS_SECT_DIM_LAST_UPDATE
prompt =============================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_CRS_SECT_DIM_LAST_UPDATE"
  before insert or update on course_section_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_crs_sect_dim_last_update;
/

prompt
prompt Creating trigger TRG_DIST_DIM_LAST_UPDATE
prompt =========================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_DIST_DIM_LAST_UPDATE"
  before insert or update on district_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_dist_dim_last_update;
/

prompt
prompt Creating trigger TRG_STU_DIM_LAST_UPDATE
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER CORE."TRG_STU_DIM_LAST_UPDATE"
  before insert or update on student_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_stu_dim_last_update;
/


spool off
