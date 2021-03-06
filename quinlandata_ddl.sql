-----------------------------------------------------------
-- Export file for user QUINLANDATA@DATAWH               --
-- Created by espositot on 5/26/2016, 16:06:36 16:06:36  --
-----------------------------------------------------------

set define off
spool quinlandata_ddl.log

prompt
prompt Creating table DISTRICT_DIM
prompt ===========================
prompt
create table QUINLANDATA.DISTRICT_DIM
(
  district_sid               NUMBER not null,
  district_id                VARCHAR2(20) not null,
  district_area              VARCHAR2(30),
  district_name              VARCHAR2(75),
  address                    VARCHAR2(100),
  address_line_2             VARCHAR2(100),
  city                       VARCHAR2(50),
  state_code                 VARCHAR2(2),
  postal_code                VARCHAR2(10),
  county                     VARCHAR2(50),
  district_key               VARCHAR2(20),
  last_update                TIMESTAMP(6),
  region_name                VARCHAR2(20),
  phone_number               VARCHAR2(20),
  fax_number                 VARCHAR2(20),
  email_address              VARCHAR2(50),
  web_site                   VARCHAR2(100),
  password_expire_days       NUMBER(3),
  password_max_attempts      NUMBER(1),
  password_expire_month      NUMBER(2),
  password_expire_day        NUMBER(2),
  password_expiration_method VARCHAR2(20),
  district_security_question VARCHAR2(2000),
  district_security_answer   VARCHAR2(2000),
  district_ip_range          VARCHAR2(100)
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
comment on table QUINLANDATA.DISTRICT_DIM
  is 'A local education agency.
Example: Dallas Independent School District';
comment on column QUINLANDATA.DISTRICT_DIM.district_area
  is 'The educational area or region in which the district is located.
Example: Region 10
';
comment on column QUINLANDATA.DISTRICT_DIM.district_key
  is 'Uniquely identifies a district.  A concatenation of state code and district id.
Example: TX*043901';
comment on column QUINLANDATA.DISTRICT_DIM.region_name
  is 'The name of the regional service service center for this campus.
Example: Region 10,
                10';
comment on column QUINLANDATA.DISTRICT_DIM.web_site
  is 'District Website address.';
comment on column QUINLANDATA.DISTRICT_DIM.password_expire_days
  is 'The number of days before since the last password change before a user must change their

password.';
comment on column QUINLANDATA.DISTRICT_DIM.password_max_attempts
  is 'The maximum number of times a user will be allowed to try to log on before their account is

locked.';
comment on column QUINLANDATA.DISTRICT_DIM.password_expire_month
  is 'The month number that user passwords will have to be changed.';
comment on column QUINLANDATA.DISTRICT_DIM.password_expire_day
  is 'The day of the month that user passwords will have to be changed.';
comment on column QUINLANDATA.DISTRICT_DIM.password_expiration_method
  is 'Specifies which method will be used to force users to change their passwords.
Values: Number Of Days
             Specific Month/Day';
comment on column QUINLANDATA.DISTRICT_DIM.district_security_question
  is 'A question to validate first time users.';
comment on column QUINLANDATA.DISTRICT_DIM.district_security_answer
  is 'The answer to the district security question.';
comment on column QUINLANDATA.DISTRICT_DIM.district_ip_range
  is 'An ip range to expression used to validate the ip address of the user to determine if they are

logging in from inside or outside the districts network.';
alter table QUINLANDATA.DISTRICT_DIM
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
alter table QUINLANDATA.DISTRICT_DIM
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
create table QUINLANDATA.ABSENCE_REASON_DIM
(
  absence_reason_sid         NUMBER not null,
  district_sid               NUMBER not null,
  absence_reason_code        VARCHAR2(50) not null,
  absence_reason_description VARCHAR2(75),
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.ABSENCE_REASON_DIM
  is 'The reason that a student missed instruction such as excused or unexcused.';
comment on column QUINLANDATA.ABSENCE_REASON_DIM.absence_reason_key
  is 'The business key for an absence reason.  The concatenation of state code, district id and absence reason code.
Example: TX*043901*Doctors Appointment';
comment on column QUINLANDATA.ABSENCE_REASON_DIM.exclude_absence_reason
  is 'Indicates that the Absence Reason should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table QUINLANDATA.ABSENCE_REASON_DIM
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
alter table QUINLANDATA.ABSENCE_REASON_DIM
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
alter table QUINLANDATA.ABSENCE_REASON_DIM
  add constraint FK_ABSENCE__REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ACADEMIC_RECORD_SOURCE_DIM
prompt =========================================
prompt
create table QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM
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
comment on table QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM
  is 'Indicates the where the record of academic achievement came from, classroom, transfer, exam, etc...';
comment on column QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM.academic_source_description
  is 'Describes the Academic Source Code.
Examples: Transfer,
                 Classroom,
                 Exam,
                 Online';
create unique index QUINLANDATA.PK_CREDIT_TYPE_DIM on QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE)
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
alter table QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM
  add constraint PK_ACADEMIC_RECORD_SOURCE_DIM primary key (ACADEMIC_SOURCE_CODE);

prompt
prompt Creating table ACTION_LENGTH_DIFF_REASON_DIM
prompt ============================================
prompt
create table QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM
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
comment on table QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM
  is 'Describes why the assigned action length varies from the actual days served.';
comment on column QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason_sid
  is 'Uniquely identifies the Action Length Diff Reason Dim';
comment on column QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason
  is 'Description of why the assigned days varies from the actual days.
Example: Term Modified by District';
comment on column QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM.action_length_diff_reason_key
  is 'Business key for the Action Length Diff Reason Dim.
Example: TX*849395*Other';
alter table QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM
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
alter table QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM
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
create table QUINLANDATA.AD_CAMPUS_XREF
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
create table QUINLANDATA.AD_FIRST_NAME
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
create table QUINLANDATA.AD_LAST_NAME
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
create table QUINLANDATA.AD_SCHOOL_NAME
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
create table QUINLANDATA.AD_STREET_NAME
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
create table QUINLANDATA.AD_STUDENT
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
create table QUINLANDATA.AD_STUDENT_XREF
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
prompt Creating table APEX$_ACL
prompt ========================
prompt
create table QUINLANDATA.APEX$_ACL
(
  id         NUMBER not null,
  ws_app_id  NUMBER not null,
  username   VARCHAR2(255) not null,
  priv       VARCHAR2(1) not null,
  created_on DATE not null,
  created_by VARCHAR2(255) not null,
  updated_on DATE,
  updated_by VARCHAR2(255)
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
create index QUINLANDATA.APEX$_ACL_IDX1 on QUINLANDATA.APEX$_ACL (WS_APP_ID)
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
alter table QUINLANDATA.APEX$_ACL
  add constraint APEX$_ACL_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_ACL
  add constraint APEX$_ACL_PRIV_CK
  check (priv in ('R','C','A'));

prompt
prompt Creating table APEX$_WS_ROWS
prompt ============================
prompt
create table QUINLANDATA.APEX$_WS_ROWS
(
  id            NUMBER not null,
  ws_app_id     NUMBER not null,
  data_grid_id  NUMBER not null,
  unique_value  VARCHAR2(255),
  tags          VARCHAR2(4000),
  parent_row_id NUMBER,
  owner         VARCHAR2(255),
  geocode       VARCHAR2(512),
  load_order    NUMBER,
  change_count  NUMBER,
  created_on    DATE not null,
  created_by    VARCHAR2(255) not null,
  updated_on    DATE,
  updated_by    VARCHAR2(255),
  c001          VARCHAR2(4000),
  c002          VARCHAR2(4000),
  c003          VARCHAR2(4000),
  c004          VARCHAR2(4000),
  c005          VARCHAR2(4000),
  c006          VARCHAR2(4000),
  c007          VARCHAR2(4000),
  c008          VARCHAR2(4000),
  c009          VARCHAR2(4000),
  c010          VARCHAR2(4000),
  c011          VARCHAR2(4000),
  c012          VARCHAR2(4000),
  c013          VARCHAR2(4000),
  c014          VARCHAR2(4000),
  c015          VARCHAR2(4000),
  c016          VARCHAR2(4000),
  c017          VARCHAR2(4000),
  c018          VARCHAR2(4000),
  c019          VARCHAR2(4000),
  c020          VARCHAR2(4000),
  c021          VARCHAR2(4000),
  c022          VARCHAR2(4000),
  c023          VARCHAR2(4000),
  c024          VARCHAR2(4000),
  c025          VARCHAR2(4000),
  c026          VARCHAR2(4000),
  c027          VARCHAR2(4000),
  c028          VARCHAR2(4000),
  c029          VARCHAR2(4000),
  c030          VARCHAR2(4000),
  c031          VARCHAR2(4000),
  c032          VARCHAR2(4000),
  c033          VARCHAR2(4000),
  c034          VARCHAR2(4000),
  c035          VARCHAR2(4000),
  c036          VARCHAR2(4000),
  c037          VARCHAR2(4000),
  c038          VARCHAR2(4000),
  c039          VARCHAR2(4000),
  c040          VARCHAR2(4000),
  c041          VARCHAR2(4000),
  c042          VARCHAR2(4000),
  c043          VARCHAR2(4000),
  c044          VARCHAR2(4000),
  c045          VARCHAR2(4000),
  c046          VARCHAR2(4000),
  c047          VARCHAR2(4000),
  c048          VARCHAR2(4000),
  c049          VARCHAR2(4000),
  c050          VARCHAR2(4000),
  n001          NUMBER,
  n002          NUMBER,
  n003          NUMBER,
  n004          NUMBER,
  n005          NUMBER,
  n006          NUMBER,
  n007          NUMBER,
  n008          NUMBER,
  n009          NUMBER,
  n010          NUMBER,
  n011          NUMBER,
  n012          NUMBER,
  n013          NUMBER,
  n014          NUMBER,
  n015          NUMBER,
  n016          NUMBER,
  n017          NUMBER,
  n018          NUMBER,
  n019          NUMBER,
  n020          NUMBER,
  n021          NUMBER,
  n022          NUMBER,
  n023          NUMBER,
  n024          NUMBER,
  n025          NUMBER,
  n026          NUMBER,
  n027          NUMBER,
  n028          NUMBER,
  n029          NUMBER,
  n030          NUMBER,
  n031          NUMBER,
  n032          NUMBER,
  n033          NUMBER,
  n034          NUMBER,
  n035          NUMBER,
  n036          NUMBER,
  n037          NUMBER,
  n038          NUMBER,
  n039          NUMBER,
  n040          NUMBER,
  n041          NUMBER,
  n042          NUMBER,
  n043          NUMBER,
  n044          NUMBER,
  n045          NUMBER,
  n046          NUMBER,
  n047          NUMBER,
  n048          NUMBER,
  n049          NUMBER,
  n050          NUMBER,
  d001          DATE,
  d002          DATE,
  d003          DATE,
  d004          DATE,
  d005          DATE,
  d006          DATE,
  d007          DATE,
  d008          DATE,
  d009          DATE,
  d010          DATE,
  d011          DATE,
  d012          DATE,
  d013          DATE,
  d014          DATE,
  d015          DATE,
  d016          DATE,
  d017          DATE,
  d018          DATE,
  d019          DATE,
  d020          DATE,
  d021          DATE,
  d022          DATE,
  d023          DATE,
  d024          DATE,
  d025          DATE,
  d026          DATE,
  d027          DATE,
  d028          DATE,
  d029          DATE,
  d030          DATE,
  d031          DATE,
  d032          DATE,
  d033          DATE,
  d034          DATE,
  d035          DATE,
  d036          DATE,
  d037          DATE,
  d038          DATE,
  d039          DATE,
  d040          DATE,
  d041          DATE,
  d042          DATE,
  d043          DATE,
  d044          DATE,
  d045          DATE,
  d046          DATE,
  d047          DATE,
  d048          DATE,
  d049          DATE,
  d050          DATE,
  clob001       CLOB,
  search_clob   CLOB
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
create index QUINLANDATA.APEX$_WS_ROWS_IDX on QUINLANDATA.APEX$_WS_ROWS (WS_APP_ID, DATA_GRID_ID)
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
alter table QUINLANDATA.APEX$_WS_ROWS
  add constraint APEX$_WS_ROWS_PK primary key (ID)
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
prompt Creating table APEX$_WS_FILES
prompt =============================
prompt
create table QUINLANDATA.APEX$_WS_FILES
(
  id                  NUMBER not null,
  ws_app_id           NUMBER not null,
  data_grid_id        NUMBER,
  row_id              NUMBER,
  webpage_id          NUMBER,
  component_level     VARCHAR2(30),
  name                VARCHAR2(255) not null,
  image_alias         VARCHAR2(255),
  image_attributes    VARCHAR2(255),
  content             BLOB,
  content_last_update DATE,
  mime_type           VARCHAR2(255) not null,
  content_charset     VARCHAR2(255),
  content_filename    VARCHAR2(500),
  description         VARCHAR2(4000),
  created_on          DATE not null,
  created_by          VARCHAR2(255) not null,
  updated_on          DATE,
  updated_by          VARCHAR2(255)
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
create index QUINLANDATA.APEX$_WS_FILES_IDX1 on QUINLANDATA.APEX$_WS_FILES (WS_APP_ID, DATA_GRID_ID, ROW_ID)
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
create index QUINLANDATA.APEX$_WS_FILES_IDX2 on QUINLANDATA.APEX$_WS_FILES (WS_APP_ID, WEBPAGE_ID)
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
alter table QUINLANDATA.APEX$_WS_FILES
  add constraint APEX$_WS_FILES_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_WS_FILES
  add constraint APEX$_WS_FILES_FK foreign key (ROW_ID)
  references QUINLANDATA.APEX$_WS_ROWS (ID) on delete cascade;
alter table QUINLANDATA.APEX$_WS_FILES
  add constraint APEX$_WS_FILES_CL_CK
  check (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE'));

prompt
prompt Creating table APEX$_WS_HISTORY
prompt ===============================
prompt
create table QUINLANDATA.APEX$_WS_HISTORY
(
  row_id              NUMBER not null,
  ws_app_id           NUMBER not null,
  data_grid_id        NUMBER not null,
  column_name         VARCHAR2(255),
  old_value           VARCHAR2(4000),
  new_value           VARCHAR2(4000),
  application_user_id VARCHAR2(255),
  change_date         DATE
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
create index QUINLANDATA.APEX$_WS_HISTORY_IDX on QUINLANDATA.APEX$_WS_HISTORY (WS_APP_ID, DATA_GRID_ID, ROW_ID)
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
prompt Creating table APEX$_WS_LINKS
prompt =============================
prompt
create table QUINLANDATA.APEX$_WS_LINKS
(
  id               NUMBER not null,
  ws_app_id        NUMBER not null,
  data_grid_id     NUMBER,
  row_id           NUMBER,
  webpage_id       NUMBER,
  component_level  VARCHAR2(30),
  tags             VARCHAR2(4000),
  show_on_homepage VARCHAR2(1),
  link_name        VARCHAR2(255) not null,
  url              VARCHAR2(4000) not null,
  link_description VARCHAR2(4000),
  display_sequence NUMBER,
  created_on       DATE not null,
  created_by       VARCHAR2(255) not null,
  updated_on       DATE,
  updated_by       VARCHAR2(255)
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
create index QUINLANDATA.APEX$_WS_LINKS_IDX1 on QUINLANDATA.APEX$_WS_LINKS (WS_APP_ID, DATA_GRID_ID, ROW_ID)
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
create index QUINLANDATA.APEX$_WS_LINKS_IDX2 on QUINLANDATA.APEX$_WS_LINKS (WS_APP_ID, WEBPAGE_ID)
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
alter table QUINLANDATA.APEX$_WS_LINKS
  add constraint APEX$_WS_LINKS_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_WS_LINKS
  add constraint APEX$_WS_LINKS_FK foreign key (ROW_ID)
  references QUINLANDATA.APEX$_WS_ROWS (ID) on delete cascade;
alter table QUINLANDATA.APEX$_WS_LINKS
  add constraint APEX$_WS_LINKS_CL_CK
  check (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE'));
alter table QUINLANDATA.APEX$_WS_LINKS
  add constraint APEX$_WS_LINKS_SH_CK
  check (show_on_homepage in ('Y','N'));

prompt
prompt Creating table APEX$_WS_NOTES
prompt =============================
prompt
create table QUINLANDATA.APEX$_WS_NOTES
(
  id              NUMBER not null,
  ws_app_id       NUMBER not null,
  data_grid_id    NUMBER,
  row_id          NUMBER,
  webpage_id      NUMBER,
  component_level VARCHAR2(30),
  content         CLOB,
  created_on      DATE not null,
  created_by      VARCHAR2(255) not null,
  updated_on      DATE,
  updated_by      VARCHAR2(255)
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
create index QUINLANDATA.APEX$_WS_NOTES_IDX1 on QUINLANDATA.APEX$_WS_NOTES (WS_APP_ID, DATA_GRID_ID, ROW_ID)
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
create index QUINLANDATA.APEX$_WS_NOTES_IDX2 on QUINLANDATA.APEX$_WS_NOTES (WS_APP_ID, WEBPAGE_ID)
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
alter table QUINLANDATA.APEX$_WS_NOTES
  add constraint APEX$_WS_NOTES_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_WS_NOTES
  add constraint APEX$_WS_NOTES_FK foreign key (ROW_ID)
  references QUINLANDATA.APEX$_WS_ROWS (ID) on delete cascade;
alter table QUINLANDATA.APEX$_WS_NOTES
  add constraint APEX$_WS_NOTES_CL_CK
  check (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE'));

prompt
prompt Creating table APEX$_WS_TAGS
prompt ============================
prompt
create table QUINLANDATA.APEX$_WS_TAGS
(
  id              NUMBER not null,
  ws_app_id       NUMBER not null,
  data_grid_id    NUMBER,
  row_id          NUMBER,
  webpage_id      NUMBER,
  component_level VARCHAR2(30),
  tag             VARCHAR2(4000),
  created_on      DATE not null,
  created_by      VARCHAR2(255) not null,
  updated_on      DATE,
  updated_by      VARCHAR2(255)
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
create index QUINLANDATA.APEX$_WS_TAGS_IDX1 on QUINLANDATA.APEX$_WS_TAGS (WS_APP_ID, DATA_GRID_ID, ROW_ID)
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
create index QUINLANDATA.APEX$_WS_TAGS_IDX2 on QUINLANDATA.APEX$_WS_TAGS (WS_APP_ID, WEBPAGE_ID)
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
alter table QUINLANDATA.APEX$_WS_TAGS
  add constraint APEX$_WS_TAGS_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_WS_TAGS
  add constraint APEX$_WS_TAGS_FK foreign key (ROW_ID)
  references QUINLANDATA.APEX$_WS_ROWS (ID) on delete cascade;
alter table QUINLANDATA.APEX$_WS_TAGS
  add constraint APEX$_WS_TAGS_CL_CK
  check (component_level in ('WEBSHEET','ROW','WORKSPACE','WEBPAGE'));

prompt
prompt Creating table APEX$_WS_WEBPG_SECTIONS
prompt ======================================
prompt
create table QUINLANDATA.APEX$_WS_WEBPG_SECTIONS
(
  id                   NUMBER not null,
  ws_app_id            NUMBER not null,
  webpage_id           NUMBER,
  display_sequence     NUMBER,
  section_type         VARCHAR2(30) not null,
  title                VARCHAR2(4000),
  content              CLOB,
  content_upper        CLOB,
  nav_start_webpage_id NUMBER,
  nav_max_level        NUMBER,
  nav_order_by         VARCHAR2(255),
  nav_include_link     VARCHAR2(1),
  data_grid_id         NUMBER,
  report_id            NUMBER,
  data_section_style   NUMBER,
  chart_type           VARCHAR2(255),
  chart_3d             VARCHAR2(1),
  chart_label          VARCHAR2(255),
  label_axis_title     VARCHAR2(255),
  chart_value          VARCHAR2(255),
  value_axis_title     VARCHAR2(255),
  chart_aggregate      VARCHAR2(255),
  chart_sorting        VARCHAR2(255),
  change_count         NUMBER,
  created_on           DATE not null,
  created_by           VARCHAR2(255) not null,
  updated_on           DATE,
  updated_by           VARCHAR2(255)
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
alter table QUINLANDATA.APEX$_WS_WEBPG_SECTIONS
  add constraint APEX$_WS_WEBPG_SECTIONS_PK primary key (ID)
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
alter table QUINLANDATA.APEX$_WS_WEBPG_SECTIONS
  add constraint APEX$_WS_WEBPG_SECTION_3D_CK
  check (chart_3d in ('Y','N'));
alter table QUINLANDATA.APEX$_WS_WEBPG_SECTIONS
  add constraint APEX$_WS_WEBPG_SECTION_LINK_CK
  check (nav_include_link in ('Y','N'));
alter table QUINLANDATA.APEX$_WS_WEBPG_SECTIONS
  add constraint APEX$_WS_WEBPG_SECTION_TYPE_CK
  check (section_type in ('TEXT','DATA','CHART','NAV_PAGE','NAV_SECTION','PLSQL'));

prompt
prompt Creating table APEX$_WS_WEBPG_SECTION_HISTORY
prompt =============================================
prompt
create table QUINLANDATA.APEX$_WS_WEBPG_SECTION_HISTORY
(
  section_id           NUMBER not null,
  ws_app_id            NUMBER not null,
  webpage_id           NUMBER not null,
  old_display_sequence NUMBER,
  new_display_sequence NUMBER,
  old_title            VARCHAR2(4000),
  new_title            VARCHAR2(4000),
  old_content          CLOB,
  new_content          CLOB,
  application_user_id  VARCHAR2(255) not null,
  change_date          DATE not null
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
create index QUINLANDATA.APEX$_WS_WEBPG_SECHIST_IDX1 on QUINLANDATA.APEX$_WS_WEBPG_SECTION_HISTORY (WS_APP_ID, WEBPAGE_ID, SECTION_ID)
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
prompt Creating table APPLICATION
prompt ==========================
prompt
create table QUINLANDATA.APPLICATION
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
comment on column QUINLANDATA.APPLICATION.application_id
  is 'The APEX application number';
comment on column QUINLANDATA.APPLICATION.active_flag
  is 'Indicates if the application is currently active and available.
Values: Y, N';
comment on column QUINLANDATA.APPLICATION.description
  is 'Describes the Application';
comment on column QUINLANDATA.APPLICATION.application_alias
  is 'An alternate name for the application used in place of the application id in
APEX to identify the application in the url.
Example: DWS,
               REVIDMGR';
alter table QUINLANDATA.APPLICATION
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
prompt Creating table ROLE_MASTER
prompt ==========================
prompt
create table QUINLANDATA.ROLE_MASTER
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
comment on column QUINLANDATA.ROLE_MASTER.role_sid
  is 'Surrogate Key for the User role';
comment on column QUINLANDATA.ROLE_MASTER.role
  is 'Defines a role that can be applied to an application and a user.
Example: District,
              Campus';
alter table QUINLANDATA.ROLE_MASTER
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
alter table QUINLANDATA.ROLE_MASTER
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
create table QUINLANDATA.APPLICATION_ROLE
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
comment on column QUINLANDATA.APPLICATION_ROLE.application_role_sid
  is 'Surrogate Key for the Application Role';
comment on column QUINLANDATA.APPLICATION_ROLE.role_sid
  is 'Surrogate Key for the User role';
alter table QUINLANDATA.APPLICATION_ROLE
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
alter table QUINLANDATA.APPLICATION_ROLE
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
alter table QUINLANDATA.APPLICATION_ROLE
  add constraint FK_APPLICAT_REFERENCE_ROLE_MAS foreign key (ROLE_SID)
  references QUINLANDATA.ROLE_MASTER (ROLE_SID);
alter table QUINLANDATA.APPLICATION_ROLE
  add constraint FK_APPL_REF_APP_ROLE foreign key (APPLICATION_ID)
  references QUINLANDATA.APPLICATION (APPLICATION_ID);

prompt
prompt Creating table CAMPUS_DIM
prompt =========================
prompt
create table QUINLANDATA.CAMPUS_DIM
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
comment on table QUINLANDATA.CAMPUS_DIM
  is 'Identifies a physical location where a instruction takes place.

Issues:
1) May need an "OFF CAMPUS" dimension row for courses, grades and credits that come from off campus sources such as college, distance learning, etc.';
comment on column QUINLANDATA.CAMPUS_DIM.campus_name
  is 'Full name of the campus.
Example: McKinney Central High School,
               Frisco High School';
comment on column QUINLANDATA.CAMPUS_DIM.campus_short_name
  is 'Short name of the campus
Example: Central,
               Frisco HS';
comment on column QUINLANDATA.CAMPUS_DIM.periods_per_day
  is 'The number of scheduled periods per day at this campus.
Example: 7
8
4 (for A/B block schedule)';
comment on column QUINLANDATA.CAMPUS_DIM.attendance_threshold
  is 'The percentage threshold by which students will be flagged for the attendance risk factor.
Example: .10 - 10%
               .08 - 8%';
comment on column QUINLANDATA.CAMPUS_DIM.campus_key
  is 'Uniquely identifies a campus. A concatenation of the state code, district id, and campus id.
Example: TX*043901*043901001';
comment on column QUINLANDATA.CAMPUS_DIM.passing_grade_threshold
  is 'Defines the lowest pasing number grade at this campus.
Example: 70 (default),
                60,
                80';
comment on column QUINLANDATA.CAMPUS_DIM.default_grading_cycle
  is 'Defines the grading cycle to be used by the core/non-core risk factor for this campus.
Values: 6-Weeks,
             9-Weeks';
create bitmap index QUINLANDATA.BMI_CAMPUS_DIM_DISTRICT_FK on QUINLANDATA.CAMPUS_DIM (DISTRICT_SID)
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
alter table QUINLANDATA.CAMPUS_DIM
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
alter table QUINLANDATA.CAMPUS_DIM
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
alter table QUINLANDATA.CAMPUS_DIM
  add constraint FK_CAMPUS_D_RELATIONS_DISTRICT foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table DATE_DIM
prompt =======================
prompt
create table QUINLANDATA.DATE_DIM
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
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.DATE_DIM
  is 'Identifies the common and districts specific calendars.';
comment on column QUINLANDATA.DATE_DIM.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.DATE_DIM.district_sid
  is 'Surrogate key';
comment on column QUINLANDATA.DATE_DIM.date_id
  is 'A specific day of the year';
comment on column QUINLANDATA.DATE_DIM.calendar_year
  is 'Example: 2009';
comment on column QUINLANDATA.DATE_DIM.calendar_year_quarter
  is 'Example: 2009 Q1';
comment on column QUINLANDATA.DATE_DIM.calendar_quarter
  is 'Example: 1';
comment on column QUINLANDATA.DATE_DIM.calendar_year_month
  is 'Example: 200912';
comment on column QUINLANDATA.DATE_DIM.calendar_month
  is 'Example: 12';
comment on column QUINLANDATA.DATE_DIM.calendar_month_name
  is 'Example: December';
comment on column QUINLANDATA.DATE_DIM.calendar_month_short_name
  is 'Example: Dec';
comment on column QUINLANDATA.DATE_DIM.calendar_week
  is 'Example: 50';
comment on column QUINLANDATA.DATE_DIM.day_of_week
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
comment on column QUINLANDATA.DATE_DIM.day_of_week_name
  is 'Example: Thursday';
comment on column QUINLANDATA.DATE_DIM.day_of_week_short_name
  is 'Example: Thu';
comment on column QUINLANDATA.DATE_DIM.school_year
  is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column QUINLANDATA.DATE_DIM.school_year_description
  is 'Example: 2009/2010';
comment on column QUINLANDATA.DATE_DIM.school_week
  is 'Example: 24';
comment on column QUINLANDATA.DATE_DIM.year_month_day
  is 'Example: 20091215';
comment on column QUINLANDATA.DATE_DIM.short_date
  is 'Example: 12/15/2009';
comment on column QUINLANDATA.DATE_DIM.long_date
  is 'Example: December 15, 2009';
comment on column QUINLANDATA.DATE_DIM.school_day_indicator
  is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column QUINLANDATA.DATE_DIM.academic_6_weeks
  is 'Identifies the 6 weeks period associated with the academic day.  Non-academic days are set to ''0''.
Values:
1
2
3
4
5
6
0 - non-instructional days';
comment on column QUINLANDATA.DATE_DIM.academic_9_weeks
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
comment on column QUINLANDATA.DATE_DIM.semester
  is 'Example: 1';
comment on column QUINLANDATA.DATE_DIM.first_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.last_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.first_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.last_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.first_day_semester
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.last_day_semester
  is 'Values: Yes/No';
comment on column QUINLANDATA.DATE_DIM.date_key
  is 'The unique business key for a date.  The concatenation of state code, district id, and date(YYYYMMDD)
Example: TX*043901*20100715';
alter table QUINLANDATA.DATE_DIM
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
alter table QUINLANDATA.DATE_DIM
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
alter table QUINLANDATA.DATE_DIM
  add constraint FK_DATE_DIM_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table USER_ACCOUNT
prompt ===========================
prompt
create table QUINLANDATA.USER_ACCOUNT
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
  attempt_ctr              NUMBER
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
comment on column QUINLANDATA.USER_ACCOUNT.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.USER_ACCOUNT.user_id
  is 'A unique name or email address that identifies a user of one or more applications.
example: jane.doe@anywhereISD.org';
comment on column QUINLANDATA.USER_ACCOUNT.password
  is 'Users encrypted password';
comment on column QUINLANDATA.USER_ACCOUNT.password_expiration_date
  is 'The date on which the users password will expire and need to be changed.';
comment on column QUINLANDATA.USER_ACCOUNT.password_update_date
  is 'The date on which the user last changed their password.';
comment on column QUINLANDATA.USER_ACCOUNT.user_first_name
  is 'First name of the user.';
comment on column QUINLANDATA.USER_ACCOUNT.user_last_name
  is 'Surname of the user.';
comment on column QUINLANDATA.USER_ACCOUNT.email_address
  is 'The email address of the user.';
comment on column QUINLANDATA.USER_ACCOUNT.created_by
  is 'The SID of the user that created this user account.';
comment on column QUINLANDATA.USER_ACCOUNT.create_date
  is 'The timestamp when the account was created.';
comment on column QUINLANDATA.USER_ACCOUNT.updated_by
  is 'The SID of the user that updated this user account.';
comment on column QUINLANDATA.USER_ACCOUNT.update_date
  is 'The timestamp when the account was updated.';
comment on column QUINLANDATA.USER_ACCOUNT.account_locked
  is 'Indicates that the account is locked or not allowing or restricting access.
Values: Y, N';
comment on column QUINLANDATA.USER_ACCOUNT.employee_id
  is 'The Employee identifier of number.';
comment on column QUINLANDATA.USER_ACCOUNT.active_account_flag
  is 'Indicates that the account is currently active for use or has been deactivated.
Values: Y, N';
comment on column QUINLANDATA.USER_ACCOUNT.last_login_date
  is 'The date and time that the user last successfully logged into a reveal application.';
comment on column QUINLANDATA.USER_ACCOUNT.first_login_flag
  is 'A flag to indicate that the user has not logged in before and needs to complete additional

security setup.
Values: Y/N';
comment on column QUINLANDATA.USER_ACCOUNT.attempt_ctr
  is 'Identifies the number failed attempts to log on by this user';
alter table QUINLANDATA.USER_ACCOUNT
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
alter table QUINLANDATA.USER_ACCOUNT
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
alter table QUINLANDATA.USER_ACCOUNT
  add constraint FK_USER_ACC_REF_DISTRICT_DIM foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table STUDENT_DIM
prompt ==========================
prompt
create table QUINLANDATA.STUDENT_DIM
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
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_DIM
  is 'Identifies a person who receives instruction from a district/campus.';
comment on column QUINLANDATA.STUDENT_DIM.postal_code
  is 'Students zip code. may include plus 4. Example: 75444-3333';
comment on column QUINLANDATA.STUDENT_DIM.phone_number
  is 'Students Primary contact phone number digits only.  Example: 5558884444';
comment on column QUINLANDATA.STUDENT_DIM.gender
  is 'Students Gender Values: Male/Female';
comment on column QUINLANDATA.STUDENT_DIM.ethnicity
  is 'Hispanic or Not. Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.american_indian_alaska_native
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.asian
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.black_or_african_american
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.native_hawaiian_pacific_island
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.white
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.two_or_more_races
  is 'Values Yes, No';
comment on column QUINLANDATA.STUDENT_DIM.race_ethnicity_short_desc
  is 'Concatenation of Student ethnicity and races.
Example: Hispanic, Amer. Indian/Alaskan. , Asian, Black';
comment on column QUINLANDATA.STUDENT_DIM.primary_language
  is 'Students primary spoken language.  Example: Spanish';
comment on column QUINLANDATA.STUDENT_DIM.ninth_grade_cohort
  is 'The calculated year of graduation based on the year the student entered the ninth grade.';
comment on column QUINLANDATA.STUDENT_DIM.limited_english_proficiency
  is 'Students who are unable to communicate effectively in English because their primary language is not English and they have not developed fluency in the English language.
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.lep_first_year_monitoring
  is 'Students who are in first year monitoring for limited english proficiency.
values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.lep_second_year_monitoring
  is 'Students who are in second year monitoring for limited english proficiency.
values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.immigrant
  is 'Students who are not naturalized citizens of the United States.
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.migrant
  is 'Student whose family frequently moves to follow seasonal work patterns.
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.economically_disadvantaged
  is 'An indication of inadequate financial condition of a student''s family, as determined by family income,
number of family members/dependents, participation in public assistance programs, and/or other
characteristics considered relevant by federal, state, and local policy.
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.special_education
  is 'Indicates that a student is participating a special education program.
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_DIM.meal_eligibility
  is 'Eligibility status for School food Service Programs
examples:  Free
               , Full Price
              , Reduced Price,
              , Unknown
';
comment on column QUINLANDATA.STUDENT_DIM.primary_disability
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
comment on column QUINLANDATA.STUDENT_DIM.secondary_disability
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
comment on column QUINLANDATA.STUDENT_DIM.tertiary_disability
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
comment on column QUINLANDATA.STUDENT_DIM.date_entered_ninth_grade
  is 'The date the student start the ninth grade.
Example: 8/24/2008';
comment on column QUINLANDATA.STUDENT_DIM.student_photo
  is 'A picture of the student.';
comment on column QUINLANDATA.STUDENT_DIM.race_ethnicity_key
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
comment on column QUINLANDATA.STUDENT_DIM.campus_security_key
  is 'The students current campus within the district.  A Concatenation of state code, district code, and campus id.
Example: OK*0923084*009';
comment on column QUINLANDATA.STUDENT_DIM.district_security_key
  is 'The Current district of the student used to restrict data for security.
A concatenation of state code and district id.
Example: OK*8394839';
comment on column QUINLANDATA.STUDENT_DIM.student_key
  is 'The business key for student.  A concatenation of State code, District id, and Student Id.';
comment on column QUINLANDATA.STUDENT_DIM.campus_sid
  is 'Identifies the SID of the students currently enrolled campus.';
comment on column QUINLANDATA.STUDENT_DIM.campus_id
  is 'Identifies the Campus Id of the students currently enrolled campus.';
comment on column QUINLANDATA.STUDENT_DIM.user_sid
  is 'User Surrogate Key';
create bitmap index QUINLANDATA.BMI_STU_DIM_DISTRICT_SID_FK on QUINLANDATA.STUDENT_DIM (DISTRICT_SID)
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
alter table QUINLANDATA.STUDENT_DIM
  add constraint PK_STUDENT_DIM primary key (STUDENT_SID)
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
alter table QUINLANDATA.STUDENT_DIM
  add constraint AK_STUDENT_DIM_BUS_KEY unique (STUDENT_KEY)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_DIM
  add constraint FK_STUDENT_DISTRICT_DIM foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);
alter table QUINLANDATA.STUDENT_DIM
  add constraint FK_STU_REF_USER_ACCT foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table ATTENDANCE_RISK_FACTOR_FACT
prompt ==========================================
prompt
create table QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT
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
comment on table QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT
  is 'Captures the results of the Risk Factor Calculation Engine for the attendance risk factor.';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.period_absence_count
  is 'The number periods the student was absent on this day.
Example: 7';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.ytd_period_absence_count
  is 'The total number of periods absent from the start of the school year unitl this date.
Example: 54';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.ytd_days_enrolled
  is 'The total number days the student has been enrolled since the start of the school year unitl this date.
Example: 132';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.period_absence_percent
  is 'The percent of instructional periods that the student has missed.
Example: .1323 (13.22%)';
comment on column QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT.last_update
  is 'The datetime that the row was insert/updated';
alter table QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.ATTENDANCE_RISK_FACTOR_FACT
  add constraint FK_ATTENDAN_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table BATCH_USER_ACCOUNT
prompt =================================
prompt
create table QUINLANDATA.BATCH_USER_ACCOUNT
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
create table QUINLANDATA.BATCH_USER_CAMPUS
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
create table QUINLANDATA.BATCH_USER_LOAD_LOG
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
create table QUINLANDATA.BATCH_USER_ROLE
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
create table QUINLANDATA.RISK_FACTOR
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
comment on column QUINLANDATA.RISK_FACTOR.risk_factor_type
  is 'Indicates that the Factor is either a primary or secondary.
Values: Primary,
Secondary';
comment on column QUINLANDATA.RISK_FACTOR.mandatory_flag
  is 'Indicates if the campus is required to select this risk factor or if it is optional.
Values: Yes/No';
comment on column QUINLANDATA.RISK_FACTOR.risk_factor_order
  is 'Defines the sort order for the presentation of the risk factors.';
alter table QUINLANDATA.RISK_FACTOR
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
create table QUINLANDATA.CAMPUS_FACTOR_SELECTION
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
create bitmap index QUINLANDATA.BMI_CAMPUS_FACT_SEL_RISK_SIDFK on QUINLANDATA.CAMPUS_FACTOR_SELECTION (RISK_FACTOR_SID)
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
alter table QUINLANDATA.CAMPUS_FACTOR_SELECTION
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
alter table QUINLANDATA.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_CAMPUS_D foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.CAMPUS_FACTOR_SELECTION
  add constraint FK_CAMPUS_F_RELATIONS_RISK_FAC foreign key (RISK_FACTOR_SID)
  references QUINLANDATA.RISK_FACTOR (RISK_FACTOR_SID);

prompt
prompt Creating table CAMPUS_MASTER
prompt ============================
prompt
create table QUINLANDATA.CAMPUS_MASTER
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
comment on column QUINLANDATA.CAMPUS_MASTER.campus_master_sid
  is 'Surrogate Key for the Campus Master';
comment on column QUINLANDATA.CAMPUS_MASTER.school_id
  is 'The three digit identifier for the school.
Example: 102';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_id
  is 'The nine digit identifier for the campus consisting of the district id and school id.
Example: 057901102';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_name
  is 'The full name of the campus.
Example: SCHOOL FOR THE TALENTED AND GIFTED';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_status
  is 'Identifies the current status of the school.
Example: ACTIVE,
              UNDER CONSTRUCTION,
              ';
comment on column QUINLANDATA.CAMPUS_MASTER.region_name
  is 'The name of the regional service service center for this campus.
Example: Region 10,
                10';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_state_code
  is 'The state abbreviation for the state that is campus resides in.';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_grade_range
  is 'Defines the grade levels taught at this campus.
Example:  06-08,
                EE-05
';
comment on column QUINLANDATA.CAMPUS_MASTER.periods_per_day
  is 'The number of scheduled periods per day at this campus.
Example: 7
8
4 (for A/B block schedule)';
comment on column QUINLANDATA.CAMPUS_MASTER.attendance_threshold
  is 'The percentage threshold by which students will be flagged for the attendance risk factor.
Example: .10 - 10%
               .08 - 8%';
comment on column QUINLANDATA.CAMPUS_MASTER.passing_grade_threshold
  is 'Defines the lowest pasing number grade at this campus.
Example: 70 (default),
                60,
                80';
comment on column QUINLANDATA.CAMPUS_MASTER.default_grading_cycle
  is 'Defines the grading cycle to be used by the core/non-core risk factor for this campus.
Values: 6-Weeks,
             9-Weeks';
comment on column QUINLANDATA.CAMPUS_MASTER.campus_key
  is 'Uniquely identifies a campus. A concatenation of the state code, district id, and campus id.
Example: TX*043901*043901001';
comment on column QUINLANDATA.CAMPUS_MASTER.last_update
  is 'Date the row was created or last updated.';
alter table QUINLANDATA.CAMPUS_MASTER
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
alter table QUINLANDATA.CAMPUS_MASTER
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
alter table QUINLANDATA.CAMPUS_MASTER
  add constraint FK_CAMPUS_M_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table CAMPUS_RISK_FACTOR_DIM
prompt =====================================
prompt
create table QUINLANDATA.CAMPUS_RISK_FACTOR_DIM
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
alter table QUINLANDATA.CAMPUS_RISK_FACTOR_DIM
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
alter table QUINLANDATA.CAMPUS_RISK_FACTOR_DIM
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
create table QUINLANDATA.CLASS_PERIOD_DIM
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
comment on table QUINLANDATA.CLASS_PERIOD_DIM
  is 'Identifies the division of the day assigned the a particular class of instruction.';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.class_period_sid
  is 'Surrogate Key for Class Period Dim.';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.campus_sid
  is 'The Campus Sid of the campus that owns the class periods.';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.class_period
  is 'The time slot that class of instruction meets.
Example: 01,
                02,
                10
                M01,
                M24,
                KG,
                PK';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.class_period_key
  is 'The business key for the district class periods.
Example: TX*057904*057905001*001
                TX*043901*043901003*M13';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.last_update
  is 'Date time that the row was inserted or updated.';
comment on column QUINLANDATA.CLASS_PERIOD_DIM.exclude_class_period
  is 'Indicates that the Class Period should be excluded from Risk Calculation Engine processing.
Values: Yes/No';
alter table QUINLANDATA.CLASS_PERIOD_DIM
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
alter table QUINLANDATA.CLASS_PERIOD_DIM
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
alter table QUINLANDATA.CLASS_PERIOD_DIM
  add constraint FK_CLASS_PE_REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table COURSE_DIM
prompt =========================
prompt
create table QUINLANDATA.COURSE_DIM
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
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.COURSE_DIM
  is 'A state or locally define curriculum of instruction.';
comment on column QUINLANDATA.COURSE_DIM.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column QUINLANDATA.COURSE_DIM.campus_id
  is 'Identifes the campus that owns this particular course.
example: 888888002';
comment on column QUINLANDATA.COURSE_DIM.course_code
  is 'The local distrcit/campus identifier for course.';
comment on column QUINLANDATA.COURSE_DIM.course_description
  is 'The local name or description of course.';
comment on column QUINLANDATA.COURSE_DIM.school_year
  is 'The applicable school year for this course.
Example: 2010';
comment on column QUINLANDATA.COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column QUINLANDATA.COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column QUINLANDATA.COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column QUINLANDATA.COURSE_DIM.course_key
  is 'The business key for the course consisting of State Abbrev||"*"||Campus ID||"*"||School Year(YYYY)||''*''||Local Course Code
Example: TX*043901002*2010*439204';
alter table QUINLANDATA.COURSE_DIM
  add constraint PK_COURSE_DIM primary key (COURSE_SID)
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
alter table QUINLANDATA.COURSE_DIM
  add constraint COURSE_DIM_AK unique (COURSE_KEY)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.COURSE_DIM
  add constraint FK_COURSE_D_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references QUINLANDATA.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table COURSE_SECTION_DIM
prompt =================================
prompt
create table QUINLANDATA.COURSE_SECTION_DIM
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
    initial 704K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.COURSE_SECTION_DIM
  is 'Identifies a scheduled course.';
comment on column QUINLANDATA.COURSE_SECTION_DIM.course_section_sid
  is 'Surrogate key for the Course Section Dim.';
comment on column QUINLANDATA.COURSE_SECTION_DIM.campus_id
  is 'Identifies the Campus where this section of the course is taught.
Example: 19902002
';
comment on column QUINLANDATA.COURSE_SECTION_DIM.course_code
  is 'Identifies the Course being taught.
Example: 1001';
comment on column QUINLANDATA.COURSE_SECTION_DIM.course_description
  is 'Describes the Course being taught.
Example: ENGLISH 1  ';
comment on column QUINLANDATA.COURSE_SECTION_DIM.course_section_number
  is 'Identifies the Course Section being taught.
Example: 001';
comment on column QUINLANDATA.COURSE_SECTION_DIM.school_year
  is 'Describes the school year for the Course Section being taught.
Example: 2011';
comment on column QUINLANDATA.COURSE_SECTION_DIM.term
  is 'Identifes the period of time the Course Section is being taught during the school year.
Example: 1 (Semester or trimester)
                2 (Semester or trimester),
                3 (trimester),
                 Y (Full Year)';
comment on column QUINLANDATA.COURSE_SECTION_DIM.state_course_code
  is 'Identifies the associated State course for the Course Section being taught.
Example: 03220100';
comment on column QUINLANDATA.COURSE_SECTION_DIM.state_course_description
  is 'Describes the associated State course for the Course Section being taught.
Example: English I (1 Unit) (ENG 1)';
comment on column QUINLANDATA.COURSE_SECTION_DIM.core_course_flag
  is 'Identifies if the Course Section being taught is a Core Course.
Values: Yes/No';
comment on column QUINLANDATA.COURSE_SECTION_DIM.course_section_key
  is 'The Busines Key for the Course Section Dim consisting of the state code, campus id, school year,course code, section number, term.
Example: TX*199902002*2011*1001*001*Y';
comment on column QUINLANDATA.COURSE_SECTION_DIM.last_update
  is 'The Date/Time the row as last inserted or updated.';
alter table QUINLANDATA.COURSE_SECTION_DIM
  add constraint PK_COURSE_SECTION_DIM primary key (COURSE_SECTION_SID)
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
alter table QUINLANDATA.COURSE_SECTION_DIM
  add constraint AK_COURSE_SECTION_DIM_COURSE_S unique (COURSE_SECTION_KEY)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEMO_CONSTRAINT_LOOKUP
prompt =====================================
prompt
create table QUINLANDATA.DEMO_CONSTRAINT_LOOKUP
(
  constraint_name VARCHAR2(30) not null,
  message         VARCHAR2(4000) not null
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
alter table QUINLANDATA.DEMO_CONSTRAINT_LOOKUP
  add primary key (CONSTRAINT_NAME)
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
prompt Creating table DEMO_CUSTOMERS
prompt =============================
prompt
create table QUINLANDATA.DEMO_CUSTOMERS
(
  customer_id          NUMBER not null,
  cust_first_name      VARCHAR2(20) not null,
  cust_last_name       VARCHAR2(20) not null,
  cust_street_address1 VARCHAR2(60),
  cust_street_address2 VARCHAR2(60),
  cust_city            VARCHAR2(30),
  cust_state           VARCHAR2(2),
  cust_postal_code     VARCHAR2(10),
  phone_number1        VARCHAR2(25),
  phone_number2        VARCHAR2(25),
  credit_limit         NUMBER(9,2),
  cust_email           VARCHAR2(30)
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
create index QUINLANDATA.DEMO_CUST_NAME_IX on QUINLANDATA.DEMO_CUSTOMERS (CUST_LAST_NAME, CUST_FIRST_NAME)
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
alter table QUINLANDATA.DEMO_CUSTOMERS
  add constraint DEMO_CUSTOMERS_PK primary key (CUSTOMER_ID)
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
alter table QUINLANDATA.DEMO_CUSTOMERS
  add constraint DEMO_CUSTOMERS_UK unique (CUST_FIRST_NAME, CUST_LAST_NAME)
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
alter table QUINLANDATA.DEMO_CUSTOMERS
  add constraint DEMO_CUST_CREDIT_LIMIT_MAX
  check (credit_limit <= 5000);

prompt
prompt Creating table DEMO_ORDERS
prompt ==========================
prompt
create table QUINLANDATA.DEMO_ORDERS
(
  order_id        NUMBER not null,
  customer_id     NUMBER not null,
  order_total     NUMBER(8,2),
  order_timestamp DATE,
  user_name       VARCHAR2(100)
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
create index QUINLANDATA.DEMO_ORD_CUSTOMER_IX on QUINLANDATA.DEMO_ORDERS (CUSTOMER_ID)
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
alter table QUINLANDATA.DEMO_ORDERS
  add constraint DEMO_ORDER_PK primary key (ORDER_ID)
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
alter table QUINLANDATA.DEMO_ORDERS
  add constraint DEMO_ORDERS_CUSTOMER_ID_FK foreign key (CUSTOMER_ID)
  references QUINLANDATA.DEMO_CUSTOMERS (CUSTOMER_ID);
alter table QUINLANDATA.DEMO_ORDERS
  add constraint DEMO_ORDER_TOTAL_MIN
  check (order_total >= 0);

prompt
prompt Creating table DEMO_PRODUCT_INFO
prompt ================================
prompt
create table QUINLANDATA.DEMO_PRODUCT_INFO
(
  product_id          NUMBER not null,
  product_name        VARCHAR2(50),
  product_description VARCHAR2(2000),
  category            VARCHAR2(30),
  product_avail       VARCHAR2(1),
  list_price          NUMBER(8,2),
  product_image       BLOB,
  mimetype            VARCHAR2(255),
  filename            VARCHAR2(400),
  image_last_update   DATE
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
alter table QUINLANDATA.DEMO_PRODUCT_INFO
  add constraint DEMO_PRODUCT_INFO_PK primary key (PRODUCT_ID)
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
alter table QUINLANDATA.DEMO_PRODUCT_INFO
  add constraint DEMO_PRODUCT_INFO_UK unique (PRODUCT_NAME)
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
prompt Creating table DEMO_ORDER_ITEMS
prompt ===============================
prompt
create table QUINLANDATA.DEMO_ORDER_ITEMS
(
  order_item_id NUMBER(3) not null,
  order_id      NUMBER not null,
  product_id    NUMBER not null,
  unit_price    NUMBER(8,2) not null,
  quantity      NUMBER(8) not null
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
alter table QUINLANDATA.DEMO_ORDER_ITEMS
  add constraint DEMO_ORDER_ITEMS_PK primary key (ORDER_ITEM_ID)
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
alter table QUINLANDATA.DEMO_ORDER_ITEMS
  add constraint DEMO_ORDER_ITEMS_UK unique (ORDER_ID, PRODUCT_ID)
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
alter table QUINLANDATA.DEMO_ORDER_ITEMS
  add constraint DEMO_ORDER_ITEMS_FK foreign key (ORDER_ID)
  references QUINLANDATA.DEMO_ORDERS (ORDER_ID) on delete cascade;
alter table QUINLANDATA.DEMO_ORDER_ITEMS
  add constraint DEMO_ORDER_ITEMS_PRODUCT_ID_FK foreign key (PRODUCT_ID)
  references QUINLANDATA.DEMO_PRODUCT_INFO (PRODUCT_ID) on delete cascade;

prompt
prompt Creating table DEMO_STATES
prompt ==========================
prompt
create table QUINLANDATA.DEMO_STATES
(
  st         VARCHAR2(30),
  state_name VARCHAR2(30)
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
prompt Creating table DEPT
prompt ===================
prompt
create table QUINLANDATA.DEPT
(
  deptno NUMBER(2) not null,
  dname  VARCHAR2(14),
  loc    VARCHAR2(13)
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
alter table QUINLANDATA.DEPT
  add primary key (DEPTNO)
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
prompt Creating table DISCIPLINE_DIM
prompt =============================
prompt
create table QUINLANDATA.DISCIPLINE_DIM
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
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.DISCIPLINE_DIM
  is 'Describes the various types of descipline that may be applied to a student.';
comment on column QUINLANDATA.DISCIPLINE_DIM.discipline_sid
  is 'Uniquely identifies the Discipline DIM';
comment on column QUINLANDATA.DISCIPLINE_DIM.campus_id
  is 'Copied formthe campus_dim';
comment on column QUINLANDATA.DISCIPLINE_DIM.discipline_code
  is 'The local code that identifies a type of discipline.
Example: WL
               VW';
comment on column QUINLANDATA.DISCIPLINE_DIM.discipline_description
  is 'Description of the discipline.
Example: Place In Daep By Court,
                Cont. of District''s Expul. Order from Prior Yr';
comment on column QUINLANDATA.DISCIPLINE_DIM.discipline_key
  is 'Business key for the Discipline Dim. By Campus.
Example TX*894758001*11';
comment on column QUINLANDATA.DISCIPLINE_DIM.exclude_discipline_flag
  is 'Indicates if the discipline should be exclude from process by the RCE.
values: YES/NO Defalut=YES';
alter table QUINLANDATA.DISCIPLINE_DIM
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
alter table QUINLANDATA.DISCIPLINE_DIM
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
create table QUINLANDATA.DWS_GLOBAL_DEFAULT
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
comment on table QUINLANDATA.DWS_GLOBAL_DEFAULT
  is 'Contains default vaules that are applied at various times during system operation.';
comment on column QUINLANDATA.DWS_GLOBAL_DEFAULT.campus_periods_per_day
  is 'Defines the default number of periods per day to be applied to new campuses.
Default Value = 7';
comment on column QUINLANDATA.DWS_GLOBAL_DEFAULT.campus_attendance_threshold
  is 'Defines the default attendance threshold to be applied to new campuses.
Default Value = .10 (10%)';
comment on column QUINLANDATA.DWS_GLOBAL_DEFAULT.campus_passing_grade_threshold
  is 'Defines the default passing grade for students at a campus to be applied to new campuses.
Default Value: 70';
comment on column QUINLANDATA.DWS_GLOBAL_DEFAULT.campus_default_grading_cycle
  is 'Defines the default grading cycle at a campus to be applied to new campuses.
Default Value: 6-Weeks';

prompt
prompt Creating table DWS_INTERVENTION_CATEGORY
prompt ========================================
prompt
create table QUINLANDATA.DWS_INTERVENTION_CATEGORY
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_INTERVENTION_CATEGORY.intervention_category_sid
  is 'Surrogate key for the intervention category';
comment on column QUINLANDATA.DWS_INTERVENTION_CATEGORY.intervention_category
  is 'Describes a grouping of interventions.
Examples: Tutoring,
                Mentoring,
               Counseling';
comment on column QUINLANDATA.DWS_INTERVENTION_CATEGORY.intervention_category_desc
  is 'Describes the intervention category.';
comment on column QUINLANDATA.DWS_INTERVENTION_CATEGORY.active_flag
  is 'Indicates if the catefory is actively in use or not.
Values: Y/N';
alter table QUINLANDATA.DWS_INTERVENTION_CATEGORY
  add constraint PK_DWS_INTERVENTION_CATEGORY primary key (INTERVENTION_CATEGORY_SID)
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
alter table QUINLANDATA.DWS_INTERVENTION_CATEGORY
  add constraint AK_DWS_INTERVENTION_C_DWS_INTE unique (INTERVENTION_CATEGORY)
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
prompt Creating table DWS_INTERVENTION
prompt ===============================
prompt
create table QUINLANDATA.DWS_INTERVENTION
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_INTERVENTION.intervention_sid
  is 'Surrogate Key for the Intervention';
comment on column QUINLANDATA.DWS_INTERVENTION.create_by_user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.DWS_INTERVENTION.last_update_user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.DWS_INTERVENTION.intervention_name
  is 'The specific name of the intervention.
example : Math Tutoring,
                Parent Conference,
                Attendance Monitoring';
comment on column QUINLANDATA.DWS_INTERVENTION.intervention_description
  is 'Describes the intervention.';
comment on column QUINLANDATA.DWS_INTERVENTION.intervention_comment
  is 'User comments about the intervention';
comment on column QUINLANDATA.DWS_INTERVENTION.active_flag
  is 'Indicates if the Intervention is in use or not.
Values: Y/N';
comment on column QUINLANDATA.DWS_INTERVENTION.create_date
  is 'The date and time the Intervention was created.';
comment on column QUINLANDATA.DWS_INTERVENTION.last_update
  is 'The date and time the Intervention was last updated.';
alter table QUINLANDATA.DWS_INTERVENTION
  add constraint PK_DWS_INTERVENTION primary key (INTERVENTION_SID)
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
alter table QUINLANDATA.DWS_INTERVENTION
  add constraint AK_DWS_INTERVENTION_A_DWS_INTE unique (INTERVENTION_NAME)
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
alter table QUINLANDATA.DWS_INTERVENTION
  add constraint FK_DWS_INTE_CAT_REF_DWS_INTE foreign key (INTERVENTION_CATEGORY_SID)
  references QUINLANDATA.DWS_INTERVENTION_CATEGORY (INTERVENTION_CATEGORY_SID);
alter table QUINLANDATA.DWS_INTERVENTION
  add constraint FK_INT_REF_USER_ACCT_CREATE foreign key (CREATE_BY_USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);
alter table QUINLANDATA.DWS_INTERVENTION
  add constraint FK_INT_REF_USER_ACCT_LAST_UPD foreign key (LAST_UPDATE_USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table DWS_INTERVENTION_NOTE_TYPE
prompt =========================================
prompt
create table QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_sid
  is 'Surrogate key for the intervention note type';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_name
  is 'The name of the type of note.
example: Status/Update
               Parent Conference
               Student Conference
                Other';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE.intervention_note_type_desc
  is 'describes the type of note.';
alter table QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE
  add constraint PK_DWS_INTERVENTION_NOTE_TYPE primary key (INTERVENTION_NOTE_TYPE_SID)
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
alter table QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE
  add constraint DWS_INTERVENTION_NOTE_TYPE_AK unique (INTERVENTION_NOTE_TYPE_NAME)
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
prompt Creating table DWS_STU_INTERVENTION_STATUS
prompt ==========================================
prompt
create table QUINLANDATA.DWS_STU_INTERVENTION_STATUS
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_STU_INTERVENTION_STATUS.intervention_status_sid
  is 'Surrogate Key for the Student Intervention Status';
comment on column QUINLANDATA.DWS_STU_INTERVENTION_STATUS.intervention_status
  is 'Indicates the state of the intervention.
Example: Open,
                Hold,
                Closed';
comment on column QUINLANDATA.DWS_STU_INTERVENTION_STATUS.intervention_status_desc
  is 'describes the intervention status.
example: The "Hold" status indicates that the student is temporarily not 
participating in the intervention.';
alter table QUINLANDATA.DWS_STU_INTERVENTION_STATUS
  add constraint PK_DWS_STU_INTERVENTION_STATUS primary key (INTERVENTION_STATUS_SID)
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
alter table QUINLANDATA.DWS_STU_INTERVENTION_STATUS
  add constraint AK_DWS_STU_INTERVENTI_DWS_STU_ unique (INTERVENTION_STATUS)
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
prompt Creating table DWS_STUDENT_INTERVENTION
prompt =======================================
prompt
create table QUINLANDATA.DWS_STUDENT_INTERVENTION
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.student_intervention_sid
  is 'Surrogate key for the student Intervention';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.created_by_user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.last_update_user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_begin_date
  is 'The date on which the student begins the intervention';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_end_date
  is 'The date on which the intervention for the student end or ended.';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_goal
  is 'The end result sought for the student by placing them in the intervention.
example: Johnny will achieve a math grade of 70 or better by the end
of the semester.';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_plan
  is 'The plan to achieve the intervention goal for this student.
example: Johnny will attend after school math tutoring with Mr. patterson.';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_result_comment
  is 'A user enter description of the outcome of the student intervention.
Example: Johnny responeded to tutoring and achieved a math grade of 77.';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.intervention_result_rank
  is 'Ranks the result of the intervention on a scale of 1 to 5.
1 being unsuccessful and 5 being completely successful.
Values: 1 - 5';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.create_date
  is 'Date and time the Intervention was created';
comment on column QUINLANDATA.DWS_STUDENT_INTERVENTION.last_update
  is 'Date and time the Intervention was last updated';
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint PK_DWS_STUDENT_INTERVENTION primary key (STUDENT_INTERVENTION_SID)
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
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint AK_DWS_STUDENT_INTERV_DWS_STUD unique (STUDENT_SID, INTERVENTION_SID, INTERVENTION_BEGIN_DATE)
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
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STUD_INV_REF_STU_DIM foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STUD_REF_DWS_INTE foreign key (INTERVENTION_SID)
  references QUINLANDATA.DWS_INTERVENTION (INTERVENTION_SID);
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STU_INV_REF_DWS_INV_STS foreign key (INTERVENTION_STATUS_SID)
  references QUINLANDATA.DWS_STU_INTERVENTION_STATUS (INTERVENTION_STATUS_SID);
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_DWS_STU_INV_REF_USER_ACC foreign key (CREATED_BY_USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);
alter table QUINLANDATA.DWS_STUDENT_INTERVENTION
  add constraint FK_STU_INT_REF_USER_ACCT_UPD foreign key (LAST_UPDATE_USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table DWS_INTERVENTION_NOTE
prompt ====================================
prompt
create table QUINLANDATA.DWS_INTERVENTION_NOTE
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE.intervention_note_sid
  is 'Surrogate Key for the intervention Note';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE.intervention_note_dt
  is 'The date and time that the note was created';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE.intervention_note_text
  is 'The user enter text describing some event related to the intervention.';
comment on column QUINLANDATA.DWS_INTERVENTION_NOTE.last_update
  is 'The date and time the note was last updated.  Will initially be the same as the creation date.';
alter table QUINLANDATA.DWS_INTERVENTION_NOTE
  add constraint PK_DWS_INTERVENTION_NOTE primary key (INTERVENTION_NOTE_SID)
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
alter table QUINLANDATA.DWS_INTERVENTION_NOTE
  add constraint DWS_INTERVENTION_NOTE_AK unique (STUDENT_INTERVENTION_SID, INTERVENTION_NOTE_DT)
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
alter table QUINLANDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_NOTE_REF_DWS_INTE foreign key (INTERVENTION_NOTE_TYPE_SID)
  references QUINLANDATA.DWS_INTERVENTION_NOTE_TYPE (INTERVENTION_NOTE_TYPE_SID);
alter table QUINLANDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_NOTE_REF_USER_ACCT foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);
alter table QUINLANDATA.DWS_INTERVENTION_NOTE
  add constraint FK_DWS_INTE_REF_DWS_STUD_INTV foreign key (STUDENT_INTERVENTION_SID)
  references QUINLANDATA.DWS_STUDENT_INTERVENTION (STUDENT_INTERVENTION_SID);

prompt
prompt Creating table DWS_STUDENT_NOTE
prompt ===============================
prompt
create table QUINLANDATA.DWS_STUDENT_NOTE
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.DWS_STUDENT_NOTE.note_author_sid
  is 'User Surrogate Key';
alter table QUINLANDATA.DWS_STUDENT_NOTE
  add constraint PK_DWS_STUDENT_NOTE primary key (NOTE_ID)
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
alter table QUINLANDATA.DWS_STUDENT_NOTE
  add constraint AK_DWS_STUDENT_NOTE_A_DWS_STUD unique (STUDENT_SID, NOTE_DTTM)
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
alter table QUINLANDATA.DWS_STUDENT_NOTE
  add constraint DWS_STUDENT_NOTE_FK1 foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.DWS_STUDENT_NOTE
  add constraint DWS_STUDENT_NOTE_FK3 foreign key (NOTE_AUTHOR_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table EMAIL_TYPE
prompt =========================
prompt
create table QUINLANDATA.EMAIL_TYPE
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
comment on column QUINLANDATA.EMAIL_TYPE.email_type_sid
  is 'Surrogate Key for the Email Type';
comment on column QUINLANDATA.EMAIL_TYPE.email_type
  is 'Indicates the kind of email.
Example: New User,
                Password Reset,
                Welcome to Reveal,
                System Maintenance';
alter table QUINLANDATA.EMAIL_TYPE
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
create table QUINLANDATA.EMAIL_SPECIFICATION
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
comment on column QUINLANDATA.EMAIL_SPECIFICATION.email_sid
  is 'Surrogate Key for the Email Specification.';
comment on column QUINLANDATA.EMAIL_SPECIFICATION.email_type_sid
  is 'Surrogate Key for the Email Type';
comment on column QUINLANDATA.EMAIL_SPECIFICATION.email_subject
  is 'Email Subject Line.
Example: Password Reset Request ';
comment on column QUINLANDATA.EMAIL_SPECIFICATION.email_body
  is 'The Main Body of the Email.
Eample:
Logon within 72 hours otherwise your account will need to unlocked by the District Administrator.
Use the link below to reset your account.
';
comment on column QUINLANDATA.EMAIL_SPECIFICATION.application_link
  is 'The HTML link to the appliction login.';
comment on column QUINLANDATA.EMAIL_SPECIFICATION.salutation
  is 'The closing of the email.
Example:
Sincerely,
The SchoolViz Support Team';
alter table QUINLANDATA.EMAIL_SPECIFICATION
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
alter table QUINLANDATA.EMAIL_SPECIFICATION
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
alter table QUINLANDATA.EMAIL_SPECIFICATION
  add constraint FK_EMAIL_SP_REFERENCE_EMAIL_TY foreign key (EMAIL_TYPE_SID)
  references QUINLANDATA.EMAIL_TYPE (EMAIL_TYPE_SID);

prompt
prompt Creating table EMP
prompt ==================
prompt
create table QUINLANDATA.EMP
(
  empno    NUMBER(4) not null,
  ename    VARCHAR2(10),
  job      VARCHAR2(9),
  mgr      NUMBER(4),
  hiredate DATE,
  sal      NUMBER(7,2),
  comm     NUMBER(7,2),
  deptno   NUMBER(2)
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
alter table QUINLANDATA.EMP
  add primary key (EMPNO)
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
alter table QUINLANDATA.EMP
  add foreign key (DEPTNO)
  references QUINLANDATA.DEPT (DEPTNO);
alter table QUINLANDATA.EMP
  add foreign key (MGR)
  references QUINLANDATA.EMP (EMPNO);

prompt
prompt Creating table ETL_EVENT_LOG
prompt ============================
prompt
create table QUINLANDATA.ETL_EVENT_LOG
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
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column QUINLANDATA.ETL_EVENT_LOG.event_time
  is 'Defaults to SYSDATE';
comment on column QUINLANDATA.ETL_EVENT_LOG.event_type
  is 'Values: Warning, Informational, Error';
comment on column QUINLANDATA.ETL_EVENT_LOG.source_name
  is 'Values: Cognos, PL/SQL, Perl, SQL*Loader, Other';
comment on column QUINLANDATA.ETL_EVENT_LOG.status
  is 'Values: Started, Running, Failed, Succeeded';
comment on column QUINLANDATA.ETL_EVENT_LOG.elapsed_time
  is 'In seconds';
create index QUINLANDATA.BMI_EVENT_LOG_EVENT_TYPE on QUINLANDATA.ETL_EVENT_LOG (EVENT_TYPE)
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
create index QUINLANDATA.BMI_EVENT_LOG_STATUS on QUINLANDATA.ETL_EVENT_LOG (STATUS)
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
alter table QUINLANDATA.ETL_EVENT_LOG
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
create table QUINLANDATA.ETL_GRADINGPERIOD_TO_GRADETYPE
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
comment on table QUINLANDATA.ETL_GRADINGPERIOD_TO_GRADETYPE
  is 'Converts CDM grading period to CORE Grade_Type as well as identifing the associated period number.';
comment on column QUINLANDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.cdm_grading_period
  is 'The GradingPeriod from the TSDS CDM model.
Example: First Six Weeks,
                Second Nine Weeks,
                Second Semester';
comment on column QUINLANDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.period_number
  is 'Grading Period for specific Grade Type';
comment on column QUINLANDATA.ETL_GRADINGPERIOD_TO_GRADETYPE.cycle_type
  is 'Values(Six, Nine, Sem).  Used to Access Date_DIM in common loader.';

prompt
prompt Creating table EXECUTION_LOG
prompt ============================
prompt
create table QUINLANDATA.EXECUTION_LOG
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
comment on table QUINLANDATA.EXECUTION_LOG
  is 'Tracks information about each run of the risk factor calculation engine or the load process.';
comment on column QUINLANDATA.EXECUTION_LOG.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column QUINLANDATA.EXECUTION_LOG.process_name
  is 'Name of the process being run
Example: Attendance
               CoreCourseFailure
               ';
comment on column QUINLANDATA.EXECUTION_LOG.process_type
  is 'Type of process being run
Example: RCE
               District Load
               Campus Load';
comment on column QUINLANDATA.EXECUTION_LOG.execution_end_time
  is 'The datetime that the engine stopped processing this risk factor';
comment on column QUINLANDATA.EXECUTION_LOG.execution_result
  is 'The outcome of the execution.
Values: Successful
             Failed';
alter table QUINLANDATA.EXECUTION_LOG
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
create table QUINLANDATA.EXECUTION_PARAMETER
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
comment on table QUINLANDATA.EXECUTION_PARAMETER
  is 'Contains the parameters used in the execution of a system process.';
comment on column QUINLANDATA.EXECUTION_PARAMETER.execution_start_time
  is 'The datetime that the engine started processing this risk factor';
comment on column QUINLANDATA.EXECUTION_PARAMETER.parameter_name
  is 'The name of the parameter used in the risk factor calculation.
Example: Periods Per Day
                Attendance Threshold';
comment on column QUINLANDATA.EXECUTION_PARAMETER.parameter_value
  is 'The Value of the first parameter used in the risk factor calculation.
Example: 7';
alter table QUINLANDATA.EXECUTION_PARAMETER
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
alter table QUINLANDATA.EXECUTION_PARAMETER
  add constraint FK_EXECUTIO_REFERENCE_EXECUTIO foreign key (EXECUTION_START_TIME, CAMPUS_SID)
  references QUINLANDATA.EXECUTION_LOG (EXECUTION_START_TIME, CAMPUS_SID);

prompt
prompt Creating table GRADE_LEVEL_DIM
prompt ==============================
prompt
create table QUINLANDATA.GRADE_LEVEL_DIM
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
comment on table QUINLANDATA.GRADE_LEVEL_DIM
  is 'Identifies the student grade level.
Example: 01
                PK
                KG
                12';
comment on column QUINLANDATA.GRADE_LEVEL_DIM.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column QUINLANDATA.GRADE_LEVEL_DIM.grade_level
  is 'Identifies a students assigned grade.
Example: 01
                02
                12';
comment on column QUINLANDATA.GRADE_LEVEL_DIM.grade_level_description
  is 'Describes a grade level.
Example: First Grade
               Second Grade
               Twelth Grade';
comment on column QUINLANDATA.GRADE_LEVEL_DIM.grade_level_order
  is 'Indicates the order of the grade levels for sorting.
Example: 1
                2
                3
';
alter table QUINLANDATA.GRADE_LEVEL_DIM
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
create table QUINLANDATA.GRADE_TYPE_DIM
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
comment on table QUINLANDATA.GRADE_TYPE_DIM
  is 'Identifies the period in time the grade occured.
Example: Progess Report
               Marking Period
               6 Weeks
               Semester
               Exam
';
comment on column QUINLANDATA.GRADE_TYPE_DIM.grade_type_sid
  is 'Surrogate Key for the Grade Type dim';
comment on column QUINLANDATA.GRADE_TYPE_DIM.grade_type
  is 'Describes what type of grade.
Example: Six Weeks,
                Semester,
                Progress Report,
                Exam,
                Final';
comment on column QUINLANDATA.GRADE_TYPE_DIM.grade_type_description
  is 'The Full Description of the grade type.
Example: The six weeks grade revceived by the student';
comment on column QUINLANDATA.GRADE_TYPE_DIM.last_update
  is 'The data time this row was last insert/updated';
alter table QUINLANDATA.GRADE_TYPE_DIM
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
create table QUINLANDATA.INCIDENT_BEHAVIOR_DIM
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
comment on table QUINLANDATA.INCIDENT_BEHAVIOR_DIM
  is 'Identifies the student behaviors associated with a discipline event.';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_sid
  is 'Uniquely identifies an incident behavior.';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.campus_id
  is 'Campus Id copied from the campus dim.';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_code
  is 'Local code that identifies a student behavior associated with an incident.';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_description
  is 'Describes a students behavior
Example: Permanent Removal By A Teacher From Class,
               Alcoholic Beverage,
               Bullying';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_category
  is 'Grouping of behaviors
Examples: School Code of Conduct,
                  State Offense';
comment on column QUINLANDATA.INCIDENT_BEHAVIOR_DIM.incident_behavior_key
  is 'Business key for the incident behavior. Consisting of the state code, campus id
and behavior code.
Example: TX*849304001*37';
alter table QUINLANDATA.INCIDENT_BEHAVIOR_DIM
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
alter table QUINLANDATA.INCIDENT_BEHAVIOR_DIM
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
create table QUINLANDATA.INCIDENT_LOCATION_DIM
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
comment on table QUINLANDATA.INCIDENT_LOCATION_DIM
  is 'The location where a discipline incident took place';
comment on column QUINLANDATA.INCIDENT_LOCATION_DIM.incident_location_sid
  is 'Uniquely identifies the Incident Location';
comment on column QUINLANDATA.INCIDENT_LOCATION_DIM.incident_location
  is 'Identifies the place where an incident took place.
Example: Classroom,
                Cafeteria area,
                Unknown';
comment on column QUINLANDATA.INCIDENT_LOCATION_DIM.incident_location_key
  is 'Business key for the incident location.
Example: TX*108909*Classroom';
alter table QUINLANDATA.INCIDENT_LOCATION_DIM
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
alter table QUINLANDATA.INCIDENT_LOCATION_DIM
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
create table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
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
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  is 'Combines Student_Risk_Factor_Facts for a student which might span multiple campuses into a single view of the students risk.';
comment on column QUINLANDATA.MERGED_STUDENT_RISK_FACTOR.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.MERGED_STUDENT_RISK_FACTOR.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.MERGED_STUDENT_RISK_FACTOR.risk_factor_count
  is 'Measure used by report tools to count number of studnets with risk factors.
Value 1';
alter table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint PK_MERGED_STUDENT_RISK_FACTOR primary key (STUDENT_SID, RISK_FACTOR_SID, FLAG_DATE_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_RISK_FAC foreign key (RISK_FACTOR_SID)
  references QUINLANDATA.RISK_FACTOR (RISK_FACTOR_SID);
alter table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MERGED_S_REFERENCE_STUDENT_ foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_END_DATE_DIM foreign key (END_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.MERGED_STUDENT_RISK_FACTOR
  add constraint FK_MER_STU_REF_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table NINTH_GRD_COHORT
prompt ===============================
prompt
create table QUINLANDATA.NINTH_GRD_COHORT
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
prompt Creating table RACE_ETHNICITY_DIM
prompt =================================
prompt
create table QUINLANDATA.RACE_ETHNICITY_DIM
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
comment on table QUINLANDATA.RACE_ETHNICITY_DIM
  is 'Idenitfies the ethnicity and race selections of a person.';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.race_ethnicity_sid
  is 'Surrogate key';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.yes_no_key
  is 'A look up key based on Y and N flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.binary_key
  is 'A look up key based on 1 and 0 flags from the source that map to the corresponding values and positions in the race_ethnicity_key.';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.race_ethnicity_key
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
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.ethnicity
  is 'Indicates that the individual selected Hispanic/Latino(Yes) or Not Hispanic/Latino(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.ethnicity_description
  is 'Values:
Hispanic/Latino
Not Hispanic/Latino';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.american_indian_alaska_native
  is 'Indicates that the individual selected American Indian/Alaska Native(Yes) or Not American Indian/Alaska Native(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.amer_indian_alaskan_desc
  is 'Values:
American Indian or Alaska Native
Not American Indian or Alaska Native';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.asian
  is 'Indicates that the individual selected Asian(Yes) or Not Asian(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.asian_description
  is 'Values:
Asian
Not Asian';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.black_or_african_american
  is 'Indicates that the individual selected Black or African American(Yes) or Not Black or African American(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.black_african_amer_desc
  is 'Values:
Black or African American
Not Black or African American';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.native_hawaiian_pacific_island
  is 'Indicates that the individual selected Native Hawaiian or Pacific Islander(Yes) or Not Native Hawaiian or Pacific Islander(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.hawaiian_pacific_island_desc
  is 'Values:
Native Hawaiian/Other Pacific Islander
Not Native Hawaiian/Other Pacific Islander';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.white
  is 'Indicates that the individual selected White(Yes) or Not White(No).
Values:
Yes
No';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.white_description
  is 'Values:
White
Not White';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.two_or_more_races
  is 'Indicates that two or more races were selected.
Example:
Asian, White';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.race_ethnicity_long_desc
  is 'The verbose description of the selected races.
Example:
Hispanic/Latino, American Indian or Alaska Native, Asian, Black or African American, Native Hawaiian/Other Pacific_Islander, White

Black or African American, White';
comment on column QUINLANDATA.RACE_ETHNICITY_DIM.race_ethnicity_short_desc
  is 'A short abbreviated description of the races selected.
Example:
Hispanic, Amer. Indian/Alaska Nat. , Asian, Black, Hawaiian/Pacific Is., White

Black, White';
alter table QUINLANDATA.RACE_ETHNICITY_DIM
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
alter table QUINLANDATA.RACE_ETHNICITY_DIM
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
create table QUINLANDATA.SOURCE
(
  source_sid         NUMBER not null,
  source_name        VARCHAR2(50) not null,
  source_description VARCHAR2(500),
  active_flag        VARCHAR2(1) not null
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
comment on table QUINLANDATA.SOURCE
  is 'The source of data for the reporting category.';
comment on column QUINLANDATA.SOURCE.source_sid
  is 'Uniquely identifies the source.';
comment on column QUINLANDATA.SOURCE.source_name
  is 'The name of the source of the data of the reporting category.
Example: TxEIS,
                TexasStudentDataSystem(TSDS),
                 Jira';
comment on column QUINLANDATA.SOURCE.source_description
  is 'Description of the Source.';
comment on column QUINLANDATA.SOURCE.active_flag
  is 'Indicates if the source is available for use.
Values: Y/N';
alter table QUINLANDATA.SOURCE
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
alter table QUINLANDATA.SOURCE
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
create table QUINLANDATA.REPORT_CATEGORY
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
comment on table QUINLANDATA.REPORT_CATEGORY
  is 'Defines the groupings of reports. Such as Student, Registration, Health, etc.';
comment on column QUINLANDATA.REPORT_CATEGORY.source_sid
  is 'Uniquely identifies the source.';
comment on column QUINLANDATA.REPORT_CATEGORY.report_category
  is 'Used to group reports together.
  Example: Student,
                  Finance';
comment on column QUINLANDATA.REPORT_CATEGORY.report_category_description
  is 'Describes the REPORT CATEGORY';
comment on column QUINLANDATA.REPORT_CATEGORY.active_flag
  is 'denotes if the category is in use.
Values: Y/N';
alter table QUINLANDATA.REPORT_CATEGORY
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
alter table QUINLANDATA.REPORT_CATEGORY
  add constraint FK_REP_CAT_REF_SOURCE foreign key (SOURCE_SID)
  references QUINLANDATA.SOURCE (SOURCE_SID);

prompt
prompt Creating table REPORT_TYPE
prompt ==========================
prompt
create table QUINLANDATA.REPORT_TYPE
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
comment on table QUINLANDATA.REPORT_TYPE
  is 'The kind of report';
alter table QUINLANDATA.REPORT_TYPE
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
create table QUINLANDATA.REPORT_LIST
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
comment on column QUINLANDATA.REPORT_LIST.report_name
  is 'The name of the report to be displayed on the main page.';
comment on column QUINLANDATA.REPORT_LIST.report_description
  is 'Describes the REPORT';
comment on column QUINLANDATA.REPORT_LIST.report_alias
  is 'The APEX page alias for the report, used in the link to the page';
comment on column QUINLANDATA.REPORT_LIST.report_category_sid
  is 'Foriegn key to report_category table';
comment on column QUINLANDATA.REPORT_LIST.active_flag
  is 'Used to indicate if a flag is active for use or not.
  values: Y,
           N';
alter table QUINLANDATA.REPORT_LIST
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
alter table QUINLANDATA.REPORT_LIST
  add constraint FK_REPORT_L_REFERENCE_REPORT_C foreign key (REPORT_CATEGORY_SID)
  references QUINLANDATA.REPORT_CATEGORY (REPORT_CATEGORY_SID)
  deferrable initially deferred;
alter table QUINLANDATA.REPORT_LIST
  add constraint FK_REPORT_L_REFERENCE_REPORT_T foreign key (REPORT_TYPE_SID)
  references QUINLANDATA.REPORT_TYPE (REPORT_TYPE_SID);

prompt
prompt Creating table RF_DISPLAY_COLUMNS
prompt =================================
prompt
create table QUINLANDATA.RF_DISPLAY_COLUMNS
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
alter table QUINLANDATA.RF_DISPLAY_COLUMNS
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
create table QUINLANDATA.SECURITY_QUESTION_TYPE
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
comment on column QUINLANDATA.SECURITY_QUESTION_TYPE.security_question_type_sid
  is 'Surrogate Key for the Security Question Type';
comment on column QUINLANDATA.SECURITY_QUESTION_TYPE.security_question_type_name
  is 'Denotes the type of Security Question.
Values: Login,
            External IP Address,
            Password Reset';
comment on column QUINLANDATA.SECURITY_QUESTION_TYPE.security_question_type_desc
  is 'Describes the Security Question Type.
Example: The login question type will be answered by the user every time the user logs into the

system.';
alter table QUINLANDATA.SECURITY_QUESTION_TYPE
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
create table QUINLANDATA.SECURITY_QUESTION
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
comment on column QUINLANDATA.SECURITY_QUESTION.security_question_sid
  is 'Surrogate Key for the security Question';
comment on column QUINLANDATA.SECURITY_QUESTION.security_question_type_sid
  is 'Surrogate Key for the Security Question Type';
comment on column QUINLANDATA.SECURITY_QUESTION.security_question
  is 'A question used to identify a valid user.
Example: What is your birth city?';
alter table QUINLANDATA.SECURITY_QUESTION
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
alter table QUINLANDATA.SECURITY_QUESTION
  add constraint FK_SECURITY_REFERENCE_SECURITY foreign key (SECURITY_QUESTION_TYPE_SID)
  references QUINLANDATA.SECURITY_QUESTION_TYPE (SECURITY_QUESTION_TYPE_SID);

prompt
prompt Creating table SECURITY_TRANSACTION_LOG
prompt =======================================
prompt
create table QUINLANDATA.SECURITY_TRANSACTION_LOG
(
  security_transaction_sid NUMBER not null,
  user_sid                 NUMBER,
  user_id                  VARCHAR2(75),
  transaction_date         DATE,
  log_message              VARCHAR2(2000),
  action_type              VARCHAR2(100),
  action_result            VARCHAR2(100),
  attempts                 NUMBER(1),
  user_ip_address          VARCHAR2(100)
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
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.security_transaction_sid
  is 'Surrogate key for the logon transaction.';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.user_id
  is 'The User ID of the person attempting to login.';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.transaction_date
  is 'Date and time of the security transaction.';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.log_message
  is 'Indicates the result of the users attempt to login to an application.
Values: SUCCESSFUL LOGIN,
             UNSUCCESSFUL LOGIN,
             ACCOUNT LOCKED,
             PASSWORD CHANGED,
             USER ROLE ADDED,
             APPLICATION LICENSE DELETED,
             <ATTENDANCE> RISK FACTOR DELETED FOR CAMPUS <057938001>';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.action_type
  is 'Indicates what type of action was taken by the user.
Example: Login Attempt,
               Password Reset,
               First Time Login,
               External Security Question,
               Login Question, etc..';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.action_result
  is 'Indicates the result of the users action.
Example: Successful,
               Failed
               ';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.attempts
  is 'Indicates the number times the user entered their password or security question before either

successfully or unsuccessfully logging in.
Example: 2';
comment on column QUINLANDATA.SECURITY_TRANSACTION_LOG.user_ip_address
  is 'The users ip address that they connected to the application from.
Example: 207.235.45.106 (ipv4)
               2001:db8:85a3::8a2e:370:7334 (ipv6)';
alter table QUINLANDATA.SECURITY_TRANSACTION_LOG
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
alter table QUINLANDATA.SECURITY_TRANSACTION_LOG
  add constraint FK_SECURITY_REFERENCE_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table SO_DISTRICT_COPY
prompt ===============================
prompt
create table QUINLANDATA.SO_DISTRICT_COPY
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
create table QUINLANDATA.SO_EMAIL_LDAP
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
create table QUINLANDATA.SO_LDAP_EXPORT
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
create bitmap index QUINLANDATA.BMI_TRANS_NBR on QUINLANDATA.SO_LDAP_EXPORT (TRANS_NBR)
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
create bitmap index QUINLANDATA.BMI_TRANS_TYPE on QUINLANDATA.SO_LDAP_EXPORT (TRANS_TYPE)
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
create table QUINLANDATA.STATE_COURSE_DIM
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
comment on table QUINLANDATA.STATE_COURSE_DIM
  is 'Contains all of the state defined courses.';
comment on column QUINLANDATA.STATE_COURSE_DIM.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column QUINLANDATA.STATE_COURSE_DIM.state_code
  is 'The upper case two character state code for this course.
Example: TX';
comment on column QUINLANDATA.STATE_COURSE_DIM.state_course_code
  is 'The state defined code for the course
Example: 03330100';
comment on column QUINLANDATA.STATE_COURSE_DIM.state_course_description
  is 'The name/description of the state defined course.
Example: US GOVT';
comment on column QUINLANDATA.STATE_COURSE_DIM.core_course_flag
  is 'Indicates that this state course is a "core" course for the purposes of the Failed Course flags.
Values: Yes/No';
comment on column QUINLANDATA.STATE_COURSE_DIM.state_course_key
  is 'The business key used to look state courses. Consisting of the state code * state course code
Example: TX*049304939';
alter table QUINLANDATA.STATE_COURSE_DIM
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
alter table QUINLANDATA.STATE_COURSE_DIM
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
create table QUINLANDATA.STUDENT_CREDIT_FACT
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
    initial 4M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_CREDIT_FACT
  is 'captures the number of credits a student has recieved for the successful completion of course.

Grain: 1 row/student/campus/date/course

Credits will be set to the date of 6/15/school year.';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.student_credit_fact_sid
  is 'A surrogate key for the fact.';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.course_sid
  is 'Surrogate Key for the Course Dim.';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.credits_earned
  is 'The number of credits earned by a student for a particular course.
Example: 1.0,
                0.5,
                0.25
                0.333';
comment on column QUINLANDATA.STUDENT_CREDIT_FACT.local_credits_earned
  is 'This is the value for credits earned from the source.
Examples: 10
                  5
                  NC';
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint PK_STUDENT_CREDIT_FACT primary key (STUDENT_CREDIT_FACT_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 896K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_COURSE_DIM foreign key (COURSE_SID)
  references QUINLANDATA.COURSE_DIM (COURSE_SID);
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references QUINLANDATA.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table QUINLANDATA.STUDENT_CREDIT_FACT
  add constraint FK_STU_CR_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_CREDIT_FACT_ERR
prompt ======================================
prompt
create table QUINLANDATA.STUDENT_CREDIT_FACT_ERR
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
    initial 30M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_CREDIT_FACT_REJ
prompt ======================================
prompt
create table QUINLANDATA.STUDENT_CREDIT_FACT_REJ
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
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_DISCIPLINE_ACTION_FACT
prompt =============================================
prompt
create table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
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
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  is 'Actions taken as a result of a student discipline incident.';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian

partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_length_diff_reason_sid
  is 'Uniquely identifies the Action Length Diff Reason Dim';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.discipline_sid
  is 'Uniquely identifies the Discipline DIM';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.incident_number
  is 'The discipline incident number associated with this action.';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_assigned_days
  is 'The number of days assigned for the action.';
comment on column QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT.action_actual_days
  is 'The number of days actually served for this action.';
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint PK_STUDENT_DISCIPLINE_ACTION_F primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, INCIDENT_NUMBER)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_ACT_LN_DIFF foreign key (ACTION_LENGTH_DIFF_REASON_SID)
  references QUINLANDATA.ACTION_LENGTH_DIFF_REASON_DIM (ACTION_LENGTH_DIFF_REASON_SID);
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID)
  deferrable initially deferred;
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID)
  deferrable initially deferred;
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_DISC_DIM foreign key (DISCIPLINE_SID)
  references QUINLANDATA.DISCIPLINE_DIM (DISCIPLINE_SID);
alter table QUINLANDATA.STUDENT_DISCIPLINE_ACTION_FACT
  add constraint FK_STU_DIS_ACT_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID)
  novalidate;

prompt
prompt Creating table STUDENT_DISC_ACT_FACT_ERR
prompt ========================================
prompt
create table QUINLANDATA.STUDENT_DISC_ACT_FACT_ERR
(
  exception_type                VARCHAR2(75),
  campus_sid                    NUMBER,
  campus_key                    VARCHAR2(100),
  student_sid                   NUMBER,
  student_key                   VARCHAR2(100),
  date_sid                      NUMBER,
  date_key                      VARCHAR2(100),
  action_length_diff_reason_sid NUMBER,
  action_length_diff_reason_key VARCHAR2(100),
  discipline_sid                NUMBER,
  discipline_key                VARCHAR2(20),
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
create table QUINLANDATA.STUDENT_DISC_ACT_FACT_REJ
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
create table QUINLANDATA.STUDENT_ENROLLMENT_FACT
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
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column QUINLANDATA.STUDENT_ENROLLMENT_FACT.entry_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_ENROLLMENT_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column QUINLANDATA.STUDENT_ENROLLMENT_FACT.withdrawal_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_ENROLLMENT_FACT.last_update
  is 'Date that this records was last updated';
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint PK_STUDENT_ENROLLMENT_FACT primary key (CAMPUS_SID, STUDENT_SID, ENTRY_DATE_SID, GRADE_LEVEL_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STUDENT__REFERENCE_GRADE_LE foreign key (GRADE_LEVEL_SID)
  references QUINLANDATA.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_DIM_STUDENT_ENRL foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENRL_TRANS_DATE_DIM foreign key (ENTRY_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_ENROLL_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_ENROLLMENT_FACT
  add constraint FK_STU_REF_WITHDRAW_DATE_DIM foreign key (WITHDRAWAL_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_ENROLLMENT_FACT_ERR
prompt ==========================================
prompt
create table QUINLANDATA.STUDENT_ENROLLMENT_FACT_ERR
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
create table QUINLANDATA.STUDENT_ENROLLMENT_FACT_REJ
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
create table QUINLANDATA.STUDENT_GRADE_FACT
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
    initial 16M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_GRADE_FACT
  is 'Captures a students grade.
Grain = 1 Row/ student/Course Section/date/Grade Type';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.state_course_sid
  is 'Unique identifier for state couse dim.';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.grade_level_sid
  is 'Surrogate Key for Grade level.';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.academic_source_code
  is 'A code that indicates what kind of Academic Source .
Example: T - transfer
               C - Classroom
               E - Exam
               O - online';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.number_grade
  is 'The numerical grade received by a student.
Example: 100,
                 75.6
                 50.07';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.letter_grade
  is 'The letter grade received by a student.
Example: A,
                B,
                 P,
                 NG';
comment on column QUINLANDATA.STUDENT_GRADE_FACT.last_update
  is 'The date/time the row was inserted or updated.';
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint PK_STUDENT_GRADE_FACT primary key (STUDENT_SID, GRADE_TYPE_SID, DATE_SID, COURSE_SECTION_SID, STATE_COURSE_SID, CAMPUS_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 16M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_COURSE_SEC foreign key (COURSE_SECTION_SID)
  references QUINLANDATA.COURSE_SECTION_DIM (COURSE_SECTION_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRADE_F_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_ACD_REC_SRC foreign key (ACADEMIC_SOURCE_CODE)
  references QUINLANDATA.ACADEMIC_RECORD_SOURCE_DIM (ACADEMIC_SOURCE_CODE);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_GRD_F_REF_STATE_CRS_DIM foreign key (STATE_COURSE_SID)
  references QUINLANDATA.STATE_COURSE_DIM (STATE_COURSE_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_LEVEL_DIM foreign key (GRADE_LEVEL_SID)
  references QUINLANDATA.GRADE_LEVEL_DIM (GRADE_LEVEL_SID);
alter table QUINLANDATA.STUDENT_GRADE_FACT
  add constraint FK_STU_REF_GRADE_TYPE foreign key (GRADE_TYPE_SID)
  references QUINLANDATA.GRADE_TYPE_DIM (GRADE_TYPE_SID);

prompt
prompt Creating table STUDENT_GRADE_FACT_ERR
prompt =====================================
prompt
create table QUINLANDATA.STUDENT_GRADE_FACT_ERR
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
    initial 150M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_GRADE_FACT_REJ
prompt =====================================
prompt
create table QUINLANDATA.STUDENT_GRADE_FACT_REJ
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_PERIOD_ABSENCE_FACT
prompt ==========================================
prompt
create table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
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
    initial 17M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  is 'Transactional fact to record when a student is abscent from a class period.';
comment on column QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT.period_absence_count
  is 'A measure for this fact table.  Value: 1';
create index QUINLANDATA.NDX_STU_PRD_ABS_DATE_SID_FK on QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT (DATE_SID)
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 10M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint PK_STUDENT_PERIOD_ABSENCE_FACT primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, CLASS_PERIOD_SID)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 18M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_ABR_RSN_PRD_ABSENCE_FACT foreign key (ABSENCE_REASON_SID)
  references QUINLANDATA.ABSENCE_REASON_DIM (ABSENCE_REASON_SID);
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_DIM_STU_PRD_ABS_FACT foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_CLASS_PER_DIM foreign key (CLASS_PERIOD_SID)
  references QUINLANDATA.CLASS_PERIOD_DIM (CLASS_PERIOD_SID);
alter table QUINLANDATA.STUDENT_PERIOD_ABSENCE_FACT
  add constraint FK_STU_PRD_ABS_FACT_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_PERIOD_ABS_FACT_ERR
prompt ==========================================
prompt
create table QUINLANDATA.STUDENT_PERIOD_ABS_FACT_ERR
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STUDENT_PERIOD_ABS_FACT_REJ
prompt ==========================================
prompt
create table QUINLANDATA.STUDENT_PERIOD_ABS_FACT_REJ
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
create table QUINLANDATA.STUDENT_PERIOD_OVERRIDE
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
comment on table QUINLANDATA.STUDENT_PERIOD_OVERRIDE
  is 'Overides the default campus periods per day for a particular student for the current semester.
Example: 5';
alter table QUINLANDATA.STUDENT_PERIOD_OVERRIDE
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
alter table QUINLANDATA.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_DIM_STU_PRD_OVERIDE foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_PERIOD_OVERRIDE
  add constraint FK_STU_PRD_OVRD_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_FACT
prompt =======================================
prompt
create table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
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
    initial 896K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  is 'Grain = 1 row /student/risk factor/effective date';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_FACT.flag_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_FACT.end_date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_FACT.risk_factor_count
  is 'A measure defined for Cognos reporting; Value 1';
create index QUINLANDATA.NDX_STU_RISK_FACTOR_STU_SID_FK on QUINLANDATA.STUDENT_RISK_FACTOR_FACT (STUDENT_SID)
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint PK_STUDENT_RISK_FACTOR_FACT primary key (CAMPUS_SID, STUDENT_SID, FLAG_DATE_SID, CAMPUS_RISK_FACTOR_SID)
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
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STUDENT__REFERENCE_CAMPUS_D foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_DIM_STU_RISK_FACTOR_F foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_END_DATE_DIM foreign key (END_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FACT_CAMP_RISK_F foreign key (CAMPUS_RISK_FACTOR_SID)
  references QUINLANDATA.CAMPUS_RISK_FACTOR_DIM (CAMPUS_RISK_FACTOR_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_FACT
  add constraint FK_STU_RISK_FLAG_DATE_DIM foreign key (FLAG_DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_PHASE_SUM
prompt ============================================
prompt
create table QUINLANDATA.STUDENT_RISK_FACTOR_PHASE_SUM
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
    initial 8M
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_FACT_CAMPUS foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_PHASE_SUM
  add constraint FK_STU_RISK_PHSS_STU foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);

prompt
prompt Creating table STUDENT_RISK_FACTOR_SNAPSHOT
prompt ===========================================
prompt
create table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
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
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  is 'Grain: 1 row/campus/student/semester

For the current semester the date reflects the date of the last execution of the risk factor calculation engine.';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.attendance_flag
  is 'Indicates that the student was flagged for attendance during this snapshot period.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_attendance_flag
  is 'Indicates that the student was flagged for attendance at the end of an academic semester.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.core_course_failure_flag
  is 'Indicates that the student was flagged for failing a core course during a marking period.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.non_core_course_failure_flag
  is 'Indicates that the student was flagged for failing a non-core course during a marking period.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_core_crs_failure_flag
  is 'Indicates that the student was flagged for failing a core course for a semester.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.semester_noncore_crs_fail_flag
  is 'Indicates that the student was flagged for failing a non-core course for a semester.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.gpa_flag
  is 'Indicates that the student was flagged for a GPA below minium established standard.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.deficient_credits_flag
  is 'Indicates that the student was flagged for having to few credits for a semester.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.discipline_flag
  is 'Indicates that the student was flagged for behavorial problems.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.grade_6_thru_8_retention_flag
  is 'Indicates that the student was flagged for having been retained in grades 6 through 8 one or more times.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.cohort_flag
  is 'Indicates that the student was at risk of not graduating with his/her 9th grade class.
Values: Yes, No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.other_flag
  is 'Indicates that the student has "other" secondary risk factors.  The secondary risk may include LEP, Economically Disadvantaged, SPED, etc..
Values: Yes/No';
comment on column QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT.risk_factor_count
  is 'The total number of risk factors flagged Yes for this student on this date.
Example: 3';
create index QUINLANDATA.NDX_STU_RISK_SNAPSHOT_DATE_FK on QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT (DATE_SID)
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
alter table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint PK_STUDENT_RISK_FACTOR_SNAPSHO primary key (CAMPUS_SID, STUDENT_SID, DATE_SID)
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
alter table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_DIM_STU_RISK_SNAPSHOT foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_FACTOR_FACT_CAMPUS foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID);
alter table QUINLANDATA.STUDENT_RISK_FACTOR_SNAPSHOT
  add constraint FK_STU_RISK_SNAPSHOT_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID);

prompt
prompt Creating table STUDENT_RISK_FCT_PHSE_SUM_XREF
prompt =============================================
prompt
create table QUINLANDATA.STUDENT_RISK_FCT_PHSE_SUM_XREF
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
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STU_DISCIPLINE_INCIDENT_FACT
prompt ===========================================
prompt
create table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
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
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  is 'The occurrence of an incident that may or may not result in a student discipline action.';
comment on column QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT.date_sid
  is 'Surrogate key.  This column must be kept sequential within a district in order to maintian

partitioning.
Format will be district sid concatenated to the date in YYYYMMDD format.
Example:
120100708  for district with sid 1';
comment on column QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT.incident_location_sid
  is 'Uniquely identifies the Incident Location';
comment on column QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT.incident_behavior_sid
  is 'Uniquely identifies an incident behavior.';
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint PK_STU_DISCIPLINE_INCIDENT_FAC primary key (CAMPUS_SID, STUDENT_SID, DATE_SID, INCIDENT_NUMBER)
  using index 
  tablespace DW_DEFAULT01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STUD_DIS_INC_REF_DATE_DIM foreign key (DATE_SID)
  references QUINLANDATA.DATE_DIM (DATE_SID)
  deferrable initially deferred;
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_CAMPUS_DIM foreign key (CAMPUS_SID)
  references QUINLANDATA.CAMPUS_DIM (CAMPUS_SID)
  deferrable initially deferred;
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_INC_BEHAVOR foreign key (INCIDENT_BEHAVIOR_SID)
  references QUINLANDATA.INCIDENT_BEHAVIOR_DIM (INCIDENT_BEHAVIOR_SID);
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_INC_LOC foreign key (INCIDENT_LOCATION_SID)
  references QUINLANDATA.INCIDENT_LOCATION_DIM (INCIDENT_LOCATION_SID);
alter table QUINLANDATA.STU_DISCIPLINE_INCIDENT_FACT
  add constraint FK_STU_DIS_INC_REF_STUDENT_DIM foreign key (STUDENT_SID)
  references QUINLANDATA.STUDENT_DIM (STUDENT_SID)
  novalidate;

prompt
prompt Creating table STU_DISC_INC_FACT_ERR
prompt ====================================
prompt
create table QUINLANDATA.STU_DISC_INC_FACT_ERR
(
  exception_type        VARCHAR2(75),
  campus_sid            NUMBER,
  campus_key            VARCHAR2(100),
  student_sid           NUMBER,
  student_key           VARCHAR2(100),
  date_sid              NUMBER,
  date_key              VARCHAR2(100),
  incident_location_sid NUMBER,
  incident_location_key VARCHAR2(100),
  incident_behavior_sid NUMBER,
  incident_behavior_key VARCHAR2(100),
  incident_number       VARCHAR2(25),
  incident_time         DATE,
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
create table QUINLANDATA.STU_DISC_INC_FACT_REJ
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
    initial 51M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TALEND_ETL_PROCESS
prompt =================================
prompt
create table QUINLANDATA.TALEND_ETL_PROCESS
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
alter table QUINLANDATA.TALEND_ETL_PROCESS
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
create table QUINLANDATA.TALEND_FLOW_METER_CATCHER
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index QUINLANDATA.IX_ACTION_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (ACTION)
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
create index QUINLANDATA.IX_EXTRACT_DATE_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (EXTRACT_DATE)
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
create index QUINLANDATA.IX_JOB_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (JOB)
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
create index QUINLANDATA.IX_LABEL_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (LABEL)
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
create index QUINLANDATA.IX_LEA_NAME_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (LEA_NAME)
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
create index QUINLANDATA.IX_LEA_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (LEA)
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
create index QUINLANDATA.IX_MOMENT_TFC on QUINLANDATA.TALEND_FLOW_METER_CATCHER (MOMENT)
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
create table QUINLANDATA.TALEND_LEA_CONTEXTS
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
create table QUINLANDATA.TALEND_LOG_CATCHER
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
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index QUINLANDATA.IX_EXTRACT_DATE_TLC on QUINLANDATA.TALEND_LOG_CATCHER (EXTRACT_DATE)
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
create index QUINLANDATA.IX_JOB_TLC on QUINLANDATA.TALEND_LOG_CATCHER (JOB)
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
create index QUINLANDATA.IX_LEA_NAME_TLC on QUINLANDATA.TALEND_LOG_CATCHER (LEA_NAME)
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
create index QUINLANDATA.IX_LEA_TLC on QUINLANDATA.TALEND_LOG_CATCHER (LEA)
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
create index QUINLANDATA.IX_MOMENT_TLC on QUINLANDATA.TALEND_LOG_CATCHER (MOMENT)
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
create table QUINLANDATA.TALEND_STAT_CATCHER
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
create index QUINLANDATA.IX_EXTRACT_DATE_TSC on QUINLANDATA.TALEND_STAT_CATCHER (EXTRACT_DATE)
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
create index QUINLANDATA.IX_JOB_TSC on QUINLANDATA.TALEND_STAT_CATCHER (JOB)
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
create index QUINLANDATA.IX_LEA_NAME_TSC on QUINLANDATA.TALEND_STAT_CATCHER (LEA_NAME)
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
create index QUINLANDATA.IX_LEA_TSC on QUINLANDATA.TALEND_STAT_CATCHER (LEA)
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
create index QUINLANDATA.IX_MOMENT_TSC on QUINLANDATA.TALEND_STAT_CATCHER (MOMENT)
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
prompt Creating table TXSTU_USER_STUDENT_SECURITY
prompt ==========================================
prompt
create table QUINLANDATA.TXSTU_USER_STUDENT_SECURITY
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
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUINLANDATA.TXSTU_USER_STUDENT_SECURITY
  add constraint PK_TXSTU_USER_STU_SEC primary key (STU_ID, USER_ID, SCH_YR)
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
prompt Creating table USER_CAMPUS
prompt ==========================
prompt
create table QUINLANDATA.USER_CAMPUS
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
comment on column QUINLANDATA.USER_CAMPUS.user_campus_sid
  is 'Surrogate Key for the User Campus';
comment on column QUINLANDATA.USER_CAMPUS.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.USER_CAMPUS.campus_master_sid
  is 'Surrogate Key for the Campus Master';
alter table QUINLANDATA.USER_CAMPUS
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
alter table QUINLANDATA.USER_CAMPUS
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
alter table QUINLANDATA.USER_CAMPUS
  add constraint FK_USER_CAM_REFERENCE_CAMPUS_M foreign key (CAMPUS_MASTER_SID)
  references QUINLANDATA.CAMPUS_MASTER (CAMPUS_MASTER_SID);
alter table QUINLANDATA.USER_CAMPUS
  add constraint FK_USER_CAM_REFERENCE_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_REPORT
prompt ==========================
prompt
create table QUINLANDATA.USER_REPORT
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
comment on table QUINLANDATA.USER_REPORT
  is 'A specific report assigned to a user.';
comment on column QUINLANDATA.USER_REPORT.user_sid
  is 'User Surrogate Key';
alter table QUINLANDATA.USER_REPORT
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
alter table QUINLANDATA.USER_REPORT
  add constraint FK_USER_REP_REFERENCE_REPORT_L foreign key (REPORT_LIST_SID)
  references QUINLANDATA.REPORT_LIST (REPORT_LIST_SID);
alter table QUINLANDATA.USER_REPORT
  add constraint FK_USER_REP_REFERENCE_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_REPORT_CATEGORY
prompt ===================================
prompt
create table QUINLANDATA.USER_REPORT_CATEGORY
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
comment on table QUINLANDATA.USER_REPORT_CATEGORY
  is 'Defines which report categorys a user is allowed acces.';
comment on column QUINLANDATA.USER_REPORT_CATEGORY.user_sid
  is 'User Surrogate Key';
alter table QUINLANDATA.USER_REPORT_CATEGORY
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
alter table QUINLANDATA.USER_REPORT_CATEGORY
  add constraint FK_USER_REP_CAT_REF_REP_CAT foreign key (REPORT_CATEGORY_SID)
  references QUINLANDATA.REPORT_CATEGORY (REPORT_CATEGORY_SID);
alter table QUINLANDATA.USER_REPORT_CATEGORY
  add constraint FK_USER_REP_CAT_REF_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_ROLE
prompt ========================
prompt
create table QUINLANDATA.USER_ROLE
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
comment on column QUINLANDATA.USER_ROLE.user_role_sid
  is 'User Role Surrogate Key';
comment on column QUINLANDATA.USER_ROLE.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.USER_ROLE.application_role_sid
  is 'Surrogate Key for the Application Role';
comment on column QUINLANDATA.USER_ROLE.default_application_flag
  is 'Denotes which application the user will be connected to after successful login(authorization).
Values: Y/N';
alter table QUINLANDATA.USER_ROLE
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
alter table QUINLANDATA.USER_ROLE
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
alter table QUINLANDATA.USER_ROLE
  add constraint FK_USER_ROL_REFERENCE_APPLICAT foreign key (APPLICATION_ROLE_SID)
  references QUINLANDATA.APPLICATION_ROLE (APPLICATION_ROLE_SID);
alter table QUINLANDATA.USER_ROLE
  add constraint FK_USER_ROL_REFERENCE_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_SECURITY_QUESTION
prompt =====================================
prompt
create table QUINLANDATA.USER_SECURITY_QUESTION
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
comment on column QUINLANDATA.USER_SECURITY_QUESTION.user_security_question_sid
  is 'Surrogate Key for the User Security Question';
comment on column QUINLANDATA.USER_SECURITY_QUESTION.security_question_sid
  is 'Surrogate Key for the security Question';
comment on column QUINLANDATA.USER_SECURITY_QUESTION.user_sid
  is 'User Surrogate Key';
comment on column QUINLANDATA.USER_SECURITY_QUESTION.user_response
  is 'The users answer to the security question.';
alter table QUINLANDATA.USER_SECURITY_QUESTION
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
alter table QUINLANDATA.USER_SECURITY_QUESTION
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
alter table QUINLANDATA.USER_SECURITY_QUESTION
  add constraint FK_USER_SEC_REFERENCE_SECURITY foreign key (SECURITY_QUESTION_SID)
  references QUINLANDATA.SECURITY_QUESTION (SECURITY_QUESTION_SID);
alter table QUINLANDATA.USER_SECURITY_QUESTION
  add constraint FK_USER_SEC_REFERENCE_USER_ACC foreign key (USER_SID)
  references QUINLANDATA.USER_ACCOUNT (USER_SID);

prompt
prompt Creating table USER_STUDENT_SECURITY
prompt ====================================
prompt
create table QUINLANDATA.USER_STUDENT_SECURITY
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
alter table QUINLANDATA.USER_STUDENT_SECURITY
  add constraint PK_USER_STUDENT_SECURITY primary key (USER_ID, DISTRICT_SID, STUDENT_SID)
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

prompt
prompt Creating sequence DEMO_CUST_SEQ
prompt ===============================
prompt
create sequence QUINLANDATA.DEMO_CUST_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 8
increment by 1
cache 20;

prompt
prompt Creating sequence DEMO_ORDER_ITEMS_SEQ
prompt ======================================
prompt
create sequence QUINLANDATA.DEMO_ORDER_ITEMS_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 50
increment by 1
cache 20;

prompt
prompt Creating sequence DEMO_ORD_SEQ
prompt ==============================
prompt
create sequence QUINLANDATA.DEMO_ORD_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 11
increment by 1
cache 20;

prompt
prompt Creating sequence DEMO_PROD_SEQ
prompt ===============================
prompt
create sequence QUINLANDATA.DEMO_PROD_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 11
increment by 1
cache 20;

prompt
prompt Creating sequence DEPT_SEQ
prompt ==========================
prompt
create sequence QUINLANDATA.DEPT_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 50
increment by 1
cache 20;

prompt
prompt Creating sequence EMP_SEQ
prompt =========================
prompt
create sequence QUINLANDATA.EMP_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 8000
increment by 1
cache 20;

prompt
prompt Creating sequence SID_SEQUENCE
prompt ==============================
prompt
create sequence QUINLANDATA.SID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 417411
increment by 1
cache 20;

prompt
prompt Creating synonym CR_ATT_CAL
prompt ===========================
prompt
create or replace synonym QUINLANDATA.CR_ATT_CAL
  for ;

prompt
prompt Creating synonym CR_ATT_OPT
prompt ===========================
prompt
create or replace synonym QUINLANDATA.CR_ATT_OPT
  for ;

prompt
prompt Creating synonym CR_DEMO
prompt ========================
prompt
create or replace synonym QUINLANDATA.CR_DEMO
  for ;

prompt
prompt Creating synonym CR_INSTR_CYR
prompt =============================
prompt
create or replace synonym QUINLANDATA.CR_INSTR_CYR
  for ;

prompt
prompt Creating synonym DR_CRS_OFFERED_CYR
prompt ===================================
prompt
create or replace synonym QUINLANDATA.DR_CRS_OFFERED_CYR
  for ;

prompt
prompt Creating synonym DR_DEMO
prompt ========================
prompt
create or replace synonym QUINLANDATA.DR_DEMO
  for ;

prompt
prompt Creating synonym ET_C012_GEN
prompt ============================
prompt
create or replace synonym QUINLANDATA.ET_C012_GEN
  for ;

prompt
prompt Creating synonym ET_C035_INSTRUCTSET
prompt ====================================
prompt
create or replace synonym QUINLANDATA.ET_C035_INSTRUCTSET
  for ;

prompt
prompt Creating synonym ET_C053_HANDICAP
prompt =================================
prompt
create or replace synonym QUINLANDATA.ET_C053_HANDICAP
  for ;

prompt
prompt Creating synonym ET_C061_LEP
prompt ============================
prompt
create or replace synonym QUINLANDATA.ET_C061_LEP
  for ;

prompt
prompt Creating synonym ET_C093_PARPERMISS
prompt ===================================
prompt
create or replace synonym QUINLANDATA.ET_C093_PARPERMISS
  for ;

prompt
prompt Creating synonym ET_C095_SPTHRPY
prompt ================================
prompt
create or replace synonym QUINLANDATA.ET_C095_SPTHRPY
  for ;

prompt
prompt Creating synonym ET_C131_YRENDSTATUS
prompt ====================================
prompt
create or replace synonym QUINLANDATA.ET_C131_YRENDSTATUS
  for ;

prompt
prompt Creating synonym ET_C175_BIL_PGM_TYP
prompt ====================================
prompt
create or replace synonym QUINLANDATA.ET_C175_BIL_PGM_TYP
  for ;

prompt
prompt Creating synonym ET_C176_ESL_PGM_TYP
prompt ====================================
prompt
create or replace synonym QUINLANDATA.ET_C176_ESL_PGM_TYP
  for ;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym QUINLANDATA.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym SR_ATT_POST
prompt ============================
prompt
create or replace synonym QUINLANDATA.SR_ATT_POST
  for ;

prompt
prompt Creating synonym SR_CRS_GRD
prompt ===========================
prompt
create or replace synonym QUINLANDATA.SR_CRS_GRD
  for ;

prompt
prompt Creating synonym SR_DISCPLN
prompt ===========================
prompt
create or replace synonym QUINLANDATA.SR_DISCPLN
  for ;

prompt
prompt Creating synonym SR_DISCPLN_ACTN
prompt ================================
prompt
create or replace synonym QUINLANDATA.SR_DISCPLN_ACTN
  for ;

prompt
prompt Creating synonym SR_DISCPLN_OFENS
prompt =================================
prompt
create or replace synonym QUINLANDATA.SR_DISCPLN_OFENS
  for ;

prompt
prompt Creating synonym SR_GRADEBK_HINT_INST
prompt =====================================
prompt
create or replace synonym QUINLANDATA.SR_GRADEBK_HINT_INST
  for ;

prompt
prompt Creating synonym SR_GRADEBK_LOGIN
prompt =================================
prompt
create or replace synonym QUINLANDATA.SR_GRADEBK_LOGIN
  for ;

prompt
prompt Creating synonym SR_HINT_QUES
prompt =============================
prompt
create or replace synonym QUINLANDATA.SR_HINT_QUES
  for ;

prompt
prompt Creating synonym SR_IMMUNIZ
prompt ===========================
prompt
create or replace synonym QUINLANDATA.SR_IMMUNIZ
  for ;

prompt
prompt Creating synonym SR_PARENT
prompt ==========================
prompt
create or replace synonym QUINLANDATA.SR_PARENT
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_BIL_ESL
prompt ====================================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_BIL_ESL
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_CHAP1
prompt ==================================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_CHAP1
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_GT
prompt ===============================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_GT
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_OTHER
prompt ==================================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_OTHER
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_PREG_PUPILS
prompt ========================================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_PREG_PUPILS
  for ;

prompt
prompt Creating synonym SR_SPEC_PGM_SPEC_ED
prompt ====================================
prompt
create or replace synonym QUINLANDATA.SR_SPEC_PGM_SPEC_ED
  for ;

prompt
prompt Creating synonym SR_STU_CAMPUS
prompt ==============================
prompt
create or replace synonym QUINLANDATA.SR_STU_CAMPUS
  for ;

prompt
prompt Creating synonym SR_STU_DEMO
prompt ============================
prompt
create or replace synonym QUINLANDATA.SR_STU_DEMO
  for ;

prompt
prompt Creating synonym SR_STU_DEMO_PEIMS
prompt ==================================
prompt
create or replace synonym QUINLANDATA.SR_STU_DEMO_PEIMS
  for ;

prompt
prompt Creating synonym SR_STU_ENROLL
prompt ==============================
prompt
create or replace synonym QUINLANDATA.SR_STU_ENROLL
  for ;

prompt
prompt Creating synonym ST_ACTIVE_CD
prompt =============================
prompt
create or replace synonym QUINLANDATA.ST_ACTIVE_CD
  for ;

prompt
prompt Creating synonym ST_ATT_POST
prompt ============================
prompt
create or replace synonym QUINLANDATA.ST_ATT_POST
  for ;

prompt
prompt Creating synonym ST_DISCPLN_ACTN
prompt ================================
prompt
create or replace synonym QUINLANDATA.ST_DISCPLN_ACTN
  for ;

prompt
prompt Creating synonym ST_IMMUNIZ_TYP
prompt ===============================
prompt
create or replace synonym QUINLANDATA.ST_IMMUNIZ_TYP
  for ;

prompt
prompt Creating synonym ST_LOC_CD
prompt ==========================
prompt
create or replace synonym QUINLANDATA.ST_LOC_CD
  for ;

prompt
prompt Creating synonym ST_OFENS_CD
prompt ============================
prompt
create or replace synonym QUINLANDATA.ST_OFENS_CD
  for ;

prompt
prompt Creating synonym ST_OFENS_LVL
prompt =============================
prompt
create or replace synonym QUINLANDATA.ST_OFENS_LVL
  for ;

prompt
prompt Creating synonym ST_REC_STATUS
prompt ==============================
prompt
create or replace synonym QUINLANDATA.ST_REC_STATUS
  for ;

prompt
prompt Creating synonym ST_RELATION
prompt ============================
prompt
create or replace synonym QUINLANDATA.ST_RELATION
  for ;

prompt
prompt Creating synonym ST_REP_EXCLUSN
prompt ===============================
prompt
create or replace synonym QUINLANDATA.ST_REP_EXCLUSN
  for ;

prompt
prompt Creating synonym ST_SERIES_TYPE
prompt ===============================
prompt
create or replace synonym QUINLANDATA.ST_SERIES_TYPE
  for ;

prompt
prompt Creating synonym ST_WD_RSN
prompt ==========================
prompt
create or replace synonym QUINLANDATA.ST_WD_RSN
  for ;

prompt
prompt Creating view APPLICATION_V
prompt ===========================
prompt
create or replace force view quinlandata.application_v as
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
create or replace force view quinlandata.execution_load_campus_vw as
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
create or replace force view quinlandata.reveal_lea_contexts as
select "BATCH_GID","LEA_UID","LEA_ID","LEA_NAME","LEA_TYPE","ENVIRONMENT","PRODUCT_ID","PRODUCT_NAME","SRC_DATA_DIR","SRC_LOGS_DIR","TGT_DATA_DIR","TGT_LOGS_DIR","FTP_IP","FTP_PORT","FTP_LOGIN","FTP_PWD","DB_HOST","DB_PORT","DB_DATABASE","DB_SCHEMA","DB_USERNAME","DB_PASSWORD","LAST_MODIFIED" from TALEND_LEA_CONTEXTS;

prompt
prompt Creating view REVEAL_LOG_CATCHER
prompt ================================
prompt
create or replace force view quinlandata.reveal_log_catcher as
select "MOMENT","PID","ROOT_PID","FATHER_PID","PROJECT","JOB","CONTEXT","PRIORITY","TYPE","ORIGIN","MESSAGE","CODE" from talend_log_catcher;

prompt
prompt Creating view SECURITY_QUESTION_USER_V
prompt ======================================
prompt
create or replace force view quinlandata.security_question_user_v as
select
    u.user_id
  , security_question
  , sq.security_question_sid
  , user_response
  , u.password
  , security_question_type_name
from user_security_question uq
  , security_question sq
  , user_account u
  , security_question_type t
where uq.user_sid =  u.user_sid
   and uq.security_question_sid = sq.security_question_sid
   and t.security_question_type_sid = sq.security_question_type_sid;

prompt
prompt Creating view USER_ACCOUNT_V
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.USER_ACCOUNT_V AS
SELECT
   USER_ACCOUNT.DISTRICT_SID,
   DISTRICT_DIM.DISTRICT_NAME,
   USER_ACCOUNT.USER_SID,
   USER_ACCOUNT.USER_ID,
   USER_ACCOUNT.USER_FIRST_NAME,
   USER_ACCOUNT.USER_LAST_NAME,
   USER_ACCOUNT.PASSWORD_EXPIRATION_DATE,
   USER_ACCOUNT.EMAIL_ADDRESS,
   USER_ACCOUNT.CREATED_BY,
   USER_ACCOUNT.CREATE_DATE,
   USER_ACCOUNT.UPDATED_BY,
   USER_ACCOUNT.UPDATE_DATE,
   USER_ACCOUNT.EMPLOYEE_ID,
   USER_ACCOUNT.LAST_LOGIN_DATE,
   USER_ACCOUNT.FIRST_LOGIN_FLAG,
   USER_ACCOUNT.ACCOUNT_LOCKED,
   USER_ACCOUNT.ACTIVE_ACCOUNT_FLAG
FROM
   USER_ACCOUNT
   JOIN DISTRICT_DIM ON DISTRICT_DIM.DISTRICT_SID = USER_ACCOUNT.DISTRICT_SID;

prompt
prompt Creating view USER_APPS_ROLES_V
prompt ===============================
prompt
create or replace force view quinlandata.user_apps_roles_v as
select
    a.application_id
  , a.active_flag
  , a.description
  , ro.role_sid
  , ro.role
  , ro.role_description
  , u.user_sid
  , user_id
  , u.district_sid
  , password_expiration_date
  , user_first_name
  , user_last_name
  , account_locked
  , employee_id
  , active_account_flag
  , ar.application_role_sid
from user_account u
  , user_role r
  , application_role ar
  , application a
  , role_master ro
where u.user_sid = r.user_sid
  and  r.application_role_sid   = ar.application_role_sid
  and a.application_id          = ar.application_id
  and ro.role_sid               =  ar.role_sid
order by a.application_id,  u.user_sid;

prompt
prompt Creating view V_DWS_STUDENT_MASTER
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_STUDENT_MASTER AS
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
       LAST_UPDATE,
       CAMPUS_SID,
       CAMPUS_ID
  FROM STUDENT_DIM
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
create or replace force view quinlandata.v_dws_all_risk_factors as
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
prompt Creating view V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt ==========================================
prompt
create or replace force view quinlandata.v_dws_campus_risk_factor_sum as
select
       a.campus_id,
       a.campus_name,
       sum(a."Attendance") ATTENDANCE,
       sum(a."Semester_Attendance") SEMESTER_ATTENDANCE,
       sum(a."Core_Failure") CORE_FAILURE,
       sum(a."Sem_Core_Failure") SEM_CORE_FAILURE,
       sum(a."NonCore_Failure") NONCORE_FAILURE,
       sum(a."Sem_NonCore_Failure") SEM_NONCORE_FAILURE,
       sum(a."Discipline") DISCIPLINE,
       sum(a."Grade_6-8_Retention") GRADE_6_8_RETENTION,
       sum(a."9th_Grade_Cohort") NINTH_GRADE_COHORT,
       sum(a."Deficient_Credits") DEFICIENT_CREDITS
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
 group by a.campus_id, a.campus_name

/* Original report SQL:
select
'f?p='||:APP_ID||':6:'||:APP_SESSION||':::RIR:IR_CAMPUS_NAME:'||a.campus_name link,
a.campus_name,
 sum(a."Attendance") "Attendance",
 sum(a."Semester Attendance") "Semester Attendance",
 sum(a."Core Failure") "Core Failure",
 sum(a."Sem Core Failure") "Sem Core Failure",
 sum(a."NonCore Failure") "NonCore Failure",
 sum(a."Sem NonCore Failure") "Sem NonCore Failure"
-- sum(a."Discipline") "Discipline",
-- sum(a."Grade 6-8 Retention") "Grade 6-8 Retention"
,sum(a."9th Grade Cohort") "9th Grade Cohort"
from (select
"T6"."CAMPUS_ID" "CAMPUS_ID",
"T6"."CAMPUS_NAME" "CAMPUS_NAME",
"RISK_FACTOR"."RISK_FACTOR_NAME" "RISK_FACTOR_NAME",
"RISK_FACTOR"."RISK_FACTOR_ORDER" "RISK_FACTOR_ORDER",
"STUDENT_DIM"."STUDENT_ID" "STUDENT_ID",
"T"."DATE_ID" "C3",
--max("T"."DATE_ID") over (partition by "RISK_FACTOR"."RISK_FACTOR_NAME") "C4",
--to_char(to_date("T6"."EXECUTION_START_DATE"), 'mm-dd-yy') "C5",
--"T6"."EXECUTION_START_TIME" "EXECUTION_START_TIME",
"T7"."DATE_ID" "DATE_ID",
"T6"."RUN_DATE" "RUN_DATE",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Attendance', 0))) as "Attendance",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Semester Attendance', 0))) as "Semester Attendance",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Core Failure', 0))) as "Core Failure",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Deficient Credits', 0))) as "Deficient Credits",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'GPA', 0))) as "GPA",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'NonCore Failure', 0))) as "NonCore Failure",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Sem Core Failure', 0))) as "Sem Core Failure",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Sem NonCore Failure', 0))) as "Sem NonCore Failure",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Discipline', 0))) as "Discipline",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Grade 6-8 Retention', 0))) as "Grade 6-8 Retention",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'9th Grade Cohort', 0))) as "9th Grade Cohort",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'LEP', 0))) as "LEP",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Low SES', 0))) as "Low SES",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Special Education', 0))) as "Special Education",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Immigrant', 0))) as "Immigrant",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Migrant', 0))) as "Migrant",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'LEP 1st Yr Monitor', 0))) as "LEP 1st Yr Monitor",
(count(decode("RISK_FACTOR"."RISK_FACTOR_SHORT_NAME",'Attendance', 0))) as "LEP 2nd Yr Monitor"
--count("STUDENT_DIM"."STUDENT_ID") as Attendance
 from
"STUDENT_DIM" "STUDENT_DIM",
"RISK_FACTOR" "RISK_FACTOR",
"DATE_DIM" "T",
"EXECUTION_LOAD_CAMPUS_VW" "T6",
"DATE_DIM" "T7",
"MERGED_STUDENT_RISK_FACTOR" "MERGED_STUDENT_RISK_FACTOR",
USER_STUDENT_SECURITY
 where
"STUDENT_DIM".STUDENT_SID = DECODE(USER_STUDENT_SECURITY.STUDENT_SID,-9999,STUDENT_DIM.STUDENT_SID,USER_STUDENT_SECURITY.STUDENT_SID) AND
       "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
and USER_STUDENT_SECURITY.USER_ID = :APP_USER
and "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG"='Yes'
and trunc("T6"."RUN_DATE") between trunc("T7"."DATE_ID")
and trunc("T"."DATE_ID")
and "MERGED_STUDENT_RISK_FACTOR"."STUDENT_SID"="STUDENT_DIM"."STUDENT_SID"
and "MERGED_STUDENT_RISK_FACTOR"."RISK_FACTOR_SID"="RISK_FACTOR"."RISK_FACTOR_SID"
and "MERGED_STUDENT_RISK_FACTOR"."FLAG_DATE_SID"="T7"."DATE_SID"
and "MERGED_STUDENT_RISK_FACTOR"."END_DATE_SID"="T"."DATE_SID"
and "STUDENT_DIM"."CAMPUS_SID"="T6"."CAMPUS_SID"
group by
"T6"."CAMPUS_ID",
"T6"."CAMPUS_NAME",
"RISK_FACTOR"."RISK_FACTOR_NAME",
"RISK_FACTOR"."RISK_FACTOR_ORDER",
"STUDENT_DIM"."STUDENT_ID",
"T"."DATE_ID",
"T6"."EXECUTION_START_DATE",
"T7"."DATE_ID",
"T6"."RUN_DATE"
order by "T6"."CAMPUS_ID") a
group by a.campus_id,a.campus_name
order by a.campus_id
*/
;

prompt
prompt Creating view V_DWS_CREDITS_DETAIL
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_CREDITS_DETAIL AS
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_CREDITS_SUMMARY AS
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
create or replace force view quinlandata.v_dws_curr_risk_factors as
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_DISC_ACT_DETAIL AS
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_DISC_INC_DETAIL AS
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
create or replace force view quinlandata.v_dws_disc_inc_act_detail as
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
create or replace force view quinlandata.v_dws_enrollment_history as
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_GRADES_DETAIL AS
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
prompt Creating view V_DWS_PERIOD_ABS_DETAIL
prompt =====================================
prompt
create or replace force view quinlandata.v_dws_period_abs_detail as
select STUDENT_DIM.STUDENT_SID,
       STUDENT_DIM.FULL_NAME,
       STUDENT_DIM.STUDENT_ID,
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
create or replace force view quinlandata.v_dws_period_abs_sum as
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
create or replace force view quinlandata.v_dws_period_abs_sum_rpt as
with pivot_data AS (
select
"STUDENT_DIM".STUDENT_SID,
"STUDENT_DIM".STUDENT_ID,
initcap("STUDENT_DIM".FULL_NAME) FULL_NAME,
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
select "STUDENT_SID","STUDENT_ID","FULL_NAME","SCHOOL_YEAR_DESCRIPTION","ACADEMIC_6_WEEKS","SHORT_DATE","'Period 01'_PERIOD","'Period 02'_PERIOD","'Period 03'_PERIOD","'Period 04'_PERIOD","'Period 05'_PERIOD","'Period 06'_PERIOD","'Period 07'_PERIOD","'Period 08'_PERIOD","'Period 09'_PERIOD"
from pivot_data
PIVOT (COUNT(PERIOD_ABSENCE_COUNT ) as PERIOD FOR (CLASS_PERIOD) IN ('Period 01','Period 02',
'Period 03','Period 04','Period 05','Period 06','Period 07','Period 08','Period 09'))

/* original sql -
with pivot_data AS (
select
"STUDENT_DIM".STUDENT_SID,
"STUDENT_DIM".STUDENT_ID,
initcap("STUDENT_DIM".FULL_NAME) FULL_NAME,
DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
CASE WHEN(DATE_DIM.ACADEMIC_6_WEEKS IS NULL) THEN NULL ELSE ('Marking Period: '||DATE_DIM.ACADEMIC_6_WEEKS) END ACADEMIC_6_WEEKS,
 --DATE_DIM.DATE_ID,
  DATE_DIM.SHORT_DATE,
  CASE WHEN(CLASS_PERIOD_DIM.CLASS_PERIOD IS NULL) THEN NULL ELSE ('Period '||CLASS_PERIOD_DIM.CLASS_PERIOD) END CLASS_PERIOD,
    --STUDENT_PERIOD_ABSENCE_FACT.PERIOD_ABSENCE_COUNT,
    sum("STUDENT_PERIOD_ABSENCE_FACT"."PERIOD_ABSENCE_COUNT") PERIOD_ABSENCE_COUNT
from
USER_STUDENT_SECURITY,
 "DATE_DIM" "DATE_DIM",
 "CLASS_PERIOD_DIM" "CLASS_PERIOD_DIM",
 "STUDENT_PERIOD_ABSENCE_FACT" "STUDENT_PERIOD_ABSENCE_FACT",
 "STUDENT_DIM" "STUDENT_DIM"
where
 --"STUDENT_DIM".STUDENT_ID = :P15_STUDENT_ID
--and
 "STUDENT_DIM"."CURRENTLY_ENROLLED_FLAG"='Yes'
 and "DATE_DIM"."DATE_SID"="STUDENT_PERIOD_ABSENCE_FACT"."DATE_SID"
 and "CLASS_PERIOD_DIM"."CLASS_PERIOD_SID"="STUDENT_PERIOD_ABSENCE_FACT"."CLASS_PERIOD_SID"
 and "STUDENT_DIM"."STUDENT_SID"="STUDENT_PERIOD_ABSENCE_FACT"."STUDENT_SID"
 and "STUDENT_DIM".STUDENT_SID = DECODE(USER_STUDENT_SECURITY.STUDENT_SID,-9999,STUDENT_DIM.STUDENT_SID,USER_STUDENT_SECURITY.STUDENT_SID) AND
       "STUDENT_DIM".DISTRICT_SID = USER_STUDENT_SECURITY.DISTRICT_SID
and USER_STUDENT_SECURITY.USER_ID = 'ADAM.WARNER@REGION10.ORG'


group by "STUDENT_DIM".STUDENT_SID,
"STUDENT_DIM".STUDENT_ID,
"STUDENT_DIM".FULL_NAME,
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
select *
from pivot_data
PIVOT (COUNT(PERIOD_ABSENCE_COUNT ) as PERIOD FOR (CLASS_PERIOD) IN ('Period 01','Period 02',
'Period 03','Period 04','Period 05','Period 06','Period 07','Period 08','Period 09'))
*/
;

prompt
prompt Creating view V_DWS_RECENTLY_ADDED_STUDENTS
prompt ===========================================
prompt
create or replace force view quinlandata.v_dws_recently_added_students as
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_RISK_FACTOR_FLOW AS
select
       DATE_DIM.DATE_ID  as  Date_ID ,
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
       AND DATE_DIM.DATE_ID > (SELECT MAX(DATE_ID)
                               FROM STUDENT_RISK_FACTOR_PHASE_SUM
                               JOIN DATE_DIM ON DATE_DIM.DATE_SID = STUDENT_RISK_FACTOR_PHASE_SUM.DATE_SID) - 120

 group by
       DATE_DIM.DATE_ID;

prompt
prompt Creating view V_DWS_RISK_FACTOR_HISTORY
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_RISK_FACTOR_HISTORY AS
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
       STUDENT_DIM.CAMPUS_ID,
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
prompt Creating view V_DWS_STUDENT_NOTE
prompt ================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_STUDENT_NOTE AS
SELECT DWS_STUDENT_NOTE.NOTE_ID,
    DWS_STUDENT_NOTE.STUDENT_SID,
    STUDENT_DIM.STUDENT_ID,
    STUDENT_DIM.FULL_NAME STUDENT_NAME,
    DWS_STUDENT_NOTE.NOTE_AUTHOR_SID,
    USER_ACCOUNT.USER_ID AUTHOR_USER_ID,
    USER_ACCOUNT.EMPLOYEE_ID AUTHOR_EMP_ID,
    USER_ACCOUNT.USER_LAST_NAME
    ||', '
    ||USER_ACCOUNT.USER_FIRST_NAME AUTHOR_FULL_NAME,
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
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_DWS_STUDENT_RISK_FACTOR_LIST AS
SELECT DISTRICT_SECURITY_KEY,
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
       V_DWS_STUDENT_MASTER.SPECIAL_EDUCATION
  FROM DATE_DIM                     DATE_DIM,
       CAMPUS_DIM                   CAMPUS_DIM,
       V_DWS_STUDENT_MASTER         V_DWS_STUDENT_MASTER,
       STUDENT_RISK_FACTOR_SNAPSHOT STUDENT_RISK_FACTOR_SNAPSHOT,
       RF_DISPLAY_COLUMNS           RF_DISPLAY_COLUMNS,
       EXECUTION_LOAD_CAMPUS_VW     EXECUTION_LOAD_CAMPUS_VW
   WHERE CAMPUS_DIM.CAMPUS_SID =
       STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID
   AND RF_DISPLAY_COLUMNS.CAMPUS_SID =
       STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID
   AND DATE_DIM.DATE_SID = STUDENT_RISK_FACTOR_SNAPSHOT.DATE_SID
   AND V_DWS_STUDENT_MASTER.STUDENT_SID =
       STUDENT_RISK_FACTOR_SNAPSHOT.STUDENT_SID
   AND TRUNC(DATE_DIM.DATE_ID) >=
       TRUNC(EXECUTION_LOAD_CAMPUS_VW.EXECUTION_START_TIME)
   AND STUDENT_RISK_FACTOR_SNAPSHOT.CAMPUS_SID =
       EXECUTION_LOAD_CAMPUS_VW.CAMPUS_SID;

prompt
prompt Creating view V_DWS_STU_RISK_HISTOGRAM
prompt ======================================
prompt
create or replace force view quinlandata.v_dws_stu_risk_histogram as
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
create or replace force view quinlandata.v_dws_wkly_attendance_rf_cnt as
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
  and school_year = (select to_char(max(execution_start_time),'YYYY') from execution_load_campus_vw)
  and date_dim.date_id <= (select max(execution_start_time) from execution_load_campus_vw)) week
on flag_date_dim.date_id <= week.date_id
and end_date_dim.date_id  >= week.date_id - 6
group by week.date_id
order by week.date_id;

prompt
prompt Creating view V_ENROLLMENT_BY_CAMPUS
prompt ====================================
prompt
create or replace force view quinlandata.v_enrollment_by_campus as
select link
       ,sch_yr
       ,campus
       ,STUDENT_ID
FROM V_ENROLLMENT_BY_CAMPUS_D;

prompt
prompt Creating view V_ENROLLMENT_BY_CAMPUS_D
prompt ======================================
prompt
create or replace force view quinlandata.v_enrollment_by_campus_d as
select NULL AS LINK
      ,sr_stu_enroll.sch_yr
      ,cr_demo.campus_name AS CAMPUS
      ,sr_stu_enroll.stu_id AS STUDENT_ID
from sr_stu_enroll
join cr_demo on cr_demo.campus_id = sr_stu_enroll.campus_id
             and cr_demo.sch_yr = sr_stu_enroll.sch_yr
where SR_STU_ENROLL.STATUS_CD in ('1','2','3') and active_cd = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_DISTRICT
prompt ======================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_ENROLLMENT_BY_DISTRICT AS
SELECT V_ENROLLMENT_BY_DISTRICT_D.SCH_YR
      ,V_ENROLLMENT_BY_DISTRICT_D.STU_ID
FROM V_ENROLLMENT_BY_DISTRICT_D;

prompt
prompt Creating view V_ENROLLMENT_BY_DISTRICT_D
prompt ========================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_ENROLLMENT_BY_DISTRICT_D AS
SELECT SR_STU_ENROLL.SCH_YR
      ,SR_STU_ENROLL.STU_ID
FROM SR_STU_ENROLL
JOIN CR_DEMO ON CR_DEMO.CAMPUS_ID = SR_STU_ENROLL.CAMPUS_ID
             AND CR_DEMO.SCH_YR = SR_STU_ENROLL.SCH_YR
WHERE SR_STU_ENROLL.STATUS_CD IN ('1','2','3') AND ACTIVE_CD = '1';

prompt
prompt Creating view V_ENROLLMENT_BY_ETHNICITY
prompt =======================================
prompt
create or replace force view quinlandata.v_enrollment_by_ethnicity as
select V_ENROLLMENT_BY_ETHNICITY_D.LINK
       ,V_ENROLLMENT_BY_ETHNICITY_D.SCH_YR
       ,V_ENROLLMENT_BY_ETHNICITY_D.AGGREGATE_ETHNICITY
       ,V_ENROLLMENT_BY_ETHNICITY_D.STU_ID
from V_ENROLLMENT_BY_ETHNICITY_D;

prompt
prompt Creating view V_ENROLLMENT_BY_ETHNICITY_D
prompt =========================================
prompt
create or replace force view quinlandata.v_enrollment_by_ethnicity_d as
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
prompt Creating view V_ENROLLMENT_BY_GENDER
prompt ====================================
prompt
create or replace force view quinlandata.v_enrollment_by_gender as
select  V_ENROLLMENT_BY_GENDER_D.LINK
       ,V_ENROLLMENT_BY_GENDER_D.SCH_YR
       ,V_ENROLLMENT_BY_GENDER_D.SEX
       ,V_ENROLLMENT_BY_GENDER_D.STU_ID
from V_ENROLLMENT_BY_GENDER_D;

prompt
prompt Creating view V_ENROLLMENT_BY_GENDER_D
prompt ======================================
prompt
create or replace force view quinlandata.v_enrollment_by_gender_d as
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
prompt Creating view V_ENROLLMENT_BY_GRADE_LVL
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_ENROLLMENT_BY_GRADE_LVL AS
SELECT LINK
       ,V_ENROLLMENT_BY_GRADE_LVL_D.SCH_YR
       ,V_ENROLLMENT_BY_GRADE_LVL_D.GRADE_LEVEL
       ,V_ENROLLMENT_BY_GRADE_LVL_D.GRDSORT
       ,V_ENROLLMENT_BY_GRADE_LVL_D.STUDENT_ID
FROM V_ENROLLMENT_BY_GRADE_LVL_D;

prompt
prompt Creating view V_ENROLLMENT_BY_GRADE_LVL_D
prompt =========================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_ENROLLMENT_BY_GRADE_LVL_D AS
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
prompt Creating view V_SCHOOL_YEAR
prompt ===========================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_SCHOOL_YEAR AS
SELECT DISTINCT sch_yr school_year
,sch_yr
FROM V_SCHOOL_YEAR_D;

prompt
prompt Creating view V_SCHOOL_YEAR_D
prompt =============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_SCHOOL_YEAR_D AS
SELECT DISTINCT sch_yr school_year
,sch_yr
FROM CR_ATT_CAL;

prompt
prompt Creating view V_TXSTU_ATT_DETAIL_D
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_ATT_DETAIL_D AS
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
prompt Creating view V_TXSTU_ATT_STU_ENROLL_DETAIL
prompt ===========================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_ATT_STU_ENROLL_DETAIL AS
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
prompt Creating view V_TXSTU_CONTACT_PARENT
prompt ====================================
prompt
create or replace force view quinlandata.v_txstu_contact_parent as
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
V_TXSTU_CONTACT_PARENT_D.primary_contact,
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
prompt Creating view V_TXSTU_CONTACT_PARENT_D
prompt ======================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_CONTACT_PARENT_D AS
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
,SR_PARENT.PRIMARY_FLAG PRIMARY_CONTACT
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
prompt Creating view V_TXSTU_GRADEBK_LOGIN
prompt ===================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_GRADEBK_LOGIN AS
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
prompt Creating view V_TXSTU_GRADEBK_LOGIN_D
prompt =====================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_GRADEBK_LOGIN_D AS
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
prompt Creating view V_TXSTU_GRADES
prompt ============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_GRADES AS
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
prompt Creating view V_TXSTU_GRADES_D
prompt ==============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_GRADES_D AS
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
prompt Creating view V_TXSTU_IMMUNIZ
prompt =============================
prompt
create or replace force view quinlandata.v_txstu_immuniz as
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
V_TXSTU_IMMUNIZ_D.AFFIDAVIT_DATE
 from V_TXSTU_STU_CAMPUS_MASTER
 LEFT JOIN  V_TXSTU_IMMUNIZ_D
 ON V_TXSTU_IMMUNIZ_D.STUDENT_ID = V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID;

prompt
prompt Creating view V_TXSTU_IMMUNIZ_D
prompt ===============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_IMMUNIZ_D AS
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
prompt Creating view V_TXSTU_INSTRUCTOR
prompt ================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_INSTRUCTOR AS
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
prompt Creating view V_TXSTU_INSTRUCTOR_D
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_INSTRUCTOR_D AS
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
prompt Creating view V_TXSTU_REGISTRATION
prompt ==================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_REGISTRATION AS
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
        V_TXSTU_REGISTRATION_D REGISTRATION
        JOIN V_TXSTU_STU_CAMPUS_MASTER STUDENT
             ON STUDENT.SCH_YR = REGISTRATION.SCH_YR
             AND STUDENT.STUDENT_ID = REGISTRATION.STUDENT_ID
             AND STUDENT.CAMPUS_ID = REGISTRATION.CAMPUS_ID
;

prompt
prompt Creating view V_TXSTU_REGISTRATION_D
prompt ====================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_REGISTRATION_D AS
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
prompt Creating view V_TXSTU_STU_CAMPUS_MASTER_D
prompt =========================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_STU_CAMPUS_MASTER_D AS
SELECT MV_TXSTU_STU_CAMPUS_BASE_D.SCH_YR,
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
  JOIN TXSTU_USER_STUDENT_SECURITY
       ON TXSTU_USER_STUDENT_SECURITY.STU_ID = case TXSTU_USER_STUDENT_SECURITY.STU_ID
                                               when '-9999' then TXSTU_USER_STUDENT_SECURITY.STU_ID
                                               else MV_TXSTU_STU_CAMPUS_BASE_D.STUDENT_ID end
       AND TXSTU_USER_STUDENT_SECURITY.SCH_YR = case TXSTU_USER_STUDENT_SECURITY.SCH_YR
                                                when '9999' then TXSTU_USER_STUDENT_SECURITY.SCH_YR
                                                else MV_TXSTU_STU_CAMPUS_BASE_D.SCH_YR end
       AND TXSTU_USER_STUDENT_SECURITY.USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME');

prompt
prompt Creating view V_TXSTU_STU_CAMPUS_MASTER
prompt =======================================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_TXSTU_STU_CAMPUS_MASTER AS
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
prompt Creating view V_TX_STU_DISCIPLINE
prompt =================================
prompt
create or replace force view quinlandata.v_tx_stu_discipline as
select distinct
V_TXSTU_STU_CAMPUS_MASTER.sch_yr,
V_TXSTU_STU_CAMPUS_MASTER.grd,
V_TXSTU_STU_CAMPUS_MASTER.grdsort,
V_TXSTU_STU_CAMPUS_MASTER.entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.track,
V_TXSTU_STU_CAMPUS_MASTER.orig_entry_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_dt,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_code,
V_TXSTU_STU_CAMPUS_MASTER.withdrawal_reason, --LOV field
V_TXSTU_STU_CAMPUS_MASTER.student_id,
V_TXSTU_STU_CAMPUS_MASTER.full_name,
V_TXSTU_STU_CAMPUS_MASTER.first_name,
V_TXSTU_STU_CAMPUS_MASTER.middle_name,
V_TXSTU_STU_CAMPUS_MASTER.last_name,
V_TXSTU_STU_CAMPUS_MASTER.gen,
V_TXSTU_STU_CAMPUS_MASTER.nickname,
V_TXSTU_STU_CAMPUS_MASTER.elig_code,
V_TXSTU_STU_CAMPUS_MASTER.campus_id_resid, --LOV field
V_TXSTU_STU_CAMPUS_MASTER.ssn_denied,
V_TXSTU_STU_CAMPUS_MASTER.campus_id,
V_TXSTU_STU_CAMPUS_MASTER.campus_name, --LOV field
V_TXSTU_STU_CAMPUS_MASTER.active_cd,
V_TXSTU_STU_CAMPUS_MASTER.active_desc, --LOV field
V_TXSTU_STU_CAMPUS_MASTER.attribution_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_cd,
V_TXSTU_STU_CAMPUS_MASTER.record_status_desc,  --LOV field
V_TXSTU_STU_CAMPUS_MASTER.rep_excl,
V_TXSTU_STU_CAMPUS_MASTER.rep_excl_desc,  --LOV field
V_TXSTU_STU_CAMPUS_MASTER.state_student_id,
V_TXSTU_STU_CAMPUS_MASTER.state_prior_id,
V_TXSTU_STU_CAMPUS_MASTER.mail_address,
V_TXSTU_STU_CAMPUS_MASTER.mail_city,
V_TXSTU_STU_CAMPUS_MASTER.mail_state,
V_TXSTU_STU_CAMPUS_MASTER.mail_zip,
V_TX_STU_DISCIPLINE_D.BUILDING,
V_TX_STU_DISCIPLINE_D.INCIDENT_ID,
V_TX_STU_DISCIPLINE_D.INCIDENT_CODE,
V_TX_STU_DISCIPLINE_D.INCIDENT_LOCATION,
V_TX_STU_DISCIPLINE_D.INCIDENT_DATE,
V_TX_STU_DISCIPLINE_D.INCIDENT_TIME,
V_TX_STU_DISCIPLINE_D.DESCRIPTION,
V_TX_STU_DISCIPLINE_D.REPORTER_DESCRIPTION,
V_TX_STU_DISCIPLINE_D.REPORTER_NAME,
V_TX_STU_DISCIPLINE_D.ADMINISTERED_NAME,
V_TX_STU_DISCIPLINE_D.ADMINISTERED_BY,
V_TX_STU_DISCIPLINE_D.BEHAVIOR_CATEGORY,
V_TX_STU_DISCIPLINE_D.OFENS_DESC,
V_TX_STU_DISCIPLINE_D.PEIMS_CD,
V_TX_STU_DISCIPLINE_D.OFFENCE_LEVEL,
V_TX_STU_DISCIPLINE_D.PEIMS_EXTRACT,
V_TX_STU_DISCIPLINE_D.COURSE,
V_TX_STU_DISCIPLINE_D.SECTION,
V_TX_STU_DISCIPLINE_D.COURSE_TITLE,
V_TX_STU_DISCIPLINE_D.REPORTING_PERIOD,
V_TX_STU_DISCIPLINE_D.PARENT_CONTACTED,
V_TX_STU_DISCIPLINE_D.CONTACTED_DATE, --CAN NOT USE THE TO_DATE FUNCTION DUE TO INCORRECT OF BAD DATA
V_TX_STU_DISCIPLINE_D.CONFRENCE_REQUESTED,
V_TX_STU_DISCIPLINE_D.INFORMAL_HEARING,
V_TX_STU_DISCIPLINE_D.APPLEAL_EXPECTED,
V_TX_STU_DISCIPLINE_D.WITNESS,
V_TX_STU_DISCIPLINE_D.ACTION_CD, --could be PF_DISCIPLINE, but there's no data--
V_TX_STU_DISCIPLINE_D.ACTION_FROM_DATE,
V_TX_STU_DISCIPLINE_D.ACTION_TO_DATE,
V_TX_STU_DISCIPLINE_D.ACTION_AMOUNT,
V_TX_STU_DISCIPLINE_D.ACTION_NUMBER,
V_TX_STU_DISCIPLINE_D.ACTUAL_LENGHT,
V_TX_STU_DISCIPLINE_D.OFFICIAL_LENGHT,
V_TX_STU_DISCIPLINE_D.DISCP_ACTN_DATE,
V_TX_STU_DISCIPLINE_D.CAMPUS_RESPONSE,
V_TX_STU_DISCIPLINE_D.DIFFERENCE_CD, --PF_DISCIPLINE, but there's no data--
V_TX_STU_DISCIPLINE_D.CAMPUS_ASSIGNMENT
FROM
 V_TX_STU_DISCIPLINE_D
 INNER JOIN V_TXSTU_STU_CAMPUS_MASTER
 ON V_TX_STU_DISCIPLINE_D.STUDENT_ID = V_TXSTU_STU_CAMPUS_MASTER.STUDENT_ID
 AND V_TX_STU_DISCIPLINE_D.SCH_YR = V_TXSTU_STU_CAMPUS_MASTER.SCH_YR
;

prompt
prompt Creating view V_TX_STU_DISCIPLINE_D
prompt ===================================
prompt
create or replace force view quinlandata.v_tx_stu_discipline_d as
select
d.sch_yr as SCH_YR,
d.campus_id AS BUILDING,
d.incident_num as INCIDENT_ID,
o.ofens_cd AS INCIDENT_CODE,
(case st.loc_cd
when 'AFN' then 'Athletic field or playground'
when 'AFU' then 'Athletic field or playground'
when 'AUD' then 'Auditorium'
when 'BUS' then 'Bus stop'
when 'CAF' then 'Cafeteria area'
when 'CXL' then 'Walking to or from school'
when 'GMN' then 'Locker room or gym areas'
when 'GMU' then 'Locker room or gym areas'
when 'HAL' then 'Hallway or stairs'
when 'LBS' then 'Classroom'
when 'NSV' then 'Unknown'
when 'OBA' then 'On-School other inside area'
when 'OFF' then 'Administrative offices area'
when 'OST' then 'Unknown'
when 'PKL' then 'Parking lot'
when 'PLG' then 'Athletic field or playground'
when 'RES' then 'Restroom'
when 'RGC' then 'Classroom'
when 'SCG' then 'On-School other outside area'
when 'SPA' then 'On School'
when 'SPI' then 'On School'
when 'SPV' then 'On School'
else 'Unknown'
end) as INCIDENT_LOCATION,
substr(d.dt_ofens,1,4)||'-'||substr(d.dt_ofens,5,2)||'-'||substr(d.dt_ofens,7,2)  as INCIDENT_DATE,
substr(d.ofens_time,1,2)||':'||substr(d.ofens_time,3,2)||':'||substr(d.ofens_time,5,2) as INCIDENT_TIME,
d.stu_id as STUDENT_ID,
' ' as DESCRIPTION,
case
  when d.rep_by_name_l is not null then 'Staff' else '' end as REPORTER_DESCRIPTION,
case
  when d.rep_by_name_l is not null then initcap(d.rep_by_name_l||', '||d.rep_by_name_f) else '' end as REPORTER_NAME,
case
  when D.ADMIN_BY_NAME_L is null then null else (d.admin_by_name_l||', '||d.admin_by_name_f) end as ADMINISTERED_NAME,
D.ADMIN_BY ADMINISTERED_BY,
O.OFENS_CD as BEHAVIOR_CATEGORY,
OD.OFENS_DESC,
OD.PEIMS_CD,
O.OFENS_LEVEL as OFFENCE_LEVEL,
O.PEIMS_EXTRACT AS PEIMS_EXTRACT,
D.COURSE COURSE,
D.SECTION AS SECTION,
D.CRS_TITLE COURSE_TITLE,
D.REPORT_PD REPORTING_PERIOD,
D.PARENT_CONTACT PARENT_CONTACTED,
D.CONTACT_DT CONTACTED_DATE,
D.CONF_REQUESTED CONFRENCE_REQUESTED,
D.INFORMAL_HEARING INFORMAL_HEARING,
D.APPEAL_EXP APPLEAL_EXPECTED,
D.WITNESS WITNESS,
A.ACTN_CD ACTION_CD, --could be PF_DISCIPLINE, but there's no data--
A.ACTN_FROM_DT ACTION_FROM_DATE,
A.ACTN_TO_DT ACTION_TO_DATE,
A.AMT ACTION_AMOUNT,
A.ACTN_NBR ACTION_NUMBER,
A.ACT_LENGTH_DISCPLN_ASSGN ACTUAL_LENGHT,
A.OFFCL_LENGTH_DISCPLN_ASSGN OFFICIAL_LENGHT,
A.DATE_DISPLNRY_ACTION DISCP_ACTN_DATE,
A.CAMPUS_DISPLNRY_RESPNSBLTY CAMPUS_RESPONSE,
A.LENGTH_DIFF_RSN_CD DIFFERENCE_CD, --NPF_DISCIPLINE, but there's no data--
A.CAMPUS_ID_ASSGN CAMPUS_ASSIGNMENT
FROM
sr_discpln_ofens o,
sr_discpln d,
dr_demo,
st_loc_cd st,
sr_discpln_actn a,
st_ofens_cd od
WHERE
d.sch_yr = o.sch_yr and
d.stu_id = o.stu_id and
d.sch_yr = a.sch_yr and
d.stu_id = a.stu_id and
o.ofens_stamp = d.ofens_stamp and
st.sch_yr = d.sch_yr
and st.loc_cd = d.inc_loc
and d.incident_num > ''
and o.sch_yr = od.sch_yr
and o.ofens_cd = od.ofens_cd
;

prompt
prompt Creating view V_USER_APP_LIST
prompt =============================
prompt
CREATE OR REPLACE FORCE VIEW QUINLANDATA.V_USER_APP_LIST AS
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
prompt Creating materialized view MV_CR_ATT_CAL
prompt ========================================
prompt
CREATE MATERIALIZED VIEW QUINLANDATA.MV_CR_ATT_CAL
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_CR_ATT_OPT
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_CR_DEMO
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_CR_INSTR_CYR
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_DR_CRS_OFFERED_CYR
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_DR_DEMO
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C012_GEN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C035_INSTRUCTSET
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C053_HANDICAP
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C061_LEP
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C093_PARPERMISS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C095_SPTHRPY
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C131_YRENDSTATUS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C175_BIL_PGM_TYP
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ET_C176_ESL_PGM_TYP
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_ATT_POST
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_CRS_GRD
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_DISCPLN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_DISCPLN_ACTN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_DISCPLN_OFENS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_GRADEBK_HINT_INST
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_GRADEBK_LOGIN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_HINT_QUES
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_IMMUNIZ
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_PARENT
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_BIL_ESL
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_CHAP1
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_GT
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_OTHER
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_PREG_PUPILS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_SPEC_PGM_SPEC_ED
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_STU_CAMPUS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_STU_DEMO
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_STU_DEMO_PEIMS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_SR_STU_ENROLL
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_ACTIVE_CD
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_ATT_POST
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_DISCPLN_ACTN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_IMMUNIZ_TYP
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_LOC_CD
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_OFENS_CD
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_OFENS_LVL
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_REC_STATUS
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_RELATION
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_REP_EXCLUSN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_SERIES_TYPE
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_ST_WD_RSN
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
CREATE MATERIALIZED VIEW QUINLANDATA.MV_TXSTU_STU_CAMPUS_BASE_D
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
create materialized view QUINLANDATA.STUDENT_CREDIT_SUMMARY_MV
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
create or replace package quinlandata.pkg_core_load_processing is

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
CREATE OR REPLACE PACKAGE QUINLANDATA."PKG_CORE_UTILITIES" is

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
prompt Creating package PKG_DWS_SECURITY
prompt =================================
prompt
create or replace package quinlandata.PKG_DWS_SECURITY is

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
prompt Creating package PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace package quinlandata.PKG_DWS_STUDENT_NOTE is
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
create or replace package quinlandata.PKG_EMAIL is

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
create or replace package quinlandata.pkg_enrollment_post_processing is

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
prompt Creating package PKG_RISK_CALCULATION_ENGINE
prompt ============================================
prompt
create or replace package quinlandata.pkg_Risk_Calculation_Engine is

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
create or replace package quinlandata.PKG_RISK_FACTOR_CONFIG is

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
create or replace package quinlandata.PKG_RPT_DATA_SOURCE is

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

end PKG_RPT_DATA_SOURCE;
/

prompt
prompt Creating package PKG_SV_ACCT_MGMT
prompt =================================
prompt
CREATE OR REPLACE PACKAGE QUINLANDATA.pkg_sv_acct_mgmt
AS

PROCEDURE proc_reset_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   ) ;

PROCEDURE proc_send_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   ) ;

PROCEDURE proc_log_trans
          (  p_USER_SID        IN NUMBER
            ,p_USER_ID        IN VARCHAR2
            ,p_LOG_MESSAGE      IN VARCHAR2
            ,p_ACTION_TYPE      IN VARCHAR2
            ,p_ACTION_RESULT    IN VARCHAR2
            ,p_ATTEMPTS        IN NUMBER
            ,p_USER_IP_ADDRESS    IN VARCHAR2 ) ;

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
CREATE OR REPLACE PACKAGE QUINLANDATA."PKG_SV_SECURITY"
AS

PROCEDURE proc_login
          (
           p_uname IN VARCHAR2
          ,p_password IN VARCHAR2
          ,p_session_id IN VARCHAR2
          ,p_flow_page IN VARCHAR2
          );

PROCEDURE proc_login_first
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


FUNCTION fn_set_role
        (
         p_username IN VARCHAR2
        )
         RETURN VARCHAR2 ;


FUNCTION fn_set_key
        (
         p_username IN VARCHAR2
        )
         RETURN VARCHAR2 ;

FUNCTION fn_sv_get_user_district
        (
         p_username IN VARCHAR2
        )
         RETURN VARCHAR2 ;


FUNCTION fn_sv_get_user_role
        (
         p_username IN VARCHAR2
        )
         RETURN VARCHAR2 ;

procedure proc_new_pwd
          (
               p_username in varchar2
              ,p_password in varchar2
              ,p_password2 in varchar2
              ,p_password3 in varchar2
               ,return_msg out varchar2
          );

procedure proc_new_answer
          (
               p_username  in varchar2
              ,p_SQID  in number
              ,P_ANSWER in varchar2
              ,return_msg out varchar2
          );

procedure prc_load_reveal_security_table;

procedure prc_load_reveal_security_table(p_user_sid IN NUMBER);

PROCEDURE prc_district_name;

END pkg_sv_security ;
/

prompt
prompt Creating package PKG_TXEIS_SECURITY
prompt ===================================
prompt
create or replace package quinlandata.PKG_TXEIS_SECURITY is

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
CREATE OR REPLACE PACKAGE QUINLANDATA."PKG_UTILITIES"

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
prompt Creating function DEMO_ERROR_HANDLING
prompt =====================================
prompt
create or replace function quinlandata.demo_error_handling (
    p_error in apex_error.t_error )
    return apex_error.t_error_result
is
    l_result          apex_error.t_error_result;
    l_reference_id    number;
    l_constraint_name varchar2(255);
begin
    l_result := apex_error.init_error_result (
                    p_error => p_error );
    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then
        -- Access Denied errors raised by application or page authorization should
        -- still show up with the original error message
        if p_error.apex_error_code <> 'APEX.AUTHORIZATION.ACCESS_DENIED' then
            -- log error for example with an autonomous transaction and return
            -- l_reference_id as reference#
            -- l_reference_id := log_error (
            --                       p_error => p_error );
            --
            -- Change the message to the generic error message which doesn't expose
            -- any sensitive information.
            l_result.message         := 'An unexpected internal application error has occurred. '||
                                        'Please get in contact with your system administrator and provide '||
                                        'reference# '||to_char(l_reference_id, '999G999G999G990')||
                                        ' for further investigation.';
            l_result.additional_info := null;
        end if;
    else
        -- Always show the error as inline error
        -- Note: If you have created manual tabular forms (using the package
        --       apex_item/htmldb_item in the SQL statement) you should still
        --       use "On error page" on that pages to avoid loosing entered data
        l_result.display_location := case
                                       when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                       else l_result.display_location
                                     end;
        -- If it's a constraint violation like
        --
        --   -) ORA-00001: unique constraint violated
        --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
        --   -) ORA-02290: check constraint violated
        --   -) ORA-02291: integrity constraint violated - parent key not found
        --   -) ORA-02292: integrity constraint violated - child record found
        --
        -- we try to get a friendly error message from our constraint lookup configuration.
        -- If we don't find the constraint in our lookup table we fallback to
        -- the original ORA error message.
        if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
            l_constraint_name := apex_error.extract_constraint_name (
                                     p_error => p_error );
            begin
                select message
                  into l_result.message
                  from demo_constraint_lookup
                 where constraint_name = l_constraint_name;
            exception when no_data_found then null; -- not every constraint has to be in our lookup table
            end;
        end if;
        -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
        -- in a table trigger or in a PL/SQL package called by a process and we
        -- haven't found the error in our lookup table, then we just want to see
        -- the actual error text and not the full error stack with all the ORA error numbers.
        if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
            l_result.message := apex_error.get_first_ora_error_text (
                                    p_error => p_error );
        end if;
        -- If no associated page item/tabular form column has been set, we can use
        -- apex_error.auto_set_associated_item to automatically guess the affected
        -- error field by examine the ORA error for constraint names or column names.
        if l_result.page_item_name is null and l_result.column_alias is null then
            apex_error.auto_set_associated_item (
                p_error        => p_error,
                p_error_result => l_result );
        end if;
    end if;
    return l_result;
end demo_error_handling;
/

prompt
prompt Creating package body PKG_CORE_LOAD_PROCESSING
prompt ==============================================
prompt
create or replace package body quinlandata.pkg_core_load_processing is

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
CREATE OR REPLACE PACKAGE BODY QUINLANDATA."PKG_CORE_UTILITIES" is

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
prompt Creating package body PKG_DWS_SECURITY
prompt ======================================
prompt
create or replace package body quinlandata.PKG_DWS_SECURITY is

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
prompt Creating package body PKG_DWS_STUDENT_NOTE
prompt ==========================================
prompt
create or replace package body quinlandata.PKG_DWS_STUDENT_NOTE is
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
create or replace package body quinlandata.PKG_EMAIL is

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
create or replace package body quinlandata.pkg_enrollment_post_processing is

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
prompt Creating package body PKG_RISK_CALCULATION_ENGINE
prompt =================================================
prompt
create or replace package body quinlandata.pkg_risk_calculation_engine is

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
create or replace package body quinlandata.PKG_RISK_FACTOR_CONFIG is

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
create or replace package body quinlandata.PKG_RPT_DATA_SOURCE is

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
    where SOURCE_CONFIG.Active_Flag = 'Y';

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

end PKG_RPT_DATA_SOURCE;
/

prompt
prompt Creating package body PKG_SV_ACCT_MGMT
prompt ======================================
prompt
CREATE OR REPLACE PACKAGE BODY QUINLANDATA.pkg_sv_acct_mgmt
AS
PROCEDURE proc_reset_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   )

IS
    l_email_subject             VARCHAR2 (90);
    l_email_application_link    VARCHAR2 (400);
    l_email_salutation          VARCHAR2 (400);
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_temp_pw                   varchar2(20)  := 'default' ;
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
    l_date date  := sysdate;


BEGIN

wwv_flow_api.set_security_group_id(1240428170859550) ; --- required for PL/SQL
  /* Generate new PW */
     l_temp_pw :=   dbms_random.string( 'X', 8 );

   /* Get the user info */

   select user_sid,   user_id,    password_expiration_date,  user_first_name,   user_last_name,    email_address, account_locked,  active_account_flag, district_sid, attempt_ctr, last_login_date , first_login_flag
    into l_user_sid, l_user_id, l_password_expiration_date,  l_user_first_name, l_user_last_name, l_email_address, l_account_locked, l_active_account_flag, l_district_sid, l_attempt_ctr, l_last_login_date, l_first_login_flag
    from user_account
   where upper(user_id)  = upper( p_email_to)  ;


  --- exceed attempts - failed login

  if   p_type in ( '1', '4') then
    update  user_account
       set  password_expiration_date = l_date  ,
              password  =   pkg_sv_security.fn_get_hash(l_user_id, l_temp_pw)  ,
   /*           password_update_date = l_password_update_date,
               account_locked = l_account_locked,   */
            attempt_ctr = 0,
            account_locked = 'N',
            last_login_date = (to_date('1999/03/29 10:02:44', 'yyyy/mm/dd hh24:mi:ss'))
    where user_sid = l_user_sid;
    commit;
    end if;


   /* Get the email */

   select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = p_type;

 ---   l_body_html :=  ' Attn: ' || l_user_first_name || ' ' || l_user_last_name  || l_body_html ;
    l_body_html := l_body_html || l_temp_pw || l_email_application_link || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => p_email_to,
    p_from      => p_email_from,
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;

END  proc_reset_email ;


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

/* Populate Transaction Log */

PROCEDURE proc_log_trans
   (  p_USER_SID				IN NUMBER
			,p_USER_ID				IN VARCHAR2
			,p_LOG_MESSAGE			IN VARCHAR2
			,p_ACTION_TYPE			IN VARCHAR2
			,p_ACTION_RESULT		IN VARCHAR2
			,p_ATTEMPTS				IN NUMBER
			,p_USER_IP_ADDRESS		IN VARCHAR2 )

IS

BEGIN
  
  insert into security_transaction_log
  (security_transaction_sid, user_sid, user_id, transaction_date,
    log_message, action_type, action_result, attempts, user_ip_address)
values
  ( SID_SEQUENCE.NEXTVAL  , p_user_sid, p_user_id, sysdate  ,
    p_log_message, p_action_type, p_action_result, p_attempts, p_user_ip_address);
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
CREATE OR REPLACE PACKAGE BODY QUINLANDATA.pkg_sv_security
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
  p_session_id => p_session_id
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
        end if;
        if v_user_role_list(i).application_alias = 'REVRPTR' THEN 
          -- get the source systems for this user --
          select distinct source.source_name
          bulk collect into v_source_system
          from source
          join report_category on report_category.source_sid = source.source_sid
          join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
          join user_account on user_account.user_sid = user_report_category.user_sid
          where user_account.user_id = v_user_role_list(i).userId;

          if v_source_system.count > 0 then
            for x in v_source_system.first..v_source_system.last
              loop -- loop through user source systems, only TxEIS at this time --
                if v_source_system(x) = 'TxEIS' then
                   pkg_txeis_security.prc_load_txeis_security_table(p_user_sid);
                end if;
                -- additional source systems go here --
              end loop;
          end if;
        end if;
      end loop;
  end if;
   
end prc_load_reveal_security_table;

PROCEDURE prc_district_name IS
   v_name varchar2(75);
   v_end varchar2(4);
BEGIN
   select trim(district_name)
   into v_name
   from district_dim
   where district_sid <> -1 and rownum = 1
   order by district_sid desc;
   v_end := upper(substr(v_name,-4,4));
   v_name := Initcap(lower(v_name));
   if v_end = 'CISD' or v_end = ' ISD' then
     v_name := substr(v_name,1,length(v_name)-4)||v_end;
   end if;
     
   --dbms_output.put_line(v_name);
   htp.prn('<span style=color:black;font-size:175%;>'||v_name||'</span>');
END prc_district_name;


END pkg_sv_security;
/

prompt
prompt Creating package body PKG_TXEIS_SECURITY
prompt ========================================
prompt
create or replace package body quinlandata.PKG_TXEIS_SECURITY is

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
        select distinct source.source_name
        into v_source_system
        from source
        join report_category on report_category.source_sid = source.source_sid
        join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
        join user_account on user_account.user_sid = user_report_category.user_sid
        where user_account.user_id = v_user_role_list(i).userId
          and source.source_name = 'TxEIS';
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
  where user_account.user_sid = p_user_sid
  order by user_account.user_id,upper(application.description),role_master.role;

  if v_user_role_list.count > 0 then
    for i in v_user_role_list.first..v_user_role_list.last
      loop
        -- get the source system for this user to verify that they are a TxEIS user --
        begin 
        select distinct source.source_name
        into v_source_system
        from source
        join report_category on report_category.source_sid = source.source_sid
        join user_report_category on user_report_category.report_category_sid = report_category.report_category_sid
        join user_account on user_account.user_sid = user_report_category.user_sid
        where user_account.user_id = v_user_role_list(i).userId
          and source.source_name = 'TxEIS';
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
CREATE OR REPLACE PACKAGE BODY QUINLANDATA."PKG_UTILITIES"
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
prompt Creating trigger APEX$_ACL_T1
prompt =============================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_ACL_T1"
before insert or update on "APEX$_ACL"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    :new.username := upper(:new.username);
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_FILES_T1
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_FILES_T1"
before insert or update on "APEX$_WS_FILES"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting and :new.image_alias is null then
        :new.image_alias := :new.name;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.content_last_update := sysdate;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        if nvl(length(:new.content),0) <> nvl(length(:old.content),0) then
            :new.content_last_update := sysdate;
        end if;
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_LINKS_T1
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_LINKS_T1"
before insert or update on "APEX$_WS_LINKS"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_NOTES_T1
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_NOTES_T1"
before insert or update on "APEX$_WS_NOTES"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_ROWS_T1
prompt =================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_ROWS_T1"
before insert or update on "APEX$_WS_ROWS"
for each row
declare
    l_tag_list apex_application_global.vc_arr2;
    type col_arr is table of varchar2(32767) index by varchar2(255);
    la_col_label col_arr;
    procedure datagrid_logging( 
        p_row_id       in number,
        p_ws_app_id    in number,
        p_data_grid_id in number,
        p_col_name     in varchar2,
        p_type         in varchar2,
        p_old_c        in varchar2 default null,
        p_new_c        in varchar2 default null,
        p_old_d        in date default null,
        p_new_d        in date default null,
        p_old_n        in number default null,
        p_new_n        in number default null)
    is
    begin
        case p_type
        when 'C' then
          if (p_old_c is null and p_new_c is not null) or (p_old_c is not null and p_new_c is null) or (p_old_c != p_new_c) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value, new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_c, p_new_c, sysdate, nvl(v('APP_USER'),user));
          end if;
        when 'D' then
          if (p_old_d is null and p_new_d is not null) or (p_old_d is not null and p_new_d is null) or (p_old_d != p_new_d) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_d, p_new_d, sysdate, nvl(v('APP_USER'),user));
        	  end if;
        when 'N' then
          if (p_old_n is null and p_new_n is not null) or (p_old_n is not null and p_new_n is null) or (p_old_n != p_new_n) then
              insert into apex$_ws_history (row_id, ws_app_id, data_grid_id, column_name, old_value,  new_value, change_date, application_user_id)
              values (p_row_id, p_ws_app_id, p_data_grid_id, p_col_name, p_old_n, p_new_n, sysdate, nvl(v('APP_USER'),user));
          end if;
        end case;
    end datagrid_logging;
    procedure wa( p_c in out nocopy clob, p_buf in varchar2 )
    is
    l_lf varchar2(2) := unistr('\000a');
    begin
    if p_buf is not null then dbms_lob.writeappend( p_c, length(p_buf||l_lf), upper(p_buf)||l_lf); end if;
    end wa;
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.load_order from dual;
        :new.change_count := 0;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := :old.change_count + 1;
    end if;
    --
    -- inserting remove chr 13
    --
    if instr(:new.c001,chr(13)) > 0 then :new.c001 := replace(:new.c001,chr(13),null); end if;
    if instr(:new.c002,chr(13)) > 0 then :new.c002 := replace(:new.c002,chr(13),null); end if;
    if instr(:new.c003,chr(13)) > 0 then :new.c003 := replace(:new.c003,chr(13),null); end if;
    if instr(:new.c004,chr(13)) > 0 then :new.c004 := replace(:new.c004,chr(13),null); end if;
    if instr(:new.c005,chr(13)) > 0 then :new.c005 := replace(:new.c005,chr(13),null); end if;
    if instr(:new.c006,chr(13)) > 0 then :new.c006 := replace(:new.c006,chr(13),null); end if;
    if instr(:new.c007,chr(13)) > 0 then :new.c007 := replace(:new.c007,chr(13),null); end if;
    if instr(:new.c008,chr(13)) > 0 then :new.c008 := replace(:new.c008,chr(13),null); end if;
    if instr(:new.c009,chr(13)) > 0 then :new.c009 := replace(:new.c009,chr(13),null); end if;
    if instr(:new.c010,chr(13)) > 0 then :new.c010 := replace(:new.c010,chr(13),null); end if;
    if instr(:new.c011,chr(13)) > 0 then :new.c011 := replace(:new.c011,chr(13),null); end if;
    if instr(:new.c012,chr(13)) > 0 then :new.c012 := replace(:new.c012,chr(13),null); end if;
    if instr(:new.c013,chr(13)) > 0 then :new.c013 := replace(:new.c013,chr(13),null); end if;
    if instr(:new.c014,chr(13)) > 0 then :new.c014 := replace(:new.c014,chr(13),null); end if;
    if instr(:new.c015,chr(13)) > 0 then :new.c015 := replace(:new.c015,chr(13),null); end if;
    if instr(:new.c016,chr(13)) > 0 then :new.c016 := replace(:new.c016,chr(13),null); end if;
    if instr(:new.c017,chr(13)) > 0 then :new.c017 := replace(:new.c017,chr(13),null); end if;
    if instr(:new.c018,chr(13)) > 0 then :new.c018 := replace(:new.c018,chr(13),null); end if;
    if instr(:new.c019,chr(13)) > 0 then :new.c019 := replace(:new.c019,chr(13),null); end if;
    if instr(:new.c020,chr(13)) > 0 then :new.c020 := replace(:new.c010,chr(23),null); end if;
    if instr(:new.c021,chr(13)) > 0 then :new.c021 := replace(:new.c001,chr(23),null); end if;
    if instr(:new.c022,chr(13)) > 0 then :new.c022 := replace(:new.c002,chr(23),null); end if;
    if instr(:new.c023,chr(13)) > 0 then :new.c023 := replace(:new.c003,chr(23),null); end if;
    if instr(:new.c024,chr(13)) > 0 then :new.c024 := replace(:new.c004,chr(23),null); end if;
    if instr(:new.c025,chr(13)) > 0 then :new.c025 := replace(:new.c005,chr(23),null); end if;
    if instr(:new.c026,chr(13)) > 0 then :new.c026 := replace(:new.c006,chr(23),null); end if;
    if instr(:new.c027,chr(13)) > 0 then :new.c027 := replace(:new.c007,chr(23),null); end if;
    if instr(:new.c028,chr(13)) > 0 then :new.c028 := replace(:new.c008,chr(23),null); end if;
    if instr(:new.c029,chr(13)) > 0 then :new.c029 := replace(:new.c009,chr(23),null); end if;
    if instr(:new.c030,chr(13)) > 0 then :new.c030 := replace(:new.c030,chr(13),null); end if;
    if instr(:new.c031,chr(13)) > 0 then :new.c031 := replace(:new.c031,chr(13),null); end if;
    if instr(:new.c032,chr(13)) > 0 then :new.c032 := replace(:new.c032,chr(13),null); end if;
    if instr(:new.c033,chr(13)) > 0 then :new.c033 := replace(:new.c033,chr(13),null); end if;
    if instr(:new.c034,chr(13)) > 0 then :new.c034 := replace(:new.c034,chr(13),null); end if;
    if instr(:new.c035,chr(13)) > 0 then :new.c035 := replace(:new.c035,chr(13),null); end if;
    if instr(:new.c036,chr(13)) > 0 then :new.c036 := replace(:new.c036,chr(13),null); end if;
    if instr(:new.c037,chr(13)) > 0 then :new.c037 := replace(:new.c037,chr(13),null); end if;
    if instr(:new.c038,chr(13)) > 0 then :new.c038 := replace(:new.c038,chr(13),null); end if;
    if instr(:new.c039,chr(13)) > 0 then :new.c039 := replace(:new.c039,chr(13),null); end if;
    if instr(:new.c040,chr(13)) > 0 then :new.c040 := replace(:new.c040,chr(13),null); end if;
    if instr(:new.c041,chr(13)) > 0 then :new.c041 := replace(:new.c041,chr(13),null); end if;
    if instr(:new.c042,chr(13)) > 0 then :new.c042 := replace(:new.c042,chr(13),null); end if;
    if instr(:new.c043,chr(13)) > 0 then :new.c043 := replace(:new.c043,chr(13),null); end if;
    if instr(:new.c044,chr(13)) > 0 then :new.c044 := replace(:new.c044,chr(13),null); end if;
    if instr(:new.c045,chr(13)) > 0 then :new.c045 := replace(:new.c045,chr(13),null); end if;
    if instr(:new.c046,chr(13)) > 0 then :new.c046 := replace(:new.c046,chr(13),null); end if;
    if instr(:new.c047,chr(13)) > 0 then :new.c047 := replace(:new.c047,chr(13),null); end if;
    if instr(:new.c048,chr(13)) > 0 then :new.c048 := replace(:new.c048,chr(13),null); end if;
    if instr(:new.c049,chr(13)) > 0 then :new.c049 := replace(:new.c049,chr(13),null); end if;
    if instr(:new.c050,chr(13)) > 0 then :new.c050 := replace(:new.c050,chr(13),null); end if;
    if :new.search_clob is null then
        dbms_lob.createtemporary( :new.search_clob, false, dbms_lob.session );
    else
        dbms_lob.trim( :new.search_clob, 0 );
    end if;
    wa(:new.search_clob,:new.c001);wa(:new.search_clob,:new.c002);wa(:new.search_clob,:new.c003);
    wa(:new.search_clob,:new.c004);wa(:new.search_clob,:new.c005);wa(:new.search_clob,:new.c006);
    wa(:new.search_clob,:new.c007);wa(:new.search_clob,:new.c008);wa(:new.search_clob,:new.c009);
    wa(:new.search_clob,:new.c010);wa(:new.search_clob,:new.c011);wa(:new.search_clob,:new.c012);
    wa(:new.search_clob,:new.c013);wa(:new.search_clob,:new.c014);wa(:new.search_clob,:new.c015);
    wa(:new.search_clob,:new.c016);wa(:new.search_clob,:new.c017);wa(:new.search_clob,:new.c018);
    wa(:new.search_clob,:new.c019);wa(:new.search_clob,:new.c020);wa(:new.search_clob,:new.c021);
    wa(:new.search_clob,:new.c022);wa(:new.search_clob,:new.c023);wa(:new.search_clob,:new.c024);
    wa(:new.search_clob,:new.c025);wa(:new.search_clob,:new.c026);wa(:new.search_clob,:new.c027);
    wa(:new.search_clob,:new.c028);wa(:new.search_clob,:new.c029);wa(:new.search_clob,:new.c030);
    wa(:new.search_clob,:new.c031);wa(:new.search_clob,:new.c032);wa(:new.search_clob,:new.c033);
    wa(:new.search_clob,:new.c034);wa(:new.search_clob,:new.c035);wa(:new.search_clob,:new.c036);
    wa(:new.search_clob,:new.c037);wa(:new.search_clob,:new.c038);wa(:new.search_clob,:new.c039);
    wa(:new.search_clob,:new.c040);wa(:new.search_clob,:new.c041);wa(:new.search_clob,:new.c042);
    wa(:new.search_clob,:new.c043);wa(:new.search_clob,:new.c044);wa(:new.search_clob,:new.c045);
    wa(:new.search_clob,:new.c046);wa(:new.search_clob,:new.c047);wa(:new.search_clob,:new.c048);
    wa(:new.search_clob,:new.c049);wa(:new.search_clob,:new.c050);
    --
    -- history
    --
    if updating then
       -- initialize column label array
       for i in 1..50
       loop
           la_col_label('C'||to_char(i,'FM009')) := null;
           la_col_label('N'||to_char(i,'FM009')) := null;
           la_col_label('D'||to_char(i,'FM009')) := null;
       end loop;
       -- get column label array
       for c1 in (select column_alias, report_label 
                  from apex_ws_data_grid_col
                  where data_grid_id = :new.data_grid_id)
       loop
           la_col_label(c1.column_alias) := c1.report_label;
       end loop;
       -- strings
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C001'),'C',:old.c001,:new.c001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C002'),'C',:old.c002,:new.c002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C003'),'C',:old.c003,:new.c003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C004'),'C',:old.c004,:new.c004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C005'),'C',:old.c005,:new.c005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C006'),'C',:old.c006,:new.c006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C007'),'C',:old.c007,:new.c007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C008'),'C',:old.c008,:new.c008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C009'),'C',:old.c009,:new.c009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C010'),'C',:old.c010,:new.c010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C011'),'C',:old.c011,:new.c011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C012'),'C',:old.c012,:new.c012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C013'),'C',:old.c013,:new.c013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C014'),'C',:old.c014,:new.c014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C015'),'C',:old.c015,:new.c015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C016'),'C',:old.c016,:new.c016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C017'),'C',:old.c017,:new.c017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C018'),'C',:old.c018,:new.c018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C019'),'C',:old.c019,:new.c019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C020'),'C',:old.c020,:new.c020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C021'),'C',:old.c021,:new.c021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C022'),'C',:old.c022,:new.c022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C023'),'C',:old.c023,:new.c023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C024'),'C',:old.c024,:new.c024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C025'),'C',:old.c025,:new.c025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C026'),'C',:old.c026,:new.c026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C027'),'C',:old.c027,:new.c027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C028'),'C',:old.c028,:new.c028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C029'),'C',:old.c029,:new.c029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C030'),'C',:old.c030,:new.c030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C031'),'C',:old.c031,:new.c031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C032'),'C',:old.c032,:new.c032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C033'),'C',:old.c033,:new.c033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C034'),'C',:old.c034,:new.c034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C035'),'C',:old.c035,:new.c035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C036'),'C',:old.c036,:new.c036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C037'),'C',:old.c037,:new.c037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C038'),'C',:old.c038,:new.c038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C039'),'C',:old.c039,:new.c039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C040'),'C',:old.c040,:new.c040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C041'),'C',:old.c041,:new.c041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C042'),'C',:old.c042,:new.c042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C043'),'C',:old.c043,:new.c043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C044'),'C',:old.c044,:new.c044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C045'),'C',:old.c045,:new.c045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C046'),'C',:old.c046,:new.c046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C047'),'C',:old.c047,:new.c047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C048'),'C',:old.c048,:new.c048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C049'),'C',:old.c049,:new.c049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('C050'),'C',:old.c050,:new.c050);
       -- numbers
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N001'),'N',null,null,null,null,:old.n001,:new.n001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N002'),'N',null,null,null,null,:old.n002,:new.n002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N003'),'N',null,null,null,null,:old.n003,:new.n003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N004'),'N',null,null,null,null,:old.n004,:new.n004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N005'),'N',null,null,null,null,:old.n005,:new.n005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N006'),'N',null,null,null,null,:old.n006,:new.n006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N007'),'N',null,null,null,null,:old.n007,:new.n007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N008'),'N',null,null,null,null,:old.n008,:new.n008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N009'),'N',null,null,null,null,:old.n009,:new.n009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N010'),'N',null,null,null,null,:old.n010,:new.n010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N011'),'N',null,null,null,null,:old.n011,:new.n011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N012'),'N',null,null,null,null,:old.n012,:new.n012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N013'),'N',null,null,null,null,:old.n013,:new.n013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N014'),'N',null,null,null,null,:old.n014,:new.n014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N015'),'N',null,null,null,null,:old.n015,:new.n015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N016'),'N',null,null,null,null,:old.n016,:new.n016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N017'),'N',null,null,null,null,:old.n017,:new.n017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N018'),'N',null,null,null,null,:old.n018,:new.n018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N019'),'N',null,null,null,null,:old.n019,:new.n019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N020'),'N',null,null,null,null,:old.n020,:new.n020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N021'),'N',null,null,null,null,:old.n021,:new.n021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N022'),'N',null,null,null,null,:old.n022,:new.n022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N023'),'N',null,null,null,null,:old.n023,:new.n023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N024'),'N',null,null,null,null,:old.n024,:new.n024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N025'),'N',null,null,null,null,:old.n025,:new.n025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N026'),'N',null,null,null,null,:old.n026,:new.n026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N027'),'N',null,null,null,null,:old.n027,:new.n027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N028'),'N',null,null,null,null,:old.n028,:new.n028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N029'),'N',null,null,null,null,:old.n029,:new.n029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N030'),'N',null,null,null,null,:old.n030,:new.n030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N031'),'N',null,null,null,null,:old.n031,:new.n031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N032'),'N',null,null,null,null,:old.n032,:new.n032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N033'),'N',null,null,null,null,:old.n033,:new.n033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N034'),'N',null,null,null,null,:old.n034,:new.n034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N035'),'N',null,null,null,null,:old.n035,:new.n035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N036'),'N',null,null,null,null,:old.n036,:new.n036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N037'),'N',null,null,null,null,:old.n037,:new.n037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N038'),'N',null,null,null,null,:old.n038,:new.n038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N039'),'N',null,null,null,null,:old.n039,:new.n039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N040'),'N',null,null,null,null,:old.n040,:new.n040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N041'),'N',null,null,null,null,:old.n041,:new.n041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N042'),'N',null,null,null,null,:old.n042,:new.n042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N043'),'N',null,null,null,null,:old.n043,:new.n043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N044'),'N',null,null,null,null,:old.n044,:new.n044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N045'),'N',null,null,null,null,:old.n045,:new.n045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N046'),'N',null,null,null,null,:old.n046,:new.n046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N047'),'N',null,null,null,null,:old.n047,:new.n047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N048'),'N',null,null,null,null,:old.n048,:new.n048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N049'),'N',null,null,null,null,:old.n049,:new.n049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('N050'),'N',null,null,null,null,:old.n050,:new.n050);
       -- dates
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D001'),'D',null,null,:old.d001,:new.d001);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D002'),'D',null,null,:old.d002,:new.d002);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D003'),'D',null,null,:old.d003,:new.d003);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D004'),'D',null,null,:old.d004,:new.d004);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D005'),'D',null,null,:old.d005,:new.d005);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D006'),'D',null,null,:old.d006,:new.d006);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D007'),'D',null,null,:old.d007,:new.d007);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D008'),'D',null,null,:old.d008,:new.d008);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D009'),'D',null,null,:old.d009,:new.d009);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D010'),'D',null,null,:old.d010,:new.d010);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D011'),'D',null,null,:old.d011,:new.d011);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D012'),'D',null,null,:old.d012,:new.d012);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D013'),'D',null,null,:old.d013,:new.d013);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D014'),'D',null,null,:old.d014,:new.d014);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D015'),'D',null,null,:old.d015,:new.d015);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D016'),'D',null,null,:old.d016,:new.d016);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D017'),'D',null,null,:old.d017,:new.d017);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D018'),'D',null,null,:old.d018,:new.d018);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D019'),'D',null,null,:old.d019,:new.d019);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D020'),'D',null,null,:old.d020,:new.d020);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D021'),'D',null,null,:old.d021,:new.d021);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D022'),'D',null,null,:old.d022,:new.d022);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D023'),'D',null,null,:old.d023,:new.d023);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D024'),'D',null,null,:old.d024,:new.d024);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D025'),'D',null,null,:old.d025,:new.d025);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D026'),'D',null,null,:old.d026,:new.d026);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D027'),'D',null,null,:old.d027,:new.d027);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D028'),'D',null,null,:old.d028,:new.d028);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D029'),'D',null,null,:old.d029,:new.d029);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D030'),'D',null,null,:old.d030,:new.d030);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D031'),'D',null,null,:old.d031,:new.d031);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D032'),'D',null,null,:old.d032,:new.d032);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D033'),'D',null,null,:old.d033,:new.d033);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D034'),'D',null,null,:old.d034,:new.d034);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D035'),'D',null,null,:old.d035,:new.d035);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D036'),'D',null,null,:old.d036,:new.d036);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D037'),'D',null,null,:old.d037,:new.d037);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D038'),'D',null,null,:old.d038,:new.d038);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D039'),'D',null,null,:old.d039,:new.d039);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D040'),'D',null,null,:old.d040,:new.d040);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D041'),'D',null,null,:old.d041,:new.d041);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D042'),'D',null,null,:old.d042,:new.d042);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D043'),'D',null,null,:old.d043,:new.d043);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D044'),'D',null,null,:old.d044,:new.d044);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D045'),'D',null,null,:old.d045,:new.d045);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D046'),'D',null,null,:old.d046,:new.d046);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D047'),'D',null,null,:old.d047,:new.d047);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D048'),'D',null,null,:old.d048,:new.d048);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D049'),'D',null,null,:old.d049,:new.d049);
       datagrid_logging(:new.id,:new.ws_app_id,:new.data_grid_id,la_col_label('D050'),'D',null,null,:old.d050,:new.d050);
    end if;
    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_TAGS_T1
