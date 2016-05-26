-----------------------------------------------------------
-- Export file for user TIMSRPTDATA@DATAWH               --
-- Created by espositot on 5/26/2016, 16:54:30 16:54:30  --
-----------------------------------------------------------

set define off
spool timsrptdata_ddl.log

prompt
prompt Creating table DISTRICT_DIM
prompt ===========================
prompt
create table TIMSRPTDATA.DISTRICT_DIM
(
  district_sid                  NUMBER not null,
  district_id                   VARCHAR2(20) not null,
  district_area                 VARCHAR2(30),
  district_name                 VARCHAR2(75),
  address                       VARCHAR2(100),
  address_line_2                VARCHAR2(100),
  city                          VARCHAR2(50),
  state_code                    VARCHAR2(2),
  postal_code                   VARCHAR2(10),
  county                        VARCHAR2(50),
  district_key                  VARCHAR2(20),
  last_update                   TIMESTAMP(6),
  region_name                   VARCHAR2(20),
  phone_number                  VARCHAR2(20),
  fax_number                    VARCHAR2(20),
  email_address                 VARCHAR2(50),
  web_site                      VARCHAR2(100),
  password_expire_days          NUMBER(3) default 180,
  password_max_attempts         NUMBER(1) default 5,
  password_expire_month         NUMBER(2),
  password_expire_day           NUMBER(3),
  password_expiration_method    VARCHAR2(20),
  district_security_question    VARCHAR2(2000),
  district_security_answer      VARCHAR2(2000),
  district_ip_range             VARCHAR2(100),
  login_message                 VARCHAR2(2000),
  login_message_start_date_time DATE,
  login_message_end_date_time   DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.DISTRICT_DIM
  is 'A local education agency.
Example: Dallas Independent School District';
comment on column TIMSRPTDATA.DISTRICT_DIM.district_area
  is 'The educational area or region in which the district is located.
Example: Region 10
';
comment on column TIMSRPTDATA.DISTRICT_DIM.district_key
  is 'Uniquely identifies a district.  A concatenation of state code and district id.
Example: TX*043901';
comment on column TIMSRPTDATA.DISTRICT_DIM.region_name
  is 'The name of the regional service service center for this campus.
Example: Region 10,
                10';
comment on column TIMSRPTDATA.DISTRICT_DIM.web_site
  is 'District Website address.';
comment on column TIMSRPTDATA.DISTRICT_DIM.password_expire_days
  is 'The number of days before since the last password change before a user must change their

password.';
comment on column TIMSRPTDATA.DISTRICT_DIM.password_max_attempts
  is 'The maximum number of times a user will be allowed to try to log on before their account is

locked.';
comment on column TIMSRPTDATA.DISTRICT_DIM.password_expire_month
  is 'The month number that user passwords will have to be changed.';
comment on column TIMSRPTDATA.DISTRICT_DIM.password_expire_day
  is 'The day of the month that user passwords will have to be changed.';
comment on column TIMSRPTDATA.DISTRICT_DIM.password_expiration_method
  is 'Specifies which method will be used to force users to change their passwords.
Values: Number Of Days
             Specific Month/Day';
comment on column TIMSRPTDATA.DISTRICT_DIM.district_security_question
  is 'A question to validate first time users.';
comment on column TIMSRPTDATA.DISTRICT_DIM.district_security_answer
  is 'The answer to the district security question.';
comment on column TIMSRPTDATA.DISTRICT_DIM.district_ip_range
  is 'An ip range to expression used to validate the ip address of the user to determine if they are

logging in from inside or outside the districts network.';
comment on column TIMSRPTDATA.DISTRICT_DIM.login_message
  is 'A message displayed on the login page for all users.';
comment on column TIMSRPTDATA.DISTRICT_DIM.login_message_start_date_time
  is 'The start date and time of the login message.';
comment on column TIMSRPTDATA.DISTRICT_DIM.login_message_end_date_time
  is 'The end date and time of the login message.';
alter table TIMSRPTDATA.DISTRICT_DIM
  add constraint PK_DISTRICT_DIM primary key (DISTRICT_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.DISTRICT_DIM
  add constraint AK_DISTRICT_BUS_KEY unique (DISTRICT_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table ABSENCE_REASON_DIM
prompt =================================
prompt
create table TIMSRPTDATA.ABSENCE_REASON_DIM
(
  absence_reason_sid         NUMBER not null,
  district_sid               NUMBER not null,
  absence_reason_code        VARCHAR2(50) not null,
  absence_reason_description VARCHAR2(50),
  absence_reason_key         VARCHAR2(75),
  last_update                TIMESTAMP(6) not null,
  exclude_absence_reason     VARCHAR2(3) default 'No' not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.ABSENCE_REASON_DIM
  is 'The reason that a student missed instruction such as excused or unexcused.';
comment on column TIMSRPTDATA.ABSENCE_REASON_DIM.absence_reason_key
  is 'The business key for an absence reason.  The concatenation of state code, district id and absence reason code.
Example: TX*043901*Doctors Appointment';
comment on column TIMSRPTDATA.ABSENCE_REASON_DIM.exclude_absence_reason
  is 'Indicates that the Absence Reason should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table TIMSRPTDATA.ABSENCE_REASON_DIM
  add constraint PK_ABSENCE_REASON_DIM primary key (ABSENCE_REASON_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ABSENCE_REASON_DIM
  add constraint AK_ABS_RSN_BUS_KEY unique (ABSENCE_REASON_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ABSENCE_REASON_DIM
  add constraint FK_ABSENCE__REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ACADEMIC_RECORD_SOURCE_DIM
prompt =========================================
prompt
create table TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM
  is 'Indicates the where the record of academic achievement came from, classroom, transfer, exam, etc...';
comment on column TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM.academic_source_description
  is 'Describes the Academic Source Code.
Examples: Transfer,
                 Classroom,
                 Exam,
                 Online';
create unique index TIMSRPTDATA.PK_CREDIT_TYPE_DIM on TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM
  add constraint PK_ACADEMIC_RECORD_SOURCE_DIM primary key (ACADEMIC_SOURCE_CODE);

prompt
prompt Creating table ACTION_LENGTH_DIFF_REASON_DIM
prompt ============================================
prompt
create table TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM
(
  action_length_diff_reason_sid NUMBER not null,
  action_length_diff_reason     VARCHAR2(100) not null,
  action_length_diff_reason_key VARCHAR2(125) not null,
  district_sid                  NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM
  is 'Describes why the assigned action length varies from the actual days served.';
comment on column TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason_sid
  is 'Uniquely identifies the Action Length Diff Reason Dim';
comment on column TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason
  is 'Description of why the assigned days varies from the actual days.
Example: Term Modified by District';
comment on column TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason_key
  is 'Business key for the Action Length Diff Reason Dim.
Example: TX*849395*Other';
alter table TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM
  add constraint PK_ACTION_LENGTH_DIFF_REASON_D primary key (ACTION_LENGTH_DIFF_REASON_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM
  add constraint AK_AK_ACTION_LEN_DIFF_ACTION_L unique (ACTION_LENGTH_DIFF_REASON_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table AD_CAMPUS_XREF
prompt =============================
prompt
create table TIMSRPTDATA.AD_CAMPUS_XREF
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_FIRST_NAME
prompt ============================
prompt
create table TIMSRPTDATA.AD_FIRST_NAME
(
  name_sid   NUMBER not null,
  first_name VARCHAR2(50) not null,
  gender     VARCHAR2(1) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_LAST_NAME
prompt ===========================
prompt
create table TIMSRPTDATA.AD_LAST_NAME
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_SCHOOL_NAME
prompt =============================
prompt
create table TIMSRPTDATA.AD_SCHOOL_NAME
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_STREET_NAME
prompt =============================
prompt
create table TIMSRPTDATA.AD_STREET_NAME
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_STUDENT
prompt =========================
prompt
create table TIMSRPTDATA.AD_STUDENT
(
  student_id   VARCHAR2(25),
  first_name   VARCHAR2(50),
  middle_name  VARCHAR2(50),
  last_name    VARCHAR2(50),
  full_name    VARCHAR2(100),
  gender       VARCHAR2(6),
  address      VARCHAR2(100),
  city         VARCHAR2(50),
  state_code   VARCHAR2(2),
  postal_code  VARCHAR2(10),
  phone_number VARCHAR2(15)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AD_STUDENT_XREF
prompt ==============================
prompt
create table TIMSRPTDATA.AD_STUDENT_XREF
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPLICATION
prompt ==========================
prompt
create table TIMSRPTDATA.APPLICATION
(
  application_id    NUMBER not null,
  active_flag       VARCHAR2(1) not null,
  description       VARCHAR2(2000),
  application_alias VARCHAR2(20)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.APPLICATION.application_id
  is 'The APEX application number';
comment on column TIMSRPTDATA.APPLICATION.active_flag
  is 'Indicates if the application is currently active and available.
Values: Y, N';
comment on column TIMSRPTDATA.APPLICATION.description
  is 'Describes the Application';
comment on column TIMSRPTDATA.APPLICATION.application_alias
  is 'An alternate name for the application used in place of the application id in
APEX to identify the application in the url.
Example: DWS,
               REVIDMGR';
alter table TIMSRPTDATA.APPLICATION
  add constraint PK_APPLICATION primary key (APPLICATION_ID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table APPLICATION_EVENT_TYPE
prompt =====================================
prompt
create table TIMSRPTDATA.APPLICATION_EVENT_TYPE
(
  event_type_sid  NUMBER not null,
  event_type_name VARCHAR2(30) not null,
  event_type_desc VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.APPLICATION_EVENT_TYPE
  add constraint APPLICATION_EVENT_TYPE_PK primary key (EVENT_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.APPLICATION_EVENT_TYPE
  add constraint APPLICATION_EVENT_TYPE_UK1 unique (EVENT_TYPE_NAME)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table APPLICATION_EVENT_LOG
prompt ====================================
prompt
create table TIMSRPTDATA.APPLICATION_EVENT_LOG
(
  event_id       NUMBER not null,
  application_id NUMBER not null,
  user_id        VARCHAR2(30) not null,
  event_type_sid NUMBER not null,
  event_dttm     DATE not null,
  event_details  VARCHAR2(2000)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.APPLICATION_EVENT_LOG
  add constraint APPLICATION_EVENT_LOG_PK primary key (EVENT_ID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.APPLICATION_EVENT_LOG
  add constraint APPLICATION_EVENT_FK1 foreign key (EVENT_TYPE_SID)
  references TIMSRPTDATA.APPLICATION_EVENT_TYPE (EVENT_TYPE_SID);

prompt
prompt Creating table ROLE_MASTER
prompt ==========================
prompt
create table TIMSRPTDATA.ROLE_MASTER
(
  role_sid         NUMBER not null,
  role             VARCHAR2(20) not null,
  role_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.ROLE_MASTER.role_sid
  is 'Surrogate Key for the User role';
comment on column TIMSRPTDATA.ROLE_MASTER.role
  is 'Defines a role that can be applied to an application and a user.
Example: District,
              Campus';
alter table TIMSRPTDATA.ROLE_MASTER
  add constraint PK_ROLE_MASTER primary key (ROLE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ROLE_MASTER
  add constraint AK_ROLE_AK_ROLE_MAS unique (ROLE)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table APPLICATION_ROLE
prompt ===============================
prompt
create table TIMSRPTDATA.APPLICATION_ROLE
(
  application_role_sid NUMBER not null,
  role_sid             NUMBER not null,
  application_id       NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.APPLICATION_ROLE.application_role_sid
  is 'Surrogate Key for the Application Role';
comment on column TIMSRPTDATA.APPLICATION_ROLE.role_sid
  is 'Surrogate Key for the User role';
alter table TIMSRPTDATA.APPLICATION_ROLE
  add constraint PK_APPLICATION_ROLE primary key (APPLICATION_ROLE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.APPLICATION_ROLE
  add constraint AK_APPLICATION_ROLE_A_APPLICAT unique (ROLE_SID, APPLICATION_ID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.APPLICATION_ROLE
  add constraint FK_APPLICAT_REFERENCE_ROLE_MAS foreign key (ROLE_SID)
  references TIMSRPTDATA.ROLE_MASTER (ROLE_SID);
alter table TIMSRPTDATA.APPLICATION_ROLE
  add constraint FK_APPL_REF_APP_ROLE foreign key (APPLICATION_ID)
  references TIMSRPTDATA.APPLICATION (APPLICATION_ID);

prompt
prompt Creating table CAMPUS_DIM
prompt =========================
prompt
create table TIMSRPTDATA.CAMPUS_DIM
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
  default_grading_cycle   VARCHAR2(15),
  discipline_threshold    NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.CAMPUS_DIM
  is 'Identifies a physical location where a instruction takes place.

Issues:
1) May need an "OFF CAMPUS" dimension row for courses, grades and credits that come from off campus sources such as college, distance learning, etc.';
comment on column TIMSRPTDATA.CAMPUS_DIM.campus_name
  is 'Full name of the campus.
Example: McKinney Central High School,
               Frisco High School';
comment on column TIMSRPTDATA.CAMPUS_DIM.campus_short_name
  is 'Short name of the campus
Example: Central,
               Frisco HS';
comment on column TIMSRPTDATA.CAMPUS_DIM.periods_per_day
  is 'The number of scheduled periods per day at this campus.
Example: 7
8
4 (for A/B block schedule)';
comment on column TIMSRPTDATA.CAMPUS_DIM.attendance_threshold
  is 'The percentage threshold by which students will be flagged for the attendance risk factor.
Example: .10 - 10%
               .08 - 8%';
comment on column TIMSRPTDATA.CAMPUS_DIM.campus_key
  is 'Uniquely identifies a campus. A concatenation of the state code, district id, and campus id.
Example: TX*043901*043901001';
comment on column TIMSRPTDATA.CAMPUS_DIM.passing_grade_threshold
  is 'Defines the lowest pasing number grade at this campus.
Example: 70 (default),
                60,
                80';
comment on column TIMSRPTDATA.CAMPUS_DIM.default_grading_cycle
  is 'Defines the grading cycle to be used by the core/non-core risk factor for this campus.
Values: 6-Weeks,
             9-Weeks';
comment on column TIMSRPTDATA.CAMPUS_DIM.discipline_threshold
  is 'Defines the number of discipline actions before a student is flagged with a risk factor.';
create bitmap index TIMSRPTDATA.BMI_CAMPUS_DIM_DISTRICT_FK on TIMSRPTDATA.CAMPUS_DIM (DISTRICT_SID)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_DIM
  add constraint PK_CAMPUS_DIM primary key (CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_DIM
  add constraint AK_CAMPUS_DIM_BUS_KEY unique (CAMPUS_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_DIM
  add constraint FK_CAMPUS_D_RELATIONS_DISTRICT foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table DATE_DIM
prompt =======================
prompt
create table TIMSRPTDATA.DATE_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.DATE_DIM
  is 'Identifies the common and districts specific calendars.';
comment on column TIMSRPTDATA.DATE_DIM.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.DATE_DIM.district_sid
  is 'Surrogate key';
comment on column TIMSRPTDATA.DATE_DIM.date_id
  is 'A specific day of the year';
comment on column TIMSRPTDATA.DATE_DIM.calendar_year
  is 'Example: 2009';
comment on column TIMSRPTDATA.DATE_DIM.calendar_year_quarter
  is 'Example: 2009 Q1';
comment on column TIMSRPTDATA.DATE_DIM.calendar_quarter
  is 'Example: 1';
comment on column TIMSRPTDATA.DATE_DIM.calendar_year_month
  is 'Example: 200912';
comment on column TIMSRPTDATA.DATE_DIM.calendar_month
  is 'Example: 12';
comment on column TIMSRPTDATA.DATE_DIM.calendar_month_name
  is 'Example: December';
comment on column TIMSRPTDATA.DATE_DIM.calendar_month_short_name
  is 'Example: Dec';
comment on column TIMSRPTDATA.DATE_DIM.calendar_week
  is 'Example: 50';
comment on column TIMSRPTDATA.DATE_DIM.day_of_week
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
comment on column TIMSRPTDATA.DATE_DIM.day_of_week_name
  is 'Example: Thursday';
comment on column TIMSRPTDATA.DATE_DIM.day_of_week_short_name
  is 'Example: Thu';
comment on column TIMSRPTDATA.DATE_DIM.school_year
  is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column TIMSRPTDATA.DATE_DIM.school_year_description
  is 'Example: 2009/2010';
comment on column TIMSRPTDATA.DATE_DIM.school_week
  is 'Example: 24';
comment on column TIMSRPTDATA.DATE_DIM.year_month_day
  is 'Example: 20091215';
comment on column TIMSRPTDATA.DATE_DIM.short_date
  is 'Example: 12/15/2009';
comment on column TIMSRPTDATA.DATE_DIM.long_date
  is 'Example: December 15, 2009';
comment on column TIMSRPTDATA.DATE_DIM.school_day_indicator
  is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column TIMSRPTDATA.DATE_DIM.academic_6_weeks
  is 'Identifies the 6 weeks period associated with the academic day.  Non-academic days are set to ''0''.
Values:
1
2
3
4
5
6
0 - non-instructional days';
comment on column TIMSRPTDATA.DATE_DIM.academic_9_weeks
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
comment on column TIMSRPTDATA.DATE_DIM.semester
  is 'Example: 1';
comment on column TIMSRPTDATA.DATE_DIM.first_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.last_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.first_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.last_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.first_day_semester
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.last_day_semester
  is 'Values: Yes/No';
comment on column TIMSRPTDATA.DATE_DIM.date_key
  is 'The unique business key for a date.  The concatenation of state code, district id, and date(YYYYMMDD)
Example: TX*043901*20100715';
alter table TIMSRPTDATA.DATE_DIM
  add constraint PK_DATE_DIM primary key (DATE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.DATE_DIM
  add constraint AK_DATE_DIM_BUS_KEY unique (DATE_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.DATE_DIM
  add constraint FK_DATE_DIM_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table USER_ACCOUNT
prompt ===========================
prompt
create table TIMSRPTDATA.USER_ACCOUNT
(
  user_sid                 NUMBER not null,
  district_sid             NUMBER not null,
  user_id                  VARCHAR2(75) not null,
  password                 VARCHAR2(255) not null,
  password_expiration_date DATE,
  password_update_date     DATE,
  user_first_name          VARCHAR2(50),
  user_last_name           VARCHAR2(50),
  email_address            VARCHAR2(75),
  created_by               NUMBER,
  create_date              TIMESTAMP(6),
  updated_by               NUMBER,
  update_date              TIMESTAMP(6),
  account_locked           VARCHAR2(1),
  employee_id              VARCHAR2(50),
  active_account_flag      VARCHAR2(1),
  last_login_date          DATE,
  first_login_flag         VARCHAR2(1),
  attempt_ctr              NUMBER,
  student_ssn_auth         VARCHAR2(1) default 'N',
  staff_ssn_auth           VARCHAR2(1) default 'N',
  econ_disadv_auth         VARCHAR2(1) default 'N',
  user_source              VARCHAR2(30),
  super_user               VARCHAR2(1) default 'N',
  reveal_control_panel     VARCHAR2(1) default 'N'
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.USER_ACCOUNT.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.USER_ACCOUNT.user_id
  is 'A unique name or email address that identifies a user of one or more applications.
example: jane.doe@anywhereISD.org';
comment on column TIMSRPTDATA.USER_ACCOUNT.password
  is 'Users encrypted password';
comment on column TIMSRPTDATA.USER_ACCOUNT.password_expiration_date
  is 'The date on which the users password will expire and need to be changed.';
comment on column TIMSRPTDATA.USER_ACCOUNT.password_update_date
  is 'The date on which the user last changed their password.';
comment on column TIMSRPTDATA.USER_ACCOUNT.user_first_name
  is 'First name of the user.';
comment on column TIMSRPTDATA.USER_ACCOUNT.user_last_name
  is 'Surname of the user.';
comment on column TIMSRPTDATA.USER_ACCOUNT.email_address
  is 'The email address of the user.';
comment on column TIMSRPTDATA.USER_ACCOUNT.created_by
  is 'The SID of the user that created this user account.';
comment on column TIMSRPTDATA.USER_ACCOUNT.create_date
  is 'The timestamp when the account was created.';
comment on column TIMSRPTDATA.USER_ACCOUNT.updated_by
  is 'The SID of the user that updated this user account.';
comment on column TIMSRPTDATA.USER_ACCOUNT.update_date
  is 'The timestamp when the account was updated.';
comment on column TIMSRPTDATA.USER_ACCOUNT.account_locked
  is 'Indicates that the account is locked or not allowing or restricting access.
Values: Y, N';
comment on column TIMSRPTDATA.USER_ACCOUNT.employee_id
  is 'The Employee identifier of number.';
comment on column TIMSRPTDATA.USER_ACCOUNT.active_account_flag
  is 'Indicates that the account is currently active for use or has been deactivated.
Values: Y, N';
comment on column TIMSRPTDATA.USER_ACCOUNT.last_login_date
  is 'The date and time that the user last successfully logged into a reveal application.';
comment on column TIMSRPTDATA.USER_ACCOUNT.first_login_flag
  is 'A flag to indicate that the user has not logged in before and needs to complete additional

security setup.
Values: Y/N';
comment on column TIMSRPTDATA.USER_ACCOUNT.attempt_ctr
  is 'Identifies the number failed attempts to log on by this user';
comment on column TIMSRPTDATA.USER_ACCOUNT.student_ssn_auth
  is 'Indicates if this user is allowed to view Student SSNs.
Values: Y/N';
comment on column TIMSRPTDATA.USER_ACCOUNT.staff_ssn_auth
  is 'Indicates if this user is allowed to view Staff SSNs.
Values: Y/N';
comment on column TIMSRPTDATA.USER_ACCOUNT.econ_disadv_auth
  is 'Indicates if this user is allowed to view the Economically Disadvantage
information for a student.
Values: Y/N';
comment on column TIMSRPTDATA.USER_ACCOUNT.user_source
  is 'Indicates the source of the user and if the users permissions are to be synchronized with the source system from which the user was imported. Example: TxEIS-SYNC, TxEIS-NOSYNC, REVEAL';
comment on column TIMSRPTDATA.USER_ACCOUNT.super_user
  is 'Indicates that the user is authorized to access functions reserved for the highest level users. Values Y/N';
alter table TIMSRPTDATA.USER_ACCOUNT
  add constraint PK_USER_ACCOUNT primary key (USER_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_ACCOUNT
  add constraint AK_USER_AK_USER_ACC unique (USER_ID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_ACCOUNT
  add constraint FK_USER_ACC_REF_DISTRICT_DIM foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table STUDENT_DIM
prompt ==========================
prompt
create table TIMSRPTDATA.STUDENT_DIM
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
  campus_id                      VARCHAR2(20),
  user_sid                       NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_DIM
  is 'Identifies a person who receives instruction from a district/campus.';
comment on column TIMSRPTDATA.STUDENT_DIM.postal_code
  is 'Students zip code. may include plus 4. Example: 75444-3333';
comment on column TIMSRPTDATA.STUDENT_DIM.phone_number
  is 'Students Primary contact phone number digits only.  Example: 5558884444';
comment on column TIMSRPTDATA.STUDENT_DIM.gender
  is 'Students Gender Values: Male/Female';
comment on column TIMSRPTDATA.STUDENT_DIM.ethnicity
  is 'Hispanic or Not. Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.american_indian_alaska_native
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.asian
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.black_or_african_american
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.native_hawaiian_pacific_island
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.white
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.two_or_more_races
  is 'Values Yes, No';
comment on column TIMSRPTDATA.STUDENT_DIM.race_ethnicity_short_desc
  is 'Concatenation of Student ethnicity and races.
Example: Hispanic, Amer. Indian/Alaskan. , Asian, Black';
comment on column TIMSRPTDATA.STUDENT_DIM.primary_language
  is 'Students primary spoken language.  Example: Spanish';
comment on column TIMSRPTDATA.STUDENT_DIM.ninth_grade_cohort
  is 'The calculated year of graduation based on the year the student entered the ninth grade.';
comment on column TIMSRPTDATA.STUDENT_DIM.limited_english_proficiency
  is 'Students who are unable to communicate effectively in English because their primary language is not English and they have not developed fluency in the English language.
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.lep_first_year_monitoring
  is 'Students who are in first year monitoring for limited english proficiency.
values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.lep_second_year_monitoring
  is 'Students who are in second year monitoring for limited english proficiency.
values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.immigrant
  is 'Students who are not naturalized citizens of the United States.
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.migrant
  is 'Student whose family frequently moves to follow seasonal work patterns.
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.economically_disadvantaged
  is 'An indication of inadequate financial condition of a student''s family, as determined by family income,
number of family members/dependents, participation in public assistance programs, and/or other
characteristics considered relevant by federal, state, and local policy.
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.special_education
  is 'Indicates that a student is participating a special education program.
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_DIM.meal_eligibility
  is 'Eligibility status for School food Service Programs
examples:  Free
               , Full Price
              , Reduced Price,
              , Unknown
';
comment on column TIMSRPTDATA.STUDENT_DIM.primary_disability
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
comment on column TIMSRPTDATA.STUDENT_DIM.secondary_disability
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
comment on column TIMSRPTDATA.STUDENT_DIM.tertiary_disability
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
comment on column TIMSRPTDATA.STUDENT_DIM.date_entered_ninth_grade
  is 'The date the student start the ninth grade.
Example: 8/24/2008';
comment on column TIMSRPTDATA.STUDENT_DIM.student_photo
  is 'A picture of the student.';
comment on column TIMSRPTDATA.STUDENT_DIM.race_ethnicity_key
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
comment on column TIMSRPTDATA.STUDENT_DIM.campus_security_key
  is 'The students current campus within the district.  A Concatenation of state code, district code, and campus id.
Example: OK*0923084*009';
comment on column TIMSRPTDATA.STUDENT_DIM.district_security_key
  is 'The Current district of the student used to restrict data for security.
A concatenation of state code and district id.
Example: OK*8394839';
comment on column TIMSRPTDATA.STUDENT_DIM.student_key
  is 'The business key for student.  A concatenation of State code, District id, and Student Id.';
comment on column TIMSRPTDATA.STUDENT_DIM.campus_sid
  is 'Identifies the SID of the students currently enrolled campus.';
comment on column TIMSRPTDATA.STUDENT_DIM.campus_id
  is 'Identifies the Campus Id of the students currently enrolled campus.';
comment on column TIMSRPTDATA.STUDENT_DIM.user_sid
  is 'User Surrogate Key';
create bitmap index TIMSRPTDATA.BMI_STU_DIM_DISTRICT_SID_FK on TIMSRPTDATA.STUDENT_DIM (DISTRICT_SID)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_DIM
  add constraint PK_STUDENT_DIM primary key (STUDENT_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_DIM
  add constraint AK_STUDENT_DIM_BUS_KEY unique (STUDENT_KEY)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_DIM
  add constraint FK_STUDENT_DISTRICT_DIM foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);
alter table TIMSRPTDATA.STUDENT_DIM
  add constraint FK_STU_REF_USER_ACCT foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID)
  disable
  novalidate;

prompt
prompt Creating table ATTENDANCE_RISK_FACTOR_FACT
prompt ==========================================
prompt
create table TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT
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
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT
  is 'Captures the results of the Risk Factor Calculation Engine for the attendance risk factor.';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.period_absence_count
  is 'The number periods the student was absent on this day.
Example: 7';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.ytd_period_absence_count
  is 'The total number of periods absent from the start of the school year unitl this date.
Example: 54';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.ytd_days_enrolled
  is 'The total number days the student has been enrolled since the start of the school year unitl this date.
Example: 132';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.period_absence_percent
  is 'The percent of instructional periods that the student has missed.
Example: .1323 (13.22%)';
comment on column TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT.last_update
  is 'The datetime that the row was insert/updated';
alter table TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table BATCH_USER_ACCOUNT
prompt =================================
prompt
create table TIMSRPTDATA.BATCH_USER_ACCOUNT
(
  district_id     VARCHAR2(50) not null,
  email_address   VARCHAR2(75) not null,
  user_first_name VARCHAR2(50) not null,
  user_last_name  VARCHAR2(50) not null,
  employee_id     VARCHAR2(50) default '',
  process_flag    VARCHAR2(1) default 'N',
  process_date    DATE default '',
  error_msg       VARCHAR2(50)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BATCH_USER_CAMPUS
prompt ================================
prompt
create table TIMSRPTDATA.BATCH_USER_CAMPUS
(
  district_id   VARCHAR2(50) not null,
  email_address VARCHAR2(75) not null,
  campus_id     VARCHAR2(50) default '999' not null,
  campus_sid    NUMBER default -1,
  error_msg     VARCHAR2(50),
  process_flag  VARCHAR2(1) default 'N'
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BATCH_USER_LOAD_LOG
prompt ==================================
prompt
create table TIMSRPTDATA.BATCH_USER_LOAD_LOG
(
  district_id   VARCHAR2(50) not null,
  email_address VARCHAR2(75) not null,
  load_date     DATE default SYSDATE,
  load_code     VARCHAR2(20),
  load_details  BLOB,
  fld1          VARCHAR2(50),
  fld2          VARCHAR2(50),
  fld3          VARCHAR2(50),
  fld4          VARCHAR2(50),
  fld5          VARCHAR2(50),
  fld6          VARCHAR2(50),
  fld7          VARCHAR2(50),
  fld8          VARCHAR2(50),
  fld9          VARCHAR2(50)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BATCH_USER_ROLE
prompt ==============================
prompt
create table TIMSRPTDATA.BATCH_USER_ROLE
(
  district_id          VARCHAR2(50) not null,
  email_address        VARCHAR2(75) not null,
  application_name     VARCHAR2(50) not null,
  role_name            VARCHAR2(50) not null,
  application_role_sid NUMBER default -1,
  error_msg            VARCHAR2(50),
  process_flag         VARCHAR2(1) default 'N'
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RISK_FACTOR
prompt ==========================
prompt
create table TIMSRPTDATA.RISK_FACTOR
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.RISK_FACTOR.risk_factor_type
  is 'Indicates that the Factor is either a primary or secondary.
Values: Primary,
Secondary';
comment on column TIMSRPTDATA.RISK_FACTOR.mandatory_flag
  is 'Indicates if the campus is required to select this risk factor or if it is optional.
Values: Yes/No';
comment on column TIMSRPTDATA.RISK_FACTOR.risk_factor_order
  is 'Defines the sort order for the presentation of the risk factors.';
alter table TIMSRPTDATA.RISK_FACTOR
  add constraint PK_RISK_FACTOR primary key (RISK_FACTOR_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table CAMPUS_FACTOR_SELECTION
prompt ======================================
prompt
create table TIMSRPTDATA.CAMPUS_FACTOR_SELECTION
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create bitmap index TIMSRPTDATA.BMI_CAMPUS_FACT_SEL_RISK_SIDFK on TIMSRPTDATA.CAMPUS_FACTOR_SELECTION (RISK_FACTOR_SID)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_FACTOR_SELECTION
  add constraint PK_CAMPUS_FACTOR_SELECTION primary key (CAMPUS_SID, RISK_FACTOR_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_CAMPUS_D foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_RISK_FAC foreign key (RISK_FACTOR_SID)
  references TIMSRPTDATA.RISK_FACTOR (RISK_FACTOR_SID);

prompt
prompt Creating table CAMPUS_MASTER
prompt ============================
prompt
create table TIMSRPTDATA.CAMPUS_MASTER
(
  campus_master_sid       NUMBER not null,
  district_sid            NUMBER not null,
  school_id               VARCHAR2(3) not null,
  campus_id               VARCHAR2(15) not null,
  campus_name             VARCHAR2(65),
  campus_status           VARCHAR2(20),
  region_name             VARCHAR2(20),
  campus_address          VARCHAR2(255),
  campus_city             VARCHAR2(50),
  campus_postal_code      VARCHAR2(10),
  campus_state_code       VARCHAR2(2) not null,
  campus_phone            VARCHAR2(30),
  campus_fax              VARCHAR2(20),
  campus_email            VARCHAR2(75),
  campus_website          VARCHAR2(100),
  campus_grade_range      VARCHAR2(10),
  periods_per_day         NUMBER,
  attendance_threshold    NUMBER,
  passing_grade_threshold NUMBER,
  default_grading_cycle   VARCHAR2(15),
  campus_key              VARCHAR2(40) not null,
  last_update             TIMESTAMP(6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_master_sid
  is 'Surrogate Key for the Campus Master';
comment on column TIMSRPTDATA.CAMPUS_MASTER.school_id
  is 'The three digit identifier for the school.
Example: 102';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_id
  is 'The nine digit identifier for the campus consisting of the district id and school id.
Example: 057901102';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_name
  is 'The full name of the campus.
Example: SCHOOL FOR THE TALENTED AND GIFTED';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_status
  is 'Identifies the current status of the school.
Example: ACTIVE,
              UNDER CONSTRUCTION,
              ';
comment on column TIMSRPTDATA.CAMPUS_MASTER.region_name
  is 'The name of the regional service service center for this campus.
Example: Region 10,
                10';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_state_code
  is 'The state abbreviation for the state that is campus resides in.';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_grade_range
  is 'Defines the grade levels taught at this campus.
Example:  06-08,
                EE-05
';
comment on column TIMSRPTDATA.CAMPUS_MASTER.periods_per_day
  is 'The number of scheduled periods per day at this campus.
Example: 7
8
4 (for A/B block schedule)';
comment on column TIMSRPTDATA.CAMPUS_MASTER.attendance_threshold
  is 'The percentage threshold by which students will be flagged for the attendance risk factor.
Example: .10 - 10%
               .08 - 8%';
comment on column TIMSRPTDATA.CAMPUS_MASTER.passing_grade_threshold
  is 'Defines the lowest pasing number grade at this campus.
Example: 70 (default),
                60,
                80';
comment on column TIMSRPTDATA.CAMPUS_MASTER.default_grading_cycle
  is 'Defines the grading cycle to be used by the core/non-core risk factor for this campus.
Values: 6-Weeks,
             9-Weeks';
comment on column TIMSRPTDATA.CAMPUS_MASTER.campus_key
  is 'Uniquely identifies a campus. A concatenation of the state code, district id, and campus id.
Example: TX*043901*043901001';
comment on column TIMSRPTDATA.CAMPUS_MASTER.last_update
  is 'Date the row was created or last updated.';
alter table TIMSRPTDATA.CAMPUS_MASTER
  add constraint PK_CAMPUS_MASTER primary key (CAMPUS_MASTER_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter index TIMSRPTDATA.PK_CAMPUS_MASTER nologging;
alter table TIMSRPTDATA.CAMPUS_MASTER
  add constraint AK_CAMPUS_MASTER_AK_CAMPUS_M unique (CAMPUS_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter index TIMSRPTDATA.AK_CAMPUS_MASTER_AK_CAMPUS_M nologging;
alter table TIMSRPTDATA.CAMPUS_MASTER
  add constraint FK_CAMPUS_M_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table CAMPUS_RISK_FACTOR_DIM
prompt =====================================
prompt
create table TIMSRPTDATA.CAMPUS_RISK_FACTOR_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.CAMPUS_RISK_FACTOR_DIM
  add constraint PK_CAMPUS_RISK_FACTOR_DIM primary key (CAMPUS_RISK_FACTOR_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CAMPUS_RISK_FACTOR_DIM
  add constraint AK_CAMPUS_RISK_FACTOR_BUS_KEY unique (DISTRICT_ID, CAMPUS_ID, RISK_FACTOR_NAME)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table CLASS_PERIOD_DIM
prompt ===============================
prompt
create table TIMSRPTDATA.CLASS_PERIOD_DIM
(
  class_period_sid     NUMBER not null,
  campus_sid           NUMBER not null,
  class_period         VARCHAR2(15),
  class_period_key     VARCHAR2(35),
  last_update          TIMESTAMP(6),
  exclude_class_period VARCHAR2(3) default 'No' not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.CLASS_PERIOD_DIM
  is 'Identifies the division of the day assigned the a particular class of instruction.';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.class_period_sid
  is 'Surrogate Key for Class Period Dim.';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.campus_sid
  is 'The Campus Sid of the campus that owns the class periods.';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.class_period
  is 'The time slot that class of instruction meets.
Example: 01,
                02,
                10
                M01,
                M24,
                KG,
                PK';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.class_period_key
  is 'The business key for the district class periods.
Example: TX*057904*057905001*001
                TX*043901*043901003*M13';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.last_update
  is 'Date time that the row was inserted or updated.';
comment on column TIMSRPTDATA.CLASS_PERIOD_DIM.exclude_class_period
  is 'Indicates that the Class Period should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table TIMSRPTDATA.CLASS_PERIOD_DIM
  add constraint PK_CLASS_PERIOD_DIM primary key (CLASS_PERIOD_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CLASS_PERIOD_DIM
  add constraint AK_CLASS_PERIOD_DIM_BUS_KEY unique (CLASS_PERIOD_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.CLASS_PERIOD_DIM
  add constraint FK_CLASS_PE_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table COURSE_DIM
prompt =========================
prompt
create table TIMSRPTDATA.COURSE_DIM
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
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.COURSE_DIM
  is 'A state or locally define curriculum of instruction.';
comment on column TIMSRPTDATA.COURSE_DIM.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column TIMSRPTDATA.COURSE_DIM.campus_id
  is 'Identifes the campus that owns this particular course.
example: 888888002';
comment on column TIMSRPTDATA.COURSE_DIM.course_code
  is 'The local distrcit/campus identifier for course.';
comment on column TIMSRPTDATA.COURSE_DIM.course_description
  is 'The local name or description of course.';
comment on column TIMSRPTDATA.COURSE_DIM.school_year
  is 'The applicable school year for this course.
Example: 2010';
comment on column TIMSRPTDATA.COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column TIMSRPTDATA.COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column TIMSRPTDATA.COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column TIMSRPTDATA.COURSE_DIM.course_key
  is 'The business key for the course consisting of State Abbrev||"*"||Campus ID||"*"||School Year(YYYY)||''*''||Local Course Code
Example: TX*043901002*2010*439204';
alter table TIMSRPTDATA.COURSE_DIM
  add constraint PK_COURSE_DIM primary key (COURSE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.COURSE_DIM
  add constraint COURSE_DIM_AK unique (COURSE_KEY)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.COURSE_DIM
  add constraint FK_COURSE_D_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references TIMSRPTDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table COURSE_SECTION_DIM
prompt =================================
prompt
create table TIMSRPTDATA.COURSE_SECTION_DIM
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
    initial 576K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.COURSE_SECTION_DIM
  is 'Identifies a scheduled course.';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.course_section_sid
  is 'Surrogate key for the Course Section Dim.';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.campus_id
  is 'Identifies the Campus where this section of the course is taught.
Example: 19902002
';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.course_code
  is 'Identifies the Course being taught.
Example: 1001';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.course_description
  is 'Describes the Course being taught.
Example: ENGLISH 1  ';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.course_section_number
  is 'Identifies the Course Section being taught.
Example: 001';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.school_year
  is 'Describes the school year for the Course Section being taught.
Example: 2011';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.term
  is 'Identifes the period of time the Course Section is being taught during the school year.
Example: 1 (Semester or trimester)
                2 (Semester or trimester),
                3 (trimester),
                 Y (Full Year)';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.state_course_code
  is 'Identifies the associated State course for the Course Section being taught.
Example: 03220100';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.state_course_description
  is 'Describes the associated State course for the Course Section being taught.
Example: English I (1 Unit) (ENG 1)';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.core_course_flag
  is 'Identifies if the Course Section being taught is a Core Course.
Values: Yes/No';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.course_section_key
  is 'The Busines Key for the Course Section Dim consisting of the state code, campus id, school year,course code, section number, term.
Example: TX*199902002*2011*1001*001*Y';
comment on column TIMSRPTDATA.COURSE_SECTION_DIM.last_update
  is 'The Date/Time the row as last inserted or updated.';
alter table TIMSRPTDATA.COURSE_SECTION_DIM
  add constraint PK_COURSE_SECTION_DIM primary key (COURSE_SECTION_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.COURSE_SECTION_DIM
  add constraint AK_COURSE_SECTION_DIM_COURSE_S unique (COURSE_SECTION_KEY)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DISCIPLINE_DIM
prompt =============================
prompt
create table TIMSRPTDATA.DISCIPLINE_DIM
(
  discipline_sid          NUMBER not null,
  campus_sid              NUMBER not null,
  campus_id               VARCHAR2(20),
  discipline_code         VARCHAR2(10) not null,
  discipline_description  VARCHAR2(500),
  discipline_key          VARCHAR2(20) not null,
  exclude_discipline_flag VARCHAR2(3) default 'YES'
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.DISCIPLINE_DIM
  is 'Describes the various types of descipline that may be applied to a student.';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.discipline_sid
  is 'Uniquely identifies the Discipline DIM';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.campus_id
  is 'Copied formthe campus_dim';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.discipline_code
  is 'The local code that identifies a type of discipline.
Example: WL
               VW';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.discipline_description
  is 'Description of the discipline.
Example: Place In Daep By Court,
                Cont. of District''s Expul. Order from Prior Yr';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.discipline_key
  is 'Business key for the Discipline Dim. By Campus.
Example TX*894758001*11';
comment on column TIMSRPTDATA.DISCIPLINE_DIM.exclude_discipline_flag
  is 'Indicates if the discipline should be exclude from process by the RCE.
values: YES/NO Defalut=YES';
alter table TIMSRPTDATA.DISCIPLINE_DIM
  add constraint PK_DISCIPLINE_DIM primary key (DISCIPLINE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.DISCIPLINE_DIM
  add constraint AK_AK_DISCIPLINE_DIM_DISCIPLI unique (DISCIPLINE_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table DWS_GLOBAL_DEFAULT
prompt =================================
prompt
create table TIMSRPTDATA.DWS_GLOBAL_DEFAULT
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.DWS_GLOBAL_DEFAULT
  is 'Contains default vaules that are applied at various times during system operation.';
comment on column TIMSRPTDATA.DWS_GLOBAL_DEFAULT.campus_periods_per_day
  is 'Defines the default number of periods per day to be applied to new campuses.
Default Value = 7';
comment on column TIMSRPTDATA.DWS_GLOBAL_DEFAULT.campus_attendance_threshold
  is 'Defines the default attendance threshold to be applied to new campuses.
Default Value = .10 (10%)';
comment on column TIMSRPTDATA.DWS_GLOBAL_DEFAULT.campus_passing_grade_threshold
  is 'Defines the default passing grade for students at a campus to be applied to new campuses.
Default Value: 70';
comment on column TIMSRPTDATA.DWS_GLOBAL_DEFAULT.campus_default_grading_cycle
  is 'Defines the default grading cycle at a campus to be applied to new campuses.
Default Value: 6-Weeks';

prompt
prompt Creating table DWS_INTERVENTION_CATEGORY
prompt ========================================
prompt
create table TIMSRPTDATA.DWS_INTERVENTION_CATEGORY
(
  intervention_category_sid  NUMBER not null,
  intervention_category      VARCHAR2(50) not null,
  intervention_category_desc VARCHAR2(200),
  active_flag                VARCHAR2(1)
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_INTERVENTION_CATEGORY.intervention_category_sid
  is 'Surrogate key for the intervention category';
comment on column TIMSRPTDATA.DWS_INTERVENTION_CATEGORY.intervention_category
  is 'Describes a grouping of interventions.
Examples: Tutoring,
                Mentoring,
               Counseling';
comment on column TIMSRPTDATA.DWS_INTERVENTION_CATEGORY.intervention_category_desc
  is 'Describes the intervention category.';
comment on column TIMSRPTDATA.DWS_INTERVENTION_CATEGORY.active_flag
  is 'Indicates if the catefory is actively in use or not.
Values: Y/N';
alter table TIMSRPTDATA.DWS_INTERVENTION_CATEGORY
  add constraint PK_DWS_INTERVENTION_CATEGORY primary key (INTERVENTION_CATEGORY_SID)
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
alter table TIMSRPTDATA.DWS_INTERVENTION_CATEGORY
  add constraint AK_DWS_INTERVENTION_C_DWS_INTE unique (INTERVENTION_CATEGORY)
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
prompt Creating table DWS_INTERVENTION
prompt ===============================
prompt
create table TIMSRPTDATA.DWS_INTERVENTION
(
  intervention_sid          NUMBER not null,
  intervention_category_sid NUMBER not null,
  create_by_user_sid        NUMBER not null,
  last_update_user_sid      NUMBER not null,
  intervention_name         VARCHAR2(100) not null,
  intervention_description  VARCHAR2(2000),
  intervention_comment      VARCHAR2(2000),
  active_flag               VARCHAR2(1) not null,
  create_date               DATE,
  last_update               DATE
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_INTERVENTION.intervention_sid
  is 'Surrogate Key for the Intervention';
comment on column TIMSRPTDATA.DWS_INTERVENTION.create_by_user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.DWS_INTERVENTION.last_update_user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.DWS_INTERVENTION.intervention_name
  is 'The specific name of the intervention.
example : Math Tutoring,
                Parent Conference,
                Attendance Monitoring';
comment on column TIMSRPTDATA.DWS_INTERVENTION.intervention_description
  is 'Describes the intervention.';
comment on column TIMSRPTDATA.DWS_INTERVENTION.intervention_comment
  is 'User comments about the intervention';
comment on column TIMSRPTDATA.DWS_INTERVENTION.active_flag
  is 'Indicates if the Intervention is in use or not.
Values: Y/N';
comment on column TIMSRPTDATA.DWS_INTERVENTION.create_date
  is 'The date and time the Intervention was created.';
comment on column TIMSRPTDATA.DWS_INTERVENTION.last_update
  is 'The date and time the Intervention was last updated.';
alter table TIMSRPTDATA.DWS_INTERVENTION
  add constraint PK_DWS_INTERVENTION primary key (INTERVENTION_SID)
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
alter table TIMSRPTDATA.DWS_INTERVENTION
  add constraint AK_DWS_INTERVENTION_A_DWS_INTE unique (INTERVENTION_NAME)
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
alter table TIMSRPTDATA.DWS_INTERVENTION
  add constraint FK_DWS_INTE_CAT_REF_DWS_INTE foreign key (INTERVENTION_CATEGORY_SID)
  references TIMSRPTDATA.DWS_INTERVENTION_CATEGORY (INTERVENTION_CATEGORY_SID);
alter table TIMSRPTDATA.DWS_INTERVENTION
  add constraint FK_INT_REF_USER_ACCT_CREATE foreign key (CREATE_BY_USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID)
  disable
  novalidate;
alter table TIMSRPTDATA.DWS_INTERVENTION
  add constraint FK_INT_REF_USER_ACCT_LAST_UPD foreign key (LAST_UPDATE_USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID)
  disable
  novalidate;

prompt
prompt Creating table DWS_INTERVENTION_NOTE_TYPE
prompt =========================================
prompt
create table TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE
(
  intervention_note_type_sid  NUMBER not null,
  intervention_note_type_name VARCHAR2(50) not null,
  intervention_note_type_desc VARCHAR2(200)
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_sid
  is 'Surrogate key for the intervention note type';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_name
  is 'The name of the type of note.
example: Status/Update
               Parent Conference
               Student Conference
                Other';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_desc
  is 'describes the type of note.';
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE
  add constraint PK_DWS_INTERVENTION_NOTE_TYPE primary key (INTERVENTION_NOTE_TYPE_SID)
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
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE
  add constraint DWS_INTERVENTION_NOTE_TYPE_AK unique (INTERVENTION_NOTE_TYPE_NAME)
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
prompt Creating table DWS_STU_INTERVENTION_STATUS
prompt ==========================================
prompt
create table TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS
(
  intervention_status_sid  NUMBER not null,
  intervention_status      VARCHAR2(30) not null,
  intervention_status_desc VARCHAR2(200)
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS.intervention_status_sid
  is 'Surrogate Key for the Student Intervention Status';
comment on column TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS.intervention_status
  is 'Indicates the state of the intervention.
Example: Open,
                Hold,
                Closed';
comment on column TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS.intervention_status_desc
  is 'describes the intervention status.
example: The "Hold" status indicates that the student is temporarily not 
participating in the intervention.';
alter table TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS
  add constraint PK_DWS_STU_INTERVENTION_STATUS primary key (INTERVENTION_STATUS_SID)
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
alter table TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS
  add constraint AK_DWS_STU_INTERVENTI_DWS_STU_ unique (INTERVENTION_STATUS)
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
prompt Creating table DWS_STUDENT_INTERVENTION
prompt =======================================
prompt
create table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
(
  student_intervention_sid    NUMBER not null,
  student_sid                 NUMBER not null,
  intervention_status_sid     NUMBER not null,
  intervention_sid            NUMBER not null,
  created_by_user_sid         NUMBER not null,
  last_update_user_sid        NUMBER not null,
  intervention_begin_date     DATE not null,
  intervention_end_date       DATE,
  intervention_goal           VARCHAR2(200),
  intervention_plan           VARCHAR2(2000),
  intervention_result_comment VARCHAR2(2000),
  intervention_result_rank    NUMBER(1),
  create_date                 DATE not null,
  last_update                 DATE not null
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.student_intervention_sid
  is 'Surrogate key for the student Intervention';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.created_by_user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.last_update_user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_begin_date
  is 'The date on which the student begins the intervention';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_end_date
  is 'The date on which the intervention for the student end or ended.';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_goal
  is 'The end result sought for the student by placing them in the intervention.
example: Johnny will achieve a math grade of 70 or better by the end
of the semester.';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_plan
  is 'The plan to achieve the intervention goal for this student.
example: Johnny will attend after school math tutoring with Mr. patterson.';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_result_comment
  is 'A user enter description of the outcome of the student intervention.
Example: Johnny responeded to tutoring and achieved a math grade of 77.';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.intervention_result_rank
  is 'Ranks the result of the intervention on a scale of 1 to 5.
1 being unsuccessful and 5 being completely successful.
Values: 1 - 5';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.create_date
  is 'Date and time the Intervention was created';
comment on column TIMSRPTDATA.DWS_STUDENT_INTERVENTION.last_update
  is 'Date and time the Intervention was last updated';
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint PK_DWS_STUDENT_INTERVENTION primary key (STUDENT_INTERVENTION_SID)
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
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint AK_DWS_STUDENT_INTERV_DWS_STUD unique (STUDENT_SID, INTERVENTION_SID, INTERVENTION_BEGIN_DATE)
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
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STUD_INV_REF_STU_DIM foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STUD_REF_DWS_INTE foreign key (INTERVENTION_SID)
  references TIMSRPTDATA.DWS_INTERVENTION (INTERVENTION_SID);
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STU_INV_REF_DWS_INV_STS foreign key (INTERVENTION_STATUS_SID)
  references TIMSRPTDATA.DWS_STU_INTERVENTION_STATUS (INTERVENTION_STATUS_SID);
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STU_INV_REF_USER_ACC foreign key (CREATED_BY_USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);
alter table TIMSRPTDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_STU_INT_REF_USER_ACCT_UPD foreign key (LAST_UPDATE_USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table DWS_INTERVENTION_NOTE
prompt ====================================
prompt
create table TIMSRPTDATA.DWS_INTERVENTION_NOTE
(
  intervention_note_sid      NUMBER not null,
  student_intervention_sid   NUMBER not null,
  intervention_note_type_sid NUMBER not null,
  user_sid                   NUMBER not null,
  intervention_note_dt       DATE not null,
  intervention_note_text     VARCHAR2(2000) not null,
  last_update                DATE not null
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE.intervention_note_sid
  is 'Surrogate Key for the intervention Note';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE.intervention_note_dt
  is 'The date and time that the note was created';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE.intervention_note_text
  is 'The user enter text describing some event related to the intervention.';
comment on column TIMSRPTDATA.DWS_INTERVENTION_NOTE.last_update
  is 'The date and time the note was last updated.  Will initially be the same as the creation date.';
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE
  add constraint PK_DWS_INTERVENTION_NOTE primary key (INTERVENTION_NOTE_SID)
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
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE
  add constraint DWS_INTERVENTION_NOTE_AK unique (STUDENT_INTERVENTION_SID, INTERVENTION_NOTE_DT)
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
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_NOTE_REF_DWS_INTE foreign key (INTERVENTION_NOTE_TYPE_SID)
  references TIMSRPTDATA.DWS_INTERVENTION_NOTE_TYPE (INTERVENTION_NOTE_TYPE_SID);
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_NOTE_REF_USER_ACCT foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID)
  disable
  novalidate;
alter table TIMSRPTDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_REF_DWS_STUD_INTV foreign key (STUDENT_INTERVENTION_SID)
  references TIMSRPTDATA.DWS_STUDENT_INTERVENTION (STUDENT_INTERVENTION_SID);

prompt
prompt Creating table DWS_STUDENT_NOTE
prompt ===============================
prompt
create table TIMSRPTDATA.DWS_STUDENT_NOTE
(
  note_id         NUMBER not null,
  student_sid     NUMBER not null,
  note_author_sid NUMBER not null,
  note_dttm       DATE not null,
  note_text       VARCHAR2(2000)
)
tablespace DW_DEFAULT01
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
comment on column TIMSRPTDATA.DWS_STUDENT_NOTE.note_author_sid
  is 'User Surrogate Key';
alter table TIMSRPTDATA.DWS_STUDENT_NOTE
  add constraint PK_DWS_STUDENT_NOTE primary key (NOTE_ID)
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
alter table TIMSRPTDATA.DWS_STUDENT_NOTE
  add constraint AK_DWS_STUDENT_NOTE_A_DWS_STUD unique (STUDENT_SID, NOTE_DTTM)
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
alter table TIMSRPTDATA.DWS_STUDENT_NOTE
  add constraint DWS_STUDENT_NOTE_FK1 foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.DWS_STUDENT_NOTE
  add constraint DWS_STUDENT_NOTE_FK3 foreign key (NOTE_AUTHOR_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table EMAIL_TYPE
prompt =========================
prompt
create table TIMSRPTDATA.EMAIL_TYPE
(
  email_type_sid NUMBER not null,
  email_type     VARCHAR2(25)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.EMAIL_TYPE.email_type_sid
  is 'Surrogate Key for the Email Type';
comment on column TIMSRPTDATA.EMAIL_TYPE.email_type
  is 'Indicates the kind of email.
Example: New User,
                Password Reset,
                Welcome to Reveal,
                System Maintenance';
alter table TIMSRPTDATA.EMAIL_TYPE
  add constraint PK_EMAIL_TYPE primary key (EMAIL_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table EMAIL_SPECIFICATION
prompt ==================================
prompt
create table TIMSRPTDATA.EMAIL_SPECIFICATION
(
  email_sid        NUMBER not null,
  email_type_sid   NUMBER not null,
  email_subject    VARCHAR2(75),
  email_body       VARCHAR2(2000),
  application_link VARCHAR2(200),
  salutation       VARCHAR2(1000)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.email_sid
  is 'Surrogate Key for the Email Specification.';
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.email_type_sid
  is 'Surrogate Key for the Email Type';
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.email_subject
  is 'Email Subject Line.
Example: Password Reset Request ';
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.email_body
  is 'The Main Body of the Email.
Eample:
Logon within 72 hours otherwise your account will need to unlocked by the District Administrator.
Use the link below to reset your account.
';
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.application_link
  is 'The HTML link to the appliction login.';
comment on column TIMSRPTDATA.EMAIL_SPECIFICATION.salutation
  is 'The closing of the email.
Example:
Sincerely,
The SchoolViz Support Team';
alter table TIMSRPTDATA.EMAIL_SPECIFICATION
  add constraint PK_EMAIL_SPECIFICATION primary key (EMAIL_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.EMAIL_SPECIFICATION
  add constraint AK_EMAIL_SPEC_AK_EMAIL_SP unique (EMAIL_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.EMAIL_SPECIFICATION
  add constraint FK_EMAIL_SP_REFERENCE_EMAIL_TY foreign key (EMAIL_TYPE_SID)
  references TIMSRPTDATA.EMAIL_TYPE (EMAIL_TYPE_SID);

prompt
prompt Creating table ETL_EVENT_LOG
prompt ============================
prompt
create table TIMSRPTDATA.ETL_EVENT_LOG
(
  job_name            VARCHAR2(100) not null,
  event_time          TIMESTAMP(6) default SYSDATE not null,
  event_type          VARCHAR2(50),
  source_name         VARCHAR2(50),
  status              VARCHAR2(50),
  error_code          VARCHAR2(50),
  error_message       VARCHAR2(200),
  user_id             VARCHAR2(50),
  terminal_id         VARCHAR2(50),
  rows_affected_count NUMBER(10),
  comments            VARCHAR2(200),
  start_time          TIMESTAMP(6),
  end_time            TIMESTAMP(6),
  elapsed_time        NUMBER(10,6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column TIMSRPTDATA.ETL_EVENT_LOG.event_time
  is 'Defaults to SYSDATE';
comment on column TIMSRPTDATA.ETL_EVENT_LOG.event_type
  is 'Values: Warning, Informational, Error';
comment on column TIMSRPTDATA.ETL_EVENT_LOG.source_name
  is 'Values: Cognos, PL/SQL, Perl, SQL*Loader, Other';
comment on column TIMSRPTDATA.ETL_EVENT_LOG.status
  is 'Values: Started, Running, Failed, Succeeded';
comment on column TIMSRPTDATA.ETL_EVENT_LOG.elapsed_time
  is 'In seconds';
create index TIMSRPTDATA.BMI_EVENT_LOG_EVENT_TYPE on TIMSRPTDATA.ETL_EVENT_LOG (EVENT_TYPE)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.BMI_EVENT_LOG_STATUS on TIMSRPTDATA.ETL_EVENT_LOG (STATUS)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.ETL_EVENT_LOG
  add primary key (JOB_NAME, EVENT_TIME)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table ETL_GRADINGPERIOD_TO_GRADETYPE
prompt =============================================
prompt
create table TIMSRPTDATA.ETL_GRADINGPERIOD_TO_GRADETYPE
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.ETL_GRADINGPERIOD_TO_GRADETYPE
  is 'Converts CDM grading period to CORE Grade_Type as well as identifing the associated period number.';
comment on column TIMSRPTDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.cdm_grading_period
  is 'The GradingPeriod from the TSDS CDM model.
Example: First Six Weeks,
                Second Nine Weeks,
                Second Semester';
comment on column TIMSRPTDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.period_number
  is 'Grading Period for specific Grade Type';
comment on column TIMSRPTDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.cycle_type
  is 'Values(Six, Nine, Sem).  Used to Access Date_DIM in common loader.';

prompt
prompt Creating table EXECUTION_LOG
prompt ============================
prompt
create table TIMSRPTDATA.EXECUTION_LOG
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.EXECUTION_LOG
  is 'Tracks information about each run of the risk factor calculation engine or the load process.';
comment on column TIMSRPTDATA.EXECUTION_LOG.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column TIMSRPTDATA.EXECUTION_LOG.process_name
  is 'Name of the process being run
Example: Attendance
               CoreCourseFailure
               ';
comment on column TIMSRPTDATA.EXECUTION_LOG.process_type
  is 'Type of process being run
Example: RCE
               District Load
               Campus Load';
comment on column TIMSRPTDATA.EXECUTION_LOG.execution_end_time
  is 'The datetime that the engine stopped processing this risk factor';
comment on column TIMSRPTDATA.EXECUTION_LOG.execution_result
  is 'The outcome of the execution.
Values: Successful
             Failed';
alter table TIMSRPTDATA.EXECUTION_LOG
  add constraint PK_EXECUTION_LOG primary key (EXECUTION_START_TIME, CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table EXECUTION_PARAMETER
prompt ==================================
prompt
create table TIMSRPTDATA.EXECUTION_PARAMETER
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.EXECUTION_PARAMETER
  is 'Contains the parameters used in the execution of a system process.';
comment on column TIMSRPTDATA.EXECUTION_PARAMETER.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column TIMSRPTDATA.EXECUTION_PARAMETER.parameter_name
  is 'The name of the parameter used in the risk factor calculation.
Example: Periods Per Day
                Attendance Threshold';
comment on column TIMSRPTDATA.EXECUTION_PARAMETER.parameter_value
  is 'The Value of the first parameter used in the risk factor calculation.
Example: 7';
alter table TIMSRPTDATA.EXECUTION_PARAMETER
  add constraint PK_EXECUTION_PARAMETER primary key (EXECUTION_START_TIME, CAMPUS_SID, PARAMETER_NAME)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.EXECUTION_PARAMETER
  add constraint FK_EXECUTIO_REFERENCE_EXECUTIO foreign key (EXECUTION_START_TIME, CAMPUS_SID)
  references TIMSRPTDATA.EXECUTION_LOG (EXECUTION_START_TIME, CAMPUS_SID);

prompt
prompt Creating table GRADE_LEVEL_DIM
prompt ==============================
prompt
create table TIMSRPTDATA.GRADE_LEVEL_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.GRADE_LEVEL_DIM
  is 'Identifies the student grade level.
Example: 01
                PK
                KG
                12';
comment on column TIMSRPTDATA.GRADE_LEVEL_DIM.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column TIMSRPTDATA.GRADE_LEVEL_DIM.grade_level
  is 'Identifies a students assigned grade.
Example: 01
                02
                12';
comment on column TIMSRPTDATA.GRADE_LEVEL_DIM.grade_level_description
  is 'Describes a grade level.
Example: First Grade
               Second Grade
               Twelth Grade';
comment on column TIMSRPTDATA.GRADE_LEVEL_DIM.grade_level_order
  is 'Indicates the order of the grade levels for sorting.
Example: 1
                2
                3
';
alter table TIMSRPTDATA.GRADE_LEVEL_DIM
  add constraint PK_GRADE_LEVEL_DIM primary key (GRADE_LEVEL_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table GRADE_TYPE_DIM
prompt =============================
prompt
create table TIMSRPTDATA.GRADE_TYPE_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.GRADE_TYPE_DIM
  is 'Identifies the period in time the grade occured.
Example: Progess Report
               Marking Period
               6 Weeks
               Semester
               Exam
';
comment on column TIMSRPTDATA.GRADE_TYPE_DIM.grade_type_sid
  is 'Surrogate Key for the Grade Type dim';
comment on column TIMSRPTDATA.GRADE_TYPE_DIM.grade_type
  is 'Describes what type of grade.
Example: Six Weeks,
                Semester,
                Progress Report,
                Exam,
                Final';
comment on column TIMSRPTDATA.GRADE_TYPE_DIM.grade_type_description
  is 'The Full Description of the grade type.
Example: The six weeks grade revceived by the student';
comment on column TIMSRPTDATA.GRADE_TYPE_DIM.last_update
  is 'The data time this row was last insert/updated';
alter table TIMSRPTDATA.GRADE_TYPE_DIM
  add constraint PK_GRADE_TYPE_DIM primary key (GRADE_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table INCIDENT_BEHAVIOR_DIM
prompt ====================================
prompt
create table TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM
(
  incident_behavior_sid         NUMBER not null,
  campus_sid                    NUMBER not null,
  campus_id                     VARCHAR2(20) not null,
  incident_behavior_code        VARCHAR2(10) not null,
  incident_behavior_description VARCHAR2(500) not null,
  incident_behavior_category    VARCHAR2(50) not null,
  incident_behavior_key         VARCHAR2(30) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM
  is 'Identifies the student behaviors associated with a discipline event.';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_sid
  is 'Uniquely identifies an incident behavior.';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.campus_id
  is 'Campus Id copied from the campus dim.';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_code
  is 'Local code that identifies a student behavior associated with an incident.';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_description
  is 'Describes a students behavior
Example: Permanent Removal By A Teacher From Class,
               Alcoholic Beverage,
               Bullying';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_category
  is 'Grouping of behaviors
Examples: School Code of Conduct,
                  State Offense';
comment on column TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_key
  is 'Business key for the incident behavior. Consisting of the state code, campus id
and behavior code.
Example: TX*849304001*37';
alter table TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM
  add constraint PK_INCIDENT_BEHAVIOR_DIM primary key (INCIDENT_BEHAVIOR_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM
  add constraint AK_AK_INCIDENT_BEHAVI_INCIDENT unique (INCIDENT_BEHAVIOR_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table INCIDENT_LOCATION_DIM
prompt ====================================
prompt
create table TIMSRPTDATA.INCIDENT_LOCATION_DIM
(
  incident_location_sid NUMBER not null,
  incident_location     VARCHAR2(50) not null,
  incident_location_key VARCHAR2(60) not null,
  district_sid          NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.INCIDENT_LOCATION_DIM
  is 'The location where a discipline incident took place';
comment on column TIMSRPTDATA.INCIDENT_LOCATION_DIM.incident_location_sid
  is 'Uniquely identifies the Incident Location';
comment on column TIMSRPTDATA.INCIDENT_LOCATION_DIM.incident_location
  is 'Identifies the place where an incident took place.
Example: Classroom,
                Cafeteria area,
                Unknown';
comment on column TIMSRPTDATA.INCIDENT_LOCATION_DIM.incident_location_key
  is 'Business key for the incident location.
Example: TX*108909*Classroom';
alter table TIMSRPTDATA.INCIDENT_LOCATION_DIM
  add constraint PK_INCIDENT_LOCATION_DIM primary key (INCIDENT_LOCATION_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.INCIDENT_LOCATION_DIM
  add constraint AK_AK_INCIDENT_LOCATI_INCIDENT unique (INCIDENT_LOCATION_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table MERGED_STUDENT_RISK_FACTOR
prompt =========================================
prompt
create table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
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
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  is 'Combines Student_Risk_Factor_Facts for a student which might span multiple campuses into a single view of the students risk.';
comment on column TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR.risk_factor_count
  is 'Measure used by report tools to count number of studnets with risk factors.
Value 1';
alter table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint PK_MERGED_STUDENT_RISK_FACTOR primary key (STUDENT_SID, RISK_FACTOR_SID, FLAG_DATE_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_RISK_FAC foreign key (RISK_FACTOR_SID)
  references TIMSRPTDATA.RISK_FACTOR (RISK_FACTOR_SID);
alter table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_END_DATE_DIM foreign key (END_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table NINTH_GRD_COHORT
prompt ===============================
prompt
create table TIMSRPTDATA.NINTH_GRD_COHORT
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORG_DIM
prompt ======================
prompt
create table TIMSRPTDATA.ORG_DIM
(
  org_sid        NUMBER not null,
  org_cdn        CHAR(6),
  org_type       CHAR(3),
  county_name    VARCHAR2(255),
  region_num     CHAR(2),
  org_name       VARCHAR2(255),
  lea_type       VARCHAR2(255),
  city           VARCHAR2(255),
  org_domain     VARCHAR2(255),
  org_zip        VARCHAR2(255),
  org_url        VARCHAR2(255),
  lea_enrollment NUMBER,
  load_dttm      DATE
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.ORG_DIM_IDX1 on TIMSRPTDATA.ORG_DIM (ORG_NAME)
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
create index TIMSRPTDATA.ORG_DIM_IDX2 on TIMSRPTDATA.ORG_DIM (REGION_NUM)
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
create index TIMSRPTDATA.ORG_DIM_IDX3 on TIMSRPTDATA.ORG_DIM (ORG_TYPE)
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
create unique index TIMSRPTDATA.ORG_DIM_IDX4 on TIMSRPTDATA.ORG_DIM (ORG_CDN)
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
alter table TIMSRPTDATA.ORG_DIM
  add constraint ORG_DIM_PK primary key (ORG_SID)
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
create table TIMSRPTDATA.RACE_ETHNICITY_DIM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.RACE_ETHNICITY_DIM
  is 'Idenitfies the ethnicity and race selections of a person.';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.race_ethnicity_sid
  is 'Surrogate key';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.yes_no_key
  is 'A look up key based on Y and N flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.binary_key
  is 'A look up key based on 1 and 0 flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.race_ethnicity_key
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
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.ethnicity
  is 'Indicates that the individual selected Hispanic/Latino(Yes) or Not Hispanic/Latino(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.ethnicity_description
  is 'Values:
Hispanic/Latino
Not Hispanic/Latino';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.american_indian_alaska_native
  is 'Indicates that the individual selected American Indian/Alaska Native(Yes) or Not American Indian/Alaska Native(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.amer_indian_alaskan_desc
  is 'Values:
American Indian or Alaska Native
Not American Indian or Alaska Native';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.asian
  is 'Indicates that the individual selected Asian(Yes) or Not Asian(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.asian_description
  is 'Values:
Asian
Not Asian';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.black_or_african_american
  is 'Indicates that the individual selected Black or African American(Yes) or Not Black or African American(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.black_african_amer_desc
  is 'Values:
Black or African American
Not Black or African American';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.native_hawaiian_pacific_island
  is 'Indicates that the individual selected Native Hawaiian or Pacific Islander(Yes) or Not Native Hawaiian or Pacific Islander(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.hawaiian_pacific_island_desc
  is 'Values:
Native Hawaiian/Other Pacific Islander
Not Native Hawaiian/Other Pacific Islander';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.white
  is 'Indicates that the individual selected White(Yes) or Not White(No).
Values:
Yes
No';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.white_description
  is 'Values:
White
Not White';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.two_or_more_races
  is 'Indicates that two or more races were selected.
Example:
Asian, White';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.race_ethnicity_long_desc
  is 'The verbose description of the selected races.
Example:
Hispanic/Latino, American Indian or Alaska Native, Asian, Black or African American, Native Hawaiian/Other Pacific_Islander, White

Black or African American, White';
comment on column TIMSRPTDATA.RACE_ETHNICITY_DIM.race_ethnicity_short_desc
  is 'A short abbreviated description of the races selected.
Example:
Hispanic, Amer. Indian/Alaska Nat. , Asian, Black, Hawaiian/Pacific Is., White

Black, White';
alter table TIMSRPTDATA.RACE_ETHNICITY_DIM
  add constraint PK_RACE_ETHNICITY_DIM primary key (RACE_ETHNICITY_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.RACE_ETHNICITY_DIM
  add constraint AK_RACE_ETH_DIM_BUS_K_RACE_ETH unique (RACE_ETHNICITY_KEY)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table SOURCE
prompt =====================
prompt
create table TIMSRPTDATA.SOURCE
(
  source_sid         NUMBER not null,
  source_name        VARCHAR2(50) not null,
  source_description VARCHAR2(500),
  active_flag        VARCHAR2(1) not null,
  current_mode       VARCHAR2(8)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.SOURCE
  is 'The source of data for the reporting category.';
comment on column TIMSRPTDATA.SOURCE.source_sid
  is 'Uniquely identifies the source.';
comment on column TIMSRPTDATA.SOURCE.source_name
  is 'The name of the source of the data of the reporting category.
Example: TxEIS,
                TexasStudentDataSystem(TSDS),
                 Jira';
comment on column TIMSRPTDATA.SOURCE.source_description
  is 'Description of the Source.';
comment on column TIMSRPTDATA.SOURCE.active_flag
  is 'Indicates if the source is available for use.
Values: Y/N';
comment on column TIMSRPTDATA.SOURCE.current_mode
  is 'Whether the data source is set to REALTIME or DATAMART.';
alter table TIMSRPTDATA.SOURCE
  add constraint PK_SOURCE primary key (SOURCE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.SOURCE
  add constraint AK_AK_SOURCE_SOURCE unique (SOURCE_NAME)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table REPORT_CATEGORY
prompt ==============================
prompt
create table TIMSRPTDATA.REPORT_CATEGORY
(
  report_category_sid         NUMBER not null,
  source_sid                  NUMBER not null,
  report_category             VARCHAR2(50),
  report_category_description VARCHAR2(2000),
  active_flag                 VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.REPORT_CATEGORY
  is 'Defines the groupings of reports. Such as Student, Registration, Health, etc.';
comment on column TIMSRPTDATA.REPORT_CATEGORY.source_sid
  is 'Uniquely identifies the source.';
comment on column TIMSRPTDATA.REPORT_CATEGORY.report_category
  is 'Used to group reports together.
  Example: Student,
                  Finance';
comment on column TIMSRPTDATA.REPORT_CATEGORY.report_category_description
  is 'Describes the REPORT CATEGORY';
comment on column TIMSRPTDATA.REPORT_CATEGORY.active_flag
  is 'denotes if the category is in use.
Values: Y/N';
alter table TIMSRPTDATA.REPORT_CATEGORY
  add constraint PK_REPORT_CATEGORY primary key (REPORT_CATEGORY_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.REPORT_CATEGORY
  add constraint FK_REP_CAT_REF_SOURCE foreign key (SOURCE_SID)
  references TIMSRPTDATA.SOURCE (SOURCE_SID);

prompt
prompt Creating table REPORT_TYPE
prompt ==========================
prompt
create table TIMSRPTDATA.REPORT_TYPE
(
  report_type_sid         NUMBER not null,
  report_type_name        VARCHAR2(50),
  report_type_description VARCHAR2(1000)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.REPORT_TYPE
  is 'The kind of report';
alter table TIMSRPTDATA.REPORT_TYPE
  add constraint PK_REPORT_TYPE primary key (REPORT_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table REPORT_LIST
prompt ==========================
prompt
create table TIMSRPTDATA.REPORT_LIST
(
  report_list_sid     NUMBER not null,
  report_name         VARCHAR2(50) not null,
  report_description  VARCHAR2(2000),
  report_alias        VARCHAR2(50) not null,
  report_category_sid NUMBER not null,
  active_flag         VARCHAR2(1),
  report_type_sid     NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.REPORT_LIST.report_name
  is 'The name of the report to be displayed on the main page.';
comment on column TIMSRPTDATA.REPORT_LIST.report_description
  is 'Describes the REPORT';
comment on column TIMSRPTDATA.REPORT_LIST.report_alias
  is 'The APEX page alias for the report, used in the link to the page';
comment on column TIMSRPTDATA.REPORT_LIST.report_category_sid
  is 'Foriegn key to report_category table';
comment on column TIMSRPTDATA.REPORT_LIST.active_flag
  is 'Used to indicate if a flag is active for use or not.
  values: Y,
           N';
alter table TIMSRPTDATA.REPORT_LIST
  add constraint PK_REPORT_LIST primary key (REPORT_LIST_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.REPORT_LIST
  add constraint FK_REPORT_L_REFERENCE_REPORT_C foreign key (REPORT_CATEGORY_SID)
  references TIMSRPTDATA.REPORT_CATEGORY (REPORT_CATEGORY_SID)
  deferrable initially deferred;
alter table TIMSRPTDATA.REPORT_LIST
  add constraint FK_REPORT_L_REFERENCE_REPORT_T foreign key (REPORT_TYPE_SID)
  references TIMSRPTDATA.REPORT_TYPE (REPORT_TYPE_SID);

prompt
prompt Creating table REVEAL
prompt =====================
prompt
create table TIMSRPTDATA.REVEAL
(
  age  NUMBER,
  name VARCHAR2(40)
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_REVEAL on TIMSRPTDATA.REVEAL (AGE)
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
prompt Creating table REVEAL_PRODUCT
prompt =============================
prompt
create table TIMSRPTDATA.REVEAL_PRODUCT
(
  product_sid  NUMBER not null,
  product_desc VARCHAR2(35) not null
)
tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.REVEAL_PRODUCT
  add constraint PK_PRODUCT_SID primary key (PRODUCT_SID)
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
prompt Creating table REVEAL_RELEASE
prompt =============================
prompt
create table TIMSRPTDATA.REVEAL_RELEASE
(
  code_sid     NUMBER not null,
  code_version VARCHAR2(25) not null,
  product_sid  NUMBER not null,
  date_applied DATE not null
)
tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.REVEAL_RELEASE
  add constraint PK_CODE_SID primary key (CODE_SID)
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
alter table TIMSRPTDATA.REVEAL_RELEASE
  add constraint FK_PRODUCT_SID foreign key (PRODUCT_SID)
  references TIMSRPTDATA.REVEAL_PRODUCT (PRODUCT_SID);

prompt
prompt Creating table RF_DISPLAY_COLUMNS
prompt =================================
prompt
create table TIMSRPTDATA.RF_DISPLAY_COLUMNS
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.RF_DISPLAY_COLUMNS
  add constraint CAMPUS_SID_PK primary key (CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table SECURITY_QUESTION_TYPE
prompt =====================================
prompt
create table TIMSRPTDATA.SECURITY_QUESTION_TYPE
(
  security_question_type_sid  NUMBER not null,
  security_question_type_name VARCHAR2(20),
  security_question_type_desc VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.SECURITY_QUESTION_TYPE.security_question_type_sid
  is 'Surrogate Key for the Security Question Type';
comment on column TIMSRPTDATA.SECURITY_QUESTION_TYPE.security_question_type_name
  is 'Denotes the type of Security Question.
Values: Login,
            External IP Address,
            Password Reset';
comment on column TIMSRPTDATA.SECURITY_QUESTION_TYPE.security_question_type_desc
  is 'Describes the Security Question Type.
Example: The login question type will be answered by the user every time the user logs into the

system.';
alter table TIMSRPTDATA.SECURITY_QUESTION_TYPE
  add constraint PK_SECURITY_QUESTION_TYPE primary key (SECURITY_QUESTION_TYPE_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table SECURITY_QUESTION
prompt ================================
prompt
create table TIMSRPTDATA.SECURITY_QUESTION
(
  security_question_sid      NUMBER not null,
  security_question_type_sid NUMBER not null,
  security_question          VARCHAR2(2000) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.SECURITY_QUESTION.security_question_sid
  is 'Surrogate Key for the security Question';
comment on column TIMSRPTDATA.SECURITY_QUESTION.security_question_type_sid
  is 'Surrogate Key for the Security Question Type';
comment on column TIMSRPTDATA.SECURITY_QUESTION.security_question
  is 'A question used to identify a valid user.
Example: What is your birth city?';
alter table TIMSRPTDATA.SECURITY_QUESTION
  add constraint PK_SECURITY_QUESTION primary key (SECURITY_QUESTION_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.SECURITY_QUESTION
  add constraint FK_SECURITY_REFERENCE_SECURITY foreign key (SECURITY_QUESTION_TYPE_SID)
  references TIMSRPTDATA.SECURITY_QUESTION_TYPE (SECURITY_QUESTION_TYPE_SID);

prompt
prompt Creating table SECURITY_TRANSACTION_LOG
prompt =======================================
prompt
create table TIMSRPTDATA.SECURITY_TRANSACTION_LOG
(
  security_transaction_sid NUMBER not null,
  user_sid                 NUMBER,
  user_id                  VARCHAR2(75),
  transaction_date         DATE,
  log_message              VARCHAR2(2000),
  action_type              VARCHAR2(100),
  action_result            VARCHAR2(100),
  attempts                 NUMBER(1),
  user_ip_address          VARCHAR2(100),
  browser                  VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.security_transaction_sid
  is 'Surrogate key for the logon transaction.';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.user_id
  is 'The User ID of the person attempting to login.';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.transaction_date
  is 'Date and time of the security transaction.';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.log_message
  is 'Indicates the result of the users attempt to login to an application.
Values: SUCCESSFUL LOGIN,
             UNSUCCESSFUL LOGIN,
             ACCOUNT LOCKED,
             PASSWORD CHANGED,
             USER ROLE ADDED,
             APPLICATION LICENSE DELETED,
             <ATTENDANCE> RISK FACTOR DELETED FOR CAMPUS <057938001>';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.action_type
  is 'Indicates what type of action was taken by the user.
Example: Login Attempt,
               Password Reset,
               First Time Login,
               External Security Question,
               Login Question, etc..';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.action_result
  is 'Indicates the result of the users action.
Example: Successful,
               Failed
               ';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.attempts
  is 'Indicates the number times the user entered their password or security question before either

successfully or unsuccessfully logging in.
Example: 2';
comment on column TIMSRPTDATA.SECURITY_TRANSACTION_LOG.user_ip_address
  is 'The users ip address that they connected to the application from.
Example: 207.235.45.106 (ipv4)
               2001:db8:85a3::8a2e:370:7334 (ipv6)';
alter table TIMSRPTDATA.SECURITY_TRANSACTION_LOG
  add constraint PK_SECURITY_TRANSACTION_LOG primary key (SECURITY_TRANSACTION_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table SOURCE_CONFIG
prompt ============================
prompt
create table TIMSRPTDATA.SOURCE_CONFIG
(
  synonym_name           VARCHAR2(30) not null,
  synonym_desc           VARCHAR2(200),
  application_id         NUMBER not null,
  source_sid             NUMBER not null,
  datamart_target_owner  VARCHAR2(30) not null,
  datamart_target_object VARCHAR2(30) not null,
  realtime_target_owner  VARCHAR2(30) not null,
  realtime_target_object VARCHAR2(30) not null,
  realtime_target_dblink VARCHAR2(30),
  active_flag            CHAR(1) default 'Y'
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.SOURCE_CONFIG
  add constraint SOURCE_CONFIG_PK primary key (SYNONYM_NAME)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.SOURCE_CONFIG
  add constraint SOURCE_CONFIG_FK1 foreign key (APPLICATION_ID)
  references TIMSRPTDATA.APPLICATION (APPLICATION_ID);
alter table TIMSRPTDATA.SOURCE_CONFIG
  add constraint SOURCE_CONFIG_FK2 foreign key (SOURCE_SID)
  references TIMSRPTDATA.SOURCE (SOURCE_SID);

prompt
prompt Creating table SO_DISTRICT_COPY
prompt ===============================
prompt
create table TIMSRPTDATA.SO_DISTRICT_COPY
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SO_EMAIL_LDAP
prompt ============================
prompt
create table TIMSRPTDATA.SO_EMAIL_LDAP
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SO_LDAP_EXPORT
prompt =============================
prompt
create table TIMSRPTDATA.SO_LDAP_EXPORT
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create bitmap index TIMSRPTDATA.BMI_TRANS_NBR on TIMSRPTDATA.SO_LDAP_EXPORT (TRANS_NBR)
  tablespace DW_DEFAULT01
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
create bitmap index TIMSRPTDATA.BMI_TRANS_TYPE on TIMSRPTDATA.SO_LDAP_EXPORT (TRANS_TYPE)
  tablespace DW_DEFAULT01
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
prompt Creating table STATE_COURSE_DIM
prompt ===============================
prompt
create table TIMSRPTDATA.STATE_COURSE_DIM
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
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STATE_COURSE_DIM
  is 'Contains all of the state defined courses.';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.state_code
  is 'The upper case two character state code for this course.
Example: TX';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column TIMSRPTDATA.STATE_COURSE_DIM.state_course_key
  is 'The business key used to look state courses. Consisting of the state code * state course code
Example: TX*049304939';
alter table TIMSRPTDATA.STATE_COURSE_DIM
  add constraint PK_STATE_COURSE_DIM primary key (STATE_COURSE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STATE_COURSE_DIM
  add constraint AK_STATE_COURSE_AK_STATE_CO unique (STATE_COURSE_KEY)
  using index 
  tablespace DW_DEFAULT01
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

prompt
prompt Creating table STUDENT_CREDIT_FACT
prompt ==================================
prompt
create table TIMSRPTDATA.STUDENT_CREDIT_FACT
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
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_CREDIT_FACT
  is 'captures the number of credits a student has recieved for the successful completion of course.

Grain: 1 row/student/campus/date/course

Credits will be set to the date of 6/15/school year.';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.student_credit_fact_sid
  is 'A surrogate key for the fact.';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.credits_earned
  is 'The number of credits earned by a student for a particular course.
Example: 1.0,
                0.5,
                0.25
                0.333';
comment on column TIMSRPTDATA.STUDENT_CREDIT_FACT.local_credits_earned
  is 'This is the value for credits earned from the source.
Examples: 10
                  5
                  NC';
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint PK_STUDENT_CREDIT_FACT primary key (STUDENT_CREDIT_FACT_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_COURSE_DIM foreign key (COURSE_SID)
  references TIMSRPTDATA.COURSE_DIM (COURSE_SID);
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references TIMSRPTDATA.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table TIMSRPTDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_CREDIT_FACT_ERR
prompt ======================================
prompt
create table TIMSRPTDATA.STUDENT_CREDIT_FACT_ERR
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
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_CREDIT_FACT_REJ
prompt ======================================
prompt
create table TIMSRPTDATA.STUDENT_CREDIT_FACT_REJ
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
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_DISCIPLINE_ACTION_FACT
prompt =============================================
prompt
create table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
(
  campus_sid                    NUMBER not null,
  student_sid                   NUMBER not null,
  date_sid                      NUMBER not null,
  action_length_diff_reason_sid NUMBER not null,
  discipline_sid                NUMBER not null,
  incident_number               VARCHAR2(25) not null,
  action_assigned_days          NUMBER not null,
  action_actual_days            NUMBER not null,
  last_update                   DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  is 'Actions taken as a result of a student discipline incident.';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian

partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_length_diff_reason_sid
  is 'Uniquely identifies the Action Length Diff Reason Dim';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.discipline_sid
  is 'Uniquely identifies the Discipline DIM';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.incident_number
  is 'The discipline incident number associated with this action.';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_assigned_days
  is 'The number of days assigned for the action.';
comment on column TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_actual_days
  is 'The number of days actually served for this action.';
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint PK_STUDENT_DISCIPLINE_ACTION_F primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, INCIDENT_NUMBER)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_ACT_LN_DIFF foreign key (ACTION_LENGTH_DIFF_REASON_SID)
  references TIMSRPTDATA.ACTION_LENGTH_DIFF_REASON_DIM (ACTION_LENGTH_DIFF_REASON_SID);
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_DISC_DIM foreign key (DISCIPLINE_SID)
  references TIMSRPTDATA.DISCIPLINE_DIM (DISCIPLINE_SID);
alter table TIMSRPTDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_DISC_ACT_FACT_ERR
prompt ========================================
prompt
create table TIMSRPTDATA.STUDENT_DISC_ACT_FACT_ERR
(
  exception_type                VARCHAR2(75),
  campus_sid                    NUMBER,
  student_sid                   NUMBER,
  date_sid                      NUMBER,
  action_length_diff_reason_sid NUMBER,
  discipline_sid                NUMBER,
  incident_number               VARCHAR2(25),
  action_assigned_days          NUMBER,
  action_actual_days            NUMBER,
  last_update                   TIMESTAMP(6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_DISC_ACT_FACT_REJ
prompt ========================================
prompt
create table TIMSRPTDATA.STUDENT_DISC_ACT_FACT_REJ
(
  campus_sid                    NUMBER not null,
  student_sid                   NUMBER not null,
  date_sid                      NUMBER not null,
  action_length_diff_reason_sid NUMBER not null,
  discipline_sid                NUMBER not null,
  incident_number               VARCHAR2(25) not null,
  action_assigned_days          NUMBER not null,
  action_actual_days            NUMBER not null,
  last_update                   DATE,
  errorcode                     VARCHAR2(255),
  errormessage                  VARCHAR2(255)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_ENROLLMENT_FACT
prompt ======================================
prompt
create table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
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
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.STUDENT_ENROLLMENT_FACT.entry_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_ENROLLMENT_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column TIMSRPTDATA.STUDENT_ENROLLMENT_FACT.withdrawal_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_ENROLLMENT_FACT.last_update
  is 'Date that this records was last updated';
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint PK_STUDENT_ENROLLMENT_FACT primary key (CAMPUS_SID, STUDENT_SID, ENTRY_DATE_SID, GRADE_LEVEL_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STUDENT__REFERENCE_GRADE_LE foreign key (GRADE_LEVEL_SID)
  references TIMSRPTDATA.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_DIM_STUDENT_ENRL foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENRL_TRANS_DATE_DIM foreign key (ENTRY_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENROLL_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_REF_WITHDRAW_DATE_DIM foreign key (WITHDRAWAL_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_ENROLLMENT_FACT_ERR
prompt ==========================================
prompt
create table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT_ERR
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_ENROLLMENT_FACT_REJ
prompt ==========================================
prompt
create table TIMSRPTDATA.STUDENT_ENROLLMENT_FACT_REJ
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_GRADE_FACT
prompt =================================
prompt
create table TIMSRPTDATA.STUDENT_GRADE_FACT
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
    initial 9M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_GRADE_FACT
  is 'Captures a students grade.
Grain = 1 Row/ student/Course Section/date/Grade Type';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.number_grade
  is 'The numerical grade received by a student.
Example: 100,
                 75.6
                 50.07';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.letter_grade
  is 'The letter grade received by a student.
Example: A,
                B,
                 P,
                 NG';
comment on column TIMSRPTDATA.STUDENT_GRADE_FACT.last_update
  is 'The date/time the row was inserted or updated.';
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint PK_STUDENT_GRADE_FACT primary key (STUDENT_SID, GRADE_TYPE_SID, DATE_SID, COURSE_SECTION_SID, STATE_COURSE_SID, CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 9M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_COURSE_SEC foreign key (COURSE_SECTION_SID)
  references TIMSRPTDATA.COURSE_SECTION_DIM (COURSE_SECTION_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references TIMSRPTDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references TIMSRPTDATA.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_LEVEL_DIM foreign key (GRADE_LEVEL_SID)
  references TIMSRPTDATA.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table TIMSRPTDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_TYPE foreign key (GRADE_TYPE_SID)
  references TIMSRPTDATA.GRADE_TYPE_DIM (GRADE_TYPE_SID);

prompt
prompt Creating table STUDENT_GRADE_FACT_ERR
prompt =====================================
prompt
create table TIMSRPTDATA.STUDENT_GRADE_FACT_ERR
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
    initial 26M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_GRADE_FACT_REJ
prompt =====================================
prompt
create table TIMSRPTDATA.STUDENT_GRADE_FACT_REJ
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
    initial 30M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_PERIOD_ABSENCE_FACT
prompt ==========================================
prompt
create table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
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
    initial 8M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  is 'Transactional fact to record when a student is abscent from a class period.';
comment on column TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT.period_absence_count
  is 'A measure for this fact table.  Value: 1';
create index TIMSRPTDATA.NDX_STU_PRD_ABS_DATE_SID_FK on TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT (DATE_SID)
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint PK_STUDENT_PERIOD_ABSENCE_FACT primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, CLASS_PERIOD_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_ABR_RSN_PRD_ABSENCE_FACT foreign key (ABSENCE_REASON_SID)
  references TIMSRPTDATA.ABSENCE_REASON_DIM (ABSENCE_REASON_SID);
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_DIM_STU_PRD_ABS_FACT foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CLASS_PER_DIM foreign key (CLASS_PERIOD_SID)
  references TIMSRPTDATA.CLASS_PERIOD_DIM (CLASS_PERIOD_SID);
alter table TIMSRPTDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_FACT_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_PERIOD_ABS_FACT_ERR
prompt ==========================================
prompt
create table TIMSRPTDATA.STUDENT_PERIOD_ABS_FACT_ERR
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
    initial 27M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_PERIOD_ABS_FACT_REJ
prompt ==========================================
prompt
create table TIMSRPTDATA.STUDENT_PERIOD_ABS_FACT_REJ
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_PERIOD_OVERRIDE
prompt ======================================
prompt
create table TIMSRPTDATA.STUDENT_PERIOD_OVERRIDE
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_PERIOD_OVERRIDE
  is 'Overides the default campus periods per day for a particular student for the current semester.
Example: 5';
alter table TIMSRPTDATA.STUDENT_PERIOD_OVERRIDE
  add constraint PK_STUDENT_PERIOD_OVERRIDE primary key (CAMPUS_SID, STUDENT_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_DIM_STU_PRD_OVERIDE foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_PRD_OVRD_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_FACT
prompt =======================================
prompt
create table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
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
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  is 'Grain = 1 row /student/risk factor/effective date';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT.risk_factor_count
  is 'A measure defined for Cognos reporting; Value 1';
create index TIMSRPTDATA.NDX_STU_RISK_FACTOR_STU_SID_FK on TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT (STUDENT_SID)
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint PK_STUDENT_RISK_FACTOR_FACT primary key (CAMPUS_SID, STUDENT_SID, FLAG_DATE_SID, CAMPUS_RISK_FACTOR_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STUDENT__REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_DIM_STU_RISK_FACTOR_F foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_END_DATE_DIM foreign key (END_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FACT_CAMP_RISK_F foreign key (CAMPUS_RISK_FACTOR_SID)
  references TIMSRPTDATA.CAMPUS_RISK_FACTOR_DIM (CAMPUS_RISK_FACTOR_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_PHASE_SUM
prompt ============================================
prompt
create table TIMSRPTDATA.STUDENT_RISK_FACTOR_PHASE_SUM
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_FACT_CAMPUS foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_STU foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_SNAPSHOT
prompt ===========================================
prompt
create table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  is 'Grain: 1 row/campus/student/semester

For the current semester the date reflects the date of the last execution of the risk factor calculation engine.';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.attendance_flag
  is 'Indicates that the student was flagged for attendance during this snapshot period.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_attendance_flag
  is 'Indicates that the student was flagged for attendance at the end of an academic semester.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.core_course_failure_flag
  is 'Indicates that the student was flagged for failing a core course during a marking period.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.non_core_course_failure_flag
  is 'Indicates that the student was flagged for failing a non-core course during a marking period.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_core_crs_failure_flag
  is 'Indicates that the student was flagged for failing a core course for a semester.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_noncore_crs_fail_flag
  is 'Indicates that the student was flagged for failing a non-core course for a semester.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.gpa_flag
  is 'Indicates that the student was flagged for a GPA below minium established standard.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.deficient_credits_flag
  is 'Indicates that the student was flagged for having to few credits for a semester.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.discipline_flag
  is 'Indicates that the student was flagged for behavorial problems.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.grade_6_thru_8_retention_flag
  is 'Indicates that the student was flagged for having been retained in grades 6 through 8 one or more times.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.cohort_flag
  is 'Indicates that the student was at risk of not graduating with his/her 9th grade class.
Values: Yes, No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.other_flag
  is 'Indicates that the student has "other" secondary risk factors.  The secondary risk may include LEP, Economically Disadvantaged, SPED, etc..
Values: Yes/No';
comment on column TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT.risk_factor_count
  is 'The total number of risk factors flagged Yes for this student on this date.
Example: 3';
create index TIMSRPTDATA.NDX_STU_RISK_SNAPSHOT_DATE_FK on TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT (DATE_SID)
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint PK_STUDENT_RISK_FACTOR_SNAPSHO primary key (CAMPUS_SID, STUDENT_SID, DATE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_DIM_STU_RISK_SNAPSHOT foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_FACTOR_FACT_CAMPUS foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_SNAPSHOT_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_RISK_FCT_PHSE_SUM_XREF
prompt =============================================
prompt
create table TIMSRPTDATA.STUDENT_RISK_FCT_PHSE_SUM_XREF
(
  date_sid          NUMBER not null,
  risk_factor_phase VARCHAR2(10) not null,
  risk_factor_count NUMBER(2) not null,
  student_id        VARCHAR2(25),
  campus_id         VARCHAR2(20) not null
)
tablespace DW_DEFAULT01
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
prompt Creating table STU_DISCIPLINE_INCIDENT_FACT
prompt ===========================================
prompt
create table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
(
  campus_sid            NUMBER not null,
  student_sid           NUMBER not null,
  date_sid              NUMBER not null,
  incident_location_sid NUMBER not null,
  incident_behavior_sid NUMBER not null,
  incident_number       VARCHAR2(25) not null,
  incident_time         DATE,
  last_update           DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  is 'The occurrence of an incident that may or may not result in a student discipline action.';
comment on column TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian

partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT.incident_location_sid
  is 'Uniquely identifies the Incident Location';
comment on column TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT.incident_behavior_sid
  is 'Uniquely identifies an incident behavior.';
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint PK_STU_DISCIPLINE_INCIDENT_FAC primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, INCIDENT_NUMBER)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STUD_DIS_INC_REF_DATE_DIM foreign key (DATE_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references TIMSRPTDATA.CAMPUS_DIM (CAMPUS_SID);
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_INC_BEHAVOR foreign key (INCIDENT_BEHAVIOR_SID)
  references TIMSRPTDATA.INCIDENT_BEHAVIOR_DIM (INCIDENT_BEHAVIOR_SID);
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_INC_LOC foreign key (INCIDENT_LOCATION_SID)
  references TIMSRPTDATA.INCIDENT_LOCATION_DIM (INCIDENT_LOCATION_SID);
alter table TIMSRPTDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references TIMSRPTDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STU_DISC_INC_FACT_ERR
prompt ====================================
prompt
create table TIMSRPTDATA.STU_DISC_INC_FACT_ERR
(
  exception_type        VARCHAR2(75),
  campus_sid            NUMBER,
  student_sid           NUMBER,
  date_sid              NUMBER,
  incident_location_sid NUMBER,
  incident_behavior_sid NUMBER,
  incident_number       VARCHAR2(25),
  incident_time         NUMBER,
  last_update           TIMESTAMP(6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STU_DISC_INC_FACT_REJ
prompt ====================================
prompt
create table TIMSRPTDATA.STU_DISC_INC_FACT_REJ
(
  campus_sid            NUMBER not null,
  student_sid           NUMBER not null,
  date_sid              NUMBER not null,
  incident_location_sid NUMBER not null,
  incident_behavior_sid NUMBER not null,
  incident_number       VARCHAR2(25) not null,
  incident_time         DATE not null,
  last_update           DATE,
  errorcode             VARCHAR2(255),
  errormessage          VARCHAR2(255)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TALEND_ETL_PROCESS
prompt =================================
prompt
create table TIMSRPTDATA.TALEND_ETL_PROCESS
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.TALEND_ETL_PROCESS
  add constraint PK_TALEND_ETL_PROCESS primary key (EXTRACT_DATE, LEA, LEA_NAME, STATE, ENVIRONMENT, PRODUCT, ACTIVE_STATUS, EXTRACT_STATUS, LOAD_STATUS)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table TALEND_FLOW_METER_CATCHER
prompt ========================================
prompt
create table TIMSRPTDATA.TALEND_FLOW_METER_CATCHER
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
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TIMSRPTDATA.IX_ACTION_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (ACTION)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_EXTRACT_DATE_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (EXTRACT_DATE)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_JOB_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (JOB)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LABEL_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (LABEL)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_NAME_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (LEA_NAME)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (LEA)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_MOMENT_TFC on TIMSRPTDATA.TALEND_FLOW_METER_CATCHER (MOMENT)
  tablespace DW_DEFAULT01
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
prompt Creating table TALEND_LEA_CONTEXTS
prompt ==================================
prompt
create table TIMSRPTDATA.TALEND_LEA_CONTEXTS
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TALEND_LOG_CATCHER
prompt =================================
prompt
create table TIMSRPTDATA.TALEND_LOG_CATCHER
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
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TIMSRPTDATA.IX_EXTRACT_DATE_TLC on TIMSRPTDATA.TALEND_LOG_CATCHER (EXTRACT_DATE)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_JOB_TLC on TIMSRPTDATA.TALEND_LOG_CATCHER (JOB)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_NAME_TLC on TIMSRPTDATA.TALEND_LOG_CATCHER (LEA_NAME)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_TLC on TIMSRPTDATA.TALEND_LOG_CATCHER (LEA)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_MOMENT_TLC on TIMSRPTDATA.TALEND_LOG_CATCHER (MOMENT)
  tablespace DW_DEFAULT01
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
prompt Creating table TALEND_STAT_CATCHER
prompt ==================================
prompt
create table TIMSRPTDATA.TALEND_STAT_CATCHER
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TIMSRPTDATA.IX_EXTRACT_DATE_TSC on TIMSRPTDATA.TALEND_STAT_CATCHER (EXTRACT_DATE)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_JOB_TSC on TIMSRPTDATA.TALEND_STAT_CATCHER (JOB)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_NAME_TSC on TIMSRPTDATA.TALEND_STAT_CATCHER (LEA_NAME)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_LEA_TSC on TIMSRPTDATA.TALEND_STAT_CATCHER (LEA)
  tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.IX_MOMENT_TSC on TIMSRPTDATA.TALEND_STAT_CATCHER (MOMENT)
  tablespace DW_DEFAULT01
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
prompt Creating table TIMS_ISSUE_DIM
prompt =============================
prompt
create table TIMSRPTDATA.TIMS_ISSUE_DIM
(
  issue_id                       NUMBER not null,
  issue_key                      VARCHAR2(255),
  project_id                     NUMBER,
  project_name                   VARCHAR2(255),
  reporter                       VARCHAR2(255),
  assignee                       VARCHAR2(255),
  issue_type                     VARCHAR2(60),
  summary                        VARCHAR2(255),
  description                    VARCHAR2(2000),
  environment                    VARCHAR2(2000),
  severity                       VARCHAR2(255),
  resolution                     VARCHAR2(60),
  issue_status                   VARCHAR2(60),
  created_dttm                   DATE,
  updated_dttm                   DATE,
  due_dttm                       DATE,
  resolved_dttm                  DATE,
  timespent                      NUMBER,
  component                      VARCHAR2(255),
  campus_cdn                     VARCHAR2(255),
  campus_name                    VARCHAR2(255),
  lea_cdn                        VARCHAR2(255),
  lea_name                       VARCHAR2(255),
  escalation_esc                 VARCHAR2(255),
  l1_security_group              VARCHAR2(255),
  l2_security_group              VARCHAR2(255),
  submission_dttm                DATE,
  submitter_email                VARCHAR2(255),
  submitter_phone                VARCHAR2(255),
  submitter_name                 VARCHAR2(255),
  subsystem                      VARCHAR2(255),
  working_priority               VARCHAR2(255),
  submitter_notification_comment VARCHAR2(2000),
  load_dttm                      DATE,
  resolution_final               VARCHAR2(255)
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.TIMS_ISSUE_DIM_IDX1 on TIMSRPTDATA.TIMS_ISSUE_DIM (SEVERITY)
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
create index TIMSRPTDATA.TIMS_ISSUE_DIM_IDX2 on TIMSRPTDATA.TIMS_ISSUE_DIM (CREATED_DTTM)
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
create index TIMSRPTDATA.TIMS_ISSUE_DIM_IDX3 on TIMSRPTDATA.TIMS_ISSUE_DIM (RESOLVED_DTTM)
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
create unique index TIMSRPTDATA.TIMS_ISSUE_DIM_IDX4 on TIMSRPTDATA.TIMS_ISSUE_DIM (ISSUE_KEY)
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
alter table TIMSRPTDATA.TIMS_ISSUE_DIM
  add constraint TIMS_ISSUE_DIM_PK primary key (ISSUE_ID)
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
prompt Creating table TIMS_USER_DIM
prompt ============================
prompt
create table TIMSRPTDATA.TIMS_USER_DIM
(
  user_id       NUMBER not null,
  user_name     VARCHAR2(255),
  active_flag   VARCHAR2(3),
  created_dttm  DATE,
  display_name  VARCHAR2(255),
  first_name    VARCHAR2(255),
  last_name     VARCHAR2(255),
  email_address VARCHAR2(255),
  email_domain  VARCHAR2(255),
  primary_org   VARCHAR2(255),
  l1_agent      VARCHAR2(30),
  l2_agent      VARCHAR2(30),
  l3_agent      VARCHAR2(30),
  l4_agent      VARCHAR2(30),
  l2_coach      VARCHAR2(30),
  service_acct  VARCHAR2(30),
  admin_acct    VARCHAR2(30),
  load_dttm     DATE
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX1 on TIMSRPTDATA.TIMS_USER_DIM (PRIMARY_ORG)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX2 on TIMSRPTDATA.TIMS_USER_DIM (L1_AGENT)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX3 on TIMSRPTDATA.TIMS_USER_DIM (L2_AGENT)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX4 on TIMSRPTDATA.TIMS_USER_DIM (L3_AGENT)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX5 on TIMSRPTDATA.TIMS_USER_DIM (L4_AGENT)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX6 on TIMSRPTDATA.TIMS_USER_DIM (L2_COACH)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX7 on TIMSRPTDATA.TIMS_USER_DIM (SERVICE_ACCT)
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
create index TIMSRPTDATA.TIMS_USER_DIM_IDX8 on TIMSRPTDATA.TIMS_USER_DIM (ADMIN_ACCT)
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
alter table TIMSRPTDATA.TIMS_USER_DIM
  add constraint TIMS_USER_DIM_PK primary key (USER_ID)
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
prompt Creating table TIMS_ISSUE_HISTORY_FACT
prompt ======================================
prompt
create table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
(
  chg_id     NUMBER not null,
  chg_grp_id NUMBER,
  issue_id   NUMBER,
  user_id    NUMBER,
  org_sid    NUMBER,
  chg_dt_sid NUMBER,
  chg_dttm   DATE,
  field_type VARCHAR2(30),
  field      VARCHAR2(255),
  old_value  VARCHAR2(2000),
  new_value  VARCHAR2(2000),
  old_string VARCHAR2(2000),
  new_string VARCHAR2(2000),
  load_dttm  DATE
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX1 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (ISSUE_ID)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX2 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (USER_ID)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX3 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (ORG_SID)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX4 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (CHG_DT_SID)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX5 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (CHG_DTTM)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX6 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (FIELD)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX7 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (OLD_STRING)
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
create index TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT_IDX8 on TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT (NEW_STRING)
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
alter table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
  add constraint TIMS_ISSUE_HISTORY_FACT_PK primary key (CHG_ID)
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
alter table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
  add constraint TIMS_ISSUE_HISTORY_FACT_FK1 foreign key (ISSUE_ID)
  references TIMSRPTDATA.TIMS_ISSUE_DIM (ISSUE_ID);
alter table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
  add constraint TIMS_ISSUE_HISTORY_FACT_FK2 foreign key (USER_ID)
  references TIMSRPTDATA.TIMS_USER_DIM (USER_ID);
alter table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
  add constraint TIMS_ISSUE_HISTORY_FACT_FK3 foreign key (ORG_SID)
  references TIMSRPTDATA.ORG_DIM (ORG_SID);
alter table TIMSRPTDATA.TIMS_ISSUE_HISTORY_FACT
  add constraint TIMS_ISSUE_HISTORY_FACT_FK4 foreign key (CHG_DT_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table TIMS_ISSUE_TRANSITION_FACT
prompt =========================================
prompt
create table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
(
  chg_id      NUMBER not null,
  chg_grp_id  NUMBER,
  issue_id    NUMBER,
  user_id     NUMBER,
  org_sid     NUMBER,
  from_step   VARCHAR2(30),
  to_step     VARCHAR2(30),
  in_dt_sid   NUMBER,
  in_dttm     DATE,
  out_dt_sid  NUMBER,
  out_dttm    DATE,
  hrs_in_step NUMBER,
  load_dttm   DATE
)
tablespace DW_DEFAULT01
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX1 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (ISSUE_ID)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX2 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (USER_ID)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX3 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (ORG_SID)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX4 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (IN_DT_SID)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX5 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (OUT_DT_SID)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX6 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (IN_DTTM)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX7 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (OUT_DTTM)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX8 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (FROM_STEP)
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
create index TIMSRPTDATA.TIMS_ISSUE_TRANS_FACT_IDX9 on TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT (TO_STEP)
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
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_PK primary key (CHG_ID)
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
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_FK1 foreign key (ISSUE_ID)
  references TIMSRPTDATA.TIMS_ISSUE_DIM (ISSUE_ID);
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_FK2 foreign key (USER_ID)
  references TIMSRPTDATA.TIMS_USER_DIM (USER_ID);
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_FK3 foreign key (ORG_SID)
  references TIMSRPTDATA.ORG_DIM (ORG_SID);
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_FK4 foreign key (IN_DT_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);
alter table TIMSRPTDATA.TIMS_ISSUE_TRANSITION_FACT
  add constraint TIMS_ISSUE_TRANSITION_FACT_FK5 foreign key (OUT_DT_SID)
  references TIMSRPTDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table TXSTU_USER_STUDENT_SECURITY
prompt ==========================================
prompt
create table TIMSRPTDATA.TXSTU_USER_STUDENT_SECURITY
(
  user_id VARCHAR2(30) not null,
  sch_yr  VARCHAR2(4) not null,
  stu_id  VARCHAR2(30) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.TXSTU_USER_STUDENT_SECURITY
  add constraint PK_TXSTU_USER_STU_SEC primary key (STU_ID, USER_ID, SCH_YR)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 576K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_CAMPUS
prompt ==========================
prompt
create table TIMSRPTDATA.USER_CAMPUS
(
  user_campus_sid   NUMBER not null,
  user_sid          NUMBER not null,
  campus_master_sid NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.USER_CAMPUS.user_campus_sid
  is 'Surrogate Key for the User Campus';
comment on column TIMSRPTDATA.USER_CAMPUS.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.USER_CAMPUS.campus_master_sid
  is 'Surrogate Key for the Campus Master';
alter table TIMSRPTDATA.USER_CAMPUS
  add constraint PK_USER_CAMPUS primary key (USER_CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_CAMPUS
  add constraint AK_USER_CAMPUS_AK_USER_CAM unique (USER_SID, CAMPUS_MASTER_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_CAMPUS
  add constraint FK_USER_CAM_REFERENCE_CAMPUS_M foreign key (CAMPUS_MASTER_SID)
  references TIMSRPTDATA.CAMPUS_MASTER (CAMPUS_MASTER_SID);
alter table TIMSRPTDATA.USER_CAMPUS
  add constraint FK_USER_CAM_REFERENCE_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_REPORT
prompt ==========================
prompt
create table TIMSRPTDATA.USER_REPORT
(
  user_report_sid NUMBER not null,
  user_sid        NUMBER not null,
  report_list_sid NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.USER_REPORT
  is 'A specific report assigned to a user.';
comment on column TIMSRPTDATA.USER_REPORT.user_sid
  is 'User Surrogate Key';
alter table TIMSRPTDATA.USER_REPORT
  add constraint PK_USER_REPORT primary key (USER_REPORT_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_REPORT
  add constraint FK_USER_REP_REFERENCE_REPORT_L foreign key (REPORT_LIST_SID)
  references TIMSRPTDATA.REPORT_LIST (REPORT_LIST_SID);
alter table TIMSRPTDATA.USER_REPORT
  add constraint FK_USER_REP_REFERENCE_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_REPORT_CATEGORY
prompt ===================================
prompt
create table TIMSRPTDATA.USER_REPORT_CATEGORY
(
  user_report_category_sid NUMBER not null,
  user_sid                 NUMBER not null,
  report_category_sid      NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TIMSRPTDATA.USER_REPORT_CATEGORY
  is 'Defines which report categorys a user is allowed acces.';
comment on column TIMSRPTDATA.USER_REPORT_CATEGORY.user_sid
  is 'User Surrogate Key';
alter table TIMSRPTDATA.USER_REPORT_CATEGORY
  add constraint PK_USER_REPORT_CATEGORY primary key (USER_REPORT_CATEGORY_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_REPORT_CATEGORY
  add constraint FK_USER_REP_CAT_REF_REP_CAT foreign key (REPORT_CATEGORY_SID)
  references TIMSRPTDATA.REPORT_CATEGORY (REPORT_CATEGORY_SID);
alter table TIMSRPTDATA.USER_REPORT_CATEGORY
  add constraint FK_USER_REP_CAT_REF_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_ROLE
prompt ========================
prompt
create table TIMSRPTDATA.USER_ROLE
(
  user_role_sid            NUMBER not null,
  user_sid                 NUMBER not null,
  application_role_sid     NUMBER not null,
  default_application_flag VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.USER_ROLE.user_role_sid
  is 'User Role Surrogate Key';
comment on column TIMSRPTDATA.USER_ROLE.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.USER_ROLE.application_role_sid
  is 'Surrogate Key for the Application Role';
comment on column TIMSRPTDATA.USER_ROLE.default_application_flag
  is 'Denotes which application the user will be connected to after successful login(authorization).
Values: Y/N';
alter table TIMSRPTDATA.USER_ROLE
  add constraint PK_USER_ROLE primary key (USER_ROLE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_ROLE
  add constraint AK_USER_ROLE_AK_USER_ROL unique (USER_SID, APPLICATION_ROLE_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_ROLE
  add constraint FK_USER_ROL_REFERENCE_APPLICAT foreign key (APPLICATION_ROLE_SID)
  references TIMSRPTDATA.APPLICATION_ROLE (APPLICATION_ROLE_SID);
alter table TIMSRPTDATA.USER_ROLE
  add constraint FK_USER_ROL_REFERENCE_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_SECURITY_QUESTION
prompt =====================================
prompt
create table TIMSRPTDATA.USER_SECURITY_QUESTION
(
  user_security_question_sid NUMBER not null,
  security_question_sid      NUMBER not null,
  user_sid                   NUMBER not null,
  user_response              VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column TIMSRPTDATA.USER_SECURITY_QUESTION.user_security_question_sid
  is 'Surrogate Key for the User Security Question';
comment on column TIMSRPTDATA.USER_SECURITY_QUESTION.security_question_sid
  is 'Surrogate Key for the security Question';
comment on column TIMSRPTDATA.USER_SECURITY_QUESTION.user_sid
  is 'User Surrogate Key';
comment on column TIMSRPTDATA.USER_SECURITY_QUESTION.user_response
  is 'The users answer to the security question.';
alter table TIMSRPTDATA.USER_SECURITY_QUESTION
  add constraint PK_USER_SECURITY_QUESTION primary key (USER_SECURITY_QUESTION_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_SECURITY_QUESTION
  add constraint AK_USER_SEC_QUES_AK_USER_SEC unique (SECURITY_QUESTION_SID, USER_SID)
  using index 
  tablespace DW_DEFAULT01
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
alter table TIMSRPTDATA.USER_SECURITY_QUESTION
  add constraint FK_USER_SEC_REFERENCE_SECURITY foreign key (SECURITY_QUESTION_SID)
  references TIMSRPTDATA.SECURITY_QUESTION (SECURITY_QUESTION_SID);
alter table TIMSRPTDATA.USER_SECURITY_QUESTION
  add constraint FK_USER_SEC_REFERENCE_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_STUDENT_SECURITY
prompt ====================================
prompt
create table TIMSRPTDATA.USER_STUDENT_SECURITY
(
  user_id      VARCHAR2(75) not null,
  district_sid NUMBER not null,
  student_sid  NUMBER not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TIMSRPTDATA.USER_STUDENT_SECURITY
  add constraint PK_USER_STUDENT_SECURITY primary key (USER_ID, DISTRICT_SID, STUDENT_SID)
  using index 
  tablespace DW_DEFAULT01
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
prompt Creating table USER_TXEIS_BUS_ACCT_PERMISS
prompt ==========================================
prompt
create table TIMSRPTDATA.USER_TXEIS_BUS_ACCT_PERMISS
(
  user_txeis_bus_acct_sid NUMBER not null,
  user_sid                NUMBER not null,
  app_id                  VARCHAR2(3) not null,
  fund                    VARCHAR2(3) not null,
  func                    VARCHAR2(2) not null,
  obj                     VARCHAR2(4) not null,
  sobj                    VARCHAR2(2) not null,
  org                     VARCHAR2(3) not null,
  fscl_yr                 CHAR(1) not null,
  pgm                     VARCHAR2(2) not null,
  ed_span                 CHAR(1) not null,
  proj_dtl                VARCHAR2(2) not null
)
tablespace DW_DEFAULT01
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
comment on table TIMSRPTDATA.USER_TXEIS_BUS_ACCT_PERMISS
  is 'This table contains wild card vaules used to grant access to the business reports for users of the Reveal Reporter that were not imported from TxEIS,';
comment on column TIMSRPTDATA.USER_TXEIS_BUS_ACCT_PERMISS.user_sid
  is 'User Surrogate Key';
alter table TIMSRPTDATA.USER_TXEIS_BUS_ACCT_PERMISS
  add constraint PK_USER_TXEIS_BUS_ACCT_PERMISS primary key (USER_TXEIS_BUS_ACCT_SID)
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
alter table TIMSRPTDATA.USER_TXEIS_BUS_ACCT_PERMISS
  add constraint FK_USER_TXE_REFERENCE_USER_ACC foreign key (USER_SID)
  references TIMSRPTDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating sequence SID_SEQUENCE
prompt ==============================
prompt
create sequence TIMSRPTDATA.SID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 196794
increment by 1
cache 20;

prompt
prompt Creating synonym BBG_USER_ACCT
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BBG_USER_ACCT
  for ;

prompt
prompt Creating synonym BFN_CASH_RCPTS_TRANS
prompt =====================================
prompt
create or replace synonym TIMSRPTDATA.BFN_CASH_RCPTS_TRANS
  for ;

prompt
prompt Creating synonym BFN_GL
prompt =======================
prompt
create or replace synonym TIMSRPTDATA.BFN_GL
  for TIMSRPTDATA.MV_BFN_GL;

prompt
prompt Creating synonym BFN_GL_JE_TRANS
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.BFN_GL_JE_TRANS
  for TIMSRPTDATA.MV_BFN_GL_JE_TRANS;

prompt
prompt Creating synonym BFN_OPTIONS
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.BFN_OPTIONS
  for TIMSRPTDATA.MV_BFN_OPTIONS;

prompt
prompt Creating synonym BFN_PURCHASE_ORDERS
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.BFN_PURCHASE_ORDERS
  for TIMSRPTDATA.MV_BFN_PURCHASE_ORDERS;

prompt
prompt Creating synonym BFN_USER_ACCT
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BFN_USER_ACCT
  for ;

prompt
prompt Creating synonym BFN_VENDOR
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.BFN_VENDOR
  for TIMSRPTDATA.MV_BFN_VENDOR;

prompt
prompt Creating synonym BHR_EMP_DEDUCT
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.BHR_EMP_DEDUCT
  for TIMSRPTDATA.MV_BHR_EMP_DEDUCT;

prompt
prompt Creating synonym BHR_EMP_DEMO
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.BHR_EMP_DEMO
  for TIMSRPTDATA.MV_BHR_EMP_DEMO;

prompt
prompt Creating synonym BHR_EMP_EMPLY
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BHR_EMP_EMPLY
  for TIMSRPTDATA.MV_BHR_EMP_EMPLY;

prompt
prompt Creating synonym BHR_EMP_JOB
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.BHR_EMP_JOB
  for TIMSRPTDATA.MV_BHR_EMP_JOB;

prompt
prompt Creating synonym BHR_EMP_PAY
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.BHR_EMP_PAY
  for TIMSRPTDATA.MV_BHR_EMP_PAY;

prompt
prompt Creating synonym BPO_REQ
prompt ========================
prompt
create or replace synonym TIMSRPTDATA.BPO_REQ
  for TIMSRPTDATA.MV_BPO_REQ;

prompt
prompt Creating synonym BPO_REQ_ACCNTS
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.BPO_REQ_ACCNTS
  for TIMSRPTDATA.MV_BPO_REQ_ACCNTS;

prompt
prompt Creating synonym BPO_REQ_ITEMS
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BPO_REQ_ITEMS
  for TIMSRPTDATA.MV_BPO_REQ_ITEMS;

prompt
prompt Creating synonym BTFN_ED_SPAN
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.BTFN_ED_SPAN
  for TIMSRPTDATA.MV_BTFN_ED_SPAN;

prompt
prompt Creating synonym BTFN_FUNC
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_FUNC
  for TIMSRPTDATA.MV_BTFN_FUNC;

prompt
prompt Creating synonym BTFN_FUND
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_FUND
  for TIMSRPTDATA.MV_BTFN_FUND;

prompt
prompt Creating synonym BTFN_OBJ
prompt =========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_OBJ
  for TIMSRPTDATA.MV_BTFN_OBJ;

prompt
prompt Creating synonym BTFN_ORG
prompt =========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_ORG
  for TIMSRPTDATA.MV_BTFN_ORG;

prompt
prompt Creating synonym BTFN_PGM
prompt =========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_PGM
  for TIMSRPTDATA.MV_BTFN_PGM;

prompt
prompt Creating synonym BTFN_PROJ_DTL
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BTFN_PROJ_DTL
  for TIMSRPTDATA.MV_BTFN_PROJ_DTL;

prompt
prompt Creating synonym BTFN_SOBJ
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.BTFN_SOBJ
  for TIMSRPTDATA.MV_BTFN_SOBJ;

prompt
prompt Creating synonym BTHR_DEDUC_CD
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BTHR_DEDUC_CD
  for TIMSRPTDATA.MV_BTHR_DEDUC_CD;

prompt
prompt Creating synonym BTHR_STAT_CD_EMPL
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.BTHR_STAT_CD_EMPL
  for TIMSRPTDATA.MV_BTHR_STAT_CD_EMPL;

prompt
prompt Creating synonym BTPO_REQ_STAT
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.BTPO_REQ_STAT
  for TIMSRPTDATA.MV_BTPO_REQ_STAT;

prompt
prompt Creating synonym BTPO_REQ_TYP
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.BTPO_REQ_TYP
  for TIMSRPTDATA.MV_BTPO_REQ_TYP;

prompt
prompt Creating synonym CR_ATT_CAL
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.CR_ATT_CAL
  for TIMSRPTDATA.MV_CR_ATT_CAL;

prompt
prompt Creating synonym CR_ATT_OPT
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.CR_ATT_OPT
  for TIMSRPTDATA.MV_CR_ATT_OPT;

prompt
prompt Creating synonym CR_DEMO
prompt ========================
prompt
create or replace synonym TIMSRPTDATA.CR_DEMO
  for TIMSRPTDATA.MV_CR_DEMO;

prompt
prompt Creating synonym CR_INSTR_CYR
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.CR_INSTR_CYR
  for TIMSRPTDATA.MV_CR_INSTR_CYR;

prompt
prompt Creating synonym DR_CRS_OFFERED_CYR
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.DR_CRS_OFFERED_CYR
  for TIMSRPTDATA.MV_DR_CRS_OFFERED_CYR;

prompt
prompt Creating synonym DR_DEMO
prompt ========================
prompt
create or replace synonym TIMSRPTDATA.DR_DEMO
  for TIMSRPTDATA.MV_DR_DEMO;

prompt
prompt Creating synonym ET_C012_GEN
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ET_C012_GEN
  for TIMSRPTDATA.MV_ET_C012_GEN;

prompt
prompt Creating synonym ET_C014_ETHN
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.ET_C014_ETHN
  for TIMSRPTDATA.MV_ET_C014_ETHN;

prompt
prompt Creating synonym ET_C035_INSTRUCTSET
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.ET_C035_INSTRUCTSET
  for TIMSRPTDATA.MV_ET_C035_INSTRUCTSET;

prompt
prompt Creating synonym ET_C050_GRDLVL
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.ET_C050_GRDLVL
  for TIMSRPTDATA.MV_ET_C050_GRDLVL;

prompt
prompt Creating synonym ET_C053_HANDICAP
prompt =================================
prompt
create or replace synonym TIMSRPTDATA.ET_C053_HANDICAP
  for TIMSRPTDATA.MV_ET_C053_HANDICAP;

prompt
prompt Creating synonym ET_C054_ECONDISADV
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C054_ECONDISADV
  for TIMSRPTDATA.MV_ET_C054_ECONDISADV;

prompt
prompt Creating synonym ET_C061_LEP
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ET_C061_LEP
  for TIMSRPTDATA.MV_ET_C061_LEP;

prompt
prompt Creating synonym ET_C062_GRADTYP
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.ET_C062_GRADTYP
  for TIMSRPTDATA.MV_ET_C062_GRADTYP;

prompt
prompt Creating synonym ET_C064_SGLPARPREG
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C064_SGLPARPREG
  for TIMSRPTDATA.MV_ET_C064_SGLPARPREG;

prompt
prompt Creating synonym ET_C092_HOMELANG
prompt =================================
prompt
create or replace synonym TIMSRPTDATA.ET_C092_HOMELANG
  for TIMSRPTDATA.MV_ET_C092_HOMELANG;

prompt
prompt Creating synonym ET_C093_PARPERMISS
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C093_PARPERMISS
  for TIMSRPTDATA.MV_ET_C093_PARPERMISS;

prompt
prompt Creating synonym ET_C095_SPTHRPY
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.ET_C095_SPTHRPY
  for TIMSRPTDATA.MV_ET_C095_SPTHRPY;

prompt
prompt Creating synonym ET_C122_ELIGPARTIC
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C122_ELIGPARTIC
  for TIMSRPTDATA.MV_ET_C122_ELIGPARTIC;

prompt
prompt Creating synonym ET_C131_YRENDSTATUS
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.ET_C131_YRENDSTATUS
  for TIMSRPTDATA.MV_ET_C131_YRENDSTATUS;

prompt
prompt Creating synonym ET_C142_CATE
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.ET_C142_CATE
  for TIMSRPTDATA.MV_ET_C142_CATE;

prompt
prompt Creating synonym ET_C166_DISCPLN_LEN_DIFF_RSN
prompt =============================================
prompt
create or replace synonym TIMSRPTDATA.ET_C166_DISCPLN_LEN_DIFF_RSN
  for TIMSRPTDATA.MVET_C166_DISCPLN_LEN_DIFF_RSN;

prompt
prompt Creating synonym ET_C168_OEYP
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.ET_C168_OEYP
  for TIMSRPTDATA.MV_ET_C168_OEYP;

prompt
prompt Creating synonym ET_C171_SSI_PROMO_RETENT_CD
prompt ============================================
prompt
create or replace synonym TIMSRPTDATA.ET_C171_SSI_PROMO_RETENT_CD
  for TIMSRPTDATA.MV_ET_C171_SSI_PROMO_RETENT_CD;

prompt
prompt Creating synonym ET_C175_BIL_PGM_TYP
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.ET_C175_BIL_PGM_TYP
  for TIMSRPTDATA.MV_ET_C175_BIL_PGM_TYP;

prompt
prompt Creating synonym ET_C176_ESL_PGM_TYP
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.ET_C176_ESL_PGM_TYP
  for TIMSRPTDATA.MV_ET_C176_ESL_PGM_TYP;

prompt
prompt Creating synonym ET_C183_ASYLEE_REFUGEE_CD
prompt ==========================================
prompt
create or replace synonym TIMSRPTDATA.ET_C183_ASYLEE_REFUGEE_CD
  for TIMSRPTDATA.MV_ET_C183_ASYLEE_REFUGEE_CD;

prompt
prompt Creating synonym ET_C185_PK_PGM_TYP
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C185_PK_PGM_TYP
  for TIMSRPTDATA.MV_ET_C185_PK_PGM_TYP;

prompt
prompt Creating synonym ET_C186_PK_FUNDING_SRC
prompt =======================================
prompt
create or replace synonym TIMSRPTDATA.ET_C186_PK_FUNDING_SRC
  for TIMSRPTDATA.MV_ET_C186_PK_FUNDING_SRC;

prompt
prompt Creating synonym ET_C195_EARLY_READ
prompt ===================================
prompt
create or replace synonym TIMSRPTDATA.ET_C195_EARLY_READ
  for TIMSRPTDATA.MV_ET_C195_EARLY_READ;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym SEC_APPLICATION_CATEGS
prompt =======================================
prompt
create or replace synonym TIMSRPTDATA.SEC_APPLICATION_CATEGS
  for ;

prompt
prompt Creating synonym SEC_APPLICATION_TASKS
prompt ======================================
prompt
create or replace synonym TIMSRPTDATA.SEC_APPLICATION_TASKS
  for ;

prompt
prompt Creating synonym SEC_PERMISSIONS
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.SEC_PERMISSIONS
  for ;

prompt
prompt Creating synonym SEC_ROLES
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.SEC_ROLES
  for ;

prompt
prompt Creating synonym SEC_TASKS
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.SEC_TASKS
  for ;

prompt
prompt Creating synonym SEC_USERS
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.SEC_USERS
  for ;

prompt
prompt Creating synonym SEC_USER_ROLES
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.SEC_USER_ROLES
  for ;

prompt
prompt Creating synonym SEC_USER_ROLE_CAMPUSES
prompt =======================================
prompt
create or replace synonym TIMSRPTDATA.SEC_USER_ROLE_CAMPUSES
  for ;

prompt
prompt Creating synonym SR_ATT_POST
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.SR_ATT_POST
  for TIMSRPTDATA.MV_SR_ATT_POST;

prompt
prompt Creating synonym SR_CRS_GRD
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.SR_CRS_GRD
  for TIMSRPTDATA.MV_SR_CRS_GRD;

prompt
prompt Creating synonym SR_DISCPLN
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.SR_DISCPLN
  for TIMSRPTDATA.MV_SR_DISCPLN;

prompt
prompt Creating synonym SR_DISCPLN_ACTN
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.SR_DISCPLN_ACTN
  for TIMSRPTDATA.MV_SR_DISCPLN_ACTN;

prompt
prompt Creating synonym SR_DISCPLN_OFENS
prompt =================================
prompt
create or replace synonym TIMSRPTDATA.SR_DISCPLN_OFENS
  for TIMSRPTDATA.MV_SR_DISCPLN_OFENS;

prompt
prompt Creating synonym SR_GRADEBK_HINT_INST
prompt =====================================
prompt
create or replace synonym TIMSRPTDATA.SR_GRADEBK_HINT_INST
  for TIMSRPTDATA.MV_SR_GRADEBK_HINT_INST;

prompt
prompt Creating synonym SR_GRADEBK_LOGIN
prompt =================================
prompt
create or replace synonym TIMSRPTDATA.SR_GRADEBK_LOGIN
  for TIMSRPTDATA.MV_SR_GRADEBK_LOGIN;

prompt
prompt Creating synonym SR_HINT_QUES
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.SR_HINT_QUES
  for TIMSRPTDATA.MV_SR_HINT_QUES;

prompt
prompt Creating synonym SR_IMMUNIZ
prompt ===========================
prompt
create or replace synonym TIMSRPTDATA.SR_IMMUNIZ
  for TIMSRPTDATA.MV_SR_IMMUNIZ;

prompt
prompt Creating synonym SR_PARENT
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.SR_PARENT
  for TIMSRPTDATA.MV_SR_PARENT;

prompt
prompt Creating synonym SR_PK_ENROLL
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.SR_PK_ENROLL
  for TIMSRPTDATA.MV_SR_PK_ENROLL;

prompt
prompt Creating synonym SR_SE_DEMO_CYR
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.SR_SE_DEMO_CYR
  for TIMSRPTDATA.MV_SR_SE_DEMO_CYR;

prompt
prompt Creating synonym SR_SPEC_PGM_BIL_ESL
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_BIL_ESL
  for TIMSRPTDATA.MV_SR_SPEC_PGM_BIL_ESL;

prompt
prompt Creating synonym SR_SPEC_PGM_CHAP1
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_CHAP1
  for TIMSRPTDATA.MV_SR_SPEC_PGM_CHAP1;

prompt
prompt Creating synonym SR_SPEC_PGM_GT
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_GT
  for TIMSRPTDATA.MV_SR_SPEC_PGM_GT;

prompt
prompt Creating synonym SR_SPEC_PGM_OTHER
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_OTHER
  for TIMSRPTDATA.MV_SR_SPEC_PGM_OTHER;

prompt
prompt Creating synonym SR_SPEC_PGM_PREG_PUPILS
prompt ========================================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_PREG_PUPILS
  for TIMSRPTDATA.MV_SR_SPEC_PGM_PREG_PUPILS;

prompt
prompt Creating synonym SR_SPEC_PGM_SPEC_ED
prompt ====================================
prompt
create or replace synonym TIMSRPTDATA.SR_SPEC_PGM_SPEC_ED
  for TIMSRPTDATA.MV_SR_SPEC_PGM_SPEC_ED;

prompt
prompt Creating synonym SR_STU_AT_RISK
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.SR_STU_AT_RISK
  for TIMSRPTDATA.MV_SR_STU_AT_RISK;

prompt
prompt Creating synonym SR_STU_CAMPUS
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.SR_STU_CAMPUS
  for TIMSRPTDATA.MV_SR_STU_CAMPUS;

prompt
prompt Creating synonym SR_STU_DEMO
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.SR_STU_DEMO
  for TIMSRPTDATA.MV_SR_STU_DEMO;

prompt
prompt Creating synonym SR_STU_DEMO_PEIMS
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.SR_STU_DEMO_PEIMS
  for TIMSRPTDATA.MV_SR_STU_DEMO_PEIMS;

prompt
prompt Creating synonym SR_STU_ENROLL
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.SR_STU_ENROLL
  for TIMSRPTDATA.MV_SR_STU_ENROLL;

prompt
prompt Creating synonym ST_ACTIVE_CD
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.ST_ACTIVE_CD
  for TIMSRPTDATA.MV_ST_ACTIVE_CD;

prompt
prompt Creating synonym ST_ADV_MEAS
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ST_ADV_MEAS
  for TIMSRPTDATA.MV_ST_ADV_MEAS;

prompt
prompt Creating synonym ST_ATT_POST
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ST_ATT_POST
  for TIMSRPTDATA.MV_ST_ATT_POST;

prompt
prompt Creating synonym ST_DISCPLN_ACTN
prompt ================================
prompt
create or replace synonym TIMSRPTDATA.ST_DISCPLN_ACTN
  for TIMSRPTDATA.MV_ST_DISCPLN_ACTN;

prompt
prompt Creating synonym ST_IMMUNIZ_TYP
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.ST_IMMUNIZ_TYP
  for TIMSRPTDATA.MV_ST_IMMUNIZ_TYP;

prompt
prompt Creating synonym ST_LEP_MONITORING
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.ST_LEP_MONITORING
  for TIMSRPTDATA.MV_ST_LEP_MONITORING;

prompt
prompt Creating synonym ST_LOC_CD
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.ST_LOC_CD
  for TIMSRPTDATA.MV_ST_LOC_CD;

prompt
prompt Creating synonym ST_OFENS_CD
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ST_OFENS_CD
  for TIMSRPTDATA.MV_ST_OFENS_CD;

prompt
prompt Creating synonym ST_OFENS_LVL
prompt =============================
prompt
create or replace synonym TIMSRPTDATA.ST_OFENS_LVL
  for TIMSRPTDATA.MV_ST_OFENS_LVL;

prompt
prompt Creating synonym ST_REC_STATUS
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.ST_REC_STATUS
  for TIMSRPTDATA.MV_ST_REC_STATUS;

prompt
prompt Creating synonym ST_RELATION
prompt ============================
prompt
create or replace synonym TIMSRPTDATA.ST_RELATION
  for TIMSRPTDATA.MV_ST_RELATION;

prompt
prompt Creating synonym ST_REP_EXCLUSN
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.ST_REP_EXCLUSN
  for TIMSRPTDATA.MV_ST_REP_EXCLUSN;

prompt
prompt Creating synonym ST_SERIES_TYPE
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.ST_SERIES_TYPE
  for TIMSRPTDATA.MV_ST_SERIES_TYPE;

prompt
prompt Creating synonym ST_TAAS_EXEMPT
prompt ===============================
prompt
create or replace synonym TIMSRPTDATA.ST_TAAS_EXEMPT
  for TIMSRPTDATA.MV_ST_TAAS_EXEMPT;

prompt
prompt Creating synonym ST_WD_RSN
prompt ==========================
prompt
create or replace synonym TIMSRPTDATA.ST_WD_RSN
  for TIMSRPTDATA.MV_ST_WD_RSN;

prompt
prompt Creating synonym ST_YRS_USA_CD
prompt ==============================
prompt
create or replace synonym TIMSRPTDATA.ST_YRS_USA_CD
  for TIMSRPTDATA.MV_ST_YRS_USA_CD;

prompt
prompt Creating synonym WFL_USER_ACCOUNTS
prompt ==================================
prompt
create or replace synonym TIMSRPTDATA.WFL_USER_ACCOUNTS
  for ;

prompt
prompt Creating synonym WFL_USER_ACCOUNTS_APPS
prompt =======================================
prompt
create or replace synonym TIMSRPTDATA.WFL_USER_ACCOUNTS_APPS
  for ;

prompt
prompt Creating view APPLICATION_V
prompt ===========================
prompt
create or replace force view timsrptdata.application_v as
select
--ROWID as "ROW_ID",
APPLICATION_ID,
ACTIVE_FLAG,
DESCRIPTION,
APPLICATION_ALIAS
from APPLICATION
;

prompt
prompt Creating view EXECUTION_LOAD_CAMPUS_VW
prompt ======================================
prompt
create or replace force view timsrptdata.execution_load_campus_vw as
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
from execution_log elog,  campus_dim campus
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
prompt Creating view REVEAL_LEA_CONTEXTS
prompt =================================
prompt
create or replace force view timsrptdata.reveal_lea_contexts as
select "BATCH_GID","LEA_UID","LEA_ID","LEA_NAME","LEA_TYPE","ENVIRONMENT","PRODUCT_ID","PRODUCT_NAME","SRC_DATA_DIR","SRC_LOGS_DIR","TGT_DATA_DIR","TGT_LOGS_DIR","FTP_IP","FTP_PORT","FTP_LOGIN","FTP_PWD","DB_HOST","DB_PORT","DB_DATABASE","DB_SCHEMA","DB_USERNAME","DB_PASSWORD","LAST_MODIFIED" from TALEND_LEA_CONTEXTS;

prompt
prompt Creating view REVEAL_LOG_CATCHER
prompt ================================
prompt
create or replace force view timsrptdata.reveal_log_catcher as
select "MOMENT","PID","ROOT_PID","FATHER_PID","PROJECT","JOB","CONTEXT","PRIORITY","TYPE","ORIGIN","MESSAGE","CODE" from talend_log_catcher;

prompt
prompt Creating view SECURITY_QUESTION_USER_V
prompt ======================================
prompt
create or replace force view timsrptdata.security_question_user_v as
select
    user_account.user_sid
  , user_account.user_id
  , security_question.security_question
  , security_question.security_question_sid
  , user_security_question.user_response
  , security_question_type.security_question_type_name
from user_account
join user_security_question on user_security_question.user_sid = user_account.user_sid
join security_question on security_question.security_question_sid = user_security_question.security_question_sid
join security_question_type on security_question_type.security_question_type_sid = security_question.security_question_type_sid;

prompt
prompt Creating package PKG_IDMGR_USER_ACCOUNT
prompt =======================================
prompt
create or replace package timsrptdata.PKG_IDMGR_USER_ACCOUNT is
--------------------------------------------------------------
-- build MD5 function for table "USER_ACCOUNT
--------------------------------------------------------------
function FN_BUILD_USER_ACCOUNT_MD5 (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_PASSWORD                 in varchar2,
      P_PASSWORD_EXPIRATION_DATE in date      default null,
      P_PASSWORD_UPDATE_DATE     in date      default null,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_CREATED_BY               in number    default null,
      P_CREATE_DATE              in date  default null,
      P_UPDATED_BY               in number    default null,
      P_UPDATE_DATE              in date  default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_LAST_LOGIN_DATE          in date      default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_ATTEMPT_CTR              in number    default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2,
      P_REVEAL_CONTROL_PANEL     in varchar2,
      P_COL_SEP                  in varchar2  default '|'
   ) return varchar2;
--------------------------------------------------------------
-- FUNCTION: FN_GENERATE_PASSWORD
-- Purpose: Generates a 12 character strong password with
--          upper and lowercase alpha letters, 1 to 2 numbers,
--          and 1 special character
-- 07-10-13 CB orininal creation
--------------------------------------------------------------
  function FN_GENERATE_PASSWORD
    return varchar2;
--------------------------------------------------------------
-- FUNCTION: FN_GET_USR_DEFAULT_APPLICATION
-- Purpose: Retrieves the application alias for the users default
--          application.  Used to build url.
-- 08-22-13 CB orininal creation
--------------------------------------------------------------
  function FN_GET_USR_DEFAULT_APPLICATION (
      P_USER_SID IN number
    ) return varchar2;
--------------------------------------------------------------
-- create procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_INS_USER_ACCOUNT (
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_SUPER_USER               in varchar2  default 'N',
      P_REVEAL_CONTROL_PANEL     in varchar2  default 'N');
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT (
      P_USER_SID in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2  default 'N',
      P_REVEAL_CONTROL_PANEL     in varchar2  default 'N',
      P_MD5                      in varchar2  default null);
--------------------------------------------------------------
-- update procedure for table PROC_UPD_MY_PROFILE
-- purpose: allows the user to update their own profile data
--------------------------------------------------------------
   procedure PROC_UPD_MY_PROFILE (
      P_USER_SID in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_MD5                      in varchar2  default null
   );
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: Overloaded to allow updates for specific account control flags
---------------------------------------------------------------
   procedure PROC_UPD_USER_MISSED_LOGIN (
      P_USER_ID                  in varchar2,
      P_ACCOUNT_LOCKED           in varchar2  default 'N');
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE last_login_date AND ATTEMPT_CTR FOR THE
--          USER THAT JUST LOGGED IN.
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_LOGIN_DT (
      P_USER_SID                 in number);
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: Overloaded to allow update for USER_SOURCE
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_SRC (
      P_USER_SID                 in number,
      P_USER_SOURCE              in varchar2,
      P_MD5                      in varchar2  default null);
--------------------------------------------------------------
-- delete procedure for table "USER_ACCOUNT
   procedure PROC_DEL_USER_ACCOUNT (
      P_USER_SID in number);
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_PASSWORD_EXPIRATION_DATE out date,
      P_PASSWORD_UPDATE_DATE     out timestamp,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_EMPLOYEE_ID              out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_STUDENT_SSN_AUTH         out varchar2,
      P_STAFF_SSN_AUTH           out varchar2,
      P_ECON_DISADV_AUTH         out varchar2,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_REVEAL_CONTROL_PANEL     out varchar2);
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_PASSWORD_EXPIRATION_DATE out date,
      P_PASSWORD_UPDATE_DATE     out timestamp,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_EMPLOYEE_ID              out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_STUDENT_SSN_AUTH         out varchar2,
      P_STAFF_SSN_AUTH           out varchar2,
      P_ECON_DISADV_AUTH         out varchar2,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_REVEAL_CONTROL_PANEL     out varchar2,
      P_MD5                      out varchar2);
--------------------------------------------------------------
-- import procedure for TxEIS Users step 1
--------------------------------------------------------------
/*PROCEDURE PROC_IMPORT_TXEIS_USER_STEP1 (
      P_USER_ID_LIST             in varchar2 );
--------------------------------------------------------------
-- import procedure for TxEIS Users step 2
--------------------------------------------------------------
procedure PROC_IMPORT_TXEIS_USER_STEP2 (
      P_USER_SID in number,
      P_USER_ID                  in varchar2,
      P_PASSWORD                 in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default 'TxEIS-SYNC',
      P_MD5                      in varchar2  default null);*/
--------------------------------------------------------------
-- create procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_INS_USER_ROLE (
      P_USER_SID                 in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default 'N'
   );
--------------------------------------------------------------
-- update procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_UPD_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default null,
      P_MD5                      in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_DEL_USER_ROLE (
      P_USER_ROLE_SID           in number
   );
--------------------------------------------------------------
-- get procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_GET_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_USER_SID                 out number,
      P_APPLICATION_ROLE_SID     out number,
      P_DEFAULT_APPLICATION_FLAG out varchar2
   );
--------------------------------------------------------------
-- get procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_GET_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_USER_SID                 out number,
      P_APPLICATION_ROLE_SID     out number,
      P_DEFAULT_APPLICATION_FLAG out varchar2,
      P_MD5                      out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "USER_ROLE
--------------------------------------------------------------
   function FN_BUILD_USER_ROLE_MD5 (
      P_USER_ROLE_SID in number,
      P_USER_SID                 in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default null,
      P_COL_SEP                  in varchar2  default '|'
   ) return varchar2;
--------------------------------------------------------------
-- Procedure: PROCESS USER_REPORT_CATEGORY LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              REPORT_CATEGOY sids and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
procedure PROC_USER_RPT_CATEG_SHUTTLE(
      P_USER_SID in number,
      P_ORIG_RPT_CATEGORY_LIST in varchar2,
      P_NEW_RPT_CATEGORY_LIST in varchar2,
      P_USER_SOURCE IN varchar2
   );
--------------------------------------------------------------
-- Procedure: PROCESS USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              campus_master sids and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_CAMPUS_SHUTTLE(
      P_USER_SID                 in number,
      P_CAMPUS_LIST              in varchar2
   );
--------------------------------------------------------------
-- Procedure: PROCESS USER_REPORTS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              REPORT_LIST_SIDs and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_REPORTS_SHUTTLE(
       P_USER_SID     in number
      ,P_REPORTS_LIST in varchar2
   );
--------------------------------------------------------------
-- create procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_INS_USR_TXEIS_BUS_ACT_PRM (
      P_USER_SID                in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2
   );
--------------------------------------------------------------
-- update procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_UPD_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2,
      P_MD5                     in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_DEL_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number
   );
--------------------------------------------------------------
-- get procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_GET_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                out number,
      P_APP_ID                  out varchar2,
      P_FUND                    out varchar2,
      P_FUNC                    out varchar2,
      P_OBJ                     out varchar2,
      P_SOBJ                    out varchar2,
      P_ORG                     out varchar2,
      P_FSCL_YR                 out char,
      P_PGM                     out varchar2,
      P_ED_SPAN                 out char,
      P_PROJ_DTL                out varchar2
   );
--------------------------------------------------------------
-- get procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_GET_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                out number,
      P_APP_ID                  out varchar2,
      P_FUND                    out varchar2,
      P_FUNC                    out varchar2,
      P_OBJ                     out varchar2,
      P_SOBJ                    out varchar2,
      P_ORG                     out varchar2,
      P_FSCL_YR                 out char,
      P_PGM                     out varchar2,
      P_ED_SPAN                 out char,
      P_PROJ_DTL                out varchar2,
      P_MD5                     out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   function FN_BLD_TXEIS_BUS_ACCT_PRM_MD5 (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2,
      P_COL_SEP                 in varchar2  default '|'
   ) return varchar2;
--------------------------------------------------------------
-- create procedure for table USER_SECURITY_QUESTION
-- PURPOSE: since the security questions are set at 3
--          we will just delete and re-add them.
--------------------------------------------------------------
   procedure PROC_RESET_USR_SEC_QUESTIONS (
      P_USER_SID                in number,
      P_SECURITY_QUESTION_1     in number,
      P_USER_RESPONSE_1         in varchar2,
      P_SECURITY_QUESTION_2     in number,
      P_USER_RESPONSE_2         in varchar2,
      P_SECURITY_QUESTION_3     in number,
      P_USER_RESPONSE_3         in varchar2
   );
--**************************************************************--
-- PROCEDURE: PROC_SYNC_TXEIS_USER
-- PURPOSE: To synchronize all TxEIS users with the TxEIS database.
--**************************************************************--
/*   procedure PROC_SYNC_TXEIS_USER (
      P_USER_SID                in number default null
   );*/
end PKG_IDMGR_USER_ACCOUNT;
/

prompt
prompt Creating view USER_ACCOUNT_V
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.USER_ACCOUNT_V AS
SELECT
   USER_ACCOUNT.DISTRICT_SID,
   DISTRICT_DIM.DISTRICT_NAME,
   DISTRICT_DIM.PASSWORD_EXPIRE_DAYS,
   DISTRICT_DIM.PASSWORD_MAX_ATTEMPTS,
   USER_ACCOUNT.USER_SID,
   USER_ACCOUNT.USER_ID,
   USER_ACCOUNT.USER_FIRST_NAME,
   USER_ACCOUNT.USER_LAST_NAME,
   USER_ACCOUNT.PASSWORD,
   USER_ACCOUNT.PASSWORD_EXPIRATION_DATE,
   USER_ACCOUNT.PASSWORD_UPDATE_DATE,
   USER_ACCOUNT.EMAIL_ADDRESS,
   USER_ACCOUNT.CREATED_BY,
   USER_ACCOUNT.CREATE_DATE,
   USER_ACCOUNT.UPDATED_BY,
   USER_ACCOUNT.UPDATE_DATE,
   USER_ACCOUNT.EMPLOYEE_ID,
   USER_ACCOUNT.LAST_LOGIN_DATE,
   USER_ACCOUNT.FIRST_LOGIN_FLAG,
   USER_ACCOUNT.ACCOUNT_LOCKED,
   USER_ACCOUNT.ACTIVE_ACCOUNT_FLAG,
   USER_ACCOUNT.ATTEMPT_CTR,
   USER_ACCOUNT.STUDENT_SSN_AUTH,
   USER_ACCOUNT.STAFF_SSN_AUTH,
   USER_ACCOUNT.ECON_DISADV_AUTH,
   USER_ACCOUNT.USER_SOURCE,
   USER_ACCOUNT.SUPER_USER,
   USER_ACCOUNT.REVEAL_CONTROL_PANEL,
   PKG_IDMGR_USER_ACCOUNT.FN_BUILD_USER_ACCOUNT_MD5(
          P_USER_SID                 => USER_ACCOUNT.USER_SID,
          P_DISTRICT_SID             => USER_ACCOUNT.DISTRICT_SID,
          P_USER_ID                  => USER_ACCOUNT.USER_ID,
          P_PASSWORD                 => USER_ACCOUNT.PASSWORD,
          P_PASSWORD_EXPIRATION_DATE => USER_ACCOUNT.PASSWORD_EXPIRATION_DATE,
          P_PASSWORD_UPDATE_DATE     => USER_ACCOUNT.PASSWORD_UPDATE_DATE,
          P_USER_FIRST_NAME          => USER_ACCOUNT.USER_FIRST_NAME,
          P_USER_LAST_NAME           => USER_ACCOUNT.USER_LAST_NAME,
          P_EMAIL_ADDRESS            => USER_ACCOUNT.EMAIL_ADDRESS,
          P_CREATED_BY               => USER_ACCOUNT.CREATED_BY,
          P_CREATE_DATE              => USER_ACCOUNT.CREATE_DATE,
          P_UPDATED_BY               => USER_ACCOUNT.UPDATED_BY,
          P_UPDATE_DATE              => USER_ACCOUNT.UPDATE_DATE,
          P_ACCOUNT_LOCKED           => USER_ACCOUNT.ACCOUNT_LOCKED,
          P_EMPLOYEE_ID              => USER_ACCOUNT.EMPLOYEE_ID,
          P_ACTIVE_ACCOUNT_FLAG      => USER_ACCOUNT.ACTIVE_ACCOUNT_FLAG,
          P_LAST_LOGIN_DATE          => USER_ACCOUNT.LAST_LOGIN_DATE,
          P_FIRST_LOGIN_FLAG         => USER_ACCOUNT.FIRST_LOGIN_FLAG,
          P_ATTEMPT_CTR              => USER_ACCOUNT.ATTEMPT_CTR,
          P_STUDENT_SSN_AUTH         => USER_ACCOUNT.STUDENT_SSN_AUTH,
          P_STAFF_SSN_AUTH           => USER_ACCOUNT.STAFF_SSN_AUTH,
          P_ECON_DISADV_AUTH         => USER_ACCOUNT.ECON_DISADV_AUTH,
          P_USER_SOURCE              => USER_ACCOUNT.USER_SOURCE,
          P_SUPER_USER               => USER_ACCOUNT.SUPER_USER,
          p_REVEAL_CONTROL_PANEL     => USER_ACCOUNT.REVEAL_CONTROL_PANEL,
          P_COL_SEP                  => '|') as MD5
FROM
   USER_ACCOUNT
   JOIN DISTRICT_DIM ON DISTRICT_DIM.DISTRICT_SID = USER_ACCOUNT.DISTRICT_SID;

prompt
prompt Creating view USER_APPS_ROLES_V
prompt ===============================
prompt
create or replace force view timsrptdata.user_apps_roles_v as
select
    A.APPLICATION_ID
  , A.ACTIVE_FLAG
  , A.DESCRIPTION
  , RO.ROLE_SID
  , RO.ROLE
  , RO.ROLE_DESCRIPTION
  , U.USER_SID
  , USER_ID
  , U.DISTRICT_SID
  , PASSWORD_EXPIRATION_DATE
  , USER_FIRST_NAME
  , USER_LAST_NAME
  , ACCOUNT_LOCKED
  , U.FIRST_LOGIN_FLAG
  , EMPLOYEE_ID
  , ACTIVE_ACCOUNT_FLAG
  , AR.APPLICATION_ROLE_SID
  , R.USER_ROLE_SID
FROM USER_ACCOUNT U
  , USER_ROLE R
  , APPLICATION_ROLE AR
  , APPLICATION A
  , ROLE_MASTER RO
WHERE U.USER_SID = R.USER_SID
  AND  R.APPLICATION_ROLE_SID   = AR.APPLICATION_ROLE_SID
  AND A.APPLICATION_ID          = AR.APPLICATION_ID
  AND RO.ROLE_SID               =  AR.ROLE_SID
ORDER BY A.APPLICATION_ID,  U.USER_SID;

prompt
prompt Creating view V_DWS_STUDENT_MASTER
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_STUDENT_MASTER AS
SELECT STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.DISTRICT_SID,
       FIRST_NAME,
       MIDDLE_NAME,
       LAST_NAME,
       FULL_NAME,
       STUDENT_ID,
       CURRENT_GRADE_LEVEL,
       CURRENTLY_ENROLLED_FLAG,
       ADDRESS,
       ADDRESS_LINE_2,
       CITY,
       STATE_CODE,
       POSTAL_CODE,
       PHONE_NUMBER,
       SECONDARY_PHONE_NUMBER,
       ADDITIONAL_PHONE_NUMBER,
       DATE_OF_BIRTH,
       GENDER,
       ETHNICITY,
       AMERICAN_INDIAN_ALASKA_NATIVE,
       ASIAN,
       BLACK_OR_AFRICAN_AMERICAN,
       NATIVE_HAWAIIAN_PACIFIC_ISLAND,
       WHITE,
       TWO_OR_MORE_RACES,
       RACE_ETHNICITY_SHORT_DESC,
       PRIMARY_LANGUAGE,
       NINTH_GRADE_COHORT,
       LIMITED_ENGLISH_PROFICIENCY,
       LEP_FIRST_YEAR_MONITORING,
       LEP_SECOND_YEAR_MONITORING,
       IMMIGRANT,
       MIGRANT,
       ECONOMICALLY_DISADVANTAGED,
       SPECIAL_EDUCATION,
       MEAL_ELIGIBILITY,
       PRIMARY_DISABILITY,
       SECONDARY_DISABILITY,
       TERTIARY_DISABILITY,
       DATE_ENTERED_NINTH_GRADE,
       STUDENT_PHOTO,
       RACE_ETHNICITY_KEY,
       CAMPUS_SECURITY_KEY,
       DISTRICT_SECURITY_KEY,
       STUDENT_KEY,
       STUDENT_DIM.LAST_UPDATE,
       STUDENT_DIM.CAMPUS_SID,
       STUDENT_DIM.CAMPUS_ID AS CURRENTLY_ENROLLED_CAMPUS_ID,
       CAMPUS_DIM.CAMPUS_NAME AS CURRENTLY_ENROLLED_CAMPUS_NAME,
       case
         when STUDENT_DIM.USER_SID IS NULL then NULL
         else initcap(USER_ACCOUNT.USER_LAST_NAME)||', '||initcap(USER_ACCOUNT.USER_FIRST_NAME)
       end AS STUDENT_CHAMPION,
       STUDENT_DIM.USER_SID AS STUDENT_CHAMPION_SID
  FROM STUDENT_DIM
  LEFT JOIN CAMPUS_DIM ON CAMPUS_DIM.CAMPUS_SID = STUDENT_DIM.CAMPUS_SID
  LEFT JOIN USER_ACCOUNT ON USER_ACCOUNT.USER_SID = STUDENT_DIM.USER_SID
  JOIN USER_STUDENT_SECURITY
    ON STUDENT_DIM.STUDENT_SID =
       DECODE(USER_STUDENT_SECURITY.STUDENT_SID,
              -9999,
              STUDENT_DIM.STUDENT_SID,
              USER_STUDENT_SECURITY.STUDENT_SID)
   AND USER_STUDENT_SECURITY.DISTRICT_SID = STUDENT_DIM.DISTRICT_SID
   AND USER_STUDENT_SECURITY.USER_ID =
       SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

prompt
prompt Creating view V_DWS_ALL_RISK_FACTORS
prompt ====================================
prompt
create or replace force view timsrptdata.v_dws_all_risk_factors as
select
        STUDENT_DIM.STUDENT_SID,
        STUDENT_DIM.STUDENT_ID,
        STUDENT_DIM.FULL_NAME,
        STUDENT_DIM.CURRENT_GRADE_LEVEL,
        RISK_FACTOR.RISK_FACTOR_NAME,
        RISK_FACTOR.RISK_FACTOR_TYPE,
        RISK_FACTOR.RISK_FACTOR_DURATION,
        T6.DATE_ID RISK_FACTOR_FLAG_DT,
        T6.SCHOOL_YEAR SCHOOL_YEAR_START,
        T7.DATE_ID RISK_FACTOR_END_DT,
        T7.SCHOOL_YEAR SCHOOL_YEAR_END
  from
       RISK_FACTOR                RISK_FACTOR,
       V_DWS_STUDENT_MASTER       STUDENT_DIM,
       DATE_DIM                   T6,
       DATE_DIM                   T7,
       MERGED_STUDENT_RISK_FACTOR MERGED_STUDENT_RISK_FACTOR
 where RISK_FACTOR.RISK_FACTOR_TYPE = 'Primary'
   and MERGED_STUDENT_RISK_FACTOR.STUDENT_SID =
       STUDENT_DIM.STUDENT_SID
   and MERGED_STUDENT_RISK_FACTOR.RISK_FACTOR_SID =
       RISK_FACTOR.RISK_FACTOR_SID
   and MERGED_STUDENT_RISK_FACTOR.FLAG_DATE_SID = T6.DATE_SID
   and MERGED_STUDENT_RISK_FACTOR.END_DATE_SID = T7.DATE_SID
   --and "STUDENT_DIM"."STUDENT_SID" = :P2_STUDENT_SID

/* original sql -
with "T" as
 (select "EXECUTION_LOAD_CAMPUS_VW"."DISTRICT_ID" "District_Id",
         "EXECUTION_LOAD_CAMPUS_VW"."CAMPUS_SID"  "CAMPUS_SID",
         "EXECUTION_LOAD_CAMPUS_VW"."CAMPUS_ID"   "Campus_Id",
         "EXECUTION_LOAD_CAMPUS_VW"."CAMPUS_NAME" "Campus_Name"
    from "EXECUTION_LOAD_CAMPUS_VW" "EXECUTION_LOAD_CAMPUS_VW")
select distinct "T"."District_Id" "District_Id",
                "T"."Campus_Id" "Campus_Id",
                "RISK_FACTOR"."RISK_FACTOR_NAME" "Risk_Factor_Name",
                "RISK_FACTOR"."RISK_FACTOR_TYPE" "Risk_Factor_Type",
                "RISK_FACTOR"."RISK_FACTOR_DURATION" "Risk_Factor_Duration",
                "T"."Campus_Name" "Campus_Name",
                "STUDENT_DIM"."FULL_NAME" "Full_Name",
                "STUDENT_DIM"."STUDENT_ID" "Student_ID",
                "STUDENT_DIM"."CURRENT_GRADE_LEVEL" "Current_Grade_Level",
                "T6"."DATE_ID" "Risk Factor Flag Date",
                "T6"."SCHOOL_YEAR" "SCHOOL_YEAR_START",
                CASE
                  WHEN "T7"."DATE_ID" > (sysdate) THEN
                   '<span style="font-weight: bold;">' || T7.DATE_ID
                  ELSE
                   T7.DATE_ID || '</span>'
                END AS "Risk Factor End Date",
                "T7"."SCHOOL_YEAR" "SCHOOL_YEAR"
  from "T",
       "RISK_FACTOR"                "RISK_FACTOR",
       "STUDENT_DIM"                "STUDENT_DIM",
       "DATE_DIM"                   "T6",
       "DATE_DIM"                   "T7",
       "MERGED_STUDENT_RISK_FACTOR" "MERGED_STUDENT_RISK_FACTOR",
       USER_STUDENT_SECURITY
 where "RISK_FACTOR"."RISK_FACTOR_TYPE" = 'Primary'
   and "STUDENT_DIM"."STUDENT_SID" = :P2_STUDENT_SID
   and "STUDENT_DIM"."CAMPUS_SID" = "T"."CAMPUS_SID"
   and "MERGED_STUDENT_RISK_FACTOR"."STUDENT_SID" =
       "STUDENT_DIM"."STUDENT_SID"
   and "MERGED_STUDENT_RISK_FACTOR"."RISK_FACTOR_SID" =
       "RISK_FACTOR"."RISK_FACTOR_SID"
   and "MERGED_STUDENT_RISK_FACTOR"."FLAG_DATE_SID" = "T6"."DATE_SID"
   and "MERGED_STUDENT_RISK_FACTOR"."END_DATE_SID" = "T7"."DATE_SID"
   and "STUDENT_DIM".STUDENT_SID =
       DECODE(USER_STUDENT_SECURITY.STUDENT_SID,
              -9999,
              STUDENT_DIM.STUDENT_SID,
              USER_STUDENT_SECURITY.STUDENT_SID)
   AND "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
   and USER_STUDENT_SECURITY.USER_ID = :G_USER_NAME
*/
;

prompt
prompt Creating view V_DWS_AS_OF_DATE
prompt ==============================
prompt
create or replace force view timsrptdata.v_dws_as_of_date as
select max(EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME) As_of_Date
   from EXECUTION_LOAD_CAMPUS_VW
     join CAMPUS_DIM on EXECUTION_LOAD_CAMPUS_VW.CAMPUS_SID=CAMPUS_DIM.CAMPUS_SID
     join user_student_security on  CAMPUS_DIM.district_sid = user_student_security.district_sid
  where user_student_security.user_id = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

prompt
prompt Creating view V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt ==========================================
prompt
create or replace force view timsrptdata.v_dws_campus_risk_factor_sum as
select
       a.campus_id,
       a.campus_name,
       decode(sum(a."Attendance"),0,NULL,sum(a."Attendance")) ATTENDANCE,
       decode(sum(a."Semester_Attendance"),0,NULL,sum(a."Semester_Attendance")) SEMESTER_ATTENDANCE,
       decode(sum(a."Core_Failure"),0,NULL,sum(a."Core_Failure")) CORE_FAILURE,
       decode(sum(a."Sem_Core_Failure"),0,NULL,sum(a."Sem_Core_Failure")) SEM_CORE_FAILURE,
       decode(sum(a."NonCore_Failure"),0,NULL,sum(a."NonCore_Failure")) NONCORE_FAILURE,
       decode(sum(a."Sem_NonCore_Failure"),0,NULL,sum(a."Sem_NonCore_Failure")) SEM_NONCORE_FAILURE,
       decode(sum(a."Discipline"),0,NULL,sum(a."Discipline")) DISCIPLINE,
       decode(sum(a."Grade_6-8_Retention"),0,NULL,sum(a."Grade_6-8_Retention")) GRADE_6_8_RETENTION,
       decode(sum(a."9th_Grade_Cohort"),0,NULL,sum(a."9th_Grade_Cohort")) NINTH_GRADE_COHORT,
       decode(sum(a."Deficient_Credits"),0,NULL,sum(a."Deficient_Credits")) DEFICIENT_CREDITS
  from (select "T6"."CAMPUS_ID"                  "CAMPUS_ID",
               "T6"."CAMPUS_NAME"                "CAMPUS_NAME",
               "RISK_FACTOR"."RISK_FACTOR_NAME"  "RISK_FACTOR_NAME",
               "RISK_FACTOR"."RISK_FACTOR_ORDER" "RISK_FACTOR_ORDER",
               "STUDENT_DIM"."STUDENT_ID"        "STUDENT_ID",
               "T"."DATE_ID"                     "C3",
               "T7"."DATE_ID" "DATE_ID",
               "T6"."RUN_DATE" "RUN_DATE",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Attendance',
                             0))) as "Attendance",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Semester Attendance',
                             0))) as "Semester_Attendance",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Core Failure',
                             0))) as "Core_Failure",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Deficient Credits',
                             0))) as "Deficient_Credits",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'GPA',
                             0))) as "GPA",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'NonCore Failure',
                             0))) as "NonCore_Failure",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Sem Core Failure',
                             0))) as "Sem_Core_Failure",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Sem NonCore Failure',
                             0))) as "Sem_NonCore_Failure",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Discipline',
                             0))) as "Discipline",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Grade 6-8 Retention',
                             0))) as "Grade_6-8_Retention",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             '9th Grade Cohort',
                             0))) as "9th_Grade_Cohort",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'LEP',
                             0))) as "LEP",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Low SES',
                             0))) as "Low_SES",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Special Education',
                             0))) as "Special_Education",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Immigrant',
                             0))) as "Immigrant",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Migrant',
                             0))) as "Migrant",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'LEP 1st Yr Monitor',
                             0))) as "LEP_1st_Yr_Monitor",
               (count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",
                             'Attendance',
                             0))) as "LEP_2nd_Yr_Monitor"
           from "V_DWS_STUDENT_MASTER"      "STUDENT_DIM",
               "RISK_FACTOR"                "RISK_FACTOR",
               "DATE_DIM"                   "T",
               "EXECUTION_LOAD_CAMPUS_VW"   "T6",
               "DATE_DIM"                   "T7",
               "MERGED_STUDENT_RISK_FACTOR" "MERGED_STUDENT_RISK_FACTOR"
         where
           "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG" = 'Yes'
           and trunc("T6"."RUN_DATE") between trunc("T7"."DATE_ID") and
               trunc("T"."DATE_ID")
           and "MERGED_STUDENT_RISK_FACTOR"."STUDENT_SID" =
               "STUDENT_DIM"."STUDENT_SID"
           and "MERGED_STUDENT_RISK_FACTOR"."RISK_FACTOR_SID" =
               "RISK_FACTOR"."RISK_FACTOR_SID"
           and "MERGED_STUDENT_RISK_FACTOR"."FLAG_DATE_SID" =
               "T7"."DATE_SID"
           and "MERGED_STUDENT_RISK_FACTOR"."END_DATE_SID" = "T"."DATE_SID"
           and "STUDENT_DIM"."CAMPUS_SID" = "T6"."CAMPUS_SID"
         group by "T6"."CAMPUS_ID",
                  "T6"."CAMPUS_NAME",
                  "RISK_FACTOR"."RISK_FACTOR_NAME",
                  "RISK_FACTOR"."RISK_FACTOR_ORDER",
                  "STUDENT_DIM"."STUDENT_ID",
                  "T"."DATE_ID",
                  "T6"."EXECUTION_START_DATE",
                  "T7"."DATE_ID",
                  "T6"."RUN_DATE"
         ) a
 group by a.campus_id, a.campus_name;

prompt
prompt Creating view V_DWS_CHAMPIONS_LIST
prompt ==================================
prompt
create or replace force view timsrptdata.v_dws_champions_list as
select
initcap(user_last_name)||', '||initcap(user_first_name) AS USER_NAME
,user_account.user_sid
from user_account
join user_role on user_role.user_sid = user_account.user_sid
join application_role on application_role.application_role_sid = user_role.application_role_sid
join application on application.application_id = application_role.application_id
where application.application_alias = 'DWS' and user_account.user_sid <> 1;

prompt
prompt Creating view V_DWS_CREDITS_DETAIL
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_CREDITS_DETAIL AS
SELECT STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.GENDER,
       STUDENT_DIM.NINTH_GRADE_COHORT ,
       STUDENT_DIM.CURRENT_GRADE_LEVEL ,
       STUDENT_DIM.CURRENTLY_ENROLLED_FLAG ,
       STUDENT_DIM.DATE_OF_BIRTH ,
       STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY ,
       STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC ,
       STUDENT_DIM.MIGRANT,
       STUDENT_DIM.IMMIGRANT,
       STUDENT_DIM.STUDENT_CHAMPION,
       DATE_DIM.DATE_ID SEM_END_DT,
       DATE_DIM.SCHOOL_YEAR ,
       DATE_DIM.SEMESTER ,
       COURSE_DIM.COURSE_DESCRIPTION ,
       CAMPUS_DIM.CAMPUS_ID COURSE_CAMPUS_ID,
       CAMPUS_DIM.CAMPUS_NAME COURSE_CAMPUS_NAME,
       STUDENT_CREDIT_FACT.CREDITS_EARNED,
       STUDENT_CREDIT_SUMMARY_MV.TOTAL_STUDENT_CREDITS CREDITS_TOTAL,
       STUDENT_CREDIT_SUMMARY_MV.ON_TRACK_CREDITS CREDITS_ON_TRACK,
       STUDENT_CREDIT_SUMMARY_MV.DEF_CREDIT_FLAG
  FROM STUDENT_CREDIT_FACT
 INNER JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
    ON STUDENT_CREDIT_FACT.STUDENT_SID = STUDENT_DIM.STUDENT_SID
 INNER JOIN COURSE_DIM
    ON STUDENT_CREDIT_FACT.COURSE_SID = COURSE_DIM.COURSE_SID
 INNER JOIN DATE_DIM
    ON STUDENT_CREDIT_FACT.DATE_SID = DATE_DIM.DATE_SID
 INNER JOIN CAMPUS_DIM
    ON STUDENT_CREDIT_FACT.CAMPUS_SID = CAMPUS_DIM.CAMPUS_SID
 LEFT JOIN STUDENT_CREDIT_SUMMARY_MV
    ON STUDENT_CREDIT_FACT.STUDENT_SID = STUDENT_CREDIT_SUMMARY_MV.STUDENT_SID;

prompt
prompt Creating view V_DWS_CREDITS_SUMMARY
prompt ===================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_CREDITS_SUMMARY AS
SELECT
      STUDENT_CREDIT_SUMMARY_MV.STUDENT_SID,
      STUDENT_DIM.STUDENT_ID,
      STUDENT_DIM.FULL_NAME,
      STUDENT_DIM.GENDER,
      STUDENT_DIM.NINTH_GRADE_COHORT,
      STUDENT_DIM.CURRENT_GRADE_LEVEL STU_DIM_GRADE_LEVEL,
      STUDENT_DIM.CURRENTLY_ENROLLED_FLAG,
      STUDENT_DIM.DATE_OF_BIRTH,
      STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
      STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
      STUDENT_DIM.MIGRANT,
      STUDENT_DIM.IMMIGRANT,
      STUDENT_CREDIT_SUMMARY_MV.CURRENT_GRADE_LEVEL,
      STUDENT_CREDIT_SUMMARY_MV.TOTAL_STUDENT_CREDITS,
      STUDENT_CREDIT_SUMMARY_MV.ON_TRACK_CREDITS,
      STUDENT_CREDIT_SUMMARY_MV.DEF_CREDIT_FLAG,
      STUDENT_CREDIT_SUMMARY_MV.AS_OF_DATE
FROM STUDENT_CREDIT_SUMMARY_MV
JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
      ON STUDENT_CREDIT_SUMMARY_MV.STUDENT_SID = STUDENT_DIM.STUDENT_SID;

prompt
prompt Creating view V_DWS_CURR_RISK_FACTORS
prompt =====================================
prompt
create or replace force view timsrptdata.v_dws_curr_risk_factors as
select distinct T0.C22 STUDENT_SID,
                T0.C0  STUDENT_ID,
                T0.C1  DATE_ID,
                T0.C2  SCHOOL_YEAR,
                T0.C3  ATTENDANCE_FLAG,
                T0.C4  SEMESTER_ATTENDANCE,
                T0.C5  LEP_FIRST_YEAR_MONITORING,
                T0.C6  LEP_SECOND_YEAR_MONITORING,
                T0.C7  SPECIAL_EDUCATION,
                T0.C8  DISCIPLINE,
                T0.C9  GPA,
                T0.C10 DEFICIENT_CREDITS,
                T0.C11 ECONOMICALLY_DISADVANTAGED,
                T0.C12 CORE_FAILURE,
                T0.C13 NONCORE_FAILURE,
                T0.C14 GRADE_6_8_RETENTION,
                T0.C15 C_9TH_GRADE_COHORT,
                T0.C16 IMMIGRANT,
                T0.C17 MIGRANT,
                T0.C18 LIMITED_ENGLISH_PROFICIENCY,
                T0.C19 SEM_CORE_FAILURE,
                T0.C20 SEM_NONCORE_FAILURE
  from (select "STUDENT_DIM"."STUDENT_ID" "C0",
               "DATE_DIM"."DATE_ID" "C1",
               "DATE_DIM"."SCHOOL_YEAR" "C2",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."ATTENDANCE_FLAG" "C3",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG" "C4",
               "STUDENT_DIM"."LEP_FIRST_YEAR_MONITORING" "C5",
               "STUDENT_DIM"."LEP_SECOND_YEAR_MONITORING" "C6",
               case
                 when "STUDENT_DIM"."SPECIAL_EDUCATION" = ' ' or
                      "STUDENT_DIM"."SPECIAL_EDUCATION" is null then
                  'No'
                 else
                  "STUDENT_DIM"."SPECIAL_EDUCATION"
               end "C7",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG" "C8",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG" "C9",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG" "C10",
               "STUDENT_DIM"."ECONOMICALLY_DISADVANTAGED" "C11",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG" "C12",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG" "C13",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG" "C14",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG" "C15",
               case
                 when "STUDENT_DIM"."IMMIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."IMMIGRANT"
               end "C16",
               case
                 when "STUDENT_DIM"."MIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."MIGRANT"
               end "C17",
               "STUDENT_DIM"."LIMITED_ENGLISH_PROFICIENCY" "C18",
               case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG"
               end "C19",
               case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG"
               end "C20",
               max("DATE_DIM"."DATE_ID") over(partition by "STUDENT_DIM"."STUDENT_ID", "DATE_DIM"."DATE_ID", "DATE_DIM"."SCHOOL_YEAR", "STUDENT_RISK_FACTOR_SNAPSHOT"."ATTENDANCE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG", "STUDENT_DIM"."LEP_FIRST_YEAR_MONITORING", "STUDENT_DIM"."LEP_SECOND_YEAR_MONITORING",case
                 when "STUDENT_DIM"."SPECIAL_EDUCATION" = ' ' or
                      "STUDENT_DIM"."SPECIAL_EDUCATION" is null then
                  'No'
                 else
                  "STUDENT_DIM"."SPECIAL_EDUCATION"
               end, "STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG", "STUDENT_DIM"."ECONOMICALLY_DISADVANTAGED", "STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG",case
                 when "STUDENT_DIM"."IMMIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."IMMIGRANT"
               end,case
                 when "STUDENT_DIM"."MIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."MIGRANT"
               end, "STUDENT_DIM"."LIMITED_ENGLISH_PROFICIENCY",case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG"
               end,case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG"
               end) "C21",
               STUDENT_DIM.STUDENT_SID "C22"
          from
               "V_DWS_STUDENT_MASTER"         "STUDENT_DIM",
               "DATE_DIM"                     "DATE_DIM",
               "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT"
         where
           --"STUDENT_DIM"."STUDENT_SID" = 74793 and
           "STUDENT_DIM"."STUDENT_SID" =
               "STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID"
           and "DATE_DIM"."DATE_SID" =
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID") "T0"
 where "T0"."C1" = "T0"."C21"

 /* original sql -
 select distinct "T0"."C0"  "Student_ID1",
                "T0"."C0"  "Student_ID",
                "T0"."C1"  "Date_ID",
                "T0"."C2"  "School_Year",
                "T0"."C3"  "Attendance_Flag",
                "T0"."C4"  "Semester_Attendance",
                "T0"."C5"  "LEP_First_Year_Monitoring",
                "T0"."C6"  "LEP_Second_Year_Monitoring",
                "T0"."C7"  "Special_Education",
                "T0"."C8"  "Discipline",
                "T0"."C9"  "GPA",
                "T0"."C10" "Deficient_Credits",
                "T0"."C11" "Economically_Disadvantaged",
                "T0"."C12" "Core_Failure",
                "T0"."C13" "NonCore_Failure",
                "T0"."C14" "Grade_6_8_Retention",
                "T0"."C15" "C_9th_Grade_Cohort",
                "T0"."C16" "Immigrant",
                "T0"."C17" "Migrant",
                "T0"."C18" "Limited_English_Proficiency",
                "T0"."C19" "Sem_Core_Failure",
                "T0"."C20" "Sem_NonCore_Failure"
  from (select "STUDENT_DIM"."STUDENT_ID" "C0",
               "DATE_DIM"."DATE_ID" "C1",
               "DATE_DIM"."SCHOOL_YEAR" "C2",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."ATTENDANCE_FLAG" "C3",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG" "C4",
               "STUDENT_DIM"."LEP_FIRST_YEAR_MONITORING" "C5",
               "STUDENT_DIM"."LEP_SECOND_YEAR_MONITORING" "C6",
               case
                 when "STUDENT_DIM"."SPECIAL_EDUCATION" = ' ' or
                      "STUDENT_DIM"."SPECIAL_EDUCATION" is null then
                  'No'
                 else
                  "STUDENT_DIM"."SPECIAL_EDUCATION"
               end "C7",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG" "C8",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG" "C9",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG" "C10",
               "STUDENT_DIM"."ECONOMICALLY_DISADVANTAGED" "C11",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG" "C12",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG" "C13",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG" "C14",
               "STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG" "C15",
               case
                 when "STUDENT_DIM"."IMMIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."IMMIGRANT"
               end "C16",
               case
                 when "STUDENT_DIM"."MIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."MIGRANT"
               end "C17",
               "STUDENT_DIM"."LIMITED_ENGLISH_PROFICIENCY" "C18",
               case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG"
               end "C19",
               case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG"
               end "C20",
               max("DATE_DIM"."DATE_ID") over(partition by "STUDENT_DIM"."STUDENT_ID", "DATE_DIM"."DATE_ID", "DATE_DIM"."SCHOOL_YEAR", "STUDENT_RISK_FACTOR_SNAPSHOT"."ATTENDANCE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG", "STUDENT_DIM"."LEP_FIRST_YEAR_MONITORING", "STUDENT_DIM"."LEP_SECOND_YEAR_MONITORING",case
                 when "STUDENT_DIM"."SPECIAL_EDUCATION" = ' ' or
                      "STUDENT_DIM"."SPECIAL_EDUCATION" is null then
                  'No'
                 else
                  "STUDENT_DIM"."SPECIAL_EDUCATION"
               end, "STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG", "STUDENT_DIM"."ECONOMICALLY_DISADVANTAGED", "STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG", "STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG",case
                 when "STUDENT_DIM"."IMMIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."IMMIGRANT"
               end,case
                 when "STUDENT_DIM"."MIGRANT" = ' ' then
                  'No'
                 else
                  "STUDENT_DIM"."MIGRANT"
               end, "STUDENT_DIM"."LIMITED_ENGLISH_PROFICIENCY",case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG"
               end,case
                 when "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" = ' ' or
                      "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG" is null then
                  'No'
                 else
                  "STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG"
               end) "C21"
          from USER_STUDENT_SECURITY,
               "STUDENT_DIM"                  "STUDENT_DIM",
               "DATE_DIM"                     "DATE_DIM",
               "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT"
         where "STUDENT_DIM"."STUDENT_SID" = :P2_STUDENT_SID
           and "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG" = 'Yes'
           and "STUDENT_DIM"."STUDENT_SID" =
               "STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID"
           and "DATE_DIM"."DATE_SID" =
               "STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID"
           and "STUDENT_DIM".STUDENT_SID =
               DECODE(USER_STUDENT_SECURITY.STUDENT_SID,
                      -9999,
                      STUDENT_DIM.STUDENT_SID,
                      USER_STUDENT_SECURITY.STUDENT_SID)
           AND "STUDENT_DIM".DISTRICT_SID =
               USER_STUDENT_SECURITY.DISTRICT_SID
           and USER_STUDENT_SECURITY.USER_ID = :G_USER_NAME) "T0"
 where "T0"."C1" = "T0"."C21"
 */
;

prompt
prompt Creating view V_DWS_DISC_ACT_DETAIL
prompt ===================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_DISC_ACT_DETAIL AS
SELECT STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.GENDER,
       STUDENT_DIM.NINTH_GRADE_COHORT,
       STUDENT_DIM.CURRENT_GRADE_LEVEL,
       STUDENT_DIM.CURRENTLY_ENROLLED_FLAG,
       STUDENT_DIM.DATE_OF_BIRTH,
       STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
       STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
       STUDENT_DIM.MIGRANT,
       STUDENT_DIM.IMMIGRANT,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_ID,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_NAME,
       STUDENT_DIM.STUDENT_CHAMPION,
       STUDENT_DIM.SPECIAL_EDUCATION,
       DATE_DIM.DATE_ID ACTION_DT,
       DATE_DIM.SCHOOL_YEAR,
       DATE_DIM.SEMESTER,
       DISCIPLINE_DIM.DISCIPLINE_CODE,
       DISCIPLINE_DIM.DISCIPLINE_DESCRIPTION,
       ACTION_LENGTH_DIFF_REASON_DIM.ACTION_LENGTH_DIFF_REASON,
       STUDENT_DISCIPLINE_ACTION_FACT.INCIDENT_NUMBER,
       STUDENT_DISCIPLINE_ACTION_FACT.ACTION_ASSIGNED_DAYS,
       STUDENT_DISCIPLINE_ACTION_FACT.ACTION_ACTUAL_DAYS
 FROM STUDENT_DISCIPLINE_ACTION_FACT
 INNER JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
    ON STUDENT_DISCIPLINE_ACTION_FACT.STUDENT_SID = STUDENT_DIM.STUDENT_SID
 INNER JOIN DATE_DIM
    ON STUDENT_DISCIPLINE_ACTION_FACT.DATE_SID = DATE_DIM.DATE_SID
 INNER JOIN CAMPUS_DIM
    ON STUDENT_DISCIPLINE_ACTION_FACT.CAMPUS_SID = CAMPUS_DIM.CAMPUS_SID
 INNER JOIN DISCIPLINE_DIM
    ON STUDENT_DISCIPLINE_ACTION_FACT.DISCIPLINE_SID = DISCIPLINE_DIM.DISCIPLINE_SID
 INNER JOIN ACTION_LENGTH_DIFF_REASON_DIM
    ON STUDENT_DISCIPLINE_ACTION_FACT.ACTION_LENGTH_DIFF_REASON_SID = ACTION_LENGTH_DIFF_REASON_DIM.ACTION_LENGTH_DIFF_REASON_SID;

prompt
prompt Creating view V_DWS_DISC_INC_DETAIL
prompt ===================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_DISC_INC_DETAIL AS
SELECT STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.GENDER,
       STUDENT_DIM.NINTH_GRADE_COHORT,
       STUDENT_DIM.CURRENT_GRADE_LEVEL,
       STUDENT_DIM.CURRENTLY_ENROLLED_FLAG,
       STUDENT_DIM.DATE_OF_BIRTH,
       STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
       STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
       STUDENT_DIM.MIGRANT,
       STUDENT_DIM.IMMIGRANT,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_ID,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_NAME,
       STUDENT_DIM.STUDENT_CHAMPION,
       STUDENT_DIM.SPECIAL_EDUCATION,
       DATE_DIM.DATE_ID INCIDENT_DT,
       DATE_DIM.SCHOOL_YEAR,
       DATE_DIM.SEMESTER,
       INCIDENT_BEHAVIOR_DIM.INCIDENT_BEHAVIOR_CODE,
       INCIDENT_BEHAVIOR_DIM.INCIDENT_BEHAVIOR_DESCRIPTION,
       INCIDENT_BEHAVIOR_DIM.INCIDENT_BEHAVIOR_CATEGORY,
       INCIDENT_LOCATION_DIM.INCIDENT_LOCATION,
       STU_DISCIPLINE_INCIDENT_FACT.INCIDENT_NUMBER,
       STU_DISCIPLINE_INCIDENT_FACT.INCIDENT_TIME
 FROM STU_DISCIPLINE_INCIDENT_FACT
 INNER JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
    ON STU_DISCIPLINE_INCIDENT_FACT.STUDENT_SID = STUDENT_DIM.STUDENT_SID
 INNER JOIN DATE_DIM
    ON STU_DISCIPLINE_INCIDENT_FACT.DATE_SID = DATE_DIM.DATE_SID
 INNER JOIN CAMPUS_DIM
    ON STU_DISCIPLINE_INCIDENT_FACT.CAMPUS_SID = CAMPUS_DIM.CAMPUS_SID
 INNER JOIN INCIDENT_BEHAVIOR_DIM
    ON STU_DISCIPLINE_INCIDENT_FACT.INCIDENT_BEHAVIOR_SID = INCIDENT_BEHAVIOR_DIM.INCIDENT_BEHAVIOR_SID
 INNER JOIN INCIDENT_LOCATION_DIM
    ON STU_DISCIPLINE_INCIDENT_FACT.INCIDENT_LOCATION_SID = INCIDENT_LOCATION_DIM.INCIDENT_LOCATION_SID;

prompt
prompt Creating view V_DWS_DISC_INC_ACT_DETAIL
prompt =======================================
prompt
create or replace force view timsrptdata.v_dws_disc_inc_act_detail as
select
       V_DWS_DISC_INC_DETAIL.STUDENT_SID,
       V_DWS_DISC_INC_DETAIL.STUDENT_ID,
       V_DWS_DISC_INC_DETAIL.FULL_NAME STUDENT_NAME,
       V_DWS_DISC_INC_DETAIL.GENDER,
       V_DWS_DISC_INC_DETAIL.NINTH_GRADE_COHORT,
       V_DWS_DISC_INC_DETAIL.CURRENT_GRADE_LEVEL,
       V_DWS_DISC_INC_DETAIL.CURRENTLY_ENROLLED_FLAG,
       V_DWS_DISC_INC_DETAIL.DATE_OF_BIRTH,
       V_DWS_DISC_INC_DETAIL.LIMITED_ENGLISH_PROFICIENCY,
       V_DWS_DISC_INC_DETAIL.RACE_ETHNICITY_SHORT_DESC,
       V_DWS_DISC_INC_DETAIL.MIGRANT,
       V_DWS_DISC_INC_DETAIL.IMMIGRANT,
       V_DWS_DISC_INC_DETAIL.CURRENTLY_ENROLLED_CAMPUS_ID,
       V_DWS_DISC_INC_DETAIL.CURRENTLY_ENROLLED_CAMPUS_NAME,
       V_DWS_DISC_INC_DETAIL.STUDENT_CHAMPION,
       V_DWS_DISC_INC_DETAIL.SPECIAL_EDUCATION,
       V_DWS_DISC_INC_DETAIL.INCIDENT_DT INCIDENT_DATE,
       V_DWS_DISC_INC_DETAIL.SCHOOL_YEAR,
       V_DWS_DISC_INC_DETAIL.SEMESTER,
       V_DWS_DISC_INC_DETAIL.INCIDENT_BEHAVIOR_CODE,
       V_DWS_DISC_INC_DETAIL.INCIDENT_BEHAVIOR_DESCRIPTION,
       V_DWS_DISC_INC_DETAIL.INCIDENT_BEHAVIOR_CATEGORY,
       V_DWS_DISC_INC_DETAIL.INCIDENT_LOCATION,
       V_DWS_DISC_INC_DETAIL.INCIDENT_NUMBER,
       V_DWS_DISC_INC_DETAIL.INCIDENT_TIME,
       V_DWS_DISC_ACT_DETAIL.ACTION_DT ACTION_DATE,
       V_DWS_DISC_ACT_DETAIL.DISCIPLINE_CODE,
       V_DWS_DISC_ACT_DETAIL.DISCIPLINE_DESCRIPTION,
       V_DWS_DISC_ACT_DETAIL.ACTION_LENGTH_DIFF_REASON,
       V_DWS_DISC_ACT_DETAIL.ACTION_ASSIGNED_DAYS,
       V_DWS_DISC_ACT_DETAIL.ACTION_ACTUAL_DAYS
from V_DWS_DISC_INC_DETAIL
LEFT JOIN V_DWS_DISC_ACT_DETAIL
  ON V_DWS_DISC_INC_DETAIL.STUDENT_SID = V_DWS_DISC_ACT_DETAIL.STUDENT_SID
 AND V_DWS_DISC_INC_DETAIL.INCIDENT_NUMBER = V_DWS_DISC_ACT_DETAIL.INCIDENT_NUMBER;

prompt
prompt Creating view V_DWS_ENROLLMENT_HISTORY
prompt ======================================
prompt
create or replace force view timsrptdata.v_dws_enrollment_history as
select T.SCHOOL_YEAR,
       CAMPUS_DIM.DISTRICT_ID,
       CAMPUS_DIM.DISTRICT_NAME,
       GRADE_LEVEL_DIM.GRADE_LEVEL,
       CAMPUS_DIM.CAMPUS_NAME,
       STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       trunc(T.DATE_ID) ENTRY_DT,
       trunc(T5.DATE_ID) WITHDRAWAL_DT,
       STUDENT_ENROLLMENT_FACT.DAYS_ENROLLED
  from ((((CAMPUS_DIM CAMPUS_DIM INNER JOIN STUDENT_ENROLLMENT_FACT
        STUDENT_ENROLLMENT_FACT on
        CAMPUS_DIM.CAMPUS_SID =
        STUDENT_ENROLLMENT_FACT.CAMPUS_SID) INNER JOIN V_DWS_STUDENT_MASTER
        STUDENT_DIM on STUDENT_DIM.STUDENT_SID =
        STUDENT_ENROLLMENT_FACT.STUDENT_SID) INNER JOIN
        GRADE_LEVEL_DIM GRADE_LEVEL_DIM on
        GRADE_LEVEL_DIM.GRADE_LEVEL_SID =
        STUDENT_ENROLLMENT_FACT.GRADE_LEVEL_SID) INNER JOIN DATE_DIM T on
        STUDENT_ENROLLMENT_FACT.ENTRY_DATE_SID = T.DATE_SID)
  LEFT OUTER JOIN DATE_DIM T5
    on STUDENT_ENROLLMENT_FACT.WITHDRAWAL_DATE_SID = T5.DATE_SID
-- where "STUDENT_DIM"."STUDENT_SID" = 74793

/* original sql -
select "T"."SCHOOL_YEAR" "SCHOOL_YEAR",
       "CAMPUS_DIM"."DISTRICT_ID" "District_Id",
       "CAMPUS_DIM"."DISTRICT_NAME" "District_Name",
       "GRADE_LEVEL_DIM"."GRADE_LEVEL" "Grade_Level",
       "CAMPUS_DIM"."CAMPUS_NAME" "Location_Desc",
       "STUDENT_DIM"."STUDENT_ID" "Student_ID",
       "STUDENT_DIM"."FULL_NAME" "Full_Name",
       trunc("T"."DATE_ID") "Entry_Date",
       trunc("T5"."DATE_ID") "Withdrawal_Date",
       "STUDENT_ENROLLMENT_FACT"."DAYS_ENROLLED" "Days_Enrolled"
  from (((("CAMPUS_DIM" "CAMPUS_DIM" INNER JOIN "STUDENT_ENROLLMENT_FACT"
        "STUDENT_ENROLLMENT_FACT" on
        "CAMPUS_DIM"."CAMPUS_SID" =
        "STUDENT_ENROLLMENT_FACT"."CAMPUS_SID") INNER JOIN "STUDENT_DIM"
        "STUDENT_DIM" on "STUDENT_DIM"."STUDENT_SID" =
        "STUDENT_ENROLLMENT_FACT"."STUDENT_SID") INNER JOIN
        "GRADE_LEVEL_DIM" "GRADE_LEVEL_DIM" on
        "GRADE_LEVEL_DIM"."GRADE_LEVEL_SID" =
        "STUDENT_ENROLLMENT_FACT"."GRADE_LEVEL_SID") INNER JOIN "DATE_DIM" "T" on
        "STUDENT_ENROLLMENT_FACT"."ENTRY_DATE_SID" = "T"."DATE_SID")
  LEFT OUTER JOIN "DATE_DIM" "T5"
    on "STUDENT_ENROLLMENT_FACT"."WITHDRAWAL_DATE_SID" = "T5"."DATE_SID"
 inner join USER_STUDENT_SECURITY
    on "STUDENT_DIM".STUDENT_SID =
       DECODE(USER_STUDENT_SECURITY.STUDENT_SID,
              -9999,
              "STUDENT_DIM".STUDENT_SID,
              USER_STUDENT_SECURITY.STUDENT_SID)
   AND "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
   and USER_STUDENT_SECURITY.USER_ID = :G_USER_NAME
 where "STUDENT_DIM"."STUDENT_SID" = :P2_STUDENT_SID
 */
;

prompt
prompt Creating view V_DWS_GRADES_DETAIL
prompt =================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_GRADES_DETAIL AS
SELECT STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.GENDER,
       STUDENT_DIM.NINTH_GRADE_COHORT,
       STUDENT_DIM.CURRENT_GRADE_LEVEL,
       STUDENT_DIM.CURRENTLY_ENROLLED_FLAG,
       STUDENT_DIM.DATE_OF_BIRTH,
       STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
       STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
       STUDENT_DIM.MIGRANT,
       STUDENT_DIM.IMMIGRANT,
       STUDENT_DIM.STUDENT_CHAMPION,
       DATE_DIM.DATE_ID GRADE_DT,
       DATE_DIM.SCHOOL_YEAR,
       DATE_DIM.SEMESTER,
       CASE
         WHEN DATE_DIM.ACADEMIC_9_WEEKS > 0
         THEN DATE_DIM.ACADEMIC_9_WEEKS
         ELSE DATE_DIM.ACADEMIC_6_WEEKS
         END AS GRADING_PERIOD,
       COURSE_SECTION_DIM.COURSE_DESCRIPTION,
       COURSE_SECTION_DIM.COURSE_CODE,
       COURSE_SECTION_DIM.COURSE_SECTION_NUMBER,
       CAMPUS_DIM.CAMPUS_ID,
       CAMPUS_DIM.CAMPUS_NAME,
       COURSE_SECTION_DIM.STATE_COURSE_CODE,
       COURSE_SECTION_DIM.STATE_COURSE_DESCRIPTION,
       COURSE_SECTION_DIM.CORE_COURSE_FLAG,
       GRADE_LEVEL_DIM.GRADE_LEVEL,
       GRADE_LEVEL_DIM.GRADE_LEVEL_DESCRIPTION,
       GRADE_LEVEL_DIM.GRADE_LEVEL_ORDER,
       GRADE_TYPE_DIM.GRADE_TYPE,
       GRADE_TYPE_DIM.GRADE_TYPE_DESCRIPTION,
       STUDENT_GRADE_FACT.NUMBER_GRADE,
       STUDENT_GRADE_FACT.LETTER_GRADE,
       case
         when STUDENT_GRADE_FACT.NUMBER_GRADE >=90 then 'Grades Greater than 90'
        when STUDENT_GRADE_FACT.NUMBER_GRADE >=80 and STUDENT_GRADE_FACT.NUMBER_GRADE <90 then 'Grades between 80 and 89'
      when STUDENT_GRADE_FACT.NUMBER_GRADE >=70 and STUDENT_GRADE_FACT.NUMBER_GRADE <80 then 'Grades between 70 and 79'
        when STUDENT_GRADE_FACT.NUMBER_GRADE <70 then 'Grades below 70' else 'Unknown' end   NUMERIC_GRADE_RANGE
  FROM STUDENT_GRADE_FACT
 INNER JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
    ON STUDENT_GRADE_FACT.STUDENT_SID = STUDENT_DIM.STUDENT_SID
 INNER JOIN GRADE_LEVEL_DIM
    ON STUDENT_GRADE_FACT.GRADE_LEVEL_SID = GRADE_LEVEL_DIM.GRADE_LEVEL_SID
 INNER JOIN DATE_DIM
    ON STUDENT_GRADE_FACT.DATE_SID = DATE_DIM.DATE_SID
 INNER JOIN CAMPUS_DIM
    ON STUDENT_GRADE_FACT.CAMPUS_SID = CAMPUS_DIM.CAMPUS_SID
 INNER JOIN GRADE_TYPE_DIM
    ON STUDENT_GRADE_FACT.Grade_Type_Sid = GRADE_TYPE_DIM.GRADE_TYPE_SID
 INNER JOIN COURSE_SECTION_DIM
    ON STUDENT_GRADE_FACT.COURSE_SECTION_SID = COURSE_SECTION_DIM.COURSE_SECTION_SID;

prompt
prompt Creating package PKG_DWS_INTERVENTION
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_INTERVENTION" is
/* *******************************************
Description: This package contains the methods for maintaining the
             INTERVENTION table.
Change History
03/26/2013 CB  Initial version
********************************************** */
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION"
   procedure INS_DWS_INTERVENTION (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_NAME         in varchar2,
      P_INTERVENTION_DESCRIPTION  in varchar2  default null,
      P_INTERVENTION_COMMENT      in varchar2  default null,
      P_ACTIVE_FLAG               in varchar2
   );
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION"
   procedure UPD_DWS_INTERVENTION (
      P_INTERVENTION_SID in number,
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_NAME         in varchar2,
      P_INTERVENTION_DESCRIPTION  in varchar2  default null,
      P_INTERVENTION_COMMENT      in varchar2  default null,
      P_ACTIVE_FLAG               in varchar2,
      P_MD5                       in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION"
   procedure "DEL_DWS_INTERVENTION" (
      "P_INTERVENTION_SID" in number
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION"
   procedure "GET_DWS_INTERVENTION" (
      "P_INTERVENTION_SID" in number,
      "P_INTERVENTION_CATEGORY_SID" out number,
      "P_CREATE_BY_USER_SID"        out number,
      "P_LAST_UPDATE_USER_SID"      out number,
      "P_INTERVENTION_NAME"         out varchar2,
      "P_INTERVENTION_DESCRIPTION"  out varchar2,
      "P_INTERVENTION_COMMENT"      out varchar2,
      "P_ACTIVE_FLAG"               out varchar2,
      "P_CREATE_DATE"               out date,
      "P_LAST_UPDATE"               out date
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION"
   procedure "GET_DWS_INTERVENTION" (
      "P_INTERVENTION_SID" in number,
      "P_INTERVENTION_CATEGORY_SID" out number,
      "P_CREATE_BY_USER_SID"        out number,
      "P_LAST_UPDATE_USER_SID"      out number,
      "P_INTERVENTION_NAME"         out varchar2,
      "P_INTERVENTION_DESCRIPTION"  out varchar2,
      "P_INTERVENTION_COMMENT"      out varchar2,
      "P_ACTIVE_FLAG"               out varchar2,
      "P_CREATE_DATE"               out date,
      "P_LAST_UPDATE"               out date,
      "P_MD5"                       out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION"
   function "BUILD_DWS_INTERVENTION_MD5" (
      "P_INTERVENTION_SID" in number,
      "P_INTERVENTION_CATEGORY_SID" in number,
      "P_CREATE_BY_USER_SID"        in number,
      "P_LAST_UPDATE_USER_SID"      in number,
      "P_INTERVENTION_NAME"         in varchar2,
      "P_INTERVENTION_DESCRIPTION"  in varchar2  default null,
      "P_INTERVENTION_COMMENT"      in varchar2  default null,
      "P_ACTIVE_FLAG"               in varchar2,
      "P_CREATE_DATE"               in date      default null,
      "P_LAST_UPDATE"               in date      default null,
      "P_COL_SEP"                   in varchar2  default '|'
   ) return varchar2;

end "PKG_DWS_INTERVENTION";
/

prompt
prompt Creating view V_DWS_INTERVENTION
prompt ================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_INTERVENTION AS
SELECT
INTERVENTION_SID
,INTERVENTION_CATEGORY_SID
,INTERVENTION_NAME
,INTERVENTION_DESCRIPTION
,INTERVENTION_COMMENT
,ACTIVE_FLAG
,CREATE_BY_USER_SID
,CREATE_DATE
,LAST_UPDATE_USER_SID
,LAST_UPDATE
,PKG_DWS_INTERVENTION.BUILD_DWS_INTERVENTION_MD5(P_INTERVENTION_SID => INTERVENTION_SID,
                                                 P_INTERVENTION_CATEGORY_SID => INTERVENTION_CATEGORY_SID,
                                                 P_CREATE_BY_USER_SID => CREATE_BY_USER_SID,
                                                 P_LAST_UPDATE_USER_SID => LAST_UPDATE_USER_SID,
                                                 P_INTERVENTION_NAME => INTERVENTION_NAME,
                                                 P_INTERVENTION_DESCRIPTION => INTERVENTION_DESCRIPTION,
                                                 P_INTERVENTION_COMMENT => INTERVENTION_COMMENT,
                                                 P_ACTIVE_FLAG => ACTIVE_FLAG,
                                                 P_CREATE_DATE => CREATE_DATE,
                                                 P_LAST_UPDATE => LAST_UPDATE,
                                                 P_COL_SEP => '|') AS MD5
FROM DWS_INTERVENTION;

prompt
prompt Creating package PKG_DWS_INTERV_CATEGORY
prompt ========================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_INTERV_CATEGORY" is
/* *******************************************
Description: This package contains the methods for maintaining the
             DWS_INTERVENTION_CATEGORY table.
Change History
03/26/2013 CB  Initial version
********************************************** */
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION_CATEGORY
   procedure INS_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null
   );
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION_CATEGORY
   procedure UPD_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null,
      P_MD5                        in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION_CATEGORY
   procedure DEL_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_CATEGORY
   procedure GET_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      out varchar2,
      P_INTERVENTION_CATEGORY_DESC out varchar2,
      P_ACTIVE_FLAG                out varchar2
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_CATEGORY
   procedure GET_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      out varchar2,
      P_INTERVENTION_CATEGORY_DESC out varchar2,
      P_ACTIVE_FLAG                out varchar2,
      P_MD5                        out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION_CATEGORY
   function BLD_DWS_INTERV_CATEGORY_MD5 (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null,
      P_COL_SEP                    in varchar2  default '|'
   ) return varchar2;

end PKG_DWS_INTERV_CATEGORY;
/

prompt
prompt Creating view V_DWS_INTERVENTION_CATEGORY
prompt =========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_INTERVENTION_CATEGORY AS
SELECT
INTERVENTION_CATEGORY
,INTERVENTION_CATEGORY_SID
,INTERVENTION_CATEGORY_DESC
,ACTIVE_FLAG
,pkg_dws_interv_category.bld_dws_interv_category_md5(p_intervention_category_sid => intervention_category_sid,
                                                                 p_intervention_category => intervention_category,
                                                                 p_intervention_category_desc => intervention_category_desc,
                                                                 p_active_flag => active_flag,
                                                                 p_col_sep => '|')
                                                                 as MD5
FROM DWS_INTERVENTION_CATEGORY;

prompt
prompt Creating view V_DWS_INTERVENTION_NOTES
prompt ======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_INTERVENTION_NOTES AS
SELECT INTERVENTION_NOTE_SID,
       STUDENT_INTERVENTION_SID,
       INTERVENTION_NOTE_TYPE_NAME,
       USER_ID,
       INTERVENTION_NOTE_DT,
       INTERVENTION_NOTE_TEXT,
       LAST_UPDATE
  FROM DWS_INTERVENTION_NOTE
  JOIN DWS_INTERVENTION_NOTE_TYPE ON DWS_INTERVENTION_NOTE_TYPE.INTERVENTION_NOTE_TYPE_SID
                                     = DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_SID
  JOIN USER_ACCOUNT ON USER_ACCOUNT.USER_SID = DWS_INTERVENTION_NOTE.USER_SID;

prompt
prompt Creating view V_DWS_INTERVENTION_NOTE_TYPE
prompt ==========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_INTERVENTION_NOTE_TYPE AS
SELECT
INTERVENTION_NOTE_TYPE_NAME
,INTERVENTION_NOTE_TYPE_SID
FROM DWS_INTERVENTION_NOTE_TYPE;

prompt
prompt Creating view V_DWS_PERIOD_ABS_DETAIL
prompt =====================================
prompt
create or replace force view timsrptdata.v_dws_period_abs_detail as
select STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_ID,
       STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_NAME,
       STUDENT_DIM.STUDENT_CHAMPION,
       DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
       DATE_DIM.ACADEMIC_6_WEEKS,
       DATE_DIM.SHORT_DATE,
       DATE_DIM.DATE_ID,
       CLASS_PERIOD_DIM.CLASS_PERIOD,
       sum(STUDENT_PERIOD_ABSENCE_FACT.PERIOD_ABSENCE_COUNT) PERIOD_ABSENCE_SUM,
       ABSENCE_REASON_DIM.ABSENCE_REASON_DESCRIPTION ABSENCE_REASON_DESCRIPTION
  from STUDENT_PERIOD_ABSENCE_FACT STUDENT_PERIOD_ABSENCE_FACT,
       V_DWS_STUDENT_MASTER        STUDENT_DIM,
       DATE_DIM                    DATE_DIM,
       CLASS_PERIOD_DIM            CLASS_PERIOD_DIM,
       ABSENCE_REASON_DIM          ABSENCE_REASON_DIM
 where
        STUDENT_DIM.STUDENT_SID = STUDENT_PERIOD_ABSENCE_FACT.STUDENT_SID
        and CLASS_PERIOD_DIM.CLASS_PERIOD_SID = STUDENT_PERIOD_ABSENCE_FACT.CLASS_PERIOD_SID
        and DATE_DIM.DATE_SID = STUDENT_PERIOD_ABSENCE_FACT.DATE_SID
        and ABSENCE_REASON_DIM.ABSENCE_REASON_SID = STUDENT_PERIOD_ABSENCE_FACT.ABSENCE_REASON_SID
 group by STUDENT_DIM.STUDENT_SID,
          STUDENT_DIM.FULL_NAME,
          STUDENT_DIM.STUDENT_ID,
          STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_ID,
          STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_NAME,
          STUDENT_DIM.STUDENT_CHAMPION,
          DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
          DATE_DIM.ACADEMIC_6_WEEKS,
          DATE_DIM.SHORT_DATE,
          DATE_DIM.DATE_ID,
          CLASS_PERIOD_DIM.CLASS_PERIOD,
          ABSENCE_REASON_DIM.ABSENCE_REASON_DESCRIPTION




/* Orig SQL -
with "STUDENT_DIM3" as
 (select "STUDENT_DIM"."STUDENT_SID" "STUDENT_SID",
         initcap("STUDENT_DIM"."FULL_NAME") "FULL_NAME",
         "STUDENT_DIM"."STUDENT_ID" "STUDENT_ID",
         "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG" "CURRENTLY_ENROLLED_FLAG"
    from "STUDENT_DIM" "STUDENT_DIM", USER_STUDENT_SECURITY
   where "STUDENT_DIM".STUDENT_SID =
         DECODE(USER_STUDENT_SECURITY.STUDENT_SID,
                -9999,
                STUDENT_DIM.STUDENT_SID,
                USER_STUDENT_SECURITY.STUDENT_SID)
     AND "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
     and USER_STUDENT_SECURITY.USER_ID = :G_USER_NAME)
select "STUDENT_DIM3"."STUDENT_SID",
       "STUDENT_DIM3"."FULL_NAME" "Full_Name",
       "STUDENT_DIM3"."STUDENT_ID" "STUDENT_ID",
       "DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" "School_Year_Description",
       "DATE_DIM"."ACADEMIC_6_WEEKS" "Academic_6_Weeks",
       "DATE_DIM"."SHORT_DATE" "Short_Date",
       "DATE_DIM"."DATE_ID" "Date_ID",
       "CLASS_PERIOD_DIM"."CLASS_PERIOD" "Class_Period",
       sum("STUDENT_PERIOD_ABSENCE_FACT"."PERIOD_ABSENCE_COUNT") "Quantity",
       initcap("ABSENCE_REASON_DIM"."ABSENCE_REASON_DESCRIPTION") "Absence_Reason_Description"
  from "STUDENT_DIM3",
       "DATE_DIM"                    "DATE_DIM",
       "CLASS_PERIOD_DIM"            "CLASS_PERIOD_DIM",
       "STUDENT_PERIOD_ABSENCE_FACT" "STUDENT_PERIOD_ABSENCE_FACT",
       "ABSENCE_REASON_DIM"          "ABSENCE_REASON_DIM"
 where
--"STUDENT_DIM3"."STUDENT_SID" = :P22_STUDENT_SID
--and
 "STUDENT_DIM3"."CURRENTLY_ENROLLED_FLAG" = 'Yes'
 and "STUDENT_DIM3"."STUDENT_SID" = "STUDENT_PERIOD_ABSENCE_FACT"."STUDENT_SID"
 and "CLASS_PERIOD_DIM"."CLASS_PERIOD_SID" =
 "STUDENT_PERIOD_ABSENCE_FACT"."CLASS_PERIOD_SID"
 and "DATE_DIM"."DATE_SID" = "STUDENT_PERIOD_ABSENCE_FACT"."DATE_SID"
 and "ABSENCE_REASON_DIM"."ABSENCE_REASON_SID" =
 "STUDENT_PERIOD_ABSENCE_FACT"."ABSENCE_REASON_SID"
 group by "STUDENT_DIM3"."STUDENT_SID",
          "STUDENT_DIM3"."FULL_NAME",
          "STUDENT_DIM3"."STUDENT_ID",
          "DATE_DIM"."SCHOOL_YEAR_DESCRIPTION",
          "DATE_DIM"."ACADEMIC_6_WEEKS",
          "DATE_DIM"."SHORT_DATE",
          "DATE_DIM"."DATE_ID",
          "CLASS_PERIOD_DIM"."CLASS_PERIOD",
          "ABSENCE_REASON_DIM"."ABSENCE_REASON_DESCRIPTION"
 order by "DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" desc,
          "Academic_6_Weeks"                   desc nulls last,
          "Short_Date"                         desc nulls last,
          "Class_Period"                       asc nulls last
*/
;

prompt
prompt Creating view V_DWS_PERIOD_ABS_SUM
prompt ==================================
prompt
create or replace force view timsrptdata.v_dws_period_abs_sum as
select --'f?p=' || :APP_ID || ':11:' || :APP_SESSION ||':::RIR:IR_Class Period:' || A.C2 link,
       "A"."C2" CLASS_PERIOD,
       count("A"."C5") TOTAL_STUDENTS_ABSENT
  from (select to_char((max("T0"."C0") over(partition by "T0"."C1") +
                        (INTERVAL '1' DAY * (-7))),
                       'MM-DD-YY') "C0",
               "T0"."C2" "C1",
               "T0"."C3" "C2",
               "T0"."C4" "C3",
               to_char(max("T0"."C0") over(partition by "T0"."C1"),
                       'MM-DD-YY') "C4",
               sum("T0"."C5") over(partition by "T0"."C2", "T0"."C3", "T0"."C4") "C5"
          from (select "DATE_DIM"."DATE_ID" "C0",
                       "STUDENT_DIM6"."CAMPUS_SECURITY_KEY" "C1",
                       CASE
                         WHEN (CASE
                                WHEN ("DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" IS NULL) THEN
                                 NULL
                                ELSE
                                 ("DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" || ' - ')
                              END IS NULL) OR ("DATE_DIM"."SEMESTER" IS NULL) THEN
                          NULL
                         ELSE
                          (CASE
                            WHEN ("DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" IS NULL) THEN
                             NULL
                            ELSE
                             ("DATE_DIM"."SCHOOL_YEAR_DESCRIPTION" || ' - ')
                          END || "DATE_DIM"."SEMESTER")
                       END "C2",
                       "CLASS_PERIOD_DIM"."CLASS_PERIOD" "C3",
                       "STUDENT_DIM6"."STUDENT_ID" "C4",
                       "STUDENT_PERIOD_ABSENCE_FACT"."PERIOD_ABSENCE_COUNT" "C5",
                       (max("DATE_DIM"."DATE_ID")
                        over() + (INTERVAL '1' DAY * (-7))) "C6",
                       max("DATE_DIM"."DATE_ID") over() "C7"
                  from "DATE_DIM"                    "DATE_DIM",
                       "V_DWS_STUDENT_MASTER"                 "STUDENT_DIM6",
                       "CLASS_PERIOD_DIM"            "CLASS_PERIOD_DIM",
                       "STUDENT_PERIOD_ABSENCE_FACT" "STUDENT_PERIOD_ABSENCE_FACT"
                 where "STUDENT_DIM6"."STUDENT_ID" in
                       (select distinct "T0"."C0" "Student_ID"
                          from (select "STUDENT_DIM5"."STUDENT_ID" "C0",
                                       "DATE_DIM"."DATE_ID" "C1",
                                       max("DATE_DIM"."DATE_ID") over() "C2"
                                  from "V_DWS_STUDENT_MASTER"                  "STUDENT_DIM5",
                                       "DATE_DIM"                     "DATE_DIM",
                                       "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT"
                                 where "STUDENT_RISK_FACTOR_SNAPSHOT"."RISK_FACTOR_COUNT" > 0
                                   and "STUDENT_DIM5"."STUDENT_SID" =
                                       "STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID"
                                   and "DATE_DIM"."DATE_SID" =
                                       "STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID"
                                ) "T0"
                         where "T0"."C1" = "T0"."C2")
                   and "STUDENT_DIM6"."CURRENTLY_ENROLLED_FLAG" = 'Yes'
                   and "DATE_DIM"."DATE_SID" =
                       "STUDENT_PERIOD_ABSENCE_FACT"."DATE_SID"
                   and "CLASS_PERIOD_DIM"."CLASS_PERIOD_SID" =
                       "STUDENT_PERIOD_ABSENCE_FACT"."CLASS_PERIOD_SID"
                   and "STUDENT_DIM6"."STUDENT_SID" =
                       "STUDENT_PERIOD_ABSENCE_FACT"."STUDENT_SID"
                ) "T0"
         where "T0"."C0" between "T0"."C6" and "T0"."C7") "A"
 group by "A"."C2"
;

prompt
prompt Creating view V_DWS_PERIOD_ABS_SUM_RPT
prompt ======================================
prompt
create or replace force view timsrptdata.v_dws_period_abs_sum_rpt as
with pivot_data AS (
select
"STUDENT_DIM".STUDENT_SID,
"STUDENT_DIM".STUDENT_ID,
initcap("STUDENT_DIM".FULL_NAME) FULL_NAME,
"STUDENT_DIM".CURRENTLY_ENROLLED_CAMPUS_ID,
"STUDENT_DIM".CURRENTLY_ENROLLED_CAMPUS_NAME,
"STUDENT_DIM".STUDENT_CHAMPION,
DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
CASE WHEN(DATE_DIM.ACADEMIC_6_WEEKS IS NULL) THEN NULL ELSE ('Marking Period: '||DATE_DIM.ACADEMIC_6_WEEKS) END ACADEMIC_6_WEEKS,
 --DATE_DIM.DATE_ID,
  DATE_DIM.SHORT_DATE,
  CASE WHEN(CLASS_PERIOD_DIM.CLASS_PERIOD IS NULL) THEN NULL ELSE ('Period '||CLASS_PERIOD_DIM.CLASS_PERIOD) END CLASS_PERIOD,
    --STUDENT_PERIOD_ABSENCE_FACT.PERIOD_ABSENCE_COUNT,
    sum("STUDENT_PERIOD_ABSENCE_FACT"."PERIOD_ABSENCE_COUNT") PERIOD_ABSENCE_COUNT
from
 "STUDENT_PERIOD_ABSENCE_FACT" "STUDENT_PERIOD_ABSENCE_FACT",
 "V_DWS_STUDENT_MASTER" "STUDENT_DIM",
 "DATE_DIM" "DATE_DIM",
 "CLASS_PERIOD_DIM" "CLASS_PERIOD_DIM"
where
 --"STUDENT_DIM".STUDENT_ID = :P15_STUDENT_ID
--and
 "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG"='Yes'
 and "DATE_DIM"."DATE_SID"="STUDENT_PERIOD_ABSENCE_FACT"."DATE_SID"
 and "CLASS_PERIOD_DIM"."CLASS_PERIOD_SID"="STUDENT_PERIOD_ABSENCE_FACT"."CLASS_PERIOD_SID"
 and "STUDENT_DIM"."STUDENT_SID"="STUDENT_PERIOD_ABSENCE_FACT"."STUDENT_SID"
-- and "STUDENT_DIM".STUDENT_SID = DECODE(USER_STUDENT_SECURITY.STUDENT_SID,-9999,STUDENT_DIM.STUDENT_SID,USER_STUDENT_SECURITY.STUDENT_SID) AND
--       "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
--and USER_STUDENT_SECURITY.USER_ID = 'ADAM.WARNER@REGION10.ORG'
group by "STUDENT_DIM".STUDENT_SID,
"STUDENT_DIM".STUDENT_ID,
"STUDENT_DIM".FULL_NAME,
"STUDENT_DIM".CURRENTLY_ENROLLED_CAMPUS_ID,
"STUDENT_DIM".CURRENTLY_ENROLLED_CAMPUS_NAME,
"STUDENT_DIM".STUDENT_CHAMPION,
"DATE_DIM"."SCHOOL_YEAR_DESCRIPTION",
 CASE WHEN("DATE_DIM"."ACADEMIC_6_WEEKS" IS NULL) THEN NULL
   ELSE ('Marking Period: '||"DATE_DIM"."ACADEMIC_6_WEEKS") END,
   --"DATE_DIM"."DATE_ID",
   "DATE_DIM"."SHORT_DATE",
   CASE WHEN("CLASS_PERIOD_DIM"."CLASS_PERIOD" IS NULL) THEN NULL
     ELSE ('Period '||"CLASS_PERIOD_DIM"."CLASS_PERIOD") END
order by "SCHOOL_YEAR_DESCRIPTION" desc nulls last,  "ACADEMIC_6_WEEKS" asc nulls last,
"SHORT_DATE" desc nulls last
)
select "STUDENT_SID","STUDENT_ID","FULL_NAME","CURRENTLY_ENROLLED_CAMPUS_ID","CURRENTLY_ENROLLED_CAMPUS_NAME","STUDENT_CHAMPION","SCHOOL_YEAR_DESCRIPTION","ACADEMIC_6_WEEKS","SHORT_DATE","'Period 01'_PERIOD","'Period 02'_PERIOD","'Period 03'_PERIOD","'Period 04'_PERIOD","'Period 05'_PERIOD","'Period 06'_PERIOD","'Period 07'_PERIOD","'Period 08'_PERIOD","'Period 09'_PERIOD"
from pivot_data
PIVOT (COUNT(PERIOD_ABSENCE_COUNT ) as PERIOD FOR (CLASS_PERIOD) IN ('Period 01','Period 02',
'Period 03','Period 04','Period 05','Period 06','Period 07','Period 08','Period 09'))
;

prompt
prompt Creating view V_DWS_RECENTLY_ADDED_STUDENTS
prompt ===========================================
prompt
create or replace force view timsrptdata.v_dws_recently_added_students as
select
"STUDENT_DIM"."STUDENT_SID",
"CAMPUS_DIM"."CAMPUS_NAME",
"STUDENT_DIM"."CURRENT_GRADE_LEVEL" GRADE,
initcap("STUDENT_DIM"."FULL_NAME") STUDENT_NAME,
"STUDENT_DIM"."STUDENT_ID",
"DATE_DIM"."DATE_ID" "DATE",
 decode("STUDENT_RISK_FACTOR_SNAPSHOT".ATTENDANCE_FLAG,'Yes','YES',
    'no' ) ATTN,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG",'Yes','YES','no') PREV_SEM_ATTN,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG",'Yes','YES','no') CORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG",'Yes','YES','no') NONCORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG",'Yes','YES','no') SEM_CORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG",'Yes','YES','no') SEM_NONCORE_FAIL,
--"STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG",
"STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG" DEF_CRS,
--"STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG",
--"STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG",
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG",'Yes','YES','no') "9TH_GRD_COHORT",
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."OTHER_FLAG",'Yes','YES','no') OTHER,
"CAMPUS_DIM"."DISTRICT_NAME",
"STUDENT_RISK_FACTOR_SNAPSHOT"."RISK_FACTOR_COUNT" RF_COUNT
 from "CAMPUS_DIM" "CAMPUS_DIM", "STUDENT_DIM" "STUDENT_DIM", "DATE_DIM" "DATE_DIM", "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT", "RF_DISPLAY_COLUMNS" "RF_DISPLAY_COLUMNS", "EXECUTION_LOAD_CAMPUS_VW" "EXECUTION_LOAD_CAMPUS_VW", (
select distinct "T0"."C0" "Student_ID", "T0"."C1" "Risk_Factor_Phase", "T0"."C2" "Date_ID"
 from (
select "STUDENT_DIM"."STUDENT_ID" "C0", "STUDENT_RISK_FACTOR_PHASE_SUM"."RISK_FACTOR_PHASE" "C1", "DATE_DIM"."DATE_ID" "C2", max("DATE_DIM"."DATE_ID") over () "C3"
 from
 --USER_STUDENT_SECURITY,
 "V_DWS_STUDENT_MASTER" "STUDENT_DIM",
 "STUDENT_RISK_FACTOR_PHASE_SUM" "STUDENT_RISK_FACTOR_PHASE_SUM",
 "DATE_DIM" "DATE_DIM"
 where
 "STUDENT_RISK_FACTOR_PHASE_SUM"."RISK_FACTOR_PHASE"='Added'
 and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_PHASE_SUM"."STUDENT_SID"
 and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_PHASE_SUM"."DATE_SID"
 --and "STUDENT_DIM".STUDENT_SID = DECODE(USER_STUDENT_SECURITY.STUDENT_SID,-9999,STUDENT_DIM.STUDENT_SID,USER_STUDENT_SECURITY.STUDENT_SID) AND
--       "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
--and USER_STUDENT_SECURITY.USER_ID = 'ADAM.WARNER@REGION10.ORG'
) "T0"
 where "T0"."C2"="T0"."C3") "Recent_Add3"
 where trunc("DATE_DIM"."DATE_ID")>=trunc("EXECUTION_LOAD_CAMPUS_VW"."EXECUTION_START_TIME") and "STUDENT_DIM"."STUDENT_ID"="Recent_Add3"."Student_ID" and "CAMPUS_DIM"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "RF_DISPLAY_COLUMNS"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID"="EXECUTION_LOAD_CAMPUS_VW"."CAMPUS_SID" and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID" and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID"
order by "CAMPUS_DIM"."CAMPUS_ID",
"STUDENT_DIM"."CURRENT_GRADE_LEVEL",
"STUDENT_DIM"."FULL_NAME"


/* Original SQL -
select
"STUDENT_DIM"."STUDENT_SID",
"CAMPUS_DIM"."CAMPUS_NAME",
"STUDENT_DIM"."CURRENT_GRADE_LEVEL" GRADE,
initcap("STUDENT_DIM"."FULL_NAME") STUDENT_NAME,
"STUDENT_DIM"."STUDENT_ID",
"DATE_DIM"."DATE_ID" "DATE",
 decode("STUDENT_RISK_FACTOR_SNAPSHOT".ATTENDANCE_FLAG,'Yes','YES',
    'no' ) ATTN,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_ATTENDANCE_FLAG",'Yes','YES','no') PREV_SEM_ATTN,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."CORE_COURSE_FAILURE_FLAG",'Yes','YES','no') CORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."NON_CORE_COURSE_FAILURE_FLAG",'Yes','YES','no') NONCORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_CORE_CRS_FAILURE_FLAG",'Yes','YES','no') SEM_CORE_FAIL,
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."SEMESTER_NONCORE_CRS_FAIL_FLAG",'Yes','YES','no') SEM_NONCORE_FAIL,
--"STUDENT_RISK_FACTOR_SNAPSHOT"."GPA_FLAG",
"STUDENT_RISK_FACTOR_SNAPSHOT"."DEFICIENT_CREDITS_FLAG" DEF_CRS,
--"STUDENT_RISK_FACTOR_SNAPSHOT"."DISCIPLINE_FLAG",
--"STUDENT_RISK_FACTOR_SNAPSHOT"."GRADE_6_THRU_8_RETENTION_FLAG",
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."COHORT_FLAG",'Yes','YES','no') "9TH_GRD_COHORT",
decode("STUDENT_RISK_FACTOR_SNAPSHOT"."OTHER_FLAG",'Yes','YES','no') OTHER,
"CAMPUS_DIM"."DISTRICT_NAME",
"STUDENT_RISK_FACTOR_SNAPSHOT"."RISK_FACTOR_COUNT" RF_COUNT
 from "CAMPUS_DIM" "CAMPUS_DIM", "STUDENT_DIM" "STUDENT_DIM", "DATE_DIM" "DATE_DIM", "STUDENT_RISK_FACTOR_SNAPSHOT" "STUDENT_RISK_FACTOR_SNAPSHOT", "RF_DISPLAY_COLUMNS" "RF_DISPLAY_COLUMNS", "EXECUTION_LOAD_CAMPUS_VW" "EXECUTION_LOAD_CAMPUS_VW", (
select distinct "T0"."C0" "Student_ID", "T0"."C1" "Risk_Factor_Phase", "T0"."C2" "Date_ID"
 from (
select "STUDENT_DIM"."STUDENT_ID" "C0", "STUDENT_RISK_FACTOR_PHASE_SUM"."RISK_FACTOR_PHASE" "C1", "DATE_DIM"."DATE_ID" "C2", max("DATE_DIM"."DATE_ID") over () "C3"
 from
 USER_STUDENT_SECURITY,
 "STUDENT_DIM" "STUDENT_DIM",
 "STUDENT_RISK_FACTOR_PHASE_SUM" "STUDENT_RISK_FACTOR_PHASE_SUM",
 "DATE_DIM" "DATE_DIM"
 where
 "STUDENT_RISK_FACTOR_PHASE_SUM"."RISK_FACTOR_PHASE"='Added'
 and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_PHASE_SUM"."STUDENT_SID"
 and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_PHASE_SUM"."DATE_SID"
 and "STUDENT_DIM".STUDENT_SID = DECODE(USER_STUDENT_SECURITY.STUDENT_SID,-9999,STUDENT_DIM.STUDENT_SID,USER_STUDENT_SECURITY.STUDENT_SID) AND
       "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
and USER_STUDENT_SECURITY.USER_ID = :G_USER_NAME
) "T0"
 where "T0"."C2"="T0"."C3") "Recent_Add3"
 where trunc("DATE_DIM"."DATE_ID")>=trunc("EXECUTION_LOAD_CAMPUS_VW"."EXECUTION_START_TIME") and "STUDENT_DIM"."STUDENT_ID"="Recent_Add3"."Student_ID" and "CAMPUS_DIM"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "RF_DISPLAY_COLUMNS"."CAMPUS_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID" and "STUDENT_RISK_FACTOR_SNAPSHOT"."CAMPUS_SID"="EXECUTION_LOAD_CAMPUS_VW"."CAMPUS_SID" and "DATE_DIM"."DATE_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."DATE_SID" and "STUDENT_DIM"."STUDENT_SID"="STUDENT_RISK_FACTOR_SNAPSHOT"."STUDENT_SID"
order by "CAMPUS_DIM"."CAMPUS_ID",
"STUDENT_DIM"."CURRENT_GRADE_LEVEL",
"STUDENT_DIM"."FULL_NAME"
*/
;

prompt
prompt Creating view V_DWS_RISK_FACTOR_FLOW
prompt ====================================
prompt
create or replace force view timsrptdata.v_dws_risk_factor_flow as
select
       to_char(DATE_DIM.DATE_ID,'MM-DD-YY')  as  Date_ID ,
       sum(decode(STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_PHASE,'Added', (STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_COUNT),0)) as Added,
       sum(decode(STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_PHASE,'Remain', (STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_COUNT),0)) as Remain,
       sum(decode(STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_PHASE,'Removed', (STUDENT_RISK_FACTOR_PHASE_SUM.RISK_FACTOR_COUNT),0)) as Removed
 from
       DATE_DIM DATE_DIM,
       V_DWS_STUDENT_MASTER STUDENT_DIM,
       STUDENT_RISK_FACTOR_PHASE_SUM
 where
       (STUDENT_DIM.CURRENTLY_ENROLLED_FLAG = 'Yes') and
       (DATE_DIM.DATE_SID = STUDENT_RISK_FACTOR_PHASE_SUM.DATE_SID) and
       (STUDENT_DIM.STUDENT_SID = STUDENT_RISK_FACTOR_PHASE_SUM.STUDENT_SID)
 group by
       to_char(DATE_DIM.DATE_ID,'MM-DD-YY');

prompt
prompt Creating view V_DWS_RISK_FACTOR_HISTORY
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_RISK_FACTOR_HISTORY AS
WITH RUN_LOG AS (
   SELECT MAX(RUN_DATE) RUN_DATE  FROM EXECUTION_LOAD_CAMPUS_VW
   )
SELECT
       -- student info
       STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.STUDENT_ID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.GENDER,
       STUDENT_DIM.NINTH_GRADE_COHORT,
       STUDENT_DIM.CURRENT_GRADE_LEVEL,
       STUDENT_DIM.CURRENTLY_ENROLLED_FLAG,
       STUDENT_DIM.DATE_OF_BIRTH,
       STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
       STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
       STUDENT_DIM.MIGRANT,
       STUDENT_DIM.IMMIGRANT,
       STUDENT_DIM.STUDENT_CHAMPION,
       STUDENT_DIM.LEP_FIRST_YEAR_MONITORING,
       STUDENT_DIM.LEP_SECOND_YEAR_MONITORING,
       STUDENT_DIM.SPECIAL_EDUCATION,
       CAMPUS_DIM.CAMPUS_NAME,
       -- risk factor start dates
       DATE_DIM_START.DATE_ID FLAG_DATE,
       DATE_DIM_START.SCHOOL_YEAR FLAG_SCH_YR,
       DATE_DIM_START.SEMESTER FLAG_SEM,
       CASE
         WHEN DATE_DIM_START.ACADEMIC_9_WEEKS > 0
         THEN DATE_DIM_START.ACADEMIC_9_WEEKS
         ELSE DATE_DIM_START.ACADEMIC_6_WEEKS
         END AS FLAG_GRADING_PERIOD,
       (TRUNC(SYSDATE,'DD') - TRUNC(DATE_DIM_START.DATE_ID,'DD')) REAL_DAYS_SINCE_FLAG,
       RUN_LOG.RUN_DATE,
       (TRUNC(RUN_LOG.RUN_DATE,'DD') - TRUNC(DATE_DIM_START.DATE_ID,'DD')) RUN_DAYS_SINCE_FLAG,
       CASE
         WHEN (DATE_DIM_END.DATE_ID > RUN_LOG.RUN_DATE)
         THEN 'Yes'
         ELSE 'No'
         END AS FLAG_IS_ACTIVE,
       -- risk factor end dates
       DATE_DIM_END.DATE_ID END_DATE,
       DATE_DIM_END.SCHOOL_YEAR END_SCH_YR,
       DATE_DIM_END.SEMESTER END_SEM,
       CASE
         WHEN DATE_DIM_END.ACADEMIC_9_WEEKS > 0
         THEN DATE_DIM_END.ACADEMIC_9_WEEKS
         ELSE DATE_DIM_END.ACADEMIC_6_WEEKS
         END AS END_GRADING_PERIOD,
       -- risk factor info
       RISK_FACTOR.RISK_FACTOR_NAME,
       RISK_FACTOR.RISK_FACTOR_SHORT_NAME,
       RISK_FACTOR.RISK_FACTOR_DESCRIPTION,
       RISK_FACTOR.RISK_FACTOR_DURATION,
       RISK_FACTOR.RISK_FACTOR_TYPE,
       RISK_FACTOR.RISK_FACTOR_ORDER,
       MERGED_STUDENT_RISK_FACTOR.RISK_FACTOR_COUNT
  FROM MERGED_STUDENT_RISK_FACTOR
 INNER JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
    ON MERGED_STUDENT_RISK_FACTOR.STUDENT_SID = STUDENT_DIM.STUDENT_SID
 INNER JOIN DATE_DIM DATE_DIM_START
    ON MERGED_STUDENT_RISK_FACTOR.FLAG_DATE_SID = DATE_DIM_START.DATE_SID
 INNER JOIN DATE_DIM DATE_DIM_END
    ON MERGED_STUDENT_RISK_FACTOR.END_DATE_SID = DATE_DIM_END.DATE_SID
 INNER JOIN RISK_FACTOR
    ON MERGED_STUDENT_RISK_FACTOR.RISK_FACTOR_SID = RISK_FACTOR.RISK_FACTOR_SID
 INNER JOIN CAMPUS_DIM
    ON STUDENT_DIM.CAMPUS_SID = CAMPUS_DIM.CAMPUS_SID
 NATURAL JOIN RUN_LOG
;

prompt
prompt Creating view V_DWS_STUDENT_INTERVENTION
prompt ========================================
prompt
create or replace force view timsrptdata.v_dws_student_intervention as
select
  DWS_STUDENT_INTERVENTION.STUDENT_SID,
  DWS_STUDENT_INTERVENTION.STUDENT_INTERVENTION_SID,
  DWS_INTERVENTION_CATEGORY.INTERVENTION_CATEGORY,
  DWS_INTERVENTION.INTERVENTION_NAME,
  DWS_STU_INTERVENTION_STATUS.INTERVENTION_STATUS,
  CREATED_USER.USER_ID AS CREATED_BY_USER_ID,
  UPDATED_USER.USER_ID AS LAST_UPDATE_USER_ID,
  DWS_STUDENT_INTERVENTION.INTERVENTION_BEGIN_DATE,
  DWS_STUDENT_INTERVENTION.INTERVENTION_END_DATE,
  DWS_STUDENT_INTERVENTION.INTERVENTION_GOAL,
  DWS_STUDENT_INTERVENTION.INTERVENTION_PLAN,
  DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_COMMENT,
  DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_RANK,
  DWS_STUDENT_INTERVENTION.CREATE_DATE,
  DWS_STUDENT_INTERVENTION.LAST_UPDATE,
  INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_NAME,
  INTERVENTION_NOTE.INTERVENTION_NOTE_DT,
  INTERVENTION_NOTE.INTERVENTION_NOTE_TEXT
  from DWS_STUDENT_INTERVENTION
  join DWS_STU_INTERVENTION_STATUS on DWS_STU_INTERVENTION_STATUS.INTERVENTION_STATUS_SID = DWS_STUDENT_INTERVENTION.INTERVENTION_STATUS_SID
  join DWS_INTERVENTION on DWS_INTERVENTION.INTERVENTION_SID = DWS_STUDENT_INTERVENTION.INTERVENTION_SID
  join DWS_INTERVENTION_CATEGORY ON DWS_INTERVENTION_CATEGORY.INTERVENTION_CATEGORY_SID = DWS_INTERVENTION.INTERVENTION_CATEGORY_SID
  join USER_ACCOUNT CREATED_USER ON CREATED_USER.USER_SID = DWS_STUDENT_INTERVENTION.CREATED_BY_USER_SID
  join USER_ACCOUNT UPDATED_USER ON UPDATED_USER.USER_SID = DWS_STUDENT_INTERVENTION.LAST_UPDATE_USER_SID
  left join (select
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_SID,
          DWS_INTERVENTION_NOTE.STUDENT_INTERVENTION_SID,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_SID,
          DWS_INTERVENTION_NOTE_TYPE.INTERVENTION_NOTE_TYPE_NAME,
          DWS_INTERVENTION_NOTE.USER_SID,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_DT,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TEXT,
          DWS_INTERVENTION_NOTE.LAST_UPDATE
          from DWS_INTERVENTION_NOTE
          join DWS_INTERVENTION_NOTE_TYPE ON DWS_INTERVENTION_NOTE_TYPE.INTERVENTION_NOTE_TYPE_SID = DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_SID
          where INTERVENTION_NOTE_DT = (select max(MAX_DATE.INTERVENTION_NOTE_DT)
                                        from DWS_INTERVENTION_NOTE MAX_DATE
                                        where MAX_DATE.STUDENT_INTERVENTION_SID
                                            = DWS_INTERVENTION_NOTE.STUDENT_INTERVENTION_SID)
        ) INTERVENTION_NOTE ON INTERVENTION_NOTE.STUDENT_INTERVENTION_SID = DWS_STUDENT_INTERVENTION.STUDENT_INTERVENTION_SID;

prompt
prompt Creating view V_DWS_STUDENT_INTERVENTION_IR
prompt ===========================================
prompt
create or replace force view timsrptdata.v_dws_student_intervention_ir as
select
  DWS_STUDENT_INTERVENTION.STUDENT_SID,
  DWS_STUDENT_INTERVENTION.STUDENT_INTERVENTION_SID,
  DWS_INTERVENTION_CATEGORY.INTERVENTION_CATEGORY,
  DWS_INTERVENTION.INTERVENTION_NAME,
  DWS_STU_INTERVENTION_STATUS.INTERVENTION_STATUS,
  CREATED_USER.USER_ID AS CREATED_BY_USER_ID,
  UPDATED_USER.USER_ID AS LAST_UPDATE_USER_ID,
  DWS_STUDENT_INTERVENTION.INTERVENTION_BEGIN_DATE,
  DWS_STUDENT_INTERVENTION.INTERVENTION_END_DATE,
  DWS_STUDENT_INTERVENTION.INTERVENTION_GOAL,
  DWS_STUDENT_INTERVENTION.INTERVENTION_PLAN,
  DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_COMMENT,
  DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_RANK,
  DWS_STUDENT_INTERVENTION.CREATE_DATE,
  DWS_STUDENT_INTERVENTION.LAST_UPDATE,
  INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_NAME AS JOURNAL_TYPE,
  INTERVENTION_NOTE.INTERVENTION_NOTE_DT AS JOURNAL_DT,
  INTERVENTION_NOTE.INTERVENTION_NOTE_TEXT AS JOURNAL_ENTRY,
  STUDENT_DIM.STUDENT_ID,
  STUDENT_DIM.FULL_NAME,
  STUDENT_DIM.CURRENT_GRADE_LEVEL,
  STUDENT_DIM.GENDER,
  STUDENT_DIM.RACE_ETHNICITY_SHORT_DESC,
  STUDENT_DIM.NINTH_GRADE_COHORT,
  STUDENT_DIM.LIMITED_ENGLISH_PROFICIENCY,
  STUDENT_DIM.IMMIGRANT,
  STUDENT_DIM.MIGRANT,
  STUDENT_DIM.SPECIAL_EDUCATION,
  STUDENT_DIM.STUDENT_CHAMPION,
  STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_ID,
  STUDENT_DIM.CURRENTLY_ENROLLED_CAMPUS_NAME
  from DWS_STUDENT_INTERVENTION
  join DWS_STU_INTERVENTION_STATUS on DWS_STU_INTERVENTION_STATUS.INTERVENTION_STATUS_SID = DWS_STUDENT_INTERVENTION.INTERVENTION_STATUS_SID
  join DWS_INTERVENTION on DWS_INTERVENTION.INTERVENTION_SID = DWS_STUDENT_INTERVENTION.INTERVENTION_SID
  join DWS_INTERVENTION_CATEGORY ON DWS_INTERVENTION_CATEGORY.INTERVENTION_CATEGORY_SID = DWS_INTERVENTION.INTERVENTION_CATEGORY_SID
  join USER_ACCOUNT CREATED_USER ON CREATED_USER.USER_SID = DWS_STUDENT_INTERVENTION.CREATED_BY_USER_SID
  join USER_ACCOUNT UPDATED_USER ON UPDATED_USER.USER_SID = DWS_STUDENT_INTERVENTION.LAST_UPDATE_USER_SID
  join V_DWS_STUDENT_MASTER STUDENT_DIM ON STUDENT_DIM.STUDENT_SID = DWS_STUDENT_INTERVENTION.STUDENT_SID
  left join (select
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_SID,
          DWS_INTERVENTION_NOTE.STUDENT_INTERVENTION_SID,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_SID,
          DWS_INTERVENTION_NOTE_TYPE.INTERVENTION_NOTE_TYPE_NAME,
          DWS_INTERVENTION_NOTE.USER_SID,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_DT,
          DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TEXT,
          DWS_INTERVENTION_NOTE.LAST_UPDATE
          from DWS_INTERVENTION_NOTE
          join DWS_INTERVENTION_NOTE_TYPE ON DWS_INTERVENTION_NOTE_TYPE.INTERVENTION_NOTE_TYPE_SID = DWS_INTERVENTION_NOTE.INTERVENTION_NOTE_TYPE_SID
          where INTERVENTION_NOTE_DT = (select max(MAX_DATE.INTERVENTION_NOTE_DT)
                                        from DWS_INTERVENTION_NOTE MAX_DATE
                                        where MAX_DATE.STUDENT_INTERVENTION_SID
                                            = DWS_INTERVENTION_NOTE.STUDENT_INTERVENTION_SID)
        ) INTERVENTION_NOTE ON INTERVENTION_NOTE.STUDENT_INTERVENTION_SID = DWS_STUDENT_INTERVENTION.STUDENT_INTERVENTION_SID;

prompt
prompt Creating view V_DWS_STUDENT_NOTE
prompt ================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_STUDENT_NOTE AS
SELECT DWS_STUDENT_NOTE.NOTE_ID,
    DWS_STUDENT_NOTE.STUDENT_SID,
    STUDENT_DIM.STUDENT_ID,
    STUDENT_DIM.FULL_NAME STUDENT_NAME,
    DWS_STUDENT_NOTE.NOTE_AUTHOR_SID,
    USER_ACCOUNT.USER_ID AUTHOR_USER_ID,
    USER_ACCOUNT.EMPLOYEE_ID AUTHOR_EMP_ID,
    USER_ACCOUNT.USER_LAST_NAME||', '||USER_ACCOUNT.USER_FIRST_NAME AUTHOR_FULL_NAME,
    DWS_STUDENT_NOTE.NOTE_DTTM,
    DWS_STUDENT_NOTE.NOTE_TEXT
  FROM DWS_STUDENT_NOTE
  JOIN V_DWS_STUDENT_MASTER STUDENT_DIM
  ON DWS_STUDENT_NOTE.STUDENT_SID = STUDENT_DIM.STUDENT_SID
  JOIN USER_ACCOUNT
  ON DWS_STUDENT_NOTE.NOTE_AUTHOR_SID = USER_ACCOUNT.USER_SID;

prompt
prompt Creating view V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ============================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_STUDENT_RISK_FACTOR_LIST AS
SELECT DISTINCT
       DISTRICT_SECURITY_KEY,
       CAMPUS_SECURITY_KEY,
       CAMPUS_DIM.CAMPUS_ID,
       DATE_DIM.DATE_ID,
       CAMPUS_DIM.DISTRICT_NAME,
       CAMPUS_DIM.CAMPUS_NAME,
       V_DWS_STUDENT_MASTER.CURRENT_GRADE_LEVEL,
       INITCAP(V_DWS_STUDENT_MASTER.FULL_NAME) FULL_NAME,
       DATE_DIM.SCHOOL_YEAR,
       DATE_DIM.SEMESTER,
       V_DWS_STUDENT_MASTER.STUDENT_ID,
       STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID,
       STUDENT_RISK_FACTOR_SNAPSHOT.STUDENT_SID,
       STUDENT_RISK_FACTOR_SNAPSHOT.DATE_SID,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.ATTENDANCE_FLAG,
              'Yes',
              'YES',
              'no') ATTENDANCE_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.SEMESTER_ATTENDANCE_FLAG,
              'Yes',
              'YES',
              'no') SEMESTER_ATTENDANCE_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.CORE_COURSE_FAILURE_FLAG,
              'Yes',
              'YES',
              'no') CORE_COURSE_FAILURE_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.NON_CORE_COURSE_FAILURE_FLAG,
              'Yes',
              'YES',
              'no') NON_CORE_COURSE_FAILURE_IMG,
     DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.SEMESTER_CORE_CRS_FAILURE_FLAG,
              'Yes',
              'YES',
              'no') SEMESTER_CORE_CRS_FAILURE_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.SEMESTER_NONCORE_CRS_FAIL_FLAG,
              'Yes',
              'YES',
              'no') SEMESTER_NONCORE_CRS_FAIL_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.GPA_FLAG, 'YES', 'YES', 'NO') GPA_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.DEFICIENT_CREDITS_FLAG,
              'Yes',
              'YES',
              'no') DEFICIENT_CREDITS_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.DISCIPLINE_FLAG,
              'Yes',
              'YES',
              'no') DISCIPLINE_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.GRADE_6_THRU_8_RETENTION_FLAG,
              'Yes',
              'YES',
              'no') GRADE_6_THRU_8_RETENTION_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.COHORT_FLAG,
              'Yes',
              'YES',
              'no') COHORT_IMG,
       DECODE(STUDENT_RISK_FACTOR_SNAPSHOT.OTHER_FLAG,
              'Yes',
              'YES',
              'no') OTHER_IMG,
       STUDENT_RISK_FACTOR_SNAPSHOT.RISK_FACTOR_COUNT,
       EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME,
       V_DWS_STUDENT_MASTER.CURRENTLY_ENROLLED_FLAG,
       V_DWS_STUDENT_MASTER.GENDER,
       V_DWS_STUDENT_MASTER.ETHNICITY,
       V_DWS_STUDENT_MASTER.AMERICAN_INDIAN_ALASKA_NATIVE,
       V_DWS_STUDENT_MASTER.ASIAN,
       V_DWS_STUDENT_MASTER.BLACK_OR_AFRICAN_AMERICAN,
       V_DWS_STUDENT_MASTER.NATIVE_HAWAIIAN_PACIFIC_ISLAND,
       V_DWS_STUDENT_MASTER.WHITE,
       V_DWS_STUDENT_MASTER.TWO_OR_MORE_RACES,
       V_DWS_STUDENT_MASTER.RACE_ETHNICITY_SHORT_DESC,
       V_DWS_STUDENT_MASTER.LIMITED_ENGLISH_PROFICIENCY,
       V_DWS_STUDENT_MASTER.LEP_FIRST_YEAR_MONITORING,
       V_DWS_STUDENT_MASTER.LEP_SECOND_YEAR_MONITORING,
       V_DWS_STUDENT_MASTER.IMMIGRANT,
       V_DWS_STUDENT_MASTER.MIGRANT,
       V_DWS_STUDENT_MASTER.SPECIAL_EDUCATION,
       V_DWS_STUDENT_MASTER.CURRENTLY_ENROLLED_CAMPUS_ID,
       V_DWS_STUDENT_MASTER.CURRENTLY_ENROLLED_CAMPUS_NAME,
       V_DWS_STUDENT_MASTER.STUDENT_CHAMPION
  FROM DATE_DIM                     DATE_DIM,
       CAMPUS_DIM                   CAMPUS_DIM,
       V_DWS_STUDENT_MASTER         V_DWS_STUDENT_MASTER,
       STUDENT_RISK_FACTOR_SNAPSHOT STUDENT_RISK_FACTOR_SNAPSHOT,
       RF_DISPLAY_COLUMNS           RF_DISPLAY_COLUMNS,
       EXECUTION_LOAD_CAMPUS_VW     EXECUTION_LOAD_CAMPUS_VW
   WHERE CAMPUS_DIM.CAMPUS_SID =
       STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID
   AND STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID
                             IN (SELECT DISTINCT CAMPUS_DIM.CAMPUS_SID
                                 FROM CAMPUS_RISK_FACTOR_DIM
                                 JOIN CAMPUS_DIM ON CAMPUS_DIM.CAMPUS_ID = CAMPUS_RISK_FACTOR_DIM.CAMPUS_ID )
   AND DATE_DIM.DATE_SID = STUDENT_RISK_FACTOR_SNAPSHOT.DATE_SID
   AND V_DWS_STUDENT_MASTER.STUDENT_SID =
       STUDENT_RISK_FACTOR_SNAPSHOT.STUDENT_SID
   AND TRUNC(DATE_DIM.DATE_ID) >=
       TRUNC(EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME)
   AND STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID =
       EXECUTION_LOAD_CAMPUS_VW.CAMPUS_SID;

prompt
prompt Creating view V_DWS_STU_INTERVENTION_STATUS
prompt ===========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_DWS_STU_INTERVENTION_STATUS AS
SELECT
INTERVENTION_STATUS
,INTERVENTION_STATUS_SID
FROM DWS_STU_INTERVENTION_STATUS;

prompt
prompt Creating view V_DWS_STU_RISK_HISTOGRAM
prompt ======================================
prompt
create or replace force view timsrptdata.v_dws_stu_risk_histogram as
select
 STUDENT_RISK_FACTOR_SNAPSHOT.RISK_FACTOR_COUNT,
 count(STUDENT_DIM.STUDENT_ID) STUDENT_COUNT
  from V_DWS_STUDENT_MASTER         STUDENT_DIM,
       DATE_DIM                     DATE_DIM,
       STUDENT_RISK_FACTOR_SNAPSHOT STUDENT_RISK_FACTOR_SNAPSHOT,
       EXECUTION_LOAD_CAMPUS_VW     EXECUTION_LOAD_CAMPUS_VW
 where trunc(DATE_DIM.DATE_ID) >=
       trunc(EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME)
   and STUDENT_DIM.CURRENTLY_ENROLLED_FLAG = 'Yes'
   and STUDENT_DIM.CAMPUS_SID = STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID
   and STUDENT_DIM.STUDENT_SID = STUDENT_RISK_FACTOR_SNAPSHOT.STUDENT_SID
   and DATE_DIM.DATE_SID = STUDENT_RISK_FACTOR_SNAPSHOT.DATE_SID
   and STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID =
       EXECUTION_LOAD_CAMPUS_VW.CAMPUS_SID
 group by STUDENT_RISK_FACTOR_SNAPSHOT.RISK_FACTOR_COUNT
 order by STUDENT_RISK_FACTOR_SNAPSHOT.RISK_FACTOR_COUNT;

prompt
prompt Creating view V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt ==========================================
prompt
create or replace force view timsrptdata.v_dws_wkly_attendance_rf_cnt as
select
to_char(week.date_id,'MM/DD/YY') as WEEK_ENDING
,count(distinct merged_student_risk_factor.student_sid) STUDENT_COUNT
from merged_student_risk_factor
join v_dws_student_master on v_dws_student_master.STUDENT_SID = merged_student_risk_factor.student_sid
join date_dim flag_date_dim on flag_date_dim.date_sid = merged_student_risk_factor.flag_date_sid
join date_dim end_date_dim on end_date_dim.date_sid = merged_student_risk_factor.end_date_sid
join risk_factor on risk_factor.risk_factor_sid = merged_student_risk_factor.risk_factor_sid
                 and risk_factor.risk_factor_name = 'Attendance'
join
  (select date_dim.date_id
  from date_dim
  where date_dim.day_of_week_short_name = 'Fri'
  and school_year = (select distinct school_year from date_dim join execution_load_campus_vw on trunc(date_dim.date_id) = trunc(execution_start_time) )
  and date_dim.date_id <= (select max(execution_start_time) from execution_load_campus_vw)) week
on flag_date_dim.date_id <= week.date_id
and end_date_dim.date_id  >= week.date_id - 6
group by week.date_id
order by week.date_id;

prompt
prompt Creating view V_ENROLLMENT_BY_CAMPUS_D
prompt ======================================
prompt
create or replace force view timsrptdata.v_enrollment_by_campus_d as
select NULL AS LINK
      ,sr_stu_enroll.sch_yr
      ,cr_demo.campus_name AS CAMPUS
      ,sr_stu_enroll.stu_id AS STUDENT_ID
from sr_stu_enroll
join cr_demo on cr_demo.campus_id = sr_stu_enroll.campus_id
             and cr_demo.sch_yr = sr_stu_enroll.sch_yr
where SR_STU_ENROLL.STATUS_CD in ('1','2','3') and active_cd = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_CAMPUS
prompt ====================================
prompt
create or replace force view timsrptdata.v_enrollment_by_campus as
select link
       ,sch_yr
       ,campus
       ,STUDENT_ID
FROM V_ENROLLMENT_BY_CAMPUS_D;

prompt
prompt Creating view V_ENROLLMENT_BY_DISTRICT_D
prompt ========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_ENROLLMENT_BY_DISTRICT_D AS
SELECT SR_STU_ENROLL.SCH_YR
      ,SR_STU_ENROLL.STU_ID
FROM SR_STU_ENROLL
JOIN CR_DEMO ON CR_DEMO.CAMPUS_ID = SR_STU_ENROLL.CAMPUS_ID
             AND CR_DEMO.SCH_YR = SR_STU_ENROLL.SCH_YR
WHERE SR_STU_ENROLL.STATUS_CD IN ('1','2','3') AND ACTIVE_CD = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_DISTRICT
prompt ======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_ENROLLMENT_BY_DISTRICT AS
SELECT V_ENROLLMENT_BY_DISTRICT_D.SCH_YR
      ,V_ENROLLMENT_BY_DISTRICT_D.STU_ID
FROM V_ENROLLMENT_BY_DISTRICT_D;

prompt
prompt Creating view V_ENROLLMENT_BY_ETHNICITY_D
prompt =========================================
prompt
create or replace force view timsrptdata.v_enrollment_by_ethnicity_d as
select NULL AS LINK
       ,SR_STU_ENROLL.SCH_YR
       ,case ethn_agg_cd
       when 'A' then 'Asian'
       when 'B' then 'Black'
       when 'H' then 'Hispanic'
       when 'I' then 'Amer Indian'
       when 'T' then 'Two Or More'
       when 'P' then 'Pacific Islander'
       when 'W' then 'White'
       else 'Unknown'
       end as aggregate_ethnicity
       ,SR_STU_ENROLL.STU_ID
from sr_stu_enroll
join sr_stu_demo on sr_stu_demo.sch_yr = sr_stu_enroll.sch_yr
                 and sr_stu_demo.stu_id = sr_stu_enroll.stu_id
where SR_STU_ENROLL.STATUS_CD in ('1','2','3') and active_cd = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_ETHNICITY
prompt =======================================
prompt
create or replace force view timsrptdata.v_enrollment_by_ethnicity as
select V_ENROLLMENT_BY_ETHNICITY_D.LINK
       ,V_ENROLLMENT_BY_ETHNICITY_D.SCH_YR
       ,V_ENROLLMENT_BY_ETHNICITY_D.AGGREGATE_ETHNICITY
       ,V_ENROLLMENT_BY_ETHNICITY_D.STU_ID
from V_ENROLLMENT_BY_ETHNICITY_D;

prompt
prompt Creating view V_ENROLLMENT_BY_GENDER_D
prompt ======================================
prompt
create or replace force view timsrptdata.v_enrollment_by_gender_d as
select NULL AS LINK
       ,sr_stu_enroll.sch_yr
       ,CASE sr_stu_demo.sex
        WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
        ELSE 'Unknown'
        END AS SEX
       ,sr_stu_enroll.stu_id
from sr_stu_enroll
join sr_stu_demo on sr_stu_demo.sch_yr = sr_stu_enroll.sch_yr
                 and sr_stu_demo.stu_id = sr_stu_enroll.stu_id
where SR_STU_ENROLL.STATUS_CD in ('1','2','3') and active_cd = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_GENDER
prompt ====================================
prompt
create or replace force view timsrptdata.v_enrollment_by_gender as
select  V_ENROLLMENT_BY_GENDER_D.LINK
       ,V_ENROLLMENT_BY_GENDER_D.SCH_YR
       ,V_ENROLLMENT_BY_GENDER_D.SEX
       ,V_ENROLLMENT_BY_GENDER_D.STU_ID
from V_ENROLLMENT_BY_GENDER_D;

prompt
prompt Creating view V_ENROLLMENT_BY_GRADE_LVL_D
prompt =========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_ENROLLMENT_BY_GRADE_LVL_D AS
SELECT NULL AS LINK
       ,SR_STU_ENROLL.SCH_YR
       ,SR_STU_ENROLL.GRD_LVL AS GRADE_LEVEL
       ,CASE
            WHEN SR_STU_ENROLL.GRD_LVL = 'EE' THEN '-2'
            WHEN SR_STU_ENROLL.GRD_LVL = 'PK' THEN '-1'
            WHEN SR_STU_ENROLL.GRD_LVL = 'KG' THEN '00'
            ELSE SR_STU_ENROLL.GRD_LVL
            END AS GRDSORT
      ,SR_STU_ENROLL.STU_ID AS STUDENT_ID
FROM SR_STU_ENROLL
WHERE SR_STU_ENROLL.STATUS_CD IN ('1','2','3') AND ACTIVE_CD = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_GRADE_LVL
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_ENROLLMENT_BY_GRADE_LVL AS
SELECT LINK
       ,V_ENROLLMENT_BY_GRADE_LVL_D.SCH_YR
       ,V_ENROLLMENT_BY_GRADE_LVL_D.GRADE_LEVEL
       ,V_ENROLLMENT_BY_GRADE_LVL_D.GRDSORT
       ,V_ENROLLMENT_BY_GRADE_LVL_D.STUDENT_ID
FROM V_ENROLLMENT_BY_GRADE_LVL_D;

prompt
prompt Creating view V_IDMGR_APP_ROLE
prompt ==============================
prompt
create or replace force view timsrptdata.v_idmgr_app_role as
select application_role.application_role_sid
      ,application_role.application_id
      ,role_master.role
      ,role_master.role_description
      ,application.description
  from application_role
  join role_master on role_master.role_sid = application_role.role_sid
  join application on application.application_id = application_role.application_id;

prompt
prompt Creating view V_IDMGR_CAMPUS_MASTER
prompt ===================================
prompt
create or replace force view timsrptdata.v_idmgr_campus_master as
select
school_id || ' - ' || campus_name as Campus
,campus_master_sid
,school_id
,campus_id
,campus_name
,district_sid
from CAMPUS_MASTER;

prompt
prompt Creating view V_IDMGR_LOGIN_MESSAGE
prompt ===================================
prompt
create or replace force view timsrptdata.v_idmgr_login_message as
select district_dim.login_message,
       district_dim.login_message_start_date_time,
       district_dim.login_message_end_date_time
 from district_dim
where district_dim.district_sid = (select min(district_sid) from district_dim where district_sid != -1);

prompt
prompt Creating view V_IDMGR_REPORT_CATG_ALL
prompt =====================================
prompt
create or replace force view timsrptdata.v_idmgr_report_catg_all as
select SOURCE.SOURCE_NAME
       ,REPORT_CATEGORY.REPORT_CATEGORY
       ,SOURCE.SOURCE_NAME||'-'||REPORT_CATEGORY.REPORT_CATEGORY as SOURCE_REPORT_CATEGORY
       ,SOURCE.SOURCE_NAME||'-'||REPORT_CATEGORY.REPORT_CATEGORY||' ('||
              (select to_char(count(*))
                 from report_list
                 where report_list.report_category_sid = REPORT_CATEGORY.REPORT_CATEGORY_SID)||')' as SOURCE_REPORT_CATEGORY_CNT
      ,REPORT_CATEGORY.REPORT_CATEGORY_SID
  from REPORT_CATEGORY
  join SOURCE ON SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
 where SOURCE.ACTIVE_FLAG = 'Y'
 order by 3;

prompt
prompt Creating view V_IDMGR_REPORT_LIST
prompt =================================
prompt
create or replace force view timsrptdata.v_idmgr_report_list as
select
      SOURCE.SOURCE_NAME||':'||REPORT_CATEGORY.REPORT_CATEGORY||' - '||REPORT_LIST.REPORT_NAME AS REPORT_ITEM
      ,SOURCE.SOURCE_NAME
      ,REPORT_CATEGORY.REPORT_CATEGORY
      ,REPORT_LIST.REPORT_LIST_SID
      ,REPORT_LIST.REPORT_NAME
      ,REPORT_LIST.REPORT_DESCRIPTION
      ,REPORT_LIST.REPORT_ALIAS
      ,REPORT_LIST.REPORT_CATEGORY_SID
      ,REPORT_LIST.ACTIVE_FLAG
      ,REPORT_LIST.REPORT_TYPE_SID
  from REPORT_LIST
  JOIN REPORT_CATEGORY ON REPORT_CATEGORY.REPORT_CATEGORY_SID = REPORT_LIST.REPORT_CATEGORY_SID
  JOIN SOURCE ON SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
WHERE REPORT_LIST.ACTIVE_FLAG = 'Y'
  AND REPORT_CATEGORY.ACTIVE_FLAG = 'Y'
  AND SOURCE.ACTIVE_FLAG = 'Y';

prompt
prompt Creating view V_IDMGR_SECURITY_QUESTION
prompt =======================================
prompt
create or replace force view timsrptdata.v_idmgr_security_question as
select SECURITY_QUESTION.SECURITY_QUESTION_SID
      ,SECURITY_QUESTION.SECURITY_QUESTION_TYPE_SID
      ,SECURITY_QUESTION_TYPE.SECURITY_QUESTION_TYPE_NAME
      ,SECURITY_QUESTION_TYPE.SECURITY_QUESTION_TYPE_DESC
      ,SECURITY_QUESTION.SECURITY_QUESTION
  from SECURITY_QUESTION
  join SECURITY_QUESTION_TYPE ON SECURITY_QUESTION_TYPE.SECURITY_QUESTION_TYPE_SID = SECURITY_QUESTION.SECURITY_QUESTION_TYPE_SID;

prompt
prompt Creating view V_IDMGR_SECURITY_TRANS_LOG
prompt ========================================
prompt
create or replace force view timsrptdata.v_idmgr_security_trans_log as
select
 security_transaction_sid,
 user_sid,
 user_id,
 transaction_date,
 to_char(transaction_date,'HH:MI AM') as transaction_time,
 log_message,
 action_type,
 action_result,
 attempts,
 user_ip_address,
 browser
from SECURITY_TRANSACTION_LOG;

prompt
prompt Creating view V_IDMGR_TXEIS_REPORT_CATG_ALL
prompt ===========================================
prompt
create or replace force view timsrptdata.v_idmgr_txeis_report_catg_all as
select REPORT_CATEGORY
      ,REPORT_CATEGORY_SID
  from REPORT_CATEGORY
  join SOURCE ON SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
 where SOURCE.ACTIVE_FLAG = 'Y'
   and SOURCE.SOURCE_NAME = 'TxEIS'
 order by REPORT_CATEGORY;

prompt
prompt Creating view V_IDMGR_USER_ACCT_COLUMN_AUTH
prompt ===========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_IDMGR_USER_ACCT_COLUMN_AUTH AS
SELECT
USER_ACCOUNT.STUDENT_SSN_AUTH
,USER_ACCOUNT.STAFF_SSN_AUTH
,USER_ACCOUNT.ECON_DISADV_AUTH
FROM USER_ACCOUNT
WHERE USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME');

prompt
prompt Creating view V_IDMGR_USER_CAMPUS
prompt =================================
prompt
create or replace force view timsrptdata.v_idmgr_user_campus as
select
 USER_SID
,CAMPUS_MASTER_SID
from USER_CAMPUS;

prompt
prompt Creating view V_IDMGR_USER_REPORT
prompt =================================
prompt
create or replace force view timsrptdata.v_idmgr_user_report as
select USER_REPORT.USER_REPORT_SID
      ,USER_REPORT.USER_SID
      ,USER_REPORT.REPORT_LIST_SID
      ,REPORT_LIST.REPORT_NAME
      ,SOURCE.SOURCE_NAME||':'||REPORT_CATEGORY.REPORT_CATEGORY||' - '||REPORT_LIST.REPORT_NAME AS REPORT_ITEM
  from USER_REPORT
  join REPORT_LIST on REPORT_LIST.REPORT_LIST_SID = USER_REPORT.REPORT_LIST_SID
  JOIN REPORT_CATEGORY ON REPORT_CATEGORY.REPORT_CATEGORY_SID = REPORT_LIST.REPORT_CATEGORY_SID
  JOIN SOURCE ON SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
  WHERE REPORT_LIST.ACTIVE_FLAG = 'Y';

prompt
prompt Creating view V_IDMGR_USER_REPORT_CATEGORY
prompt ==========================================
prompt
create or replace force view timsrptdata.v_idmgr_user_report_category as
select USER_REPORT_CATEGORY.REPORT_CATEGORY_SID
      ,USER_REPORT_CATEGORY.USER_SID
      ,REPORT_CATEGORY.REPORT_CATEGORY
      ,SOURCE.SOURCE_NAME||'-'||REPORT_CATEGORY.REPORT_CATEGORY AS SOURCE_CATEGORY
  from USER_REPORT_CATEGORY
  join REPORT_CATEGORY on REPORT_CATEGORY.REPORT_CATEGORY_SID = USER_REPORT_CATEGORY.REPORT_CATEGORY_SID
  join source on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID;

prompt
prompt Creating view V_IDMGR_USER_ROLE
prompt ===============================
prompt
create or replace force view timsrptdata.v_idmgr_user_role as
select
USER_ROLE.USER_ROLE_SID,
USER_ROLE.USER_SID,
USER_ROLE.APPLICATION_ROLE_SID,
USER_ROLE.DEFAULT_APPLICATION_FLAG,
APPLICATION.DESCRIPTION APPLICATION_NAME
from USER_ROLE
JOIN APPLICATION_ROLE ON APPLICATION_ROLE.APPLICATION_ROLE_SID = USER_ROLE.APPLICATION_ROLE_SID
JOIN APPLICATION ON APPLICATION.APPLICATION_ID =  APPLICATION_ROLE.APPLICATION_ID;

prompt
prompt Creating view V_IDMGR_USER_TXEIS_BUS_ACT_PRM
prompt ============================================
prompt
create or replace force view timsrptdata.v_idmgr_user_txeis_bus_act_prm as
select USER_TXEIS_BUS_ACCT_SID
      ,USER_SID
      ,APP_ID
      ,FUND
      ,FUNC
      ,OBJ
      ,SOBJ
      ,ORG
      ,FSCL_YR
      ,PGM
      ,ED_SPAN
      ,PROJ_DTL
      ,pkg_idmgr_user_account.fn_bld_txeis_bus_acct_prm_md5(p_user_txeis_bus_acct_sid => USER_TXEIS_BUS_ACCT_SID,
                                                                  p_user_sid => USER_SID,
                                                                  p_app_id => APP_ID,
                                                                  p_fund => FUND,
                                                                  p_func => FUNC,
                                                                  p_obj => OBJ,
                                                                  p_sobj => SOBJ,
                                                                  p_org => ORG,
                                                                  p_fscl_yr => FSCL_YR,
                                                                  p_pgm => PGM,
                                                                  p_ed_span => ED_SPAN,
                                                                  p_proj_dtl => PROJ_DTL,
                                                                  p_col_sep => '|') AS MD5
  from USER_TXEIS_BUS_ACCT_PERMISS;

prompt
prompt Creating view V_REPORTER_DATA_AS_OF_DATE
prompt ========================================
prompt
create or replace force view timsrptdata.v_reporter_data_as_of_date as
select to_char(max(event_dttm),'MM/DD HH12:MIPM') data_as_of_date, max(event_dttm) data_as_of_date_raw
   from APPLICATION_EVENT_LOG
   join application on application.application_id = application_event_log.application_id
   join application_event_type on application_event_type.event_type_sid = application_event_log.event_type_sid
   where application.application_alias = 'REVRPTR' and application_event_type.event_type_name = 'DATA_MART_REFRESH';

prompt
prompt Creating view V_SCHOOL_YEAR_D
prompt =============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_SCHOOL_YEAR_D AS
SELECT DISTINCT sch_yr school_year
,sch_yr
FROM CR_ATT_CAL;

prompt
prompt Creating view V_SCHOOL_YEAR
prompt ===========================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_SCHOOL_YEAR AS
SELECT DISTINCT sch_yr school_year
,sch_yr
FROM V_SCHOOL_YEAR_D;

prompt
prompt Creating view V_SOURCE
prompt ======================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_SOURCE AS
SELECT source_sid,
       source_name,
       source_description,
       active_flag,
       current_mode
FROM SOURCE;

prompt
prompt Creating view V_TIMS_ISSUE
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TIMS_ISSUE AS
SELECT
      -- issue fields from issue_dim
      issue.issue_key,
      issue.project_name,
      issue.assignee,
      issue.issue_type,
      issue.subsystem,
      issue.summary,
      issue.description,
      issue.environment,
      issue.severity,
      issue.working_priority,
      issue.resolution,
      issue.resolution_final,
      issue.issue_status,
      issue.created_dttm,
      to_char(issue.created_dttm,'YYYY-WW') created_week,
      to_char(issue.created_dttm,'YYYY-MM') created_month,
      -- school year of creation
      date_dim.school_year created_sch_yr,
      date_dim.school_year_description created_sch_yr_long,
      -- more issue fields
      issue.updated_dttm,
      issue.due_dttm,
      issue.resolved_dttm,
      to_char(issue.resolved_dttm,'YYYY-WW') resolved_week,
      to_char(issue.resolved_dttm,'YYYY-MM') resolved_month,
      ((issue.resolved_dttm - issue.created_dttm)*24) resolve_hrs,
      issue.timespent,
      issue.component,
      issue.escalation_esc,
      issue.reporter reporter_id,
      -- reporter user info joined from user_dim
      -- this is the JIRA user who created the issue
      -- which may be a service account for end user tickets
      user_dim.display_name reporter_name,
      user_dim.first_name reporter_fname,
      user_dim.last_name reporter_lname,
      user_dim.email_address reporter_email,
      user_dim.email_domain reporter_domain,
      user_dim.primary_org reporter_org,
      user_dim.l1_agent reporter_is_l1,
      user_dim.l2_agent reporter_is_l2,
      user_dim.l3_agent reporter_is_l3,
      user_dim.l4_agent reporter_is_l4,
      user_dim.l2_coach reporter_is_l2_coach,
      user_dim.service_acct reporter_is_end_user,
      user_dim.admin_acct reporter_is_admin,
      -- more issue fields, info about the actual submitter
      issue.l1_security_group l1_sec_grp,
      l1_org.org_name l1_org_name,
      issue.l2_security_group l2_sec_grp,
      l2_org.org_name l2_org_name,
      issue.submission_dttm,
      issue.submitter_email,
      issue.submitter_phone,
      issue.submitter_name,
      issue.campus_cdn submitter_campus,
      issue.campus_name submitter_campus_name,
      issue.lea_cdn submitter_cdn,
      -- submitter org info
      submit_org.city submitter_city,
      submit_org.county_name submitter_county,
      submit_org.lea_enrollment submitter_enrollment,
      submit_org.lea_type submitter_lea_type,
      submit_org.org_name submitter_org,
      submit_org.org_type submitter_org_type,
      submit_org.region_num submitter_region,
      submit_org.org_zip submitter_zip,
      -- last issue field
      issue.submitter_notification_comment
FROM tims_issue_dim issue
JOIN tims_user_dim user_dim ON user_dim.user_name = issue.reporter
JOIN date_dim ON date_dim.date_sid = concat('2',to_char(user_dim.created_dttm,'YYYYMMDD'))
LEFT JOIN org_dim submit_org ON nvl(issue.lea_cdn,'000001') = submit_org.org_cdn
LEFT JOIN org_dim l1_org ON issue.l1_security_group = l1_org.org_cdn
LEFT JOIN org_dim l2_org ON issue.l2_security_group = l2_org.org_cdn
WHERE issue.issue_key != 'TSDS-173' -- exclude reference ticket
;

prompt
prompt Creating view V_TIMS_ISSUE_HISTORY
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TIMS_ISSUE_HISTORY AS
SELECT
      -- change history fields
      history.chg_id,
      history.chg_grp_id,
      history.field_type chg_field_type,
      history.field chg_field,
      history.old_value chg_old_value,
      history.new_value chg_new_value,
      history.old_string chg_old_string,
      history.new_string chg_new_string,
      history.chg_dttm,
      to_char(history.chg_dttm,'YYYY-WW') chg_week,
      to_char(history.chg_dttm,'YYYY-MM') chg_month,
      -- date dim fields joined to change date
      date_dim.school_year sch_yr,
      date_dim.school_year_description sch_yr_long,
      -- user dim fields for user who made the change
      user_dim.user_name chg_user_id,
      user_dim.display_name chg_user_name,
      user_dim.first_name chg_user_fname,
      user_dim.last_name chg_user_lname,
      user_dim.email_address chg_user_email,
      user_dim.email_domain chg_user_domain,
      --user_dim.primary_org chg_user_prim_org,
      user_dim.l1_agent chg_user_is_l1,
      user_dim.l2_agent chg_user_is_l2,
      user_dim.l3_agent chg_user_is_l3,
      user_dim.l4_agent chg_user_is_l4,
      user_dim.l2_coach chg_user_is_l2_coach,
      user_dim.service_acct chg_user_is_end_user,
      user_dim.admin_acct chg_user_is_admin,
      -- org fields for user who made the change
      org_dim.org_name chg_user_org,
      org_dim.org_type chg_user_org_type,
      org_dim.lea_type chg_user_lea_type,
      org_dim.org_cdn chg_user_cdn,
      org_dim.org_domain chg_user_org_domain,
      org_dim.city chg_user_city,
      org_dim.county_name chg_user_county,
      org_dim.region_num chg_user_region,
      org_dim.org_zip chg_user_zip,
      org_dim.lea_enrollment chg_user_enrollment,
      -- issue fields as of point in time data was loaded
      issue.issue_key,
      issue.project_name,
      issue.assignee curr_assignee,
      issue.issue_type curr_issue_type,
      issue.subsystem curr_subsystem,
      issue.summary curr_summary,
      issue.description curr_description,
      issue.environment curr_environment,
      issue.severity curr_severity,
      issue.working_priority curr_working_priority,
      issue.resolution curr_resolution,
      issue.resolution_final,
      issue.issue_status curr_status,
      issue.created_dttm,
      to_char(issue.created_dttm,'YYYY-WW') created_week,
      to_char(issue.created_dttm,'YYYY-MM') created_month,
      --issue.updated_dttm,
      --issue.due_dttm,
      issue.resolved_dttm,
      to_char(issue.resolved_dttm,'YYYY-WW') resolved_week,
      to_char(issue.resolved_dttm,'YYYY-MM') resolved_month,
      --issue.timespent,
      issue.component curr_component,
      issue.escalation_esc curr_escalation_esc,
      issue.reporter reporter,
      issue.l1_security_group l1_sec_grp,
      issue.l2_security_group l2_sec_grp,
      issue.submission_dttm,
      issue.submitter_email,
      issue.submitter_phone,
      issue.submitter_name,
      issue.campus_cdn submitter_campus,
      issue.campus_name submitter_campus_name,
      issue.lea_cdn submitter_cdn,
      issue.submitter_notification_comment
FROM tims_issue_history_fact history
JOIN tims_issue_dim issue ON issue.issue_id = history.issue_id
JOIN tims_user_dim user_dim ON user_dim.user_id = history.user_id
JOIN org_dim ON org_dim.org_sid = history.org_sid
JOIN date_dim ON date_dim.date_sid = history.chg_dt_sid
WHERE issue.issue_key != 'TSDS-173' -- exclude reference ticket
;

prompt
prompt Creating package PKG_TIMS_DATAMART
prompt ==================================
prompt
create or replace package timsrptdata.PKG_TIMS_DATAMART is

  -- Author  : WARNERA
  -- Created : 04/02/2014 5:13:07 PM
  -- Purpose : Functions to support TIMS reporting datamart

  -- Public constant declarations
  c_work_hrs_per_day constant number := 11;
  c_work_start_hr constant number := 7; -- 7am
  c_work_end_hr constant number := 18; -- 6pm

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations

  FUNCTION modify_start_time (p_in_dte DATE) RETURN DATE;
  FUNCTION modify_finish_time (p_in_dte DATE) RETURN DATE;
  FUNCTION get_hrs_to_exclude (p_in_start_date     DATE,
                              p_in_finish_date    DATE) RETURN NUMBER;
  FUNCTION get_work_hrs (p_in_start_date     DATE,
                              p_in_finish_date    DATE) RETURN NUMBER;
  FUNCTION get_prior_week_start_date (p_in_dte DATE) RETURN DATE;
  FUNCTION get_prior_week_end_date (p_in_dte DATE) RETURN DATE;

end PKG_TIMS_DATAMART;
/

prompt
prompt Creating view V_TIMS_ISSUE_TRANSITION
prompt =====================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TIMS_ISSUE_TRANSITION AS
SELECT
      -- change history fields
      history.chg_id,
      history.chg_grp_id,
      --history.field_type chg_field_type,
      --history.field chg_field,
      history.from_step,
      history.to_step,
      history.hrs_in_step,
      -- new HRS_IN_STEP_WORKTIME field to factor out non-work time
      -- assuming 11 hours response window per workday (7a-6p) and excluding weekends
      -- (no holidays factored out)
      pkg_tims_datamart.get_work_hrs(history.in_dttm,history.out_dttm) as hrs_in_step_worktime,
      -- end HRS_IN_STEP_WORKTIME
      history.in_dttm,
      to_char(history.in_dttm,'YYYY-WW') in_week,
      to_char(history.in_dttm,'YYYY-MM') in_month,
      history.out_dttm,
      to_char(history.out_dttm,'YYYY-WW') out_week,
      to_char(history.out_dttm,'YYYY-MM') out_month,
      -- date dim fields joined to in date
      date_dim.school_year in_sch_yr,
      date_dim.school_year_description in_sch_yr_long,
      -- user dim fields for user who made the transition
      user_dim.user_name chg_user_id,
      user_dim.display_name chg_user_name,
      user_dim.first_name chg_user_fname,
      user_dim.last_name chg_user_lname,
      user_dim.email_address chg_user_email,
      user_dim.email_domain chg_user_domain,
      --user_dim.primary_org chg_user_prim_org,
      user_dim.l1_agent chg_user_is_l1,
      user_dim.l2_agent chg_user_is_l2,
      user_dim.l3_agent chg_user_is_l3,
      user_dim.l4_agent chg_user_is_l4,
      user_dim.l2_coach chg_user_is_l2_coach,
      user_dim.service_acct chg_user_is_end_user,
      user_dim.admin_acct chg_user_is_admin,
      -- org fields for user who made the change
      org_dim.org_name chg_user_org,
      org_dim.org_type chg_user_org_type,
      org_dim.lea_type chg_user_lea_type,
      org_dim.org_cdn chg_user_cdn,
      org_dim.org_domain chg_user_org_domain,
      org_dim.city chg_user_city,
      org_dim.county_name chg_user_county,
      org_dim.region_num chg_user_region,
      org_dim.org_zip chg_user_zip,
      org_dim.lea_enrollment chg_user_enrollment,
      -- issue fields as of point in time data was loaded
      issue.issue_key,
      issue.project_name,
      issue.assignee curr_assignee,
      issue.issue_type curr_issue_type,
      issue.subsystem curr_subsystem,
      issue.summary curr_summary,
      issue.description curr_description,
      issue.environment curr_environment,
      issue.severity curr_severity,
      issue.working_priority curr_working_priority,
      issue.resolution curr_resolution,
      issue.resolution_final,
      issue.issue_status curr_status,
      issue.created_dttm,
      to_char(issue.created_dttm,'YYYY-WW') created_week,
      to_char(issue.created_dttm,'YYYY-MM') created_month,
      --issue.updated_dttm,
      --issue.due_dttm,
      issue.resolved_dttm,
      to_char(issue.resolved_dttm,'YYYY-WW') resolved_week,
      to_char(issue.resolved_dttm,'YYYY-MM') resolved_month,
      --issue.timespent,
      issue.component curr_component,
      issue.escalation_esc curr_escalation_esc,
      issue.reporter reporter,
      issue.l1_security_group l1_sec_grp,
      issue.l2_security_group l2_sec_grp,
      issue.submission_dttm,
      issue.submitter_email,
      issue.submitter_phone,
      issue.submitter_name,
      issue.campus_cdn submitter_campus,
      issue.campus_name submitter_campus_name,
      issue.lea_cdn submitter_cdn,
      issue.submitter_notification_comment
FROM tims_issue_transition_fact history
JOIN tims_issue_dim issue ON issue.issue_id = history.issue_id
JOIN tims_user_dim user_dim ON user_dim.user_id = history.user_id
JOIN org_dim ON org_dim.org_sid = history.org_sid
JOIN date_dim ON date_dim.date_sid = history.in_dt_sid
WHERE issue.issue_key != 'TSDS-173' -- exclude reference ticket
;

prompt
prompt Creating view V_TXSTU_ATT_DETAIL_D
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_ATT_DETAIL_D AS
SELECT
 SR_ATT_POST.SCH_YR
,SR_ATT_POST.STU_ID STUDENT_ID
,SR_ATT_POST.CAMPUS_ID
,SR_ATT_POST.ABS_DATE ABSENCE_DATE
,SR_ATT_POST.ABS_PER ABSENCE_PERIOD
,SR_ATT_POST.ABS_TYPE ABSENCE_REASON_CODE
,ST_ATT_POST.POSTING_DECODE ABSENCE_REASON
,ST_ATT_POST.ADA_ABS ADA_TYPE
,SR_ATT_POST.CRS_NBR COURSE_NUMBER
FROM SR_ATT_POST
JOIN ST_ATT_POST ON ST_ATT_POST.SCH_YR = SR_ATT_POST.SCH_YR
                 AND ST_ATT_POST.POST_CD = SR_ATT_POST.ABS_TYPE;

prompt
prompt Creating view V_TXSTU_STU_CAMPUS_MASTER_D
prompt =========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_STU_CAMPUS_MASTER_D AS
SELECT
       MV_TXSTU_STU_CAMPUS_BASE_D.SCH_YR,
       MV_TXSTU_STU_CAMPUS_BASE_D.GRD,
       MV_TXSTU_STU_CAMPUS_BASE_D.GRDSORT,
       TO_DATE(MV_TXSTU_STU_CAMPUS_BASE_D.ENTRY_DT,'YYYYMMDD') ENTRY_DT,
       MV_TXSTU_STU_CAMPUS_BASE_D.TRACK,
       TO_DATE(MV_TXSTU_STU_CAMPUS_BASE_D.ORIG_ENTRY_DT,'YYYYMMDD') ORIG_ENTRY_DT,
       TO_DATE(MV_TXSTU_STU_CAMPUS_BASE_D.WITHDRAWAL_DT,'YYYYMMDD') WITHDRAWAL_DT,
       MV_TXSTU_STU_CAMPUS_BASE_D.WITHDRAWAL_CODE,
       MV_TXSTU_STU_CAMPUS_BASE_D.WITHDRAWAL_REASON,
       MV_TXSTU_STU_CAMPUS_BASE_D.STUDENT_ID,
       MV_TXSTU_STU_CAMPUS_BASE_D.FULL_NAME FULL_NAME,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.FIRST_NAME) FIRST_NAME,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.MIDDLE_NAME) MIDDLE_NAME,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.LAST_NAME) LAST_NAME,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.GEN
           WHEN 'JR' THEN 'Jr'
           WHEN 'SR' THEN 'Sr'
           ELSE MV_TXSTU_STU_CAMPUS_BASE_D.GEN
         END GEN,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.NICKNAME) NICKNAME,
       ELIG_CODE,
       MV_TXSTU_STU_CAMPUS_BASE_D.CAMPUS_ID_RESID,
       MV_TXSTU_STU_CAMPUS_BASE_D.SSN_DENIED,
       MV_TXSTU_STU_CAMPUS_BASE_D.CAMPUS_ID,
       MV_TXSTU_STU_CAMPUS_BASE_D.CAMPUS_NAME,
       MV_TXSTU_STU_CAMPUS_BASE_D.ACTIVE_CD,
       MV_TXSTU_STU_CAMPUS_BASE_D.ACTIVE_DESC,
       MV_TXSTU_STU_CAMPUS_BASE_D.ATTRIBUTION_CD,
       MV_TXSTU_STU_CAMPUS_BASE_D.RECORD_STATUS_CD,
       MV_TXSTU_STU_CAMPUS_BASE_D.RECORD_STATUS_DESC,
       MV_TXSTU_STU_CAMPUS_BASE_D.REP_EXCL,
       MV_TXSTU_STU_CAMPUS_BASE_D.REP_EXCL_DESC,
       MV_TXSTU_STU_CAMPUS_BASE_D.STATE_STUDENT_ID,
       MV_TXSTU_STU_CAMPUS_BASE_D.STATE_PRIOR_ID,
       INITCAP(REPLACE(MV_TXSTU_STU_CAMPUS_BASE_D.MAIL_ADDRESS,'##','#')) MAIL_ADDRESS,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.MAIL_CITY) MAIL_CITY,
       MV_TXSTU_STU_CAMPUS_BASE_D.MAIL_STATE,
       MV_TXSTU_STU_CAMPUS_BASE_D.MAIL_ZIP,
       MV_TXSTU_STU_CAMPUS_BASE_D.SEX,
       TO_DATE(MV_TXSTU_STU_CAMPUS_BASE_D.DOB,'YYYYMMDD') DOB,
       TO_NUMBER(MV_TXSTU_STU_CAMPUS_BASE_D.HISPANIC_NUM) HISPANIC_NUM,
       TO_NUMBER(MV_TXSTU_STU_CAMPUS_BASE_D.AMER_INDIAN_NUM) AMER_INDIAN_NUM,
       TO_NUMBER(MV_TXSTU_STU_CAMPUS_BASE_D.ASIAN_NUM) ASIAN_NUM,
       TO_NUMBER(MV_TXSTU_STU_CAMPUS_BASE_D.BLACK_NUM) BLACK_NUM,
       TO_NUMBER(MV_TXSTU_STU_CAMPUS_BASE_D.PACIFIC_ISL_NUM) PACIFIC_ISL_NUM,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.HISPANIC_NUM
         WHEN '1' THEN 'Yes'
         ELSE 'No'
       END HISPANIC,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.AMER_INDIAN_NUM
         WHEN '1' THEN 'Yes'
         ELSE 'No'
       END AMER_INDIAN,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.ASIAN_NUM
         WHEN '1' THEN 'Yes'
         ELSE 'No'
       END ASIAN,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.BLACK_NUM
         WHEN '1' THEN 'Yes'
         ELSE 'No'
       END BLACK,
       CASE MV_TXSTU_STU_CAMPUS_BASE_D.PACIFIC_ISL_NUM
         WHEN '1' THEN 'Yes'
         ELSE 'No'
       END PACIFIC_ISL,
       MV_TXSTU_STU_CAMPUS_BASE_D.AGGREGATE_RACE_ETHNICITY,
       MV_TXSTU_STU_CAMPUS_BASE_D.PHONE_NUMBER,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.READING_ELA_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.READING_ELA_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.READING_ELA_MASTERY,5,2)
       END READING_ELA_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.WRITING_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.WRITING_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.WRITING_MASTERY,5,2)
       END WRITING_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.MATH_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.MATH_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.MATH_MASTERY,5,2)
       END MATH_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.SOCIAL_STUDIES_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.SOCIAL_STUDIES_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.SOCIAL_STUDIES_MASTERY,5,2)
       END SOCIAL_STUDIES_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.SCIENCE_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.SCIENCE_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.SCIENCE_MASTERY,5,2)
       END SCIENCE_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_READING_ELA_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_READING_ELA_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_READING_ELA_MASTERY,5,2)
       END EXIT_READING_ELA_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_MATH_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_MATH_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_MATH_MASTERY,5,2)
       END EXIT_MATH_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SOCIAL_STUDIES_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SOCIAL_STUDIES_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SOCIAL_STUDIES_MASTERY,5,2)
       END EXIT_SOCIAL_STUDIES_MASTERY,
       CASE
         WHEN TRIM(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SCIENCE_MASTERY) IS NULL THEN NULL
         ELSE SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SCIENCE_MASTERY,1,4)||'/'||SUBSTR(MV_TXSTU_STU_CAMPUS_BASE_D.EXIT_SCIENCE_MASTERY,5,2)
       END EXIT_SCIENCE_MASTERY,
       INITCAP(REPLACE(MV_TXSTU_STU_CAMPUS_BASE_D.PHYSICAL_ADDRESS,'##','#')) PHYSICAL_ADDRESS,
       INITCAP(MV_TXSTU_STU_CAMPUS_BASE_D.PHYSICAL_ADDRESS_CITY) PHYSICAL_ADDRESS_CITY,
       MV_TXSTU_STU_CAMPUS_BASE_D.PHYSICAL_ADDRESS_STATE,
       MV_TXSTU_STU_CAMPUS_BASE_D.PHYSICAL_ADDRESS_ZIP
  FROM MV_TXSTU_STU_CAMPUS_BASE_D
   JOIN (SELECT DISTINCT MV_TXSTU_STU_CAMPUS_BASE_D.STUDENT_ID AS STU_ID
              ,MV_TXSTU_STU_CAMPUS_BASE_D.SCH_YR
              ,'TRUE' AS DISTRICT_USER
          FROM TXSTU_USER_STUDENT_SECURITY
          JOIN MV_TXSTU_STU_CAMPUS_BASE_D
               ON 1 = 1
         WHERE TXSTU_USER_STUDENT_SECURITY.STU_ID = '-9999'
           AND TXSTU_USER_STUDENT_SECURITY.SCH_YR = '9999'
           AND TXSTU_USER_STUDENT_SECURITY.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME')
       UNION
        SELECT TXSTU_USER_STUDENT_SECURITY.STU_ID
              ,TXSTU_USER_STUDENT_SECURITY.SCH_YR
              ,'FALSE' AS DISTRICT_USER
          FROM TXSTU_USER_STUDENT_SECURITY
         WHERE TXSTU_USER_STUDENT_SECURITY.STU_ID <> '-9999'
           AND TXSTU_USER_STUDENT_SECURITY.SCH_YR <> '9999'
           AND TXSTU_USER_STUDENT_SECURITY.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME') ) TXSTU_USER_STU_SEC
        ON (TXSTU_USER_STU_SEC.STU_ID = MV_TXSTU_STU_CAMPUS_BASE_D.STUDENT_ID
        AND TXSTU_USER_STU_SEC.SCH_YR = MV_TXSTU_STU_CAMPUS_BASE_D.SCH_YR);

prompt
prompt Creating view V_TXSTU_STU_CAMPUS_MASTER
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_STU_CAMPUS_MASTER AS
SELECT SCH_YR,
       GRD,
       GRDSORT,
       ENTRY_DT,
       TRACK,
       ORIG_ENTRY_DT,
       WITHDRAWAL_DT,
       WITHDRAWAL_CODE,
       WITHDRAWAL_REASON,
       STUDENT_ID,
       FULL_NAME,
       FIRST_NAME,
       MIDDLE_NAME,
       LAST_NAME,
       GEN,
       NICKNAME,
       ELIG_CODE,
       CAMPUS_ID_RESID,
       SSN_DENIED,
       CAMPUS_ID,
       CAMPUS_NAME,
       ACTIVE_CD,
       ACTIVE_DESC,
       ATTRIBUTION_CD,
       RECORD_STATUS_CD,
       RECORD_STATUS_DESC,
       REP_EXCL,
       REP_EXCL_DESC,
       STATE_STUDENT_ID,
       STATE_PRIOR_ID,
       MAIL_ADDRESS,
       MAIL_CITY,
       MAIL_STATE,
       MAIL_ZIP,
       SEX,
       DOB,
       HISPANIC_NUM,
       AMER_INDIAN_NUM,
       ASIAN_NUM,
       BLACK_NUM,
       PACIFIC_ISL_NUM,
       HISPANIC,
       AMER_INDIAN,
       ASIAN,
       BLACK,
       PACIFIC_ISL,
       CASE -- bonus column not in the source from the fed requirements
         WHEN AMER_INDIAN_NUM+ASIAN_NUM+BLACK_NUM+PACIFIC_ISL_NUM>1 THEN 'Yes'
         ELSE 'No'
       END TWO_OR_MORE_RACES,
       AGGREGATE_RACE_ETHNICITY,
       PHONE_NUMBER,
       READING_ELA_MASTERY,
       WRITING_MASTERY,
       MATH_MASTERY,
       SOCIAL_STUDIES_MASTERY,
       SCIENCE_MASTERY,
       EXIT_READING_ELA_MASTERY,
       EXIT_MATH_MASTERY,
       EXIT_SOCIAL_STUDIES_MASTERY,
       EXIT_SCIENCE_MASTERY,
       PHYSICAL_ADDRESS,
       PHYSICAL_ADDRESS_CITY,
       PHYSICAL_ADDRESS_STATE,
       PHYSICAL_ADDRESS_ZIP
  FROM V_TXSTU_STU_CAMPUS_MASTER_D
;

prompt
prompt Creating view V_TXSTU_ATT_STU_ENROLL_DETAIL
prompt ===========================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_ATT_STU_ENROLL_DETAIL AS
SELECT
V_TXSTU_STU_CAMPUS_MASTER.SCH_YR,
V_TXSTU_STU_CAMPUS_MASTER.GRD,
V_TXSTU_STU_CAMPUS_MASTER.GRDSORT,
V_TXSTU_STU_CAMPUS_MASTER.ENTRY_DT,
V_TXSTU_STU_CAMPUS_MASTER.TRACK,
V_TXSTU_STU_CAMPUS_MASTER.ORIG_ENTRY_DT,
V_TXSTU_STU_CAMPUS_MASTER.WITHDRAWAL_DT,
V_TXSTU_STU_CAMPUS_MASTER.WITHDRAWAL_CODE,
V_TXSTU_STU_CAMPUS_MASTER.WITHDRAWAL_REASON,
V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID,
V_TXSTU_STU_CAMPUS_MASTER.FULL_NAME,
V_TXSTU_STU_CAMPUS_MASTER.FIRST_NAME,
V_TXSTU_STU_CAMPUS_MASTER.MIDDLE_NAME,
V_TXSTU_STU_CAMPUS_MASTER.LAST_NAME,
V_TXSTU_STU_CAMPUS_MASTER.GEN,
V_TXSTU_STU_CAMPUS_MASTER.NICKNAME,
V_TXSTU_STU_CAMPUS_MASTER.ELIG_CODE,
V_TXSTU_STU_CAMPUS_MASTER.CAMPUS_ID_RESID,
V_TXSTU_STU_CAMPUS_MASTER.SSN_DENIED,
V_TXSTU_STU_CAMPUS_MASTER.CAMPUS_ID,
V_TXSTU_STU_CAMPUS_MASTER.CAMPUS_NAME,
V_TXSTU_STU_CAMPUS_MASTER.ACTIVE_CD,
V_TXSTU_STU_CAMPUS_MASTER.ACTIVE_DESC,
V_TXSTU_STU_CAMPUS_MASTER.ATTRIBUTION_CD,
V_TXSTU_STU_CAMPUS_MASTER.RECORD_STATUS_CD,
V_TXSTU_STU_CAMPUS_MASTER.RECORD_STATUS_DESC,
V_TXSTU_STU_CAMPUS_MASTER.REP_EXCL,
V_TXSTU_STU_CAMPUS_MASTER.REP_EXCL_DESC,
V_TXSTU_STU_CAMPUS_MASTER.STATE_STUDENT_ID,
V_TXSTU_STU_CAMPUS_MASTER.STATE_PRIOR_ID,
V_TXSTU_STU_CAMPUS_MASTER.MAIL_ADDRESS,
V_TXSTU_STU_CAMPUS_MASTER.MAIL_CITY,
V_TXSTU_STU_CAMPUS_MASTER.MAIL_STATE,
V_TXSTU_STU_CAMPUS_MASTER.MAIL_ZIP,
V_TXSTU_STU_CAMPUS_MASTER.SEX,
V_TXSTU_STU_CAMPUS_MASTER.DOB,
V_TXSTU_STU_CAMPUS_MASTER.HISPANIC_NUM,
V_TXSTU_STU_CAMPUS_MASTER.AMER_INDIAN_NUM,
V_TXSTU_STU_CAMPUS_MASTER.ASIAN_NUM,
V_TXSTU_STU_CAMPUS_MASTER.BLACK_NUM,
V_TXSTU_STU_CAMPUS_MASTER.PACIFIC_ISL_NUM,
V_TXSTU_STU_CAMPUS_MASTER.HISPANIC,
V_TXSTU_STU_CAMPUS_MASTER.AMER_INDIAN,
V_TXSTU_STU_CAMPUS_MASTER.ASIAN,
V_TXSTU_STU_CAMPUS_MASTER.BLACK,
V_TXSTU_STU_CAMPUS_MASTER.PACIFIC_ISL,
V_TXSTU_STU_CAMPUS_MASTER.TWO_OR_MORE_RACES,
V_TXSTU_STU_CAMPUS_MASTER.AGGREGATE_RACE_ETHNICITY,
V_TXSTU_STU_CAMPUS_MASTER.PHONE_NUMBER,
V_TXSTU_STU_CAMPUS_MASTER.READING_ELA_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.WRITING_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.MATH_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.SOCIAL_STUDIES_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.SCIENCE_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.EXIT_READING_ELA_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.EXIT_MATH_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.EXIT_SOCIAL_STUDIES_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.EXIT_SCIENCE_MASTERY,
V_TXSTU_STU_CAMPUS_MASTER.PHYSICAL_ADDRESS,
V_TXSTU_STU_CAMPUS_MASTER.PHYSICAL_ADDRESS_CITY,
V_TXSTU_STU_CAMPUS_MASTER.PHYSICAL_ADDRESS_STATE,
V_TXSTU_STU_CAMPUS_MASTER.PHYSICAL_ADDRESS_ZIP,
TO_DATE(V_TXSTU_ATT_DETAIL_D.ABSENCE_DATE,'YYYYMMDD') ABSENCE_DATE,
V_TXSTU_ATT_DETAIL_D.ABSENCE_PERIOD,
V_TXSTU_ATT_DETAIL_D.ABSENCE_REASON_CODE,
INITCAP(V_TXSTU_ATT_DETAIL_D.ABSENCE_REASON) ABSENCE_REASON,
V_TXSTU_ATT_DETAIL_D.ADA_TYPE,
V_TXSTU_ATT_DETAIL_D.COURSE_NUMBER
FROM V_TXSTU_STU_CAMPUS_MASTER
JOIN V_TXSTU_ATT_DETAIL_D ON V_TXSTU_ATT_DETAIL_D.SCH_YR = V_TXSTU_STU_CAMPUS_MASTER.SCH_YR
                       AND V_TXSTU_ATT_DETAIL_D.STUDENT_ID = V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID
                       AND V_TXSTU_ATT_DETAIL_D.CAMPUS_ID = V_TXSTU_STU_CAMPUS_MASTER.CAMPUS_ID;

prompt
prompt Creating view V_TXSTU_CONTACT_PARENT_D
prompt ======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_CONTACT_PARENT_D AS
SELECT
SR_PARENT.SCH_YR SCH_YR
,SR_PARENT.STU_ID STUDENT_ID
,SR_PARENT.SEQ_NO
,INITCAP(SR_PARENT.NAME_L) PARENT_LAST_NAME
,INITCAP(SR_PARENT.NAME_F) PARENT_FIRST_NAME
,INITCAP(SR_PARENT.NAME_M) PARENT_MIDDLE_NAME
,INITCAP(SR_PARENT.name_l||', '||SR_PARENT.Name_f||' '||nvl(SR_PARENT.name_m,null)) PARENT_NAME
,SR_PARENT.GEN PARENT_GEN
,SR_PARENT.relat RELATION_CD
,ST_RELATION.DESCRIPTION RELATIONSHIP
,TRIM(SR_PARENT.STR_NBR||' '||INITCAP(SR_PARENT.STR_NAME)||' '||CASE WHEN TRIM(INITCAP(SR_PARENT.APT_NBR)) IS NULL THEN NULL ELSE ' #'||INITCAP(SR_PARENT.APT_NBR) END) ADDRESS
,TRIM(SR_PARENT.CITY) CITY
,TRIM(SR_PARENT.STATE_CD) STATE
,TRIM(SR_PARENT.ZIP) ZIP
,TRIM(SR_PARENT.SSN) PARENT_SSN
,CASE
WHEN trim(SR_PARENT.phone_nbr) IS NULL
  THEN NULL
    ELSE '('||SR_PARENT.phone_area_cd||') '||substr(SR_PARENT.phone_nbr,1,3)||'-'||substr(SR_PARENT.phone_nbr,4,7) END HOME_PHONE
,CASE
WHEN trim(SR_PARENT.phone_nbr_bus)IS NULL
  THEN NULL
    ELSE '('||SR_PARENT.phone_area_cd_bus||') '||substr(SR_PARENT.phone_nbr_bus,1,3)||'-'||substr(SR_PARENT.phone_nbr_bus,4,7)||
      (CASE
      WHEN trim(SR_PARENT.phone_ext_bus) IS NULL
        THEN NULL
          ELSE ' Ext: '||SR_PARENT.phone_ext_bus END)  END BUSINESS_PHONE
,CASE
WHEN trim(SR_PARENT.other_phone_nbr)IS NULL
  THEN NULL
    ELSE '('||SR_PARENT.other_phone_ac||') '||substr(SR_PARENT.other_phone_nbr,1,3)||'-'||substr(SR_PARENT.other_phone_nbr,4,7)||
      (CASE
      WHEN trim(SR_PARENT.other_phone_ext)IS NULL
        THEN NULL
          ELSE ' Ext: '||SR_PARENT.other_phone_ext END) END OTHER_PHONE
,SR_PARENT.OCCUPATION OCCUPATION
,SR_PARENT.PRIMARY_FLAG GUARDIAN
,SR_PARENT.emergency_flag EMERGENCY_CONTACT
,SR_PARENT.migrant_flag MIGRANT
,SR_PARENT.mil_ind PARENT_MILITARY
,SR_PARENT.mil_branch BRANCH_OF_SERVICE
,SR_PARENT.mil_rank MIL_RANK
,SR_PARENT.email EMAIL
,SR_PARENT.DOB PARENT_DOB
,SR_PARENT.ENROLL_PAR_IND ENROLL_PAR_IND
from
SR_PARENT
LEFT JOIN ST_RELATION ON ST_RELATION.SCH_YR = SR_PARENT.SCH_YR
                      AND ST_RELATION.RELATION_CD = TRIM(SR_PARENT.RELAT);

prompt
prompt Creating view V_TXSTU_CONTACT_PARENT
prompt ====================================
prompt
create or replace force view timsrptdata.v_txstu_contact_parent as
select distinct
V_TXSTU_STU_CAMPUS_MASTER.sch_yr,
V_TXSTU_STU_CAMPUS_MASTER.grd,
V_TXSTU_STU_CAMPUS_MASTER.grdsort,
V_TXSTU_STU_CAMPUS_MASTER.entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.track,
V_TXSTU_STU_CAMPUS_MASTER.orig_entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_code,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_reason,
V_TXSTU_STU_CAMPUS_MASTER.student_id,
V_TXSTU_STU_CAMPUS_MASTER.full_name,
V_TXSTU_STU_CAMPUS_MASTER.first_name,
V_TXSTU_STU_CAMPUS_MASTER.middle_name,
V_TXSTU_STU_CAMPUS_MASTER.last_name,
V_TXSTU_STU_CAMPUS_MASTER.gen,
V_TXSTU_STU_CAMPUS_MASTER.nickname,
V_TXSTU_STU_CAMPUS_MASTER.elig_code,
V_TXSTU_STU_CAMPUS_MASTER.campus_id_resid,
V_TXSTU_STU_CAMPUS_MASTER.ssn_denied,
V_TXSTU_STU_CAMPUS_MASTER.campus_id,
V_TXSTU_STU_CAMPUS_MASTER.campus_name,
V_TXSTU_STU_CAMPUS_MASTER.active_cd,
V_TXSTU_STU_CAMPUS_MASTER.active_desc,
V_TXSTU_STU_CAMPUS_MASTER.attribution_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_desc,
V_TXSTU_STU_CAMPUS_MASTER.rep_excl,
V_TXSTU_STU_CAMPUS_MASTER.rep_excl_desc,
V_TXSTU_STU_CAMPUS_MASTER.state_student_id,
V_TXSTU_STU_CAMPUS_MASTER.state_prior_id,
V_TXSTU_STU_CAMPUS_MASTER.mail_address,
V_TXSTU_STU_CAMPUS_MASTER.mail_city,
V_TXSTU_STU_CAMPUS_MASTER.mail_state,
V_TXSTU_STU_CAMPUS_MASTER.mail_zip,
V_TXSTU_CONTACT_PARENT_D.parent_last_name,
V_TXSTU_CONTACT_PARENT_D.parent_first_name,
V_TXSTU_CONTACT_PARENT_D.parent_middle_name,
V_TXSTU_CONTACT_PARENT_D.parent_name,
V_TXSTU_CONTACT_PARENT_D.parent_gen,
V_TXSTU_CONTACT_PARENT_D.relation_cd,
V_TXSTU_CONTACT_PARENT_D.relationship,
V_TXSTU_CONTACT_PARENT_D.address,
V_TXSTU_CONTACT_PARENT_D.city,
V_TXSTU_CONTACT_PARENT_D.state,
V_TXSTU_CONTACT_PARENT_D.zip,
V_TXSTU_CONTACT_PARENT_D.parent_ssn,
V_TXSTU_CONTACT_PARENT_D.home_phone,
V_TXSTU_CONTACT_PARENT_D.business_phone,
V_TXSTU_CONTACT_PARENT_D.other_phone,
V_TXSTU_CONTACT_PARENT_D.occupation,
V_TXSTU_CONTACT_PARENT_D.guardian,
V_TXSTU_CONTACT_PARENT_D.emergency_contact,
V_TXSTU_CONTACT_PARENT_D.migrant,
V_TXSTU_CONTACT_PARENT_D.parent_military,
V_TXSTU_CONTACT_PARENT_D.branch_of_service,
V_TXSTU_CONTACT_PARENT_D.mil_rank,
V_TXSTU_CONTACT_PARENT_D.email,
CASE
  WHEN TRIM(V_TXSTU_CONTACT_PARENT_D.parent_dob) IS NULL
    THEN NULL
      ELSE V_TXSTU_CONTACT_PARENT_D.parent_dob END parent_dob_dt,
V_TXSTU_CONTACT_PARENT_D.enroll_par_ind
 from V_TXSTU_CONTACT_PARENT_D
 INNER JOIN V_TXSTU_STU_CAMPUS_MASTER
 ON V_TXSTU_CONTACT_PARENT_D.STUDENT_ID = V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID
 AND V_TXSTU_CONTACT_PARENT_D.SCH_YR = V_TXSTU_STU_CAMPUS_MASTER.SCH_YR;

prompt
prompt Creating view V_TXSTU_GRADEBK_LOGIN_D
prompt =====================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_GRADEBK_LOGIN_D AS
SELECT SR_GRADEBK_LOGIN.USER_ID,
       SR_GRADEBK_LOGIN.ACTIVE_CD,
       TRIM(SR_GRADEBK_LOGIN.DT_PSWD_EXPR) PASSWORD_EXPIRE_DT,
       TRIM(SR_GRADEBK_LOGIN.DT_L_CHG_PSWD) PASSWORD_LAST_CHG_DT,
       TRIM(SR_GRADEBK_LOGIN.DT_L_UPDT) LAST_UPDATE_DT,
       SR_GRADEBK_LOGIN.PIN,
       SR_GRADEBK_LOGIN.TYP_USER USER_TYPE,
       SR_HINT_QUES.QUES SECURITY_QUESTION,
       SR_GRADEBK_HINT_INST.ANS ANSWER
  FROM SR_GRADEBK_LOGIN
  JOIN SR_GRADEBK_HINT_INST ON SR_GRADEBK_HINT_INST.USER_ID = SR_GRADEBK_LOGIN.USER_ID
  JOIN SR_HINT_QUES ON SR_HINT_QUES.QUES_ID = SR_GRADEBK_HINT_INST.QUES_ID;

prompt
prompt Creating view V_TXSTU_GRADEBK_LOGIN
prompt ===================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_GRADEBK_LOGIN AS
SELECT USER_ID,
       ACTIVE_CD,
       TO_DATE(PASSWORD_EXPIRE_DT,'YYYYMMDD') PASSWORD_EXPIRE_DT,
       TO_DATE(PASSWORD_LAST_CHG_DT,'YYYYMMDD') PASSWORD_LAST_CHG_DT,
       TO_DATE(LAST_UPDATE_DT,'YYYYMMDD') LAST_UPDATE_DT,
       PIN,
       USER_TYPE,
       SECURITY_QUESTION,
       ANSWER
  FROM V_TXSTU_GRADEBK_LOGIN_D;

prompt
prompt Creating view V_TXSTU_GRADES_D
prompt ==============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_GRADES_D AS
SELECT
  SR_CRS_GRD.SCH_YR
  ,SR_CRS_GRD.CAMPUS_ID
  ,SR_CRS_GRD.STU_ID
  ,SR_CRS_GRD.CRS_NBR CRS_NUM
  ,DR_CRS_OFFERED_CYR.TITLE CRS_TITLE
  ,DR_CRS_OFFERED_CYR.ABBREV_NAME CRS_ABBREV
  ,DR_CRS_OFFERED_CYR.SVC_ID SERVICE_ID
  ,DR_CRS_OFFERED_CYR.CORE_CRS_CD
  ,SR_CRS_GRD.SEC_NBR
  ,SR_CRS_GRD.CRS_SEM_ENROLL SEM
  ,SR_CRS_GRD.DT_ENTRY CRS_ENTRY_DT
  ,SR_CRS_GRD.DT_WD CRS_WD_DT
  ,SR_CRS_GRD.GRD_CYC1 CYC1
  ,SR_CRS_GRD.GRD_CYC2 CYC2
  ,SR_CRS_GRD.GRD_CYC3 CYC3
  ,SR_CRS_GRD.GRD_EXAM EXAM
  ,SR_CRS_GRD.GRD_SEM SEM_GRD
  ,SR_CRS_GRD.GRD_FINAL FINAL_GRD
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_CYC1,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_CYC1) ELSE NULL END AS CYC1_NUM
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_CYC2,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_CYC2) ELSE NULL END AS CYC2_NUM
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_CYC3,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_CYC3) ELSE NULL END AS CYC3_NUM
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_EXAM,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_EXAM) ELSE NULL END AS EXAM_NUM
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_SEM,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_SEM) ELSE NULL END AS SEM_GRD_NUM
  ,CASE WHEN TRANSLATE(SR_CRS_GRD.GRD_FINAL,'.0123456789','.') IS NULL
        THEN TO_NUMBER(SR_CRS_GRD.GRD_FINAL) ELSE NULL END AS FINAL_GRD_NUM
  ,SR_CRS_GRD.COMMENTS_CYC1_1
  ,SR_CRS_GRD.COMMENTS_CYC1_2
  ,SR_CRS_GRD.COMMENTS_CYC1_3
  ,SR_CRS_GRD.COMMENTS_CYC1_4
  ,SR_CRS_GRD.COMMENTS_CYC1_5
  ,SR_CRS_GRD.COMMENTS_CYC2_1
  ,SR_CRS_GRD.COMMENTS_CYC2_2
  ,SR_CRS_GRD.COMMENTS_CYC2_3
  ,SR_CRS_GRD.COMMENTS_CYC2_4
  ,SR_CRS_GRD.COMMENTS_CYC2_5
  ,SR_CRS_GRD.COMMENTS_CYC3_1
  ,SR_CRS_GRD.COMMENTS_CYC3_2
  ,SR_CRS_GRD.COMMENTS_CYC3_3
  ,SR_CRS_GRD.COMMENTS_CYC3_4
  ,SR_CRS_GRD.COMMENTS_CYC3_5
  ,SR_CRS_GRD.CONDUCT_CYC1
  ,SR_CRS_GRD.CONDUCT_CYC2
  ,SR_CRS_GRD.CONDUCT_CYC3
  ,SR_CRS_GRD.CRS_CREDIT CREDIT
  ,SR_CRS_GRD.AAR_USE_CD AAR_USE
  ,SR_CRS_GRD.CRS_SPEC_CONSIDER STU_CRS_SPECIAL_CONSIDER
  ,SR_CRS_GRD.PASS_FAIL_CREDIT_IND PASS_OR_FAIL
  ,SR_CRS_GRD.HONORS_CRS HONORS
  ,SR_CRS_GRD.SPEC_ED_PASS_GRD
  ,SR_CRS_GRD.EXCL_GRD_COMPUTE
  ,SR_CRS_GRD.SVC_ID_CHG SERVICE_ID_OVERRIDE
  ,SR_CRS_GRD.INCL_ELIG
  ,SR_CRS_GRD.XFER_CRS TRANSFERRED
  ,SR_CRS_GRD.EOC_SEM EOC_SEM
  ,SR_CRS_GRD.EOC_ASSESS_SCR
  ,SR_CRS_GRD.EOC_FINAL
FROM SR_CRS_GRD
  JOIN DR_CRS_OFFERED_CYR
      ON SR_CRS_GRD.SCH_YR = DR_CRS_OFFERED_CYR.SCH_YR
      AND SR_CRS_GRD.CRS_NBR = DR_CRS_OFFERED_CYR.CRS_NBR;

prompt
prompt Creating view V_TXSTU_GRADES
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_GRADES AS
SELECT
  STUDENT.SCH_YR
  ,STUDENT.CAMPUS_ID
  ,STUDENT.CAMPUS_NAME
  ,STUDENT.STUDENT_ID
  ,STUDENT.FULL_NAME
  ,STUDENT.FIRST_NAME
  ,STUDENT.MIDDLE_NAME
  ,STUDENT.LAST_NAME
  ,STUDENT.GEN
  ,STUDENT.NICKNAME
  ,STUDENT.GRD
  ,STUDENT.GRDSORT
  ,GRADES.CRS_NUM
  ,GRADES.CRS_TITLE
  ,GRADES.CRS_ABBREV
  ,GRADES.CORE_CRS_CD
  --,GRADES.SCH_YR||'-'||GRADES.CORE_CRS_CD CORE_CRS_DESC -- future, not pop. in dev data
  ,GRADES.SEC_NBR
  ,GRADES.SEM
  ,TO_DATE(GRADES.CRS_ENTRY_DT,'YYYYMMDD') CRS_ENTRY_DT
  ,TO_DATE(GRADES.CRS_WD_DT,'YYYYMMDD') CRS_WD_DT
  ,GRADES.CYC1
  ,GRADES.CYC2
  ,GRADES.CYC3
  ,GRADES.EXAM
  ,GRADES.SEM_GRD
  ,GRADES.FINAL_GRD
  ,GRADES.CYC1_NUM
  ,GRADES.CYC2_NUM
  ,GRADES.CYC3_NUM
  ,GRADES.EXAM_NUM
  ,GRADES.SEM_GRD_NUM
  ,GRADES.FINAL_GRD_NUM
  ,GRADES.COMMENTS_CYC1_1
  ,GRADES.COMMENTS_CYC1_2
  ,GRADES.COMMENTS_CYC1_3
  ,GRADES.COMMENTS_CYC1_4
  ,GRADES.COMMENTS_CYC1_5
  ,GRADES.COMMENTS_CYC2_1
  ,GRADES.COMMENTS_CYC2_2
  ,GRADES.COMMENTS_CYC2_3
  ,GRADES.COMMENTS_CYC2_4
  ,GRADES.COMMENTS_CYC2_5
  ,GRADES.COMMENTS_CYC3_1
  ,GRADES.COMMENTS_CYC3_2
  ,GRADES.COMMENTS_CYC3_3
  ,GRADES.COMMENTS_CYC3_4
  ,GRADES.COMMENTS_CYC3_5
  ,GRADES.CONDUCT_CYC1
  ,GRADES.CONDUCT_CYC2
  ,GRADES.CONDUCT_CYC3
  ,GRADES.CREDIT
  ,GRADES.AAR_USE
  ,GRADES.STU_CRS_SPECIAL_CONSIDER
  ,GRADES.PASS_OR_FAIL
  ,GRADES.HONORS
  ,GRADES.SPEC_ED_PASS_GRD
  ,GRADES.EXCL_GRD_COMPUTE
  ,GRADES.SERVICE_ID
  ,GRADES.SERVICE_ID_OVERRIDE
  ,GRADES.INCL_ELIG
  ,GRADES.TRANSFERRED
  ,GRADES.EOC_SEM
  ,GRADES.EOC_ASSESS_SCR
  ,GRADES.EOC_FINAL
  ,STUDENT.SEX
  ,STUDENT.DOB
  ,STUDENT.PHONE_NUMBER
  ,STUDENT.ELIG_CODE
  ,STUDENT.ENTRY_DT
  ,STUDENT.TRACK
  ,STUDENT.ORIG_ENTRY_DT
  ,STUDENT.WITHDRAWAL_DT
  ,STUDENT.ACTIVE_CD
  ,STUDENT.ACTIVE_DESC
  ,STUDENT.RECORD_STATUS_CD
  ,STUDENT.RECORD_STATUS_DESC
  ,STUDENT.REP_EXCL
  ,STUDENT.REP_EXCL_DESC
  ,STUDENT.SSN_DENIED
  ,STUDENT.STATE_STUDENT_ID
  ,STUDENT.STATE_PRIOR_ID
  ,STUDENT.HISPANIC_NUM
  ,STUDENT.AMER_INDIAN_NUM
  ,STUDENT.ASIAN_NUM
  ,STUDENT.BLACK_NUM
  ,STUDENT.PACIFIC_ISL_NUM
  ,STUDENT.HISPANIC
  ,STUDENT.AMER_INDIAN
  ,STUDENT.ASIAN
  ,STUDENT.BLACK
  ,STUDENT.PACIFIC_ISL
  ,STUDENT.TWO_OR_MORE_RACES
  ,STUDENT.AGGREGATE_RACE_ETHNICITY
  ,STUDENT.READING_ELA_MASTERY
  ,STUDENT.WRITING_MASTERY
  ,STUDENT.MATH_MASTERY
  ,STUDENT.SOCIAL_STUDIES_MASTERY
  ,STUDENT.SCIENCE_MASTERY
  ,STUDENT.EXIT_READING_ELA_MASTERY
  ,STUDENT.EXIT_MATH_MASTERY
  ,STUDENT.EXIT_SOCIAL_STUDIES_MASTERY
  ,STUDENT.EXIT_SCIENCE_MASTERY
FROM
  V_TXSTU_GRADES_D  GRADES
  JOIN V_TXSTU_STU_CAMPUS_MASTER STUDENT
       ON GRADES.STU_ID = STUDENT.STUDENT_ID
       AND GRADES.CAMPUS_ID = STUDENT.CAMPUS_ID
       AND GRADES.SCH_YR = STUDENT.SCH_YR
;

prompt
prompt Creating view V_TXSTU_IMMUNIZ_D
prompt ===============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_IMMUNIZ_D AS
SELECT
STU_ID STUDENT_ID,
IMMUNIZ_DATE IMMUNIZATION_DATE,
DT_TIME_STAMP DATETIME_STAMP,
SERIES_TYPE SERIES_TYPE,
SERIES_TYPE.SERIES_DESC,
EXEMPT_FLAG EXEMPT_FLAG,
REACTION_FLAG REACTION_FLAG,
IMMUNIZ_TYPE IMMUNIZATION_TYPE,
IMMUMIZ_TYP.IMMUNIZ_TYP_DESC IMMUNIZATION_DESC,
PARTIAL_AMOUNT PARTIAL_AMOUNT,
AFFIDAVIT_DATE AFFIDAVIT_DATE
from
SR_IMMUNIZ
JOIN (SELECT DISTINCT
      IMMUNIZ_TYP_CD,
      IMMUNIZ_TYP_DESC
     FROM ST_IMMUNIZ_TYP) IMMUMIZ_TYP
 ON IMMUMIZ_TYP.IMMUNIZ_TYP_CD = SR_IMMUNIZ.IMMUNIZ_TYPE
JOIN (SELECT DISTINCT
      SERIES_TYP,
      SERIES_DESC
      FROM ST_SERIES_TYPE) SERIES_TYPE
ON SERIES_TYPE.SERIES_TYP = SR_IMMUNIZ.SERIES_TYPE;

prompt
prompt Creating view V_TXSTU_IMMUNIZ
prompt =============================
prompt
create or replace force view timsrptdata.v_txstu_immuniz as
select distinct
V_TXSTU_STU_CAMPUS_MASTER.sch_yr,
V_TXSTU_STU_CAMPUS_MASTER.grd,
V_TXSTU_STU_CAMPUS_MASTER.grdsort,
V_TXSTU_STU_CAMPUS_MASTER.entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.track,
V_TXSTU_STU_CAMPUS_MASTER.orig_entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_code,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_reason,
V_TXSTU_STU_CAMPUS_MASTER.student_id,
V_TXSTU_STU_CAMPUS_MASTER.full_name,
V_TXSTU_STU_CAMPUS_MASTER.first_name,
V_TXSTU_STU_CAMPUS_MASTER.middle_name,
V_TXSTU_STU_CAMPUS_MASTER.last_name,
V_TXSTU_STU_CAMPUS_MASTER.gen,
V_TXSTU_STU_CAMPUS_MASTER.nickname,
V_TXSTU_STU_CAMPUS_MASTER.elig_code,
V_TXSTU_STU_CAMPUS_MASTER.campus_id_resid,
V_TXSTU_STU_CAMPUS_MASTER.ssn_denied,
V_TXSTU_STU_CAMPUS_MASTER.campus_id,
V_TXSTU_STU_CAMPUS_MASTER.campus_name,
V_TXSTU_STU_CAMPUS_MASTER.active_cd,
V_TXSTU_STU_CAMPUS_MASTER.active_desc,
V_TXSTU_STU_CAMPUS_MASTER.attribution_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_desc,
V_TXSTU_STU_CAMPUS_MASTER.rep_excl,
V_TXSTU_STU_CAMPUS_MASTER.rep_excl_desc,
V_TXSTU_STU_CAMPUS_MASTER.state_student_id,
V_TXSTU_STU_CAMPUS_MASTER.state_prior_id,
V_TXSTU_STU_CAMPUS_MASTER.mail_address,
V_TXSTU_STU_CAMPUS_MASTER.mail_city,
V_TXSTU_STU_CAMPUS_MASTER.mail_state,
V_TXSTU_STU_CAMPUS_MASTER.mail_zip,
V_TXSTU_IMMUNIZ_D.IMMUNIZATION_DATE,
V_TXSTU_IMMUNIZ_D.DATETIME_STAMP,
V_TXSTU_IMMUNIZ_D.SERIES_TYPE,
V_TXSTU_IMMUNIZ_D.SERIES_DESC,
V_TXSTU_IMMUNIZ_D.EXEMPT_FLAG,
V_TXSTU_IMMUNIZ_D.REACTION_FLAG,
V_TXSTU_IMMUNIZ_D.IMMUNIZATION_TYPE,
V_TXSTU_IMMUNIZ_D.IMMUNIZATION_DESC,
V_TXSTU_IMMUNIZ_D.PARTIAL_AMOUNT,
TO_DATE(TRIM(V_TXSTU_IMMUNIZ_D.AFFIDAVIT_DATE),'YYYYMMDD') AFFIDAVIT_DATE
 from V_TXSTU_STU_CAMPUS_MASTER
 LEFT JOIN  V_TXSTU_IMMUNIZ_D
 ON V_TXSTU_IMMUNIZ_D.STUDENT_ID = V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID;

prompt
prompt Creating view V_TXSTU_INSTRUCTOR_D
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_INSTRUCTOR_D AS
SELECT
 CR_INSTR_CYR.SCH_YR SCH_YR
,CR_INSTR_CYR.CAMPUS_ID CAMPUS_ID
,CR_INSTR_CYR.INSTR_ID INSTR_ID
,CR_INSTR_CYR.STAFF_ID SSN
,INITCAP(CR_INSTR_CYR.NAME_L) LAST_NAME
,INITCAP(CR_INSTR_CYR.NAME_M) MIDDLE_NAME
,INITCAP(CR_INSTR_CYR.NAME_F) FIRST_NAME
,CASE CR_INSTR_CYR.GEN_CD
WHEN 'JR' THEN 'Jr'
WHEN 'SR' THEN 'Sr'
ELSE CR_INSTR_CYR.GEN_CD END GEN
,INITCAP(CR_INSTR_CYR.NAME_L)||' '||CASE CR_INSTR_CYR.GEN_CD
WHEN 'JR' THEN 'Jr'
WHEN 'SR' THEN 'Sr'
ELSE CR_INSTR_CYR.GEN_CD END||', '||INITCAP(CR_INSTR_CYR.NAME_F) ||' '||INITCAP(CR_INSTR_CYR.NAME_M) NAME
,CR_INSTR_CYR.EXCL_FROM_PEIMS_RPTNG EXCL_FROM_PEIMS
,CR_INSTR_CYR.DEPT_NBR DEPT
,CR_INSTR_CYR.GRADE_LVL GRD_LVL
,CR_INSTR_CYR.HOMEROOM HOMEROOM
,CR_INSTR_CYR.SECTION SECTION
FROM CR_INSTR_CYR;

prompt
prompt Creating view V_TXSTU_INSTRUCTOR
prompt ================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_INSTRUCTOR AS
SELECT
 V_TXSTU_INSTRUCTOR_D.SCH_YR
,V_TXSTU_INSTRUCTOR_D.CAMPUS_ID
,V_TXSTU_INSTRUCTOR_D.INSTR_ID
,V_TXSTU_INSTRUCTOR_D.SSN
,V_TXSTU_INSTRUCTOR_D.LAST_NAME
,V_TXSTU_INSTRUCTOR_D.MIDDLE_NAME
,V_TXSTU_INSTRUCTOR_D.FIRST_NAME
,V_TXSTU_INSTRUCTOR_D.GEN
,V_TXSTU_INSTRUCTOR_D.NAME
,V_TXSTU_INSTRUCTOR_D.EXCL_FROM_PEIMS
,V_TXSTU_INSTRUCTOR_D.DEPT
,V_TXSTU_INSTRUCTOR_D.GRD_LVL
,V_TXSTU_INSTRUCTOR_D.HOMEROOM
,V_TXSTU_INSTRUCTOR_D.SECTION
 from V_TXSTU_INSTRUCTOR_D;

prompt
prompt Creating view V_TXSTU_REGISTRATION
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_REGISTRATION AS
SELECT
        TO_NUMBER(REGISTRATION.SCH_YR) SCH_YR
        ,REGISTRATION.GRD
        ,TO_NUMBER(REGISTRATION.GRDSORT) GRDSORT -- for sorting purposes
        ,TO_DATE(REGISTRATION.ENTRY_DT,'YYYYMMDD') ENTRY_DT
        ,REGISTRATION.TRACK
        ,TO_DATE(REGISTRATION.ORIG_ENTRY_DT,'YYYYMMDD') ORIG_ENTRY_DT
        ,TO_DATE(REGISTRATION.WITHDRAWAL_DT,'YYYYMMDD') WITHDRAWAL_DT
        ,REGISTRATION.WITHDRAWAL_CODE
        ,REGISTRATION.WITHDRAWAL_REASON
        ,REGISTRATION.STUDENT_ID
        ,REGISTRATION.FULL_NAME
        ,REGISTRATION.FIRST_NAME
        ,REGISTRATION.MIDDLE_NAME
        ,REGISTRATION.LAST_NAME
        ,REGISTRATION.GEN
        ,REGISTRATION.NICKNAME
        ,REGISTRATION.ELIG_CODE
        ,REGISTRATION.CAMPUS_ID_RESID
        ,REGISTRATION.SSN_DENIED
        ,REGISTRATION.CAMPUS_ID
        ,REGISTRATION.CAMPUS_NAME
        ,REGISTRATION.ACTIVE_CD
        ,REGISTRATION.ACTIVE_DESC
        ,REGISTRATION.ATTRIBUTION_CD
        ,REGISTRATION.RECORD_STATUS_CD
        ,REGISTRATION.RECORD_STATUS_DESC
        ,REGISTRATION.REP_EXCL
        ,REGISTRATION.REP_EXCL_DESC
        ,REGISTRATION.STATE_STUDENT_ID
        ,REGISTRATION.STATE_PRIOR_ID
        ,REGISTRATION.MAIL_ADDRESS
        ,REGISTRATION.MAIL_CITY
        ,REGISTRATION.MAIL_STATE
        ,REGISTRATION.MAIL_ZIP
        ,REGISTRATION.YR_END_STATUS_IND
        ,REGISTRATION.YR_END_STATUS_DESC
        ,STUDENT.SEX
        ,STUDENT.DOB
        ,STUDENT.HISPANIC_NUM
        ,STUDENT.AMER_INDIAN_NUM
        ,STUDENT.ASIAN_NUM
        ,STUDENT.BLACK_NUM
        ,STUDENT.PACIFIC_ISL_NUM
        ,STUDENT.HISPANIC
        ,STUDENT.AMER_INDIAN
        ,STUDENT.ASIAN
        ,STUDENT.BLACK
        ,STUDENT.PACIFIC_ISL
        ,STUDENT.TWO_OR_MORE_RACES
        ,STUDENT.AGGREGATE_RACE_ETHNICITY
        ,STUDENT.PHONE_NUMBER
        ,STUDENT.READING_ELA_MASTERY
        ,STUDENT.WRITING_MASTERY
        ,STUDENT.MATH_MASTERY
        ,STUDENT.SOCIAL_STUDIES_MASTERY
        ,STUDENT.SCIENCE_MASTERY
        ,STUDENT.EXIT_READING_ELA_MASTERY
        ,STUDENT.EXIT_MATH_MASTERY
        ,STUDENT.EXIT_SOCIAL_STUDIES_MASTERY
        ,STUDENT.EXIT_SCIENCE_MASTERY
        ,STUDENT.PHYSICAL_ADDRESS
        ,STUDENT.PHYSICAL_ADDRESS_CITY
        ,STUDENT.PHYSICAL_ADDRESS_STATE
        ,STUDENT.PHYSICAL_ADDRESS_ZIP
FROM
	      SOMEWHEREISDDATA.V_TXSTU_REGISTRATION_D REGISTRATION
        JOIN V_TXSTU_STU_CAMPUS_MASTER STUDENT
             ON STUDENT.SCH_YR = REGISTRATION.SCH_YR
             AND STUDENT.STUDENT_ID = REGISTRATION.STUDENT_ID
             AND STUDENT.CAMPUS_ID = REGISTRATION.CAMPUS_ID
;

prompt
prompt Creating view V_TXSTU_REGISTRATION_D
prompt ====================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_TXSTU_REGISTRATION_D AS
SELECT
       	SR_STU_ENROLL.SCH_YR
      	,SR_STU_ENROLL.GRD_LVL GRD
        ,CASE
            WHEN SR_STU_ENROLL.GRD_LVL = 'EE' THEN '-2'
            WHEN SR_STU_ENROLL.GRD_LVL = 'PK' THEN '-1'
            WHEN SR_STU_ENROLL.GRD_LVL = 'KG' THEN '00'
            ELSE SR_STU_ENROLL.GRD_LVL
            END AS GRDSORT
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_ENTRY) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_ENTRY
         END ENTRY_DT
	      ,SR_STU_ENROLL.ATT_TRK TRACK
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_ORIG_ENTRY) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_ORIG_ENTRY
         END ORIG_ENTRY_DT
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_WITHDRAW) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_WITHDRAW
         END WITHDRAWAL_DT
	      ,CASE
           WHEN TRIM(SR_STU_ENROLL.WITHDRAW_CD) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.WITHDRAW_CD
           END WITHDRAWAL_CODE
        ,ST_WD_RSN.WD_RSN_DESC WITHDRAWAL_REASON
      	,SR_STU_ENROLL.STU_ID STUDENT_ID
     	  ,INITCAP(SR_STU_ENROLL.NAME_L||', '||SR_STU_ENROLL.NAME_F||' '||SR_STU_ENROLL.NAME_M)||' '||
           case ET_C012_GEN.GEN_DESCR
           when 'JR' then 'Jr'
           when 'SR' then 'Sr'
           else ET_C012_GEN.GEN_DESCR
         end FULL_NAME
	      ,INITCAP(SR_STU_ENROLL.NAME_F) FIRST_NAME
	      ,INITCAP(SR_STU_ENROLL.NAME_M) MIDDLE_NAME
	      ,INITCAP(SR_STU_ENROLL.NAME_L) LAST_NAME
	      ,case ET_C012_GEN.GEN_DESCR
           when 'JR' then 'Jr'
           when 'SR' then 'Sr'
           else ET_C012_GEN.GEN_DESCR
         end GEN
	      ,SR_STU_ENROLL.NAME_STU_GOES_BY NICKNAME
	      ,SR_STU_ENROLL.ELIG_CD ELIG_CODE
	      ,CASE
           WHEN TRIM(SR_STU_ENROLL.CAMPUS_ID_RES) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.CAMPUS_ID_RES
           END  CAMPUS_ID_RESID
	      ,SR_STU_ENROLL.SSAN_DENIED SSN_DENIED
      	,SR_STU_ENROLL.CAMPUS_ID CAMPUS_ID
        ,CR_DEMO.CAMPUS_NAME CAMPUS_NAME
	      ,SR_STU_ENROLL.ACTIVE_CD ACTIVE_CD
        ,ST_ACTIVE_CD.DESCRIPTION ACTIVE_DESC
 	      ,SR_STU_ENROLL.ATTRIBUTION_CD ATTRIBUTION_CD
	      ,SR_STU_ENROLL.STATUS_CD RECORD_STATUS_CD
        ,ST_REC_STATUS.STATUS_DESC RECORD_STATUS_DESC
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.EXCLUSION_CD) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.EXCLUSION_CD
           END  REP_EXCL
        ,ST_REP_EXCLUSN.EXCLUSN_DESC REP_EXCL_DESC
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.STATE_STU_ID) IS NULL THEN NULL
           ELSE SUBSTR(SR_STU_ENROLL.STATE_STU_ID,1,3)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID,4,2)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID,6,4)
           END STATE_STUDENT_ID
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.STATE_STU_ID_PRIOR) IS NULL THEN NULL
           ELSE SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,1,3)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,4,2)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,6,4)
           END STATE_PRIOR_ID
	      ,SR_STU_ENROLL.ADDR_STR_NBR||' '||INITCAP(SR_STU_ENROLL.ADDR_STR_NAME)||' '||
		       INITCAP(SR_STU_ENROLL.ADDR_STR_DIR)||CASE WHEN TRIM(SR_STU_ENROLL.ADDR_APT_NBR) IS NULL THEN ''
                                       ELSE ' #'||SR_STU_ENROLL.ADDR_APT_NBR END MAIL_ADDRESS
	      ,INITCAP(SR_STU_ENROLL.ADDR_CITY) MAIL_CITY
	      ,SR_STU_ENROLL.ADDR_STATE MAIL_STATE
	      ,SR_STU_ENROLL.ADDR_ZIP MAIL_ZIP
        ,SR_STU_DEMO_PEIMS.YREND_STATUS_IND YR_END_STATUS_IND
        ,ET_C131_YRENDSTATUS.YRENDSTATUS_DESCR YR_END_STATUS_DESC
FROM
        SOMEWHEREISDDATA.SR_STU_ENROLL
        LEFT JOIN ET_C012_GEN ON ET_C012_GEN.SCH_YR = SR_STU_ENROLL.SCH_YR
                              AND ET_C012_GEN.GEN_CD = SR_STU_ENROLL.NAME_GEN_CD
        LEFT JOIN ST_WD_RSN ON ST_WD_RSN.SCH_YR = SR_STU_ENROLL.SCH_YR
                           AND ST_WD_RSN.WD_RSN_CD = TRIM(SR_STU_ENROLL.WITHDRAW_CD)
        LEFT JOIN CR_DEMO ON CR_DEMO.SCH_YR = SR_STU_ENROLL.SCH_YR
                         AND CR_DEMO.CAMPUS_ID = TRIM(SR_STU_ENROLL.CAMPUS_ID)
        LEFT JOIN ST_ACTIVE_CD ON ST_ACTIVE_CD.SCH_YR = SR_STU_ENROLL.SCH_YR
                              AND ST_ACTIVE_CD.ACTIVE_CD = TRIM(SR_STU_ENROLL.ACTIVE_CD)
        LEFT JOIN ST_REC_STATUS ON ST_REC_STATUS.SCH_YR = SR_STU_ENROLL.SCH_YR
                              AND ST_REC_STATUS.REC_STATUS = TRIM(SR_STU_ENROLL.STATUS_CD)
        LEFT JOIN ST_REP_EXCLUSN ON ST_REP_EXCLUSN.SCH_YR = SR_STU_ENROLL.SCH_YR
                               AND ST_REP_EXCLUSN.EXCLUSN_CD = TRIM(SR_STU_ENROLL.EXCLUSION_CD)
        LEFT JOIN SR_STU_DEMO_PEIMS ON  SR_STU_DEMO_PEIMS.SCH_YR = SR_STU_ENROLL.SCH_YR
                              AND SR_STU_DEMO_PEIMS.STU_ID = SR_STU_ENROLL.STU_ID
        LEFT JOIN ET_C131_YRENDSTATUS ON  ET_C131_YRENDSTATUS.SCH_YR = SR_STU_DEMO_PEIMS.SCH_YR
                              AND ET_C131_YRENDSTATUS.YREND_STATUS = SR_STU_DEMO_PEIMS.YREND_STATUS_IND
WHERE
	      SR_STU_ENROLL.STATUS_CD in ('1','2','3') -- only student enrollment records that are current school year, not no show (6) or pre-enrollment for next year (4);
ORDER BY 1,10
;

prompt
prompt Creating view V_USER_APP_LIST
prompt =============================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_USER_APP_LIST AS
SELECT DISTINCT APPLICATION.DESCRIPTION,
       APPLICATION.APPLICATION_ALIAS,
       USER_ROLE.DEFAULT_APPLICATION_FLAG
  FROM USER_ROLE
  JOIN APPLICATION_ROLE
    ON APPLICATION_ROLE.APPLICATION_ROLE_SID =
       USER_ROLE.APPLICATION_ROLE_SID
  JOIN APPLICATION
    ON APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
  JOIN USER_ACCOUNT
    ON USER_ACCOUNT.USER_SID = USER_ROLE.USER_SID
 WHERE USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME')
 AND APPLICATION.ACTIVE_FLAG = 'Y';

prompt
prompt Creating view V_USER_CAMPUS_MASTER_LIST
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW TIMSRPTDATA.V_USER_CAMPUS_MASTER_LIST AS
SELECT
 SCHOOL_ID
,CAMPUS_NAME
FROM CAMPUS_MASTER
JOIN USER_CAMPUS ON USER_CAMPUS.CAMPUS_MASTER_SID = CAMPUS_MASTER.CAMPUS_MASTER_SID
JOIN USER_ACCOUNT ON USER_ACCOUNT.USER_SID = USER_CAMPUS.USER_SID
                 AND USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME')
UNION
-- get the campuses for the district user --
SELECT SCHOOL_ID D
,CAMPUS_NAME R
FROM CAMPUS_MASTER
WHERE SYS_CONTEXT('REVEAL_CTX','USER_NAME') = (SELECT USER_ID
                                                    FROM TXSTU_USER_STUDENT_SECURITY
                                                    WHERE USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME')
                                                    AND SCH_YR = '9999'
                                                    AND STU_ID = '-9999')
;

prompt
prompt Creating view V_USER_REPORT_LIST
prompt ================================
prompt
create or replace force view timsrptdata.v_user_report_list as
select distinct
       source_name,
       source.source_sid,
       report_category,
       report_category.report_category_sid,
       report_name,
       report_description,
       report_type_name,
       report_alias,
       'REVEAL@REGION10.ORG' report_owner,
       'DEFAULT' ir_alias
  from report_list
  join report_category on report_category.report_category_sid = report_list.report_category_sid
  join source on source.source_sid = report_category.source_sid
  join report_type on report_type.report_type_sid = report_list.report_type_sid
where (report_category.report_category_sid in (select user_report_category.report_category_sid
        from user_account
        join user_report_category on user_report_category.user_sid = user_account.user_sid
        where user_account.user_id = SYS_CONTEXT('REVEAL_CTX','USER_NAME'))
   or report_list.report_list_sid in (select user_report.report_list_sid
        from user_account
        join user_report on user_report.user_sid = user_account.user_sid
        where user_account.user_id = SYS_CONTEXT('REVEAL_CTX','USER_NAME')))
  and report_list.active_flag = 'Y'
  and report_category.active_flag = 'Y'
  and source.active_flag = 'Y'
UNION ALL
select
    source.source_name
    ,source.source_sid
    ,report_category.report_category
    ,report_category.report_category_sid
    ,apex_rpt.REPORT_NAME report_name
    ,apex_rpt.REPORT_DESCRIPTION  report_description
    ,'Saved Report' report_type_name
    ,apex_page.page_alias report_alias
    ,decode(substr(apex_rpt.APPLICATION_USER,1,5),'APXWS','REVEAL@REGION10.ORG',apex_rpt.application_user) report_owner
    ,'IR_REPORT_'||apex_rpt.REPORT_ALIAS ir_alias
from APEX_APPLICATION_PAGE_IR_RPT apex_rpt
  join APEX_APPLICATION_PAGES apex_page on apex_page.application_id = apex_rpt.application_id
     and apex_page.page_id = apex_rpt.page_id
  join report_list on apex_page.page_alias = report_list.report_alias
  join report_category on report_category.report_category_sid = report_list.report_category_sid
  join source on source.source_sid = report_category.source_sid
  join report_type on report_type.report_type_sid = report_list.report_type_sid
where (report_category.report_category_sid in (select user_report_category.report_category_sid
        from user_account
        join user_report_category on user_report_category.user_sid = user_account.user_sid
        where user_account.user_id = SYS_CONTEXT('REVEAL_CTX','USER_NAME'))
        --where user_account.user_id = 'REVEAL@REGION10.ORG')
   or report_list.report_list_sid in (select user_report.report_list_sid
        from user_account
        join user_report on user_report.user_sid = user_account.user_sid
        where user_account.user_id = SYS_CONTEXT('REVEAL_CTX','USER_NAME')))
        --where user_account.user_id = 'REVEAL@REGION10.ORG'))
  and report_list.active_flag = 'Y'
  and report_category.active_flag = 'Y'
  and source.active_flag = 'Y'
  and apex_rpt.report_alias is not null
  and apex_rpt.report_name is not null
;

prompt
prompt Creating materialized view MV_CR_ATT_CAL
prompt ========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_CR_ATT_CAL
REFRESH COMPLETE ON DEMAND
AS
SELECT SCH_YR
,CAMPUS_ID
,TRACK
,DAY_DATE
,MEMBERSHIP_CODE
,ATT_CYCLE
,ATT_SEMESTER
,JUL_DAY
,JUL_YEAR
,GRD_SEMESTER
,GRD_CYCLE
,POST_PERIOD
FROM "rsccc"."CR_ATT_CAL"@TXEIS;

prompt
prompt Creating materialized view MV_CR_ATT_OPT
prompt ========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_CR_ATT_OPT
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,TRACK
,ATT_CAL
,DT_F_DAY_SCH
,DT_L_DAY_SCH
,TYPE_CYC_ATT
,AM_PM_FLG
,ATT_PER_NBR_TAKEN
,AUTO_TII_XFER
,ATT_ADA_POST_PER
,ATT_PER_FIRST
,ATT_PER_LAST
,SPREAD_ABS
,DT_FIRST_CYC1
,DT_FIRST_CYC2
,DT_FIRST_CYC3
,DT_FIRST_CYC4
,DT_FIRST_CYC5
,DT_FIRST_CYC6
,TOT_DAYS_IN_ATT_CYC1
,TOT_DAYS_IN_ATT_CYC2
,TOT_DAYS_IN_ATT_CYC3
,TOT_DAYS_IN_ATT_CYC4
,TOT_DAYS_IN_ATT_CYC5
,TOT_DAYS_IN_ATT_CYC6
,KINDER_HALF_DAY
FROM RSCCC.CR_ATT_OPT@TXEIS;

prompt
prompt Creating materialized view MV_CR_DEMO
prompt =====================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_CR_DEMO
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,CAMPUS_NAME
,STR_NBR
,STR_NAME
,CITY_NAME
,TB_CAMPUS_STATE
,ZIP
,ZIP4
,PHONE_AREA_CD
,PHONE_NBR
,GRD_RNG_LOW
,GRD_RNG_HI
,DIST_ID
,DEFAULT_ATTEND_TRK
,FAX_AC
,FAX_NBR
FROM RSCCC.CR_DEMO@TXEIS;

prompt
prompt Creating materialized view MV_CR_INSTR_CYR
prompt ==========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_CR_INSTR_CYR
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,INSTR_ID
,STAFF_ID
,NAME_L
,NAME_M
,NAME_F
,GEN_CD
,EXCL_FROM_PEIMS_RPTNG
,DEPT_NBR
,GRADE_LVL
,HOMEROOM
,SECTION
FROM RSCCC.CR_INSTR_CYR@TXEIS;

prompt
prompt Creating materialized view MV_DR_CRS_OFFERED_CYR
prompt ================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_DR_CRS_OFFERED_CYR
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CRS_NBR
,TITLE
,GAVG_TABLE
,AAR_USE_CD
,ALLOW_CREDIT_BASIC
,ALLOW_CREDIT_HONORS
,AUTO_GRD
,CORE_CRS_CD
,GAVG_WGT
,PARTIAL_CREDIT_CD
,HROLL_CD
,LA_WGT_CD
,HROLL_WGT
,NBR_CREDITS
,NBR_OF_SEM
,CREDIT_SEQ_CD
,ROLE_ID
,PRIORITY_CD_CRS
,GENDER_RSTRCTN
,SPEC_CRS_CONSIDER
,SVC_ID
,VOC_ED_CREDIT_AMT
,INSTRUCT_SET_CD
,POP_SRVD
,CREDIT_LVL
,COOP_VOC_CD
,MINI_CRS_NBR_CYC
,INCL_ELIG_CRS
,SEQ_CD
,HROLL_TABLE
,GRADED_CRS_CD
,EXAM_SEM_PATTERN
,ABBREV_NAME
,SELF_PACED
,CLASS_TYPE_CD
FROM RSCCC.DR_CRS_OFFERED_CYR@TXEIS;

prompt
prompt Creating materialized view MV_DR_DEMO
prompt =====================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_DR_DEMO
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,DIST_ID
,DIST_NAME
,REGION_NBR
,STR_NBR_DIST
,STR_NAME_DIST
,CITY_NAME_DIST
,STATE_CD
,ZIP_DIST
,ZIP4_DIST
,STR_DIR_EDIT
,AREA_CD_DIST
,PHONE_NBR_DIST
,SUPERDT_NAME_L
,SUPERDT_NAME_F
,SUPERDT_NAME_M
,TITLE
,GEN_SUPERDT
,REG_DAY_SCH_DEAF_DIST
,FAX_PHONE
,FAX_AREA_CD
FROM RSCCC.DR_DEMO@TXEIS;

prompt
prompt Creating materialized view MV_ET_C012_GEN
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C012_GEN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,GEN_CD
,GEN_DESCR
FROM RSCCC.ET_C012_GEN@TXEIS;

prompt
prompt Creating materialized view MV_ET_C035_INSTRUCTSET
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C035_INSTRUCTSET
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
INSTRUCTSET_CD,
INSTRUCTSET_DESCR,
INSTRUCTSET_HRS
FROM RSCCC.ET_C035_INSTRUCTSET@TXEIS;

prompt
prompt Creating materialized view MV_ET_C053_HANDICAP
prompt ==============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C053_HANDICAP
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
HANDI_CD,
HANDI_DESCR
FROM RSCCC.ET_C053_HANDICAP@TXEIS;

prompt
prompt Creating materialized view MV_ET_C061_LEP
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C061_LEP
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
LEP_CD,
LEP_DESCR
FROM RSCCC.ET_C061_LEP@TXEIS;

prompt
prompt Creating materialized view MV_ET_C093_PARPERMISS
prompt ================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C093_PARPERMISS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
PARPERMISS_CD,
PARPERMISS_DESCR
FROM RSCCC.ET_C093_PARPERMISS@TXEIS;

prompt
prompt Creating materialized view MV_ET_C095_SPTHRPY
prompt =============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C095_SPTHRPY
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
SP_THRPY,
SPTHRPY_DESCR
FROM RSCCC.ET_C095_SPTHRPY@TXEIS;

prompt
prompt Creating materialized view MV_ET_C131_YRENDSTATUS
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C131_YRENDSTATUS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
YREND_STATUS,
YRENDSTATUS_DESCR
FROM RSCCC.ET_C131_YRENDSTATUS@TXEIS;

prompt
prompt Creating materialized view MV_ET_C175_BIL_PGM_TYP
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C175_BIL_PGM_TYP
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
BIL_PGM_TYP_CD,
BIL_PGM_TYP_DESCR
FROM RSCCC.ET_C175_BIL_PGM_TYP@TXEIS;

prompt
prompt Creating materialized view MV_ET_C176_ESL_PGM_TYP
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ET_C176_ESL_PGM_TYP
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
ESL_PGM_TYP_CD,
ESL_PGM_TYP_DESCR
FROM RSCCC.ET_C176_ESL_PGM_TYP@TXEIS;

prompt
prompt Creating materialized view MV_SR_ATT_POST
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_ATT_POST
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,CAMPUS_ID
,ABS_DATE
,ABS_PER
,ABS_TYPE
,CRS_NBR
,JUL_DAY
,JUL_YR
,POST_FLAG
,USER_ID
FROM RSCCC.SR_ATT_POST@TXEIS;

prompt
prompt Creating materialized view MV_SR_CRS_GRD
prompt ========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_CRS_GRD
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,STU_ID
,CRS_NBR
,SEC_NBR
,CRS_SEM_ENROLL
,DT_ENTRY
,DT_WD
,GRD_CYC1
,GRD_CYC2
,GRD_CYC3
,GRD_EXAM
,GRD_SEM
,GRD_FINAL
,COMMENTS_CYC1_1
,COMMENTS_CYC1_2
,COMMENTS_CYC1_3
,COMMENTS_CYC1_4
,COMMENTS_CYC1_5
,COMMENTS_CYC2_1
,COMMENTS_CYC2_2
,COMMENTS_CYC2_3
,COMMENTS_CYC2_4
,COMMENTS_CYC2_5
,COMMENTS_CYC3_1
,COMMENTS_CYC3_2
,COMMENTS_CYC3_3
,COMMENTS_CYC3_4
,COMMENTS_CYC3_5
,CONDUCT_CYC1
,CONDUCT_CYC2
,CONDUCT_CYC3
,SCAN_UPDATE
,CRS_CREDIT
,AAR_USE_CD
,CRS_SPEC_CONSIDER
,PASS_FAIL_CREDIT_IND
,HONORS_CRS
,XFER_CRS
,SPEC_ED_PASS_GRD
,EXCL_GRD_COMPUTE
,SVC_ID_CHG
,INCL_ELIG
,EOC_SEM
,EOC_ASSESS_SCR
,EOC_FINAL
,USER_ID
FROM RSCCC.SR_CRS_GRD@TXEIS;

prompt
prompt Creating materialized view MV_SR_DISCPLN
prompt ========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_DISCPLN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,OFENS_STAMP
,OFENS_TIME
,CAMPUS_ID
,DT_OFENS
,REP_BY
,REP_BY_NAME_F
,REP_BY_NAME_L
,INC_LOC
,PARENT_CONTACT
,CONTACT_DT
,CONF_REQUESTED
,CONF_DATE
,INFORMAL_HEARING
,APPEAL_EXP
,WITNESS
,DISCPLN_COMM
,ADMIN_BY
,ADMIN_BY_NAME_F
,ADMIN_BY_NAME_L
,INCIDENT_NUM
,REPORT_PD
FROM RSCCC.SR_DISCPLN@TXEIS;

prompt
prompt Creating materialized view MV_SR_DISCPLN_ACTN
prompt =============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_DISCPLN_ACTN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,OFENS_STAMP
,ACTN_CD
,ACTN_TO_DT
,AMT
,ACTN_FROM_DT
,CAMPUS_ID_ASSGN
,ACTN_NBR
,ACT_LENGTH_DISCPLN_ASSGN
,LENGTH_DIFF_RSN_CD
,OFFCL_LENGTH_DISCPLN_ASSGN
,DATE_DISPLNRY_ACTION
,CAMPUS_DISPLNRY_RESPNSBLTY
FROM RSCCC.SR_DISCPLN_ACTN@TXEIS;

prompt
prompt Creating materialized view MV_SR_DISCPLN_OFENS
prompt ==============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_DISCPLN_OFENS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,OFENS_STAMP
,OFENS_CD
,OFENS_LEVEL
FROM RSCCC.SR_DISCPLN_OFENS@TXEIS;

prompt
prompt Creating materialized view MV_SR_GRADEBK_HINT_INST
prompt ==================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_GRADEBK_HINT_INST
REFRESH COMPLETE ON DEMAND
AS
SELECT
 USER_ID,
QUES_ID,
ANS
FROM RSCCC.SR_GRADEBK_HINT_INST@TXEIS;

prompt
prompt Creating materialized view MV_SR_GRADEBK_LOGIN
prompt ==============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_GRADEBK_LOGIN
REFRESH COMPLETE ON DEMAND
AS
SELECT
USER_ID,
ACTIVE_CD,
PSWD,
DT_PSWD_EXPR,
DT_L_CHG_PSWD,
DT_L_UPDT,
PIN,
EMAIL,
STF_ID,
VIEW_PREF,
COL_PREF,
CAMPUS_ID,
TYP_USER,
PHONE_AC,
PHONE_NBR,
MSG,
COMBN_CRS_ATT,
RUN_STU_GRP_RPT,
ARR_NEW_STU,
CREATE_STU_GRP,
MGD_SCROLL
FROM RSCCC.SR_GRADEBK_LOGIN@TXEIS;

prompt
prompt Creating materialized view MV_SR_HINT_QUES
prompt ==========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_HINT_QUES
REFRESH COMPLETE ON DEMAND
AS
SELECT
QUES_ID,
QUES
FROM RSCCC.SR_HINT_QUES@TXEIS;

prompt
prompt Creating materialized view MV_SR_IMMUNIZ
prompt ========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_IMMUNIZ
REFRESH COMPLETE ON DEMAND
AS
SELECT
STU_ID,
IMMUNIZ_DATE,
DT_TIME_STAMP,
SERIES_TYPE,
EXEMPT_FLAG,
REACTION_FLAG,
IMMUNIZ_TYPE,
PARTIAL_AMOUNT,
AFFIDAVIT_DATE
FROM RSCCC.SR_IMMUNIZ@TXEIS;

prompt
prompt Creating materialized view MV_SR_PARENT
prompt =======================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_PARENT
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,NAME_L
,NAME_F
,NAME_M
,GEN
,RELAT
,SEQ_NO
,STR_NBR
,STR_NAME
,APT_NBR
,CITY
,STATE_CD
,ZIP
,ZIP4
,SSN
,PHONE_AREA_CD
,PHONE_NBR
,PHONE_AREA_CD_BUS
,PHONE_NBR_BUS
,PHONE_EXT_BUS
,OCCUPATION
,PRIMARY_FLAG
,EMERGENCY_FLAG
,MIGRANT_FLAG
,OTHER_PHONE_AC
,OTHER_PHONE_NBR
,OTHER_PHONE_EXT
,MIL_IND
,MIL_BRANCH
,MIL_RANK
,EMAIL
,DOB
,ENROLL_PAR_IND
FROM RSCCC.SR_PARENT@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_BIL_ESL
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_BIL_ESL
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
CAMPUS_ID,
STU_ID,
DT_BIL_ESL_ENTRY,
BIL_IND,
ESL_ED_IND,
DT_BIL_ESL_WD,
DT_BIL_ESL_ENTRY_RECIP,
WD_RSN_CD,
LEP_IND,
PAR_PERM_CD
FROM RSCCC.SR_SPEC_PGM_BIL_ESL@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_CHAP1
prompt ===============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_CHAP1
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
STU_ID,
CAMPUS_ID,
TII_ENTRY_DT,
SVC_CD,
TII_IND,
PAR_INVOLVE_FUND_CD,
READING_INSTR_AREA_FUND_CD,
MATH_INSTR_AREA_FUND_CD,
MED_SVCS_FUND_CD,
DENTAL_SVCS_FUND_CD,
NUTRITION_SVCS_FUND_CD,
CLOTHING_SVCS_FUND_CD,
OTHER_SUPPT_SVCS_CD,
ENG_LIM_INSTR_FUND_CD,
OTHER_LANG_ARTS_INSTR_FUND,
OTHER_INSTR_AREA_FUND_CD,
GUID_COUNS_FUND_CD,
ATT_SOC_WRK_FUND_CD,
TII_ENTRY_DT_RECIP,
TII_EXIT_DT,
TII_WD_RSN,
HOMELESS_CD,
READ_CD,
MATH_CD,
SCIENCE_CD,
SOCIAL_CD,
GUIDANCE_CD,
SOCIAL_WRK_CD,
HEALTH_CD
FROM RSCCC.SR_SPEC_PGM_CHAP1@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_GT
prompt ============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_GT
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
CAMPUS_ID,
STU_ID,
GT_ENTRY_DT,
GT_IND,
GT_EXT_DT,
GT_ENTRY_RECIP_DT,
GT_WD_RSN_CD
FROM RSCCC.SR_SPEC_PGM_GT@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_OTHER
prompt ===============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_OTHER
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
WR_CAMPUS,
STU_ID,
OTHER_SPEC_PGM,
DT_ENTRY,
DT_WD,
DT_ENTRY_RECIP,
WD_RSN_CD,
SPEC_CD1,
SPEC_CD2,
SPEC_CD3,
SPEC_CD4
FROM RSCCC.SR_SPEC_PGM_OTHER@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_PREG_PUPILS
prompt =====================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_PREG_PUPILS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
CAMPUS_ID,
STU_ID,
PREG_PGM_ENTRY_DT,
PREG_PUPILS_PGM_IND,
PREG_PGM_WD_DT,
PREG_ENTRY_RECIP_DT,
WD_RSN_CD,
CEHI_IND,
PEP_IND,
VOCED_ELIG
FROM RSCCC.SR_SPEC_PGM_PREG_PUPILS@TXEIS;

prompt
prompt Creating materialized view MV_SR_SPEC_PGM_SPEC_ED
prompt =================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_SPEC_PGM_SPEC_ED
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,STU_ID
,DT_ENTRY_STU
,PRI_HANDI_IND
,INSTRUCT_SET_CD
,SPEECH_THRPY_IND
,DT_WD
,DT_ENTRY_STU_RECIP
,WD_RSN_CD
,VOC_HRS_ELIG
,REG_DAY_SCH_PGM_DEAF
FROM RSCCC.SR_SPEC_PGM_SPEC_ED@TXEIS;

prompt
prompt Creating materialized view MV_SR_STU_CAMPUS
prompt ===========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_STU_CAMPUS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,CAMPUS_ID
,CYR_CTRL_NBR
,NYR_CTRL_NBR
,HERE_LAST_YR
,RECOMP_FLG
,CAMPUS_ID_NYR
FROM RSCCC.SR_STU_CAMPUS@TXEIS;

prompt
prompt Creating materialized view MV_SR_STU_DEMO
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_STU_DEMO
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,STU_ID
,SEX
,GRAD_PLAN_CD
,COUNSELOR_NBR_STU
,BIRTH_PLACE_CITY
,BIRTH_PLACE_STATE_CD
,DOB
,ETHN
,LOCKER_COMBNTN1
,LOCKER_NBR
,OUT_STATE_ELIG_CD
,STU_PHONE_AC
,PHONE_NBR
,ADDR_TEL_DIR_RSTRCTD_FLG
,STR_NBR_PHYS
,STR_NAME_PHYS
,APT_NBR_PHYS_ADDR
,CITY_NAME_PHYS_ADDR
,ZIP_CODE_PHYS_ADDR
,ZIP4_PHYS_ADDR
,PHYS_ADDR_STATE
,STR_DRCTN_PHYS
,NBR_TIMES_FAILED
,LAST_GRD_FAILED
,LANG_PRI
,YR_LAST_FAILED
,ENTRY_DIST_STU
,LAST_YR_CAMPUS
,CAMPUS_CD_PRV
,DT_GRD_8_ENTRY
,DT_GRD_9_ENTRY
,LEP_IND
,LAST_YR_GRD
,CUMULATIVE_GPA
,PREV_DIST
,DT_RANKING
,QUARTILE
,READING_ELA_MSTRY_DT
,WRITING_MSTRY_DT
,MATH_MSTRY_DT
,SOCIAL_STUDIES_MSTRY_DT
,SCIENCE_MSTRY_DT
,PK_FOSTER
,EXIT_READING_ELA_MSTRY_DT
,EXIT_MATH_MSTRY_DT
,EXIT_SOCIAL_STUDIES_MSTRY_DT
,EXIT_SCIENCE_MSTRY_DT
,ETHN_HISPANIC
,RACE_AMER_INDIAN
,RACE_ASIAN
,RACE_BLACK
,RACE_WHITE
,RACE_PACIFIC_ISL
,ETHN_AGG_CD
FROM RSCCC.SR_STU_DEMO@TXEIS;

prompt
prompt Creating materialized view MV_SR_STU_DEMO_PEIMS
prompt ===============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_STU_DEMO_PEIMS
REFRESH COMPLETE ON DEMAND
AS
SELECT
  SCH_YR,
  STU_ID,
  DAY_CARE_VOC_SUPPT_SVC,
  WRK_STUDY_VOC_SUPPT_SVC,
  ECON_DISADV_CD,
  SGL_PAR_PREG_TEEN,
  GENRL_INTELECT_ABILITY_IND,
  SPECIFIC_SUBJ_MATTER_APTTD,
  CREATIVE_PROD_THINKING,
  LEADERSHIP_ABIL,
  COUNTY_RESID,
  IMMIGRANT_IND,
  HOME_LANG_CD,
  PAR_PERM_CD,
  PEIMS_DROUT_EXIT_RSN1,
  PEIMS_DROUT_EXIT_RSN2,
  PEIMS_DROUT_EXIT_RSN3,
  PER_DROUT_CD,
  GRD_LVL_DROUT,
  MSRTS_ID_NBR,
  MIGRANT_STATUS_CD,
  XFER_CRS,
  PAR_PERM_DT,
  COUNS_SVC_IND,
  CATE_IND,
  COLLEGE_ENTRY_IND,
  GRAD_TYP_CD,
  PROPOSED_DT_GRAD,
  DEMO_REV_CONFIRM,
  ALIEN_IND,
  REFUGEE_IND,
  PAR_PERM_DENIAL_DT,
  TRANSPORT_VOC_SUPPT,
  TAAS_EXEMPT_CD_READ,
  TAAS_EXEMPT_CD_WRITING,
  TAAS_EXEMPT_CD_MATH,
  TAAS_EXEMPT_CD_SCI,
  TAAS_EXEMPT_CD_SOC_SCI,
  NEGLECTED_DELINQUENT_IND,
  RPTD_CAMPUS_ID_ENROLL,
  YREND_STATUS_IND,
  RETNT_TRANSIT_RSN1,
  RETNT_TRANSIT_RSN2,
  RETNT_TRANSIT_RSN3,
  OEYP,
  CAMPUS_ID_ACCOUNT,
  OEYP_RETNTN_CD,
  BIL_ESL_SUMMER_IND,
  SSI_PROMO_RETNTN_CD,
  EVEN_START_IND,
  YRS_USA_CD,
  LEP_MONITORING,
  OEYP_DAYS_TAUGHT,
  OEYP_DAYS_ABS,
  OEYP_ELIG_DAYS_PRSNT,
  DT_CERT_CRSWRK,
  DISPLC_HMKR_CD,
  DAP_ADV_MEAS1,
  DAP_ADV_MEAS2,
  DAP_ADV_MEAS3,
  DAP_ADV_MEAS4,
  ASYLEE_REFUGEE_CD
FROM RSCCC.SR_STU_DEMO_PEIMS@TXEIS;

prompt
prompt Creating materialized view MV_SR_STU_ENROLL
prompt ===========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_SR_STU_ENROLL
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,CAMPUS_ID
,STU_ID
,DT_ENTRY
,CAMPUS_ID_NYR
,GRD_LVL
,DT_WITHDRAW
,WITHDRAW_CD
,ELIG_CD
,ACTIVE_CD
,STATUS_CD
,EXCLUSION_CD
,ADDR_STR_NBR
,ADDR_STR_NAME
,ADDR_APT_NBR
,ADDR_CITY
,ADDR_STATE
,ADDR_ZIP
,ADDR_ZIP4
,STATE_STU_ID_PRIOR
,SSAN_DENIED
,NAME_L
,NAME_F
,NAME_M
,NAME_GEN_CD
,DT_ENTRY_RECIP
,STATE_STU_ID
,DT_LAST_CHG
,ADDR_STR_DIR
,SUB_CAMPUS
,DT_ORIG_ENTRY
,ATT_TRK
,NAME_STU_GOES_BY
,ATTRIBUTION_CD
,CAMPUS_ID_RES
,VOCED_ELIG
FROM RSCCC.SR_STU_ENROLL@TXEIS;

prompt
prompt Creating materialized view MV_ST_ACTIVE_CD
prompt ==========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_ACTIVE_CD
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,ACTIVE_CD
,DESCRIPTION
FROM RSCCC.ST_ACTIVE_CD@TXEIS;

prompt
prompt Creating materialized view MV_ST_ATT_POST
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_ATT_POST
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,POST_CD
,ADA_ABS
,POSTING_DECODE
,PREPOST
,RPT_CRD_EQUIV
FROM RSCCC.ST_ATT_POST@TXEIS;

prompt
prompt Creating materialized view MV_ST_DISCPLN_ACTN
prompt =============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_DISCPLN_ACTN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,ACTN_CD
,UPDATE_FLAG
,ACTN_DESC
,PEIMS_CD
FROM RSCCC.ST_DISCPLN_ACTN@TXEIS;

prompt
prompt Creating materialized view MV_ST_IMMUNIZ_TYP
prompt ============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_IMMUNIZ_TYP
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
IMMUNIZ_TYP_CD,
IMMUNIZ_TYP_DESC,
UPDATE_FLAG
FROM RSCCC.ST_IMMUNIZ_TYP@TXEIS;

prompt
prompt Creating materialized view MV_ST_LOC_CD
prompt =======================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_LOC_CD
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,LOC_CD
,LOC_DESC
FROM RSCCC.ST_LOC_CD@TXEIS;

prompt
prompt Creating materialized view MV_ST_OFENS_CD
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_OFENS_CD
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,OFENS_CD
,UPDATE_FLAG
,OFENS_DESC
,PEIMS_CD
FROM RSCCC.ST_OFENS_CD@TXEIS;

prompt
prompt Creating materialized view MV_ST_OFENS_LVL
prompt ==========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_OFENS_LVL
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,LEVEL_CD
,LEVEL_DESC
FROM RSCCC.ST_OFENS_LVL@TXEIS;

prompt
prompt Creating materialized view MV_ST_REC_STATUS
prompt ===========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_REC_STATUS
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,REC_STATUS
,STATUS_DESC
FROM RSCCC.ST_REC_STATUS@TXEIS;

prompt
prompt Creating materialized view MV_ST_RELATION
prompt =========================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_RELATION
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,RELATION_CD
,DESCRIPTION
FROM RSCCC.ST_RELATION@TXEIS;

prompt
prompt Creating materialized view MV_ST_REP_EXCLUSN
prompt ============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_REP_EXCLUSN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,EXCLUSN_CD
,EXCLUSN_DESC
FROM RSCCC.ST_REP_EXCLUSN@TXEIS;

prompt
prompt Creating materialized view MV_ST_SERIES_TYPE
prompt ============================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_SERIES_TYPE
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR,
SERIES_TYP,
SERIES_DESC
FROM RSCCC.ST_SERIES_TYPE@TXEIS;

prompt
prompt Creating materialized view MV_ST_WD_RSN
prompt =======================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_ST_WD_RSN
REFRESH COMPLETE ON DEMAND
AS
SELECT
SCH_YR
,WD_RSN_CD
,WD_RSN_DESC
,UPDATE_FLAG
FROM RSCCC.ST_WD_RSN@TXEIS;

prompt
prompt Creating materialized view MV_TXSTU_STU_CAMPUS_BASE_D
prompt =====================================================
prompt
CREATE MATERIALIZED VIEW TIMSRPTDATA.MV_TXSTU_STU_CAMPUS_BASE_D
REFRESH COMPLETE ON DEMAND
AS
SELECT
       	SR_STU_ENROLL.SCH_YR
      	,SR_STU_ENROLL.GRD_LVL GRD
        ,CASE SR_STU_ENROLL.GRD_LVL
           WHEN 'EE' THEN '-2'
           WHEN 'PK' THEN '-1'
           WHEN 'KG' THEN '00'
           ELSE SR_STU_ENROLL.GRD_LVL
         END GRDSORT
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_ENTRY) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_ENTRY
         END ENTRY_DT
	      ,SR_STU_ENROLL.ATT_TRK TRACK
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_ORIG_ENTRY) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_ORIG_ENTRY
         END ORIG_ENTRY_DT
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.DT_WITHDRAW) IS NULL THEN NULL
           ELSE SR_STU_ENROLL.DT_WITHDRAW
         END WITHDRAWAL_DT
	      ,TRIM(SR_STU_ENROLL.WITHDRAW_CD) WITHDRAWAL_CODE
        ,ST_WD_RSN.WD_RSN_DESC WITHDRAWAL_REASON
        ,SR_STU_ENROLL.STU_ID STUDENT_ID
     	  ,INITCAP(SR_STU_ENROLL.NAME_L)||', '||INITCAP(SR_STU_ENROLL.NAME_F)||' '||INITCAP(SR_STU_ENROLL.NAME_M)
                ||' '||CASE ET_C012_GEN.GEN_DESCR
                         WHEN 'JR' THEN 'Jr'
                         WHEN 'SR' THEN 'Sr'
                         ELSE ET_C012_GEN.GEN_DESCR
                       END FULL_NAME
	      ,SR_STU_ENROLL.NAME_F FIRST_NAME
	      ,SR_STU_ENROLL.NAME_M MIDDLE_NAME
	      ,SR_STU_ENROLL.NAME_L LAST_NAME
	      ,SR_STU_ENROLL.NAME_GEN_CD GEN_OLD
        ,ET_C012_GEN.GEN_DESCR GEN
	      ,SR_STU_ENROLL.NAME_STU_GOES_BY NICKNAME
	      ,SR_STU_ENROLL.ELIG_CD ELIG_CODE
	      ,TRIM(SR_STU_ENROLL.CAMPUS_ID_RES) CAMPUS_ID_RESID
        ,SR_STU_ENROLL.SSAN_DENIED SSN_DENIED
      	,SR_STU_ENROLL.CAMPUS_ID CAMPUS_ID
        ,CR_DEMO.CAMPUS_NAME
	      ,SR_STU_ENROLL.ACTIVE_CD ACTIVE_CD
        ,ST_ACTIVE_CD.DESCRIPTION ACTIVE_DESC
 	      ,SR_STU_ENROLL.ATTRIBUTION_CD ATTRIBUTION_CD
	      ,SR_STU_ENROLL.STATUS_CD RECORD_STATUS_CD
        ,ST_REC_STATUS.STATUS_DESC RECORD_STATUS_DESC
        ,TRIM(SR_STU_ENROLL.EXCLUSION_CD) REP_EXCL
        ,ST_REP_EXCLUSN.EXCLUSN_DESC REP_EXCL_DESC
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.STATE_STU_ID) IS NULL THEN NULL
           ELSE SUBSTR(SR_STU_ENROLL.STATE_STU_ID,1,3)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID,4,2)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID,6,4)
           END STATE_STUDENT_ID
        ,CASE
           WHEN TRIM(SR_STU_ENROLL.STATE_STU_ID_PRIOR) IS NULL THEN NULL
           ELSE SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,1,3)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,4,2)||'-'||SUBSTR(SR_STU_ENROLL.STATE_STU_ID_PRIOR,6,4)
           END STATE_PRIOR_ID
	      ,TRIM(SR_STU_ENROLL.ADDR_STR_NBR||' '||SR_STU_ENROLL.ADDR_STR_NAME||' '||
		       SR_STU_ENROLL.ADDR_STR_DIR||CASE WHEN TRIM(SR_STU_ENROLL.ADDR_APT_NBR) IS NULL THEN ''
                                       ELSE ' #'||SR_STU_ENROLL.ADDR_APT_NBR END) MAIL_ADDRESS
	      ,SR_STU_ENROLL.ADDR_CITY MAIL_CITY
	      ,SR_STU_ENROLL.ADDR_STATE MAIL_STATE
	      ,SR_STU_ENROLL.ADDR_ZIP MAIL_ZIP
        ,SR_STU_DEMO.SEX
        ,SR_STU_DEMO.DOB
        ,SR_STU_DEMO.ETHN_HISPANIC HISPANIC_NUM
        ,SR_STU_DEMO.RACE_AMER_INDIAN AMER_INDIAN_NUM
        ,SR_STU_DEMO.RACE_ASIAN ASIAN_NUM
        ,SR_STU_DEMO.RACE_BLACK BLACK_NUM
        ,SR_STU_DEMO.RACE_PACIFIC_ISL PACIFIC_ISL_NUM
        ,SR_STU_DEMO.ETHN_AGG_CD AGGREGATE_RACE_ETHNICITY
        ,CASE
           WHEN TRIM(SR_STU_DEMO.PHONE_NBR) IS NULL THEN NULL
           WHEN LENGTH(SR_STU_DEMO.PHONE_NBR) = 1 THEN NULL
           ELSE '('||SR_STU_DEMO.STU_PHONE_AC||') '||substr(SR_STU_DEMO.PHONE_NBR,1,3)||'-'||substr(SR_STU_DEMO.PHONE_NBR,4,7)
           END PHONE_NUMBER
        ,SR_STU_DEMO.READING_ELA_MSTRY_DT READING_ELA_MASTERY
        ,SR_STU_DEMO.WRITING_MSTRY_DT WRITING_MASTERY
        ,SR_STU_DEMO.MATH_MSTRY_DT MATH_MASTERY
        ,SR_STU_DEMO.SOCIAL_STUDIES_MSTRY_DT SOCIAL_STUDIES_MASTERY
        ,SR_STU_DEMO.SCIENCE_MSTRY_DT SCIENCE_MASTERY
        ,SR_STU_DEMO.EXIT_READING_ELA_MSTRY_DT EXIT_READING_ELA_MASTERY
        ,SR_STU_DEMO.EXIT_MATH_MSTRY_DT EXIT_MATH_MASTERY
        ,SR_STU_DEMO.EXIT_SOCIAL_STUDIES_MSTRY_DT EXIT_SOCIAL_STUDIES_MASTERY
        ,SR_STU_DEMO.EXIT_SCIENCE_MSTRY_DT EXIT_SCIENCE_MASTERY
        ,TRIM(SR_STU_DEMO.STR_NBR_PHYS||' '||SR_STU_DEMO.STR_NAME_PHYS||' '||
               SR_STU_DEMO.STR_DRCTN_PHYS||case when trim(SR_STU_DEMO.APT_NBR_PHYS_ADDR) is null then ''
                                       else ' #'||SR_STU_DEMO.APT_NBR_PHYS_ADDR end) PHYSICAL_ADDRESS
        ,TRIM(CITY_NAME_PHYS_ADDR) PHYSICAL_ADDRESS_CITY
        ,TRIM(PHYS_ADDR_STATE) PHYSICAL_ADDRESS_STATE
        ,TRIM(ZIP_CODE_PHYS_ADDR) PHYSICAL_ADDRESS_ZIP
FROM    SR_STU_DEMO
        JOIN SR_STU_ENROLL ON SR_STU_ENROLL.SCH_YR = SR_STU_DEMO.SCH_YR
                      AND SR_STU_ENROLL.STU_ID = SR_STU_DEMO.STU_ID
                      AND SR_STU_ENROLL.STATUS_CD IN ('1','2','3')
                      AND SR_STU_ENROLL.DT_ENTRY = (SELECT MAX(SR_STU_ENROLL_MAX.DT_ENTRY)
                                   FROM SR_STU_ENROLL SR_STU_ENROLL_MAX
                                  WHERE SR_STU_ENROLL_MAX.STU_ID = SR_STU_ENROLL.STU_ID
                                    AND SR_STU_ENROLL_MAX.SCH_YR = SR_STU_ENROLL.SCH_YR
                                    AND SR_STU_ENROLL_MAX.CAMPUS_ID = SR_STU_ENROLL.CAMPUS_ID)
         LEFT JOIN ET_C012_GEN ON ET_C012_GEN.SCH_YR = SR_STU_ENROLL.SCH_YR
                              AND ET_C012_GEN.GEN_CD = SR_STU_ENROLL.NAME_GEN_CD
         LEFT JOIN ST_WD_RSN ON ST_WD_RSN.SCH_YR = SR_STU_ENROLL.SCH_YR
                             AND ST_WD_RSN.WD_RSN_CD = TRIM(SR_STU_ENROLL.WITHDRAW_CD)
         LEFT JOIN CR_DEMO ON CR_DEMO.SCH_YR = SR_STU_ENROLL.SCH_YR
                           AND CR_DEMO.CAMPUS_ID = TRIM(SR_STU_ENROLL.CAMPUS_ID)
         LEFT JOIN ST_ACTIVE_CD ON ST_ACTIVE_CD.SCH_YR = SR_STU_ENROLL.SCH_YR
                                AND ST_ACTIVE_CD.ACTIVE_CD = TRIM(SR_STU_ENROLL.ACTIVE_CD)
         LEFT JOIN ST_REC_STATUS ON ST_REC_STATUS.SCH_YR = SR_STU_ENROLL.SCH_YR
                                AND ST_REC_STATUS.REC_STATUS = TRIM(SR_STU_ENROLL.STATUS_CD)
         LEFT JOIN ST_REP_EXCLUSN ON ST_REP_EXCLUSN.SCH_YR = SR_STU_ENROLL.SCH_YR
                                 AND ST_REP_EXCLUSN.EXCLUSN_CD = TRIM(SR_STU_ENROLL.EXCLUSION_CD);

prompt
prompt Creating materialized view STUDENT_CREDIT_SUMMARY_MV
prompt ====================================================
prompt
create materialized view TIMSRPTDATA.STUDENT_CREDIT_SUMMARY_MV
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
                    from execution_log
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
                    from execution_log
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
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_CORE_LOAD_PROCESSING" is

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
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_CORE_UTILITIES" is

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
prompt Creating package PKG_DWS_INTERVENTION_NOTE
prompt ==========================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_INTERVENTION_NOTE" is
/* *******************************************
Description: This package contains the methods for maintaining the
             INTERVENTION_NOTE table.
Change History
03/26/2013 CB  Initial version
********************************************** */
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION_NOTE"
   procedure "INS_DWS_INTERVENTION_NOTE" (
      "P_STUDENT_INTERVENTION_SID"   in number,
      "P_INTERVENTION_NOTE_TYPE_SID" in number,
      "P_INTERVENTION_NOTE_TEXT"     in varchar2
   );
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION_NOTE"
   procedure UPD_DWS_INTERVENTION_NOTE (
      P_INTERVENTION_NOTE_SID in number,
      P_INTERVENTION_NOTE_TYPE_SID in number,
      P_INTERVENTION_NOTE_TEXT     in varchar2,
      P_MD5                        in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION_NOTE"
   procedure "DEL_DWS_INTERVENTION_NOTE" (
      "P_INTERVENTION_NOTE_SID" in number
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_NOTE"
   procedure "GET_DWS_INTERVENTION_NOTE" (
      "P_INTERVENTION_NOTE_SID" in number,
      "P_STUDENT_INTERVENTION_SID"   out number,
      "P_INTERVENTION_NOTE_TYPE_SID" out number,
      "P_USER_SID"                   out number,
      "P_INTERVENTION_NOTE_DT"       out date,
      "P_INTERVENTION_NOTE_TEXT"     out varchar2,
      "P_LAST_UPDATE"                out date
   );
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_NOTE"
   procedure "GET_DWS_INTERVENTION_NOTE" (
      "P_INTERVENTION_NOTE_SID" in number,
      "P_STUDENT_INTERVENTION_SID"   out number,
      "P_INTERVENTION_NOTE_TYPE_SID" out number,
      "P_USER_SID"                   out number,
      "P_INTERVENTION_NOTE_DT"       out date,
      "P_INTERVENTION_NOTE_TEXT"     out varchar2,
      "P_LAST_UPDATE"                out date,
      "P_MD5"                        out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION_NOTE"
   function "BLD_DWS_INTERVENTION_NOTE_MD5" (
      "P_INTERVENTION_NOTE_SID" in number,
      "P_STUDENT_INTERVENTION_SID"   in number,
      "P_INTERVENTION_NOTE_TYPE_SID" in number,
      "P_USER_SID"                   in number,
      "P_INTERVENTION_NOTE_DT"       in date,
      "P_INTERVENTION_NOTE_TEXT"     in varchar2,
      "P_LAST_UPDATE"                in date,
      "P_COL_SEP"                    in varchar2  default '|'
   ) return varchar2;

end "PKG_DWS_INTERVENTION_NOTE";
/

prompt
prompt Creating package PKG_DWS_SECURITY
prompt =================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_SECURITY" is

  -- Author  : BULLC
  -- Created : 1/23/2013 11:01:09 AM
  -- Purpose : DWS SPECIFIC SECURITY ELEMENTS

  -- Public type declarations

  -- Public constant declarations

  -- Public variable declarations

  -- Public function and procedure declarations
  procedure prc_load_dws_security_table;
  procedure prc_load_dws_security_table (p_user_sid IN number);
end PKG_DWS_SECURITY;
/

prompt
prompt Creating package PKG_DWS_STUDENT_INTERVENTION
prompt =============================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_STUDENT_INTERVENTION" is
/* *******************************************
Description: This package contains the methods for maintaining the
             DWS_STUDENT_INTERVENTION table and the STUDENT_CHAMPION on the
             STUDENT_DIM table.
Change History
03/26/2013 CB  Initial version
********************************************** */
--------------------------------------------------------------
-- create procedure for table "DWS_STUDENT_INTERVENTION
   procedure INS_DWS_STUDENT_INTERVENTION (
       P_STUDENT_SID                  in NUMBER
      ,P_INTERVENTION_STATUS_SID      in NUMBER
      ,P_INTERVENTION_SID             in NUMBER
      ,P_INTERVENTION_BEGIN_DATE      in DATE
      ,P_INTERVENTION_END_DATE        in DATE     default null
      ,P_INTERVENTION_GOAL            in VARCHAR2 default null
      ,P_INTERVENTION_PLAN            in VARCHAR2 default null
   );
--------------------------------------------------------------
-- update procedure for table "DWS_STUDENT_INTERVENTION
   procedure UPD_DWS_STUDENT_INTERVENTION (
      P_STUDENT_INTERVENTION_SID      in NUMBER
      ,P_INTERVENTION_STATUS_SID      in NUMBER
      ,P_INTERVENTION_SID             in NUMBER
      ,P_INTERVENTION_BEGIN_DATE      in DATE
      ,P_INTERVENTION_END_DATE        in DATE     default null
      ,P_INTERVENTION_GOAL            in VARCHAR2 default null
      ,P_INTERVENTION_PLAN            in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_COMMENT  in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_RANK     in NUMBER   default null
      ,P_MD5                          in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table "DWS_STUDENT_INTERVENTION
   procedure DEL_DWS_STUDENT_INTERVENTION (
      P_STUDENT_INTERVENTION_SID  in number
   );
--------------------------------------------------------------
-- get procedure for table "DWS_STUDENT_INTERVENTION
   procedure GET_DWS_STUDENT_INTERVENTION (
       P_STUDENT_INTERVENTION_SID     in NUMBER
      ,P_STUDENT_SID                  out NUMBER
      ,P_INTERVENTION_STATUS_SID      out NUMBER
      ,P_INTERVENTION_SID             out NUMBER
      ,P_INTERVENTION_CATEGORY_SID    out NUMBER
      ,P_CREATED_BY_USER_SID          out NUMBER
      ,P_LAST_UPDATE_USER_SID         out NUMBER
      ,P_INTERVENTION_BEGIN_DATE      out DATE
      ,P_INTERVENTION_END_DATE        out DATE
      ,P_INTERVENTION_GOAL            out VARCHAR2
      ,P_INTERVENTION_PLAN            out VARCHAR2
      ,P_INTERVENTION_RESULT_COMMENT  out VARCHAR2
      ,P_INTERVENTION_RESULT_RANK     out NUMBER
      ,P_CREATE_DATE                  out DATE
      ,P_LAST_UPDATE                  out DATE
   );
--------------------------------------------------------------
-- get procedure for table "DWS_STUDENT_INTERVENTION
   procedure GET_DWS_STUDENT_INTERVENTION (
       P_STUDENT_INTERVENTION_SID     in  NUMBER
      ,P_STUDENT_SID                  out NUMBER
      ,P_INTERVENTION_STATUS_SID      out NUMBER
      ,P_INTERVENTION_SID             out NUMBER
      ,P_INTERVENTION_CATEGORY_SID    out NUMBER
      ,P_CREATED_BY_USER_SID          out NUMBER
      ,P_LAST_UPDATE_USER_SID         out NUMBER
      ,P_INTERVENTION_BEGIN_DATE      out DATE
      ,P_INTERVENTION_END_DATE        out DATE
      ,P_INTERVENTION_GOAL            out VARCHAR2
      ,P_INTERVENTION_PLAN            out VARCHAR2
      ,P_INTERVENTION_RESULT_COMMENT  out VARCHAR2
      ,P_INTERVENTION_RESULT_RANK     out NUMBER
      ,P_CREATE_DATE                  out DATE
      ,P_LAST_UPDATE                  out DATE
      ,P_MD5                          out varchar2
   );
--------------------------------------------------------------
-- update procedure for table "STUDENT_DIM"
   procedure UPDATE_DWS_STUDENT_CHAMPION (
     P_STUDENT_SID     IN NUMBER,
     P_CHAMPION_SID    IN NUMBER);

end PKG_DWS_STUDENT_INTERVENTION;
/

prompt
prompt Creating package PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_DWS_STUDENT_NOTE" is
--------------------------------------------------------------
-- create procedure for table DWS_STUDENT_NOTE
   procedure INS_DWS_STUDENT_NOTE (
      P_STUDENT_SID     in number,
      P_NOTE_TEXT       in varchar2  default null
   );
--------------------------------------------------------------
-- update procedure for table DWS_STUDENT_NOTE
   procedure UPD_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     in number,
      P_NOTE_AUTHOR_SID in number,
      P_NOTE_DTTM       in date,
      P_NOTE_TEXT       in varchar2  default null,
      P_MD5             in varchar2  default null
   );
--------------------------------------------------------------
-- delete procedure for table DWS_STUDENT_NOTE
   procedure DEL_DWS_STUDENT_NOTE (
      P_NOTE_ID in number
   );
--------------------------------------------------------------
-- get procedure for table DWS_STUDENT_NOTE
   procedure GET_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     out number,
      P_NOTE_AUTHOR_SID out number,
      P_NOTE_DTTM       out date,
      P_NOTE_TEXT       out varchar2
   );
--------------------------------------------------------------
-- get procedure for table DWS_STUDENT_NOTE
   procedure GET_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     out number,
      P_NOTE_AUTHOR_SID out number,
      P_NOTE_DTTM       out date,
      P_NOTE_TEXT       out varchar2,
      P_MD5             out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table DWS_STUDENT_NOTE
   function BUILD_DWS_STUDENT_NOTE_MD5 (
      --P_NOTE_ID in number,
      P_STUDENT_SID     in number,
      P_NOTE_AUTHOR_SID in number,
      P_NOTE_DTTM       in date,
      P_NOTE_TEXT       in varchar2  default null,
      P_COL_SEP         in varchar2  default '|'
   ) return varchar2;
 
end PKG_DWS_STUDENT_NOTE;
/

prompt
prompt Creating package PKG_EMAIL
prompt ==========================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_EMAIL" is

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
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_ENROLLMENT_POST_PROCESSING" is

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
prompt Creating package PKG_IDMGR_DISTRICT
prompt ===================================
prompt
create or replace package timsrptdata.PKG_IDMGR_DISTRICT is
--------------------------------------------------------------
-- update procedure for table "DISTRICT_DIM
   procedure PROC_UPD_DISTRICT_DIM (
      P_DISTRICT_SID in number,
      P_DISTRICT_ID                in varchar2,
      P_DISTRICT_NAME              in varchar2  default null,
      P_ADDRESS                    in varchar2  default null,
      P_ADDRESS_LINE_2             in varchar2  default null,
      P_CITY                       in varchar2  default null,
      P_STATE_CODE                 in varchar2  default null,
      P_POSTAL_CODE                in varchar2  default null,
      P_COUNTY                     in varchar2  default null,
      P_REGION_NAME                in varchar2  default null,
      P_PHONE_NUMBER               in varchar2  default null,
      P_FAX_NUMBER                 in varchar2  default null,
      P_EMAIL_ADDRESS              in varchar2  default null,
      P_WEB_SITE                   in varchar2  default null,
      P_PASSWORD_EXPIRE_DAYS       in number    default '180',
      P_PASSWORD_MAX_ATTEMPTS      in number    default 5,
      P_LOGIN_MESSAGE              in varchar2  default null,
      P_LOGIN_MSG_START_DATE_TIME  in date      default null,
      P_LOGIN_MSG_END_DATE_TIME    in date      default null,
      P_MD5                        in varchar2  default null
   );
--------------------------------------------------------------
-- get procedure for table "DISTRICT_DIM
   procedure PROC_GET_DISTRICT_DIM (
      P_DISTRICT_SID               out number,
      P_DISTRICT_ID                out varchar2,
      P_DISTRICT_NAME              out varchar2,
      P_ADDRESS                    out varchar2,
      P_ADDRESS_LINE_2             out varchar2,
      P_CITY                       out varchar2,
      P_STATE_CODE                 out varchar2,
      P_POSTAL_CODE                out varchar2,
      P_COUNTY                     out varchar2,
      P_LAST_UPDATE                out timestamp,
      P_REGION_NAME                out varchar2,
      P_PHONE_NUMBER               out varchar2,
      P_FAX_NUMBER                 out varchar2,
      P_EMAIL_ADDRESS              out varchar2,
      P_WEB_SITE                   out varchar2,
      P_PASSWORD_EXPIRE_DAYS       out number,
      P_PASSWORD_MAX_ATTEMPTS      out number,
      P_LOGIN_MESSAGE              out varchar2,
      P_LOGIN_MSG_START_DATE_TIME  out timestamp,
      P_LOGIN_MSG_END_DATE_TIME    out timestamp
   );
--------------------------------------------------------------
-- get procedure for table "DISTRICT_DIM
   procedure PROC_GET_DISTRICT_DIM (
      P_DISTRICT_SID               out number,
      P_DISTRICT_ID                out varchar2,
      P_DISTRICT_NAME              out varchar2,
      P_ADDRESS                    out varchar2,
      P_ADDRESS_LINE_2             out varchar2,
      P_CITY                       out varchar2,
      P_STATE_CODE                 out varchar2,
      P_POSTAL_CODE                out varchar2,
      P_COUNTY                     out varchar2,
      P_LAST_UPDATE                out timestamp,
      P_REGION_NAME                out varchar2,
      P_PHONE_NUMBER               out varchar2,
      P_FAX_NUMBER                 out varchar2,
      P_EMAIL_ADDRESS              out varchar2,
      P_WEB_SITE                   out varchar2,
      P_PASSWORD_EXPIRE_DAYS       out number,
      P_PASSWORD_MAX_ATTEMPTS      out number,
      P_LOGIN_MESSAGE              out varchar2,
      P_LOGIN_MSG_START_DATE_TIME  out timestamp,
      P_LOGIN_MSG_END_DATE_TIME    out timestamp,
      P_MD5                        out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table "DISTRICT_DIM
   function FN_BUILD_DISTRICT_DIM_MD5 (
      P_DISTRICT_SID               in number,
      P_DISTRICT_ID                in varchar2,
      P_DISTRICT_AREA              in varchar2  default null,
      P_DISTRICT_NAME              in varchar2  default null,
      P_ADDRESS                    in varchar2  default null,
      P_ADDRESS_LINE_2             in varchar2  default null,
      P_CITY                       in varchar2  default null,
      P_STATE_CODE                 in varchar2  default null,
      P_POSTAL_CODE                in varchar2  default null,
      P_COUNTY                     in varchar2  default null,
      P_DISTRICT_KEY               in varchar2  default null,
      P_LAST_UPDATE                in timestamp  default null,
      P_REGION_NAME                in varchar2  default null,
      P_PHONE_NUMBER               in varchar2  default null,
      P_FAX_NUMBER                 in varchar2  default null,
      P_EMAIL_ADDRESS              in varchar2  default null,
      P_WEB_SITE                   in varchar2  default null,
      P_PASSWORD_EXPIRE_DAYS       in number    default null,
      P_PASSWORD_MAX_ATTEMPTS      in number    default null,
      P_PASSWORD_EXPIRE_MONTH      in number    default null,
      P_PASSWORD_EXPIRE_DAY        in number    default null,
      P_PASSWORD_EXPIRATION_METHOD in varchar2  default null,
      P_DISTRICT_SECURITY_QUESTION in varchar2  default null,
      P_DISTRICT_SECURITY_ANSWER   in varchar2  default null,
      P_DISTRICT_IP_RANGE          in varchar2  default null,
      P_LOGIN_MESSAGE              in varchar2  default null,
      P_LOGIN_MSG_START_DATE_TIME  in timestamp default null,
      P_LOGIN_MSG_END_DATE_TIME    in timestamp default null,
      P_COL_SEP                    in varchar2  default '|'
   ) return varchar2;
--------------------------------------------------------------
-- Retrieves the District Name for display on the Login page.
--------------------------------------------------------------
   procedure PROC_DISTRICT_NAME;
    
end PKG_IDMGR_DISTRICT;
/

prompt
prompt Creating package PKG_RISK_CALCULATION_ENGINE
prompt ============================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_RISK_CALCULATION_ENGINE" is

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
  -- 01/15/13 CBull Added prc_discipline_rf_refresh for the discipline risk factor.
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

  PROCEDURE prc_discipline_rf_refresh
    (p_campus_sid IN number
    ,p_run_date_sid IN number
    ,p_school_year IN varchar2
    ,p_discipline_threshold IN number
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
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_RISK_FACTOR_CONFIG" is

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
prompt Creating package PKG_RPT_DATA_SOURCE
prompt ====================================
prompt
create or replace package timsrptdata.PKG_RPT_DATA_SOURCE is

  -- Author  : WARNERA
  -- Created : 12/17/2012 2:16:23 PM
  -- Purpose : Routines for switching between Reveal Reporter data sources
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
  
  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  PROCEDURE prc_txstu_switch_data_mode (v_source IN varchar2);
  
  PROCEDURE prc_datamart_refresh;
  
  PROCEDURE prc_datamart_refresh ( P_MVIEW IN varchar2);

end PKG_RPT_DATA_SOURCE;
/

prompt
prompt Creating package PKG_SV_ACCT_MGMT
prompt =================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA.pkg_sv_acct_mgmt
AS

PROCEDURE proc_reset_email
          (  p_user_sid     IN number
            ,p_workspace_id IN number default null) ;
          
PROCEDURE proc_forgot_password
          (  p_user_id      IN varchar2 
            ,p_workspace_id IN number);

PROCEDURE proc_manual_pw_reset
          (  p_user_sid IN number 
            ,p_new_password IN varchar2);

PROCEDURE proc_send_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   ) ;
 
PROCEDURE proc_log_trans
   (  p_USER_SID				IN NUMBER
			,p_USER_ID				IN VARCHAR2
			,p_LOG_MESSAGE			IN VARCHAR2
			,p_ACTION_TYPE			IN VARCHAR2
			,p_ACTION_RESULT		IN VARCHAR2
			,p_ATTEMPTS				IN NUMBER
			,p_USER_IP_ADDRESS		IN VARCHAR2
      ,p_BROWSER		IN VARCHAR2 DEFAULT NULL );
            

PROCEDURE proc_good_login
          (  p_USER_SID        IN number   ) ;


PROCEDURE proc_disable_account
          (  p_USER_SID				IN number   ) ;

 FUNCTION fn_attempt_login  (p_USER_SID IN number   )
    RETURN number ;

PROCEDURE proc_push_email_queue ;

END pkg_sv_acct_mgmt ;
/

prompt
prompt Creating package PKG_SV_SECURITY
prompt ================================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_SV_SECURITY"
AS

PROCEDURE proc_login
          (
           p_uname IN VARCHAR2
          ,p_password IN VARCHAR2
          ,p_session_id IN VARCHAR2
          ,p_flow_page IN VARCHAR2
          );

FUNCTION fn_get_hash
        (
         p_username IN VARCHAR2
        ,p_password IN VARCHAR2
        )
         RETURN VARCHAR2;

PROCEDURE proc_valid_user2
          (
           p_username IN VARCHAR2
          ,p_password IN VARCHAR2
          );

FUNCTION fn_valid_user
        (
         p_username IN VARCHAR2
        ,p_password IN VARCHAR2
        )
         RETURN BOOLEAN;


FUNCTION fn_valid_user_sql
        (
         p_username IN VARCHAR2
        ,p_password IN VARCHAR2
        )
         RETURN VARCHAR2;

procedure prc_load_reveal_security_table;

procedure prc_load_reveal_security_table(p_user_sid IN NUMBER);

/* ***********************************************************************************
Purpose:    This Procedure Performs an LDAP look up on email address and then attempts to 
            bind the distinguished name and users password for authentication.

07/20/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION ldap_auth(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
) RETURN BOOLEAN;

END pkg_sv_security ;
/

prompt
prompt Creating package PKG_TXEIS_SECURITY
prompt ===================================
prompt
create or replace package timsrptdata.PKG_TXEIS_SECURITY is

  -- Author  : BULLC
  -- Created : 1/23/2013 11:32:31 AM
  -- Purpose : TXEIS SPECIFIC SECURITY ROUTINES
  
  -- Public type declarations
  
  -- Public constant declarations

  -- Public variable declarations

  -- Public function and procedure declarations
  procedure prc_load_txeis_security_table;
  procedure prc_load_txeis_security_table (p_user_sid IN number);
end PKG_TXEIS_SECURITY;
/

prompt
prompt Creating package PKG_UTILITIES
prompt ==============================
prompt
CREATE OR REPLACE PACKAGE TIMSRPTDATA."PKG_UTILITIES"

AS

FUNCTION fn_GET_ELAPSED_TIME(
p_start_datetime TIMESTAMP := SYSTIMESTAMP
, p_end_datetime TIMESTAMP := SYSTIMESTAMP
)RETURN NUMBER;

PROCEDURE proc_ETL_LOG_EVENT(
p_job_name                VARCHAR2
,p_event_type             VARCHAR2
,p_source_name            VARCHAR2
,p_status                 VARCHAR2
,p_error_code             VARCHAR2
,p_error_message          VARCHAR2
,p_rows_affected_count    NUMBER
,p_comments               VARCHAR2
,p_start_time             TIMESTAMP
,p_end_time               TIMESTAMP
,p_elapsed_time           NUMBER
);

END pkg_UTILITIES;
/

prompt
prompt Creating package body PKG_CORE_LOAD_PROCESSING
prompt ==============================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_CORE_LOAD_PROCESSING" is

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
  v_start_time               etl_event_log.start_time%TYPE := systimestamp;
  v_end_time                 etl_event_log.end_time%TYPE;
  v_errcode                  etl_event_log.error_code%TYPE;
  v_errmesg                  etl_event_log.error_message%TYPE;
  v_rows_affected            number := 0;
  v_district_sid             date_dim.date_sid%type;

  --*************
  -- Main program
  --*************
  begin
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE - delete_facts'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => 'Rows deleted from ' || p_fact_table || ' for ' || p_district_id || ' school year ' || p_school_year
                                       ,p_rows_affected_count => v_rows_affected
                                       ,p_comments => 'Successful completion of delete_facts procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));

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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE - delete_facts'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Error in delete_facts procedure on ' || p_fact_table || ' for ' || p_district_id || ' school year ' || p_school_year
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time
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
  --                      tables with the suffix _err and _rej. It then deletes any row older than
  --                      sysdate - the p_retention_period from the tables. Based on the default
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
        pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'prc_clean_up_rej_err'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of prc_clean_up_rej_err procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
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
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'prc_clean_up_rej_err'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_cnt
                                         ,p_comments => 'Error in prc_clean_up_rej_err procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise;

  end prc_clean_up_rej_err;

end pkg_core_load_processing;
/

prompt
prompt Creating package body PKG_CORE_UTILITIES
prompt ========================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_CORE_UTILITIES" is

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
    Execute immediate 'ALTER MATERIALIZED VIEW STUDENT_CREDIT_SUMMARY_MV COMPILE';
    v_staleness := '';
  end if;

  DBMS_MVIEW.refresh('STUDENT_CREDIT_SUMMARY_MV');

  select ALL_MVIEWS.STALENESS
  into v_staleness
  from ALL_MVIEWS
  where ALL_MVIEWS.MVIEW_NAME = 'STUDENT_CREDIT_SUMMARY_MV';
  -- determine if the view needs to be recompiled --
  if v_staleness = 'NEEDS_COMPILE' then
    Execute immediate 'ALTER MATERIALIZED VIEW STUDENT_CREDIT_SUMMARY_MV COMPILE';
  end if;

end prc_core_refresh_mv;

end PKG_CORE_UTILITIES;
/

prompt
prompt Creating package body PKG_DWS_INTERVENTION
prompt ==========================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_INTERVENTION" is
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION
   procedure INS_DWS_INTERVENTION (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_NAME         in varchar2,
      P_INTERVENTION_DESCRIPTION  in varchar2  default null,
      P_INTERVENTION_COMMENT      in varchar2  default null,
      P_ACTIVE_FLAG               in varchar2
   ) is

     V_USER_SID                      NUMBER;

   begin
      -- retrieve the sid for the currently logged in user as the create user --
      SELECT USER_ACCOUNT.USER_SID
      INTO V_USER_SID
      FROM USER_ACCOUNT
      WHERE USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

      insert into DWS_INTERVENTION (
         INTERVENTION_SID,
         INTERVENTION_CATEGORY_SID,
         CREATE_BY_USER_SID,
         LAST_UPDATE_USER_SID,
         INTERVENTION_NAME,
         INTERVENTION_DESCRIPTION,
         INTERVENTION_COMMENT,
         ACTIVE_FLAG,
         CREATE_DATE,
         LAST_UPDATE
      ) values (
         SID_SEQUENCE.NEXTVAL,
         P_INTERVENTION_CATEGORY_SID,
         V_USER_SID,
         V_USER_SID,
         P_INTERVENTION_NAME,
         P_INTERVENTION_DESCRIPTION,
         P_INTERVENTION_COMMENT,
         P_ACTIVE_FLAG,
         SYSDATE,
         SYSDATE
      );

   end INS_DWS_INTERVENTION;
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION
   procedure UPD_DWS_INTERVENTION (
      P_INTERVENTION_SID in number,
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_NAME         in varchar2,
      P_INTERVENTION_DESCRIPTION  in varchar2  default null,
      P_INTERVENTION_COMMENT      in varchar2  default null,
      P_ACTIVE_FLAG               in varchar2,
      P_MD5                       in varchar2  default null
   ) is

      V_USER_SID                      NUMBER;
      L_MD5                           varchar2(32767) := null;

   begin

      if P_MD5 is not null then
         for c1 in (
            select * from DWS_INTERVENTION
            where INTERVENTION_SID = P_INTERVENTION_SID FOR UPDATE
         ) loop

            L_MD5 := BUILD_DWS_INTERVENTION_MD5(
               c1.INTERVENTION_SID,
               c1.INTERVENTION_CATEGORY_SID,
               c1.CREATE_BY_USER_SID,
               c1.LAST_UPDATE_USER_SID,
               c1.INTERVENTION_NAME,
               c1.INTERVENTION_DESCRIPTION,
               c1.INTERVENTION_COMMENT,
               c1.ACTIVE_FLAG,
               c1.CREATE_DATE,
               c1.LAST_UPDATE
            );

         end loop;

      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
        -- retrieve the sid for the currently logged in user as the update user --
         SELECT USER_ACCOUNT.USER_SID
          INTO V_USER_SID
          FROM USER_ACCOUNT
          WHERE USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

         update DWS_INTERVENTION set
            INTERVENTION_CATEGORY_SID   = P_INTERVENTION_CATEGORY_SID,
            INTERVENTION_NAME           = P_INTERVENTION_NAME,
            INTERVENTION_DESCRIPTION    = P_INTERVENTION_DESCRIPTION,
            INTERVENTION_COMMENT        = P_INTERVENTION_COMMENT,
            ACTIVE_FLAG                 = P_ACTIVE_FLAG,
            LAST_UPDATE_USER_SID        = V_USER_SID,
            LAST_UPDATE                 = SYSDATE
         where INTERVENTION_SID = P_INTERVENTION_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end UPD_DWS_INTERVENTION;
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION
   procedure DEL_DWS_INTERVENTION (
      P_INTERVENTION_SID in number
   ) is

   begin

      delete from DWS_INTERVENTION
      where INTERVENTION_SID = P_INTERVENTION_SID;

   end DEL_DWS_INTERVENTION;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION
   procedure GET_DWS_INTERVENTION (
      P_INTERVENTION_SID in number,
      P_INTERVENTION_CATEGORY_SID out number,
      P_CREATE_BY_USER_SID        out number,
      P_LAST_UPDATE_USER_SID      out number,
      P_INTERVENTION_NAME         out varchar2,
      P_INTERVENTION_DESCRIPTION  out varchar2,
      P_INTERVENTION_COMMENT      out varchar2,
      P_ACTIVE_FLAG               out varchar2,
      P_CREATE_DATE               out date,
      P_LAST_UPDATE               out date
   ) is

      ignore varchar2(32676);
   begin

      GET_DWS_INTERVENTION (
         P_INTERVENTION_SID,
         P_INTERVENTION_CATEGORY_SID,
         P_CREATE_BY_USER_SID,
         P_LAST_UPDATE_USER_SID,
         P_INTERVENTION_NAME,
         P_INTERVENTION_DESCRIPTION,
         P_INTERVENTION_COMMENT,
         P_ACTIVE_FLAG,
         P_CREATE_DATE,
         P_LAST_UPDATE,
         ignore
      );

   end GET_DWS_INTERVENTION;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION
   procedure GET_DWS_INTERVENTION (
      P_INTERVENTION_SID in number,
      P_INTERVENTION_CATEGORY_SID out number,
      P_CREATE_BY_USER_SID        out number,
      P_LAST_UPDATE_USER_SID      out number,
      P_INTERVENTION_NAME         out varchar2,
      P_INTERVENTION_DESCRIPTION  out varchar2,
      P_INTERVENTION_COMMENT      out varchar2,
      P_ACTIVE_FLAG               out varchar2,
      P_CREATE_DATE               out date,
      P_LAST_UPDATE               out date,
      P_MD5                       out varchar2
   ) is

   begin

      for c1 in (
         select * from DWS_INTERVENTION
         where INTERVENTION_SID = P_INTERVENTION_SID
      ) loop
         P_INTERVENTION_CATEGORY_SID := c1.INTERVENTION_CATEGORY_SID;
         P_CREATE_BY_USER_SID        := c1.CREATE_BY_USER_SID;
         P_LAST_UPDATE_USER_SID      := c1.LAST_UPDATE_USER_SID;
         P_INTERVENTION_NAME         := c1.INTERVENTION_NAME;
         P_INTERVENTION_DESCRIPTION  := c1.INTERVENTION_DESCRIPTION;
         P_INTERVENTION_COMMENT      := c1.INTERVENTION_COMMENT;
         P_ACTIVE_FLAG               := c1.ACTIVE_FLAG;
         P_CREATE_DATE               := c1.CREATE_DATE;
         P_LAST_UPDATE               := c1.LAST_UPDATE;

         P_MD5 := BUILD_DWS_INTERVENTION_MD5(
            c1.INTERVENTION_SID,
            c1.INTERVENTION_CATEGORY_SID,
            c1.CREATE_BY_USER_SID,
            c1.LAST_UPDATE_USER_SID,
            c1.INTERVENTION_NAME,
            c1.INTERVENTION_DESCRIPTION,
            c1.INTERVENTION_COMMENT,
            c1.ACTIVE_FLAG,
            c1.CREATE_DATE,
            c1.LAST_UPDATE
         );
      end loop;

   end GET_DWS_INTERVENTION;
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION
-- this function builds a hash key of the table data to be used to
-- determine that the table data has not changed since it was read.
   function BUILD_DWS_INTERVENTION_MD5 (
      P_INTERVENTION_SID in number,
      P_INTERVENTION_CATEGORY_SID in number,
      P_CREATE_BY_USER_SID        in number,
      P_LAST_UPDATE_USER_SID      in number,
      P_INTERVENTION_NAME         in varchar2,
      P_INTERVENTION_DESCRIPTION  in varchar2  default null,
      P_INTERVENTION_COMMENT      in varchar2  default null,
      P_ACTIVE_FLAG               in varchar2,
      P_CREATE_DATE               in date      default null,
      P_LAST_UPDATE               in date      default null,
      P_COL_SEP                   in varchar2  default '|'
   ) return varchar2 is

   begin

      return utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string=>
         P_INTERVENTION_SID          ||P_COL_SEP||
         P_INTERVENTION_CATEGORY_SID ||P_COL_SEP||
         P_CREATE_BY_USER_SID        ||P_COL_SEP||
         P_LAST_UPDATE_USER_SID      ||P_COL_SEP||
         P_INTERVENTION_NAME         ||P_COL_SEP||
         P_INTERVENTION_DESCRIPTION  ||P_COL_SEP||
         P_INTERVENTION_COMMENT      ||P_COL_SEP||
         P_ACTIVE_FLAG               ||P_COL_SEP||
         P_CREATE_DATE               ||P_COL_SEP||
         P_LAST_UPDATE               ||P_COL_SEP||
         ''
      ));

   end BUILD_DWS_INTERVENTION_MD5;

end PKG_DWS_INTERVENTION;
/

prompt
prompt Creating package body PKG_DWS_INTERVENTION_NOTE
prompt ===============================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_INTERVENTION_NOTE" is
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION_NOTE
   procedure INS_DWS_INTERVENTION_NOTE (
      P_STUDENT_INTERVENTION_SID   in number,
      P_INTERVENTION_NOTE_TYPE_SID in number,
      P_INTERVENTION_NOTE_TEXT     in varchar2
   ) is

   V_USER_SID  NUMBER;

   begin
      -- RETRIEVE THE CONTEXT USER AS THE CREATED BY USER --
      SELECT USER_ACCOUNT.USER_SID
      INTO V_USER_SID
      FROM USER_ACCOUNT
      WHERE USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

      insert into DWS_INTERVENTION_NOTE (
         INTERVENTION_NOTE_SID,
         STUDENT_INTERVENTION_SID,
         INTERVENTION_NOTE_TYPE_SID,
         USER_SID,
         INTERVENTION_NOTE_DT,
         INTERVENTION_NOTE_TEXT,
         LAST_UPDATE
      ) values (
         SID_SEQUENCE.NEXTVAL,
         P_STUDENT_INTERVENTION_SID,
         P_INTERVENTION_NOTE_TYPE_SID,
         V_USER_SID,
         SYSDATE,
         P_INTERVENTION_NOTE_TEXT,
         SYSDATE
      );

   end INS_DWS_INTERVENTION_NOTE;
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION_NOTE
   procedure UPD_DWS_INTERVENTION_NOTE (
      P_INTERVENTION_NOTE_SID in number,
      P_INTERVENTION_NOTE_TYPE_SID in number,
      P_INTERVENTION_NOTE_TEXT     in varchar2,
      P_MD5                        in varchar2  default null
   ) is

      L_MD5 varchar2(32767) := null;

   begin

      if P_MD5 is not null then
         for c1 in (
            select * from DWS_INTERVENTION_NOTE
            where INTERVENTION_NOTE_SID = P_INTERVENTION_NOTE_SID FOR UPDATE
         ) loop

            L_MD5 := BLD_DWS_INTERVENTION_NOTE_MD5(
               c1.INTERVENTION_NOTE_SID,
               c1.STUDENT_INTERVENTION_SID,
               c1.INTERVENTION_NOTE_TYPE_SID,
               c1.USER_SID,
               c1.INTERVENTION_NOTE_DT,
               c1.INTERVENTION_NOTE_TEXT,
               c1.LAST_UPDATE
            );

         end loop;

      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
         update DWS_INTERVENTION_NOTE set
            INTERVENTION_NOTE_TYPE_SID   = P_INTERVENTION_NOTE_TYPE_SID,
            INTERVENTION_NOTE_TEXT       = P_INTERVENTION_NOTE_TEXT,
            LAST_UPDATE                  = SYSDATE
         where INTERVENTION_NOTE_SID = P_INTERVENTION_NOTE_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end UPD_DWS_INTERVENTION_NOTE;
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION_NOTE
   procedure DEL_DWS_INTERVENTION_NOTE (
      P_INTERVENTION_NOTE_SID in number
   ) is

   begin

      delete from DWS_INTERVENTION_NOTE
      where INTERVENTION_NOTE_SID = P_INTERVENTION_NOTE_SID;
      commit;
   end DEL_DWS_INTERVENTION_NOTE;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_NOTE
   procedure GET_DWS_INTERVENTION_NOTE (
      P_INTERVENTION_NOTE_SID      in number,
      P_STUDENT_INTERVENTION_SID   out number,
      P_INTERVENTION_NOTE_TYPE_SID out number,
      P_USER_SID                   out number,
      P_INTERVENTION_NOTE_DT       out date,
      P_INTERVENTION_NOTE_TEXT     out varchar2,
      P_LAST_UPDATE                out date
   ) is

      ignore varchar2(32676);
   begin

      GET_DWS_INTERVENTION_NOTE (
         P_INTERVENTION_NOTE_SID,
         P_STUDENT_INTERVENTION_SID,
         P_INTERVENTION_NOTE_TYPE_SID,
         P_USER_SID,
         P_INTERVENTION_NOTE_DT,
         P_INTERVENTION_NOTE_TEXT,
         P_LAST_UPDATE,
         ignore
      );

   end GET_DWS_INTERVENTION_NOTE;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_NOTE
   procedure GET_DWS_INTERVENTION_NOTE (
      P_INTERVENTION_NOTE_SID       in number,
      P_STUDENT_INTERVENTION_SID   out number,
      P_INTERVENTION_NOTE_TYPE_SID out number,
      P_USER_SID                   out number,
      P_INTERVENTION_NOTE_DT       out date,
      P_INTERVENTION_NOTE_TEXT     out varchar2,
      P_LAST_UPDATE                out date,
      P_MD5                        out varchar2
   ) is

   begin

      for c1 in (
         select * from DWS_INTERVENTION_NOTE
         where INTERVENTION_NOTE_SID = P_INTERVENTION_NOTE_SID
      ) loop
         P_STUDENT_INTERVENTION_SID   := c1.STUDENT_INTERVENTION_SID;
         P_INTERVENTION_NOTE_TYPE_SID := c1.INTERVENTION_NOTE_TYPE_SID;
         P_USER_SID                   := c1.USER_SID;
         P_INTERVENTION_NOTE_DT       := c1.INTERVENTION_NOTE_DT;
         P_INTERVENTION_NOTE_TEXT     := c1.INTERVENTION_NOTE_TEXT;
         P_LAST_UPDATE                := c1.LAST_UPDATE;

         P_MD5 := BLD_DWS_INTERVENTION_NOTE_MD5(
            c1.INTERVENTION_NOTE_SID,
            c1.STUDENT_INTERVENTION_SID,
            c1.INTERVENTION_NOTE_TYPE_SID,
            c1.USER_SID,
            c1.INTERVENTION_NOTE_DT,
            c1.INTERVENTION_NOTE_TEXT,
            c1.LAST_UPDATE
         );
      end loop;

   end GET_DWS_INTERVENTION_NOTE;
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION_NOTE
   function BLD_DWS_INTERVENTION_NOTE_MD5 (
      P_INTERVENTION_NOTE_SID      in number,
      P_STUDENT_INTERVENTION_SID   in number,
      P_INTERVENTION_NOTE_TYPE_SID in number,
      P_USER_SID                   in number,
      P_INTERVENTION_NOTE_DT       in date,
      P_INTERVENTION_NOTE_TEXT     in varchar2,
      P_LAST_UPDATE                in date,
      P_COL_SEP                    in varchar2  default '|'
   ) return varchar2 is

   begin

      return utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string=>
         P_INTERVENTION_NOTE_SID      ||P_COL_SEP||
         P_STUDENT_INTERVENTION_SID   ||P_COL_SEP||
         P_INTERVENTION_NOTE_TYPE_SID ||P_COL_SEP||
         P_USER_SID                   ||P_COL_SEP||
         P_INTERVENTION_NOTE_DT       ||P_COL_SEP||
         P_INTERVENTION_NOTE_TEXT     ||P_COL_SEP||
         P_LAST_UPDATE                ||P_COL_SEP||
         ''
      ));

   end BLD_DWS_INTERVENTION_NOTE_MD5;

end PKG_DWS_INTERVENTION_NOTE;
/

prompt
prompt Creating package body PKG_DWS_INTERV_CATEGORY
prompt =============================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_INTERV_CATEGORY" is
--------------------------------------------------------------
-- create procedure for table "DWS_INTERVENTION_CATEGORY
   procedure INS_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null
   ) is

   begin

      insert into DWS_INTERVENTION_CATEGORY (
         INTERVENTION_CATEGORY_SID,
         INTERVENTION_CATEGORY,
         INTERVENTION_CATEGORY_DESC,
         ACTIVE_FLAG
      ) values (
         SID_SEQUENCE.NEXTVAL,
         P_INTERVENTION_CATEGORY,
         P_INTERVENTION_CATEGORY_DESC,
         P_ACTIVE_FLAG
      );

   end INS_DWS_INTERVENTION_CATEGORY;
--------------------------------------------------------------
-- update procedure for table "DWS_INTERVENTION_CATEGORY
   procedure UPD_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null,
      P_MD5                        in varchar2  default null
   ) is

      L_MD5 varchar2(32767) := null;

   begin

      if P_MD5 is not null then
         for c1 in (
            select * from DWS_INTERVENTION_CATEGORY
            where INTERVENTION_CATEGORY_SID = P_INTERVENTION_CATEGORY_SID FOR UPDATE
         ) loop

            L_MD5 := BLD_DWS_INTERV_CATEGORY_MD5(
               c1.INTERVENTION_CATEGORY_SID,
               c1.INTERVENTION_CATEGORY,
               c1.INTERVENTION_CATEGORY_DESC,
               c1.ACTIVE_FLAG
            );

         end loop;

      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
         update DWS_INTERVENTION_CATEGORY set
            INTERVENTION_CATEGORY        = P_INTERVENTION_CATEGORY,
            INTERVENTION_CATEGORY_DESC   = P_INTERVENTION_CATEGORY_DESC,
            ACTIVE_FLAG                  = P_ACTIVE_FLAG
         where INTERVENTION_CATEGORY_SID = P_INTERVENTION_CATEGORY_SID;
         commit;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end UPD_DWS_INTERVENTION_CATEGORY;
--------------------------------------------------------------
-- delete procedure for table "DWS_INTERVENTION_CATEGORY
   procedure DEL_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number
   ) is

   begin
      delete from DWS_INTERVENTION_CATEGORY
      where INTERVENTION_CATEGORY_SID = P_INTERVENTION_CATEGORY_SID;

   end DEL_DWS_INTERVENTION_CATEGORY;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_CATEGORY
   procedure GET_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      out varchar2,
      P_INTERVENTION_CATEGORY_DESC out varchar2,
      P_ACTIVE_FLAG                out varchar2
   ) is

      ignore varchar2(32676);
   begin

      GET_DWS_INTERVENTION_CATEGORY (
         P_INTERVENTION_CATEGORY_SID,
         P_INTERVENTION_CATEGORY,
         P_INTERVENTION_CATEGORY_DESC,
         P_ACTIVE_FLAG,
         ignore
      );

   end GET_DWS_INTERVENTION_CATEGORY;
--------------------------------------------------------------
-- get procedure for table "DWS_INTERVENTION_CATEGORY
   procedure GET_DWS_INTERVENTION_CATEGORY (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      out varchar2,
      P_INTERVENTION_CATEGORY_DESC out varchar2,
      P_ACTIVE_FLAG                out varchar2,
      P_MD5                        out varchar2
   ) is

   begin

      for c1 in (
         select * from DWS_INTERVENTION_CATEGORY
         where INTERVENTION_CATEGORY_SID = P_INTERVENTION_CATEGORY_SID
      ) loop
         P_INTERVENTION_CATEGORY      := c1.INTERVENTION_CATEGORY;
         P_INTERVENTION_CATEGORY_DESC := c1.INTERVENTION_CATEGORY_DESC;
         P_ACTIVE_FLAG                := c1.ACTIVE_FLAG;

         P_MD5 := BLD_DWS_INTERV_CATEGORY_MD5(
            c1.INTERVENTION_CATEGORY_SID,
            c1.INTERVENTION_CATEGORY,
            c1.INTERVENTION_CATEGORY_DESC,
            c1.ACTIVE_FLAG
         );
      end loop;

   end GET_DWS_INTERVENTION_CATEGORY;
--------------------------------------------------------------
-- build MD5 function for table "DWS_INTERVENTION_CATEGORY
-- this function builds a hash key of the table data to be used to
-- determine that the table data has not changed since it was read.
   function BLD_DWS_INTERV_CATEGORY_MD5 (
      P_INTERVENTION_CATEGORY_SID in number,
      P_INTERVENTION_CATEGORY      in varchar2,
      P_INTERVENTION_CATEGORY_DESC in varchar2  default null,
      P_ACTIVE_FLAG                in varchar2  default null,
      P_COL_SEP                    in varchar2  default '|'
   ) return varchar2 is

   begin

      return utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string=>
         P_INTERVENTION_CATEGORY_SID  ||P_COL_SEP||
         P_INTERVENTION_CATEGORY      ||P_COL_SEP||
         P_INTERVENTION_CATEGORY_DESC ||P_COL_SEP||
         P_ACTIVE_FLAG                ||P_COL_SEP||
         ''
      ));

   end BLD_DWS_INTERV_CATEGORY_MD5;

end PKG_DWS_INTERV_CATEGORY;
/

prompt
prompt Creating package body PKG_DWS_SECURITY
prompt ======================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_SECURITY" is

  -- Private type declarations

  -- Private constant declarations

  -- Private variable declarations

  -- Function and procedure implementations

/* ***********************************************************************************
Purpose:    This Procedure builds the security table for Dropout to use by
            pulling all the users and their roles.  Campus users have the student sids for their
            assigned campuses loaded while district users have their user_id and -9999 loaded for
            student_sid to indicate all students in the district.

This Procedure first deletes all records from the table.

01/23/13 CBull  Original Creation
*********************************************************************************** */
procedure prc_load_dws_security_table
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_alias application.application_alias%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

begin
  -- delete all data from the tables. --
  delete from user_student_security;
  -- select all users and their roles --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.application_alias)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.application_alias) = 'DWS'
  join role_master         on role_master.role_sid = application_role.role_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  if v_user_role_list.count > 0 then
    for i in v_user_role_list.first..v_user_role_list.last
      loop
        if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
           insert into user_student_security
            select
            user_account.user_id
            ,user_account.district_sid
            ,student_dim.student_sid
            from user_account
            join student_dim on student_dim.district_sid = user_account.district_sid
            join user_campus on user_campus.user_sid = user_account.user_sid
            join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
            where student_dim.campus_security_key = 'TX*'||campus_master.campus_id
            and user_account.user_id = v_user_role_list(i).userId;
         else -- district users --
           -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
           -- technically should have one or the other. we are allowing both to have full district wide
           -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
           -- add the user if it's the first row of the collection else skip the row in the collection if
           -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
           -- application.
           if i != v_user_role_list.FIRST
              and v_user_role_list(i).role = 'DISTRICT_USER'
              and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
              and v_user_role_list(i).application_alias = v_user_role_list(v_user_role_list.PRIOR(i)).application_alias then
              -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
             null; -- skip to the next record this user has already been recorded as having distict wide data access --
           else
             insert into user_student_security
              (user_id, district_sid, student_sid)
             values
              (v_user_role_list(i).userId, v_user_role_list(i).districtSID, -9999);
           end if;
         end if;
      commit;
     end loop;
   end if;

end prc_load_dws_security_table;

/* ***********************************************************************************
Purpose:    This Procedure OVERLOADS the prc_load_dws_security_table and builds the
            security table for Dropout for a SINGLE USER.
            Campus users have the student sids for their
            assigned campuses loaded while district users have their user_id and -9999 loaded for
            student_sid to idicate all students in the district.

This Procedure first deletes all records from the tables for the specified p_user_id.

12/17/12 CBull  Original Creation
*********************************************************************************** */
procedure prc_load_dws_security_table (p_user_sid IN number)
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_alias application.application_alias%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

begin
  -- delete all data from the tables. --
  delete from user_student_security
   where user_id = (select user_account.user_id from user_account where user_account.user_sid = p_user_sid);
  -- select all users and their roles --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.application_alias)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.application_alias) = 'DWS'
  join role_master         on role_master.role_sid = application_role.role_sid
  where user_account.user_sid = p_user_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  if v_user_role_list.count > 0 then
    for i in v_user_role_list.first..v_user_role_list.last
      loop
        if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
           insert into user_student_security
            select
            user_account.user_id
            ,user_account.district_sid
            ,student_dim.student_sid
            from user_account
            join student_dim on student_dim.district_sid = user_account.district_sid
            join user_campus on user_campus.user_sid = user_account.user_sid
            join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
            where student_dim.campus_security_key = 'TX*'||campus_master.campus_id
            and user_account.user_id = v_user_role_list(i).userId;
         else -- district users --
           -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
           -- technically should have one or the other. we are allowing both to have full district wide
           -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
           -- add the user if it's the first row of the collection else skip the row in the collection if
           -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
           -- application.
           if i != v_user_role_list.FIRST
              and v_user_role_list(i).role = 'DISTRICT_USER'
              and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
              and v_user_role_list(i).application_alias = v_user_role_list(v_user_role_list.PRIOR(i)).application_alias then
              -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
             null; -- skip to the next record this user has already been recorded as having distict wide data access --
           else
             insert into user_student_security
              (user_id, district_sid, student_sid)
             values
              (v_user_role_list(i).userId, v_user_role_list(i).districtSID, -9999);
           end if;
         end if;
      commit;
     end loop;
   end if;
end prc_load_dws_security_table;

end PKG_DWS_SECURITY;
/

prompt
prompt Creating package body PKG_DWS_STUDENT_INTERVENTION
prompt ==================================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_STUDENT_INTERVENTION" is

--------------------------------------------------------------
-- build MD5 function for table "DWS_STUDENT_INTERVENTION
-- this function builds a hash key of the table data to be used to
-- determine that the table data has not changed since it was read.
   function BUILD_DWS_STU_INTERVENTION_MD5 (
       P_STUDENT_INTERVENTION_SID     in NUMBER
      ,P_STUDENT_SID                  in NUMBER
      ,P_INTERVENTION_STATUS_SID      in NUMBER
      ,P_INTERVENTION_SID             in NUMBER
      ,P_CREATED_BY_USER_SID          in NUMBER
      ,P_LAST_UPDATE_USER_SID         in NUMBER
      ,P_INTERVENTION_BEGIN_DATE      in DATE
      ,P_INTERVENTION_END_DATE        in DATE     default null
      ,P_INTERVENTION_GOAL            in VARCHAR2 default null
      ,P_INTERVENTION_PLAN            in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_COMMENT  in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_RANK     in NUMBER   default null
      ,P_CREATE_DATE                  in DATE
      ,P_LAST_UPDATE                  in DATE
      ,P_COL_SEP                      in varchar2        default '|'
   ) return varchar2 is

   begin

      return utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string=>
         P_STUDENT_INTERVENTION_SID      ||P_COL_SEP||
         P_STUDENT_SID                   ||P_COL_SEP||
         P_INTERVENTION_STATUS_SID       ||P_COL_SEP||
         P_INTERVENTION_SID              ||P_COL_SEP||
         P_CREATED_BY_USER_SID           ||P_COL_SEP||
         P_LAST_UPDATE_USER_SID          ||P_COL_SEP||
         P_INTERVENTION_BEGIN_DATE       ||P_COL_SEP||
         P_INTERVENTION_END_DATE         ||P_COL_SEP||
         P_INTERVENTION_GOAL             ||P_COL_SEP||
         P_INTERVENTION_PLAN             ||P_COL_SEP||
         P_INTERVENTION_RESULT_COMMENT   ||P_COL_SEP||
         P_INTERVENTION_RESULT_RANK      ||P_COL_SEP||
         P_CREATE_DATE                   ||P_COL_SEP||
         P_LAST_UPDATE                   ||P_COL_SEP||
         ''
      ));

   end BUILD_DWS_STU_INTERVENTION_MD5;
--------------------------------------------------------------
-- create procedure for table "DWS_STUDENT_INTERVENTION
   procedure INS_DWS_STUDENT_INTERVENTION (
       P_STUDENT_SID                  in NUMBER
      ,P_INTERVENTION_STATUS_SID      in NUMBER
      ,P_INTERVENTION_SID             in NUMBER
      ,P_INTERVENTION_BEGIN_DATE      in DATE
      ,P_INTERVENTION_END_DATE        in DATE     default null
      ,P_INTERVENTION_GOAL            in VARCHAR2 default null
      ,P_INTERVENTION_PLAN            in VARCHAR2 default null
   ) is

      V_USER_SID                      NUMBER;

   begin
      -- retrieve the sid for the currently logged in user as the create user --
      SELECT USER_ACCOUNT.USER_SID
      INTO V_USER_SID
      FROM USER_ACCOUNT
      WHERE USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

      INSERT INTO DWS_STUDENT_INTERVENTION
        (STUDENT_INTERVENTION_SID,
         STUDENT_SID,
         INTERVENTION_STATUS_SID,
         INTERVENTION_SID,
         CREATED_BY_USER_SID,
         LAST_UPDATE_USER_SID,
         INTERVENTION_BEGIN_DATE,
         INTERVENTION_END_DATE,
         INTERVENTION_GOAL,
         INTERVENTION_PLAN,
         INTERVENTION_RESULT_COMMENT,
         INTERVENTION_RESULT_RANK,
         CREATE_DATE,
         LAST_UPDATE)
      VALUES
        (SID_SEQUENCE.NEXTVAL
        ,P_STUDENT_SID
        ,P_INTERVENTION_STATUS_SID
        ,P_INTERVENTION_SID
        ,V_USER_SID
        ,V_USER_SID
        ,P_INTERVENTION_BEGIN_DATE
        ,P_INTERVENTION_END_DATE
        ,P_INTERVENTION_GOAL
        ,P_INTERVENTION_PLAN
        ,null
        ,null
        ,sysdate
        ,sysdate
        );


   end INS_DWS_STUDENT_INTERVENTION;
--------------------------------------------------------------
-- update procedure for table "DWS_STUDENT_INTERVENTION
   procedure UPD_DWS_STUDENT_INTERVENTION (
      P_STUDENT_INTERVENTION_SID      in NUMBER
      ,P_INTERVENTION_STATUS_SID      in NUMBER
      ,P_INTERVENTION_SID             in NUMBER
      ,P_INTERVENTION_BEGIN_DATE      in DATE
      ,P_INTERVENTION_END_DATE        in DATE     default null
      ,P_INTERVENTION_GOAL            in VARCHAR2 default null
      ,P_INTERVENTION_PLAN            in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_COMMENT  in VARCHAR2 default null
      ,P_INTERVENTION_RESULT_RANK     in NUMBER   default null
      ,P_MD5                          in varchar2  default null
   ) is

      L_MD5                           varchar2(32767) := null;
      V_USER_SID                      NUMBER;

   begin

      if P_MD5 is not null then
         for c1 in (
            select * from DWS_STUDENT_INTERVENTION
            where STUDENT_INTERVENTION_SID = P_STUDENT_INTERVENTION_SID FOR UPDATE
         ) loop

            L_MD5 := BUILD_DWS_STU_INTERVENTION_MD5(
               c1.STUDENT_INTERVENTION_SID
              ,c1.STUDENT_SID
              ,c1.INTERVENTION_STATUS_SID
              ,c1.INTERVENTION_SID
              ,c1.CREATED_BY_USER_SID
              ,c1.LAST_UPDATE_USER_SID
              ,c1.INTERVENTION_BEGIN_DATE
              ,c1.INTERVENTION_END_DATE
              ,c1.INTERVENTION_GOAL
              ,c1.INTERVENTION_PLAN
              ,c1.INTERVENTION_RESULT_COMMENT
              ,c1.INTERVENTION_RESULT_RANK
              ,c1.CREATE_DATE
              ,c1.LAST_UPDATE
            );

         end loop;

      end if;
      -- retrieve the sid for the currently logged in user as the update user --
      SELECT USER_ACCOUNT.USER_SID
      INTO V_USER_SID
      FROM USER_ACCOUNT
      WHERE USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
          UPDATE DWS_STUDENT_INTERVENTION
              SET INTERVENTION_STATUS_SID         = P_INTERVENTION_STATUS_SID,
                  INTERVENTION_SID                = P_INTERVENTION_SID,
                  LAST_UPDATE_USER_SID            = V_USER_SID,
                  INTERVENTION_BEGIN_DATE         = P_INTERVENTION_BEGIN_DATE,
                  INTERVENTION_END_DATE           = P_INTERVENTION_END_DATE,
                  INTERVENTION_GOAL               = P_INTERVENTION_GOAL,
                  INTERVENTION_PLAN               = P_INTERVENTION_PLAN,
                  INTERVENTION_RESULT_COMMENT     = P_INTERVENTION_RESULT_COMMENT,
                  INTERVENTION_RESULT_RANK        = P_INTERVENTION_RESULT_RANK,
                  LAST_UPDATE                     = sysdate
            WHERE STUDENT_INTERVENTION_SID = P_STUDENT_INTERVENTION_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end UPD_DWS_STUDENT_INTERVENTION;
--------------------------------------------------------------
-- delete procedure for table "DWS_STUDENT_INTERVENTION
   procedure DEL_DWS_STUDENT_INTERVENTION (
      P_STUDENT_INTERVENTION_SID  in number
   ) is

   begin

      delete from DWS_STUDENT_INTERVENTION
      where STUDENT_INTERVENTION_SID = P_STUDENT_INTERVENTION_SID ;

   end DEL_DWS_STUDENT_INTERVENTION;
--------------------------------------------------------------
-- get procedure for table "DWS_STUDENT_INTERVENTION
   procedure GET_DWS_STUDENT_INTERVENTION (
       P_STUDENT_INTERVENTION_SID     in NUMBER
      ,P_STUDENT_SID                  out NUMBER
      ,P_INTERVENTION_STATUS_SID      out NUMBER
      ,P_INTERVENTION_SID             out NUMBER
      ,P_INTERVENTION_CATEGORY_SID    out NUMBER
      ,P_CREATED_BY_USER_SID          out NUMBER
      ,P_LAST_UPDATE_USER_SID         out NUMBER
      ,P_INTERVENTION_BEGIN_DATE      out DATE
      ,P_INTERVENTION_END_DATE        out DATE
      ,P_INTERVENTION_GOAL            out VARCHAR2
      ,P_INTERVENTION_PLAN            out VARCHAR2
      ,P_INTERVENTION_RESULT_COMMENT  out VARCHAR2
      ,P_INTERVENTION_RESULT_RANK     out NUMBER
      ,P_CREATE_DATE                  out DATE
      ,P_LAST_UPDATE                  out DATE
   ) is

      ignore varchar2(32676);
   begin

      GET_DWS_STUDENT_INTERVENTION (
         P_STUDENT_INTERVENTION_SID
        ,P_STUDENT_SID
        ,P_INTERVENTION_STATUS_SID
        ,P_INTERVENTION_SID
        ,P_INTERVENTION_CATEGORY_SID
        ,P_CREATED_BY_USER_SID
        ,P_LAST_UPDATE_USER_SID
        ,P_INTERVENTION_BEGIN_DATE
        ,P_INTERVENTION_END_DATE
        ,P_INTERVENTION_GOAL
        ,P_INTERVENTION_PLAN
        ,P_INTERVENTION_RESULT_COMMENT
        ,P_INTERVENTION_RESULT_RANK
        ,P_CREATE_DATE
        ,P_LAST_UPDATE
        ,ignore
      );

   end GET_DWS_STUDENT_INTERVENTION;
--------------------------------------------------------------
-- get procedure for table "DWS_STUDENT_INTERVENTION
   procedure GET_DWS_STUDENT_INTERVENTION (
       P_STUDENT_INTERVENTION_SID     in  NUMBER
      ,P_STUDENT_SID                  out NUMBER
      ,P_INTERVENTION_STATUS_SID      out NUMBER
      ,P_INTERVENTION_SID             out NUMBER
      ,P_INTERVENTION_CATEGORY_SID    out NUMBER
      ,P_CREATED_BY_USER_SID          out NUMBER
      ,P_LAST_UPDATE_USER_SID         out NUMBER
      ,P_INTERVENTION_BEGIN_DATE      out DATE
      ,P_INTERVENTION_END_DATE        out DATE
      ,P_INTERVENTION_GOAL            out VARCHAR2
      ,P_INTERVENTION_PLAN            out VARCHAR2
      ,P_INTERVENTION_RESULT_COMMENT  out VARCHAR2
      ,P_INTERVENTION_RESULT_RANK     out NUMBER
      ,P_CREATE_DATE                  out DATE
      ,P_LAST_UPDATE                  out DATE
      ,P_MD5                          out varchar2
   ) is

   begin

      for c1 in (
         select
          DWS_STUDENT_INTERVENTION.STUDENT_SID,
          DWS_STUDENT_INTERVENTION.STUDENT_INTERVENTION_SID,
          DWS_STUDENT_INTERVENTION.INTERVENTION_STATUS_SID,
          DWS_STUDENT_INTERVENTION.INTERVENTION_SID,
          DWS_INTERVENTION.INTERVENTION_CATEGORY_SID,
          DWS_STUDENT_INTERVENTION.CREATED_BY_USER_SID,
          DWS_STUDENT_INTERVENTION.LAST_UPDATE_USER_SID,
          DWS_STUDENT_INTERVENTION.INTERVENTION_BEGIN_DATE,
          DWS_STUDENT_INTERVENTION.INTERVENTION_END_DATE,
          DWS_STUDENT_INTERVENTION.INTERVENTION_GOAL,
          DWS_STUDENT_INTERVENTION.INTERVENTION_PLAN,
          DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_COMMENT,
          DWS_STUDENT_INTERVENTION.INTERVENTION_RESULT_RANK,
          DWS_STUDENT_INTERVENTION.CREATE_DATE,
          DWS_STUDENT_INTERVENTION.LAST_UPDATE
          from DWS_STUDENT_INTERVENTION
          join DWS_INTERVENTION on DWS_INTERVENTION.INTERVENTION_SID = DWS_STUDENT_INTERVENTION.INTERVENTION_SID
          where STUDENT_INTERVENTION_SID = P_STUDENT_INTERVENTION_SID
      ) loop
          P_STUDENT_SID                   := c1.STUDENT_SID;
          P_INTERVENTION_STATUS_SID       := c1.INTERVENTION_STATUS_SID;
          P_INTERVENTION_SID              := c1.INTERVENTION_SID;
          P_INTERVENTION_CATEGORY_SID     := c1.INTERVENTION_CATEGORY_SID;
          P_CREATED_BY_USER_SID           := c1.CREATED_BY_USER_SID;
          P_LAST_UPDATE_USER_SID          := c1.LAST_UPDATE_USER_SID;
          P_INTERVENTION_BEGIN_DATE       := c1.INTERVENTION_BEGIN_DATE;
          P_INTERVENTION_END_DATE         := c1.INTERVENTION_END_DATE;
          P_INTERVENTION_GOAL             := c1.INTERVENTION_GOAL;
          P_INTERVENTION_PLAN             := c1.INTERVENTION_PLAN;
          P_INTERVENTION_RESULT_COMMENT   := c1.INTERVENTION_RESULT_COMMENT;
          P_INTERVENTION_RESULT_RANK      := c1.INTERVENTION_RESULT_RANK;
          P_CREATE_DATE                   := c1.CREATE_DATE;
          P_LAST_UPDATE                   := c1.LAST_UPDATE;

         P_MD5 := BUILD_DWS_STU_INTERVENTION_MD5(
               c1.STUDENT_INTERVENTION_SID
              ,c1.STUDENT_SID
              ,c1.INTERVENTION_STATUS_SID
              ,c1.INTERVENTION_SID
              ,c1.CREATED_BY_USER_SID
              ,c1.LAST_UPDATE_USER_SID
              ,c1.INTERVENTION_BEGIN_DATE
              ,c1.INTERVENTION_END_DATE
              ,c1.INTERVENTION_GOAL
              ,c1.INTERVENTION_PLAN
              ,c1.INTERVENTION_RESULT_COMMENT
              ,c1.INTERVENTION_RESULT_RANK
              ,c1.CREATE_DATE
              ,c1.LAST_UPDATE
            );
      end loop;

   end GET_DWS_STUDENT_INTERVENTION;
--------------------------------------------------------------
-- update procedure for table DWS_STUDENT_DIM.STUDENT_CHAMPION
--------------------------------------------------------------
   procedure UPDATE_DWS_STUDENT_CHAMPION (
     P_STUDENT_SID     IN NUMBER,
     P_CHAMPION_SID    IN NUMBER)
   as

   begin

     update STUDENT_DIM
       set USER_SID = P_CHAMPION_SID
       where STUDENT_SID = P_STUDENT_SID;

   end UPDATE_DWS_STUDENT_CHAMPION;

end PKG_DWS_STUDENT_INTERVENTION;
/

prompt
prompt Creating package body PKG_DWS_STUDENT_NOTE
prompt ==========================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_DWS_STUDENT_NOTE" is
--------------------------------------------------------------
-- create procedure for table DWS_STUDENT_NOTE
   procedure INS_DWS_STUDENT_NOTE (
      P_STUDENT_SID     in number,
      P_NOTE_TEXT       in varchar2  default null
   ) is 
         P_NOTE_AUTHOR_SID number; 
         V_NOTE_TEXT varchar2(2000); 
   begin
     
      -- trim note to 200 chars
      V_NOTE_TEXT := substr(P_NOTE_TEXT,1,2000);
     
      -- look up user sid based on user id from context
      select user_sid into P_NOTE_AUTHOR_SID
      from user_account
      where user_id = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');
      
      -- insert record
      insert into DWS_STUDENT_NOTE (
         NOTE_ID,
         STUDENT_SID,
         NOTE_AUTHOR_SID,
         NOTE_DTTM,
         NOTE_TEXT
      ) values ( 
         sid_sequence.nextval,
         P_STUDENT_SID,
         P_NOTE_AUTHOR_SID,
         sysdate,
         V_NOTE_TEXT
      );
 
      -- add application event log record??  use common function?
      
      
      
   end INS_DWS_STUDENT_NOTE;
--------------------------------------------------------------
-- update procedure for table DWS_STUDENT_NOTE
   procedure UPD_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     in number,
      P_NOTE_AUTHOR_SID in number,
      P_NOTE_DTTM       in date,
      P_NOTE_TEXT       in varchar2  default null,
      P_MD5             in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from DWS_STUDENT_NOTE 
            where NOTE_ID = P_NOTE_ID FOR UPDATE
         ) loop
 
            L_MD5 := BUILD_DWS_STUDENT_NOTE_MD5(
               --c1.NOTE_ID,
               c1.STUDENT_SID,
               c1.NOTE_AUTHOR_SID,
               c1.NOTE_DTTM,
               c1.NOTE_TEXT
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update DWS_STUDENT_NOTE set
            NOTE_ID           = P_NOTE_ID,
            STUDENT_SID       = P_STUDENT_SID,
            NOTE_AUTHOR_SID   = P_NOTE_AUTHOR_SID,
            NOTE_DTTM         = P_NOTE_DTTM,
            NOTE_TEXT         = P_NOTE_TEXT
         where NOTE_ID = P_NOTE_ID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end UPD_DWS_STUDENT_NOTE;
--------------------------------------------------------------
-- delete procedure for table DWS_STUDENT_NOTE
   procedure DEL_DWS_STUDENT_NOTE (
      P_NOTE_ID in number
   ) is 
 
   begin
 
      delete from DWS_STUDENT_NOTE 
      where NOTE_ID = P_NOTE_ID;
 
   end DEL_DWS_STUDENT_NOTE;
--------------------------------------------------------------
-- get procedure for table DWS_STUDENT_NOTE
   procedure GET_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     out number,
      P_NOTE_AUTHOR_SID out number,
      P_NOTE_DTTM       out date,
      P_NOTE_TEXT       out varchar2
   ) is 
 
      ignore varchar2(32676);
   begin
 
      GET_DWS_STUDENT_NOTE (
         P_NOTE_ID,
         P_STUDENT_SID,
         P_NOTE_AUTHOR_SID,
         P_NOTE_DTTM,
         P_NOTE_TEXT,
         ignore
      );
 
   end GET_DWS_STUDENT_NOTE;
--------------------------------------------------------------
-- get procedure for table DWS_STUDENT_NOTE
   procedure GET_DWS_STUDENT_NOTE (
      P_NOTE_ID in number,
      P_STUDENT_SID     out number,
      P_NOTE_AUTHOR_SID out number,
      P_NOTE_DTTM       out date,
      P_NOTE_TEXT       out varchar2,
      P_MD5             out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select * from DWS_STUDENT_NOTE 
         where NOTE_ID = P_NOTE_ID 
      ) loop
         P_STUDENT_SID     := c1.STUDENT_SID;
         P_NOTE_AUTHOR_SID := c1.NOTE_AUTHOR_SID;
         P_NOTE_DTTM       := c1.NOTE_DTTM;
         P_NOTE_TEXT       := c1.NOTE_TEXT;
 
         P_MD5 := BUILD_DWS_STUDENT_NOTE_MD5(
            --c1.NOTE_ID,
            c1.STUDENT_SID,
            c1.NOTE_AUTHOR_SID,
            c1.NOTE_DTTM,
            c1.NOTE_TEXT
         );
      end loop;
 
   end GET_DWS_STUDENT_NOTE;
--------------------------------------------------------------
-- build MD5 function for table DWS_STUDENT_NOTE
   function BUILD_DWS_STUDENT_NOTE_MD5 (
      --P_NOTE_ID in number,
      P_STUDENT_SID     in number,
      P_NOTE_AUTHOR_SID in number,
      P_NOTE_DTTM       in date,
      P_NOTE_TEXT       in varchar2  default null,
      P_COL_SEP         in varchar2  default '|'
   ) return varchar2 is 
 
   begin
 
      return utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string=> 
         P_STUDENT_SID     ||P_COL_SEP||
         P_NOTE_AUTHOR_SID ||P_COL_SEP||
         P_NOTE_DTTM       ||P_COL_SEP||
         P_NOTE_TEXT       ||P_COL_SEP||
         ''
      ));
 
   end BUILD_DWS_STUDENT_NOTE_MD5;
 
end PKG_DWS_STUDENT_NOTE;
/

prompt
prompt Creating package body PKG_EMAIL
prompt ===============================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_EMAIL" is

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
    v_jobname     etl_event_log.job_name%TYPE  := 'pkg_email.prc_rvl_students_added_email';
    v_start_time  timestamp := systimestamp;
    v_end_time    timestamp;
    v_errcode     varchar2(50);
    v_errmesg     varchar2(200);

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

    pkg_utilities.proc_etl_log_event(p_job_name => v_jobname
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
    pkg_utilities.proc_etl_log_event(p_job_name => v_jobname
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'PL/SQL'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_email_sent_cnt
                                       ,p_comments => 'Successful completion of procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
    --***********************
    -- Error handling section
    --***********************
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;

      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_person_email_cnt
                                         ,p_comments => 'Error at line number'||sys.DBMS_UTILITY.format_error_backtrace
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise;
  end prc_rvl_students_added_email;


end PKG_EMAIL;
/

prompt
prompt Creating package body PKG_ENROLLMENT_POST_PROCESSING
prompt ====================================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_ENROLLMENT_POST_PROCESSING" is

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
  pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
  pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE post enrollment procedure'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_count
                                       ,p_comments => 'Successful completion of enrollment post-processing'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time) );

  --dbms_output.put_line('Completed enrollment_post, '||v_rec_count||' rows updated.');

  --***********************
  -- Error handling section
  --***********************
  exception
  when others then
    v_errcode := sqlcode;
    v_errmesg := substr(sqlerrm,1,200);
    v_end_time := SYSTIMESTAMP;
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE post enrollment procedure'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_count
                                         ,p_comments => 'Error in enrollment post-processing'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time) );
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
  -- 20121212  C. Bull      updated query that gets the date sid for the extract date such that if it returns
  --                        no_data_found it will return the last day of the school year.
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
  v_start_time               etl_event_log.start_time%type := systimestamp;
  v_end_time                 etl_event_log.end_time%type;
  v_errcode                  etl_event_log.error_code%type;
  v_errmesg                  etl_event_log.error_message%type;
  v_extract_date_sid         date_dim.date_sid%type;
  v_rows_affected            number := 0;

  --*************
  -- Main program
  --*************
  begin
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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

    -- get extract_date_sid for day extract was executed, if no data found then get date for last day of school
    begin
    select date_sid
        into v_extract_date_sid
        from date_dim
          join district_dim
          using (district_sid)
        where year_month_day = p_extract_date
        and district_id = p_district_id;
    exception
      when no_data_found then
        select date_sid
        into v_extract_date_sid
        from date_dim
          join district_dim
          using (district_sid)
        where school_year = p_school_year
        and district_id = p_district_id
        and last_day_semester = 'Yes'
        and semester = '2';  
    end;

    for r_enr_rec in cur_stu_enr(p_school_year
                                ,v_extract_date_sid
                                ,p_district_id)
    loop

      execute immediate
        'update student_enrollment_fact
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
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'CORE - upd_stu_enr_days'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rows_affected
                                       ,p_comments => 'Successful completion of upd_stu_enr_days procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));

    end if;

    --***************************
    -- Exception handling section
    --***************************
    exception
    when others then
      v_errcode  := sqlcode;
      v_errmesg  := substr(sqlerrm,1,200);
      v_end_time := systimestamp;
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'CORE - upd_stu_enr_days'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => 0
                                         ,p_comments => 'Error in upd_stu_enr_days procedure'
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
    v_sql_stmt := 'insert into execution_log (execution_start_time, campus_sid, process_name, process_type, execution_end_time, execution_result)
                   values(:bv1, :bv2, ''Load'', ''N/A'', cast(sysdate as timestamp), ''Successful'')';

    for campus_rec in campus_cur(p_district_id) loop
      execute immediate v_sql_stmt using v_date_time, campus_rec.campus_sid;
      v_rec_cnt := v_rec_cnt + 1;
    end loop;
    commit;

    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'insert_date_to_execution_log'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of insert_date_to_execution_log procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
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
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_cnt
                                         ,p_comments => 'Error in insert_date_to_execution_log procedure for district ' || p_district_id
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
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
    pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                       ,p_event_type => 'INFO'
                                       ,p_source_name => 'prc_upd_grd_fact_grd_lvl'
                                       ,p_status => 'Ended'
                                       ,p_error_code => '0'
                                       ,p_error_message => NULL
                                       ,p_rows_affected_count => v_rec_cnt
                                       ,p_comments => 'Successful completion of prc_upd_grd_fact_grd_lvl procedure'
                                       ,p_start_time => v_start_time
                                       ,p_end_time => v_end_time
                                       ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
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
      pkg_utilities.proc_etl_log_event(p_job_name => $$PLSQL_UNIT
                                         ,p_event_type => 'ERROR'
                                         ,p_source_name => 'insert_date_to_execution_log'
                                         ,p_status => 'FAILED'
                                         ,p_error_code => v_errcode
                                         ,p_error_message => v_errmesg
                                         ,p_rows_affected_count => v_rec_cnt
                                         ,p_comments => 'Error in insert_date_to_execution_log procedure for district ' || p_district_id
                                         ,p_start_time => v_start_time
                                         ,p_end_time => v_end_time
                                         ,p_elapsed_time => pkg_utilities.fn_get_elapsed_time(v_start_time, v_end_time));
      rollback;
      raise;

  end prc_upd_grd_fact_grd_lvl;

end pkg_enrollment_post_processing;
/

prompt
prompt Creating package body PKG_IDMGR_DISTRICT
prompt ========================================
prompt
create or replace package body timsrptdata.PKG_IDMGR_DISTRICT is
--------------------------------------------------------------
-- update procedure for table "DISTRICT_DIM
   procedure PROC_UPD_DISTRICT_DIM (
      P_DISTRICT_SID in number,
      P_DISTRICT_ID                in varchar2,
      P_DISTRICT_NAME              in varchar2  default null,
      P_ADDRESS                    in varchar2  default null,
      P_ADDRESS_LINE_2             in varchar2  default null,
      P_CITY                       in varchar2  default null,
      P_STATE_CODE                 in varchar2  default null,
      P_POSTAL_CODE                in varchar2  default null,
      P_COUNTY                     in varchar2  default null,
      P_REGION_NAME                in varchar2  default null,
      P_PHONE_NUMBER               in varchar2  default null,
      P_FAX_NUMBER                 in varchar2  default null,
      P_EMAIL_ADDRESS              in varchar2  default null,
      P_WEB_SITE                   in varchar2  default null,
      P_PASSWORD_EXPIRE_DAYS       in number    default '180',
      P_PASSWORD_MAX_ATTEMPTS      in number    default 5,
      P_LOGIN_MESSAGE              in varchar2  default null,
      P_LOGIN_MSG_START_DATE_TIME  in date      default null,
      P_LOGIN_MSG_END_DATE_TIME    in date      default null,
      P_MD5                        in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from DISTRICT_DIM 
            where DISTRICT_SID = P_DISTRICT_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_DISTRICT_DIM_MD5(
               c1.DISTRICT_SID,
               c1.DISTRICT_ID,
               c1.DISTRICT_AREA,
               c1.DISTRICT_NAME,
               c1.ADDRESS,
               c1.ADDRESS_LINE_2,
               c1.CITY,
               c1.STATE_CODE,
               c1.POSTAL_CODE,
               c1.COUNTY,
               c1.DISTRICT_KEY,
               c1.LAST_UPDATE,
               c1.REGION_NAME,
               c1.PHONE_NUMBER,
               c1.FAX_NUMBER,
               c1.EMAIL_ADDRESS,
               c1.WEB_SITE,
               c1.PASSWORD_EXPIRE_DAYS,
               c1.PASSWORD_MAX_ATTEMPTS,
               c1.PASSWORD_EXPIRE_MONTH,
               c1.PASSWORD_EXPIRE_DAY,
               c1.PASSWORD_EXPIRATION_METHOD,
               c1.DISTRICT_SECURITY_QUESTION,
               c1.DISTRICT_SECURITY_ANSWER,
               c1.DISTRICT_IP_RANGE,
               c1.LOGIN_MESSAGE,
               c1.LOGIN_MESSAGE_START_DATE_TIME,
               c1.LOGIN_MESSAGE_END_DATE_TIME
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update DISTRICT_DIM set
            DISTRICT_ID                  = P_DISTRICT_ID,
            DISTRICT_NAME                = P_DISTRICT_NAME,
            ADDRESS                      = P_ADDRESS,
            ADDRESS_LINE_2               = P_ADDRESS_LINE_2,
            CITY                         = P_CITY,
            STATE_CODE                   = P_STATE_CODE,
            POSTAL_CODE                  = P_POSTAL_CODE,
            COUNTY                       = P_COUNTY,
            LAST_UPDATE                  = systimestamp,
            REGION_NAME                  = P_REGION_NAME,
            PHONE_NUMBER                 = P_PHONE_NUMBER,
            FAX_NUMBER                   = P_FAX_NUMBER,
            EMAIL_ADDRESS                = P_EMAIL_ADDRESS,
            WEB_SITE                     = P_WEB_SITE,
            PASSWORD_EXPIRE_DAYS         = P_PASSWORD_EXPIRE_DAYS,
            PASSWORD_MAX_ATTEMPTS        = P_PASSWORD_MAX_ATTEMPTS,
            LOGIN_MESSAGE                = P_LOGIN_MESSAGE,
            LOGIN_MESSAGE_START_DATE_TIME = P_LOGIN_MSG_START_DATE_TIME,
            LOGIN_MESSAGE_END_DATE_TIME   = P_LOGIN_MSG_END_DATE_TIME
         where DISTRICT_SID = P_DISTRICT_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_DISTRICT_DIM;

--------------------------------------------------------------
-- get procedure for table "DISTRICT_DIM
   procedure PROC_GET_DISTRICT_DIM (
      P_DISTRICT_SID               out number,
      P_DISTRICT_ID                out varchar2,
      P_DISTRICT_NAME              out varchar2,
      P_ADDRESS                    out varchar2,
      P_ADDRESS_LINE_2             out varchar2,
      P_CITY                       out varchar2,
      P_STATE_CODE                 out varchar2,
      P_POSTAL_CODE                out varchar2,
      P_COUNTY                     out varchar2,
      P_LAST_UPDATE                out timestamp,
      P_REGION_NAME                out varchar2,
      P_PHONE_NUMBER               out varchar2,
      P_FAX_NUMBER                 out varchar2,
      P_EMAIL_ADDRESS              out varchar2,
      P_WEB_SITE                   out varchar2,
      P_PASSWORD_EXPIRE_DAYS       out number,
      P_PASSWORD_MAX_ATTEMPTS      out number,
      P_LOGIN_MESSAGE              out varchar2,
      P_LOGIN_MSG_START_DATE_TIME  out timestamp,
      P_LOGIN_MSG_END_DATE_TIME    out timestamp
   ) is 
 
      ignore varchar2(32676);
   begin
 
      PROC_GET_DISTRICT_DIM (
         P_DISTRICT_SID,
         P_DISTRICT_ID,
         P_DISTRICT_NAME,
         P_ADDRESS,
         P_ADDRESS_LINE_2,
         P_CITY,
         P_STATE_CODE,
         P_POSTAL_CODE,
         P_COUNTY,
         P_LAST_UPDATE,
         P_REGION_NAME,
         P_PHONE_NUMBER,
         P_FAX_NUMBER,
         P_EMAIL_ADDRESS,
         P_WEB_SITE,
         P_PASSWORD_EXPIRE_DAYS,
         P_PASSWORD_MAX_ATTEMPTS,
         P_LOGIN_MESSAGE,
         P_LOGIN_MSG_START_DATE_TIME,
         P_LOGIN_MSG_END_DATE_TIME,
         ignore
      );
 
   end PROC_GET_DISTRICT_DIM;
--------------------------------------------------------------
-- get procedure for table "DISTRICT_DIM
   procedure PROC_GET_DISTRICT_DIM (
      P_DISTRICT_SID               out number,
      P_DISTRICT_ID                out varchar2,
      P_DISTRICT_NAME              out varchar2,
      P_ADDRESS                    out varchar2,
      P_ADDRESS_LINE_2             out varchar2,
      P_CITY                       out varchar2,
      P_STATE_CODE                 out varchar2,
      P_POSTAL_CODE                out varchar2,
      P_COUNTY                     out varchar2,
      P_LAST_UPDATE                out timestamp,
      P_REGION_NAME                out varchar2,
      P_PHONE_NUMBER               out varchar2,
      P_FAX_NUMBER                 out varchar2,
      P_EMAIL_ADDRESS              out varchar2,
      P_WEB_SITE                   out varchar2,
      P_PASSWORD_EXPIRE_DAYS       out number,
      P_PASSWORD_MAX_ATTEMPTS      out number,
      P_LOGIN_MESSAGE              out varchar2,
      P_LOGIN_MSG_START_DATE_TIME  out timestamp,
      P_LOGIN_MSG_END_DATE_TIME    out timestamp,
      P_MD5                        out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select * from DISTRICT_DIM 
         where DISTRICT_SID = (select min(DISTRICT_SID) from DISTRICT_DIM  
                                where DISTRICT_SID != -1)
      ) loop
         P_DISTRICT_SID               := c1.DISTRICT_SID;
         P_DISTRICT_ID                := c1.DISTRICT_ID;
         P_DISTRICT_NAME              := c1.DISTRICT_NAME;
         P_ADDRESS                    := c1.ADDRESS;
         P_ADDRESS_LINE_2             := c1.ADDRESS_LINE_2;
         P_CITY                       := c1.CITY;
         P_STATE_CODE                 := c1.STATE_CODE;
         P_POSTAL_CODE                := c1.POSTAL_CODE;
         P_COUNTY                     := c1.COUNTY;
         P_LAST_UPDATE                := c1.LAST_UPDATE;
         P_REGION_NAME                := c1.REGION_NAME;
         P_PHONE_NUMBER               := c1.PHONE_NUMBER;
         P_FAX_NUMBER                 := c1.FAX_NUMBER;
         P_EMAIL_ADDRESS              := c1.EMAIL_ADDRESS;
         P_WEB_SITE                   := c1.WEB_SITE;
         P_PASSWORD_EXPIRE_DAYS       := c1.PASSWORD_EXPIRE_DAYS;
         P_PASSWORD_MAX_ATTEMPTS      := c1.PASSWORD_MAX_ATTEMPTS;
         P_LOGIN_MESSAGE              := c1.LOGIN_MESSAGE;
         P_LOGIN_MSG_START_DATE_TIME  := c1.LOGIN_MESSAGE_START_DATE_TIME;
         P_LOGIN_MSG_END_DATE_TIME    := c1.LOGIN_MESSAGE_END_DATE_TIME;
 
         P_MD5 := FN_BUILD_DISTRICT_DIM_MD5(
            c1.DISTRICT_SID,
            c1.DISTRICT_ID,
            c1.DISTRICT_AREA,
            c1.DISTRICT_NAME,
            c1.ADDRESS,
            c1.ADDRESS_LINE_2,
            c1.CITY,
            c1.STATE_CODE,
            c1.POSTAL_CODE,
            c1.COUNTY,
            c1.DISTRICT_KEY,
            c1.LAST_UPDATE,
            c1.REGION_NAME,
            c1.PHONE_NUMBER,
            c1.FAX_NUMBER,
            c1.EMAIL_ADDRESS,
            c1.WEB_SITE,
            c1.PASSWORD_EXPIRE_DAYS,
            c1.PASSWORD_MAX_ATTEMPTS,
            c1.PASSWORD_EXPIRE_MONTH,
            c1.PASSWORD_EXPIRE_DAY,
            c1.PASSWORD_EXPIRATION_METHOD,
            c1.DISTRICT_SECURITY_QUESTION,
            c1.DISTRICT_SECURITY_ANSWER,
            c1.DISTRICT_IP_RANGE,
            c1.LOGIN_MESSAGE,
            c1.LOGIN_MESSAGE_START_DATE_TIME,
            c1.LOGIN_MESSAGE_END_DATE_TIME
         );
      end loop;
 
   end PROC_GET_DISTRICT_DIM;
--------------------------------------------------------------
-- build MD5 function for table "DISTRICT_DIM
   function FN_BUILD_DISTRICT_DIM_MD5 (
      P_DISTRICT_SID               in number,
      P_DISTRICT_ID                in varchar2,
      P_DISTRICT_AREA              in varchar2  default null,
      P_DISTRICT_NAME              in varchar2  default null,
      P_ADDRESS                    in varchar2  default null,
      P_ADDRESS_LINE_2             in varchar2  default null,
      P_CITY                       in varchar2  default null,
      P_STATE_CODE                 in varchar2  default null,
      P_POSTAL_CODE                in varchar2  default null,
      P_COUNTY                     in varchar2  default null,
      P_DISTRICT_KEY               in varchar2  default null,
      P_LAST_UPDATE                in timestamp  default null,
      P_REGION_NAME                in varchar2  default null,
      P_PHONE_NUMBER               in varchar2  default null,
      P_FAX_NUMBER                 in varchar2  default null,
      P_EMAIL_ADDRESS              in varchar2  default null,
      P_WEB_SITE                   in varchar2  default null,
      P_PASSWORD_EXPIRE_DAYS       in number    default null,
      P_PASSWORD_MAX_ATTEMPTS      in number    default null,
      P_PASSWORD_EXPIRE_MONTH      in number    default null,
      P_PASSWORD_EXPIRE_DAY        in number    default null,
      P_PASSWORD_EXPIRATION_METHOD in varchar2  default null,
      P_DISTRICT_SECURITY_QUESTION in varchar2  default null,
      P_DISTRICT_SECURITY_ANSWER   in varchar2  default null,
      P_DISTRICT_IP_RANGE          in varchar2  default null,
      P_LOGIN_MESSAGE              in varchar2  default null,
      P_LOGIN_MSG_START_DATE_TIME  in timestamp default null,
      P_LOGIN_MSG_END_DATE_TIME    in timestamp default null,
      P_COL_SEP                    in varchar2  default '|'
   ) return varchar2 is 
 
   begin
 
      return sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string=> 
         P_DISTRICT_SID               ||P_COL_SEP||
         P_DISTRICT_ID                ||P_COL_SEP||
         P_DISTRICT_AREA              ||P_COL_SEP||
         P_DISTRICT_NAME              ||P_COL_SEP||
         P_ADDRESS                    ||P_COL_SEP||
         P_ADDRESS_LINE_2             ||P_COL_SEP||
         P_CITY                       ||P_COL_SEP||
         P_STATE_CODE                 ||P_COL_SEP||
         P_POSTAL_CODE                ||P_COL_SEP||
         P_COUNTY                     ||P_COL_SEP||
         P_DISTRICT_KEY               ||P_COL_SEP||
         P_LAST_UPDATE                ||P_COL_SEP||
         P_REGION_NAME                ||P_COL_SEP||
         P_PHONE_NUMBER               ||P_COL_SEP||
         P_FAX_NUMBER                 ||P_COL_SEP||
         P_EMAIL_ADDRESS              ||P_COL_SEP||
         P_WEB_SITE                   ||P_COL_SEP||
         P_PASSWORD_EXPIRE_DAYS       ||P_COL_SEP||
         P_PASSWORD_MAX_ATTEMPTS      ||P_COL_SEP||
         P_PASSWORD_EXPIRE_MONTH      ||P_COL_SEP||
         P_PASSWORD_EXPIRE_DAY        ||P_COL_SEP||
         P_PASSWORD_EXPIRATION_METHOD ||P_COL_SEP||
         P_DISTRICT_SECURITY_QUESTION ||P_COL_SEP||
         P_DISTRICT_SECURITY_ANSWER   ||P_COL_SEP||
         P_DISTRICT_IP_RANGE          ||P_COL_SEP||
         P_LOGIN_MESSAGE              ||P_COL_SEP||
         P_LOGIN_MSG_START_DATE_TIME  ||P_COL_SEP||
         P_LOGIN_MSG_END_DATE_TIME    ||P_COL_SEP||
         ''
      ));
 
   end FN_BUILD_DISTRICT_DIM_MD5;
--------------------------------------------------------------
-- Retrieves the District Name for display on the Login page.
--------------------------------------------------------------
   procedure PROC_DISTRICT_NAME is
     V_NAME varchar2(75);
     V_END  varchar2(4);
   begin
     select trim(DISTRICT_NAME)
       into V_NAME
       from DISTRICT_DIM
      where DISTRICT_SID <> -1
        and ROWNUM = 1
      order by DISTRICT_SID desc;
     V_END  := UPPER(SUBSTR(V_NAME, -4, 4));
     V_NAME := INITCAP(LOWER(V_NAME));
     if V_END = 'CISD'
        or V_END = ' ISD' then
       V_NAME := SUBSTR(V_NAME, 1, LENGTH(V_NAME) - 4) || V_END;
     end if;
   
     --dbms_output.put_line(v_name);
     HTP.PRN('<span style=color:black;font-size:175%;>' || V_NAME || '</span>');
     
   end PROC_DISTRICT_NAME;
   
end PKG_IDMGR_DISTRICT;
/

prompt
prompt Creating package body PKG_IDMGR_USER_ACCOUNT
prompt ============================================
prompt
create or replace package body timsrptdata.PKG_IDMGR_USER_ACCOUNT is
--------------------------------------------------------------
-- build MD5 function for table "USER_ACCOUNT
--------------------------------------------------------------
   function FN_BUILD_USER_ACCOUNT_MD5 (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_PASSWORD                 in varchar2,
      P_PASSWORD_EXPIRATION_DATE in date      default null,
      P_PASSWORD_UPDATE_DATE     in date      default null,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_CREATED_BY               in number    default null,
      P_CREATE_DATE              in date      default null,
      P_UPDATED_BY               in number    default null,
      P_UPDATE_DATE              in date      default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_LAST_LOGIN_DATE          in date      default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_ATTEMPT_CTR              in number    default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2,
      P_REVEAL_CONTROL_PANEL     in varchar2,
      P_COL_SEP                  in varchar2  default '|'
   ) return varchar2 is 
 
   begin
 
      return sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string=> 
         P_USER_SID                 ||P_COL_SEP||
         P_DISTRICT_SID             ||P_COL_SEP||
         P_USER_ID                  ||P_COL_SEP||
         P_PASSWORD                 ||P_COL_SEP||
         P_PASSWORD_EXPIRATION_DATE ||P_COL_SEP||
         P_PASSWORD_UPDATE_DATE     ||P_COL_SEP||
         P_USER_FIRST_NAME          ||P_COL_SEP||
         P_USER_LAST_NAME           ||P_COL_SEP||
         P_EMAIL_ADDRESS            ||P_COL_SEP||
         P_CREATED_BY               ||P_COL_SEP||
         P_CREATE_DATE              ||P_COL_SEP||
         P_UPDATED_BY               ||P_COL_SEP||
         P_UPDATE_DATE              ||P_COL_SEP||
         P_ACCOUNT_LOCKED           ||P_COL_SEP||
         P_EMPLOYEE_ID              ||P_COL_SEP||
         P_ACTIVE_ACCOUNT_FLAG      ||P_COL_SEP||
         P_LAST_LOGIN_DATE          ||P_COL_SEP||
         P_FIRST_LOGIN_FLAG         ||P_COL_SEP||
         P_ATTEMPT_CTR              ||P_COL_SEP||
         P_STUDENT_SSN_AUTH         ||P_COL_SEP||
         P_STAFF_SSN_AUTH           ||P_COL_SEP||
         P_ECON_DISADV_AUTH         ||P_COL_SEP||
         P_USER_SOURCE              ||P_COL_SEP||
         P_SUPER_USER               ||P_COL_SEP||
         P_REVEAL_CONTROL_PANEL     ||P_COL_SEP||
         ''
      ));
 
   end FN_BUILD_USER_ACCOUNT_MD5;
--------------------------------------------------------------
-- FUNCTION: FN_GENERATE_PASSWORD
-- Purpose: Generates a 12 character strong password with
--          upper and lowercase alpha letters, 1 to 2 numbers,
--          and 1 special character
-- 07-10-13 CB orininal creation
--------------------------------------------------------------
  function FN_GENERATE_PASSWORD
    return varchar2 is
    v_num VARCHAR2(60) := '23456789';
    v_spc VARCHAR2(60) := '!$%&?+*#-@:<>()_';
    v_pwd VARCHAR2(30);
    v_pull_pos int;
    v_put_pos int;
    v_error boolean := true;
    BEGIN
      while v_error -- loop through the passwords until a valid one is generated --
      loop
        v_pwd := DBMS_RANDOM.STRING('A',12);
        FOR x IN 1..trunc(DBMS_RANDOM.value(low => 1, high => 3)) LOOP
          v_put_pos := trunc(DBMS_RANDOM.value(low => 2, high => 12));
          v_pull_pos := trunc(DBMS_RANDOM.value(low => 1, high => 9));
          v_pwd := substr(v_pwd,1,v_put_pos-1)||substr(v_num,v_pull_pos,1)||substr(v_pwd,v_put_pos+1);
        END LOOP;
        FOR x IN 1..trunc(DBMS_RANDOM.value(low => 1, high => 2)) LOOP
          v_put_pos := trunc(DBMS_RANDOM.value(low => 2, high => 12));
          v_pull_pos := trunc(DBMS_RANDOM.value(low => 1, high => 17));
          v_pwd := substr(v_pwd,1,v_put_pos-1)||substr(v_spc,v_pull_pos,1)||substr(v_pwd,v_put_pos+1);
        END LOOP;
        -- Check if password is in a valid format --
        -- Password must be min 12 characters  --
        -- with at least 1 upper case, 1 lower case, 1 number, and 1 special character !$%&?+*#-@:<>()_ --
          case
            when length(v_pwd) <= 11 then v_error := true;
            when not regexp_like(v_pwd,'[abcdefghijklmnopqrstuvwxyz]+') then v_error := true;
            when not regexp_like(v_pwd,'[ABCDEFGHIJKLMNOPQRSTUVWXYZ]+') then v_error := true;
            when not regexp_like(v_pwd,'[0123456789]+') then v_error := true;
            when not regexp_like(v_pwd,'[!$%&?+*#-@:<>()_]+') then v_error := true;
            else v_error := false;
          end case;
      end loop;        
      return v_pwd;
  END FN_GENERATE_PASSWORD;
--------------------------------------------------------------
-- FUNCTION: FN_GET_USR_DEFAULT_APPLICATION
-- Purpose: Retrieves the application alias for the users default
--          application.  Used to build url.
-- 08-22-13 CB orininal creation
--------------------------------------------------------------
  function FN_GET_USR_DEFAULT_APPLICATION (
      P_USER_SID IN number
    ) return varchar2 is
    
    v_application_alias     APPLICATION.APPLICATION_ALIAS%TYPE;

    Begin
    -- get the application list for this user
    begin
        SELECT
          application.application_alias
        into v_application_alias
        FROM user_account
        join user_role on user_role.user_sid = user_account.user_sid
        join application_role on application_role.application_role_sid = user_role.application_role_sid
        join application on application.application_id  = application_role.application_id
        WHERE
          user_account.user_sid = P_USER_SID
          and user_role.default_application_flag = 'Y'; 
        Exception
          when no_data_found then
             SELECT
                application.application_alias
              into v_application_alias
              FROM user_account
              join user_role on user_role.user_sid = user_account.user_sid
              join application_role on application_role.application_role_sid = user_role.application_role_sid
              join application on application.application_id  = application_role.application_id
              WHERE user_account.user_sid = P_USER_SID
                and rownum = 1;
    End;
    -- return the users default application --  
    return v_application_alias;
    
  End FN_GET_USR_DEFAULT_APPLICATION;
--------------------------------------------------------------
-- create procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_INS_USER_ACCOUNT (
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_SUPER_USER               in varchar2  default 'N',
      P_REVEAL_CONTROL_PANEL     in varchar2  default 'N'
   ) is 
   
   v_district_sid              NUMBER;
   V_USER_SID                  NUMBER;  -- created/updated by user --
   V_NEW_USER_SID              NUMBER;  -- SID OF THE NEWLY CREATED USER --
   v_password_expire_days      NUMBER;
   V_TEMP_PASSWORD             VARCHAR2 (20);
   L_EMAIL_TO                  VARCHAR2 (90);
   L_EMAIL_FROM                VARCHAR2 (90);
   L_EMAIL_SUBJECT             VARCHAR2 (90);
   L_EMAIL_APPLICATION_LINK    VARCHAR2 (400);
   L_EMAIL_SALUTATION          VARCHAR2 (400);
   L_BODY                      CLOB;
   L_BODY_HTML                 CLOB;
   
   begin
      -- get the district sid --
      -- the min() function is because in DEV we have 2 districts loaded into
      -- the district_dim.
      select min(district_sid)
      into v_district_sid
      from district_dim;
      
      -- get the password expiration days --
      select password_expire_days
      into v_password_expire_days
      from district_dim
      where district_sid = v_district_sid;
      
      -- RETRIEVE THE CONTEXT USER AS THE CREATE/UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'); 
      
      -- GET TEMPORARY PASSWORD --
      V_TEMP_PASSWORD := FN_GENERATE_PASSWORD;
      
      -- GET THE SID FOR THE NEW USER --
      V_NEW_USER_SID := SID_SEQUENCE.NEXTVAL;
      
      insert into USER_ACCOUNT (
         USER_SID,
         DISTRICT_SID,
         USER_ID,
         PASSWORD,
         PASSWORD_EXPIRATION_DATE,
         PASSWORD_UPDATE_DATE,
         USER_FIRST_NAME,
         USER_LAST_NAME,
         EMAIL_ADDRESS,
         CREATED_BY,
         CREATE_DATE,
         UPDATED_BY,
         UPDATE_DATE,
         ACCOUNT_LOCKED,
         EMPLOYEE_ID,
         ACTIVE_ACCOUNT_FLAG,
         LAST_LOGIN_DATE,
         FIRST_LOGIN_FLAG,
         ATTEMPT_CTR,
         STUDENT_SSN_AUTH,
         STAFF_SSN_AUTH,
         ECON_DISADV_AUTH,
         USER_SOURCE,
         SUPER_USER,
         REVEAL_CONTROL_PANEL
      ) values ( 
         V_NEW_USER_SID,
         v_district_sid,
         UPPER(P_USER_ID),
         pkg_sv_security.fn_get_hash(p_username => P_USER_ID,
                                     p_password => V_TEMP_PASSWORD),
         SYSDATE + v_password_expire_days,
         SYSDATE,
         P_USER_FIRST_NAME,
         P_USER_LAST_NAME,
         P_EMAIL_ADDRESS,
         V_USER_SID,
         SYSDATE,
         V_USER_SID,
         SYSDATE,
         'Y',
         P_EMPLOYEE_ID,
         'Y',
         NULL,
         'Y',
         0,
         P_STUDENT_SSN_AUTH,
         P_STAFF_SSN_AUTH,
         P_ECON_DISADV_AUTH,
         'REVEAL',
         P_SUPER_USER,
         P_REVEAL_CONTROL_PANEL
      );
      
      commit;
      
      -- THE NEW USER SID IN SESSION STATE --
      APEX_UTIL.set_session_state('P6_USER_SID',V_NEW_USER_SID);
      
      -- GET THE EMAIL AND BUILD IT --
      SELECT  EMAIL_SUBJECT, EMAIL_BODY, APPLICATION_LINK,SALUTATION
       INTO  L_EMAIL_SUBJECT, L_BODY_HTML, L_EMAIL_APPLICATION_LINK,L_EMAIL_SALUTATION
       FROM  EMAIL_SPECIFICATION
       WHERE EMAIL_TYPE_SID = 1;

     L_BODY_HTML := L_BODY_HTML || V_TEMP_PASSWORD || L_EMAIL_APPLICATION_LINK || L_EMAIL_SALUTATION;
     L_BODY_HTML := replace(L_BODY_HTML,'******',UPPER(P_USER_ID));
     L_BODY  := 'To view the content of this message, please use an HTML enabled mail client.'||UTL_TCP.CRLF;

     L_EMAIL_TO := P_EMAIL_ADDRESS;
     L_EMAIL_FROM := 'reveal@region10.org';

     /*
     SEND THE EMAIL
     */
     APEX_MAIL.SEND(
      P_TO        => L_EMAIL_TO,
      P_FROM      => L_EMAIL_FROM,
      P_BODY      => L_BODY,
      P_BODY_HTML => L_BODY_HTML,
      P_SUBJ      => L_EMAIL_SUBJECT   );

    PKG_SV_ACCT_MGMT.PROC_PUSH_EMAIL_QUEUE;
    -- log the update to the user --
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
        p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
        p_log_message => 'Inserted User having ID: '||P_USER_ID,
        p_action_type => 'Insert User',
        p_action_result => 'Successful',
        p_attempts => 1,
        p_user_ip_address => null,
        p_browser => null);
              
   end PROC_INS_USER_ACCOUNT;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT (
      P_USER_SID in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2  default 'N',
      P_REVEAL_CONTROL_PANEL     in varchar2  default 'N',
      P_MD5                      in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
      V_USER_SID number;  -- updated by user --
      V_UPDATED_USER_ID VARCHAR2(100); -- id of the user being updated --
      V_ATTEMPT_CTR NUMBER := 0; -- in case the number of attempts needs to be reset --
 
   begin
      -- RETRIEVE THE CONTEXT USER AS THE UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'); 
 
      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT 
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.PASSWORD,
               c1.PASSWORD_EXPIRATION_DATE,
               c1.PASSWORD_UPDATE_DATE,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.EMPLOYEE_ID,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.STUDENT_SSN_AUTH,
               c1.STAFF_SSN_AUTH,
               c1.ECON_DISADV_AUTH,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.REVEAL_CONTROL_PANEL
            );
            
            V_UPDATED_USER_ID := c1.USER_ID;
            
            if c1.ACCOUNT_LOCKED <> P_ACCOUNT_LOCKED 
               AND P_ACCOUNT_LOCKED = 'N' THEN
               V_ATTEMPT_CTR     := 0;
            else
               V_ATTEMPT_CTR     := c1.ATTEMPT_CTR;
            end if;
            
         end loop;
 
      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_ACCOUNT set
            USER_FIRST_NAME            = P_USER_FIRST_NAME,
            USER_LAST_NAME             = P_USER_LAST_NAME,
            EMAIL_ADDRESS              = P_EMAIL_ADDRESS,
            UPDATED_BY                 = V_USER_SID,
            UPDATE_DATE                = SYSDATE,
            ACCOUNT_LOCKED             = P_ACCOUNT_LOCKED,
            EMPLOYEE_ID                = P_EMPLOYEE_ID,
            ACTIVE_ACCOUNT_FLAG        = P_ACTIVE_ACCOUNT_FLAG,
            STUDENT_SSN_AUTH           = P_STUDENT_SSN_AUTH,
            STAFF_SSN_AUTH             = P_STAFF_SSN_AUTH,
            ECON_DISADV_AUTH           = P_ECON_DISADV_AUTH,
            USER_SOURCE                = P_USER_SOURCE,
            SUPER_USER                 = P_SUPER_USER,
            REVEAL_CONTROL_PANEL       = P_REVEAL_CONTROL_PANEL,
            ATTEMPT_CTR                = V_ATTEMPT_CTR
         where USER_SID = P_USER_SID;
         
         -- log the update to the user --
         pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
              p_log_message => 'Updated User having SID/ID: '||P_USER_SID||'/'||V_UPDATED_USER_ID,
              p_action_type => 'Updated User',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_USER_ACCOUNT;
--------------------------------------------------------------
-- update procedure for table PROC_UPD_MY_PROFILE
-- purpose: allows the user to update their own profile data
--------------------------------------------------------------
   procedure PROC_UPD_MY_PROFILE (
      P_USER_SID in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_MD5                      in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
      V_USER_SID number;  -- updated by user --
      V_UPDATED_USER_ID VARCHAR2(100); -- id of the user being updated --
 
   begin
      -- RETRIEVE THE CONTEXT USER AS THE UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'); 
 
      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT 
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.PASSWORD,
               c1.PASSWORD_EXPIRATION_DATE,
               c1.PASSWORD_UPDATE_DATE,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.EMPLOYEE_ID,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.STUDENT_SSN_AUTH,
               c1.STAFF_SSN_AUTH,
               c1.ECON_DISADV_AUTH,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.REVEAL_CONTROL_PANEL
            );
            
            V_UPDATED_USER_ID := c1.USER_ID;
            
         end loop;
 
      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_ACCOUNT set
            USER_FIRST_NAME            = P_USER_FIRST_NAME,
            USER_LAST_NAME             = P_USER_LAST_NAME,
            EMAIL_ADDRESS              = P_EMAIL_ADDRESS,
            UPDATED_BY                 = V_USER_SID,
            UPDATE_DATE                = SYSDATE,
            EMPLOYEE_ID                = P_EMPLOYEE_ID,
            FIRST_LOGIN_FLAG           = P_FIRST_LOGIN_FLAG
         where USER_SID = P_USER_SID;
         
         -- log the update to the user --
         pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
              p_log_message => 'User Updated their profile having SID/ID: '||P_USER_SID||'/'||V_UPDATED_USER_ID,
              p_action_type => 'Updated User Profile',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_MY_PROFILE;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE USER ACCOUNT DUE TO A MISSED LOGIN ATTEMPT
---------------------------------------------------------------
   procedure PROC_UPD_USER_MISSED_LOGIN (
      P_USER_ID                  in varchar2,
      P_ACCOUNT_LOCKED           in varchar2  default 'N'
   ) is 
   
   V_USER_SID NUMBER;
   
   begin
     select USER_ACCOUNT.USER_SID 
       into V_USER_SID 
       from USER_ACCOUNT 
      where UPPER(USER_ID) = UPPER(P_USER_ID);
       
     update USER_ACCOUNT set
        UPDATED_BY                 = V_USER_SID,
        UPDATE_DATE                = SYSDATE,
        ACCOUNT_LOCKED             = P_ACCOUNT_LOCKED,
        ATTEMPT_CTR                = ATTEMPT_CTR + 1
     where USER_SID = V_USER_SID;
 
   end PROC_UPD_USER_MISSED_LOGIN;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE last_login_date AND ATTEMPT_CTR FOR THE
--          USER THAT JUST LOGGED IN.
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_LOGIN_DT (
      P_USER_SID                 in number
   ) is 
 
   begin
 
     update USER_ACCOUNT set
         LAST_LOGIN_DATE    = sysdate,
         ATTEMPT_CTR        = 0
     where USER_SID = P_USER_SID;
 
   end PROC_UPD_USER_ACCOUNT_LOGIN_DT;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: Overloaded to allow update for USER_SOURCE
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_SRC (
      P_USER_SID                 in number,
      P_USER_SOURCE              in varchar2,
      P_MD5                      in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT 
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.PASSWORD,
               c1.PASSWORD_EXPIRATION_DATE,
               c1.PASSWORD_UPDATE_DATE,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.EMPLOYEE_ID,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.STUDENT_SSN_AUTH,
               c1.STAFF_SSN_AUTH,
               c1.ECON_DISADV_AUTH,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.REVEAL_CONTROL_PANEL
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_ACCOUNT set
             USER_SOURCE            = P_USER_SOURCE
         where USER_SID = P_USER_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_USER_ACCOUNT_SRC;
--------------------------------------------------------------
-- delete procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_DEL_USER_ACCOUNT (
      P_USER_SID in number
   ) is 
 
   v_user_id varchar2(50); -- ID of the user being deleted --
   v_user_sid number;  -- sid of the user performing the delete --
   
   begin
     -- RETRIEVE THE CONTEXT USER FOR LOGGING --
      select USER_ACCOUNT.USER_SID
      into v_user_sid
      from USER_ACCOUNT
      where USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'); 
      -- RETRIEVE THE ID OF THE USER TO DELETE --
      select user_account.user_id
      into v_user_id
      from user_account
      where user_account.user_sid = P_USER_SID;
      
      delete from user_report
      where user_report.user_sid = P_USER_SID;
      
      delete from user_report_category
      where user_report_category.user_sid = P_USER_SID;
      
      delete from user_role
      where user_role.user_sid = P_USER_SID;
      
      delete from user_security_question
      where user_security_question.user_sid = P_USER_SID;
      
      delete from user_campus
      where user_campus.user_sid = P_USER_SID;
      
      -- For DWS-exclusive tables:
      -- Catch and re-raise only exceptions that do not relate to 'table or view does not exist'
     
      begin
        execute immediate 'delete txstu_user_student_security
                           where txstu_user_student_security.user_id = '''||v_user_id||'''';
                       
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end;    
         
      begin
        execute immediate 'delete user_student_security
                           where user_student_security.user_id = '''||v_user_id||'''';
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end;                       
      
      begin
        execute immediate 'delete dws_intervention_note
                           where dws_intervention_note.user_sid = '||P_USER_SID;
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end;    
      
      begin
        execute immediate 'update dws_intervention
                           set dws_intervention.create_by_user_sid = NULL
                           where dws_intervention.create_by_user_sid = '||P_USER_SID;
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end; 
     
      begin
        execute immediate 'update dws_intervention
                           set dws_intervention.last_update_user_sid = NULL
                           where dws_intervention.last_update_user_sid = '||P_USER_SID;
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end; 
      
      begin
        execute immediate 'update dws_student_intervention
                           set dws_student_intervention.created_by_user_sid = 1
                           where dws_student_intervention.created_by_user_sid = '||P_USER_SID;
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end;
      
      begin
        execute immediate 'update dws_student_intervention
                           set dws_student_intervention.last_update_user_sid = 1
                           where dws_student_intervention.last_update_user_sid = '||P_USER_SID;
      exception
        when others then  
          if SQLCODE != -942 then  -- re-raise exception if not 'table or view does not exist'
            raise;
          end if;
      end;
   
      -- end of DWS-exclusive tables  
      
      UPDATE student_dim
         SET student_dim.user_sid = null
       WHERE student_dim.user_sid = P_USER_SID;
      
      delete from user_account
      where user_account.user_sid = P_USER_SID; 
      
      COMMIT;
      -- log the deletion of the user --
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
              p_log_message => 'Deleted User having SID/ID: '||P_USER_SID||'/'||v_user_id,
              p_action_type => 'Delete User',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
 
   end PROC_DEL_USER_ACCOUNT;
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_PASSWORD_EXPIRATION_DATE out date,
      P_PASSWORD_UPDATE_DATE     out timestamp,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_EMPLOYEE_ID              out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_STUDENT_SSN_AUTH         out varchar2,
      P_STAFF_SSN_AUTH           out varchar2,
      P_ECON_DISADV_AUTH         out varchar2,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_REVEAL_CONTROL_PANEL     out varchar2
   ) is 
 
      ignore varchar2(32676);
   begin
 
      PROC_GET_USER_ACCOUNT (
         P_USER_SID                   => P_USER_SID,
         P_DISTRICT_SID               => P_DISTRICT_SID,
         P_USER_ID                   	=> P_USER_ID,
         P_PASSWORD_EXPIRATION_DATE   => P_PASSWORD_EXPIRATION_DATE,
         P_PASSWORD_UPDATE_DATE       => P_PASSWORD_UPDATE_DATE,
         P_USER_FIRST_NAME            => P_USER_FIRST_NAME,
         P_USER_LAST_NAME             => P_USER_LAST_NAME,
         P_EMAIL_ADDRESS              => P_EMAIL_ADDRESS,
         P_CREATED_BY                 => P_CREATED_BY,
         P_CREATE_DATE                => P_CREATE_DATE,
         P_UPDATED_BY                 => P_UPDATED_BY,
         P_UPDATE_DATE                => P_UPDATE_DATE,
         P_ACCOUNT_LOCKED             => P_ACCOUNT_LOCKED,
         P_EMPLOYEE_ID                => P_EMPLOYEE_ID,
         P_ACTIVE_ACCOUNT_FLAG        => P_ACTIVE_ACCOUNT_FLAG,
         P_LAST_LOGIN_DATE            => P_LAST_LOGIN_DATE,
         P_FIRST_LOGIN_FLAG           => P_FIRST_LOGIN_FLAG,
         P_ATTEMPT_CTR                => P_ATTEMPT_CTR,
         P_STUDENT_SSN_AUTH           => P_STUDENT_SSN_AUTH,
         P_STAFF_SSN_AUTH             => P_STAFF_SSN_AUTH,
         P_ECON_DISADV_AUTH           => P_ECON_DISADV_AUTH,
         P_USER_SOURCE                => P_USER_SOURCE,
         P_SUPER_USER                 => P_SUPER_USER,
         P_REVEAL_CONTROL_PANEL       => P_REVEAL_CONTROL_PANEL,
         P_MD5                        => ignore
      );
 
   end PROC_GET_USER_ACCOUNT;
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_PASSWORD_EXPIRATION_DATE out date,
      P_PASSWORD_UPDATE_DATE     out timestamp,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_EMPLOYEE_ID              out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_STUDENT_SSN_AUTH         out varchar2,
      P_STAFF_SSN_AUTH           out varchar2,
      P_ECON_DISADV_AUTH         out varchar2,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_REVEAL_CONTROL_PANEL     out varchar2,
      P_MD5                      out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select USER_ACCOUNT.* 
               ,CREATE_USER_ACCT.USER_ID AS CREATE_USER_ID
               ,UPDATE_USER_ACCT.USER_ID AS UPDATE_USER_ID
            from USER_ACCOUNT 
            join USER_ACCOUNT CREATE_USER_ACCT ON CREATE_USER_ACCT.USER_SID = USER_ACCOUNT.CREATED_BY
            join USER_ACCOUNT UPDATE_USER_ACCT ON UPDATE_USER_ACCT.USER_SID = USER_ACCOUNT.UPDATED_BY
            where USER_ACCOUNT.USER_SID = P_USER_SID 
      ) loop
         P_DISTRICT_SID             := c1.DISTRICT_SID;
         P_USER_ID                  := c1.USER_ID;
         P_PASSWORD_EXPIRATION_DATE := c1.PASSWORD_EXPIRATION_DATE;
         P_PASSWORD_UPDATE_DATE     := c1.PASSWORD_UPDATE_DATE;
         P_USER_FIRST_NAME          := c1.USER_FIRST_NAME;
         P_USER_LAST_NAME           := c1.USER_LAST_NAME;
         P_EMAIL_ADDRESS            := c1.EMAIL_ADDRESS;
         P_CREATED_BY               := c1.CREATE_USER_ID;
         P_CREATE_DATE              := c1.CREATE_DATE;
         P_UPDATED_BY               := c1.UPDATE_USER_ID;
         P_UPDATE_DATE              := c1.UPDATE_DATE;
         P_ACCOUNT_LOCKED           := c1.ACCOUNT_LOCKED;
         P_EMPLOYEE_ID              := c1.EMPLOYEE_ID;
         P_ACTIVE_ACCOUNT_FLAG      := c1.ACTIVE_ACCOUNT_FLAG;
         P_LAST_LOGIN_DATE          := c1.LAST_LOGIN_DATE;
         P_FIRST_LOGIN_FLAG         := c1.FIRST_LOGIN_FLAG;
         P_ATTEMPT_CTR              := c1.ATTEMPT_CTR;
         P_STUDENT_SSN_AUTH         := c1.STUDENT_SSN_AUTH;
         P_STAFF_SSN_AUTH           := c1.STAFF_SSN_AUTH;
         P_ECON_DISADV_AUTH         := c1.ECON_DISADV_AUTH;
         P_USER_SOURCE              := c1.USER_SOURCE;
         P_SUPER_USER               := c1.SUPER_USER;
         P_REVEAL_CONTROL_PANEL     := c1.REVEAL_CONTROL_PANEL;
 
         P_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
            P_USER_SID,
            c1.DISTRICT_SID,
            c1.USER_ID,
            c1.PASSWORD,
            c1.PASSWORD_EXPIRATION_DATE,
            c1.PASSWORD_UPDATE_DATE,
            c1.USER_FIRST_NAME,
            c1.USER_LAST_NAME,
            c1.EMAIL_ADDRESS,
            c1.CREATED_BY,
            c1.CREATE_DATE,
            c1.UPDATED_BY,
            c1.UPDATE_DATE,
            c1.ACCOUNT_LOCKED,
            c1.EMPLOYEE_ID,
            c1.ACTIVE_ACCOUNT_FLAG,
            c1.LAST_LOGIN_DATE,
            c1.FIRST_LOGIN_FLAG,
            c1.ATTEMPT_CTR,
            c1.STUDENT_SSN_AUTH,
            c1.STAFF_SSN_AUTH,
            c1.ECON_DISADV_AUTH,
            c1.USER_SOURCE,
            c1.SUPER_USER,
            c1.REVEAL_CONTROL_PANEL,
            '|'
         );
      end loop;
 
   end PROC_GET_USER_ACCOUNT;

/************************************************
Procedure Name: PROC_IMPORT_TXEIS_USER_STEP1
       Purpose: Takes a delimited list of TxEIS users from a shuttle
                component and inserts them into the user_account table.
Revisions:
---------
07/02/13  CB  Original Creation
**************************************************/
/*PROCEDURE PROC_IMPORT_TXEIS_USER_STEP1
          ( P_USER_ID_LIST IN varchar2 )
IS
v_district_sid             number;
v_selected                 apex_application_global.vc_arr2; 
TYPE t_list_array          IS VARRAY(100) OF varchar2(100);     
v_user_tasks               t_list_array;
v_user_campuses            t_list_array;
v_user_sid                 number;
v_new_user_sid             number;
v_txeis_user_name          varchar2(50);
 
BEGIN
  -- convert the delimited list from a string into a table
  v_selected := APEX_UTIL.STRING_TO_TABLE(P_USER_ID_LIST);

  -- get the district sid --
  -- the min() function is because in DEV we have 2 districts loaded into
  -- the district_dim.
  select min(district_sid)
  into v_district_sid
  from district_dim
  where district_sid != -1;
  -- get the SID of the logged in user that is creating the new user --
  select user_account.user_sid
  into v_user_sid
  from user_account
  where user_account.user_id = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');
  -- loop through the selected user_id(s) to import
  FOR i IN 1..v_selected.count LOOP
   --- insert the selected users into the user_account TABLE 
   --- with an "I" in the FIRST_LOGIN_FLAG to indicate that
   --- this is user is in an import status.
   v_new_user_sid := sid_sequence.nextval;
   insert into user_account
     (user_sid,
      district_sid,
      user_id,
      password,
      password_expiration_date,
      password_update_date,
      user_first_name,
      user_last_name,
      email_address,
      created_by,
      create_date,
      updated_by,
      update_date,
      account_locked,
      employee_id,
      active_account_flag,
      last_login_date,
      first_login_flag,
      attempt_ctr,
      student_ssn_auth,
      staff_ssn_auth,
      econ_disadv_auth,
      user_source,
      reveal_control_panel)
    (select 
      v_new_user_sid,
      v_district_sid,
      usr_log_name,
      PKG_IDMGR_USER_ACCOUNT.FN_GENERATE_PASSWORD,
      sysdate,
      sysdate,
      usr_name_f,
      usr_name_l,
      null,
      v_user_sid,
      sysdate,
      v_user_sid,
      sysdate,
      'Y',
      emp_nbr,
      'Y',
      null,
      'I',
      0,
      'N',
      'N',
      'N',
      'TxEIS-SYNC',
      'N'
      from SEC_USERS
      where SEC_USERS.USR_ID = v_selected(i));
   -- import the TxEIS applications and assign the report categories --
   select distinct SEC_TASKS.TASK_NAME
     bulk collect into v_user_tasks
     from SEC_USERS
     join SEC_USER_ROLES on SEC_USER_ROLES.USR_ID = SEC_USERS.USR_ID
     join SEC_ROLES on SEC_ROLES.ROLE_ID = SEC_USER_ROLES.ROLE_ID
     join SEC_PERMISSIONS on SEC_PERMISSIONS.ROLE_ID = SEC_ROLES.ROLE_ID
     join SEC_TASKS on SEC_TASKS.TASK_ID = SEC_PERMISSIONS.TASK_ID
    where SEC_TASKS.TASK_TYP_ID = 1
      and SEC_TASKS.TASK_NAME <> 'Main Menu'
      and SEC_USERS.USR_ID = v_selected(i);
   if v_user_tasks.count > 0 then
     forall x in v_user_tasks.FIRST..v_user_tasks.LAST
       insert into USER_REPORT_CATEGORY
         (USER_REPORT_CATEGORY_SID
         ,USER_SID
         ,REPORT_CATEGORY_SID)
       values
         (sid_sequence.nextval
         ,v_new_user_sid
         ,(select REPORT_CATEGORY_SID
             from REPORT_CATEGORY
             join source on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
                        and SOURCE.SOURCE_NAME = 'TxEIS'
            where REPORT_CATEGORY.REPORT_CATEGORY = v_user_tasks(x)));
   end if;
   -- import the campuses for the user --
   select distinct CAMPUS_ID
     bulk collect into v_user_campuses
     from SEC_USERS
     join SEC_USER_ROLES on SEC_USER_ROLES.USR_ID = SEC_USERS.USR_ID
     join SEC_ROLES on SEC_ROLES.ROLE_ID = SEC_USER_ROLES.ROLE_ID
     join SEC_USER_ROLE_CAMPUSES on SEC_USER_ROLE_CAMPUSES.USR_ROLE_ID = SEC_USER_ROLES.USR_ROLE_ID
    where SEC_USERS.USR_ID = v_selected(i);
   if v_user_campuses.count > 0 then
     forall j in v_user_campuses.FIRST..v_user_campuses.LAST
       insert into USER_CAMPUS
         (USER_CAMPUS_SID
         ,USER_SID
         ,CAMPUS_MASTER_SID)
       values
         (sid_sequence.nextval
         ,v_new_user_sid
         ,(select CAMPUS_MASTER.CAMPUS_MASTER_SID
             from CAMPUS_MASTER
            where CAMPUS_MASTER.DISTRICT_SID = v_district_sid
              and CAMPUS_MASTER.SCHOOL_ID = v_user_campuses(j)));
     -- SET THE REVEAL USER ROLE TO CAMPUS_USER --
     insert into USER_ROLE
       (USER_ROLE_SID
       ,USER_SID
       ,APPLICATION_ROLE_SID
       ,DEFAULT_APPLICATION_FLAG)
     values
       (sid_sequence.nextval
       ,v_new_user_sid
       ,(select APPLICATION_ROLE.APPLICATION_ROLE_SID
           from APPLICATION_ROLE
           join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
           join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
          where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
            and ROLE_MASTER.ROLE = 'CAMPUS_USER')
       ,'Y');
   else
     -- USER HAS NO CAMPUSES SO SET THE USER ROLE TO DISTRICT USER --
     insert into USER_ROLE
       (USER_ROLE_SID
       ,USER_SID
       ,APPLICATION_ROLE_SID
       ,DEFAULT_APPLICATION_FLAG)
     values
       (sid_sequence.nextval
       ,v_new_user_sid
       ,(select APPLICATION_ROLE.APPLICATION_ROLE_SID
           from APPLICATION_ROLE
           join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
           join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
          where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
            and ROLE_MASTER.ROLE = 'DISTRICT_USER')
       ,'Y');
   end if;
   -- get the TxEIS user name for logging -- 
   select sec_users.usr_log_name
    into v_txeis_user_name
    from sec_users
      where sec_users.usr_id = v_selected(i);
   -- log the new user --
   pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
            p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
            p_log_message => 'Imported Provisional TxEIS User: '||v_txeis_user_name,
            p_action_type => 'Import Step 1',
            p_action_result => 'Successfully Imported Provisional TxEIS User',
            p_attempts => 1,
            p_user_ip_address => null,
            p_browser => null);
  END LOOP;

  commit; 

END  PROC_IMPORT_TXEIS_USER_STEP1;
/************************************************
Procedure Name: PROC_IMPORT_TXEIS_USER_STEP2
       Purpose: Takes an updated provisionally imported user
                from TxEIS and updates them in the user_account table.
                They are set as first time users.
Revisions:
---------
07/02/13  CB  Original Creation
**************************************************/
/*   procedure PROC_IMPORT_TXEIS_USER_STEP2 (
      P_USER_SID                 in number,
      P_USER_ID                  in varchar2,
      P_PASSWORD                 in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_EMPLOYEE_ID              in varchar2  default null,
      P_STUDENT_SSN_AUTH         in varchar2  default 'N',
      P_STAFF_SSN_AUTH           in varchar2  default 'N',
      P_ECON_DISADV_AUTH         in varchar2  default 'N',
      P_USER_SOURCE              in varchar2  default 'TxEIS-SYNC',
      P_MD5                      in varchar2  default null
   ) is 
 
      L_MD5                      varchar2(32767) := null;
      v_logmsg                   varchar2(2000);
      v_user_sid                 NUMBER;
      L_EMAIL_TO                 VARCHAR2 (90);
      L_EMAIL_FROM               VARCHAR2 (90);
      L_EMAIL_SUBJECT            VARCHAR2 (90);
      L_EMAIL_APPLICATION_LINK   VARCHAR2 (400);
      L_EMAIL_SALUTATION         VARCHAR2 (400);
      L_BODY                     CLOB;
      L_BODY_HTML                CLOB;
   begin
      -- RETRIEVE THE CONTEXT USER SID AS THE UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ID = SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');   
      
      -- GET THE HASH OF THE USER_ACCOUNT REC FROM THE DATABASE --                         
      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT 
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.PASSWORD,
               c1.PASSWORD_EXPIRATION_DATE,
               c1.PASSWORD_UPDATE_DATE,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.EMPLOYEE_ID,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.STUDENT_SSN_AUTH,
               c1.STAFF_SSN_AUTH,
               c1.ECON_DISADV_AUTH,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.REVEAL_CONTROL_PANEL,
               '|'
            );
 
         end loop;
 
      end if;
   
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_ACCOUNT set
            PASSWORD                   = pkg_sv_security.fn_get_hash(p_username => P_USER_ID,
                                         p_password => P_PASSWORD),
            PASSWORD_EXPIRATION_DATE   = SYSDATE,
            PASSWORD_UPDATE_DATE       = SYSDATE,
            USER_FIRST_NAME            = P_USER_FIRST_NAME,
            USER_LAST_NAME             = P_USER_LAST_NAME,
            EMAIL_ADDRESS              = P_EMAIL_ADDRESS,
            UPDATED_BY                 = V_USER_SID,
            UPDATE_DATE                = SYSDATE,
            ACCOUNT_LOCKED             = 'N',
            EMPLOYEE_ID                = P_EMPLOYEE_ID,
            ACTIVE_ACCOUNT_FLAG        = 'Y',
            FIRST_LOGIN_FLAG           = 'Y',
            STUDENT_SSN_AUTH           = P_STUDENT_SSN_AUTH,
            STAFF_SSN_AUTH             = P_STAFF_SSN_AUTH,
            ECON_DISADV_AUTH           = P_ECON_DISADV_AUTH,
            USER_SOURCE                = P_USER_SOURCE
         where USER_SID = P_USER_SID;
         commit;
         -- log the added user --
         v_logmsg := SYS_CONTEXT('REVEAL_CTX', 'USER_NAME')||' Added TxEIS user: '|| P_USER_ID ||' with SID: '||P_USER_SID;
         pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
                                        p_user_id => SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
                                        p_log_message => v_logmsg,
                                        p_action_type => 'Import Step2',
                                        p_action_result => 'Successfully Imported TxEIS User',
                                        p_attempts => 1,
                                        p_user_ip_address => null,
                                        p_browser => null);
         -- send email to the new user with password and link --
         SELECT  EMAIL_SUBJECT, EMAIL_BODY, APPLICATION_LINK,SALUTATION
         INTO  L_EMAIL_SUBJECT, L_BODY_HTML, L_EMAIL_APPLICATION_LINK,L_EMAIL_SALUTATION
         FROM  EMAIL_SPECIFICATION
         WHERE EMAIL_TYPE_SID = 1;

         L_BODY_HTML := L_BODY_HTML || P_PASSWORD || L_EMAIL_APPLICATION_LINK || L_EMAIL_SALUTATION;
         L_BODY_HTML := replace(L_BODY_HTML,'******',UPPER(P_USER_ID));
         L_BODY  := 'To view the content of this message, please use an HTML enabled mail client.'||UTL_TCP.CRLF;

         L_EMAIL_TO := P_EMAIL_ADDRESS;
         L_EMAIL_FROM := 'donotreply@region10.org';
         /*
         SEND THE EMAIL
         */
 /*        APEX_MAIL.SEND(
          P_TO        => L_EMAIL_TO,
          P_FROM      => L_EMAIL_FROM,
          P_BODY      => L_BODY,
          P_BODY_HTML => L_BODY_HTML,
          P_SUBJ      => L_EMAIL_SUBJECT   );
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_IMPORT_TXEIS_USER_STEP2;
*/
--------------------------------------------------------------
-- create procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_INS_USER_ROLE (
      P_USER_SID                 in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default 'N'
   ) is 
 
   begin
 
      insert into USER_ROLE (
         USER_ROLE_SID,
         USER_SID,
         APPLICATION_ROLE_SID,
         DEFAULT_APPLICATION_FLAG
      ) values ( 
         SID_SEQUENCE.NEXTVAL,
         P_USER_SID,
         P_APPLICATION_ROLE_SID,
         P_DEFAULT_APPLICATION_FLAG
      );
 
   end PROC_INS_USER_ROLE;
--------------------------------------------------------------
-- update procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_UPD_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default null,
      P_MD5                      in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from USER_ROLE 
            where USER_ROLE_SID = P_USER_ROLE_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BUILD_USER_ROLE_MD5(
               c1.USER_ROLE_SID,
               c1.USER_SID,
               c1.APPLICATION_ROLE_SID,
               c1.DEFAULT_APPLICATION_FLAG
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_ROLE set
            APPLICATION_ROLE_SID       = P_APPLICATION_ROLE_SID,
            DEFAULT_APPLICATION_FLAG   = P_DEFAULT_APPLICATION_FLAG
         where USER_ROLE_SID = P_USER_ROLE_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_USER_ROLE;
--------------------------------------------------------------
-- delete procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_DEL_USER_ROLE (
      P_USER_ROLE_SID in number
   ) is 
 
   begin
 
      delete from USER_ROLE 
      where USER_ROLE_SID = P_USER_ROLE_SID;
 
   end PROC_DEL_USER_ROLE;
--------------------------------------------------------------
-- get procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_GET_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_USER_SID                 out number,
      P_APPLICATION_ROLE_SID     out number,
      P_DEFAULT_APPLICATION_FLAG out varchar2
   ) is 
 
      ignore varchar2(32676);
   begin
 
      PROC_GET_USER_ROLE (
         P_USER_ROLE_SID,
         P_USER_SID,
         P_APPLICATION_ROLE_SID,
         P_DEFAULT_APPLICATION_FLAG,
         ignore
      );
 
   end PROC_GET_USER_ROLE;
--------------------------------------------------------------
-- get procedure for table "USER_ROLE
--------------------------------------------------------------
   procedure PROC_GET_USER_ROLE (
      P_USER_ROLE_SID in number,
      P_USER_SID                 out number,
      P_APPLICATION_ROLE_SID     out number,
      P_DEFAULT_APPLICATION_FLAG out varchar2,
      P_MD5                      out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select * from USER_ROLE 
         where USER_ROLE_SID = P_USER_ROLE_SID 
      ) loop
         P_USER_SID                 := c1.USER_SID;
         P_APPLICATION_ROLE_SID     := c1.APPLICATION_ROLE_SID;
         P_DEFAULT_APPLICATION_FLAG := c1.DEFAULT_APPLICATION_FLAG;
 
         P_MD5 := FN_BUILD_USER_ROLE_MD5(
            c1.USER_ROLE_SID,
            c1.USER_SID,
            c1.APPLICATION_ROLE_SID,
            c1.DEFAULT_APPLICATION_FLAG
         );
      end loop;
 
   end PROC_GET_USER_ROLE;
--------------------------------------------------------------
-- build MD5 function for table "USER_ROLE
--------------------------------------------------------------
   function FN_BUILD_USER_ROLE_MD5 (
      P_USER_ROLE_SID            in number,
      P_USER_SID                 in number,
      P_APPLICATION_ROLE_SID     in number,
      P_DEFAULT_APPLICATION_FLAG in varchar2  default null,
      P_COL_SEP                  in varchar2  default '|'
   ) return varchar2 is 
 
   begin
 
      return sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string=>
         P_USER_ROLE_SID            ||P_COL_SEP||
         P_USER_SID                 ||P_COL_SEP||
         P_APPLICATION_ROLE_SID     ||P_COL_SEP||
         P_DEFAULT_APPLICATION_FLAG ||P_COL_SEP||
         ''
      ));
 
   end FN_BUILD_USER_ROLE_MD5;
--------------------------------------------------------------
-- Procedure: PROCESS USER_REPORT_CATEGORY LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of 
--              REPORT_CATEGOY sids and a user_sid.  Since the 
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values. 
--------------------------------------------------------------
   procedure PROC_USER_RPT_CATEG_SHUTTLE(
      P_USER_SID in number,
      P_ORIG_RPT_CATEGORY_LIST in varchar2,
      P_NEW_RPT_CATEGORY_LIST in varchar2,
      P_USER_SOURCE IN varchar2
   ) is
   
     V_NEW_REPORT_CATEGORY_LIST  APEX_APPLICATION_GLOBAL.VC_ARR2;
     V_ORIG_REPORT_CATEGORY_LIST APEX_APPLICATION_GLOBAL.VC_ARR2;
     TYPE t_list_array           IS VARRAY(100) OF varchar2(100);
     V_TXEIS_RPT_CATEGORIES      t_list_array;
     b_match                     boolean := false;
     b_sync                      boolean := true;
   
   begin
     -- convert the delimited list from a string into a table
     V_NEW_REPORT_CATEGORY_LIST  := APEX_UTIL.STRING_TO_TABLE(P_NEW_RPT_CATEGORY_LIST);
     V_ORIG_REPORT_CATEGORY_LIST := APEX_UTIL.STRING_TO_TABLE(P_ORIG_RPT_CATEGORY_LIST);
     -- delete the current rows from USER_CAMPUS for the specified user 
     delete from USER_REPORT_CATEGORY where USER_REPORT_CATEGORY.USER_SID = P_USER_SID;
     -- insert the new user_campus rows --
     forall I in 1 .. V_NEW_REPORT_CATEGORY_LIST.COUNT
        insert into USER_REPORT_CATEGORY (
           USER_REPORT_CATEGORY_SID,
           USER_SID,
           REPORT_CATEGORY_SID
        ) values ( 
           SID_SEQUENCE.NEXTVAL,
           P_USER_SID,
           to_number(V_NEW_REPORT_CATEGORY_LIST(I))
        );
     commit;
     
    /* if P_USER_SOURCE = 'TxEIS-SYNC' then
     -- **************************************************************** --
     -- determine if the user changed any of the TxEIS report Categories --
     -- this will result in the loss of synchronization with TxEIS for   --
     -- this user.
     -- **************************************************************** --
     
       -- get a list of the TxEIS report categories --
       select REPORT_CATEGORY.REPORT_CATEGORY_SID bulk collect
         into V_TXEIS_RPT_CATEGORIES
         from SEC_TASKS
         join REPORT_CATEGORY on REPORT_CATEGORY.REPORT_CATEGORY = SEC_TASKS.TASK_NAME
         join source on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
                    and SOURCE.SOURCE_NAME = 'TxEIS'
        where SEC_TASKS.TASK_TYP_ID = 1
          and SEC_TASKS.TASK_NAME <> 'Main Menu';
        
        -- loop thru the list of categories that were originally loaded on the page --  
        for i in V_ORIG_REPORT_CATEGORY_LIST.first..V_ORIG_REPORT_CATEGORY_LIST.last
          loop
            -- verify that this category is a TxEIS category --
            -- we have a few categories which are unique to reveal that are not
            -- in txies that we should just ignore such as "dashboard".
            for j in V_TXEIS_RPT_CATEGORIES.first..V_TXEIS_RPT_CATEGORIES.last
              loop
                if V_ORIG_REPORT_CATEGORY_LIST(i) = V_TXEIS_RPT_CATEGORIES(j) then
                  -- since this is a TxEIS category, verify that it is still in the new list --
                  for k in V_NEW_REPORT_CATEGORY_LIST.first..V_NEW_REPORT_CATEGORY_LIST.last
                    loop
                      if V_ORIG_REPORT_CATEGORY_LIST(i) = V_NEW_REPORT_CATEGORY_LIST(k) then
                        b_match := true;
                        EXIT; -- A match was found so exit the loop
                      end if;
                    end loop; -- V_NEW_REPORT_CATEGORY_LIST
                  if b_match then
                    -- using b_match to exit out of this loop too --
                    -- reset b_match to try and match the next category --
                    b_match := false;
                    EXIT;
                  else
                    -- if we reach here, then we found a txeis category in our original list
                    -- that is not in the new list, we fell out the bottom of the loop without
                    -- a match.  
                    b_sync := false;
                  end if;  
                end if;
              end loop; -- V_TXEIS_RPT_CATEGORIES
          end loop; -- V_ORIG_REPORT_CATEGORY_LIST
          
        if not b_sync then
           pkg_idmgr_user_account.proc_upd_user_account_src(P_USER_SID => P_USER_SID,
                                                         P_USER_SOURCE => 'TxEIS-NOSYNC');
        end if;
      end if;*/
   end PROC_USER_RPT_CATEG_SHUTTLE;
--------------------------------------------------------------
-- Procedure: PROCESS USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of 
--              campus_master sids and a user_sid.  Since the 
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values. 
--------------------------------------------------------------
   procedure PROC_USER_CAMPUS_SHUTTLE(
      P_USER_SID    in number
      ,P_CAMPUS_LIST in varchar2
   ) is
   
     V_NEW_USER_CAMPUS_LIST APEX_APPLICATION_GLOBAL.VC_ARR2;
   
   begin
     -- convert the delimited list from a string into a table
     V_NEW_USER_CAMPUS_LIST := APEX_UTIL.STRING_TO_TABLE(P_CAMPUS_LIST);
     -- delete the current rows from USER_CAMPUS for the specified user 
     delete from USER_CAMPUS where USER_CAMPUS.USER_SID = P_USER_SID;
     -- insert the new user_campus rows --
     forall I in 1 .. V_NEW_USER_CAMPUS_LIST.COUNT
       insert into USER_CAMPUS (
           USER_CAMPUS_SID,
           USER_SID,
           CAMPUS_MASTER_SID
        ) values ( 
           SID_SEQUENCE.NEXTVAL,
           P_USER_SID,
           to_number(V_NEW_USER_CAMPUS_LIST(I))
        );
     commit;

   end PROC_USER_CAMPUS_SHUTTLE;
--------------------------------------------------------------
-- Procedure: PROCESS USER_REPORTS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of 
--              REPORT_LIST_SIDs and a user_sid.  Since the 
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values. 
--------------------------------------------------------------
   procedure PROC_USER_REPORTS_SHUTTLE(
       P_USER_SID     in number
      ,P_REPORTS_LIST in varchar2
   ) is
   
     V_NEW_USER_REPORTS_LIST APEX_APPLICATION_GLOBAL.VC_ARR2;
   
   begin
     -- convert the delimited list from a string into a table
     V_NEW_USER_REPORTS_LIST := APEX_UTIL.STRING_TO_TABLE(P_REPORTS_LIST);
     -- delete the current rows from USER_REPORT for the specified user 
     delete from USER_REPORT where USER_REPORT.USER_SID = P_USER_SID;
     -- insert the new USER_REPORT rows --
     forall I in 1 .. V_NEW_USER_REPORTS_LIST.COUNT
       insert into USER_REPORT (
           USER_REPORT_SID,
           USER_SID,
           REPORT_LIST_SID
        ) values ( 
           SID_SEQUENCE.NEXTVAL,
           P_USER_SID,
           to_number(V_NEW_USER_REPORTS_LIST(I))
        );
     commit;

   end PROC_USER_REPORTS_SHUTTLE;
--------------------------------------------------------------
-- create procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_INS_USR_TXEIS_BUS_ACT_PRM (
      P_USER_SID                in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2
   ) is 
 
   begin
 
      insert into USER_TXEIS_BUS_ACCT_PERMISS (
         USER_TXEIS_BUS_ACCT_SID,
         USER_SID,
         APP_ID,
         FUND,
         FUNC,
         OBJ,
         SOBJ,
         ORG,
         FSCL_YR,
         PGM,
         ED_SPAN,
         PROJ_DTL
      ) values ( 
         SID_SEQUENCE.NEXTVAL,
         P_USER_SID,
         P_APP_ID,
         P_FUND,
         P_FUNC,
         P_OBJ,
         P_SOBJ,
         P_ORG,
         P_FSCL_YR,
         P_PGM,
         P_ED_SPAN,
         P_PROJ_DTL
      );
      
   end PROC_INS_USR_TXEIS_BUS_ACT_PRM;
--------------------------------------------------------------
-- update procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_UPD_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2,
      P_MD5                     in varchar2  default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from USER_TXEIS_BUS_ACCT_PERMISS 
            where USER_TXEIS_BUS_ACCT_SID = P_USER_TXEIS_BUS_ACCT_SID FOR UPDATE
         ) loop
 
            L_MD5 := FN_BLD_TXEIS_BUS_ACCT_PRM_MD5(
               c1.USER_TXEIS_BUS_ACCT_SID,
               c1.USER_SID,
               c1.APP_ID,
               c1.FUND,
               c1.FUNC,
               c1.OBJ,
               c1.SOBJ,
               c1.ORG,
               c1.FSCL_YR,
               c1.PGM,
               c1.ED_SPAN,
               c1.PROJ_DTL
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update USER_TXEIS_BUS_ACCT_PERMISS set
            APP_ID                    = P_APP_ID,
            FUND                      = P_FUND,
            FUNC                      = P_FUNC,
            OBJ                       = P_OBJ,
            SOBJ                      = P_SOBJ,
            ORG                       = P_ORG,
            FSCL_YR                   = P_FSCL_YR,
            PGM                       = P_PGM,
            ED_SPAN                   = P_ED_SPAN,
            PROJ_DTL                  = P_PROJ_DTL
         where USER_TXEIS_BUS_ACCT_SID = P_USER_TXEIS_BUS_ACCT_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end PROC_UPD_USR_TXEIS_BUS_ACT_PRM;
--------------------------------------------------------------
-- delete procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_DEL_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number
   ) is 
 
   begin
 
      delete from USER_TXEIS_BUS_ACCT_PERMISS 
      where USER_TXEIS_BUS_ACCT_SID = P_USER_TXEIS_BUS_ACCT_SID;
 
   end PROC_DEL_USR_TXEIS_BUS_ACT_PRM;
--------------------------------------------------------------
-- get procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_GET_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                out number,
      P_APP_ID                  out varchar2,
      P_FUND                    out varchar2,
      P_FUNC                    out varchar2,
      P_OBJ                     out varchar2,
      P_SOBJ                    out varchar2,
      P_ORG                     out varchar2,
      P_FSCL_YR                 out char,
      P_PGM                     out varchar2,
      P_ED_SPAN                 out char,
      P_PROJ_DTL                out varchar2
   ) is 
 
      ignore varchar2(32676);
   begin
 
      PROC_GET_USR_TXEIS_BUS_ACT_PRM (
         P_USER_TXEIS_BUS_ACCT_SID,
         P_USER_SID,
         P_APP_ID,
         P_FUND,
         P_FUNC,
         P_OBJ,
         P_SOBJ,
         P_ORG,
         P_FSCL_YR,
         P_PGM,
         P_ED_SPAN,
         P_PROJ_DTL,
         ignore
      );
 
   end PROC_GET_USR_TXEIS_BUS_ACT_PRM;
--------------------------------------------------------------
-- get procedure for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   procedure PROC_GET_USR_TXEIS_BUS_ACT_PRM (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                out number,
      P_APP_ID                  out varchar2,
      P_FUND                    out varchar2,
      P_FUNC                    out varchar2,
      P_OBJ                     out varchar2,
      P_SOBJ                    out varchar2,
      P_ORG                     out varchar2,
      P_FSCL_YR                 out char,
      P_PGM                     out varchar2,
      P_ED_SPAN                 out char,
      P_PROJ_DTL                out varchar2,
      P_MD5                     out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select * from USER_TXEIS_BUS_ACCT_PERMISS 
         where USER_TXEIS_BUS_ACCT_SID = P_USER_TXEIS_BUS_ACCT_SID 
      ) loop
         P_USER_SID                := c1.USER_SID;
         P_APP_ID                  := c1.APP_ID;
         P_FUND                    := c1.FUND;
         P_FUNC                    := c1.FUNC;
         P_OBJ                     := c1.OBJ;
         P_SOBJ                    := c1.SOBJ;
         P_ORG                     := c1.ORG;
         P_FSCL_YR                 := c1.FSCL_YR;
         P_PGM                     := c1.PGM;
         P_ED_SPAN                 := c1.ED_SPAN;
         P_PROJ_DTL                := c1.PROJ_DTL;
 
         P_MD5 := FN_BLD_TXEIS_BUS_ACCT_PRM_MD5(
            c1.USER_TXEIS_BUS_ACCT_SID,
            c1.USER_SID,
            c1.APP_ID,
            c1.FUND,
            c1.FUNC,
            c1.OBJ,
            c1.SOBJ,
            c1.ORG,
            c1.FSCL_YR,
            c1.PGM,
            c1.ED_SPAN,
            c1.PROJ_DTL
         );
      end loop;
 
   end PROC_GET_USR_TXEIS_BUS_ACT_PRM;
--------------------------------------------------------------
-- build MD5 function for table "USER_TXEIS_BUS_ACCT_PERMISS
--------------------------------------------------------------
   function FN_BLD_TXEIS_BUS_ACCT_PRM_MD5 (
      P_USER_TXEIS_BUS_ACCT_SID in number,
      P_USER_SID                in number,
      P_APP_ID                  in varchar2,
      P_FUND                    in varchar2,
      P_FUNC                    in varchar2,
      P_OBJ                     in varchar2,
      P_SOBJ                    in varchar2,
      P_ORG                     in varchar2,
      P_FSCL_YR                 in char,
      P_PGM                     in varchar2,
      P_ED_SPAN                 in char,
      P_PROJ_DTL                in varchar2,
      P_COL_SEP                 in varchar2  default '|'
   ) return varchar2 is 
 
   begin
 
      return sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string=>
         P_USER_TXEIS_BUS_ACCT_SID ||P_COL_SEP||
         P_USER_SID                ||P_COL_SEP||
         P_APP_ID                  ||P_COL_SEP||
         P_FUND                    ||P_COL_SEP||
         P_FUNC                    ||P_COL_SEP||
         P_OBJ                     ||P_COL_SEP||
         P_SOBJ                    ||P_COL_SEP||
         P_ORG                     ||P_COL_SEP||
         P_FSCL_YR                 ||P_COL_SEP||
         P_PGM                     ||P_COL_SEP||
         P_ED_SPAN                 ||P_COL_SEP||
         P_PROJ_DTL                ||P_COL_SEP||
         ''
      ));
 
   end FN_BLD_TXEIS_BUS_ACCT_PRM_MD5;
--------------------------------------------------------------
-- create procedure for table USER_SECURITY_QUESTION
-- PURPOSE: since the security questions are set at 3
--          we will just delete and re-add them.
--------------------------------------------------------------
   procedure PROC_RESET_USR_SEC_QUESTIONS (
      P_USER_SID                in number,
      P_SECURITY_QUESTION_1     in number,
      P_USER_RESPONSE_1         in varchar2,
      P_SECURITY_QUESTION_2     in number,
      P_USER_RESPONSE_2         in varchar2,
      P_SECURITY_QUESTION_3     in number,
      P_USER_RESPONSE_3         in varchar2
   ) is 
 
   begin
      
      -- remove the existing questions/responses --
      delete from USER_SECURITY_QUESTION
            where USER_SECURITY_QUESTION.USER_SID = P_USER_SID;
      -- insert the 'LOGIN' type question/response --
      insert into USER_SECURITY_QUESTION
        (USER_SECURITY_QUESTION_SID
        ,SECURITY_QUESTION_SID
        ,USER_SID
        ,USER_RESPONSE)
      values
        (sid_sequence.nextval
        ,P_SECURITY_QUESTION_1
        ,P_USER_SID
        ,upper(P_USER_RESPONSE_1));
      -- insert the 'PASSWORD RESET' type question/response --
      insert into USER_SECURITY_QUESTION
        (USER_SECURITY_QUESTION_SID
        ,SECURITY_QUESTION_SID
        ,USER_SID
        ,USER_RESPONSE)
      values
        (sid_sequence.nextval
        ,P_SECURITY_QUESTION_2
        ,P_USER_SID
        ,upper(P_USER_RESPONSE_2));
      -- insert the 'EXTERNAL' type question/response --
      insert into USER_SECURITY_QUESTION
        (USER_SECURITY_QUESTION_SID
        ,SECURITY_QUESTION_SID
        ,USER_SID
        ,USER_RESPONSE)
      values
        (sid_sequence.nextval
        ,P_SECURITY_QUESTION_3
        ,P_USER_SID
        ,upper(P_USER_RESPONSE_3));        
         
   end PROC_RESET_USR_SEC_QUESTIONS;
   
--**************************************************************--
-- PROCEDURE: PROC_SYNC_TXEIS_USER
-- PURPOSE: To synchronize all TxEIS users with the TxEIS database.
--**************************************************************--
/*   procedure PROC_SYNC_TXEIS_USER (
      P_USER_SID                in number default null
   )
   is 
     v_usr_name_f                 varchar2(100);
     v_usr_name_l                 varchar2(100);
     V_USER_ROLE                  varchar2(50);
     TYPE t_rpt_catg_list         IS TABLE OF number INDEX BY PLS_INTEGER;
     V_TXEIS_RPT_CATEGORIES       t_rpt_catg_list;
     V_TXEIS_USER_RPT_CATEGORIES  t_rpt_catg_list;
     V_REVEAL_USER_RPT_CATEGORIES t_rpt_catg_list;
     V_TXEIS_USER_CAMPUSES        t_rpt_catg_list;
     V_REVEAL_USER_CAMPUSES       t_rpt_catg_list;
     
     b_match                      boolean := true;
   begin
     -- loop through the TxEIS users that are to be sync'd --
     FOR rec IN (select DISTRICT_SID
                        ,USER_SID
                        ,USER_ID
                        ,USER_FIRST_NAME
                        ,USER_LAST_NAME
                    from USER_ACCOUNT
                     where ACTIVE_ACCOUNT_FLAG = 'Y'
                     and USER_SOURCE = 'TxEIS-SYNC'
                     and user_sid = case 
                                    when P_USER_SID is not null then P_USER_SID
                                    else user_sid end) 
     LOOP
     --- update the selected users info in the user_account TABLE      
\*     select 
        usr_name_f,
        usr_name_l
        into v_usr_name_f,
             v_usr_name_l
        from rsccc.SEC_USERS@txeis SEC_USERS
        where SEC_USERS.USR_LOG_NAME = rec.USER_ID;

      if upper(v_usr_name_f) != upper(rec.USER_FIRST_NAME)
         or upper(v_usr_name_l) != upper(rec.USER_LAST_NAME) then
         update USER_ACCOUNT
            set USER_FIRST_NAME = v_usr_name_f
               ,USER_LAST_NAME  = v_usr_name_l
          where USER_SID = rec.USER_SID;
      end if;*\
     ----------------------------------------------------------------------
     -- retrieve the TxEIS applications and update the report categories --
     ----------------------------------------------------------------------
     -- get a list of reveal report category SIDS for the TxEIS report categories --
     select REPORT_CATEGORY.REPORT_CATEGORY_SID 
       bulk collect into V_TXEIS_RPT_CATEGORIES
       from rsccc.SEC_TASKS@txeis SEC_TASKS
       join REPORT_CATEGORY on REPORT_CATEGORY.REPORT_CATEGORY = SEC_TASKS.TASK_NAME
       join source on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
                  and SOURCE.SOURCE_NAME = 'TxEIS'
      where SEC_TASKS.TASK_TYP_ID = 1
        and SEC_TASKS.TASK_NAME <> 'Main Menu'
      order by 1;
     -- get a list of reveal report category SIDS for the TxEIS report categories 
     -- for the user that are stored in REVEAL 
     select USER_REPORT_CATEGORY.REPORT_CATEGORY_SID
        bulk collect into V_REVEAL_USER_RPT_CATEGORIES
        from USER_REPORT_CATEGORY
        join REPORT_CATEGORY on REPORT_CATEGORY.REPORT_CATEGORY_SID = USER_REPORT_CATEGORY.REPORT_CATEGORY_SID
        join SOURCE on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
                    and SOURCE.SOURCE_NAME = 'TxEIS'
       where USER_REPORT_CATEGORY.USER_SID = rec.USER_SID
       order by 1;
     -- get a list of reveal report category SIDS for the TxEIS report categories --
     -- for the user that are stored in TxEIS
     select distinct RVL_RPT_CATG.REPORT_CATEGORY_SID
       bulk collect into V_TXEIS_USER_RPT_CATEGORIES
       from rsccc.SEC_USERS@txeis SEC_USERS
       join rsccc.SEC_USER_ROLES@txeis SEC_USER_ROLES   on SEC_USER_ROLES.USR_ID = SEC_USERS.USR_ID
       join rsccc.SEC_ROLES@txeis SEC_ROLES             on SEC_ROLES.ROLE_ID = SEC_USER_ROLES.ROLE_ID
       join rsccc.SEC_PERMISSIONS@txeis SEC_PERMISSIONS on SEC_PERMISSIONS.ROLE_ID = SEC_ROLES.ROLE_ID
       join rsccc.SEC_TASKS@txeis SEC_TASKS             on SEC_TASKS.TASK_ID = SEC_PERMISSIONS.TASK_ID
       left join (select REPORT_CATEGORY.REPORT_CATEGORY_SID
                        ,REPORT_CATEGORY.REPORT_CATEGORY
                   from REPORT_CATEGORY
                   join source on SOURCE.SOURCE_SID = REPORT_CATEGORY.SOURCE_SID
                              and SOURCE.SOURCE_NAME = 'TxEIS') RVL_RPT_CATG
             on RVL_RPT_CATG.REPORT_CATEGORY = SEC_TASKS.TASK_NAME
      where SEC_TASKS.TASK_TYP_ID = 1
        and SEC_TASKS.TASK_NAME != 'Main Menu'
        and SEC_USERS.USR_LOG_NAME = rec.USER_ID
      order by 1;
     -- compare the users reveal list to the full list of TxEIS categories.
     -- delete any that are not found as they are reveal specific categories.
     for i in V_REVEAL_USER_RPT_CATEGORIES.first..V_REVEAL_USER_RPT_CATEGORIES.last
       loop
          if V_TXEIS_RPT_CATEGORIES.count > 0 then
            for j in V_TXEIS_RPT_CATEGORIES.first..V_TXEIS_RPT_CATEGORIES.last
              loop
                if V_REVEAL_USER_RPT_CATEGORIES.EXISTS(i) then 
                  if V_REVEAL_USER_RPT_CATEGORIES(i) = V_TXEIS_RPT_CATEGORIES(j) then
                    b_match := true;
                    EXIT;
                  end if;
                end if;
              end loop;
          end if;
          if b_match then
             b_match := false;
          else
            -- we did not find a match which means this is not a TxEIS cataegory so remove it from the list --
            V_REVEAL_USER_RPT_CATEGORIES.DELETE(i);
          end if;
       end loop;
     --compare the users reveal list to the users TxEIS list and delete any that match.
     if V_REVEAL_USER_RPT_CATEGORIES.count > 0 then
       for i in V_REVEAL_USER_RPT_CATEGORIES.first..V_REVEAL_USER_RPT_CATEGORIES.last
          loop
            if V_REVEAL_USER_RPT_CATEGORIES.EXISTS(i) then
              if V_TXEIS_USER_RPT_CATEGORIES.count > 0 then -- make sure we haven't deleted them all!!
                for j in V_TXEIS_USER_RPT_CATEGORIES.first..V_TXEIS_USER_RPT_CATEGORIES.last
                  loop
                    if V_TXEIS_USER_RPT_CATEGORIES.EXISTS(j) then
                      if V_REVEAL_USER_RPT_CATEGORIES(i) = V_TXEIS_USER_RPT_CATEGORIES(j) then
                        V_REVEAL_USER_RPT_CATEGORIES.DELETE(i);
                        V_TXEIS_USER_RPT_CATEGORIES.DELETE(j);
                        EXIT;
                      end if;
                    end if;
                  end loop;
              else
                EXIT; -- ran out of TxEIS user rpt categories so exit the main loop
              end if;
            end if;
          end loop;
     end if;
     -- anything left in the users reveal list should be deleted --
     if V_REVEAL_USER_RPT_CATEGORIES.COUNT > 0 THEN
        for i in V_REVEAL_USER_RPT_CATEGORIES.first..V_REVEAL_USER_RPT_CATEGORIES.last
          LOOP
            if V_REVEAL_USER_RPT_CATEGORIES.EXISTS(i) then
              delete from USER_REPORT_CATEGORY
                where USER_REPORT_CATEGORY.USER_SID = rec.USER_SID
                  and USER_REPORT_CATEGORY.REPORT_CATEGORY_SID = V_REVEAL_USER_RPT_CATEGORIES(i);
            end if;
          END LOOP;
     end if;
     -- anything left in the users TxEIS list should be inserted --
     if V_TXEIS_USER_RPT_CATEGORIES.COUNT > 0 THEN
        for i in V_TXEIS_USER_RPT_CATEGORIES.first..V_TXEIS_USER_RPT_CATEGORIES.last
          LOOP
            if V_TXEIS_USER_RPT_CATEGORIES.EXISTS(i) then
              insert into user_report_category
                (user_report_category_sid
                , user_sid
                , report_category_sid)
              values
                (sid_sequence.nextval
                , rec.USER_SID
                , V_TXEIS_USER_RPT_CATEGORIES(i));
            end if;
          END LOOP;
     end if;
     -- Clean up the collections and free up the memory --
     V_TXEIS_RPT_CATEGORIES.DELETE;
     V_TXEIS_USER_RPT_CATEGORIES.DELETE;
     V_REVEAL_USER_RPT_CATEGORIES.DELETE;
     -------------------------------------- 
     -- SYNC the campuse MASTER table    --
     -- if the district adds a new campus, this will catch it and add it.
     --------------------------------------
     for new_campus in (select  
                               campus_id as school_id
                              ,dist_id || campus_id as campus_id
                              ,replace(campus_name, ',',' ') as campus_name 
                              ,str_nbr || ' ' || replace(replace(str_name, ',', ' '), '.', ' ') as campus_address
                              ,replace(replace(city_name, ',', ' '), '.', ' ') as campus_city 
                              ,zip||nvl2(zip4,'-',zip4)||zip4 as campus_postal_code
                              ,tb_campus_state as campus_state_code
                              ,phone_area_cd || '-' || substr(phone_nbr,1 ,3) || '-' || substr(phone_nbr,4,4) as campus_phone 
                              ,grd_rng_low||nvl2(grd_rng_hi,'-',grd_rng_hi)||grd_rng_hi as campus_grade_range
                              ,'TX*'||dist_id || campus_id as campus_key
                        from rsccc.cr_demo@txeis cr_demo 
                        where sch_yr in (select max(SCH_YR) from CR_DEMO) and campus_id <= 698
                        and campus_id not in (select campus_master.school_id from campus_master
                                                 where campus_master.district_sid = rec.DISTRICT_SID)
                        order by 2)
       loop
         insert into campus_master
           (campus_master_sid
            , district_sid
            , school_id
            , campus_id
            , campus_name
            , campus_address
            , campus_city
            , campus_postal_code
            , campus_state_code
            , campus_phone
            , campus_grade_range
            , campus_key)
            values
            (sid_sequence.nextval
            , rec.DISTRICT_SID
            , new_campus.school_id
            , new_campus.campus_id
            , new_campus.campus_name
            , new_campus.campus_address
            , new_campus.campus_city
            , new_campus.campus_postal_code
            , new_campus.campus_state_code
            , new_campus.campus_phone
            , new_campus.campus_grade_range
            , new_campus.campus_key);
       end loop;
     
     -------------------------------------- 
     -- SYNC  the campuses for the user  --
     --------------------------------------
     
     -- get the users campuses from TxEIS --
     select distinct CAMPUS_MASTER.CAMPUS_MASTER_SID
       bulk collect into V_TXEIS_USER_CAMPUSES
       from rsccc.SEC_USERS@txeis SEC_USERS
       join rsccc.SEC_USER_ROLES@txeis SEC_USER_ROLES on SEC_USER_ROLES.USR_ID = SEC_USERS.USR_ID
       join rsccc.SEC_ROLES@txeis SEC_ROLES on SEC_ROLES.ROLE_ID = SEC_USER_ROLES.ROLE_ID
       join rsccc.SEC_USER_ROLE_CAMPUSES@txeis SEC_USER_ROLE_CAMPUSES on SEC_USER_ROLE_CAMPUSES.USR_ROLE_ID = SEC_USER_ROLES.USR_ROLE_ID
       join CAMPUS_MASTER ON CAMPUS_MASTER.SCHOOL_ID = SEC_USER_ROLE_CAMPUSES.CAMPUS_ID
                          AND CAMPUS_MASTER.DISTRICT_SID = rec.DISTRICT_SID
      where SEC_USERS.USR_LOG_NAME = rec.USER_ID
      order by 1;
     -- get the users campuses from Reveal --
     select V_IDMGR_USER_CAMPUS.CAMPUS_MASTER_SID  
       bulk collect into V_REVEAL_USER_CAMPUSES
       from V_IDMGR_USER_CAMPUS 
      where V_IDMGR_USER_CAMPUS.USER_SID = rec.USER_SID
      order by 1;
     -- get the user's reveal reporter ROLE -- 
     select USER_APPS_ROLES_V.ROLE
       into V_USER_ROLE
       from USER_APPS_ROLES_V 
      where USER_APPS_ROLES_V.USER_SID = rec.USER_SID
        and USER_APPS_ROLES_V.DESCRIPTION = 'Reveal Reporter';
      
     if V_TXEIS_USER_CAMPUSES.count > 0 then
      --compare the users reveal list to the users TxEIS list and delete any that match.
       for i in V_REVEAL_USER_CAMPUSES.first..V_REVEAL_USER_CAMPUSES.last
          loop
            if V_TXEIS_USER_CAMPUSES.count > 0 then
              for j in V_TXEIS_USER_CAMPUSES.first..V_TXEIS_USER_CAMPUSES.last
                loop 
                  if V_TXEIS_USER_CAMPUSES.EXISTS(j) then
                    if V_REVEAL_USER_CAMPUSES(i) = V_TXEIS_USER_CAMPUSES(j) then
                      V_REVEAL_USER_CAMPUSES.DELETE(i);
                      V_TXEIS_USER_CAMPUSES.DELETE(j);
                      EXIT;
                    end if;
                  end if;
                end loop;
            else
              -- ran out of campuses from TxEIS so exit --
              EXIT;
            end if;
          end loop;
       -- anything left in the users reveal list should be deleted --
       if V_REVEAL_USER_CAMPUSES.COUNT > 0 THEN
          for i in V_REVEAL_USER_CAMPUSES.first..V_REVEAL_USER_CAMPUSES.last
            LOOP
              if V_REVEAL_USER_CAMPUSES.EXISTS(i) then
                delete from USER_CAMPUS
                  where USER_CAMPUS.USER_SID = rec.USER_SID
                    and USER_CAMPUS.CAMPUS_MASTER_SID = V_REVEAL_USER_CAMPUSES(i);
              end if;
            END LOOP;
       end if;
       -- anything left in the users TxEIS list should be inserted --
       if V_TXEIS_USER_CAMPUSES.COUNT > 0 THEN
          for i in V_TXEIS_USER_CAMPUSES.first..V_TXEIS_USER_CAMPUSES.last
            LOOP
              if V_TXEIS_USER_CAMPUSES.EXISTS(i) then
                insert into USER_CAMPUS
                  (USER_CAMPUS_SID
                  ,USER_SID
                  ,CAMPUS_MASTER_SID)
                values
                  (sid_sequence.nextval
                  , rec.USER_SID
                  , V_TXEIS_USER_CAMPUSES(i));
              end if;
            END LOOP;
       end if;
       -- Clean up the collections and free up the memory --
       V_TXEIS_USER_CAMPUSES.DELETE;
       V_REVEAL_USER_CAMPUSES.DELETE;
       -- USER HAS CAMPUSES SO SET THE USER ROLE TO CAMPUS USER --
       if V_USER_ROLE != 'CAMPUS_USER' then 
         delete from USER_ROLE 
           where USER_ROLE.USER_SID = rec.user_sid
             and USER_ROLE.APPLICATION_ROLE_SID = 
                       (select APPLICATION_ROLE.APPLICATION_ROLE_SID
                         from APPLICATION_ROLE
                         join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
                         join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
                        where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
                          and ROLE_MASTER.ROLE = V_USER_ROLE);
                          
         insert into USER_ROLE
           (USER_ROLE_SID
           ,USER_SID
           ,APPLICATION_ROLE_SID
           ,DEFAULT_APPLICATION_FLAG)
         values
           (sid_sequence.nextval
           ,rec.user_sid
           ,(select APPLICATION_ROLE.APPLICATION_ROLE_SID
               from APPLICATION_ROLE
               join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
               join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
              where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
                and ROLE_MASTER.ROLE = 'CAMPUS_USER')
           ,'Y');
         end if;
     else
       if V_REVEAL_USER_CAMPUSES.COUNT > 0 THEN
          -- the user had no campuses in TxEIS so delete them all in Reveal --
          delete from USER_CAMPUS
            where USER_CAMPUS.USER_SID = rec.USER_SID;
       end if;
       -- USER HAS NO CAMPUSES SO SET THE USER ROLE TO DISTRICT USER --
       if V_USER_ROLE = 'CAMPUS_USER' then 
         delete from USER_ROLE 
           where USER_ROLE.USER_SID = rec.user_sid
             and USER_ROLE.APPLICATION_ROLE_SID = 
                       (select APPLICATION_ROLE.APPLICATION_ROLE_SID
                         from APPLICATION_ROLE
                         join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
                         join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
                        where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
                          and ROLE_MASTER.ROLE = V_USER_ROLE);
                          
         insert into USER_ROLE
           (USER_ROLE_SID
           ,USER_SID
           ,APPLICATION_ROLE_SID
           ,DEFAULT_APPLICATION_FLAG)
         values
           (sid_sequence.nextval
           ,rec.user_sid
           ,(select APPLICATION_ROLE.APPLICATION_ROLE_SID
               from APPLICATION_ROLE
               join ROLE_MASTER on ROLE_MASTER.ROLE_SID = APPLICATION_ROLE.ROLE_SID
               join APPLICATION on APPLICATION.APPLICATION_ID = APPLICATION_ROLE.APPLICATION_ID
              where APPLICATION.APPLICATION_ALIAS = 'REVRPTR'
                and ROLE_MASTER.ROLE = 'DISTRICT_USER')
           ,'Y');
         end if;
     end if;
     
     
     -- log the new user --
     pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => rec.USER_SID,
              p_user_id => 'System',
              p_log_message => 'Synchonization completed for TxEIS User: '||rec.USER_ID,
              p_action_type => 'TxEIS User Sync',
              p_action_result => 'Successfully Synchronized TxEIS User',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
    END LOOP;

    commit; 
    -- sync the business profiles of all the users by refreshing the MV--
    DBMS_MVIEW.refresh('MV_TXSTU_BUS_ACCT_SEC_D');
     
   end PROC_SYNC_TXEIS_USER;*/

--------------------------------------------------------------
end PKG_IDMGR_USER_ACCOUNT;
/

prompt
prompt Creating package body PKG_RISK_CALCULATION_ENGINE
prompt =================================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_RISK_CALCULATION_ENGINE" is

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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure (Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure (Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Stopped','',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;

   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from campus_risk_factor_dim
      join campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
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
   from date_dim
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
   from attendance_risk_factor_fact
   join date_dim  on date_dim.date_sid = attendance_risk_factor_fact.date_sid
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
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
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
     end if;
   end if;

   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
   pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Stopped',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;

   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from campus_risk_factor_dim
      join campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
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
   from date_dim
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;

   -- get the sid for the semester attendance flag from the campus_risk_factor_dim --
   begin
     select
      campus_risk_factor_sid
      into v_campus_rf_semester_sid
      from campus_risk_factor_dim
      join campus_dim on campus_dim.campus_id = campus_risk_factor_dim.campus_id
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
   from date_dim
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;

end prc_non_core_crs_rf_refresh;
/*------------------------------------------------------------------------------
Procedure:           prc_delete_discipline_rf_fact
Purpose:             Deletes the discipline risk factor
                     fact data for a campus for the specified school year from
                     student_risk_factor_fact.
Input:               Campus_sid - The sid of the campus data to delete.
                     p_campus_rf_sid - The sid of the campus risk factor dim record used
                                       to identify all the risk factor rows of the same type
                                       for a campus.
                     school_year - The school of the data to delete.

Revision History
Date        Author       Remarks
2013-01-14  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_delete_discipline_rf_fact (p_campus_rf_sid IN number, p_school_year IN varchar2, p_debug IN varchar2) is

    v_proc_name       varchar2(100)  := 'pkg_risk_calculation_engine.prc_delete_discipline_rf_fact';
    v_start_datetime  timestamp      := SYSTIMESTAMP;
    v_end_datetime    timestamp      := SYSTIMESTAMP;
    v_school_year     varchar2(4);
    v_rows_affected   number         := 0;
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_rf_sid = '||p_campus_rf_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;
END prc_delete_discipline_rf_fact;

/*------------------------------------------------------------------------------
Procedure:           prc_discipline_rf_refresh
Purpose:             Creates student risk factor facts for students with discipline actions
                     that are not excluded and that meet or exceed the discipline threshold
                     set in the campus_dim for this campus.
Input:               Campus_sid - The sid of the campus for this run of the engine.
                     Run_date_sid - The date for this run of the engine.

Revision History
Date      Author       Remarks
20130111  C.Bull       Original version
--------------------------------------------------------------------------------*/
PROCEDURE prc_discipline_rf_refresh(p_campus_sid IN number
                                    ,p_run_date_sid IN number
                                    ,p_school_year IN varchar2
                                    ,p_discipline_threshold IN number
                                    ,p_campus_rf_sid IN number
                                    ,p_debug IN varchar2) is

    v_proc_name                     varchar2(100)  := 'pkg_risk_calculation_engine.prc_discipline_rf_refresh';
    v_start_datetime                timestamp      := SYSTIMESTAMP;
    v_end_datetime                  timestamp      := SYSTIMESTAMP;
    v_rows_affected                 number         := 0;
    -- exception variables
    v_errcode         number;
    v_errmesg         varchar2(200);
    e_no_rows_found   exception;

    -- collections
    TYPE r_student_rf_fact is RECORD (
         campus_sid                  student_risk_factor_fact.campus_sid%TYPE,
         student_sid                 student_risk_factor_fact.student_sid%TYPE,
         flag_date_sid               student_risk_factor_fact.flag_date_sid%TYPE,
         campus_risk_factor_sid      student_risk_factor_fact.campus_risk_factor_sid%TYPE,
         end_date_sid                student_risk_factor_fact.end_date_sid%TYPE,
         risk_factor_count           student_risk_factor_fact.risk_factor_count%TYPE);
    TYPE t_student_rf_fact is table of r_student_rf_fact INDEX BY pls_integer;
    v_stu_rf_collection t_student_rf_fact;

BEGIN
   -- log start time --
   if p_debug in ('T','TD','TI','TDI') then
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
   end if;

   -- Delete Prior data from Student_risk_factor_fact for this campus/school year --
   prc_delete_discipline_rf_fact(p_campus_rf_sid,p_school_year,p_debug);

   -- collect the student risk factor facts for students who meet the         --
   -- campus discipline threshold for non-excluded discipline_dim items       --
   select student_discipline_action_fact.campus_sid,
          student_discipline_action_fact.student_sid,
          min(student_discipline_action_fact.date_sid) flag_date_sid,
          campus_risk_factor_dim.campus_risk_factor_sid,
          (select date_sid from date_dim
            where date_dim.last_day_semester = 'Yes'
            and date_dim.semester = '2'
            and date_dim.school_year = p_school_year) as end_date_sid,
          1 as risk_factor_count
    bulk collect into v_stu_rf_collection
    from student_discipline_action_fact
    join date_dim on date_dim.date_sid = student_discipline_action_fact.date_sid
                  and date_dim.school_year = p_school_year --school_year
    join discipline_dim on discipline_dim.discipline_sid = student_discipline_action_fact.discipline_sid
                        and upper(discipline_dim.exclude_discipline_flag) = 'NO'
    join campus_dim on campus_dim.campus_sid = student_discipline_action_fact.campus_sid
    join campus_risk_factor_dim on campus_risk_factor_dim.campus_id = campus_dim.campus_id
                                and campus_risk_factor_dim.campus_risk_factor_sid = p_campus_rf_sid --campus_rf_sid
    where student_discipline_action_fact.campus_sid = p_campus_sid --campus_sid
    having count(*) >= p_discipline_threshold -- Threshold
    group by student_discipline_action_fact.campus_sid,
         student_discipline_action_fact.student_sid,
         campus_risk_factor_dim.campus_risk_factor_sid
    order by student_discipline_action_fact.student_sid;

    if v_stu_rf_collection.count = 0 then
     raise e_no_rows_found;
    end if;

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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception
    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No students found with discipline risk factors!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      rollback;
      raise;

end prc_discipline_rf_refresh;

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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  District_sid = '||p_district_sid||' School Year = '|| p_school_year||' District_sid = '||p_district_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( District_sid = '||p_district_sid||' School Year = '|| p_school_year||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); District_sid = '||p_district_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
   end if;

   -- delete rows --
   delete student_risk_factor_snapshot
   where student_risk_factor_snapshot.campus_sid = p_campus_sid;

   v_rows_affected := SQL%ROWCOUNT;
   commit;
   -- log end time --
   if p_debug in ('T','TD','TI','TDI') then
     v_end_datetime := SYSTIMESTAMP;
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( '||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;
    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Start '||v_proc_name||' Procedure (  Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure ( Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception
    when e_dws_district_error then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'District(s) parameter was not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      if p_debug in ('I','TI','TDI') then
        v_end_datetime := SYSTIMESTAMP;
        v_errmesg := 'No rows found to process based on the specified parameters!';
        pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Continuing',null,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
      end if;

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||p_school_year||' school year); Campus_sid = '||p_campus_sid||' Run_date_sid = '|| p_run_date_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Run_date_sid= '||p_run_date_sid||' Campus_sid = '||p_campus_sid||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_etl_log_event(v_proc_name,'information','p/l sql','ended',null,null,v_rows_affected,('end '||v_proc_name||' procedure.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_get_elapsed_time(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('Parms: District_SID= '||p_district_sid||' Run_date_sid= '||p_run_date_sid||' Campus_sid = '||p_campus_sid||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('District_sid= '||p_district_sid||' District_id = '||p_district_id||'.'),v_start_datetime,null,null );
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
     pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_rows_affected,('End '||v_proc_name||' Procedure.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
   end if;

    -- Error handling --
    exception

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
      PassingGradeThreshold  campus_dim.passing_grade_threshold%TYPE,
      DisciplineThreshold    campus_dim.discipline_threshold%TYPE);

    TYPE t_campus_type IS TABLE OF r_campus_record INDEX BY pls_integer;

    v_campus_collection t_campus_type;


BEGIN
   -- log start time --
   pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Started',null,null,0,('Parms=( District_id='||p_district_id||' Campus_sid= '||p_campus_id||' Run_date_id= '|| p_run_date_id||' with debug option '||p_debug||'.'),v_start_datetime,null,null );

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
          ,campus_dim.discipline_threshold
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
        ,campus_dim.discipline_threshold
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
       when 'Discipline' then
         prc_discipline_rf_refresh(p_campus_sid => v_campus_collection(i).CampusSID
                                    ,p_run_date_sid => v_run_date_sid
                                    ,p_school_year => v_school_year
                                    ,p_discipline_threshold => v_campus_collection(i).DisciplineThreshold
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
   pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Information','P/L SQL','Ended',null,null,v_total_snapshot_rows,('End '||v_proc_name),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    -- Error handling --
    exception
    when e_campus_required then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'Campus parameter was not specified and is required if District not specified!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_sid = '||p_campus_id||' Run_date_sid = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_campus_not_found then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'The specified Campus was not found!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'WARNING','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ( Campus = '||p_campus_id||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when e_no_rows_found then
      v_end_datetime := SYSTIMESTAMP;
      v_errmesg := 'No rows found to process based on the specified parameters!';
      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'WARNING','P/L SQL','Stopped','99999',v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_id = '||p_campus_id||' Run_date_id = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );

    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);

      pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','P/L SQL','Stopped',v_errcode,v_errmesg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); Campus_id = '||p_campus_id||' Run_date_id = '|| p_run_date_id||'.'),v_start_datetime,v_end_datetime,pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) );
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
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_RISK_FACTOR_CONFIG" is

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
prompt Creating package body PKG_RPT_DATA_SOURCE
prompt =========================================
prompt
create or replace package body timsrptdata.PKG_RPT_DATA_SOURCE is

  -- Private type declarations
  --type <TypeName> is <Datatype>;
  
  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;
  
  -- Function and procedure implementations
  PROCEDURE prc_txstu_switch_data_mode (v_source IN varchar2) IS
      v_stmt varchar2(200);
      v_curr_mode varchar2(10);
      v_new_mode varchar2(10);
      v_source_sid number;
      v_event_details varchar2(200);
      CURSOR c_source IS
             SELECT source_sid, 
                    current_mode
             FROM source
             WHERE source_name = v_source;
      CURSOR c_source_config IS
             SELECT synonym_name,
                    application_id,
                    source_sid,
                    datamart_target_owner,
                    datamart_target_object,
                    realtime_target_owner,
                    realtime_target_object,
                    realtime_target_dblink
             FROM   source_config
             WHERE source_sid = v_source_sid
                   and active_flag = 'Y';
  begin
  
  -- fetch source to be switched and its current mode
    for r_source in c_source loop
      v_source_sid := r_source.source_sid;
      v_curr_mode := r_source.current_mode;
    end loop;
    
    -- set new mode
    if (v_curr_mode = 'REALTIME') then
       v_new_mode := 'DATAMART';
    elsif (v_curr_mode = 'DATAMART') then       
       v_new_mode := 'REALTIME';       
    end if;
    
  -- loop through synonyms
  -- construct statement to switch source to opposite target
    for r_syn in c_source_config loop
        
        if (v_curr_mode = 'REALTIME') then
 
            v_stmt := 'create or replace synonym '||r_syn.synonym_name||' for '
             ||r_syn.datamart_target_owner||'.'||r_syn.datamart_target_object;

        elsif (v_curr_mode = 'DATAMART') then 

             v_stmt := 'create or replace synonym '||r_syn.synonym_name||' for '
             ||r_syn.realtime_target_owner||'.'||r_syn.realtime_target_object
             ||'@'||r_syn.realtime_target_dblink;   

        end if;
        
        -- execute the synonym switch and then update the mode in the config table
        begin
             EXECUTE IMMEDIATE v_stmt;
      
        exception
             when others then  
               dbms_output.put_line('Failed on synonym switch: '||SQLERRM);
        end;        
    
    end loop;
   
   begin
       UPDATE source
       SET current_mode = v_new_mode
       WHERE source_sid = v_source_sid;
                  
   exception
         when others then  
           dbms_output.put_line('Failed on source mode update: '||SQLERRM);
    end; 
   
    begin
        v_event_details := 'Switched data source '||v_source||' from '||v_curr_mode||
           ' to '||v_new_mode||'.';    
        INSERT INTO application_event_log
        (event_id, application_id, user_id, event_type_sid, event_dttm, event_details)
        VALUES (sid_sequence.nextval, 1, SYS_CONTEXT('REVEAL_CTX','USER_NAME'), 
               1, sysdate, v_event_details);  
   exception
    when others then 
           dbms_output.put_line('Log write error: '||SQLERRM);
   end;   
   -- refresh the mv_txstu_stu_campus_base_d and student level security tables 
   -- when switching to REALTIME mode
   if v_new_mode = 'REALTIME' then 
     -- reload the student level security tables to ensure the that all the students are included
     -- for campus level users
     pkg_sv_security.prc_load_reveal_security_table;
     
     -- refresh the mv_txstu_stu_campus_base_d to include all the current students --
     DBMS_MVIEW.refresh('MV_TXSTU_STU_CAMPUS_BASE_D');
   end if;
   
   -- recompile invalid views
   begin
  for x in (SELECT object_name
            FROM   user_objects
            WHERE  object_type = 'VIEW' and status = 'INVALID')
    loop
      execute immediate 
      'alter view '||x.object_name||' compile';
    end loop;
      exception
    when others then 
           dbms_output.put_line('Error in view recompile: '||SQLERRM);
  end;

               
    COMMIT;    
    dbms_output.put_line('Success');
    
  exception
    when others then 
           dbms_output.put_line('General error: '||SQLERRM);

  end prc_txstu_switch_data_mode;
  /* ***********************************************
     PROCEDURE prc_datamart_refresh
     Purpose:  to refresh the views that are copies of the TxEIS sybase source tables.
     
     Date      By    Description
     01/04/12  CB    Original Creation
  ************************************************* */
  PROCEDURE prc_datamart_refresh is

  type t_mv_list is varray(500) of varchar2(30);

  v_mv_list t_mv_list := t_mv_list();
  
  begin
    select SOURCE_CONFIG.DATAMART_TARGET_OBJECT
    bulk collect into v_mv_list
    from SOURCE_CONFIG
    where SOURCE_CONFIG.Active_Flag = 'Y'
    order by 1;
       
    -- loop thru the list of MVs --
    for i in v_mv_list.FIRST..v_mv_list.LAST
      loop
        -- check the MV to ensure the all null constraints have been removed --
        for x in (select constraint_name 
                from all_constraints
                where table_name=v_mv_list(i)
                and constraint_type='C')
        loop
          execute immediate 
          'alter table '||v_mv_list(i)||' drop CONSTRAINT '||x.constraint_name;
        end loop;
        -- refresh the MV --
        --dbms_output.put_line(v_mv_list(i));
        DBMS_MVIEW.refresh(v_mv_list(i));
      end loop;
    -- insert refresh time into the application_event_log --
    insert into application_event_log
      (event_id,
       application_id,
       user_id,
       event_type_sid,
       event_dttm,
       event_details)
    values
      (sid_sequence.nextval,
       (select application.application_id from application where application.description = 'Reveal Reporter'),
       'REVEAL@REGION10.ORG',
       2,
       SYSDATE,
       'Refreshed Datamart Tables!');
    -- recompile the 
    execute immediate 
          'alter materialized view mv_txstu_stu_campus_base_d compile';
                                    
  end prc_datamart_refresh;
  /* ***********************************************
     PROCEDURE prc_datamart_refresh
     Purpose:  to refresh a single materialized view.
     
     Date      By    Description
     09/25/12  CB    Original Creation
  ************************************************* */
  PROCEDURE prc_datamart_refresh ( P_MVIEW IN varchar2) 
  is
 
  begin
        -- check the MV to ensure that all null constraints have been removed --
        for x in (select constraint_name 
                from all_constraints
                where table_name = P_MVIEW
                and constraint_type = 'C')
        loop
          execute immediate 
          'alter table '||P_MVIEW||' drop CONSTRAINT '||x.constraint_name;
        end loop;
        -- refresh the MV --
        --dbms_output.put_line(v_mv_list(i));
        DBMS_MVIEW.refresh(P_MVIEW);

    -- insert refresh time into the application_event_log --
    insert into application_event_log
      (event_id,
       application_id,
       user_id,
       event_type_sid,
       event_dttm,
       event_details)
    values
      (sid_sequence.nextval,
       (select application.application_id from application where application.description = 'Reveal Reporter'),
       'REVEAL@REGION10.ORG',
       2,
       SYSDATE,
       'Refreshed: '||P_MVIEW);
                                    
  end prc_datamart_refresh;
end PKG_RPT_DATA_SOURCE;
/

prompt
prompt Creating package body PKG_SV_ACCT_MGMT
prompt ======================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA.pkg_sv_acct_mgmt
AS
PROCEDURE proc_reset_email
          (  p_user_sid IN number
            ,p_workspace_id IN number default null)

IS
    l_email_subject             VARCHAR2 (90);
    l_email_application_link    VARCHAR2 (400);
    l_email_salutation          VARCHAR2 (400);
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_temp_pw                   varchar2(20)  := 'default' ;
    l_user_sid                  number;
    l_user_id                   varchar2(90);
    l_email_address             varchar2(90);
    l_update_user_sid           number;
    l_update_user_id            user_account.user_id%TYPE;

BEGIN

  /* Generate new PW */
     l_temp_pw := pkg_idmgr_user_account.fn_generate_password;
    
   /* get the user_id and email_address */
   select USER_ID
         ,EMAIL_ADDRESS
     into L_USER_ID
         ,L_EMAIL_ADDRESS
     from USER_ACCOUNT
    where USER_SID = P_USER_SID;
    
    /* Get the user_sid of the update user. it is possible that there is no logged in
       user as this is a forgot password reset, so we will use the id of the user
       we are updating since they are updating themselves.*/
   begin
     select USER_SID
           ,USER_ID
       into L_UPDATE_USER_SID
           ,L_UPDATE_USER_ID
       from USER_ACCOUNT
      where USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME');
      exception
        when no_data_found then
          select USER_SID
                 ,USER_ID
             into L_UPDATE_USER_SID
                 ,L_UPDATE_USER_ID
             from USER_ACCOUNT
            where USER_SID = P_USER_SID;
          -- since this is a forgot password the user is not logged in so we
          -- have to set the security group which is the workspace id.
          apex_util.set_security_group_id(p_security_group_id => p_workspace_id);
    end;
        
    /* UPDATE THE USER PASSWORD AND INFO */
    update  user_account
       set  password_expiration_date = sysdate - 1,
            password  =   pkg_sv_security.fn_get_hash(l_user_id, l_temp_pw),
            password_update_date = sysdate,
            attempt_ctr = 0,
            account_locked = 'N',
            update_date = sysdate,
            updated_by = l_update_user_sid
    where user_sid = p_user_sid;
    commit;

   /* Get the email */
   select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = '4';

    l_body_html := l_body_html || l_temp_pw || l_email_application_link || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => l_email_address,
    p_from      => 'donotreply@region10.org',
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;
    
  /* LOG THE CHANGE */
  pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => l_user_sid,
            p_user_id => l_update_user_id,
            p_log_message => 'Reset User Password: '||l_user_id,
            p_action_type => 'Password Reset',
            p_action_result => 'Successfully Reset User Password, Email Sent',
            p_attempts => 1,
            p_user_ip_address => OWA_UTIL.get_cgi_env ('REMOTE_ADDR'),
            p_browser => OWA_UTIL.GET_CGI_ENV('HTTP_USER_AGENT'));

exception
  when others then
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => l_user_sid,
            p_user_id => l_update_user_id,
            p_log_message => DBMS_UTILITY.FORMAT_ERROR_BACKTRACE,
            p_action_type => 'Password Reset',
            p_action_result => sqlerrm(sqlcode),
            p_attempts => 1,
            p_user_ip_address => OWA_UTIL.get_cgi_env ('REMOTE_ADDR'),
            p_browser => OWA_UTIL.GET_CGI_ENV('HTTP_USER_AGENT'));

END  proc_reset_email ;
/************************************************
procedure: proc_reset_email
Purpose:   overloads the proc so that it can be called
           with a user ID istead of a sid.  Mainly for use by the
           forgot password on the login page.
Log:
08-26-13 CB Original Creation
*****************************************************/
PROCEDURE proc_forgot_password
          (  p_user_id IN varchar2 
            ,p_workspace_id IN number)
IS
v_user_sid number;
BEGIN
  select user_account.user_sid
    into v_user_sid
    from user_account
   where user_account.user_id = p_user_id;
  
  proc_reset_email(p_user_sid     => v_user_sid
                  ,p_workspace_id => p_workspace_id);
  
END  proc_forgot_password ;
/************************************************
procedure: PROC_MANUAL_PW_RESET
Purpose:   used when a super user manually resets a users password.
Log:
08-13-13 CB Original Creation
*****************************************************/
PROCEDURE proc_manual_pw_reset
          (  p_user_sid IN number 
            ,p_new_password IN varchar2)

IS
    l_email_subject             email_specification.email_subject%TYPE;
    l_email_application_link    email_specification.application_link%TYPE;
    l_email_salutation          email_specification.salutation%TYPE;
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_user_sid                  user_account.user_sid%TYPE;
    l_user_id                   user_account.user_id%TYPE;
    l_email_address             user_account.email_address%TYPE;
    l_update_user_sid           user_account.updated_by%TYPE;
    l_update_user_id            user_account.user_id%TYPE;
    l_first_login_flag          user_account.first_login_flag%TYPE;
    l_pw_expiration_dt          user_account.password_expiration_date%TYPE;
    l_pw_expiration_days        district_dim.password_expire_days%TYPE;

BEGIN

   /* Get the user_sid, id, and district password expiration
      number of days for the update user */
   select USER_ACCOUNT_V.USER_SID
         ,USER_ACCOUNT_V.USER_ID
         ,USER_ACCOUNT_V.PASSWORD_EXPIRE_DAYS
     into l_update_user_sid
         ,l_update_user_id
         ,l_pw_expiration_days
     from USER_ACCOUNT_V
    where USER_ACCOUNT_V.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME') ;
    
   /* get the user_id and email_address */
   select USER_ID
         ,EMAIL_ADDRESS
         ,FIRST_LOGIN_FLAG
     into L_USER_ID
         ,L_EMAIL_ADDRESS
         ,L_FIRST_LOGIN_FLAG
     from USER_ACCOUNT
    where USER_SID = P_USER_SID;
    
    if l_first_login_flag <> 'N' then
      l_pw_expiration_dt := sysdate - 1;
    else
      l_pw_expiration_dt := sysdate + l_pw_expiration_days;
    end if;
    
    /* UPDATE THE USER PASSWORD AND INFO */
    update  user_account
       set  password_expiration_date = l_pw_expiration_dt,
            password  =   pkg_sv_security.fn_get_hash(l_user_id, p_new_password),
            password_update_date = sysdate,
            attempt_ctr = 0,
            account_locked = 'N',
            update_date = sysdate,
            updated_by = l_update_user_sid
    where user_sid = p_user_sid;
    commit;

   /* Get the email */
   select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = '2';

    l_body_html := l_body_html || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => l_email_address,
    p_from      => 'donotreply@region10.org',
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;
    
  /* LOG THE CHANGE */
  pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => l_user_sid,
            p_user_id => l_update_user_id,
            p_log_message => 'Manual User Password Reset: '||l_user_id,
            p_action_type => 'Password Reset',
            p_action_result => 'Successfully Reset User Password, Notification Email Sent',
            p_attempts => 1,
            p_user_ip_address => OWA_UTIL.get_cgi_env ('REMOTE_ADDR'),
            p_browser => OWA_UTIL.GET_CGI_ENV('HTTP_USER_AGENT'));

END  proc_manual_pw_reset ;

PROCEDURE proc_send_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   )

IS
    l_email_subject             VARCHAR2 (90);
    l_email_application_link    VARCHAR2 (400);
    l_email_salutation          VARCHAR2 (400);
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_user_sid number;
    l_user_id varchar2(90);
    l_password_expiration_date date;
    l_user_first_name varchar2(50);
    l_user_last_name varchar2(50);
    l_email_address varchar2(90);
    l_account_locked varchar2(1);
    l_active_account_flag varchar2(1);
    l_district_sid number;
    l_attempt_ctr number;
    l_last_login_date date;
    l_first_login_flag varchar2(1);

BEGIN

   /* Get the user info */

   select user_sid,   user_id,    password_expiration_date,  user_first_name,   user_last_name,    email_address, account_locked,  active_account_flag, district_sid, attempt_ctr, last_login_date , first_login_flag
    into l_user_sid, l_user_id, l_password_expiration_date,  l_user_first_name, l_user_last_name, l_email_address, l_account_locked, l_active_account_flag, l_district_sid, l_attempt_ctr, l_last_login_date, l_first_login_flag
    from user_account
   where upper(user_id)  = upper( p_email_to)  ;


   /* Get the email */

   select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = p_type;

 ---   l_body_html :=  ' Attn: ' || l_user_first_name || ' ' || l_user_last_name  || l_body_html ;
    l_body_html := l_body_html   || l_email_application_link || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => p_email_to,
    p_from      => p_email_from,
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;

END  proc_send_email ;

/* Populate Transaction Log 
20130603    T. Esposito     proc adds browswer info to transaction log
*/

PROCEDURE proc_log_trans
   ( p_USER_SID				IN NUMBER
		,p_USER_ID				IN VARCHAR2
		,p_LOG_MESSAGE			IN VARCHAR2
		,p_ACTION_TYPE			IN VARCHAR2
		,p_ACTION_RESULT		IN VARCHAR2
		,p_ATTEMPTS				IN NUMBER
		,p_USER_IP_ADDRESS		IN VARCHAR2
    ,p_BROWSER		IN VARCHAR2 DEFAULT NULL)          
IS

BEGIN
  
  insert into security_transaction_log
  (security_transaction_sid, user_sid, user_id, transaction_date,
    log_message, action_type, action_result, attempts, user_ip_address, browser)
values
  ( SID_SEQUENCE.NEXTVAL  , p_user_sid, p_user_id, sysdate  ,
    p_log_message, p_action_type, p_action_result, p_attempts, p_user_ip_address, p_browser);
	commit;

END  proc_log_trans ;

PROCEDURE proc_good_login
          (  p_USER_SID				IN number   )
IS
  l_date date  := sysdate;

BEGIN
  update user_account
     set attempt_ctr = 0,
         last_login_date =  l_date,
         first_login_flag = 'N'
   where user_sid = p_USER_SID;
	commit;

END  proc_good_login  ;


PROCEDURE proc_disable_account
          (  p_USER_SID				IN number   )
IS
     l_date date  := sysdate;
BEGIN
   update  user_account
       set  password_expiration_date = l_date,
            password  =   'LOCKED',
            password_update_date =  l_date ,
            account_locked = 'Y',
            active_account_flag = 'N'
    where user_sid = p_USER_SID;
    commit;

END  proc_disable_account  ;

FUNCTION fn_attempt_login  (p_USER_SID IN number   )
RETURN number
AS
 l_date date  := sysdate;
 return_attempts number  ;
BEGIN
   update user_account
      set attempt_ctr = attempt_ctr + 1,
          last_login_date =  l_date
    where user_sid = p_USER_SID;
   commit;

	select attempt_ctr into  return_attempts
	  from user_account
	 where user_sid = p_USER_SID;

RETURN return_attempts ;
EXCEPTION
when NO_DATA_FOUND
   then return 329;
 when others
    then raise_application_error(-329,'Unknown Exception in fn_set_role Function');
END fn_attempt_login ;

PROCEDURE proc_push_email_queue
IS
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   EXECUTE IMMEDIATE 'BEGIN APEX_MAIL.PUSH_QUEUE;  COMMIT;   END; ';
END  proc_push_email_queue ;

END pkg_sv_acct_mgmt;
/

prompt
prompt Creating package body PKG_SV_SECURITY
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA.pkg_sv_security
AS
PROCEDURE proc_login
          (
           p_uname IN VARCHAR2
          ,p_password IN VARCHAR2
          ,p_session_id IN VARCHAR2
          ,p_flow_page IN VARCHAR2
          )
IS

BEGIN

 -- This logic is a demonstration of how to redirect
 -- to different pages depending on who successfully
 -- authenticates.
 -- If this is a first time user they must set up their question before using the application
 -- JCS 329 is Distict/Campus Page  & 20 is campus Detail will add VPD to that next
 -- CB: this logic does not seem to work for redirection it is handled in the javascript due to the FSP_AFTER_LOGIN_URL
 --     that control where to go to authenticated pages.

 wwv_flow_custom_auth_std.login
 (
  p_uname => p_uname,
  p_password => p_password,
  p_session_id => p_session_id
  );

EXCEPTION
WHEN OTHERS
THEN
 RAISE;
END  proc_login;

-- Function to Perform a oneway hash of the users
-- passwords. This cannot be reversed. This exmaple
-- is a very week hash and if been used on a production
-- system, you may want to use a stronger hash algorithm.
-- Read the Documentation for more info on DBMS_CRYPTO as
-- this is the supported package from Oracle and
-- DBMS_OBFUSCATION_TOOLKIT is now depricated.
FUNCTION fn_get_hash (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN VARCHAR2
AS
l_salt number := 212766598868984903361199164230874393486;
BEGIN
RETURN DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(UPPER(p_username) || l_salt || p_password),DBMS_CRYPTO.HASH_SH1);

/*DBMS_OBFUSCATION_TOOLKIT.md5 (
input_string => UPPER (p_username)
                || '/'
                || UPPER (p_password));*/
END fn_get_hash;

PROCEDURE proc_valid_user2 (p_username IN VARCHAR2, p_password IN VARCHAR2)
AS
v_dummy VARCHAR2 (1);
BEGIN
SELECT '1'
INTO v_dummy
FROM USER_ACCOUNT
WHERE UPPER (USER_ACCOUNT.USER_ID) = UPPER (p_username)
     AND USER_ACCOUNT.PASSWORD = fn_get_hash(p_username, p_password)
     AND USER_ACCOUNT.ACTIVE_ACCOUNT_FLAG = 'Y';
EXCEPTION
WHEN NO_DATA_FOUND
THEN raise_application_error (-20000, 'Invalid username / password.');
END  proc_valid_user2;

FUNCTION fn_valid_user (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN BOOLEAN
AS
BEGIN
proc_valid_user2 (UPPER (p_username), p_password);
RETURN TRUE;
EXCEPTION
WHEN OTHERS
THEN RETURN FALSE;
END fn_valid_user;

FUNCTION fn_valid_user_sql (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN varchar2
AS
BEGIN
proc_valid_user2 (UPPER (p_username), p_password);
RETURN 'T';
EXCEPTION
WHEN OTHERS
THEN RETURN 'F';
END fn_valid_user_sql;

/* ***********************************************************************************
Purpose:    This Procedure drives the refresh of the security tables for Dropout and RevealReporter by
            determining which applications are active and need refreshing.

This Procedure first deletes all records from the tables.

07/13/12 CBull  Original Creation
12/17/12 CBull  modified to handle dws and reveal TxEIS.
*********************************************************************************** */
procedure prc_load_reveal_security_table
is
type r_application is record ( application_alias    application.application_alias%TYPE,
                               active_flag          application.active_flag%TYPE);
type t_application is table of r_application INDEX BY pls_integer;

v_application_list t_application; -- list of applications

begin

  -- select all applications were the active flag = 'Y' --
  select
     application.application_alias
    ,application.active_flag
  bulk collect into v_application_list
  from application;

  if v_application_list.count > 0 then
    for i in v_application_list.first..v_application_list.last
      loop
        if v_application_list(i).application_alias = 'DWS' THEN
           pkg_dws_security.prc_load_dws_security_table;
        end if;
        if v_application_list(i).application_alias = 'REVRPTR' THEN
           pkg_txeis_security.prc_load_txeis_security_table;
        end if;
     end loop;
   end if;

end prc_load_reveal_security_table;

/* ***********************************************************************************
Purpose:    This Procedure OVERLOADS the prc_load_reveal_security_table and builds the
            security tables for Dropout and RevealReporter for a SINGLE USER.
            It calls the appropriate package based on application or in the case of
            reveal reporter application and source system.

01/23/13 CBull  Original Creation
04/05/13 CBull  modified query for pulling source to include a union that pulls source
                when user only has a user report assigned.
*********************************************************************************** */
procedure prc_load_reveal_security_table(p_user_sid IN number)
is

type r_user_role is record ( userId      user_account.user_id%TYPE,
                             application_alias       application.application_alias%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

type t_source_system is varray(10) of varchar2(30);

v_source_system t_source_system := t_source_system();

begin
  select
     user_account.user_id
    ,upper(application.application_alias)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.application_alias) <> 'REVIDMGR'
  where user_account.user_sid = p_user_sid
  order by user_account.user_id,upper(application.application_alias);

  if v_user_role_list.count > 0 then

    for i in v_user_role_list.first..v_user_role_list.last
      loop
        if v_user_role_list(i).application_alias = 'DWS' THEN
           pkg_dws_security.prc_load_dws_security_table(p_user_sid);
           -- log the transaction --
           pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => p_user_sid,
                                          p_user_id => v_user_role_list(i).userId,
                                          p_log_message => 'DWS:User student security table updated',
                                          p_action_type => 'Security',
                                          p_action_result => 'successful',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
        end if;
        if v_user_role_list(i).application_alias = 'REVRPTR' THEN
          -- get the source systems for this user --
          select distinct source_name
          bulk collect into v_source_system
          from (select distinct source.source_name
                          from source
                          join report_category on report_category.source_sid = source.source_sid
                          join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
                          join user_account on user_account.user_sid = user_report_category.user_sid
                          where user_account.user_id = v_user_role_list(i).userId
                union
                select distinct source.source_name
                          from source
                          join report_category on report_category.source_sid = source.source_sid
                          join report_list on report_list.report_category_sid = report_category.report_category_sid
                          join user_report on user_report.report_list_sid = report_list.report_list_sid
                          join user_account on user_account.user_sid = user_report.user_sid
                          where user_account.user_id = v_user_role_list(i).userId
                ) report_source;

          if v_source_system.count > 0 then
            for x in v_source_system.first..v_source_system.last
              loop -- loop through user source systems, only TxEIS at this time --
                if v_source_system(x) = 'TxEIS' then
                   pkg_txeis_security.prc_load_txeis_security_table(p_user_sid);
                   -- log the transaction --
                   pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => p_user_sid,
                                                  p_user_id => v_user_role_list(i).userId,
                                                  p_log_message => 'TxEIS:User student security table updated',
                                                  p_action_type => 'Security',
                                                  p_action_result => 'successful',
                                                  p_attempts => 0,
                                                  p_user_ip_address => null,
                                                  p_browser => null);
                end if;
                -- additional source systems go here --
              end loop;
          else
            pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => p_user_sid,
                                                  p_user_id => v_user_role_list(i).userId,
                                                  p_log_message => 'TxEIS:User student security table update unsuccessful. (No Source Found)',
                                                  p_action_type => 'Security',
                                                  p_action_result => 'Failed',
                                                  p_attempts => 0,
                                                  p_user_ip_address => null,
                                                  p_browser => null);
          end if;
        end if;
      end loop;
  end if;

end prc_load_reveal_security_table;
/* ***********************************************************************************
Purpose:    This Procedure Performs an LDAP look up on email address and then attempts to 
            bind the distinguished name and users password for authentication.

07/20/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION ldap_auth(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
)
RETURN BOOLEAN IS
  l_ldap_host     VARCHAR2(256) := 'appauth.esc10.org';
  --l_ldap_port     NUMBER        := 3269; --ssl
  l_ldap_port     NUMBER        := 3268; --open
  l_ldap_base     VARCHAR2(256);
  l_sa_name       VARCHAR2(256) := 'CN=ADBind,CN=Managed Service Accounts,DC=REGION10,DC=ESC10,DC=ORG';
  l_sa_pw         VARCHAR2(256) := 'S7uckH3r3!';
  l_wallet_dir    VARCHAR2(256) := 'file:/u01/app/oracle/product/11.2.0/xe/wallet';  -- old
--  l_wallet_dir    VARCHAR2(256) := 'file:/u01/app/oracle/product/12.1/db_1/wallet';  -- new
  l_user_dn       VARCHAR2(256) := NULL;
  l_user_sid      NUMBER;
  l_account_locked CHAR;
  /*l_new_user_flag  CHAR := 'N';*/

  l_retval        PLS_INTEGER;
  l_session       DBMS_LDAP.session;
  l_attrs         DBMS_LDAP.string_collection;
  l_message       DBMS_LDAP.message;
  l_entry         DBMS_LDAP.message;
  l_attr_name     VARCHAR2(256);
  l_ber_element   DBMS_LDAP.ber_element;
  l_vals          DBMS_LDAP.string_collection;

BEGIN
  -- Verify that the user password/id are not null.  A null Password will not result in an exception
  -- and gives the appearance that the bind succeeded.
  IF p_username is null or p_password is null THEN
    APEX_UTIL.set_custom_auth_status(p_status => 'User ID/Password Required');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'User ID/Password Required',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RETURN FALSE;
  END IF;
  
  -- determine if the user is internal or external to region10 and set connection info.
  IF upper(substr(p_username,instr(p_username,'@',1)+1)) = 'REGION10.ORG' THEN
      l_ldap_base  := 'dc=region10,dc=esc10,dc=org';
  ELSE
      l_ldap_base  := 'ou='||Upper(substr(p_username,1,1))||',dc=appauth,dc=esc10,dc=org';
  END IF;
  -- Choose to raise exceptions.
  DBMS_LDAP.use_exception := TRUE;
  
  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => l_ldap_host,
                              portnum  => l_ldap_port);
  
  -- open ssl connection for secure communications   
  --l_retval := DBMS_LDAP.open_ssl(l_session,l_wallet_dir,'extrct1',2);

  -- bind the service account
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                      dn     => l_sa_name,
                                      passwd => l_sa_pw);
  
   /********************************************
     issue the search for the DN based on the email address 
   ********************************************/
  l_attrs(1) := 'DistinguishedName'; -- retrieve distinguished name based on the email address 
  l_retval := DBMS_LDAP.search_s(ld       => l_session, 
                                 base     => l_ldap_base, 
                                 scope    => DBMS_LDAP.SCOPE_SUBTREE,
                                 filter   => 'mail='||p_username,
                                 attrs    => l_attrs,
                                 attronly => 0,
                                 res      => l_message);

  IF DBMS_LDAP.count_entries(ld => l_session, msg => l_message) > 0 THEN
    -- Get all the entries returned by our search.
    l_entry := DBMS_LDAP.first_entry(ld  => l_session,
                                     msg => l_message);

    << entry_loop >>
    WHILE l_entry IS NOT NULL LOOP
      -- Get all the attributes for this entry.

      l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session,
                                               ldapentry => l_entry,
                                               ber_elem  => l_ber_element);
      << attributes_loop >>
      WHILE l_attr_name IS NOT NULL LOOP
        -- Get all the values for this attribute.
        l_vals := DBMS_LDAP.get_values (ld        => l_session,
                                        ldapentry => l_entry,
                                        attr      => l_attr_name);
        << values_loop >>
        FOR i IN l_vals.FIRST .. l_vals.LAST LOOP
          --DBMS_OUTPUT.PUT_LINE('ATTIBUTE_NAME: ' || l_attr_name || ' = ' || SUBSTR(l_vals(i),1,200));
          l_user_dn := l_vals(i);
        END LOOP values_loop;
        l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session,
                                                ldapentry => l_entry,
                                                ber_elem  => l_ber_element);
      END LOOP attibutes_loop;
      l_entry := DBMS_LDAP.next_entry(ld  => l_session,
                                      msg => l_entry);
    END LOOP entry_loop;
  ELSE
    --DBMS_OUTPUT.PUT_LINE('Search for Email returned zero results');
    APEX_UTIL.set_custom_auth_status(p_status => 'Invalid User Id/Password');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'User name(email) not found',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    Return FALSE;
  END IF;
  /********************************************
     Auth with the users DN and Password 
   ********************************************/
  -- end the previous session --
  DBMS_LDAP.use_exception := TRUE;
  l_retval := DBMS_LDAP.unbind_s(ld => l_session);
  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => l_ldap_host,
                            portnum  => l_ldap_port);
  -- open ssl connection
  --l_retval := DBMS_LDAP.open_ssl(l_session,l_wallet_dir,'extrct1',2);

  -- attempt to bind with user DN and Password
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                    dn     => l_user_dn,
                                    passwd => p_password);
  -- Unbind the session as it is not needed anymore
  l_retval := DBMS_LDAP.unbind_s(ld => l_session);
  
  -- if we got this far then the user was authenticated, update the user record based on successful login.
  -- or insert the user if they don't exist.
  begin
  Select user_account.user_sid
        ,user_account.account_locked
    into l_user_sid
        ,l_account_locked
    from user_account
   where user_account.user_id = upper(p_username);
   -- update the user account if not locked, if locked return FALSE
   IF l_account_locked = 'Y' THEN
     APEX_UTIL.set_custom_auth_status(p_status => 'Your User Account is locked, Please contact the System Admin');
     APEX_UTIL.SET_AUTHENTICATION_RESULT(2);
     pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Login Rejected - Account Locked',
                                          p_action_type => 'Login',
                                          p_action_result => 'Rejected',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
     Return FALSE;
   ELSE
     PKG_IDMGR_USER_ACCOUNT.PROC_UPD_USER_ACCOUNT_LOGIN_DT (P_USER_SID => l_user_sid); 
     APEX_UTIL.SET_AUTHENTICATION_RESULT(0);
     -- Get and set the users default application
     APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||pkg_idmgr_user_account.fn_get_usr_default_application(p_user_sid => l_user_sid)||':HOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));
   END IF;
  exception 
    when no_data_found then
      -- insert a record into the user_account Table
      PKG_IDMGR_USER_ACCOUNT.PROC_INS_USER_ACCOUNT (
                              P_USER_ID                  => p_username,
                              P_USER_FIRST_NAME          => null,
                              P_USER_LAST_NAME           => null,
                              P_EMAIL_ADDRESS            => p_username,
                              P_SUPER_USER               => 'N'); 
       
       /*l_new_user_flag := 'Y';*/
       APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||V('APP_ID')||':WELCOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));
  END;
  -- log the successfull login
  pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Login Authenticated',
                                          p_action_type => 'Login',
                                          p_action_result => 'Success',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
                                          
  
  -- !!!!!!!!!! No exceptions mean you are authenticated. !!!!!!!!!!!! 
  -- determine where to send the user, either the welcome page or their default app
/*  IF l_new_user_flag = 'N' THEN
    APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||pkg_idmgr_user_account.fn_get_usr_default_application(p_user_sid => l_user_sid)||':HOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));  
  END IF;  */                  

  RETURN TRUE;
  
EXCEPTION
  WHEN DBMS_LDAP.init_failed THEN
    DBMS_OUTPUT.PUT_LINE(RPAD('simple_bind_s Returns ',25,' ') || ': Unable to connect to LDAP Server');
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'LDAP Connection Failed',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RAISE;
  WHEN DBMS_LDAP.GENERAL_ERROR THEN
    -- the general error will be raised for many different problems. One of which is "Invalid credentials", 
    -- so if the this one is raised then simply return false.  Any other errors, re-raise the exception.
    IF INSTR(SQLERRM,'Invalid credentials',1) > 0 THEN 
      DBMS_OUTPUT.PUT_LINE('Incorrect username and/or password ');
      APEX_UTIL.set_custom_auth_status(p_status => 'Invalid Username/Password');
      APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
      -- Increment the attempt counter if the user exists.
      PKG_IDMGR_USER_ACCOUNT.PROC_UPD_USER_MISSED_LOGIN (
                                          P_USER_ID  => UPPER(p_username));
      -- log the failed login
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Incorrect username and/or password',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    ELSE
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK());
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
      APEX_UTIL.set_custom_auth_status(p_status => 'An error occurred in the login process. Try again or contact the system administrator.');
      APEX_UTIL.SET_AUTHENTICATION_RESULT(3);
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => SQLCODE||': '||SUBSTR(SQLERRM,1,200),
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
      RAISE;
    END IF;
    Return FALSE;
  WHEN OTHERS THEN
    -- An unknown error occured, re-raise the exception
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK());
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
    l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    APEX_UTIL.set_custom_auth_status(p_status => 'An error occurred in the login process. Try again or contact the system administrator.');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(3);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => SQLCODE||': '||SUBSTR(SQLERRM,1,200),
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RAISE;   
END ldap_auth;

END pkg_sv_security;
/

prompt
prompt Creating package body PKG_TIMS_DATAMART
prompt =======================================
prompt
create or replace package body timsrptdata.PKG_TIMS_DATAMART is

-- globals

  -- Function and procedure implementations

-- three functions below are used to calculate working time elapsed between towo dates and times

--If the start time is outside the work hours, modify the start time to next nearest start time.
FUNCTION modify_start_time (p_in_dte DATE) RETURN DATE IS
BEGIN
    IF p_in_dte - TRUNC (p_in_dte) < (c_work_start_hr / 24)
    THEN
       RETURN TRUNC (p_in_dte) + (c_work_start_hr / 24);
    ELSIF p_in_dte - TRUNC (p_in_dte) > (c_work_end_hr / 24)
    THEN
       RETURN TRUNC (p_in_dte) + 1 + (c_work_start_hr / 24);
    ELSE
       RETURN p_in_dte;
    END IF;
END;

-- If the finish time is outside the work hours, modify it to the previous nearest finish time.
FUNCTION modify_finish_time (p_in_dte DATE) RETURN DATE IS
BEGIN

    IF p_in_dte - TRUNC (p_in_dte) > (c_work_end_hr / 24)
    THEN
       RETURN TRUNC (p_in_dte) + (c_work_end_hr / 24);
    ELSIF p_in_dte - TRUNC (p_in_dte) < (c_work_start_hr / 24)
    THEN
       RETURN TRUNC (p_in_dte) - 1 + (c_work_end_hr / 24);
    ELSE
       RETURN p_in_dte;
    END IF;

END;

-- This function finds the no of days to be excluded while calculating the duration.
FUNCTION get_hrs_to_exclude (p_in_start_date     DATE,
                              p_in_finish_date    DATE) RETURN NUMBER
IS
   l_num_holidays NUMBER;
BEGIN
    WITH cte --get all days between start and finish date
         AS (    SELECT p_in_start_date + LEVEL - 1 dte
                   FROM DUAL
             CONNECT BY LEVEL <= p_in_finish_date + 1 - p_in_start_date)
    SELECT COUNT (1) * c_work_hrs_per_day     -- all weekends/holidays take out the work day hours
      INTO l_num_holidays
      FROM cte
     WHERE TO_CHAR (dte, 'dy') in ('sat', 'sun');    --find the count of weekend days

           /* future
           OR dte IN     --fins the count of holidays, assuming leaves are stored in separate table
                 (SELECT leave_date
                    FROM leaves
                   WHERE leave_date BETWEEN p_in_start_date
                                        AND p_in_finish_date);
            */

    l_num_holidays :=
       l_num_holidays + ( (p_in_finish_date - p_in_start_date) * (24 - c_work_hrs_per_day)); --also, if the dates span more than a day find the non working hours.

RETURN l_num_holidays;

END;

FUNCTION get_work_hrs (p_in_start_date     DATE,
                              p_in_finish_date    DATE) RETURN NUMBER
IS
   l_work_hrs NUMBER;
   l_hrs_excluded NUMBER;
BEGIN

    l_work_hrs := ((modify_finish_time(p_in_finish_date )- modify_start_time(p_in_start_date)) * 24 );

    l_hrs_excluded :=  get_hrs_to_exclude(TRUNC (modify_start_time(p_in_start_date)),
                                  TRUNC (modify_finish_time(p_in_finish_date )));

    l_work_hrs := greatest(l_work_hrs - l_hrs_excluded,0);

return l_work_hrs;

END;

-- this function gets the prior full week begin date, given a date
FUNCTION get_prior_week_start_date (p_in_dte DATE) RETURN DATE
IS
  v_date date;
BEGIN
WITH prior_wk AS (
SELECT max(date_dim.date_id) end_date
FROM date_dim
WHERE date_dim.date_id <= p_in_dte
and date_dim.day_of_week = 7
)
SELECT max(date_dim.date_id) INTO v_date
FROM date_dim
JOIN prior_wk ON date_dim.date_id < prior_wk.end_date
WHERE date_dim.day_of_week = 1;

return v_date;

END;

FUNCTION get_prior_week_end_date (p_in_dte DATE) RETURN DATE
  IS
  v_date date;
BEGIN


SELECT max(date_dim.date_id) into v_date
FROM date_dim
WHERE date_dim.date_id <= p_in_dte
and date_dim.day_of_week = 7;

-- note: add 0.999999 day to be inclusive since the time component is midnight
v_date := v_date + 0.99999;

return v_date;

END;

end PKG_TIMS_DATAMART;
/

prompt
prompt Creating package body PKG_TXEIS_SECURITY
prompt ========================================
prompt
create or replace package body timsrptdata.PKG_TXEIS_SECURITY is

  -- Private type declarations
  
  -- Private constant declarations

  -- Private variable declarations

  -- Function and procedure implementations

/* ***********************************************************************************
Purpose:    This Procedure builds the security table for TXEIS to use by 
            pulling all the users and their roles.  Campus users have the student sids for their 
            assigned campuses loaded while district users have their user_id and -9999 loaded for 
            stu_id to indicate all students in the district. TxEIS uses the txstu_user_student_security
            table which also has sch_yr in it and is set to 9999 for district users.

This Procedure first deletes all records from the tables.

01/23/13 CBull  Original Creation
*********************************************************************************** */
procedure prc_load_txeis_security_table
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_alias application.application_alias%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

v_source_system varchar2(30);

begin

  -- delete all data from the table. --
  delete from txstu_user_student_security;
  -- select all users and their roles --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.application_alias)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.application_alias) = 'REVRPTR'
  join role_master         on role_master.role_sid = application_role.role_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  if v_user_role_list.count > 0 then
    for i in v_user_role_list.first..v_user_role_list.last
      loop
        -- get the source system for this user to verify that they are a TxEIS user --
        begin 
          select distinct source_name
          into v_source_system
          from (select distinct source.source_name
                from source
                join report_category on report_category.source_sid = source.source_sid
                join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
                join user_account on user_account.user_sid = user_report_category.user_sid
                where user_account.user_id = v_user_role_list(i).userId
                  and source.source_name = 'TxEIS'
                union
                select distinct source.source_name
                      from source
                      join report_category on report_category.source_sid = source.source_sid
                      join report_list on report_list.report_category_sid = report_category.report_category_sid
                      join user_report on user_report.report_list_sid = report_list.report_list_sid
                      join user_account on user_account.user_sid = user_report.user_sid
                      where user_account.user_id =  v_user_role_list(i).userId
                        and source.source_name = 'TxEIS'
                ) report_source;
        exception
          when no_data_found then 
            v_source_system := 'NotFound';
        end;
        if v_source_system = 'TxEIS' then   
            if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
               insert into txstu_user_student_security
                select distinct
                 user_account.user_id
                ,sr_stu_enroll.sch_yr
                ,sr_stu_enroll.stu_id
                from user_account
                join user_campus on user_campus.user_sid = user_account.user_sid
                join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
                join sr_stu_enroll on sr_stu_enroll.campus_id = campus_master.school_id
                where user_account.user_id = v_user_role_list(i).userId;
             else -- district users --
               -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
               -- technically should have one or the other. we are allowing both to have full district wide
               -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
               -- add the user if it's the first row of the collection else skip the row in the collection if
               -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
               -- application.
               if i != v_user_role_list.FIRST
                  and v_user_role_list(i).role = 'DISTRICT_USER'
                  and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
                  and v_user_role_list(i).application_alias = v_user_role_list(v_user_role_list.PRIOR(i)).application_alias then
                  -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
                 null; -- skip to the next record this user has already been recorded as having distict wide data access --
               else
                 insert into txstu_user_student_security
                 (user_id, sch_yr, stu_id)
                 values
                 (v_user_role_list(i).userId, 9999, -9999);
               end if;
            end if;  
        end if;
      commit;
     end loop;
   end if;

end prc_load_txeis_security_table;

/* ***********************************************************************************
Purpose:    This Procedure OVERLOADS the prc_load_txeis_security_table and builds the 
            security table for txeis for a SINGLE USER. 
            Campus users have the student sids for their 
            assigned campuses loaded while district users have their user_id and -9999 loaded for 
            stu_id to indicate all students in the district. TxEIS uses the txstu_user_student_security
            table which also has sch_yr in it and is set to 9999 for district users.

This Procedure first deletes all records from the tables for the specified p_user_id.

12/17/12 CBull  Original Creation
*********************************************************************************** */
procedure prc_load_txeis_security_table (p_user_sid IN number) 
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_alias application.application_alias%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

v_source_system varchar2(30);

begin

  -- delete all data from the table. --
  delete from txstu_user_student_security
  where user_id = (select user_account.user_id from user_account where user_account.user_sid = p_user_sid);
  -- select the user and their role --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.application_alias)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.application_alias) = 'REVRPTR'
  join role_master         on role_master.role_sid = application_role.role_sid
  where user_account.user_sid = p_user_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  if v_user_role_list.count > 0 then
    for i in v_user_role_list.first..v_user_role_list.last
      loop
        -- get the source system for this user to verify that they are a TxEIS user --
        begin 
        select distinct source_name
          into v_source_system
          from (select distinct source.source_name
                from source
                join report_category on report_category.source_sid = source.source_sid
                join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
                join user_account on user_account.user_sid = user_report_category.user_sid
                where user_account.user_id = v_user_role_list(i).userId
                  and source.source_name = 'TxEIS'
                union
                select distinct source.source_name
                      from source
                      join report_category on report_category.source_sid = source.source_sid
                      join report_list on report_list.report_category_sid = report_category.report_category_sid
                      join user_report on user_report.report_list_sid = report_list.report_list_sid
                      join user_account on user_account.user_sid = user_report.user_sid
                      where user_account.user_id =  v_user_role_list(i).userId
                        and source.source_name = 'TxEIS'
                ) report_source;
        exception
          when no_data_found then 
            v_source_system := 'NotFound';
        end;
        if v_source_system = 'TxEIS' then   
            if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
               insert into txstu_user_student_security
                select distinct
                 user_account.user_id
                ,sr_stu_enroll.sch_yr
                ,sr_stu_enroll.stu_id
                from user_account
                join user_campus on user_campus.user_sid = user_account.user_sid
                join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
                join sr_stu_enroll on sr_stu_enroll.campus_id = campus_master.school_id
                where user_account.user_id = v_user_role_list(i).userId;
             else -- district users --
               -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
               -- technically should have one or the other. we are allowing both to have full district wide
               -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
               -- add the user if it's the first row of the collection else skip the row in the collection if
               -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
               -- application.
               if i != v_user_role_list.FIRST
                  and v_user_role_list(i).role = 'DISTRICT_USER'
                  and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
                  and v_user_role_list(i).application_alias = v_user_role_list(v_user_role_list.PRIOR(i)).application_alias then
                  -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
                 null; -- skip to the next record this user has already been recorded as having distict wide data access --
               else
                 insert into txstu_user_student_security
                 (user_id, sch_yr, stu_id)
                 values
                 (v_user_role_list(i).userId, 9999, -9999);
               end if;
            end if;  
        end if;
      commit;
     end loop;
   end if;

end prc_load_txeis_security_table;

end PKG_TXEIS_SECURITY;
/

prompt
prompt Creating package body PKG_UTILITIES
prompt ===================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."PKG_UTILITIES"
AS

/***********************************************************************************************************
************************************************************************************************************
************************************************************************************************************/

/*----------------------------------------------------------------------------------------------------------
 *   FUNCTION: fn_GET_ELAPSED_TIME
 *
 *   Function that calculates and returns the elapsed duration in seconds.
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_start_time                         The time that the execution started
 *    p_end_time                           The time that the execution ended
 *    p_elapsed_time                       The duration, in seconds, of this execution. E.g., p_start_time - p_end_time
 *                                         in seconds
 *---------------------------------------------------------------------------------------------------------*/

FUNCTION fn_GET_ELAPSED_TIME(
p_start_datetime TIMESTAMP := SYSTIMESTAMP
, p_end_datetime TIMESTAMP := SYSTIMESTAMP
)

RETURN NUMBER
IS

v_elapsed_seconds      NUMBER(10,6);

BEGIN

v_elapsed_seconds := null;
BEGIN
    select
      round(to_number(  extract (day from (p_end_datetime - p_start_datetime)) * 24 * 60 * 60
      + extract (hour from (p_end_datetime - p_start_datetime)) * 60 * 60
      + extract (minute from (p_end_datetime - p_start_datetime)) * 60
      + extract (second from (p_end_datetime - p_start_datetime))),6)
    into v_elapsed_seconds
    from dual;
    exception
             when NO_DATA_FOUND then null;
         when others then
                proc_ETL_LOG_EVENT('FN_GET_ELAPSED_TIME','ERROR','PL/SQL Function','Failed',SQLCODE,substr((SQLERRM || ';' || dbms_utility.format_error_backtrace),1,200),null,('Start Time: '||p_start_datetime||'; End Time: '||p_end_datetime),null,null,null);
END;

return v_elapsed_seconds;

END fn_get_elapsed_time;


/***********************************************************************************************************
************************************************************************************************************
************************************************************************************************************/

/*----------------------------------------------------------------------------------------------------------
 *   PROCEDURE: proc_ETL_LOG_EVENT
 *
 *   Procedure for loading the ETL_EVENT_LOG table.  Table column values EVENT_TIME, USER_ID, and
 *   TERMINAL_ID are automatically generated and as such do not need to be passed to this procedure.
 *
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_job_name                           The name of the job that is being run
 *    p_event_type                         The type of event.  Values: Warning, Informational, Error
 *    p_source_name                        The name of the application that threw the error.  Values: Cognos,
 *                                         PL/SQL, Perl, SQL*Loader, Other
 *    p_status                             The result of this current execution.  Values: Started, Running,
 *                                         Failed, Succeeded
 *    p_error_code                         The code of the error thrown
 *    p_rows_affected_count                The number of rows that were inserted as a result of this execution
 *    p_comments                           Comments related to this execution
 *    p_start_time                         The time that this execution started
 *    p_end_time                           The time that this execution ended
 *    p_elapsed_time                       The duration, in seconds, of this execution. E.g., p_start_time - p_end_time
 *---------------------------------------------------------------------------------------------------------*/
PROCEDURE proc_ETL_LOG_EVENT(
p_job_name                VARCHAR2
,p_event_type             VARCHAR2
,p_source_name            VARCHAR2
,p_status                 VARCHAR2
,p_error_code             VARCHAR2
,p_error_message          VARCHAR2
,p_rows_affected_count    NUMBER
,p_comments               VARCHAR2
,p_start_time             TIMESTAMP
,p_end_time               TIMESTAMP
,p_elapsed_time           NUMBER
)

IS

BEGIN

-------------------- Load the ETL_EVENT_LOG table -----------------------------------
insert into etl_event_log
values(
p_job_name
,systimestamp                             --generated event_time
,p_event_type
,p_source_name
,p_status
,p_error_code
,substr(p_error_message,1,200)
,user                                     --generated user_id
,USERENV('TERMINAL')                      --generated terminal_id
,p_rows_affected_count
,p_comments
,p_start_time
,p_end_time
,p_elapsed_time
);

commit;

exception
  when others then raise;

END proc_ETL_LOG_EVENT;

END pkg_UTILITIES;
/

prompt
prompt Creating package body pkg_sv_security
prompt =====================================
prompt
CREATE OR REPLACE PACKAGE BODY TIMSRPTDATA."pkg_sv_security"
AS
PROCEDURE proc_login
          (
           p_uname IN VARCHAR2
          ,p_password IN VARCHAR2
          ,p_session_id IN VARCHAR2
          ,p_flow_page IN VARCHAR2
          )
IS
 lv_goto_page            varchar2(10) := 'HOME';
 v_application_alias     varchar2(20) := 'REVIDMGR';
BEGIN

 -- This logic is a demonstration of how to redirect
 -- to different pages depending on who successfully
 -- authenticates.
 -- If this is a first time user they must set up their question before using the application
 -- JCS 329 is Distict/Campus Page  & 20 is campus Detail will add VPD to that next
 -- CB: this logic does not seem to work for redirection it is handled in the javascript due to the FSP_AFTER_LOGIN_URL
 --     that control where to go to authenticated pages.

 wwv_flow_custom_auth_std.login
 (
  p_uname => p_uname,
  p_password => p_password,
  p_session_id => p_session_id,
  p_flow_page => v_application_alias || ':' || lv_goto_page
  );

EXCEPTION
WHEN OTHERS
THEN
 RAISE;
END  proc_login;


PROCEDURE proc_login_first
          (
           p_uname IN VARCHAR2
          ,p_password IN VARCHAR2
          ,p_session_id IN VARCHAR2
          ,p_flow_page IN VARCHAR2
          )
IS
BEGIN

 -- This logic is a demonstration of how to redirect
 -- to different pages depending on who successfully
 -- authenticates.
 -- If this is a first time user they must set up their question before using the application
-- JCS 329 is Distict/Campus Page  & 20 is campus Detail will add VPD to that next


 wwv_flow_custom_auth_std.login
 (
  p_uname => p_uname,
  p_password => p_password,
  p_session_id => p_session_id,
  p_flow_page => p_flow_page || ':' || 71
  );

EXCEPTION
WHEN OTHERS
THEN
 RAISE;
END  proc_login_first;


-- Function to Perform a oneway hash of the users
-- passwords. This cannot be reversed. This exmaple
-- is a very week hash and if been used on a production
-- system, you may want to use a stronger hash algorithm.
-- Read the Documentation for more info on DBMS_CRYPTO as
-- this is the supported package from Oracle and
-- DBMS_OBFUSCATION_TOOLKIT is now depricated.
FUNCTION fn_get_hash (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN VARCHAR2
AS
BEGIN
RETURN DBMS_OBFUSCATION_TOOLKIT.md5 (
input_string => UPPER (p_username)
                || '/'
                || UPPER (p_password));
END fn_get_hash;

PROCEDURE proc_valid_user2 (p_username IN VARCHAR2, p_password IN VARCHAR2)
AS
v_dummy VARCHAR2 (1);
BEGIN
SELECT '1'
INTO v_dummy
FROM USER_ACCOUNT
WHERE UPPER (USER_ID) = UPPER (p_username)
     AND "PASSWORD" = fn_get_hash(p_username, p_password);
EXCEPTION
WHEN NO_DATA_FOUND
THEN raise_application_error (-20000, 'Invalid username / password.');
END  proc_valid_user2;

FUNCTION fn_valid_user (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN BOOLEAN
AS
BEGIN
proc_valid_user2 (UPPER (p_username), p_password);
RETURN TRUE;
EXCEPTION
WHEN OTHERS
THEN RETURN FALSE;
END fn_valid_user;

FUNCTION fn_valid_user_sql (p_username IN VARCHAR2, p_password IN VARCHAR2)
RETURN varchar2
AS
BEGIN
proc_valid_user2 (UPPER (p_username), p_password);
RETURN 'T';
EXCEPTION
WHEN OTHERS
THEN RETURN 'F';
END fn_valid_user_sql;


FUNCTION fn_set_role (p_username IN VARCHAR2 )
RETURN varchar2
is
return_role varchar2(30);
BEGIN
 select role
 into return_role
 from user_apps_roles_v where UPPER(user_id) = UPPER (p_username)  ;
RETURN return_role ;
 exception
 when NO_DATA_FOUND
   then return '*No_Role_Set*';
 when others
    then raise_application_error(-329,'Unknown Exception in fn_set_role Function');
END fn_set_role;

FUNCTION fn_set_key (p_username IN VARCHAR2 )
RETURN varchar2
is
return_key varchar2(30);
BEGIN
 select district_key  into return_key
     from user_apps_roles_v v, district_dim d
    where d.district_sid = v.district_sid
      and  v.user_id = p_username  ;
RETURN return_key ;
 exception
 when NO_DATA_FOUND
   then return '*No_Key_Set*';
 when others
    then raise_application_error(-329,'Unknown Exception in fn_set_key Function');
END fn_set_key;


 FUNCTION fn_sv_get_user_district (p_username IN VARCHAR2)
 RETURN VARCHAR2
 IS
  return_val VARCHAR2 (200);
    cursor c1 is
      select  district_key into  return_val
        from user_account ua, district_dim cd
       where ua.user_id = p_username
         and ua.district_sid = cd.district_sid  ;

 BEGIN

 if (USER = 'DWS') and p_username is null  then
     return_val :=  'ONLY CALL THIS FROM APEX' ;
 else
     open c1;
     fetch c1 into return_val;
  END IF;

  close c1;
 RETURN return_val;
 exception
 when NO_DATA_FOUND
   then return '*No_District_Found*';
 when others
    then raise_application_error(-911,'Unknown Exception in FN_SV_GET_USER_DISTRICT ');
 END fn_sv_get_user_district;


 function  fn_sv_get_user_role ( p_username IN VARCHAR2 )
 RETURN VARCHAR2
 IS
  return_val VARCHAR2 (200);
   cursor c1 is
      select role  from user_apps_roles_v
        WHERE USER_ID =  p_username ;

 BEGIN

 if (USER = 'DWS') and p_username is null  then
     return_val :=  'ONLY CALL THIS FROM APEX' ;
 else
     open c1;
     fetch c1 into return_val;
  END IF;

  close c1;
 RETURN return_val;
 exception
 when NO_DATA_FOUND
   then return '*No_District_Found*';
 when others
    then raise_application_error(-911,'Unknown Exception in FN_SV_GET_USER_DISTRICT ');
 END   fn_sv_get_user_role ;



procedure proc_new_pwd
(
     p_username  in varchar2
    ,p_password  in varchar2
    ,p_password2 in varchar2
    ,p_password3 in varchar2
    ,return_msg out varchar2
)
is
  new_pwd_hash varchar2(50);
  valid_user_flag varchar2(1) := 'x';

begin
/*  dbms_output.put_line('start...'  || p_username || '...' );
 get hash for old and new password*/
 return_msg := 'Start' ;
new_pwd_hash:=fn_get_hash(upper(p_username), p_password2 );

valid_user_flag:= fn_valid_user_sql(upper(p_username), p_password );

 if p_password2 = p_password3
    and valid_user_flag = 'T' then

    update user_account
    set password = new_pwd_hash
    ,PASSWORD_EXPIRATION_DATE = sysdate + 90
    ,password_update_date = sysdate
    ,attempt_ctr = 0
    ,account_locked = 'N'
    ,FIRST_LOGIN_FLAG = 'N'
    ,last_login_date = sysdate
    where upper(user_id)  like upper(p_username);
    commit;

 return_msg :=  'Successful';
else
    valid_user_flag := 'n';
    return_msg :=  'Unsuccessful: '  ||  p_username ||'..'  ||  p_password  ||'..'  ||  p_password2  ||'..'  ||  p_password3 ;
end if;

EXCEPTION
WHEN NO_DATA_FOUND
THEN
raise_application_error (-20000, 'User does not exist. Please Register');

end proc_new_pwd;


procedure proc_new_answer
(
     p_username  in varchar2
    ,p_SQID  in number
    ,P_ANSWER in varchar2
    ,return_msg out varchar2
)
is
  v_sid number := 1 ;

begin

   select user_sid into v_sid
   from  USER_ACCOUNT where upper(user_id ) = upper(p_username);

  insert into user_security_question
    (user_security_question_sid, security_question_sid, user_sid, user_response)
  values
    (SID_sequence.nextval, p_SQID, v_sid, upper(P_ANSWER) );

  commit;

 return_msg :=  'Successful';

EXCEPTION
WHEN NO_DATA_FOUND
THEN
raise_application_error (-20000, 'User does not exist. Please Register');

end proc_new_answer ;

/* ***********************************************************************************
Purpose:    This Procedure builds the security tables for Dropout and RevealReport to use by
            pulling all the users and their roles.  Campus users have the student sids for their
            assigned campuses loaded while district users have their user_id and -9999 loaded for
            student_sid/stu_id to idicate all students in the district. TxEIS uses the txstu_user_student_security
            table which also has sch_yr in it and is set to 9999 for district users.

This Procedure first deletes all records from the tables.

07/13/12 CBull  Original Creation
12/17/12 CBull  modified to handle dws and reveal TxEIS.
*********************************************************************************** */
procedure prc_load_reveal_security_table
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_name application.description%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

type t_source_system is varray(10) of varchar2(30);

v_source_system t_source_system := t_source_system();

begin

  -- delete all data from the tables. --
  delete from user_student_security;
  delete from txstu_user_student_security;
  -- select all users and their roles --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.description)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.description) <> 'REVEAL ID MANAGER'
  join role_master         on role_master.role_sid = application_role.role_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  for i in v_user_role_list.first..v_user_role_list.last
    loop
      if v_user_role_list(i).application_name = 'DROPOUT WARNING' THEN
        if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
           insert into user_student_security
            select
            user_account.user_id
            ,user_account.district_sid
            ,student_dim.student_sid
            from user_account
            join student_dim on student_dim.district_sid = user_account.district_sid
            join user_campus on user_campus.user_sid = user_account.user_sid
            join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
            where student_dim.campus_security_key = 'TX*'||campus_master.campus_id
            and user_account.user_id = v_user_role_list(i).userId;
         else -- district users --
           -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
           -- technically should have one or the other. we are allowing both to have full district wide
           -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
           -- add the user if it's the first row of the collection else skip the row in the collection if
           -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
           -- application.
           if i != v_user_role_list.FIRST
              and v_user_role_list(i).role = 'DISTRICT_USER'
              and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
              and v_user_role_list(i).application_name = v_user_role_list(v_user_role_list.PRIOR(i)).application_name then
              -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
             null; -- skip to the next record this user has already been recorded as having distict wide data access --
           else
             insert into user_student_security
              (user_id, district_sid, student_sid)
             values
              (v_user_role_list(i).userId, v_user_role_list(i).districtSID, -9999);
           end if;
         end if;
      end if;
      if v_user_role_list(i).application_name = 'REVEAL REPORTER' THEN
        -- get the source systems for this user --
        select distinct source.source_name
        bulk collect into v_source_system
        from source
        join report_category on report_category.source_sid = source.source_sid
        join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
        join user_account on user_account.user_sid = user_report_category.user_sid
        where user_account.user_id = v_user_role_list(i).userId;

        for x in v_source_system.first..v_source_system.last
          loop -- loop through user source systems, only TxEIS at this time --
            if v_source_system(x) = 'TxEIS' then
              if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
                 insert into txstu_user_student_security
                  select distinct
                   user_account.user_id
                  ,sr_stu_enroll.sch_yr
                  ,sr_stu_enroll.stu_id
                  from user_account
                  join user_campus on user_campus.user_sid = user_account.user_sid
                  join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
                  join sr_stu_enroll on sr_stu_enroll.campus_id = campus_master.school_id
                  where user_account.user_id = v_user_role_list(i).userId;
               else -- district users --
                 -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
                 -- technically should have one or the other. we are allowing both to have full district wide
                 -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
                 -- add the user if it's the first row of the collection else skip the row in the collection if
                 -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
                 -- application.
                 if i != v_user_role_list.FIRST
                    and v_user_role_list(i).role = 'DISTRICT_USER'
                    and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
                    and v_user_role_list(i).application_name = v_user_role_list(v_user_role_list.PRIOR(i)).application_name then
                    -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
                   null; -- skip to the next record this user has already been recorded as having distict wide data access --
                 else
                   insert into txstu_user_student_security
                   (user_id, sch_yr, stu_id)
                   values
                   (v_user_role_list(i).userId, 9999, -9999);
                  end if;
               end if;
             end if;
           end loop;
      end if;
    commit;
   end loop;

end prc_load_reveal_security_table;

/* ***********************************************************************************
Purpose:    This Procedure OVERLOADS the prc_load_reveal_security_table and builds the
            security tables for Dropout and RevealReporter for a SINGLE USER.
            Campus users have the student sids for their
            assigned campuses loaded while district users have their user_id and -9999 loaded for
            student_sid/stu_id to idicate all students in the district. TxEIS uses the txstu_user_student_security
            table which also has sch_yr in it and is set to 9999 for district users.

This Procedure first deletes all records from the tables for the specified p_user_id.

12/17/12 CBull  Original Creation
*********************************************************************************** */
procedure prc_load_reveal_security_table(p_user_sid IN number)
is
type r_user_role is record ( userId      user_account.user_id%TYPE,
                             districtSID user_account.district_sid%TYPE,
                             role        role_master.role%TYPE,
                             application_name application.description%TYPE);
type t_user_role is table of r_user_role INDEX BY pls_integer;

v_user_role_list t_user_role; -- list of users and roles

type t_source_system is varray(10) of varchar2(30);

v_source_system t_source_system := t_source_system();

begin

  -- delete all data from the tables. --
  delete from user_student_security
         where user_id = (select user_account.user_id from user_account where user_account.user_sid = p_user_sid);
  delete from txstu_user_student_security
         where user_id = (select user_account.user_id from user_account where user_account.user_sid = p_user_sid);
  -- select all users and their roles --
  select
     user_account.user_id
    ,user_account.district_sid
    ,role_master.role
    ,upper(application.description)
  bulk collect into v_user_role_list
  from user_account
  join user_role           on user_role.user_sid = user_account.user_sid
  join application_role    on application_role.application_role_sid = user_role.application_role_sid
  join application         on application.application_id = application_role.application_id
                           and upper(application.description) <> 'REVEAL ID MANAGER'
  join role_master         on role_master.role_sid = application_role.role_sid
  where user_account.user_sid = p_user_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  for i in v_user_role_list.first..v_user_role_list.last
    loop
      if v_user_role_list(i).application_name = 'DROPOUT WARNING' THEN
        if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
           insert into user_student_security
            select
            user_account.user_id
            ,user_account.district_sid
            ,student_dim.student_sid
            from user_account
            join student_dim on student_dim.district_sid = user_account.district_sid
            join user_campus on user_campus.user_sid = user_account.user_sid
            join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
            where student_dim.campus_security_key = 'TX*'||campus_master.campus_id
            and user_account.user_id = v_user_role_list(i).userId;
         else -- district users --
           -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
           -- technically should have one or the other. we are allowing both to have full district wide
           -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
           -- add the user if it's the first row of the collection else skip the row in the collection if
           -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
           -- application.
           if i != v_user_role_list.FIRST
              and v_user_role_list(i).role = 'DISTRICT_USER'
              and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
              and v_user_role_list(i).application_name = v_user_role_list(v_user_role_list.PRIOR(i)).application_name then
              -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
             null; -- skip to the next record this user has already been recorded as having distict wide data access --
           else
             insert into user_student_security
              (user_id, district_sid, student_sid)
             values
              (v_user_role_list(i).userId, v_user_role_list(i).districtSID, -9999);
           end if;
         end if;
      end if;
      if v_user_role_list(i).application_name = 'REVEAL REPORTER' THEN
        -- get the source systems for this user --
        select distinct source.source_name
        bulk collect into v_source_system
        from source
        join report_category on report_category.source_sid = source.source_sid
        join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
        join user_account on user_account.user_sid = user_report_category.user_sid
        where user_account.user_id = v_user_role_list(i).userId;

        for x in v_source_system.first..v_source_system.last
          loop -- loop through user source systems, only TxEIS at this time --
            if v_source_system(x) = 'TxEIS' then
              if v_user_role_list(i).role = 'CAMPUS_USER' then -- campus users --
                 insert into txstu_user_student_security
                  select distinct
                   user_account.user_id
                  ,sr_stu_enroll.sch_yr
                  ,sr_stu_enroll.stu_id
                  from user_account
                  join user_campus on user_campus.user_sid = user_account.user_sid
                  join campus_master on campus_master.campus_master_sid = user_campus.campus_master_sid
                  join sr_stu_enroll on sr_stu_enroll.campus_id = campus_master.school_id
                  where user_account.user_id = v_user_role_list(i).userId;
               else -- district users --
                 -- When a user has a DISTRICT_USER and DISTRICT_ADMIN role for the same application they
                 -- technically should have one or the other. we are allowing both to have full district wide
                 -- data access.  They only need one entry in the txstu_user_student_security tbale so we need to
                 -- add the user if it's the first row of the collection else skip the row in the collection if
                 -- we reach a DISTRICT_USER role and there is a prior row with the same user id for the same
                 -- application.
                 if i != v_user_role_list.FIRST
                    and v_user_role_list(i).role = 'DISTRICT_USER'
                    and v_user_role_list(i).userId = v_user_role_list(v_user_role_list.PRIOR(i)).userId
                    and v_user_role_list(i).application_name = v_user_role_list(v_user_role_list.PRIOR(i)).application_name then
                    -- dbms_output.put_line('Skipped user: '||v_user_role_list(i).userId||' : '||v_user_role_list(i).application_name);
                   null; -- skip to the next record this user has already been recorded as having distict wide data access --
                 else
                   insert into txstu_user_student_security
                   (user_id, sch_yr, stu_id)
                   values
                    (v_user_role_list(i).userId, 9999, -9999);
                 end if;
               end if;
             end if;
           end loop;
      end if;
    commit;
   end loop;

end prc_load_reveal_security_table;

PROCEDURE prc_set_context IS
BEGIN
 dbms_session.set_context
         (namespace => 'REVEAL_CTX'
         ,attribute => 'USER_NAME'
         ,value     => v('APP_USER'));
END prc_set_context;

PROCEDURE prc_set_context_manual (v_user IN VARCHAR2) IS
BEGIN
 dbms_session.set_context
         (namespace => 'REVEAL_CTX'
         ,attribute => 'USER_NAME'
         ,value     => v_user);
END prc_set_context_manual;

PROCEDURE prc_clear_context IS
BEGIN
 dbms_session.clear_context('REVEAL_CTX');
END prc_clear_context;

END pkg_sv_security;
/

prompt
prompt Creating trigger MAINTAIN_CAMPUS_SELECTIONS
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER TIMSRPTDATA."MAINTAIN_CAMPUS_SELECTIONS"
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

prompt
prompt Creating trigger TRG_ABS_RSN_DIM_LAST_UPDATE
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_ABS_RSN_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_CAMPUS_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_CLASS_PRD_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_COURSE_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_CRS_SECT_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_DIST_DIM_LAST_UPDATE"
  BEFORE INSERT OR UPDATE ON DISTRICT_DIM
  FOR EACH ROW
DECLARE

BEGIN
  :NEW.LAST_UPDATE := SYSTIMESTAMP;
END TRG_DIST_DIM_LAST_UPDATE;
/

prompt
prompt Creating trigger TRG_STU_DIM_LAST_UPDATE
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER TIMSRPTDATA."TRG_STU_DIM_LAST_UPDATE"
  before insert or update on student_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_stu_dim_last_update;
/


spool off