prompt =================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_TAGS_T1"
before insert or update on "APEX$_WS_TAGS"
for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
    end if;
end;
/

prompt
prompt Creating trigger APEX$_WS_WEBPG_SECTIONS_T1
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."APEX$_WS_WEBPG_SECTIONS_T1"
before insert or update on "APEX$_WS_WEBPG_SECTIONS"
for each row
declare
    l_sequence_changed varchar2(1) := 'N';
    l_title_changed varchar2(1) := 'N';
    l_content_changed varchar2(1) := 'N';
    procedure clob_upper( p_content in clob, p_content_upper in out nocopy clob)
    is
    l_buf varchar2(32767);
    l_off number;
    l_amt number;
    begin
    if p_content is not null then
        l_amt := 8000;
        l_off := 1;
         dbms_lob.trim( p_content_upper, 0);
         begin
             loop
                 dbms_lob.read( p_content, l_amt, l_off, l_buf );
                 l_buf := upper( l_buf );
                 dbms_lob.writeappend( p_content_upper, length(l_buf), l_buf);
                 l_off := l_off + l_amt;
                 l_amt := 8000;
             end loop;
         exception
             when no_data_found then null;
         end;
     end if;
end clob_upper;
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from dual;
    end if;
    if :new.section_type = 'NAV_PAGE' then
        if :new.nav_include_link is null then
            :new.nav_include_link := 'Y';
        end if;
    end if;
    if inserting and :new.content is not null then
        dbms_lob.createtemporary( :new.content_upper, false, dbms_lob.call );
        clob_upper( :new.content, :new.content_upper );
    elsif updating then
        if :new.content_upper is null then
            dbms_lob.createtemporary( :new.content_upper, false, dbms_lob.call );
        end if;
        clob_upper( :new.content, :new.content_upper );
    end if;
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(v('APP_USER'),user);
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := 0;
    elsif updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(v('APP_USER'),user);
        :new.change_count := nvl(:old.change_count,0) + 1;
        if nvl(:old.display_sequence,-999) != nvl(:new.display_sequence,-999) then
            l_sequence_changed := 'Y';
        end if;
        if nvl(:old.title,'jKKwZk') != nvl(:new.title,'jKKwZk') then
            l_title_changed := 'Y';
        end if;
        if dbms_lob.compare(:new.content,:old.content) != 0 or nvl(length(:new.content),0) != nvl(length(:old.content),0) then
            l_content_changed := 'Y';
        end if;
        if l_sequence_changed = 'Y' or l_title_changed = 'Y' or l_content_changed = 'Y' then
            insert into apex$_ws_webpg_section_history (section_id, ws_app_id, webpage_id, old_display_sequence, new_display_sequence,
            old_title, new_title, old_content, new_content, change_date, application_user_id)
            values (:new.id, :new.ws_app_id, :new.webpage_id,
                    decode(l_sequence_changed,'Y',:old.display_sequence,null), decode(l_sequence_changed,'Y',:new.display_sequence,null),
                    decode(l_title_changed,'Y',:old.title,null), decode(l_title_changed,'Y',:new.title,null),
                    decode(l_content_changed,'Y',:old.content,null), decode(l_content_changed,'Y',:new.content,null), sysdate, nvl(v('APP_USER'),user));
        end if;
    end if;
end;
/

prompt
prompt Creating trigger DEMO_ORDER_ITEMS_GET_PRICE
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."DEMO_ORDER_ITEMS_GET_PRICE"
  before insert or update on demo_order_items for each row
declare
  l_list_price number;
begin
  -- First, we need to get the current list price of the order line item
  select list_price into l_list_price from demo_product_info
  where product_id = :new.product_id;
  -- Once we have the correct price, we will update the order line with the correct price
  :new.unit_price := l_list_price;
end;
/

prompt
prompt Creating trigger DEPT_TRG1
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA.dept_trg1
              before insert on dept
              for each row
              begin
                  if :new.deptno is null then
                      select dept_seq.nextval into :new.deptno from dual;
                 end if;
              end;
/

prompt
prompt Creating trigger EMP_TRG1
prompt =========================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA.emp_trg1
              before insert on emp
              for each row
              begin
                  if :new.empno is null then
                      select emp_seq.nextval into :new.empno from dual;
                 end if;
              end;
/

prompt
prompt Creating trigger INSERT_DEMO_CUST
prompt =================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."INSERT_DEMO_CUST"
  BEFORE INSERT ON demo_customers FOR EACH ROW
DECLARE
  cust_id number;
BEGIN
  SELECT demo_cust_seq.nextval
    INTO cust_id
    FROM dual;
  :new.CUSTOMER_ID := cust_id;
END;
/

prompt
prompt Creating trigger INSERT_DEMO_ORDER_ITEMS
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."INSERT_DEMO_ORDER_ITEMS"
  BEFORE insert on "DEMO_ORDER_ITEMS" for each row
declare
  order_item_id number;
begin
  select demo_order_items_seq.nextval into order_item_id from dual;
  :new.ORDER_ITEM_ID := order_item_id;
end;
/

prompt
prompt Creating trigger INSERT_DEMO_PROD
prompt =================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."INSERT_DEMO_PROD"
  BEFORE INSERT ON demo_product_info FOR EACH ROW
DECLARE
  prod_id number;
BEGIN
  SELECT demo_prod_seq.nextval
    INTO prod_id
    FROM dual;
  :new.PRODUCT_ID := prod_id;
END;
/

prompt
prompt Creating trigger MAINTAIN_CAMPUS_SELECTIONS
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA.maintain_campus_selections
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_ABS_RSN_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_CAMPUS_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_CLASS_PRD_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_COURSE_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_CRS_SECT_DIM_LAST_UPDATE"
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
CREATE OR REPLACE TRIGGER QUINLANDATA.TRG_DIST_DIM_LAST_UPDATE
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
CREATE OR REPLACE TRIGGER QUINLANDATA."TRG_STU_DIM_LAST_UPDATE"
  before insert or update on student_dim
  for each row
declare

begin
  :NEW.last_update := systimestamp;
end trg_stu_dim_last_update;
/

prompt
prompt Creating trigger UPDATE_ORDER_TOTAL
prompt ===================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."UPDATE_ORDER_TOTAL"
  after insert or update or delete on demo_order_items
begin
  -- Update the Order Total when any order item is changed
  update demo_orders set order_total =
  (select sum(unit_price*quantity) from demo_order_items
    where demo_order_items.order_id = demo_orders.order_id);
end;
/

prompt
prompt Creating trigger USER_ACCOUNT_BEFORE_INSERT
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."USER_ACCOUNT_BEFORE_INSERT"
BEFORE INSERT
    ON USER_ACCOUNT
    FOR EACH ROW

DECLARE

    V_USERSID NUMBER := 123;
    V_DISTSID NUMBER := 1;

    L_EMAIL_TO                  VARCHAR2 (90);
    L_EMAIL_FROM                VARCHAR2 (90);
    L_EMAIL_SUBJECT             VARCHAR2 (90);
    L_EMAIL_APPLICATION_LINK    VARCHAR2 (400);
    L_EMAIL_SALUTATION          VARCHAR2 (400);
    L_BODY                      CLOB;
    L_BODY_HTML                 CLOB;
    L_TEMP_PW                   VARCHAR2(20)  := 'default' ;
    L_USER_SID NUMBER;
    L_USER_ID VARCHAR2(90);
    L_PASSWORD_EXPIRATION_DATE DATE;
    L_USER_FIRST_NAME VARCHAR2(50);
    L_USER_LAST_NAME VARCHAR2(50);
    L_EMAIL_ADDRESS VARCHAR2(90);
    L_ACCOUNT_LOCKED VARCHAR2(1);
    L_ACTIVE_ACCOUNT_FLAG VARCHAR2(1);
    L_DISTRICT_SID NUMBER;
    L_ATTEMPT_CTR NUMBER;
    L_LAST_LOGIN_DATE DATE;
    L_FIRST_LOGIN_FLAG VARCHAR2(1);
    L_DATE DATE  := SYSDATE;

BEGIN

   -- WWV_FLOW_API.SET_SECURITY_GROUP_ID(1240428170859550) ; --- REQUIRED FOR PL/SQL
    WWV_FLOW_API.SET_SECURITY_GROUP_ID(1268819252054577) ; --- REQUIRED FOR PL/SQL

    :NEW.USER_SID  :=  SID_SEQUENCE.NEXTVAL ;
    :NEW.PASSWORD   := 'Not Valid';
    :NEW.PASSWORD_EXPIRATION_DATE   := SYSDATE;
    :NEW.PASSWORD_UPDATE_DATE   := SYSDATE;
    :NEW.EMAIL_ADDRESS   := ' ';
    :NEW.CREATE_DATE  := SYSDATE;
    :NEW.UPDATE_DATE   := SYSDATE;
    :NEW.ACCOUNT_LOCKED   := 'Y';
    :NEW.ACTIVE_ACCOUNT_FLAG     := 'Y';
    :NEW.ATTEMPT_CTR    := 9;
    :NEW.FIRST_LOGIN_FLAG    := 'Y';

    :NEW.USER_ID     := UPPER(:NEW.USER_ID );


 -- FIND INFO OF PERSON PERFORMING INSERT INTO TABLE
   SELECT USER_SID, DISTRICT_SID   INTO V_USERSID , V_DISTSID
        FROM USER_ACCOUNT WHERE UPPER( USER_ID) = UPPER(NVL(V('APP_USER'),USER))  ;

   :NEW.DISTRICT_SID   := V_DISTSID;
   :NEW.CREATED_BY     := V_USERSID;
   :NEW.UPDATED_BY     := V_USERSID;
   L_EMAIL_FROM :=  UPPER(NVL(V('APP_USER'),USER)) ;
  --    L_EMAIL_FROM :=  'john.smith@region10.org'  ;


 --------------------------------------------------------------
     L_EMAIL_TO := :NEW.USER_ID;

  /* GENERATE NEW PW */
     L_TEMP_PW :=   DBMS_RANDOM.STRING( 'X', 8 );
    :NEW.PASSWORD   :=   PKG_SV_SECURITY.FN_GET_HASH(:NEW.USER_ID, L_TEMP_PW);


  /* GET THE EMAIL */

   SELECT  EMAIL_SUBJECT, EMAIL_BODY, APPLICATION_LINK,SALUTATION
     INTO  L_EMAIL_SUBJECT, L_BODY_HTML, L_EMAIL_APPLICATION_LINK,L_EMAIL_SALUTATION
     FROM  EMAIL_SPECIFICATION
     WHERE EMAIL_TYPE_SID = 1;


 ---   L_BODY_HTML :=  ' Attn: ' || L_USER_FIRST_NAME || ' ' || L_USER_LAST_NAME  || L_BODY_HTML ;
    L_BODY_HTML := L_BODY_HTML || L_TEMP_PW || L_EMAIL_APPLICATION_LINK || L_EMAIL_SALUTATION;
    L_BODY  := 'To view the content of this message, please use an HTML enabled mail client.'||

UTL_TCP.CRLF;

   L_EMAIL_TO := :NEW.USER_ID;


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


END;
/

prompt
prompt Creating trigger USER_CAMPUS_BEFORE_INSERT
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."USER_CAMPUS_BEFORE_INSERT"
BEFORE INSERT
    ON USER_CAMPUS
    FOR EACH ROW

BEGIN
    :NEW.USER_CAMPUS_SID  :=  SID_SEQUENCE.NEXTVAL ;

END;
/

prompt
prompt Creating trigger USER_QUESTION_BEFORE_INSERT
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."USER_QUESTION_BEFORE_INSERT"
BEFORE INSERT
    ON USER_SECURITY_QUESTION
    FOR EACH ROW

BEGIN
    :NEW.USER_SECURITY_QUESTION_SID  :=  SID_SEQUENCE.NEXTVAL ;

END;
/

prompt
prompt Creating trigger USER_ROLE_BEFORE_INSERT
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER QUINLANDATA."USER_ROLE_BEFORE_INSERT"
BEFORE INSERT
    ON USER_ROLE
    FOR EACH ROW

DECLARE


BEGIN
    :NEW.USER_ROLE_SID  :=  SID_SEQUENCE.NEXTVAL ;

END;
/


spool off
