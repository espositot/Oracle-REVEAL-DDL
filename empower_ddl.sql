-----------------------------------------------------------
-- Export file for user EMPOWER@DATAWH                   --
-- Created by espositot on 5/26/2016, 15:37:52 15:37:52  --
-----------------------------------------------------------

set define off
spool empower_ddl.log

prompt
prompt Creating table ACCOUNT_FISCAL_YEAR_DIM
prompt ======================================
prompt
create table EMPOWER.ACCOUNT_FISCAL_YEAR_DIM
(
  account_fiscal_year_sid  NUMBER(2) not null,
  account_fiscal_year_code VARCHAR2(1) not null,
  account_fiscal_year_desc VARCHAR2(4) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.ACCOUNT_FISCAL_YEAR_DIM.account_fiscal_year_code
  is 'The financial fiscal year of the account.
Values:
0-9';
comment on column EMPOWER.ACCOUNT_FISCAL_YEAR_DIM.account_fiscal_year_desc
  is 'The fiscal year in century format.
Example:
2009';
alter table EMPOWER.ACCOUNT_FISCAL_YEAR_DIM
  add constraint PK_ACCOUNT_FISCAL_YEAR_DIM primary key (ACCOUNT_FISCAL_YEAR_SID)
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
alter index EMPOWER.PK_ACCOUNT_FISCAL_YEAR_DIM nologging;
alter table EMPOWER.ACCOUNT_FISCAL_YEAR_DIM
  add constraint AK_ACCT_FISCAL_YR_BUS_ACCOUNT_ unique (ACCOUNT_FISCAL_YEAR_DESC)
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
alter index EMPOWER.AK_ACCT_FISCAL_YR_BUS_ACCOUNT_ nologging;

prompt
prompt Creating table DISTRICT_DIM
prompt ===========================
prompt
create table EMPOWER.DISTRICT_DIM
(
  district_sid  NUMBER(4) not null,
  district_id   VARCHAR2(6) not null,
  district_name VARCHAR2(20) not null,
  esc_region    VARCHAR2(2) not null,
  square_miles  NUMBER(5,2),
  logo_url      VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWER.DISTRICT_DIM
  add constraint PK_DISTRICT_DIM primary key (DISTRICT_SID)
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
alter index EMPOWER.PK_DISTRICT_DIM nologging;

prompt
prompt Creating table BUDGET_TRANS_TYPE_DIM
prompt ====================================
prompt
create table EMPOWER.BUDGET_TRANS_TYPE_DIM
(
  budget_transaction_type_sid   NUMBER(3) not null,
  district_sid                  NUMBER(4) not null,
  local_budget_transaction_type VARCHAR2(15) not null,
  budget_transaction_type       VARCHAR2(15) not null,
  budget_transaction_type_key   VARCHAR2(30) not null,
  create_date                   DATE not null,
  last_update_date              DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.BUDGET_TRANS_TYPE_DIM.budget_transaction_type
  is 'Values:
Original Budget
Budget Revision';
alter table EMPOWER.BUDGET_TRANS_TYPE_DIM
  add constraint PK_BUDGET_TRANS_TYPE_DIM primary key (BUDGET_TRANSACTION_TYPE_SID)
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
alter index EMPOWER.PK_BUDGET_TRANS_TYPE_DIM nologging;
alter table EMPOWER.BUDGET_TRANS_TYPE_DIM
  add constraint AK_BUDGET_TRANS_BUS_K_BUDGET_T unique (BUDGET_TRANSACTION_TYPE_KEY)
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
alter index EMPOWER.AK_BUDGET_TRANS_BUS_K_BUDGET_T nologging;
alter table EMPOWER.BUDGET_TRANS_TYPE_DIM
  add constraint FK_BUDGET_T_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table DATE_DIM
prompt =======================
prompt
create table EMPOWER.DATE_DIM
(
  date_sid                    NUMBER(8) not null,
  district_sid                NUMBER(4) not null,
  date_id                     DATE not null,
  calendar_year               VARCHAR2(4) not null,
  calendar_year_quarter       VARCHAR2(7) not null,
  calendar_quarter            VARCHAR2(1) not null,
  calendar_year_month         VARCHAR2(6) not null,
  calendar_month              VARCHAR2(2) not null,
  calendar_month_name         VARCHAR2(9) not null,
  calendar_month_short_name   VARCHAR2(3) not null,
  calendar_week               VARCHAR2(2) not null,
  day_of_week                 VARCHAR2(1) not null,
  day_of_week_name            VARCHAR2(9) not null,
  day_of_week_short_name      VARCHAR2(3) not null,
  school_year                 VARCHAR2(4) not null,
  school_year_description     VARCHAR2(9) not null,
  school_week                 VARCHAR2(2),
  year_month_day              VARCHAR2(8) not null,
  short_date                  VARCHAR2(10) not null,
  long_date                   VARCHAR2(18) not null,
  fiscal_year                 VARCHAR2(4),
  fiscal_year_quarter         VARCHAR2(7),
  fiscal_quarter              VARCHAR2(1),
  fiscal_period               VARCHAR2(2),
  school_day_indicator        VARCHAR2(13),
  academic_week               VARCHAR2(2),
  academic_6_weeks            VARCHAR2(1),
  academic_9_weeks            VARCHAR2(1),
  semester                    VARCHAR2(1),
  snapshot_date_indicator     VARCHAR2(3),
  date_key                    VARCHAR2(15) not null,
  academic_day                NUMBER(3),
  weekly_enrollment_date_flag VARCHAR2(3),
  first_day_academic_6_weeks  VARCHAR2(3),
  last_day_academic_6_weeks   VARCHAR2(3),
  first_day_academic_9_weeks  VARCHAR2(3),
  last_day_academic_9_weeks   VARCHAR2(3),
  first_day_semester          VARCHAR2(3),
  last_day_semester           VARCHAR2(3),
  discipline_reporting_period VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.DATE_DIM.date_id
  is 'A specific day of the year';
comment on column EMPOWER.DATE_DIM.calendar_year
  is 'Example: 2009';
comment on column EMPOWER.DATE_DIM.calendar_year_quarter
  is 'Example: 2009 Q1';
comment on column EMPOWER.DATE_DIM.calendar_quarter
  is 'Example: 1';
comment on column EMPOWER.DATE_DIM.calendar_year_month
  is 'Example: 200912';
comment on column EMPOWER.DATE_DIM.calendar_month
  is 'Example: 12';
comment on column EMPOWER.DATE_DIM.calendar_month_name
  is 'Example: December';
comment on column EMPOWER.DATE_DIM.calendar_month_short_name
  is 'Example: Dec';
comment on column EMPOWER.DATE_DIM.calendar_week
  is 'Example: 50';
comment on column EMPOWER.DATE_DIM.day_of_week
  is 'Example: 5 (Thursday)';
comment on column EMPOWER.DATE_DIM.day_of_week_name
  is 'Example: Thursday';
comment on column EMPOWER.DATE_DIM.day_of_week_short_name
  is 'Example: Thu';
comment on column EMPOWER.DATE_DIM.school_year
  is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column EMPOWER.DATE_DIM.school_year_description
  is 'Example: 2009/2010';
comment on column EMPOWER.DATE_DIM.school_week
  is 'Example: 24';
comment on column EMPOWER.DATE_DIM.year_month_day
  is 'Example: 20091215';
comment on column EMPOWER.DATE_DIM.short_date
  is 'Example: 12/15/2009';
comment on column EMPOWER.DATE_DIM.long_date
  is 'Example: December 15, 2009';
comment on column EMPOWER.DATE_DIM.fiscal_year
  is 'Example: 2010';
comment on column EMPOWER.DATE_DIM.fiscal_year_quarter
  is 'Example: 2010 Q2';
comment on column EMPOWER.DATE_DIM.fiscal_quarter
  is 'Example: 2';
comment on column EMPOWER.DATE_DIM.fiscal_period
  is 'Example: 05';
comment on column EMPOWER.DATE_DIM.school_day_indicator
  is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column EMPOWER.DATE_DIM.academic_week
  is 'The week number of the instructional school year';
comment on column EMPOWER.DATE_DIM.academic_6_weeks
  is 'Example: 3';
comment on column EMPOWER.DATE_DIM.academic_9_weeks
  is 'Example: 2';
comment on column EMPOWER.DATE_DIM.semester
  is 'Example: 1';
comment on column EMPOWER.DATE_DIM.snapshot_date_indicator
  is 'Indicates if this date is the snapshot date.
Vaules:
Y - Yes
N- No';
comment on column EMPOWER.DATE_DIM.academic_day
  is 'The count of the instructional days.

IMPORTANT: this must be resequenced for snow/make up days.';
comment on column EMPOWER.DATE_DIM.weekly_enrollment_date_flag
  is 'Indicates the day that enrollment counts should be performed for the Dashboard
enrollment report.
Values:
Yes
No';
comment on column EMPOWER.DATE_DIM.first_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.last_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.first_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.last_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.first_day_semester
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.last_day_semester
  is 'Values: Yes/No';
comment on column EMPOWER.DATE_DIM.discipline_reporting_period
  is 'Used for capturing all discipline incidents into reporting periods roughly associated to the academic 6 weeks.
The first period runs from August 1 of the School_Year to the end of the first academic_6_weeks.
The second period runs from the day after the end of the of the first academic_6_weeks to the end of the second academic_6_weeks and so on.
The last 6 weeks ends on July 31.';
create bitmap index EMPOWER.BMI_DATE_DIM_DISTRICT_SID on EMPOWER.DATE_DIM (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_DATE_DIM_DIST_ACAD_DAY on EMPOWER.DATE_DIM (DISTRICT_SID, ACADEMIC_DAY)
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
create bitmap index EMPOWER.BMI_DATE_DIM_DIST_SCHOOL_DAY on EMPOWER.DATE_DIM (DISTRICT_SID, SCHOOL_DAY_INDICATOR)
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
create bitmap index EMPOWER.BMI_DATE_DIM_SCHOOL_YEAR on EMPOWER.DATE_DIM (DISTRICT_SID, SCHOOL_YEAR)
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
create index EMPOWER.UX_DATE_DIM_YEARMONTHDAY on EMPOWER.DATE_DIM (YEAR_MONTH_DAY)
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
alter table EMPOWER.DATE_DIM
  add constraint PK_DATE_DIM primary key (DATE_SID)
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
alter index EMPOWER.PK_DATE_DIM nologging;
alter table EMPOWER.DATE_DIM
  add constraint AK_DATE_DIM_BUS_KEY_DATE_DIM unique (DATE_KEY)
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
alter index EMPOWER.AK_DATE_DIM_BUS_KEY_DATE_DIM nologging;
alter table EMPOWER.DATE_DIM
  add constraint FK_DATE_DIM_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID)
  disable
  novalidate;

prompt
prompt Creating table FUNCTION_DIM
prompt ===========================
prompt
create table EMPOWER.FUNCTION_DIM
(
  function_sid              NUMBER(4) not null,
  function_major_code       VARCHAR2(2) not null,
  function_major_code_desc  VARCHAR2(100) not null,
  function_code             VARCHAR2(2) not null,
  function_code_description VARCHAR2(100) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWER.FUNCTION_DIM
  add constraint PK_FUNCTION_DIM primary key (FUNCTION_SID)
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
alter index EMPOWER.PK_FUNCTION_DIM nologging;
alter table EMPOWER.FUNCTION_DIM
  add constraint AK_FUNCTION_BUS_KEY_FUNCTION unique (FUNCTION_CODE)
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
alter index EMPOWER.AK_FUNCTION_BUS_KEY_FUNCTION nologging;

prompt
prompt Creating table FUND_DIM
prompt =======================
prompt
create table EMPOWER.FUND_DIM
(
  fund_sid                     NUMBER(6) not null,
  district_sid                 NUMBER(4) not null,
  fund_major_code              VARCHAR2(3) not null,
  fund_major_code_description  VARCHAR2(100) not null,
  fund_code                    VARCHAR2(3) not null,
  fund_code_description        VARCHAR2(100) not null,
  fund_code_conformed_desc     VARCHAR2(100) not null,
  fund_rollup_code             VARCHAR2(4) not null,
  fund_rollup_code_description VARCHAR2(100) not null,
  fund_key                     VARCHAR2(10) not null,
  last_update_date             DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.FUND_DIM.fund_code_description
  is 'The districts local description';
comment on column EMPOWER.FUND_DIM.fund_code_conformed_desc
  is 'The State defined description of this fund';
alter table EMPOWER.FUND_DIM
  add constraint PK_FUND_DIM primary key (FUND_SID)
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
alter index EMPOWER.PK_FUND_DIM nologging;
alter table EMPOWER.FUND_DIM
  add constraint AK_FUND_BUS_KEY_FUND_DIM unique (FUND_KEY)
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
alter index EMPOWER.AK_FUND_BUS_KEY_FUND_DIM nologging;
alter table EMPOWER.FUND_DIM
  add constraint FK_FUND_DIM_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table LOCAL_OPTION_CODE_DIM
prompt ====================================
prompt
create table EMPOWER.LOCAL_OPTION_CODE_DIM
(
  local_option_code_sid         NUMBER(4) not null,
  district_sid                  NUMBER(4) not null,
  local_option_code             VARCHAR2(3) not null,
  local_option_code_description VARCHAR2(100) not null,
  local_option_code_key         VARCHAR2(10) not null,
  create_date                   DATE not null,
  last_update_date              DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWER.LOCAL_OPTION_CODE_DIM
  add constraint PK_LOCAL_OPTION_CODE_DIM primary key (LOCAL_OPTION_CODE_SID)
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
alter index EMPOWER.PK_LOCAL_OPTION_CODE_DIM nologging;
alter table EMPOWER.LOCAL_OPTION_CODE_DIM
  add constraint AK_LOCAL_OPTION_BUS_K_LOCAL_OP unique (LOCAL_OPTION_CODE_KEY)
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
alter index EMPOWER.AK_LOCAL_OPTION_BUS_K_LOCAL_OP nologging;
alter table EMPOWER.LOCAL_OPTION_CODE_DIM
  add constraint FK_LOCAL_OPT_REF_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table OBJECT_DIM
prompt =========================
prompt
create table EMPOWER.OBJECT_DIM
(
  object_sid                     NUMBER(7) not null,
  district_sid                   NUMBER(4) not null,
  object_code                    VARCHAR2(4) not null,
  object_code_description        VARCHAR2(100) not null,
  object_code_conformed_desc     VARCHAR2(100) not null,
  sub_object_code                VARCHAR2(2) not null,
  sub_object_code_description    VARCHAR2(100) not null,
  object_class_code              VARCHAR2(4) not null,
  object_class_code_description  VARCHAR2(100) not null,
  object_major_code              VARCHAR2(4) not null,
  object_major_code_description  VARCHAR2(100) not null,
  object_detail_code             VARCHAR2(4) not null,
  object_detail_code_description VARCHAR2(100) not null,
  object_rollup_code             VARCHAR2(5) not null,
  object_rollup_code_description VARCHAR2(100) not null,
  object_key                     VARCHAR2(15) not null,
  create_date                    DATE,
  last_update_date               DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.OBJECT_DIM.object_code_description
  is 'District local description';
comment on column EMPOWER.OBJECT_DIM.object_code_conformed_desc
  is 'State Defined Description';
alter table EMPOWER.OBJECT_DIM
  add constraint PK_OBJECT_DIM primary key (OBJECT_SID)
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
alter index EMPOWER.PK_OBJECT_DIM nologging;
alter table EMPOWER.OBJECT_DIM
  add constraint AK_OBJECT_BUS_KEY_OBJECT_D unique (OBJECT_KEY)
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
alter index EMPOWER.AK_OBJECT_BUS_KEY_OBJECT_D nologging;
alter table EMPOWER.OBJECT_DIM
  add constraint FK_OBJECT_D_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ORGANIZATION_DIM
prompt ===============================
prompt
create table EMPOWER.ORGANIZATION_DIM
(
  organization_sid            NUMBER(8) not null,
  district_sid                NUMBER(4) not null,
  organization_code           VARCHAR2(3) not null,
  organization_name           VARCHAR2(50) not null,
  organization_admin_type     VARCHAR2(20) not null,
  organization_conformed_type VARCHAR2(20) not null,
  organization_local_type     VARCHAR2(20) not null,
  organization_rollup_code    VARCHAR2(4) not null,
  organization_rollup_desc    VARCHAR2(100) not null,
  organization_key            VARCHAR2(15) not null,
  create_date                 DATE not null,
  last_update_date            DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.ORGANIZATION_DIM.organization_admin_type
  is 'Describes the kind of oranization.
Values:
High School
Middle School
Elementary School
Finance';
comment on column EMPOWER.ORGANIZATION_DIM.organization_key
  is 'The concatenated business key';
alter table EMPOWER.ORGANIZATION_DIM
  add constraint PK_ORGANIZATION_DIM primary key (ORGANIZATION_SID)
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
alter index EMPOWER.PK_ORGANIZATION_DIM nologging;
alter table EMPOWER.ORGANIZATION_DIM
  add constraint AK_ORG_BUS_KEY_ORGANIZA unique (ORGANIZATION_KEY)
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
alter index EMPOWER.AK_ORG_BUS_KEY_ORGANIZA nologging;
alter table EMPOWER.ORGANIZATION_DIM
  add constraint FK_ORGANIZA_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table PROGRAM_INTENT_DIM
prompt =================================
prompt
create table EMPOWER.PROGRAM_INTENT_DIM
(
  program_intent_sid         NUMBER(4) not null,
  program_intent_code        VARCHAR2(2) not null,
  program_intent_description VARCHAR2(100) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWER.PROGRAM_INTENT_DIM
  add constraint PK_PROGRAM_INTENT_DIM primary key (PROGRAM_INTENT_SID)
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
alter index EMPOWER.PK_PROGRAM_INTENT_DIM nologging;
alter table EMPOWER.PROGRAM_INTENT_DIM
  add constraint AK_PROGRAM_INTENT_BUS_PROGRAM_ unique (PROGRAM_INTENT_CODE)
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
alter index EMPOWER.AK_PROGRAM_INTENT_BUS_PROGRAM_ nologging;

prompt
prompt Creating table BUDGET_FACT
prompt ==========================
prompt
create table EMPOWER.BUDGET_FACT
(
  district_sid                NUMBER(4) not null,
  transaction_date_sid        NUMBER(8) not null,
  budget_transaction_id       VARCHAR2(25) not null,
  post_date_sid               NUMBER(8) not null,
  fund_sid                    NUMBER(6) not null,
  function_sid                NUMBER(4) not null,
  object_sid                  NUMBER(7) not null,
  organization_sid            NUMBER(8) not null,
  account_fiscal_year_sid     NUMBER(2) not null,
  program_intent_sid          NUMBER(4) not null,
  local_option_code_sid       NUMBER(4) not null,
  budget_transaction_type_sid NUMBER(3) not null,
  account_string              VARCHAR2(28) not null,
  budget_amount               NUMBER(12,2) not null,
  create_date                 DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWER.BUDGET_FACT
  add constraint PK_BUDGET_FACT primary key (DISTRICT_SID, TRANSACTION_DATE_SID, BUDGET_TRANSACTION_ID)
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
alter index EMPOWER.PK_BUDGET_FACT nologging;
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_ACCOUNT_ foreign key (ACCOUNT_FISCAL_YEAR_SID)
  references EMPOWER.ACCOUNT_FISCAL_YEAR_DIM (ACCOUNT_FISCAL_YEAR_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_BUDGET_T foreign key (BUDGET_TRANSACTION_TYPE_SID)
  references EMPOWER.BUDGET_TRANS_TYPE_DIM (BUDGET_TRANSACTION_TYPE_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_FUNCTION foreign key (FUNCTION_SID)
  references EMPOWER.FUNCTION_DIM (FUNCTION_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_FUND_DIM foreign key (FUND_SID)
  references EMPOWER.FUND_DIM (FUND_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_OBJECT_D foreign key (OBJECT_SID)
  references EMPOWER.OBJECT_DIM (OBJECT_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_ORGANIZA foreign key (ORGANIZATION_SID)
  references EMPOWER.ORGANIZATION_DIM (ORGANIZATION_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REFERENCE_PROGRAM_ foreign key (PROGRAM_INTENT_SID)
  references EMPOWER.PROGRAM_INTENT_DIM (PROGRAM_INTENT_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REF_LOCAL_OPT_DIM foreign key (LOCAL_OPTION_CODE_SID)
  references EMPOWER.LOCAL_OPTION_CODE_DIM (LOCAL_OPTION_CODE_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REF_POST_DATE_DIM foreign key (POST_DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID);
alter table EMPOWER.BUDGET_FACT
  add constraint FK_BUDGET_F_REF_TRANS_DATE_DIM foreign key (TRANSACTION_DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID);

prompt
prompt Creating table DISTRICT_BENCHMARK
prompt =================================
prompt
create table EMPOWER.DISTRICT_BENCHMARK
(
  district_sid           NUMBER(4) not null,
  benchmark_type         VARCHAR2(25) not null,
  benchmark_period_type  VARCHAR2(25) not null,
  benchmark_period_value VARCHAR2(4),
  benchmark_value        VARCHAR2(25)
)
tablespace DW_DEFAULT01
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
comment on column EMPOWER.DISTRICT_BENCHMARK.benchmark_type
  is 'Examples:
Annual Attendance';
comment on column EMPOWER.DISTRICT_BENCHMARK.benchmark_period_type
  is 'Examples:
SCHOOL YEAR
SEMESTER
FISCAL YEAR';
comment on column EMPOWER.DISTRICT_BENCHMARK.benchmark_period_value
  is 'Examples:
2009 - school year
1 - 1st semester
2 - 2nd semester';
comment on column EMPOWER.DISTRICT_BENCHMARK.benchmark_value
  is 'This is the value upon which comparisons will be made.
Examples:
.969
A
1';
alter table EMPOWER.DISTRICT_BENCHMARK
  add constraint PK_DISTRICT_BENCHMARK primary key (DISTRICT_SID, BENCHMARK_TYPE, BENCHMARK_PERIOD_TYPE)
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
alter index EMPOWER.PK_DISTRICT_BENCHMARK nologging;
alter table EMPOWER.DISTRICT_BENCHMARK
  add constraint FK_DISTRICT_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table ETL_DISTRICT_DATES
prompt =================================
prompt
create table EMPOWER.ETL_DISTRICT_DATES
(
  district_sid       NUMBER(8),
  district_date_type VARCHAR2(30),
  date_id            DATE
)
tablespace DW_DEFAULT01
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
prompt Creating table PERFORMANCE_LEVEL_DIM
prompt ====================================
prompt
create table EMPOWER.PERFORMANCE_LEVEL_DIM
(
  performance_level_sid NUMBER(3) not null,
  performance_type      VARCHAR2(25),
  begin_range           NUMBER(4,3),
  end_range             NUMBER(4,3),
  performance_level     VARCHAR2(2),
  school_year           VARCHAR2(4)
)
tablespace DW_DEFAULT01
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
comment on column EMPOWER.PERFORMANCE_LEVEL_DIM.performance_type
  is 'Indicates the type of level 
Example: 
PBMS SPED ISS Placement';
comment on column EMPOWER.PERFORMANCE_LEVEL_DIM.begin_range
  is 'The start of the performance range for this level
Example:
-0.99
0.1
0.241';
comment on column EMPOWER.PERFORMANCE_LEVEL_DIM.end_range
  is 'The end of the performance range for this level
Example:
0.1
0.5
1.0';
comment on column EMPOWER.PERFORMANCE_LEVEL_DIM.performance_level
  is 'The level of performance for this range of values.
Example:
0
1
2
3';
comment on column EMPOWER.PERFORMANCE_LEVEL_DIM.school_year
  is 'The school year that this performance level applies to.';
alter table EMPOWER.PERFORMANCE_LEVEL_DIM
  add constraint PK_PERFORMANCE_LEVEL_DIM primary key (PERFORMANCE_LEVEL_SID)
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
alter index EMPOWER.PK_PERFORMANCE_LEVEL_DIM nologging;

prompt
prompt Creating table PBMS_ISS_DISTRICT_SUM_FACT
prompt =========================================
prompt
create table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
(
  load_sid                      NUMBER not null,
  date_sid                      NUMBER(8) not null,
  district_sid                  NUMBER(4) not null,
  performance_level_sid         NUMBER(3),
  sped_iss_count                NUMBER(5),
  sped_student_count            NUMBER(5),
  student_iss_count             NUMBER(5),
  student_count                 NUMBER(5),
  sped_ratio                    NUMBER(6,3),
  student_ratio                 NUMBER(6,3),
  performance_level_percent     NUMBER(6,3),
  ytd_sped_iss_count            NUMBER(5),
  ytd_sped_student_count        NUMBER(5),
  ytd_student_iss_count         NUMBER(5),
  ytd_student_count             NUMBER(5),
  ytd_sped_ratio                NUMBER(6,3),
  ytd_student_ratio             NUMBER(6,3),
  ytd_performance_level_percent NUMBER(6,3),
  ytd_performance_level_sid     NUMBER(3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.load_sid
  is 'Identifies when this row was loaded';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.district_sid
  is 'Identifies the district being report on';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.performance_level_sid
  is 'Identifies the performance level of the
for the lowest level grain.';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.sped_iss_count
  is 'A count of the number of In School Suspension incidents involving
Specail education students.';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.sped_student_count
  is 'Count of the total number of students enrolled in Special Education
during the specified period.';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.student_iss_count
  is 'Total number of ISS student incidents during the specified period.';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.student_count
  is 'Total number of students during the specified period.';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.sped_ratio
  is 'SPED ISS Count divided by SPED Student Count';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.student_ratio
  is 'Student ISS Count divided by Student Count';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.performance_level_percent
  is 'The difference between SPED Ratio and Student Ratio';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_sped_iss_count
  is 'Year to date count of SPED students in ISS';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_sped_student_count
  is 'Year to date count of SPED students';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_student_iss_count
  is 'Year to date count of all students in ISS';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_student_count
  is 'Year to date count of all students';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_sped_ratio
  is 'Year to date ratio of SPED students in ISS';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_student_ratio
  is 'Year to date ratio of all students in ISS';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_performance_level_percent
  is 'Year to date difference between the YTD SPED and YTD Student ratio';
comment on column EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT.ytd_performance_level_sid
  is 'Identifies the associated perfomance level for the YTD percentage';
create index EMPOWER.BMI_ISS_DIST_SUM_DATE on EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT (DATE_SID)
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
create index EMPOWER.BMI_ISS_DIST_SUM_DIST on EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT (DISTRICT_SID)
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
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint PK_PBMS_ISS_DISTRICT_SUM_FA primary key (LOAD_SID, DISTRICT_SID, DATE_SID)
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
alter index EMPOWER.PK_PBMS_ISS_DISTRICT_SUM_FA nologging;
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint FK_PBMS_DIST_SUM_REF_DATE foreign key (DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint FK_PBMS_DIST_SUM_REF_DIST foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint FK_PBMS_DIST_SUM_REF_LOAD_DATE foreign key (LOAD_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint FK_PBMS_DIST_SUM_REF_PERF foreign key (PERFORMANCE_LEVEL_SID)
  references EMPOWER.PERFORMANCE_LEVEL_DIM (PERFORMANCE_LEVEL_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT
  add constraint FK_PBMS_DIST_SUM_REF_PERF_YTD foreign key (YTD_PERFORMANCE_LEVEL_SID)
  references EMPOWER.PERFORMANCE_LEVEL_DIM (PERFORMANCE_LEVEL_SID) on delete set null;

prompt
prompt Creating table PBMS_ISS_LOCATION_SUM_FACT
prompt =========================================
prompt
create table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
(
  load_sid                      NUMBER not null,
  date_sid                      NUMBER(8) not null,
  district_sid                  NUMBER(4) not null,
  loc_sid                       NUMBER(6) not null,
  performance_level_sid         NUMBER(3),
  sped_iss_count                NUMBER(5),
  sped_student_count            NUMBER(5),
  student_iss_count             NUMBER(5),
  student_count                 NUMBER(5),
  sped_ratio                    NUMBER(6,3),
  student_ratio                 NUMBER(6,3),
  performance_level_percent     NUMBER(6,3),
  ytd_sped_iss_count            NUMBER(5),
  ytd_sped_student_count        NUMBER(5),
  ytd_student_iss_count         NUMBER(5),
  ytd_student_count             NUMBER(5),
  ytd_sped_ratio                NUMBER(6,3),
  ytd_student_ratio             NUMBER(6,3),
  ytd_performance_level_percent NUMBER(6,3),
  ytd_performance_level_sid     NUMBER(3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.load_sid
  is 'Identifies when this row was loaded';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.date_sid
  is 'Identifies the end of the period being reported';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.district_sid
  is 'Identifies the district being report on';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.loc_sid
  is 'Identifies the location within the district. Example: Allen HS';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.performance_level_sid
  is 'Identifies the performance level of the
for the lowest level grain.';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.sped_iss_count
  is 'A count of the number of In School Suspension incidents involving
Special education students.';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.sped_student_count
  is 'Count of the total number of students enrolled in Special Education
during the specified period.';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.student_iss_count
  is 'Total number of ISS student incidents during the specified period.';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.student_count
  is 'Total number of students during the specified period.';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.sped_ratio
  is 'SPED ISS Count divided by SPED Student Count';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.student_ratio
  is 'Student ISS Count divided by Student Count';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.performance_level_percent
  is 'The difference between SPED Ratio and Student Ratio';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_sped_iss_count
  is 'Year to date count of SPED students in ISS';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_sped_student_count
  is 'Year to date count of SPED students';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_student_iss_count
  is 'Year to date count of all students in ISS';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_student_count
  is 'Year to date count of all students';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_sped_ratio
  is 'Year to date ratio of SPED students in ISS';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_student_ratio
  is 'Year to date ratio of all students in ISS';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_performance_level_percent
  is 'Year to date difference between the YTD SPED and YTD Student ratio';
comment on column EMPOWER.PBMS_ISS_LOCATION_SUM_FACT.ytd_performance_level_sid
  is 'Identifies the associated perfomance level for the YTD percentage';
create bitmap index EMPOWER.BMI_ISS_LOC_SUM_DATE on EMPOWER.PBMS_ISS_LOCATION_SUM_FACT (DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_LOC_SUM_DIST on EMPOWER.PBMS_ISS_LOCATION_SUM_FACT (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_LOC_SUM_LOC on EMPOWER.PBMS_ISS_LOCATION_SUM_FACT (LOC_SID)
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
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint PK_PBMS_ISS_LOCATION_SUM_FA primary key (LOAD_SID, DISTRICT_SID, LOC_SID, DATE_SID)
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
alter index EMPOWER.PK_PBMS_ISS_LOCATION_SUM_FA nologging;
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint FK_PBMS_LOC_SUM_REF_DATE foreign key (DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint FK_PBMS_LOC_SUM_REF_DIST foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint FK_PBMS_LOC_SUM_REF_LOAD_DATE foreign key (LOAD_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint FK_PBMS_LOC_SUM_REF_PERF foreign key (PERFORMANCE_LEVEL_SID)
  references EMPOWER.PERFORMANCE_LEVEL_DIM (PERFORMANCE_LEVEL_SID) on delete set null;
alter table EMPOWER.PBMS_ISS_LOCATION_SUM_FACT
  add constraint FK_PBMS_LOC_SUM_REF_PERF_YTD foreign key (YTD_PERFORMANCE_LEVEL_SID)
  references EMPOWER.PERFORMANCE_LEVEL_DIM (PERFORMANCE_LEVEL_SID) on delete set null;

prompt
prompt Creating table PBMS_ISS_PLACEMENT_FACT
prompt ======================================
prompt
create table EMPOWER.PBMS_ISS_PLACEMENT_FACT
(
  load_sid            NUMBER not null,
  stu_sid             NUMBER(9) not null,
  date_sid            NUMBER(8) not null,
  district_sid        NUMBER(4) not null,
  loc_sid             NUMBER(6) not null,
  event_id            VARCHAR2(50) not null,
  iss_placement_count NUMBER(1) not null,
  event_date_sid      NUMBER(8),
  action_date_sid     NUMBER(8),
  incident_number     VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.load_sid
  is 'Identifies the date on which the row was added';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.stu_sid
  is 'Identifies the student';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.date_sid
  is 'Identifies the end date of the reporting period';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.district_sid
  is 'Identifies the district of the student';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.loc_sid
  is 'Identified the location of the student';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.event_id
  is 'Is the business key of the disicipline event';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.iss_placement_count
  is 'Indicates if the action is counted in the ISS Caculation. Values: 1 - Yes  0 - No';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.event_date_sid
  is 'Identifies the date that the discipline event occured';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.action_date_sid
  is 'Identifies the date that the discipline action occured';
comment on column EMPOWER.PBMS_ISS_PLACEMENT_FACT.incident_number
  is 'Identifies a unique disiciplinary incident.';
create bitmap index EMPOWER.BMI_ISS_PD_ACTDT on EMPOWER.PBMS_ISS_PLACEMENT_FACT (ACTION_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_PD_DATEDISTLOC on EMPOWER.PBMS_ISS_PLACEMENT_FACT (DATE_SID, DISTRICT_SID, LOC_SID)
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
create bitmap index EMPOWER.BMI_ISS_PD_DISTSTULOCDATE on EMPOWER.PBMS_ISS_PLACEMENT_FACT (DISTRICT_SID, STU_SID, LOC_SID, DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_PD_EVENTDT on EMPOWER.PBMS_ISS_PLACEMENT_FACT (EVENT_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_PD_EVENTID on EMPOWER.PBMS_ISS_PLACEMENT_FACT (EVENT_ID)
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
create bitmap index EMPOWER.BMI_ISS_PD_INCNUM on EMPOWER.PBMS_ISS_PLACEMENT_FACT (INCIDENT_NUMBER)
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
create bitmap index EMPOWER.BMI_ISS_PD_LOADDT on EMPOWER.PBMS_ISS_PLACEMENT_FACT (LOAD_SID)
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
create bitmap index EMPOWER.BMI_ISS_PD_PLCMNTCNT on EMPOWER.PBMS_ISS_PLACEMENT_FACT (ISS_PLACEMENT_COUNT)
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
alter table EMPOWER.PBMS_ISS_PLACEMENT_FACT
  add constraint PK_PBMS_ISS_PLACEMENT_FACT primary key (LOAD_SID, STU_SID, DATE_SID, EVENT_ID)
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
alter index EMPOWER.PK_PBMS_ISS_PLACEMENT_FACT nologging;
alter table EMPOWER.PBMS_ISS_PLACEMENT_FACT
  add constraint FK_ISS_PD_REF_PRD_DATE_DIM foreign key (DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;

prompt
prompt Creating table PBMS_ISS_STUDENT_FACT
prompt ====================================
prompt
create table EMPOWER.PBMS_ISS_STUDENT_FACT
(
  load_sid                  NUMBER not null,
  stu_sid                   NUMBER(9) not null,
  date_sid                  NUMBER(8) not null,
  district_sid              NUMBER(4) not null,
  loc_sid                   NUMBER(6) not null,
  sped_ind                  NUMBER(1),
  enroll_eff_start_date_sid NUMBER(8) not null,
  enroll_eff_end_date_sid   NUMBER(8),
  dis_eff_start_date_sid    NUMBER(8),
  dis_eff_end_date_sid      NUMBER(8),
  current_location_flag     VARCHAR2(3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.load_sid
  is 'Identifies the date on which the row was added';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.stu_sid
  is 'Identifies the student';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.date_sid
  is 'Identifies the end date of the reporting period';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.district_sid
  is 'Identifies the district of the student';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.loc_sid
  is 'Identified the location of the student';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.sped_ind
  is 'Indicates that the student was in Special Education during this dscipline event';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.enroll_eff_start_date_sid
  is 'Identifies the date the student started enrollment at that district''s location for that reporting period..';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.enroll_eff_end_date_sid
  is 'Identifies the date the student ended enrollment at that district''s location for that reporting period.';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.dis_eff_start_date_sid
  is 'Identifies the date the student''s discipline actions will be counted at that district''s location for that reporting period..';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.dis_eff_end_date_sid
  is 'Identifies the date the student''s discipline actions will be counted at that district''s location for that reporting period..';
comment on column EMPOWER.PBMS_ISS_STUDENT_FACT.current_location_flag
  is 'Indicates that this is the student''s current location.  Added to handle students that change locations during a reporting period. Values: Yes, No';
create bitmap index EMPOWER.BMI_ISS_SD_CURR_LOC_FLAG on EMPOWER.PBMS_ISS_STUDENT_FACT (CURRENT_LOCATION_FLAG)
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
create bitmap index EMPOWER.BMI_ISS_SD_DATE on EMPOWER.PBMS_ISS_STUDENT_FACT (DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_DATEDISTLOC on EMPOWER.PBMS_ISS_STUDENT_FACT (DATE_SID, DISTRICT_SID, LOC_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_DISEFFENDDATE on EMPOWER.PBMS_ISS_STUDENT_FACT (DIS_EFF_END_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_DISEFFSTARTDATE on EMPOWER.PBMS_ISS_STUDENT_FACT (DIS_EFF_START_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_DISTRICT on EMPOWER.PBMS_ISS_STUDENT_FACT (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_LOAD on EMPOWER.PBMS_ISS_STUDENT_FACT (LOAD_SID)
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
create bitmap index EMPOWER.BMI_ISS_SD_SPED_IND on EMPOWER.PBMS_ISS_STUDENT_FACT (SPED_IND)
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
create bitmap index EMPOWER.BMI_ISS_SD_STUDENT on EMPOWER.PBMS_ISS_STUDENT_FACT (STU_SID)
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
alter table EMPOWER.PBMS_ISS_STUDENT_FACT
  add constraint PK_PBMS_ISS_STUDENT_FACT primary key (LOAD_SID, STU_SID, LOC_SID, ENROLL_EFF_START_DATE_SID)
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
alter index EMPOWER.PK_PBMS_ISS_STUDENT_FACT nologging;
alter table EMPOWER.PBMS_ISS_STUDENT_FACT
  add constraint FK_ISS_SD_REF_PRD_DATE_DIM foreign key (DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID) on delete set null;

prompt
prompt Creating table TEMP_DATE_DIM
prompt ============================
prompt
create table EMPOWER.TEMP_DATE_DIM
(
  date_key             VARCHAR2(15) not null,
  district_sid         NUMBER(4) not null,
  date_id              DATE not null,
  academic_day         NUMBER,
  school_day_indicator VARCHAR2(13),
  school_year          VARCHAR2(4) not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TESTING
prompt ======================
prompt
create table EMPOWER.TESTING
(
  load_sid                  NUMBER,
  stu_sid                   NUMBER(9) not null,
  date_sid                  NUMBER,
  district_sid              NUMBER(4) not null,
  loc_county_dist_id        VARCHAR2(24),
  loc_id                    VARCHAR2(21),
  loc_sid                   NUMBER,
  reporting_period          VARCHAR2(1),
  sped_ind                  NUMBER,
  enroll_eff_start_date_sid NUMBER,
  enroll_eff_end_date_sid   NUMBER,
  disp_beg_date_sid         NUMBER,
  disp_end_date_sid         NUMBER,
  ada_enr_cnt               NUMBER,
  re_entry_flag             NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TMP_ISS_DATE_DIM
prompt ===============================
prompt
create table EMPOWER.TMP_ISS_DATE_DIM
(
  load_sid             NUMBER,
  school_year          VARCHAR2(4) not null,
  district_sid         NUMBER(4) not null,
  loc_county_dist_id   VARCHAR2(6) not null,
  reporting_period     VARCHAR2(1),
  enroll_beg_date_sid  NUMBER,
  enroll_end_date_sid  NUMBER,
  disp_beg_date_sid    NUMBER,
  disp_end_date_sid    NUMBER,
  max_reporting_period VARCHAR2(40)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index EMPOWER.BMI_ISS_DATE_DISPBEGDT_TMP on EMPOWER.TMP_ISS_DATE_DIM (DISP_BEG_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_DISPENDDT_TMP on EMPOWER.TMP_ISS_DATE_DIM (DISP_END_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_DIST_TMP on EMPOWER.TMP_ISS_DATE_DIM (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_ENROLLBEGDT_TMP on EMPOWER.TMP_ISS_DATE_DIM (ENROLL_BEG_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_ENROLLENDDT_TMP on EMPOWER.TMP_ISS_DATE_DIM (ENROLL_END_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_LOADDT_TMP on EMPOWER.TMP_ISS_DATE_DIM (LOAD_SID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_LOCDIST_TMP on EMPOWER.TMP_ISS_DATE_DIM (LOC_COUNTY_DIST_ID)
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
create bitmap index EMPOWER.BMI_ISS_DATE_MAXRPTPRD_TMP on EMPOWER.TMP_ISS_DATE_DIM (MAX_REPORTING_PERIOD)
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
create bitmap index EMPOWER.BMI_ISS_DATE_RPTPRD_TMP on EMPOWER.TMP_ISS_DATE_DIM (REPORTING_PERIOD)
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
create bitmap index EMPOWER.BMI_ISS_DATE_SCHLYR_TMP on EMPOWER.TMP_ISS_DATE_DIM (SCHOOL_YEAR)
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
prompt Creating table TMP_ISS_LOCATION_DIM
prompt ===================================
prompt
create table EMPOWER.TMP_ISS_LOCATION_DIM
(
  load_sid           NUMBER,
  loc_county_dist_id VARCHAR2(6) not null,
  district_sid       NUMBER(4) not null,
  loc_sid            NUMBER,
  loc_id             VARCHAR2(21)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index EMPOWER.BMI_ISS_LOC_DISTLOC_TMP on EMPOWER.TMP_ISS_LOCATION_DIM (DISTRICT_SID, LOC_SID)
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
create bitmap index EMPOWER.BMI_ISS_LOC_DIST_LOCID_TMP on EMPOWER.TMP_ISS_LOCATION_DIM (DISTRICT_SID, LOC_ID)
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
create bitmap index EMPOWER.BMI_ISS_LOC_LOCID_TMP on EMPOWER.TMP_ISS_LOCATION_DIM (LOC_ID)
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
create bitmap index EMPOWER.BMI_ISS_LOC_LOC_TMP on EMPOWER.TMP_ISS_LOCATION_DIM (LOC_SID)
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
prompt Creating table TMP_ISS_STUDENT_FACT
prompt ===================================
prompt
create table EMPOWER.TMP_ISS_STUDENT_FACT
(
  load_sid                  NUMBER,
  stu_sid                   NUMBER(9),
  date_sid                  NUMBER,
  district_sid              NUMBER(4),
  loc_sid                   NUMBER,
  sped_ind                  NUMBER,
  enroll_eff_start_date_sid NUMBER,
  enroll_eff_end_date_sid   NUMBER,
  dis_eff_start_date_sid    NUMBER,
  dis_eff_end_date_sid      NUMBER,
  current_location_flag     VARCHAR2(3)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table TMP_ISS_TRANSFER_DETAIL
prompt ======================================
prompt
create table EMPOWER.TMP_ISS_TRANSFER_DETAIL
(
  load_sid         NUMBER,
  stu_sid          NUMBER(9) not null,
  district_sid     NUMBER(4) not null,
  reporting_period VARCHAR2(1),
  transfer_flag    NUMBER,
  re_entry_flag    NUMBER,
  sped_ind         NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index EMPOWER.BMI_ISS_TRNSFRDET_DIST_TMP on EMPOWER.TMP_ISS_TRANSFER_DETAIL (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_TRNSFRDET_RPTPRD_TMP on EMPOWER.TMP_ISS_TRANSFER_DETAIL (REPORTING_PERIOD)
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
create bitmap index EMPOWER.BMI_ISS_TRNSFRDET_STU_TMP on EMPOWER.TMP_ISS_TRANSFER_DETAIL (STU_SID)
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
create bitmap index EMPOWER.BMI_ISS_TRNSFRDET_TRNFLG_TMP on EMPOWER.TMP_ISS_TRANSFER_DETAIL (TRANSFER_FLAG)
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
prompt Creating table TMP_ISS_TRANSFER_RETURN
prompt ======================================
prompt
create table EMPOWER.TMP_ISS_TRANSFER_RETURN
(
  load_sid            NUMBER,
  loc_county_dist_id  VARCHAR2(6) not null,
  district_sid        NUMBER(4) not null,
  loc_sid             NUMBER,
  loc_id              VARCHAR2(21),
  reporting_period    VARCHAR2(1),
  stu_sid             NUMBER(9) not null,
  disp_beg_date_sid   NUMBER,
  disp_end_date_sid   NUMBER,
  enroll_end_date_sid NUMBER,
  date_sid            NUMBER,
  loc_start_date_sid  NUMBER,
  sped_ind            NUMBER
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index EMPOWER.BMI_ISS_TRNFRRTN_DIST_TMP on EMPOWER.TMP_ISS_TRANSFER_RETURN (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_TRNFRRTN_LOCDT_TMP on EMPOWER.TMP_ISS_TRANSFER_RETURN (LOC_START_DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_TRNFRRTN_LOC_TMP on EMPOWER.TMP_ISS_TRANSFER_RETURN (LOC_SID)
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
create bitmap index EMPOWER.BMI_ISS_TRNFRRTN_STU_TMP on EMPOWER.TMP_ISS_TRANSFER_RETURN (STU_SID)
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
prompt Creating table TMP_ISS_YTD_PERFORMANCE
prompt ======================================
prompt
create table EMPOWER.TMP_ISS_YTD_PERFORMANCE
(
  load_sid               NUMBER not null,
  date_sid               NUMBER(8) not null,
  district_sid           NUMBER(4) not null,
  loc_sid                NUMBER(6) not null,
  reporting_period       VARCHAR2(1) not null,
  ytd_sped_iss_count     NUMBER(5),
  ytd_sped_student_count NUMBER(5),
  ytd_student_iss_count  NUMBER(5),
  ytd_student_count      NUMBER(5)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index EMPOWER.BMI_ISS_YTD_DATE_TMP on EMPOWER.TMP_ISS_YTD_PERFORMANCE (DATE_SID)
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
create bitmap index EMPOWER.BMI_ISS_YTD_DIST_TMP on EMPOWER.TMP_ISS_YTD_PERFORMANCE (DISTRICT_SID)
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
create bitmap index EMPOWER.BMI_ISS_YTD_LOC_TMP on EMPOWER.TMP_ISS_YTD_PERFORMANCE (LOC_SID)
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
create bitmap index EMPOWER.BMI_ISS_YTD_RPTPRD_TMP on EMPOWER.TMP_ISS_YTD_PERFORMANCE (REPORTING_PERIOD)
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
prompt Creating table TRANSACTION_TYPE_DIM
prompt ===================================
prompt
create table EMPOWER.TRANSACTION_TYPE_DIM
(
  transaction_type_sid   NUMBER(3) not null,
  district_sid           NUMBER(4) not null,
  local_transaction_type VARCHAR2(10) not null,
  transaction_type       VARCHAR2(10) not null,
  transaction_type_key   VARCHAR2(30) not null,
  create_date            DATE not null,
  last_update_date       DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWER.TRANSACTION_TYPE_DIM.transaction_type
  is 'Indicates the type of transaction being reported.
Values:
Expense
Revenue';
alter table EMPOWER.TRANSACTION_TYPE_DIM
  add constraint PK_TRANSACTION_TYPE_DIM primary key (TRANSACTION_TYPE_SID)
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
alter index EMPOWER.PK_TRANSACTION_TYPE_DIM nologging;
alter table EMPOWER.TRANSACTION_TYPE_DIM
  add constraint AK_TRANSACTION_TYPE_B_TRANSACT unique (TRANSACTION_TYPE_KEY)
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
alter index EMPOWER.AK_TRANSACTION_TYPE_B_TRANSACT nologging;
alter table EMPOWER.TRANSACTION_TYPE_DIM
  add constraint FK_TRANSACT_TYP_REF_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);

prompt
prompt Creating table TRANSACTION_FACT
prompt ===============================
prompt
create table EMPOWER.TRANSACTION_FACT
(
  district_sid            NUMBER(4) not null,
  transaction_date_sid    NUMBER(8) not null,
  transaction_id          VARCHAR2(25) not null,
  post_date_sid           NUMBER(8) not null,
  fund_sid                NUMBER(6) not null,
  function_sid            NUMBER(4) not null,
  object_sid              NUMBER(7) not null,
  organization_sid        NUMBER(8) not null,
  account_fiscal_year_sid NUMBER(2) not null,
  program_intent_sid      NUMBER(4) not null,
  local_option_code_sid   NUMBER(4) not null,
  transaction_type_sid    NUMBER(3) not null,
  account_string          VARCHAR2(28) not null,
  transaction_amount      NUMBER(13,2) not null,
  create_date             DATE not null
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on table EMPOWER.TRANSACTION_FACT
  is 'The account to which transactions are applied.
Example:
396-11-6321-00-001-9-11-S-X1';
alter table EMPOWER.TRANSACTION_FACT
  add constraint PK_TRANSACTION_FACT primary key (DISTRICT_SID, TRANSACTION_DATE_SID, TRANSACTION_ID)
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
alter index EMPOWER.PK_TRANSACTION_FACT nologging;
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_ACCOUNT_ foreign key (ACCOUNT_FISCAL_YEAR_SID)
  references EMPOWER.ACCOUNT_FISCAL_YEAR_DIM (ACCOUNT_FISCAL_YEAR_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_DISTRICT foreign key (DISTRICT_SID)
  references EMPOWER.DISTRICT_DIM (DISTRICT_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_FUNCTION foreign key (FUNCTION_SID)
  references EMPOWER.FUNCTION_DIM (FUNCTION_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_FUND_DIM foreign key (FUND_SID)
  references EMPOWER.FUND_DIM (FUND_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_OBJECT_D foreign key (OBJECT_SID)
  references EMPOWER.OBJECT_DIM (OBJECT_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_ORGANIZA foreign key (ORGANIZATION_SID)
  references EMPOWER.ORGANIZATION_DIM (ORGANIZATION_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_PROGRAM_ foreign key (PROGRAM_INTENT_SID)
  references EMPOWER.PROGRAM_INTENT_DIM (PROGRAM_INTENT_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REFERENCE_TRANSACT foreign key (TRANSACTION_TYPE_SID)
  references EMPOWER.TRANSACTION_TYPE_DIM (TRANSACTION_TYPE_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REF_LOCAL_OPT_DIM foreign key (LOCAL_OPTION_CODE_SID)
  references EMPOWER.LOCAL_OPTION_CODE_DIM (LOCAL_OPTION_CODE_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REF_POST_DATE_DIM foreign key (POST_DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID);
alter table EMPOWER.TRANSACTION_FACT
  add constraint FK_TRANSACT_REF_TRANS_DATE_DIM foreign key (TRANSACTION_DATE_SID)
  references EMPOWER.DATE_DIM (DATE_SID);

prompt
prompt Creating view POST_DATE_DIM
prompt ===========================
prompt
create or replace force view empower.post_date_dim as
select
   DATE_DIM.DATE_SID as POST_DATE_SID,
   DATE_DIM.DISTRICT_SID,
   DATE_DIM.DATE_ID,
   DATE_DIM.CALENDAR_YEAR,
   DATE_DIM.CALENDAR_YEAR_QUARTER,
   DATE_DIM.CALENDAR_QUARTER,
   DATE_DIM.CALENDAR_YEAR_MONTH,
   DATE_DIM.CALENDAR_MONTH,
   DATE_DIM.CALENDAR_MONTH_NAME,
   DATE_DIM.CALENDAR_MONTH_SHORT_NAME,
   DATE_DIM.CALENDAR_WEEK,
   DATE_DIM.DAY_OF_WEEK,
   DATE_DIM.DAY_OF_WEEK_NAME,
   DATE_DIM.DAY_OF_WEEK_SHORT_NAME,
   DATE_DIM.SCHOOL_YEAR,
   DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
   DATE_DIM.SCHOOL_WEEK,
   DATE_DIM.YEAR_MONTH_DAY,
   DATE_DIM.SHORT_DATE,
   DATE_DIM.LONG_DATE,
   DATE_DIM.FISCAL_YEAR,
   DATE_DIM.FISCAL_YEAR_QUARTER,
   DATE_DIM.FISCAL_QUARTER,
   DATE_DIM.FISCAL_PERIOD,
   DATE_DIM.SCHOOL_DAY_INDICATOR,
   DATE_DIM.ACADEMIC_WEEK,
   DATE_DIM.ACADEMIC_6_WEEKS,
   DATE_DIM.ACADEMIC_9_WEEKS,
   DATE_DIM.SEMESTER
from
   DATE_DIM
with read only;
comment on table EMPOWER.POST_DATE_DIM is 'This is the post date role of the date dim';
comment on column EMPOWER.POST_DATE_DIM.PD_DATE_ID is 'A specific day of the year';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_YEAR is 'Example: 2009';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_YEAR_QUARTER is 'Example: 2009 Q1';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_QUARTER is 'Example: 1';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_YEAR_MONTH is 'Example: 200912';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_MONTH is 'Example: 12';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_MONTH_NAME is 'Example: December';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_MONTH_SHORT_NAME is 'Example: Dec';
comment on column EMPOWER.POST_DATE_DIM.PD_CALENDAR_WEEK is 'Example: 50';
comment on column EMPOWER.POST_DATE_DIM.PD_DAY_OF_WEEK is 'Example: 5 (Thursday)';
comment on column EMPOWER.POST_DATE_DIM.PD_DAY_OF_WEEK_NAME is 'Example: Thursday';
comment on column EMPOWER.POST_DATE_DIM.PD_DAY_OF_WEEK_SHORT_NAME is 'Example: Thu';
comment on column EMPOWER.POST_DATE_DIM.PD_SCHOOL_YEAR is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column EMPOWER.POST_DATE_DIM.PD_SCHOOL_YEAR_DESCRIPTION is 'Example: 2009/2010';
comment on column EMPOWER.POST_DATE_DIM.PD_SCHOOL_WEEK is 'Example: 24';
comment on column EMPOWER.POST_DATE_DIM.PD_YEAR_MONTH_DAY is 'Example: 20091215';
comment on column EMPOWER.POST_DATE_DIM.PD_SHORT_DATE is 'Example: 12/15/2009';
comment on column EMPOWER.POST_DATE_DIM.PD_LONG_DATE is 'Example: December 15, 2009';
comment on column EMPOWER.POST_DATE_DIM.PD_FISCAL_YEAR is 'Example: 2010';
comment on column EMPOWER.POST_DATE_DIM.PD_FISCAL_YEAR_QUARTER is 'Example: 2010 Q2';
comment on column EMPOWER.POST_DATE_DIM.PD_FISCAL_QUARTER is 'Example: 2';
comment on column EMPOWER.POST_DATE_DIM.PD_FISCAL_PERIOD is 'Example: 05';
comment on column EMPOWER.POST_DATE_DIM.PD_SCHOOL_DAY_INDICATOR is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column EMPOWER.POST_DATE_DIM.PD_ACADEMIC_WEEK is 'The week number of the instructional school year';
comment on column EMPOWER.POST_DATE_DIM.PD_ACADEMIC_6_WEEKS is 'Example: 3';
comment on column EMPOWER.POST_DATE_DIM.PD_ACADEMIC_9_WEEKS is 'Example: 2';
comment on column EMPOWER.POST_DATE_DIM.PD_SEMESTER is 'Example: 1';

prompt
prompt Creating view TRANSACTION_DATE_DIM
prompt ==================================
prompt
create or replace force view empower.transaction_date_dim as
select
   DATE_DIM.DATE_SID,
   DATE_DIM.DISTRICT_SID,
   DATE_DIM.DATE_ID,
   DATE_DIM.CALENDAR_YEAR,
   DATE_DIM.CALENDAR_YEAR_QUARTER,
   DATE_DIM.CALENDAR_QUARTER,
   DATE_DIM.CALENDAR_YEAR_MONTH,
   DATE_DIM.CALENDAR_MONTH,
   DATE_DIM.CALENDAR_MONTH_NAME,
   DATE_DIM.CALENDAR_MONTH_SHORT_NAME,
   DATE_DIM.CALENDAR_WEEK,
   DATE_DIM.DAY_OF_WEEK,
   DATE_DIM.DAY_OF_WEEK_NAME,
   DATE_DIM.DAY_OF_WEEK_SHORT_NAME,
   DATE_DIM.SCHOOL_YEAR,
   DATE_DIM.SCHOOL_YEAR_DESCRIPTION,
   DATE_DIM.SCHOOL_WEEK,
   DATE_DIM.YEAR_MONTH_DAY,
   DATE_DIM.SHORT_DATE,
   DATE_DIM.LONG_DATE,
   DATE_DIM.FISCAL_YEAR,
   DATE_DIM.FISCAL_YEAR_QUARTER,
   DATE_DIM.FISCAL_QUARTER,
   DATE_DIM.FISCAL_PERIOD,
   DATE_DIM.SCHOOL_DAY_INDICATOR,
   DATE_DIM.ACADEMIC_WEEK,
   DATE_DIM.ACADEMIC_6_WEEKS,
   DATE_DIM.ACADEMIC_9_WEEKS,
   DATE_DIM.SEMESTER
from
   DATE_DIM
with read only;
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_DATE_ID is 'A specific day of the year';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_YEAR is 'Example: 2009';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_YEAR_QUARTER is 'Example: 2009 Q1';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_QUARTER is 'Example: 1';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_YEAR_MONTH is 'Example: 200912';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_MONTH is 'Example: 12';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_MONTH_NAME is 'Example: December';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_MONTH_SHORT_NAME is 'Example: Dec';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_CALENDAR_WEEK is 'Example: 50';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_DAY_OF_WEEK is 'Example: 5 (Thursday)';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_DAY_OF_WEEK_NAME is 'Example: Thursday';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_DAY_OF_WEEK_SHORT_NAME is 'Example: Thu';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SCHOOL_YEAR is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SCHOOL_YEAR_DESCRIPTION is 'Example: 2009/2010';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SCHOOL_WEEK is 'Example: 24';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_YEAR_MONTH_DAY is 'Example: 20091215';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SHORT_DATE is 'Example: 12/15/2009';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_LONG_DATE is 'Example: December 15, 2009';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_FISCAL_YEAR is 'Example: 2010';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_FISCAL_YEAR_QUARTER is 'Example: 2010 Q2';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_FISCAL_QUARTER is 'Example: 2';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_FISCAL_PERIOD is 'Example: 05';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SCHOOL_DAY_INDICATOR is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_ACADEMIC_WEEK is 'The week number of the instructional school year';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_ACADEMIC_6_WEEKS is 'Example: 3';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_ACADEMIC_9_WEEKS is 'Example: 2';
comment on column EMPOWER.TRANSACTION_DATE_DIM.TD_SEMESTER is 'Example: 1';

prompt
prompt Creating package PKG_ISS
prompt ========================
prompt
CREATE OR REPLACE PACKAGE EMPOWER."PKG_ISS"
AS

FUNCTION  fn_Increment_Counter(p_date_sid number) RETURN NUMBER;
PROCEDURE proc_PBMS_ISS_Main(p_school_year in varchar2 := '2012');
PROCEDURE proc_PBMS_ISS_Initialize(p_school_year in varchar2 := '2012', p_error in out boolean );
PROCEDURE proc_PBMS_ISS_Build_Student(p_school_year in varchar2 := '2012', p_error in out boolean );
PROCEDURE proc_PBMS_ISS_Build_Placement(p_school_year in varchar2 := '2012', p_error in out boolean );
PROCEDURE proc_PBMS_ISS_Build_Loc_Sum(p_school_year in varchar2 := '2012', p_error in out boolean );
PROCEDURE proc_PBMS_ISS_Build_Dist_Sum(p_school_year in varchar2 := '2012', p_error in out boolean );
PROCEDURE proc_PBMS_ISS_Housekeeping(p_school_year in varchar2 := '2012', p_error in out boolean );

END pkg_ISS;
/

prompt
prompt Creating procedure PRC_ACADEMIC_DAY
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWER."PRC_ACADEMIC_DAY" (v_school_year varchar2
                                                     , v_district_sid number default 0) is
v_errcode number;
v_errmesg varchar2(200);
v_error_object varchar2(250) := 'Academic Day';

begin

if v_district_sid = 0 then  

update date_dim d1
  set academic_day = 
    (with instructional_day as
       (select date_sid, date_id, rank() over (partition by district_sid order by date_id) as academic_day
               from date_dim
               where school_day_indicator = 'Instructional'
               and school_year = v_school_year
               order by date_id)
               
       select instructional_day.academic_day
               from instructional_day
               where instructional_day.date_sid = d1.date_sid)
where school_year = v_school_year
and school_day_indicator = 'Instructional';
commit;

else 
update date_dim d1
  set academic_day = 
    (with instructional_day as
       (select date_sid, date_id, rank() over (partition by district_sid order by date_id) as academic_day
               from date_dim
               where school_day_indicator = 'Instructional'
               and school_year = v_school_year
               and district_sid = v_district_sid
               order by date_id)
               
       select instructional_day.academic_day
               from instructional_day
               where instructional_day.date_sid = d1.date_sid)
where school_year = v_school_year
and school_day_indicator = 'Instructional'
and district_sid = v_district_sid;
commit;

end if;

  exception
    when others then
      v_errcode := sqlcode;
      v_errmesg := substr(sqlerrm,1,200);
      v_error_object := 'ETL Load Validation';
      
      insert into empowerstaging.etl_event_log
      (job_name,event_time,event_type,source_name,status,error_code,error_message,user_id,terminal_id)
      values
      (v_error_object,sysdate,'Error','pkg_date_dim.prc_academic_day','E',v_errcode,v_errmesg,user,userenv('terminal'));
      
      commit;
      raise;
end prc_academic_day;
/

prompt
prompt Creating procedure PROC_LOAD_FUNCTION_DIM
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWER."PROC_LOAD_FUNCTION_DIM"
is
-- ******************************************************************
-- Created By: Chris Bull
-- Date: 8-03-2009
-- Purpose: This procdure loads the Function Dim for all districts from the 
--          ETL_FAR_GUIDE_CODES table.
-- ******************************************************************

    V_SID NUMBER(6,0);

BEGIN
    
    V_SID := 1;
     
    FOR ITEM IN
    (SELECT * FROM EMPOWERSTAGING.ETL_FAR_GUIDE_CODES WHERE ETL_FAR_GUIDE_CODES.TYPE = 'Function' ORDER BY ETL_FAR_GUIDE_CODES.code)
    LOOP
      INSERT INTO function_dim
        ( function_sid
          , function_major_code
          , function_major_code_desc
          , function_code
          , function_code_description) 
        VALUES 
        (v_sid
         , ITEM.MAJOR_CODE
         , ITEM.MAJOR_DESCRIPTION
         , ITEM.CODE
         , ITEM.CODE_DESCRIPTION);
      
       v_sid := v_sid + 1;
    
    END LOOP;

END;
/

prompt
prompt Creating procedure PROC_LOAD_FUND_DIM
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWER."PROC_LOAD_FUND_DIM" (v_district_id in varchar2 := null)
is
-- ******************************************************************
-- Created By: Chris Bull
-- Date: 8-03-2009
-- Purpose: This procdure loads the Fund Dim for a district from the 
--          ETL_FAR_GUIDE_CODES table.
-- ******************************************************************

    V_SID NUMBER(6,0);
    v_district_sid number(8);

BEGIN
    SELECT nvl(MAX(FUND_SID),0)+1
    INTO V_SID
    FROM FUND_DIM;
    
    SELECT DISTRICT_DIM.DISTRICT_SID
    INTO v_district_sid
    FROM DISTRICT_DIM
    WHERE DISTRICT_DIM.district_id = v_district_id;
  
    FOR fund IN
    (SELECT * FROM EMPOWERSTAGING.ETL_FAR_GUIDE_CODES WHERE ETL_FAR_GUIDE_CODES.TYPE = 'Fund' ORDER BY ETL_FAR_GUIDE_CODES.code)
    LOOP
      INSERT INTO FUND_DIM
        ( fund_sid
          , district_sid
          , fund_major_code
          , fund_major_code_description
          , fund_code
          , fund_code_description
          , fund_code_conformed_desc
          , fund_rollup_code
          , fund_rollup_code_description
          , fund_key
          , last_update_date) 
        VALUES 
        (v_sid
         , v_district_sid
         , FUND.MAJOR_CODE
         , FUND.MAJOR_DESCRIPTION
         , FUND.CODE
         , 'Unknown'
         , FUND.CODE_DESCRIPTION
         , FUND.ROLL_UP_CODE
         , FUND.ROLL_UP_DESCRIPTION
         , v_district_id||'*'||FUND.CODE
         , sysdate);
      
       v_sid := v_sid + 1;
    
    END LOOP;

END;
/

prompt
prompt Creating procedure PROC_LOAD_PROGRAM_INTENT_DIM
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWER."PROC_LOAD_PROGRAM_INTENT_DIM"
is
-- ******************************************************************
-- Created By: Chris Bull
-- Date: 8-03-2009
-- Purpose: This procdure loads the Program Intent Dim for all districts from the 
--          ETL_FAR_GUIDE_CODES table.
-- ******************************************************************

    V_SID NUMBER(6,0);

BEGIN
    V_SID := 1;
  
    FOR ITEM IN
    (SELECT * FROM EMPOWERSTAGING.ETL_FAR_GUIDE_CODES WHERE ETL_FAR_GUIDE_CODES.TYPE = 'Program Intent' ORDER BY ETL_FAR_GUIDE_CODES.code)
    LOOP
      INSERT INTO program_intent_dim
        ( program_intent_sid
          , program_intent_code
          , program_intent_description) 
        VALUES 
        (v_sid
         , ITEM.CODE
         , ITEM.CODE_DESCRIPTION);
      
       v_sid := v_sid + 1;
    
    END LOOP;

END;
/

prompt
prompt Creating package body PKG_ISS
prompt =============================
prompt
CREATE OR REPLACE PACKAGE BODY EMPOWER."PKG_ISS"  AS
/*---------------------------------------------------------------------------------------------------------- 
 *  Package: pkg_ISS   
 *   
 *  A helper function to keep track of dates student transfer dates in instances where the student transfers 
 *  and returns to his original school. 
 *   
 *  Change Log 
 *  Change Date        Changed By        Procedure/Module           Description 
 *  -----------        ----------        ----------------           --------------------------------------- 
 *  05/03/2010         S. Williamson     All                        Created                     
 *     
 *---------------------------------------------------------------------------------------------------------*/ 
 
--------------------------------------- Global Variables ------------------------------------------------- 
gv_counter                    NUMBER := 0; 
gv_load_sid                   NUMBER; 
gv_previous_load_sid          NUMBER; 
gv_proc_end_rptng_period      VARCHAR2(1); 
gv_current_year               VARCHAR2(4); 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Function: fn_Increment_Counter   
 *   
 *  A helper function to keep track of dates student transfer dates in instances where the student transfers 
 *  and returns to his original school. 
 *    
 *   Column Name                           Description 
 *   -----------------------               ---------------------------------------------------------------- 
 *    p_date_sid                           The tracked date when student Started at the transfered school. 
 *---------------------------------------------------------------------------------------------------------*/ 
FUNCTION fn_Increment_Counter(p_date_sid NUMBER) 
 
RETURN NUMBER 
IS 
v_counter NUMBER; 
BEGIN 
 
v_counter := 0; 
if p_date_sid is null then 
    v_counter := gv_counter; 
else 
    v_counter := p_date_sid;  
end if; 
 
gv_counter := v_counter; 
return v_counter; 
 
END fn_Increment_Counter; 
 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Main   
 *   
 *  Driver procedure for building the PBMS_ISS_STUDENT_FACT,  PBMS_ISS_PLACEMENT_FACT,  
 *  PBMS_ISS_DISTRICT_SUM_FACT, and the PBMS_ISS_LOCATION_SUM_FACT tables. 
 *    
 *  Column Name                          Description 
 *  -----------------------              ---------------------------------------------------------------- 
 *  p_school_year                        The school year to process. 
 *  p_excluded_districts                 The districts that will not be processed. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Main(p_school_year in varchar2 := '2012')   
 
IS 
 
v_error                        BOOLEAN := FALSE; 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
 
v_proc_name                    VARCHAR2(100); 
v_source_name                  VARCHAR2(100); 
v_proc_build_name              VARCHAR2(100); 
v_table_name                   VARCHAR2(100); 
v_schema_name                  VARCHAR2(50); 
v_required_load_flag           VARCHAR2(1); 
v_table_empty                  VARCHAR2(1); 
v_school_year                  VARCHAR2(4); 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
 
E_INVALID_SCHOOL_YEAR          EXCEPTION; 
E_TABLE_EMPTY                  EXCEPTION; 
E_PROCESSING_END               EXCEPTION; 
E_INVALID_REPORTING_PERIOD     EXCEPTION; 
 
cursor c1 is  
      SELECT  
            RANK() OVER (PARTITION BY user ORDER BY user,table_name) as table_id 
            ,user as schema_name 
            ,table_name 
      from user_tables iss_temp_tbl 
      where table_name like 'TMP_ISS_%'; 
 
BEGIN 
   
DBMS_SESSION.RESET_PACKAGE; 
v_proc_name := 'PROC_PBMS_ISS_MAIN'; 
v_school_year := p_school_year; 
v_source_name := 'PL/SQL Procedure'; 
v_start_datetime := SYSTIMESTAMP; 
 
select zeus.etl_load_seq.nextval  
into gv_load_sid 
from dual; 
 
/*--rerun 
gv_load_sid := 21; 
--end*/ 
 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' School sear).'),v_start_datetime,null,null); 
 
select distinct school_year 
into gv_current_year 
from date_dim 
where to_char(sysdate,'YYYYMMDD') = date_dim.year_month_day; 
 
if (v_school_year > gv_current_year) or (v_school_year < '2009') then 
   raise E_INVALID_SCHOOL_YEAR; 
end if; 
 
--------------------------------------- Run Initialization ----------------------------------------------- 
v_error := FALSE; 
v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_INITIALIZE'; 
proc_PBMS_ISS_Initialize(v_school_year,v_error); 
 
------------Check to see if crucial tables are loaded.  If not, throw an error------------------------ 
if v_error = FALSE then 
	for iss_temp_tbl_rec in c1 
	loop           
				  v_schema_name := iss_temp_tbl_rec.schema_name; 
				  v_table_name := iss_temp_tbl_rec.table_name; 
                                       
				  execute immediate  'select  
											case 
												when count(*) = 0 then ''Y'' 
												else ''N'' 
											end 
											,case 
												 when :x = ''TMP_ISS_YTD_PERFORMANCE'' then ''N'' 
												 else ''Y'' 
											 end as required_load_flag 
									  from '||v_schema_name||'.'||v_table_name||'' 
									  into v_table_empty, v_required_load_flag 
									  using iss_temp_tbl_rec.table_name; 
                        
				  if (v_table_empty = 'Y') and (v_required_load_flag = 'Y') then 
					 v_error := TRUE; 
					 v_error_code := null; 
					 v_error_mssg := ('PBMS ISS Table '||v_table_name||' contains no records.'); 
					 zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Warning',v_table_name,'Continued',v_error_code,substr(v_error_mssg,1,200),null,null,null,null,null ); 
				  end if; 
	end loop;  
	 
	if v_error = TRUE then 
	  raise E_TABLE_EMPTY; 
	end if;  
	------------ Get the current load_sid and the load_sid from the previous run ------------------------------- 
	BEGIN 
	      gv_previous_load_sid := null; 
		   
          select distinct  
		         s.load_sid 
		  into gv_previous_load_sid 
          from pbms_iss_district_sum_fact s 
          where s.date_sid in (select max(p.date_sid) 
							   from pbms_iss_district_sum_fact p 
                               join date_dim d  
                                 on p.date_sid = d.date_sid 
							    and d.school_year = v_school_year ); 
							   
		  EXCEPTION WHEN NO_DATA_FOUND THEN NULL; 
	END; 
	 
end if;   
   
/* 
--rerun 
gv_previous_load_sid := 21; 
gv_proc_end_rptng_period := '1'; 
--end*/ 
 
--------------- This field, gv_proc_end_rptng_period, is set in proc_PBMS_ISS_Initialize ----------------- 
if gv_proc_end_rptng_period is null then 
   raise E_INVALID_REPORTING_PERIOD; 
end if; 
 
--------------------------------------- Build the PBMS_ISS_STUDENT_FACT Table ---------------------------- 
if v_error = FALSE then 
  v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_STUDENT'; 
  proc_PBMS_ISS_Build_Student(v_school_year,v_error); 
end if; 
 
--------------------------------------- Build PBMS_ISS_PLACEMENT_FACT Table ------------------------------ 
if v_error = FALSE then 
	v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_PLACEMENT'; 
	proc_PBMS_ISS_Build_Placement(v_school_year,v_error); 
end if; 
 
--------------------------------------- Build PBMS_ISS_DISTRICT_SUM_FACT Table --------------------------- 
if v_error = FALSE then 
	v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_BUILD_DIST_SUM'; 
	proc_PBMS_ISS_Build_Dist_Sum(v_school_year,v_error); 
end if; 
 
--------------------------------------- Build PBMS_ISS_LOCATION_SUM_FACT Table --------------------------- 
if v_error = FALSE then 
	v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_BUILD_LOC_SUM'; 
	proc_PBMS_ISS_Build_Loc_Sum(v_school_year,v_error); 
end if; 
 
--------------------------------------- Build PBMS_ISS_HOUSEKEEPING Table --------------------------- 
v_proc_build_name := 'EMPOWER.PROC_PBMS_ISS_HOUSEKEEPING'; 
proc_PBMS_ISS_Housekeeping(v_school_year,v_error); 
 
if v_error = TRUE then 
  raise E_PROCESSING_END; 
end if; 
 
--------------------------------------- End Processing --------------------------------------------------- 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
--------------------------------------- Error Handling --------------------------------------------------- 
exception 
  when E_INVALID_SCHOOL_YEAR then 
              v_error_code := '-999'; 
              v_error_mssg := ('School year must be '||gv_current_year||' or '||(gv_current_year - 1)||'. It is '||v_school_year ||'.'); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Ended',v_error_code,substr(v_error_mssg,1,200),null,('Ending PBMS ISS '||v_school_year||' processing.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
  
 when E_INVALID_REPORTING_PERIOD then 
              v_error_code := '-999'; 
              v_error_mssg := ('Reporting Period must be between 1 and 6.  Instead Reporting Period = '''||gv_proc_end_rptng_period||''); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Ended',v_error_code,substr(v_error_mssg,1,200),null,('Ending PBMS ISS '||v_school_year||' processing.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
  when E_TABLE_EMPTY then 
              v_error_code := '-999'; 
              v_error_mssg := 'Critical temp table(s) have no data.';  
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR','Build ISS Temp Tables','Ended',v_error_code,substr(v_error_mssg,1,200),null,('Ending '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
  when E_PROCESSING_END then 
              v_error_mssg := ('Procedure '||v_proc_build_name||' has one or more errors.'); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Ended',null,substr(v_error_mssg,1,200),null,('Ending '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
  when others then  
              v_error_mssg := (v_proc_build_name||' errors.  '||SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Ended',SQLCODE,substr(v_error_mssg,1,200),null,('Ending '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
  
END proc_PBMS_ISS_Main; 
 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Initialize   
 *   
 *  Procedure for initializing and loading the temporary tables and variables needed to build the  
 *  PBMS_ISS_STUDENT_FACT, PBMS_ISS_PLACEMENT_FACT, PBMS_ISS_DISTRICT_SUM_FACT 
 *  and PBMS_ISS_LOCATION_SUM_FACT tables. 
 *    
 *   Column                                Description 
 *   -----------------------               ---------------------------------------------------------------- 
 *   p_school_year                         The school year to process. 
 *   p_error                               Flag indicating whether an error occurred during processing. 
 *   p_excluded_districts                  The districts that will not be processed. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Initialize(p_school_year in varchar2 := '2012', p_error in out boolean )  
IS 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_proc_name                    VARCHAR2(100); 
v_source_name                  VARCHAR2(100); 
v_object_name                  VARCHAR2(50); 
v_school_year                  VARCHAR2(4); 
v_excluded_districts           VARCHAR2(100); 
v_sql_string                   VARCHAR2(32767); 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
 
 
BEGIN 
 
p_error := FALSE;   
v_proc_name := 'PROC_PBMS_ISS_INITIALIZE'; 
v_school_year := p_school_year; 
v_source_name := 'PL/SQL Procedure'; 
v_start_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,null,null); 
 
/*---------------------------------------------------------------------------------------------* 
 * Load the Temp Tables 
 *---------------------------------------------------------------------------------------------*/ 
if v_school_year = '2009' then 
  v_excluded_districts := '074909,070915,199902,057912,057916'; 
else 
  v_excluded_districts := '057912,057916'; 
end if; 
 
-------------------------- tmp_iss_location_dim ---------------------------------------------- 
-- This table is a facsimilie of the LOCATION_DIM table.  It is required because the  
-- original LOCATION_DIM has additional/different sids when the "principle" field changes  
-- value. This proc requires 1 sid per location to work properly. 
-- 
-- Columns                 Description 
-- -------                 ------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- school_year             Begins Aug 1 of the calendar year and ends July 31 of the next  
--                         calendar year. Example: 2009 
-- district_sid            Identifies the district of the student 
-- loc_county_dist_id      County district code indicates a code for the district providing  
--                         service to the student.  Each school district in Texas is assigned  
--                         a unique COUNTY DISTRICT CODE by the Texas Education Agency (TEA) 
-- loc_sid                 Identifies the location of the student 
-- loc_id                  Indicates the school code, or business organization code 
---------------------------------------------------------------------------------------------  
v_object_name := 'TMP_ISS_LOCATION_DIM'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_location_dim purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_location_dim 
nologging 
as  
select distinct  
 
'||gv_load_sid||' as load_sid 
,district_dim.district_id as loc_county_dist_id 
,district_dim.district_sid 
,max(enrollment_fact.loc_sid) as loc_sid 
,location_dim.loc_id 
 
from  sdm.enrollment_fact 
 
join district_dim 
  on enrollment_fact.loc_county_dist_id = district_dim.district_id 
 
join sdm.location_dim 
  on enrollment_fact.loc_county_dist_id = location_dim.loc_county_dist_id 
 and enrollment_fact.loc_sid = location_dim.loc_sid 
 
where enrollment_fact.date_sid in ( select date_sid 
                                    from date_dim 
                                    where date_dim.district_sid = district_dim.district_sid 
                                      and date_dim.academic_day > 0 
                                      and date_dim.school_year = '||v_school_year||') 
  and enrollment_fact.loc_county_dist_id not in ( select district_id 
                                                  from district_dim 
                                                  where district_id in ('||v_excluded_districts||') ) 
 
group by  
district_dim.district_sid 
,district_dim.district_id 
,location_dim.loc_id ' 
; 


execute immediate v_sql_string; 
commit; 
 
v_object_name := 'bmi_iss_loc_loc_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_loc_loc_tmp 
    on tmp_iss_location_dim(loc_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_loc_locid_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_loc_locid_tmp 
    on tmp_iss_location_dim(loc_id) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_loc_distlocid_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_loc_dist_locid_tmp 
    on tmp_iss_location_dim(district_sid, loc_id) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_loc_distloc_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_loc_distloc_tmp 
    on tmp_iss_location_dim(district_sid, loc_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string; 
commit; 
 
execute immediate 'analyze table tmp_iss_location_dim estimate statistics sample 20 percent'; 
-- execute immediate 'grant select, insert, update, delete on tmp_iss_location_dim to SDM'; 
 
--------------------------- tmp_iss_date_dim --------------------------------------------------- 
-- This table contains the load dates by date_sid by reporting period.  Because, each date_sid  
-- is based on an implicit district, this makes each district date_sid diffent even for the same  
-- day.   
-- 
-- Columns                 Description 
-- -------                 --------------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- school_year             Begins Aug 1 of the calendar year and ends July 31 of the next  
--                         calendar year. Example: 2009 
-- district_sid            Identifies the district of the student 
-- loc_county_dist_id      County district code indicates a code for the district providing  
--                         service to the student.  Each school district in Texas is assigned  
--                         a unique COUNTY DISTRICT CODE by the Texas Education Agency (TEA). 
-- reporting_period        DATE_DIM.ACADEMIC_6_WEEKS  
-- enroll_beg_date_sid     Date surrogate id indicating the first day of the reporting period for 
--                         that district 
-- enroll_end_date_sid     Date surrogate id indicating the last day of the reporting period for 
--                         that district 
-- disp_beg_date_sid       Date surrogate id indicating the first day of the discipline reporting  
--                         period for that district 
-- disp_end_date_sid       Date surrogate id indicating the last day of the discipline reporting 
--                         period for that district 
-- max_reporting_period    The maximum reporting period that will be processed in this run 
------------------------------------------------------------------------------------------------ 
v_object_name := 'TMP_ISS_DATE_DIM'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_date_dim purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_date_dim 
nologging 
as 
select  
       '||gv_load_sid||' as load_sid  
      ,date_dim.school_year 
      ,date_dim.district_sid 
      ,date_dim.loc_county_dist_id 
      ,date_dim.academic_6_weeks as reporting_period 
      ,date_dim.beg_date_sid as enroll_beg_date_sid 
      ,date_dim.end_date_sid as enroll_end_date_sid 
      ,dis_6_weeks.beg_date_sid as disp_beg_date_sid 
      ,dis_6_weeks.end_date_sid as disp_end_date_sid    
      ,case 
           when to_number(date_dim.school_year) < to_number('||gv_current_year||')   
           then (select  
                        max(d.discipline_reporting_period)   
                  from  sdm.date_dim d 
                  where d.district_sid = date_dim.district_sid 
                    and d.school_year = '||v_school_year||'  
                  group by d.district_sid) 
           else (select  
		                case 
						   when to_char(sysdate,''YYYYMMDD'') > (select d.yyyymmdd   
															   from sdm.date_dim d 
															   where d.district_sid = date_dim.district_sid 
															   and d.school_year = '||v_school_year||'  
															   and d.last_day_academic_6_weeks = ''Yes''  
															   and d.academic_6_weeks = ''6'' ) 
						   then max(d.discipline_reporting_period)  
						   else to_char(to_number(max(d.discipline_reporting_period)) - 1)   
						end as discipline_reporting_period 
                  from  sdm.date_dim d 
                  where d.calendar_month = to_char(sysdate,''MM'') 
                    and d.district_sid = date_dim.district_sid 
                    and d.school_year = '||gv_current_year||'      
                  group by d.school_year) 
       end as max_reporting_period 
 
from   
( select    date_dim.school_year 
            ,date_dim.district_sid 
            ,date_dim.district_id as loc_county_dist_id 
            ,date_dim.academic_6_weeks 
            ,min(date_dim.date_sid) as beg_date_sid 
            ,max(date_dim.date_sid) as end_date_sid 
       from sdm.date_dim   
        
       join tmp_iss_location_dim 
         on date_dim.district_sid = tmp_iss_location_dim.district_sid 
          
       where date_dim.school_year = '||v_school_year||'   
         and date_dim.academic_6_weeks between ''1'' and ''6''  
         and date_dim.district_id not in ('||v_excluded_districts||')  
       group by  date_dim.school_year 
                 ,date_dim.district_sid 
                 ,date_dim.district_id 
                 ,date_dim.academic_6_weeks ) date_dim 
                  
left join ( select  
				  school_year 
				  ,district_sid 
				  ,discipline_reporting_period 
				  ,min(date_sid) as beg_date_sid 
				  ,max(date_sid) as end_date_sid 
			from sdm.date_dim 
			where school_year = '||v_school_year||' 
			group by  
			school_year 
			,district_sid 
			,discipline_reporting_period ) dis_6_weeks 
on date_dim.district_sid = dis_6_weeks.district_sid 
and date_dim.academic_6_weeks = dis_6_weeks.discipline_reporting_period 
and dis_6_weeks.discipline_reporting_period between ''1'' and ''6'' 
and date_dim.school_year = dis_6_weeks.school_year  
 
where date_dim.school_year = '||v_school_year||'   
 
group by  
      date_dim.school_year                                  
      ,date_dim.district_sid 
      ,date_dim.loc_county_dist_id 
      ,date_dim.academic_6_weeks  
      ,date_dim.beg_date_sid 
      ,date_dim.end_date_sid 
      ,dis_6_weeks.beg_date_sid  
      ,dis_6_weeks.end_date_sid  ' 
; 
execute immediate v_sql_string; 
commit; 
 
v_object_name := 'bmi_iss_date_dist_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_dist_tmp 
    on tmp_iss_date_dim(district_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' 
;  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_locdist_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_locdist_tmp 
    on tmp_iss_date_dim(loc_county_dist_id) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'tmp_iss_date_dim'; 
v_sql_string := 'create bitmap index bmi_iss_date_enrollbegdt_tmp 
    on tmp_iss_date_dim(enroll_beg_date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_enrollenddt_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_enrollenddt_tmp 
    on tmp_iss_date_dim(enroll_end_date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_dispbegdt_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_dispbegdt_tmp 
    on tmp_iss_date_dim(disp_beg_date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_dispenddt_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_dispenddt_tmp 
    on tmp_iss_date_dim(disp_end_date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'tmp_iss_date_dim'; 
v_sql_string := 'create bitmap index bmi_iss_date_rptprd_tmp 
    on tmp_iss_date_dim(reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_maxrptprd_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_maxrptprd_tmp 
    on tmp_iss_date_dim(max_reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'tmp_iss_date_dim'; 
v_sql_string := 'create bitmap index bmi_iss_date_loaddt_tmp 
    on tmp_iss_date_dim(load_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging'; 
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_date_schlyr_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_date_schlyr_tmp 
    on tmp_iss_date_dim(school_year) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
commit; 
execute immediate 'analyze table tmp_iss_date_dim estimate statistics sample 20 percent'; 
execute immediate 'grant select, insert, update, delete on tmp_iss_date_dim to SDM'; 
 
------------------ Get the current load_sid and the load_sid from the previous run ------------------------------- 
select max(max_reporting_period), max(load_sid)  
into gv_proc_end_rptng_period, gv_load_sid  
from tmp_iss_date_dim ; 
 
-------------------------- tmp_iss_student_location ---------------------------------------------- 
-- This table is a reduced version of the ENROLLMENT_FACT table with some additional fields    
-- from the DATE_DIM. It contains students who were enrolled for any specific  
-- academic 6 weeks reporting period. 
-- 
-- Columns                 Description 
-- -------                 --------------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- stu_sid                 Identifies the student 
-- date_sid                Identifies the end of the period being reported 
-- school_year             Begins Aug 1 of the calendar year and ends July 31 of the next  
--                         calendar year. Example: 2009 
-- district_sid            Identifies the district of the student 
-- loc_county_dist_id      County district code indicates a code for the district providing  
--                         service to the student.  Each school district in Texas is assigned  
--                         a unique COUNTY DISTRICT CODE by the Texas Education Agency (TEA). 
-- loc_sid                 Identifies the location of the student 
-- loc_id                  Indicates the school code, or business organization code. 
-- reporting_period        DATE_DIM.ACADEMIC_6_WEEKS  
-- sped_ind                Flag indicating whether the student was enrolled in  
--                         special ed. at any time within that reporting period 
-- enroll_beg_date_sid     Date surrogate id indicating the first day of the reporting period for 
--                         that district 
-- enroll_end_date_sid     Date surrogate id indicating the last day of the reporting period for 
--                         that district 
-- disp_beg_date_sid       Date surrogate id indicating the first day of the discipline reporting  
--                         period for that district 
-- disp_end_date_sid       Date surrogate id indicating the last day of the discipline reporting 
--                         period for that district 
-- re_entry_flag           Flag indicating whether student transfered to another 
--                         campus and returned to his original campus within the  
--                         same reporting period 
---------------------------------------------------------------------------------------------------  
v_object_name := 'TMP_ISS_STUDENT_LOCATION'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_student_location purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_student_location 
nologging 
as 
select  
      a.load_sid 
    , a.stu_sid 
    , a.date_sid 
    , a.district_sid 
    , a.loc_county_dist_id 
    , a.loc_id 
    , a.loc_sid 
    , a.reporting_period 
    , a.sped_ind 
    , a.enroll_eff_start_date_sid 
    , a.enroll_eff_end_date_sid 
    , a.disp_beg_date_sid 
    , a.disp_end_date_sid 
    , a.ada_enr_cnt 
    ,case 
          when a.ada_enr_cnt > 0 
		   and ( first_value(a.enroll_eff_end_date_sid) over (partition by a.stu_sid, a.reporting_period order by a.enroll_eff_start_date_sid ) 
               > lead(a.enroll_eff_start_date_sid) over(partition by a.stu_sid, a.reporting_period order by a.enroll_eff_start_date_sid ) ) 
          then 1 
          else 0      
     end as re_entry_flag 
 
from 
( 
    select distinct  
    tmp_iss_date_dim.load_sid 
    ,enrollment_fact.stu_sid 
    ,tmp_iss_date_dim.enroll_end_date_sid as date_sid 
    ,tmp_iss_date_dim.district_sid 
    ,tmp_iss_date_dim.loc_county_dist_id 
    ,tmp_iss_location_dim.loc_id 
    ,tmp_iss_location_dim.loc_sid 
    ,tmp_iss_date_dim.reporting_period 
	,max(case 
		 when enrollment_fact.stu_primary_ese_cd > ''00'' then 1 
		 else 0 
	 end) as sped_ind	 
    ,min(enrollment_fact.date_sid) as enroll_eff_start_date_sid 
    ,max(enrollment_fact.date_sid) as enroll_eff_end_date_sid 
    ,tmp_iss_date_dim.disp_beg_date_sid 
    ,tmp_iss_date_dim.disp_end_date_sid 
	,max(case 
			 when (enrollment_fact.ada_enr_cnt is null) or (enrollment_fact.ada_enr_cnt > 0) then 1 
			 else 0 
		  end) as ada_enr_cnt 
				 
    from  sdm.enrollment_fact 
       
    join tmp_iss_date_dim 
      on enrollment_fact.loc_county_dist_id = tmp_iss_date_dim.loc_county_dist_id 
 
    join empower.date_dim 
    on date_dim.district_sid = tmp_iss_date_dim.district_sid 
        and enrollment_fact.date_sid = date_dim.date_sid 
        and tmp_iss_date_dim.reporting_period = date_dim.academic_6_weeks 
        and date_dim.school_year = '||v_school_year||' 
         
    join sdm.location_dim 
      on enrollment_fact.loc_county_dist_id = location_dim.loc_county_dist_id 
     and enrollment_fact.loc_sid = location_dim.loc_sid 
      
    join tmp_iss_location_dim 
      on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
     and location_dim.loc_id = tmp_iss_location_dim.loc_id 
      
    where tmp_iss_date_dim.reporting_period <= '||gv_proc_end_rptng_period||' 
	  
    group by  
    tmp_iss_date_dim.load_sid 
    ,enrollment_fact.stu_sid 
    ,tmp_iss_date_dim.enroll_end_date_sid   
    ,tmp_iss_date_dim.district_sid 
    ,tmp_iss_date_dim.loc_county_dist_id 
    ,tmp_iss_location_dim.loc_id 
    ,tmp_iss_location_dim.loc_sid 
    ,tmp_iss_date_dim.reporting_period 
    ,tmp_iss_date_dim.disp_beg_date_sid 
    ,tmp_iss_date_dim.disp_end_date_sid 
 
) a  
where a.ada_enr_cnt > 0 '; 
 
execute immediate v_sql_string; 
commit; 
 
v_object_name := 'BMI_ISS_STULOC_DIST_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_stuloc_dist_tmp 
    on tmp_iss_student_location(district_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string;  
 
v_object_name := 'BMI_ISS_STULOC_DIST_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_stuloc_stu_tmp 
    on tmp_iss_student_location(stu_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging';  
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_STULOC_LOC_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_stuloc_loc_tmp 
    on tmp_iss_student_location(loc_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging' ; 
execute immediate v_sql_string;  
 
v_object_name := 'BMI_ISS_STULOC_RPTPRD_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_stuloc_rptprd_tmp 
    on tmp_iss_student_location(reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_STULOC_ADA_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_stuloc_ada_tmp 
    on tmp_iss_student_location(ada_enr_cnt) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
commit; 
execute immediate 'analyze table tmp_iss_student_location estimate statistics sample 20 percent'; 
execute immediate 'grant select, insert, update, delete on tmp_iss_student_location to SDM'; 
 
-------------------------- tmp_iss_transfer_detail ----------------------------------------------- 
-- This table is contains all students enrolled for the year with a flag to determine which  
-- students transfered to another campus and re-entered the original campus after a previous 
-- transfer. 
-- 
--   Column Name                           Description 
--   -----------------------               -------------------------------------------------------- 
--   stu_sid                               The student id 
--   district_sid                          The district id 
--   reporting_perid                       The academic 6 weeks reporting period 
--   transfer_flag                         Flag indicating whether student transfered to  
--                                         another campus within that specific reporting period: 
--                                         '1' = YES; '0' = NO 
--   re_entry_flag                         Flag indicating whether student transfered to another 
--                                         campus and returned to his original campus within the  
--                                         same reporting period 
--   sped_ind                              Flag indicating whether the student was enrolled in  
--                                         special ed. at any time within that reporting period 
---------------------------------------------------------------------------------------------------- 
v_object_name := 'TMP_ISS_TRANSFER_DETAIL'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_transfer_detail purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_transfer_detail 
nologging 
as 
select  
 
      a.load_sid 
    , a.stu_sid 
    , a.district_sid 
    , a.reporting_period 
    , case 
          when count(a.loc_id) > 1 then 1 
          else 0 
      end as transfer_flag 
    ,max(a.re_entry_flag) as re_entry_flag 
    ,max(a.sped_ind) as sped_ind 
 
from tmp_iss_student_location a 
  
group by 
a.load_sid 
, a.stu_sid 
, a.district_sid 
, a.reporting_period ' 
; 
execute immediate v_sql_string; 
commit; 
 
v_object_name := 'bmi_iss_trnsfrdet_dist_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_trnsfrdet_dist_tmp 
    on tmp_iss_transfer_detail(district_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ' ;  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_trnsfrdet_stu_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_trnsfrdet_stu_tmp 
    on tmp_iss_transfer_detail(stu_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_trnsfrdet_rptprd_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_trnsfrdet_rptprd_tmp 
    on tmp_iss_transfer_detail(reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'bmi_iss_trnsfrdet_trnflg_tmp'; 
v_sql_string := 'create bitmap index bmi_iss_trnsfrdet_trnflg_tmp 
    on tmp_iss_transfer_detail(transfer_flag) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
commit; 
execute immediate 'analyze table tmp_iss_transfer_detail estimate statistics sample 20 percent'; 
execute immediate 'grant select, insert, update, delete on tmp_iss_transfer_detail to SDM'; 
 
 
-------------------------- tmp_iss_transfer_return ---------------------------------------------- 
-- This table groups transfer students who returned to their original campus by reporting period. 
-- The grouping assigns a date (the day of the transfer) for each transfer occurrence.   
-- 
-- For example, if a student's original campus is 001 and he transfered to campus 002 and transfered 
-- back to campus 001 within the same reporting period, he would have 3 different distinct 
-- loc_start_date_sid dates (date_id identifying the transfer occurrence).   
-- 
-- This is required to get the accurate enroll_beg_date_sid and enroll_end_date_sid dates.   
-- The query uses the helper function, fn_Increment_Counter(p_date_sid) to keep track of  
-- 
-- Columns                 Description 
-- -------                 --------------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- school_year             Begins Aug 1 of the calendar year and ends July 31 of the next  
--                         calendar year. Example: 2009 
-- district_sid            Identifies the district of the student 
-- loc_county_dist_id      County district code indicates a code for the district providing  
--                         service to the student.  Each school district in Texas is assigned  
--                         a unique COUNTY DISTRICT CODE by the Texas Education Agency (TEA). 
-- loc_sid                 Identifies the location of the student 
-- loc_id                  Indicates the school code, or business organization code. 
-- reporting_period        DATE_DIM.ACADEMIC_6_WEEKS  
-- stu_sid                 Identifies the student 
-- sped_ind                Flag indicating whether the student was enrolled in  
--                         special ed. at any time within that reporting period 
-- disp_beg_date_sid       Date surrogate id indicating the first day of the discipline reporting  
--                         period for that district 
-- disp_end_date_sid       Date surrogate id indicating the last day of the discipline reporting 
--                         period for that district 
-- enroll_end_date_sid     Date surrogate id indicating the last day of the reporting period for 
--                         that district 
-- date_sid                Identifies the end of the period being reported 
-- loc_start_date_sid      Date id identifying the unique transfer occurrence for that reporting 
--                         period.  It will later be grouped as the "enroll_start_date_sid." 
-- sped_ind                Flag indicating whether the student was enrolled in  
--                         special ed. at any time within that reporting period 
------------------------------------------------------------------------------------------------------ 
v_object_name := 'TMP_ISS_TRANSFER_RETURN'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_transfer_return purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_transfer_return 
nologging 
as 
select   
       tmp_iss_date_dim.load_sid 
      ,enrollment_fact.loc_county_dist_id 
      ,tmp_iss_date_dim.district_sid 
      ,tmp_iss_location_dim.loc_sid 
      ,tmp_iss_location_dim.loc_id 
      ,tmp_iss_date_dim.reporting_period  
      ,enrollment_fact.stu_sid  
      ,tmp_iss_date_dim.disp_beg_date_sid   
      ,tmp_iss_date_dim.disp_end_date_sid   
      ,tmp_iss_date_dim.enroll_end_date_sid   
      ,enrollment_fact.date_sid 
      ,case 
          when first_value(enrollment_fact.date_sid) over (partition by enrollment_fact.stu_sid, tmp_iss_date_dim.reporting_period order by enrollment_fact.date_sid ) =  enrollment_fact.date_sid 
           then pkg_iss.fn_Increment_Counter(enrollment_fact.date_sid) 
           when lag(enrollment_fact.stu_sid||tmp_iss_date_dim.district_sid||tmp_iss_location_dim.loc_sid||tmp_iss_date_dim.reporting_period ) OVER (partition by enrollment_fact.stu_sid, tmp_iss_date_dim.reporting_period  ORDER BY enrollment_fact.date_sid )  
           = (enrollment_fact.stu_sid||tmp_iss_date_dim.district_sid||tmp_iss_location_dim.loc_sid||tmp_iss_date_dim.reporting_period) 
           then pkg_iss.fn_Increment_Counter(null) 
           else  pkg_iss.fn_Increment_Counter(enrollment_fact.date_sid) 
      end as loc_start_date_sid 
     ,to_number(enrollment_fact.stu_primary_ese_cd) as sped_ind 
 
                                                   
  from sdm.enrollment_fact 
 
  join tmp_iss_date_dim 
    on enrollment_fact.loc_county_dist_id = tmp_iss_date_dim.loc_county_dist_id 
   and tmp_iss_date_dim.reporting_period <= tmp_iss_date_dim.max_reporting_period 
 
  join empower.date_dim 
  on date_dim.district_sid = tmp_iss_date_dim.district_sid 
      and enrollment_fact.date_sid = date_dim.date_sid 
      and tmp_iss_date_dim.reporting_period = date_dim.academic_6_weeks 
      and date_dim.school_year = '||v_school_year||' 
 
  join sdm.location_dim 
    on enrollment_fact.loc_county_dist_id = location_dim.loc_county_dist_id 
   and enrollment_fact.loc_sid = location_dim.loc_sid 
 
  join tmp_iss_location_dim 
    on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
   and location_dim.loc_id = tmp_iss_location_dim.loc_id 
                                                            
  join tmp_iss_transfer_detail 
    on enrollment_fact.stu_sid = tmp_iss_transfer_detail.stu_sid 
   and tmp_iss_date_dim.district_sid = tmp_iss_transfer_detail.district_sid 
   and tmp_iss_date_dim.reporting_period = tmp_iss_transfer_detail.reporting_period 
   and tmp_iss_transfer_detail.re_entry_flag = 1  
                                           
order by enrollment_fact.date_sid '; 
execute immediate v_sql_string; 
 
commit; 
 
v_object_name := 'BMI_ISS_TRNFRRTN_DIST_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_trnfrrtn_dist_tmp 
    on tmp_iss_transfer_return(district_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_TRNFRRTN_STU_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_trnfrrtn_stu_tmp 
    on tmp_iss_transfer_return(stu_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_TRNFRRTN_RPTPRD_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_trnfrrtn_rptprd_tmp 
    on tmp_iss_transfer_return(reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
 
v_object_name := 'BMI_ISS_TRNFRRTN_LOC_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_trnfrrtn_loc_tmp 
    on tmp_iss_transfer_return(loc_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_TRNFRRTN_LOCDT_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_trnfrrtn_locdt_tmp 
    on tmp_iss_transfer_return(loc_start_date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging ';  
execute immediate v_sql_string; 
 
commit; 
execute immediate 'analyze table tmp_iss_transfer_return compute statistics'; 
execute immediate 'grant select, insert, update, delete on tmp_iss_transfer_return to SDM'; 
 
 
-------------------------- tmp_iss_student_fact ---------------------------------------------- 
-- This table contains all students enrolled by reporting period. 
-- 
-- Columns                 Description 
-- -------                 --------------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- stu_sid                 Identifies the student 
-- date_sid                Identifies the end of the period being reported 
-- district_sid            Identifies the district of the student 
-- loc_sid                 Identifies the location of the student 
-- sped_ind                Flag indicating whether the student was enrolled in  
--                         special ed. at any time within that reporting period 
-- enroll_beg_date_sid     Date surrogate id indicating the first day of the reporting period for 
--                         that district 
-- enroll_end_date_sid     Date surrogate id indicating the last day of the reporting period for 
--                         that district 
-- dis_eff_start_date_sid  Date surrogate id indicating the first day of the discipline reporting  
--                         period for that district 
-- dis_eff_end_date_sid    Date surrogate id indicating the last day of the discipline reporting 
--                         period for that district 
-- current_location_flag   Flag indicating whether the location indicated is the last campus the 
--                         student was enrolled in that reporting period. Added to handle students  
--                         that change campuses within a reporting period. Values: Yes, No 
------------------------------------------------------------------------------------------------ 
v_object_name := 'TMP_ISS_STUDENT_FACT'; 
 
BEGIN 
  v_sql_string := 'drop table tmp_iss_student_fact purge'; 
  execute immediate v_sql_string; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_student_fact 
 nologging 
 as 
 select  
 
		e.load_sid 
		,e.stu_sid 
		,e.date_sid  
		,e.district_sid  
		,e.loc_sid  
		,e.sped_ind 
		,e.enroll_eff_start_date_sid  
		,e.enroll_eff_end_date_sid  
		,case 
			when e.enroll_eff_start_date_sid = first_value(e.enroll_eff_start_date_sid) over (partition by e.stu_sid, e.date_sid order by e.enroll_eff_start_date_sid )  
			then e.disp_beg_date_sid 
			when ( e.enroll_eff_start_date_sid = max(e.enroll_eff_start_date_sid) keep ( dense_rank first order by e.date_sid ) over (partition by e.stu_sid, e.date_sid)  
			 and (lag(e.date_sid||e.stu_sid) over (partition by e.stu_sid, e.date_sid order by e.date_sid, e.stu_sid) != (e.date_sid||e.stu_sid)) ) 
			then e.disp_beg_date_sid 
			else e.enroll_eff_start_date_sid 
		end as dis_eff_start_date_sid 
		,case 
			when e.enroll_eff_end_date_sid = max(e.enroll_eff_end_date_sid) over (partition by e.stu_sid, e.date_sid order by e.stu_sid, e.date_sid ) 
			then e.disp_end_date_sid 
			when e.enroll_eff_start_date_sid = first_value(e.enroll_eff_start_date_sid) over (partition by e.stu_sid, e.date_sid order by e.enroll_eff_start_date_sid )  
			then lead(e.enroll_eff_start_date_sid) over (partition by e.stu_sid, e.reporting_period order by e.stu_sid, e.enroll_eff_start_date_sid ) - 1 
			when e.enroll_eff_end_date_sid = ( max(e.enroll_eff_end_date_sid) keep ( dense_rank first order by e.enroll_eff_end_date_sid  ) over (partition by e.stu_sid, e.date_sid)) 
			then e.disp_end_date_sid 
			else ( lead(e.enroll_eff_start_date_sid) over (partition by e.stu_sid, e.reporting_period order by e.enroll_eff_end_date_sid )) - 1 
		end as dis_eff_end_date_sid 
		, case  
			  when e.enroll_eff_end_date_sid = max(e.enroll_eff_end_date_sid) keep ( dense_rank first order by e.date_sid  ) over (partition by e.date_sid||e.stu_sid)  
			  then ''Yes''  
			  else ''No'' 
		  end as current_location_flag 
                     
from  
 
( 
	  ----------------------------- Non-transfer students ------------------------------------------------------- 
	  select   
				a.load_sid 
			  , a.stu_sid 
			  , a.date_sid 
			  , a.district_sid 
			  , a.loc_county_dist_id 
			  , a.loc_id 
			  , a.loc_sid 
			  , a.reporting_period 
			  , a.sped_ind 
			  , a.enroll_eff_start_date_sid 
			  , a.enroll_eff_end_date_sid 
			  , a.disp_beg_date_sid 
			  , a.disp_end_date_sid 
                                                     
	  from tmp_iss_student_location a 
 
	  join tmp_iss_transfer_detail t 
		on a.stu_sid = t.stu_sid 
	   and a.district_sid = t.district_sid 
	   and a.reporting_period = t.reporting_period 
	   and t.transfer_flag = 0 
	    
	  union all  
	  ------ Transfer students who transfered to a different school and never re-entered previous school -------- 
	  select   
			a.load_sid 
		  , a.stu_sid 
		  , a.date_sid 
		  , a.district_sid 
		  , a.loc_county_dist_id 
		  , a.loc_id 
		  , a.loc_sid 
		  , a.reporting_period 
		  , a.sped_ind 
		  , a.enroll_eff_start_date_sid 
		  , a.enroll_eff_end_date_sid 
		  , a.disp_beg_date_sid 
		  , a.disp_end_date_sid 
                                                     
	  from tmp_iss_student_location a 
 
	  join tmp_iss_transfer_detail t 
		on a.stu_sid = t.stu_sid 
	   and a.district_sid = t.district_sid 
	   and a.reporting_period = t.reporting_period 
	   and t.transfer_flag = 1  
	   and t.re_entry_flag = 0 
 
	  union all 
	  -------------------------- Transfer students who re-entered previous school ------------------------------- 
	  select   
 
			 b.load_sid 
			, b.stu_sid  
			, b.enroll_end_date_sid as date_sid 
			, b.district_sid 
			, b.loc_county_dist_id 
			, b.loc_id 
			, b.loc_sid 
			, b.reporting_period  
			, max(b.sped_ind) as sped_ind 
			, b.loc_start_date_sid as enroll_eff_start_date_sid 
			, max(b.date_sid) as enroll_eff_end_date_sid 
			, b.disp_beg_date_sid 
			, b.disp_end_date_sid 
                                                     
	  from  tmp_iss_transfer_return b 
 
	  group by 
	   b.load_sid 
	  , b.loc_county_dist_id 
	  , b.district_sid 
	  , b.loc_sid 
	  , b.loc_id 
	  , b.reporting_period  
	  , b.stu_sid  
	  , b.enroll_end_date_sid  
	  , b.loc_start_date_sid  
	  , b.disp_beg_date_sid 
	  , b.disp_end_date_sid     
) e ' ; 
execute immediate v_sql_string; 
 
commit; 
execute immediate 'analyze table tmp_iss_student_fact estimate statistics sample 20 percent'; 
execute immediate 'grant select, insert, update, delete on tmp_iss_student_fact to SDM'; 
 
-------------------------- tmp_iss_ytd_performance --------------------------------------------------- 
-- This table contains the running totals for the year-to-date discretionary ISS placement values.    
-- 
-- Columns                 Description 
-- -------                 --------------------------------------------------------------------------- 
-- load_sid                Run identifier 
-- date_sid                Identifies the end of the period being reported 
-- district_sid            Identifies the district of the student 
-- loc_sid                 Identifies the location of the student 
-- reporting_period        DATE_DIM.ACADEMIC_6_WEEKS  
-- ytd_sped_iss_count      Year to date count of SPED students in ISS 
-- ytd_sped_student_count  Year to date count of SPED students 
-- ytd_student_iss_count   Year to date count of all students in ISS 
-- ytd_student_count       Year to date count of all students 
------------------------------------------------------------------------------------------------------ 
v_object_name := 'TMP_ISS_YTD_PERFORMANCE'; 
 
BEGIN 
  execute immediate 'drop table tmp_iss_ytd_performance purge'; 
  EXCEPTION WHEN OTHERS THEN NULL; 
END; 
 
v_sql_string := 'create table tmp_iss_ytd_performance (  
    load_sid                number not null, 
    date_sid              	number(8,0) not null, 
    district_sid          	number(4,0) not null, 
    loc_sid               	number(6,0) not null, 
    reporting_period        varchar2(1) not null, 
    ytd_sped_iss_count    	number(5,0) null, 
    ytd_sped_student_count	number(5,0) null, 
    ytd_student_iss_count 	number(5,0) null, 
    ytd_student_count     	number(5,0) null  
    ) nologging '; 
execute immediate v_sql_string; 
commit; 
 
v_object_name := 'BMI_ISS_YTD_LOC_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_ytd_loc_tmp 
    on tmp_iss_ytd_performance(loc_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging'; 
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_YTD_DIST_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_ytd_dist_tmp 
    on tmp_iss_ytd_performance(district_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging'; 
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_YTD_RPTPRD_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_ytd_rptprd_tmp 
    on tmp_iss_ytd_performance(reporting_period) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging'; 
execute immediate v_sql_string; 
 
v_object_name := 'BMI_ISS_YTD_DATE_TMP'; 
v_sql_string := 'create bitmap index bmi_iss_ytd_date_tmp 
    on tmp_iss_ytd_performance(date_sid) 
tablespace dw_default_index pctfree 10 initrans 2 maxtrans 255  
storage( initial 65536 minextents 1 maxextents 2147483645 ) 
parallel( degree 1 ) 
nologging'; 
execute immediate v_sql_string; 
 
commit; 
execute immediate 'grant select, insert, update, delete on tmp_iss_ytd_performance to SDM'; 
 
-------------------------------- Processing has ended ----------------------------------------- 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
---------------------------------- Error Handling ---------------------------------------------- 
exception 
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Initialize; 
 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Build_Student   
 *   
 *  Procedure that builds the PBMS_ISS_STUDENT_FACT table.  It contains all students who were enrolled  
 *  grouped by reporting period for the specified school year. 
 *  
 *  Column Name                          Description 
 *  -----------------------              ---------------------------------------------------------------- 
 *  p_school_year                        The school year to process. 
 *  p_error                              Error handler return. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Build_Student(p_school_year in varchar2 := '2012', p_error in out boolean )   
IS 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_proc_name                    VARCHAR2(100); 
v_object_name                  VARCHAR2(50); 
v_school_year                  VARCHAR2(4); 
v_source_name                  VARCHAR2(100); 
v_sql_string                   VARCHAR2(32767); 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
v_row_count                    NUMBER; 
 
BEGIN 
---------------------------- Initialize Variables ---------------------------------------------------------- 
v_school_year := p_school_year; 
v_proc_name := 'PROC_PBMS_ISS_BUILD_STUDENT'; 
v_source_name := 'PL/SQL Procedure'; 
v_start_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,null,null); 
 
----------------------Load the PBMS_ISS_STUDENT_FACT ------------------------------------------------------- 
-- This table contains all students who were enrolled grouped by reporting period for the  
-- specified school year. 
------------------------------------------------------------------------------------------------------------ 
v_object_name := 'PBMS_ISS_STUDENT_FACT'; 
				 
v_sql_string := 'insert into pbms_iss_student_fact /*+append nologging all_rows */ 
select  
  load_sid 
, stu_sid 
, date_sid 
, district_sid 
, loc_sid 
, sped_ind 
, enroll_eff_start_date_sid 
, enroll_eff_end_date_sid 
, dis_eff_start_date_sid 
, dis_eff_end_date_sid 
, current_location_flag  
 
from tmp_iss_student_fact ' ; 
execute immediate v_sql_string; 
 
 
------------------------------ Processing has ended ------------------------------------------------------------ 
select count(*) 
into v_row_count 
from pbms_iss_student_fact 
where load_sid = gv_load_sid; 
 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,v_row_count,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
---------------------------------- Error Handling -------------------------------------------------------------- 
exception 
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Build_Student; 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Build_Placement  
 *   
 *  Procedure that builds the PBMS_ISS_PLACEMENT_FACT table.  It contains the discipline ISS placement  
 *  records for the year being processed.  
 * 
 *  Column Name                          Description 
 *  -----------------------              ---------------------------------------------------------------- 
 *  p_school_year                        The school year to process. 
 *  p_error                              Error handler return. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Build_Placement(p_school_year in varchar2 := '2012', p_error in out boolean )  
IS 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_proc_name                    VARCHAR2(100); 
v_object_name                  VARCHAR2(50); 
v_school_year                  VARCHAR2(4); 
v_source_name                  VARCHAR2(100); 
--v_sql_string                   VARCHAR2(32767); 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
v_row_count                    NUMBER; 
 
BEGIN 
---------------------------- Initialize Variables ---------------------------------------------------------- 
v_school_year := p_school_year; 
v_proc_name := 'PROC_PBMS_ISS_BUILD_PLACEMENT'; 
v_source_name := 'PL/SQL Procedure'; 
v_start_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,null,null); 
    
----------------------Load the PBMS_ISS_PLACEMENT_FACT ------------------------------------------ 
-- This table contains the discipline ISS placement records for the year being processed.  
------------------------------------------------------------------------------------------------- 
v_object_name := 'PBMS_ISS_PLACEMENT_FACT'; 
	 
insert into pbms_iss_placement_fact /*+APPEND NOLOGGING ALL_ROWS */ 
select  
      tmp_iss_dis_fact.load_sid 
      ,tmp_iss_dis_fact.stu_sid       
      ,tmp_iss_dis_fact.date_sid  
      ,tmp_iss_dis_fact.district_sid 
      ,tmp_iss_dis_fact.loc_sid   
      ,tmp_iss_dis_fact.event_id  
      ,case when lag((tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid),1) over (order by tmp_iss_dis_fact.incident_number, tmp_iss_dis_fact.stu_sid) != (tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid) 
              or lag((tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid),1) over (order by tmp_iss_dis_fact.incident_number, tmp_iss_dis_fact.stu_sid) is null 
            then 1 
            else 0 
       end as iss_placement_count 
      ,tmp_iss_dis_fact.event_date_sid 
      ,tmp_iss_dis_fact.action_date_sid 
      ,tmp_iss_dis_fact.incident_number  
           
from  ( select 
                tmp_iss_date_dim.load_sid                                                          
               ,tmp_iss_date_dim.district_sid 
               ,pbms_iss_student_fact.loc_sid   
               ,dis_fact.event_id   
               ,dis_fact.stu_sid 
               ,min(dis_fact.event_dt) as event_date_sid 
               ,min(dis_fact.act_dt) as action_date_sid 
               ,tmp_iss_date_dim.enroll_end_date_sid as date_sid 
               ,dis_fact.incident_number   
                                                             
        from  
        sdm.dis_fact 
                                         
        join sdm.dis_act_dim 
          on dis_fact.loc_county_dist_id = dis_act_dim.loc_county_dist_id 
         and dis_fact.act_sid = dis_act_dim.act_sid 
         and (dis_act_dim.act_id in ('06','26','P06','P26') 
               or  
               ( (dis_act_dim.loc_county_dist_id = '043901' or dis_act_dim.loc_county_dist_id = '057911') and dis_act_dim.act_id in ('ISS','ISSH'))  ) 
   
      join  tmp_iss_date_dim 
        on dis_fact.loc_county_dist_id = tmp_iss_date_dim.loc_county_dist_id 
       and dis_fact.act_dt between tmp_iss_date_dim.disp_beg_date_sid and tmp_iss_date_dim.disp_end_date_sid 
       and tmp_iss_date_dim.school_year = v_school_year 
       and tmp_iss_date_dim.reporting_period <= gv_proc_end_rptng_period 
             
      join pbms_iss_student_fact 
         on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
        and dis_fact.stu_sid = pbms_iss_student_fact.stu_sid 
        and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
        and dis_fact.act_dt between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
          
       where dis_fact.act_dt != '0' 
         and dis_fact.record_type = 'A' 
         and dis_fact.act_nbr_of_days != 0 
         and dis_fact.act_dt between (  select min(date_sid)   
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.school_year = v_school_year ) 
                                 and (  select max(date_sid)   
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.school_year = v_school_year )                  
         and dis_fact.act_dt not in (   select date_sid 
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.date_id = to_date('20991231','YYYYMMDD') ) 
										   
/*        and dis_fact.stu_sid in ( select b.stu_sid 
		                          from tmp_iss_student_location b 
								  where b.date_sid = tmp_iss_date_dim.enroll_end_date_sid 
								    and b.loc_sid = pbms_iss_student_fact.loc_sid 
									and b.stu_sid = dis_fact.stu_sid 
									and b.ada_enr_cnt > 0 ) 
*/                                                     
        group by  
        tmp_iss_date_dim.load_sid 
        ,tmp_iss_date_dim.district_sid 
        ,pbms_iss_student_fact.loc_sid   
        ,dis_fact.incident_number  
        ,dis_fact.event_id                                                           
        ,dis_fact.stu_sid 
        ,tmp_iss_date_dim.enroll_end_date_sid   
        
         ) tmp_iss_dis_fact ; 
		  
--v_sql_string := 'insert into pbms_iss_placement_fact /*+APPEND NOLOGGING ALL_ROWS */ 
/*execute immediate 'insert into pbms_iss_placement_fact \*+APPEND NOLOGGING ALL_ROWS *\ 
select  
      tmp_iss_dis_fact.load_sid 
      ,tmp_iss_dis_fact.stu_sid       
      ,tmp_iss_dis_fact.date_sid  
      ,tmp_iss_dis_fact.district_sid 
      ,tmp_iss_dis_fact.loc_sid   
      ,tmp_iss_dis_fact.event_id  
      ,case when lag((tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid),1) over (order by tmp_iss_dis_fact.incident_number, tmp_iss_dis_fact.stu_sid) != (tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid) 
              or lag((tmp_iss_dis_fact.incident_number||tmp_iss_dis_fact.stu_sid),1) over (order by tmp_iss_dis_fact.incident_number, tmp_iss_dis_fact.stu_sid) is null 
            then 1 
            else 0 
       end as iss_placement_count 
      ,tmp_iss_dis_fact.event_date_sid 
      ,tmp_iss_dis_fact.action_date_sid 
      ,tmp_iss_dis_fact.incident_number  
           
from  ( select 
                tmp_iss_date_dim.load_sid                                                          
               ,tmp_iss_date_dim.district_sid 
               ,pbms_iss_student_fact.loc_sid   
               ,dis_fact.event_id   
               ,dis_fact.stu_sid 
               ,min(dis_fact.event_dt) as event_date_sid 
               ,min(dis_fact.act_dt) as action_date_sid 
               ,tmp_iss_date_dim.enroll_end_date_sid as date_sid 
               ,dis_fact.incident_number   
                                                             
        from  
        sdm.dis_fact 
                                         
        join sdm.dis_act_dim 
          on dis_fact.loc_county_dist_id = dis_act_dim.loc_county_dist_id 
         and dis_fact.act_sid = dis_act_dim.act_sid 
         and (dis_act_dim.act_id in (''06'',''26'',''P06'',''P26'') 
               or  
               ( (dis_act_dim.loc_county_dist_id = ''043901'' or dis_act_dim.loc_county_dist_id = ''057911'') and dis_act_dim.act_id in (''ISS'',''ISSH''))  ) 
   
      join  tmp_iss_date_dim 
        on dis_fact.loc_county_dist_id = tmp_iss_date_dim.loc_county_dist_id 
       and dis_fact.act_dt between tmp_iss_date_dim.disp_beg_date_sid and tmp_iss_date_dim.disp_end_date_sid 
       and tmp_iss_date_dim.school_year = '||v_school_year||' 
       and tmp_iss_date_dim.reporting_period <= '||gv_proc_end_rptng_period||' 
             
      join pbms_iss_student_fact 
         on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
        and dis_fact.stu_sid = pbms_iss_student_fact.stu_sid 
        and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
        and dis_fact.act_dt between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
          
       where dis_fact.act_dt != ''0'' 
         and dis_fact.record_type = ''A'' 
         and dis_fact.act_nbr_of_days != 0 
         and dis_fact.act_dt between (  select min(date_sid)   
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.school_year = '||v_school_year||' ) 
                                 and (  select max(date_sid)   
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.school_year = '||v_school_year||' )                  
         and dis_fact.act_dt not in (   select date_sid 
                                        from date_dim d 
                                        where d.district_sid = tmp_iss_date_dim.district_sid 
                                          and d.date_id = to_date(''20991231'',''YYYYMMDD'') ) 
                                                     
        group by  
        tmp_iss_date_dim.load_sid 
        ,tmp_iss_date_dim.district_sid 
        ,pbms_iss_student_fact.loc_sid   
        ,dis_fact.incident_number  
        ,dis_fact.event_id                                                           
        ,dis_fact.stu_sid 
        ,tmp_iss_date_dim.enroll_end_date_sid   
        
         ) tmp_iss_dis_fact ';*/ 
		  
--execute immediate v_sql_string; 
 
------------------------ Processing has ended ---------------------------------------------------- 
select count(*) 
into v_row_count 
from pbms_iss_placement_fact 
where load_sid = gv_load_sid; 
 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,v_row_count,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
---------------------------------- Error Handling ----------------------------------------------- 
exception 
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Build_Placement; 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Build_Dist_Sum  
 *   
 *  Procedure that builds the PBMS_ISS_DISTRICT_SUM_FACT table. 
 *  
 *   Column Name                          Description 
 *   -----------------------              ---------------------------------------------------------------- 
 *   p_school_year                        The school year to process. 
 *   p_error                            z  Error handler return. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Build_Dist_Sum(p_school_year in varchar2 := '2012', p_error in out boolean )   
 
IS 
 
TYPE t_PerformLevel IS TABLE OF performance_level_dim%ROWTYPE 
      INDEX BY BINARY_INTEGER; 
PerformLevel t_PerformLevel; 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_comment                      VARCHAR2(200); 
v_string                       VARCHAR2(200); 
v_proc_name                    VARCHAR2(100); 
v_object_name                  VARCHAR2(100); 
v_source_name                  VARCHAR2(100); 
v_sql_string                   VARCHAR2(32767); 
v_school_year                  VARCHAR2(4); 
v_load_end_rptng_period        VARCHAR2(1); 
v_counter                      NUMBER; 
v_min_pl_sid                   NUMBER; 
v_max_pl_sid                   NUMBER; 
v_pl_sid_counter               NUMBER; 
v_row_count                    NUMBER; 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
 
cursor c1 is  
      SELECT district_sid, date_sid 
      FROM pbms_iss_district_sum_fact iss_dist_sum  
      where (student_count = 0) or (ytd_student_count = 0); 
 
 
BEGIN 
 
v_proc_name := 'PROC_PBMS_ISS_BUILD_DIST_SUM'; 
v_source_name := 'PL/SQL Procedure'; 
v_school_year := p_school_year; 
v_start_datetime := systimestamp; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||''),v_start_datetime,null,null); 
 
-------------------------------- Initialize Variables ---------------------------------------- 
select min(performance_level_sid), max(performance_level_sid)  
into v_min_pl_sid, v_max_pl_sid 
from performance_level_dim  
where performance_level_dim.school_year = v_school_year; 
v_pl_sid_counter := v_min_pl_sid; 
 
 
v_object_name := 'PERFORMLEVEL COLLECTION'; 
v_counter := 1; 
while v_counter <= 4  loop  
      select *  
      into performlevel(v_counter)  
      from performance_level_dim  
      where performance_level_dim.school_year = v_school_year and performance_level_dim.performance_level_sid = v_pl_sid_counter; 
      v_counter := v_counter + 1; 
      v_pl_sid_counter := v_pl_sid_counter + 1; 
end loop; 
 
---------------------------------- Load the tmp_iss_ytd_performance ----------------------------- 
-- The running year-to-date totals are calculated and loaded into TMP_ISS_YTD_PERFORMANCE. 
------------------------------------------------------------------------------------------------- 
v_load_end_rptng_period := '1'; 
execute immediate 'truncate table tmp_iss_ytd_performance';  
 
v_object_name := 'EMPOWER.TMP_ISS_YTD_PERFORMANCE'; 
while v_load_end_rptng_period <= gv_proc_end_rptng_period loop 
   
v_sql_string := 'insert into tmp_iss_ytd_performance /*+APPEND NOLOGGING ALL_ROWS */ 
          select distinct 
                 tmp_iss_date_dim.load_sid 
                ,max(tmp_iss_date_dim.enroll_end_date_sid) as date_sid 
                ,tmp_iss_date_dim.district_sid 
				,0 as loc_sid 
                ,max(tmp_iss_date_dim.reporting_period) as reporting_period   
                ,count(case 
                           when ((pbms_iss_student_fact.sped_ind = 1) and ( pbms_iss_placement_fact.iss_placement_count = 1)) 
                           then pbms_iss_placement_fact.incident_number 
                           else null  
                        end ) as YTD_SPED_ISS_COUNT 
                ,count(distinct (case 
                                     when pbms_iss_student_fact.sped_ind = 1 then pbms_iss_student_fact.stu_sid 
                                     else null 
                                 end) ) as YTD_SPED_STUDENT_COUNT 
                ,count(pbms_iss_placement_fact.iss_placement_count) as YTD_STUDENT_ISS_COUNT  
                ,count(distinct pbms_iss_student_fact.stu_sid) as YTD_STUDENT_COUNT 
                                
          from tmp_iss_date_dim 
                   
          join tmp_iss_location_dim 
            on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
             
      left   join pbms_iss_student_fact 
            on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
           and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
		   and tmp_iss_location_dim.loc_sid = pbms_iss_student_fact.loc_sid 
           and tmp_iss_date_dim.load_sid = pbms_iss_student_fact.load_sid 
 
          left join pbms_iss_placement_fact 
            on tmp_iss_date_dim.district_sid = pbms_iss_placement_fact.district_sid 
           and pbms_iss_student_fact.loc_sid = pbms_iss_placement_fact.loc_sid 
           and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_placement_fact.date_sid 
           and pbms_iss_placement_fact.iss_placement_count = 1 
           and pbms_iss_student_fact.stu_sid = pbms_iss_placement_fact.stu_sid  
           and tmp_iss_date_dim.load_sid = pbms_iss_placement_fact.load_sid 
           and pbms_iss_placement_fact.action_date_sid between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
            
		  where tmp_iss_date_dim.reporting_period between ''1'' and :load_end_rptng_period 
                                               
          group by  
           tmp_iss_date_dim.load_sid 
          ,tmp_iss_date_dim.district_sid '		   
		  ; 
		   
		  execute immediate v_sql_string using v_load_end_rptng_period; 
		  commit; 
                      
		  ---------------------------- Bump up reporting period 
		  v_load_end_rptng_period := to_char(to_number(v_load_end_rptng_period) + 1); 
 
end loop; 
 
---------------------------------- Load the PBMS_ISS_DISTRICT_SUM_FACT -------------------------- 
--  The PBMS ISS District Summary Table contains summaries of ISS and SPED ISS counts rolled up   
--  by district. 
------------------------------------------------------------------------------------------------- 
v_object_name := 'EMPOWER.PBMS_ISS_DISTRICT_SUM_FACT'; 
                       
insert into pbms_iss_district_sum_fact /*+APPEND NOLOGGING ALL_ROWS */ 
    select distinct 
           performance_level.load_sid 
          ,performance_level.date_sid 
          ,performance_level.district_sid 
          ,case  
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            <= PerformLevel(1).end_range 
               then PerformLevel(1).performance_level_sid 
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(2).begin_range and PerformLevel(2).end_range 
               then PerformLevel(2).performance_level_sid 
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(3).begin_range and PerformLevel(3).end_range 
              then PerformLevel(3).performance_level_sid 
              when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            >= PerformLevel(4).begin_range  
               then PerformLevel(4).performance_level_sid 
               else 0 
           end as performance_level_sid                
          ,performance_level.sped_iss_count 
          ,performance_level.sped_student_count 
          ,performance_level.student_iss_count 
          ,performance_level.student_count 
          ,round((case 
               when performance_level.sped_student_count > 0  
               then round((performance_level.sped_iss_count / performance_level.sped_student_count),3)  
               else 0 
           end),3) as sped_ratio 
          ,round((case 
               when performance_level.student_count > 0  
               then round((performance_level.student_iss_count / performance_level.student_count),3)  
               else 0 
           end),3) as student_ratio 
          ,round((case 
               when performance_level.sped_student_count > 0  
               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
               else 0 
            end),3) as performance_level_percent     
          ,ytd_performance_level.ytd_sped_iss_count 
          ,ytd_performance_level.ytd_sped_student_count 
          ,ytd_performance_level.ytd_student_iss_count 
          ,ytd_performance_level.ytd_student_count 
          ,round((case 
               when ytd_performance_level.ytd_sped_student_count > 0  
               then round((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count),3)  
               else 0 
           end),3) as ytd_sped_ratio 
          ,round((case 
               when ytd_performance_level.ytd_student_count > 0  
               then round((ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count),3) 
               else 0 
           end),3) as ytd_student_ratio 
           ,round((case 
               when ytd_performance_level.ytd_sped_student_count > 0  
               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
               else 0 
            end),3) as ytd_performance_level_percent  
           ,case  
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            <= PerformLevel(1).end_range  
               then PerformLevel(1).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(2).begin_range and PerformLevel(2).end_range  
               then PerformLevel(2).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(3).begin_range and PerformLevel(3).end_range 
               then PerformLevel(3).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            >= PerformLevel(4).begin_range   
               then PerformLevel(4).performance_level_sid 
               else 0 
           end as ytd_performance_level_sid     
          
    from ( 
              select distinct 
                     tmp_iss_date_dim.load_sid 
                    ,tmp_iss_date_dim.district_sid 
					,tmp_iss_date_dim.enroll_end_date_sid as date_sid 
					,tmp_iss_date_dim.reporting_period   
                    ,count(case 
                               when (pbms_iss_student_fact.sped_ind = 1)  
                               then pbms_iss_placement_fact.incident_number 
                               else null  
                            end ) as SPED_ISS_COUNT 
                    ,count(distinct (case 
                                         when pbms_iss_student_fact.sped_ind = 1 then pbms_iss_student_fact.stu_sid 
                                         else null 
                                     end) ) as SPED_STUDENT_COUNT 
                    ,count(pbms_iss_placement_fact.iss_placement_count) as STUDENT_ISS_COUNT  
                    ,count(distinct pbms_iss_student_fact.stu_sid) as STUDENT_COUNT 
                                        
			  from tmp_iss_date_dim 
   			   
			  join tmp_iss_location_dim 
				on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
                          
			  left join pbms_iss_student_fact 
				on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
			   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
			   and tmp_iss_location_dim.loc_sid = pbms_iss_student_fact.loc_sid 
			   and tmp_iss_date_dim.load_sid = pbms_iss_student_fact.load_sid 
 
			  left join pbms_iss_placement_fact 
				on tmp_iss_date_dim.district_sid = pbms_iss_placement_fact.district_sid 
			   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_placement_fact.date_sid 
			   and pbms_iss_student_fact.loc_sid = pbms_iss_placement_fact.loc_sid 
			   and pbms_iss_student_fact.stu_sid = pbms_iss_placement_fact.stu_sid  
			   and pbms_iss_placement_fact.iss_placement_count = 1 
			   and tmp_iss_date_dim.load_sid = pbms_iss_placement_fact.load_sid 
		       and pbms_iss_placement_fact.action_date_sid between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
			    
			 where tmp_iss_date_dim.reporting_period <= gv_proc_end_rptng_period 
			                      
              group by  
			   tmp_iss_date_dim.load_sid 
			  ,tmp_iss_date_dim.district_sid 
              ,tmp_iss_date_dim.enroll_end_date_sid 
              ,tmp_iss_date_dim.reporting_period  )  PERFORMANCE_LEVEL 
             
		left join tmp_iss_ytd_performance  YTD_PERFORMANCE_LEVEL 
			   on performance_level.date_sid = ytd_performance_level.date_sid 
			  and performance_level.district_sid = ytd_performance_level.district_sid 
			  and performance_level.load_sid = ytd_performance_level.load_sid 
 
; 
 
------------------------ Load records with zero student_count into the ETL_EVENT_LOG table --------------------- 
for iss_dist_sum_rec in c1 
loop 
      v_error_code := null; 
      v_string :=  ('Reporting Period End Date: '||iss_dist_sum_rec.date_sid|| 
                     '; DISTRICT_SID = '||iss_dist_sum_rec.district_sid||'; School Year: '||v_school_year);                   
      v_error_mssg := ('SDM.ENROLLMENT_FACT has zero records for '||v_string ); 
      v_comment := ('DISTRICT_SID = '||iss_dist_sum_rec.district_sid|| 
                    '; DATE_SID = '||iss_dist_sum_rec.date_sid);      
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Warning',v_source_name,'Continued',v_error_code,substr(v_error_mssg,1,200),null,v_comment,null,null,null); 
end loop;        
 
----------------------------------------- Processing has ended --------------------------------------------------- 
select count(*) 
into v_row_count 
from pbms_iss_district_sum_fact 
where load_sid = gv_load_sid; 
 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,v_row_count,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
---------------------------------------------- Error Handling ----------------------------------------------------- 
exception 
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Build_Dist_Sum; 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Build_Loc_Sum  
 *   
 *  Procedure that builds the PBMS_ISS_LOCATION_SUM_FACT table. 
 *  
 *   Column Name                          Description 
 *   -----------------------              ---------------------------------------------------------------- 
 *   p_school_year                        The school year to process. 
 *   p_error                              Error handler return. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Build_Loc_Sum(p_school_year in varchar2 := '2012', p_error in out boolean )   
 
IS 
 
TYPE t_PerformLevel IS TABLE OF performance_level_dim%ROWTYPE 
      INDEX BY BINARY_INTEGER; 
PerformLevel t_PerformLevel; 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_comment                      VARCHAR2(200); 
v_string                       VARCHAR2(200); 
v_proc_name                    VARCHAR2(100); 
v_object_name                  VARCHAR2(100); 
v_source_name                  VARCHAR2(100); 
v_sql_string                   VARCHAR2(32767); 
v_school_year                  VARCHAR2(4); 
v_load_end_rptng_period        VARCHAR2(1); 
v_counter                      NUMBER; 
v_min_pl_sid                   NUMBER; 
v_max_pl_sid                   NUMBER; 
v_pl_sid_counter               NUMBER; 
v_row_count                    NUMBER; 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
 
cursor c1 is  
      SELECT district_sid, loc_sid, date_sid  
      FROM pbms_iss_location_sum_fact iss_loc_sum  
      where (student_count = 0) or (ytd_student_count = 0); 
 
BEGIN 
 
v_proc_name := 'PROC_PBMS_ISS_BUILD_LOC_SUM'; 
v_source_name := 'PL/SQL Procedure'; 
v_school_year := p_school_year; 
v_start_datetime := systimestamp; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||''),v_start_datetime,null,null); 
 
--------- Initialize Performance Level table (load it from Performance_Level_Dim) 
select min(performance_level_sid), max(performance_level_sid)  
into v_min_pl_sid, v_max_pl_sid 
from performance_level_dim  
where performance_level_dim.school_year = v_school_year; 
v_pl_sid_counter := v_min_pl_sid; 
 
v_object_name := 'PERFORMLEVEL COLLECTION'; 
v_counter := 1; 
while v_counter <= 4  loop  
      select *  
      into performlevel(v_counter)  
      from performance_level_dim  
      where performance_level_dim.school_year = v_school_year and performance_level_dim.performance_level_sid = v_pl_sid_counter; 
      v_counter := v_counter + 1; 
      v_pl_sid_counter := v_pl_sid_counter + 1; 
end loop; 
 
---------------------------------- Load the tmp_iss_ytd_performance ----------------------------- 
-- The running year-to-date totals are calculated and loaded into TMP_ISS_YTD_PERFORMANCE. 
------------------------------------------------------------------------------------------------- 
v_load_end_rptng_period := '1'; 
execute immediate 'truncate table tmp_iss_ytd_performance'; 
 
v_object_name := 'EMPOWER.TMP_ISS_YTD_PERFORMANCE'; 
while v_load_end_rptng_period <= gv_proc_end_rptng_period loop 
v_sql_string := 'insert into tmp_iss_ytd_performance /*+APPEND NOLOGGING ALL_ROWS */ 
		  select distinct 
                 tmp_iss_date_dim.load_sid 
                ,max(tmp_iss_date_dim.enroll_end_date_sid) as date_sid 
                ,tmp_iss_date_dim.district_sid 
				,tmp_iss_location_dim.loc_sid 
                ,max(tmp_iss_date_dim.reporting_period) as reporting_period   
				,count(case 
						   when ((pbms_iss_student_fact.sped_ind = 1) and ( pbms_iss_placement_fact.iss_placement_count = 1)) 
						   then pbms_iss_placement_fact.incident_number 
						   else null  
						end ) as YTD_SPED_ISS_COUNT 
				,count(distinct (case 
									 when pbms_iss_student_fact.sped_ind = 1 then pbms_iss_student_fact.stu_sid 
									 else null 
								 end) ) as YTD_SPED_STUDENT_COUNT 
				,count(pbms_iss_placement_fact.iss_placement_count) as YTD_STUDENT_ISS_COUNT 
				,count(distinct pbms_iss_student_fact.stu_sid) as YTD_STUDENT_COUNT 
                                
		  from tmp_iss_date_dim 
                   
		  join tmp_iss_location_dim 
			on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
             
		  left join pbms_iss_student_fact 
			on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
		   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
		   and tmp_iss_location_dim.loc_sid = pbms_iss_student_fact.loc_sid 
		   and tmp_iss_date_dim.load_sid = pbms_iss_student_fact.load_sid 
 
		  left join pbms_iss_placement_fact 
			on tmp_iss_date_dim.district_sid = pbms_iss_placement_fact.district_sid 
		   and pbms_iss_student_fact.loc_sid = pbms_iss_placement_fact.loc_sid 
		   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_placement_fact.date_sid 
		   and pbms_iss_placement_fact.iss_placement_count = 1 
		   and pbms_iss_student_fact.stu_sid = pbms_iss_placement_fact.stu_sid  
		   and tmp_iss_date_dim.load_sid = pbms_iss_placement_fact.load_sid 
		   and pbms_iss_placement_fact.action_date_sid between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
 
		  where tmp_iss_date_dim.reporting_period between ''1'' and :load_end_rptng_period 
 
          group by  
           tmp_iss_date_dim.load_sid 
          ,tmp_iss_date_dim.district_sid 
		  ,tmp_iss_location_dim.loc_sid ' 
		  ; 
          execute immediate v_sql_string using v_load_end_rptng_period; 
                      
		  --------------------  Bump up to the reporting period 
		  v_load_end_rptng_period := to_char(to_number(v_load_end_rptng_period) + 1); 
 
end loop; 
 
---------------------------------- Load the PBMS_ISS_LOCATION_SUM_FACT -------------------------- 
--  The PBMS ISS District Summary Table contains summaries of ISS and SPED ISS counts rolled up   
--  by district. 
------------------------------------------------------------------------------------------------- 
v_object_name := 'PBMS_ISS_LOCATION_SUM_FACT'; 
 
insert into pbms_iss_location_sum_fact /*+APPEND NOLOGGING ALL_ROWS*/ 
    select distinct 
           performance_level.load_sid 
          ,performance_level.date_sid 
          ,performance_level.district_sid 
          ,performance_level.loc_sid 
          ,case  
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            <= PerformLevel(1).end_range 
               then PerformLevel(1).performance_level_sid 
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(2).begin_range and PerformLevel(2).end_range 
               then PerformLevel(2).performance_level_sid 
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(3).begin_range and PerformLevel(3).end_range 
               then PerformLevel(3).performance_level_sid 
               when round((case 
                               when performance_level.sped_student_count > 0  
                               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
                               else 0 
                            end),3) 
                            >= PerformLevel(4).begin_range  
               then PerformLevel(4).performance_level_sid 
               else 0 
           end as performance_level_sid                
          ,performance_level.sped_iss_count 
          ,performance_level.sped_student_count 
          ,performance_level.student_iss_count 
          ,performance_level.student_count 
          ,round((case 
               when performance_level.sped_student_count > 0  
               then round((performance_level.sped_iss_count / performance_level.sped_student_count),3)  
               else 0 
           end),3) as sped_ratio 
          ,round((case 
               when performance_level.student_count > 0  
               then round((performance_level.student_iss_count / performance_level.student_count),3)  
               else 0 
           end),3) as student_ratio 
          ,round((case 
               when performance_level.sped_student_count > 0  
               then round(((performance_level.sped_iss_count / performance_level.sped_student_count) - (performance_level.student_iss_count / performance_level.student_count)),3) 
               else 0 
            end),3) as performance_level_percent     
          ,ytd_performance_level.ytd_sped_iss_count 
          ,ytd_performance_level.ytd_sped_student_count 
          ,ytd_performance_level.ytd_student_iss_count 
          ,ytd_performance_level.ytd_student_count 
          ,round((case 
               when ytd_performance_level.ytd_sped_student_count > 0  
               then round((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count),3)  
               else 0 
           end),3) as ytd_sped_ratio 
          ,round((case 
               when ytd_performance_level.ytd_student_count > 0  
               then round((ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count),3) 
               else 0 
           end),3) as ytd_student_ratio 
           ,round((case 
               when ytd_performance_level.ytd_sped_student_count > 0  
               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
               else 0 
            end),3) as ytd_performance_level_percent  
           ,case  
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            <= PerformLevel(1).end_range  
               then PerformLevel(1).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(2).begin_range and PerformLevel(2).end_range  
               then PerformLevel(2).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            between PerformLevel(3).begin_range and PerformLevel(3).end_range 
               then PerformLevel(3).performance_level_sid 
               when round((case 
                               when ytd_performance_level.ytd_sped_student_count > 0  
                               then round(((ytd_performance_level.ytd_sped_iss_count / ytd_performance_level.ytd_sped_student_count) - (ytd_performance_level.ytd_student_iss_count / ytd_performance_level.ytd_student_count)),3) 
                               else 0 
                            end),3) 
                            >= PerformLevel(4).begin_range   
               then PerformLevel(4).performance_level_sid 
               else 0 
           end as ytd_performance_level_sid     
         
    from ( 
             select distinct 
                     tmp_iss_date_dim.load_sid 
                    ,tmp_iss_date_dim.district_sid 
					,tmp_iss_location_dim.loc_sid 
					,tmp_iss_date_dim.enroll_end_date_sid as date_sid 
					,tmp_iss_date_dim.reporting_period   
                      ,count(case 
                                 when (pbms_iss_student_fact.sped_ind = 1)  
                                 then pbms_iss_placement_fact.incident_number 
                                 else null  
                              end ) as SPED_ISS_COUNT 
                      ,count(distinct (case 
                                           when pbms_iss_student_fact.sped_ind = 1 then pbms_iss_student_fact.stu_sid 
                                           else null 
                                       end) ) as SPED_STUDENT_COUNT 
                      ,count(pbms_iss_placement_fact.iss_placement_count) as STUDENT_ISS_COUNT  
                      ,count(distinct pbms_iss_student_fact.stu_sid) as STUDENT_COUNT 
                  
			  from tmp_iss_date_dim 
			   
			  join tmp_iss_location_dim 
				on tmp_iss_date_dim.district_sid = tmp_iss_location_dim.district_sid 
                          
			  left join pbms_iss_student_fact 
				on tmp_iss_date_dim.district_sid = pbms_iss_student_fact.district_sid 
			   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_student_fact.date_sid 
			   and tmp_iss_location_dim.loc_sid = pbms_iss_student_fact.loc_sid 
			   and tmp_iss_date_dim.load_sid = pbms_iss_student_fact.load_sid 
 
			  left join pbms_iss_placement_fact 
				on tmp_iss_date_dim.district_sid = pbms_iss_placement_fact.district_sid 
			   and pbms_iss_student_fact.loc_sid = pbms_iss_placement_fact.loc_sid 
			   and tmp_iss_date_dim.enroll_end_date_sid = pbms_iss_placement_fact.date_sid 
			   and pbms_iss_placement_fact.iss_placement_count = 1 
			   and pbms_iss_student_fact.stu_sid = pbms_iss_placement_fact.stu_sid 
			   and tmp_iss_date_dim.load_sid = pbms_iss_placement_fact.load_sid  
		       and pbms_iss_placement_fact.action_date_sid between pbms_iss_student_fact.dis_eff_start_date_sid and pbms_iss_student_fact.dis_eff_end_date_sid 
			  
			 where tmp_iss_date_dim.reporting_period <= gv_proc_end_rptng_period 
 
              group by  
			   tmp_iss_date_dim.load_sid 
			  ,tmp_iss_date_dim.district_sid 
              ,tmp_iss_location_dim.loc_sid 
              ,tmp_iss_date_dim.enroll_end_date_sid 
              ,tmp_iss_date_dim.reporting_period  )  PERFORMANCE_LEVEL 
           
    left join tmp_iss_ytd_performance  YTD_PERFORMANCE_LEVEL 
           on performance_level.date_sid = ytd_performance_level.date_sid 
          and performance_level.district_sid = ytd_performance_level.district_sid 
          and performance_level.loc_sid = ytd_performance_level.loc_sid 
		  and performance_level.load_sid = ytd_performance_level.load_sid  
; 
 
------------------------  Load records with zero student_count into the ETL_EVENT_LOG table --------------------- 
for iss_loc_sum_rec in c1 
loop 
      v_string :=  ('Reporting Period End Date: '||iss_loc_sum_rec.date_sid|| 
                     '; LOC_SID = '||iss_loc_sum_rec.loc_sid||'; School Year: '||v_school_year);                   
      v_error_code := null; 
      v_error_mssg := ('SDM.ENROLLMENT_FACT has zero records for '||v_string ); 
      v_comment := ('DISTRICT_SID = '||iss_loc_sum_rec.district_sid|| 
                    ';DATE_SID = '||iss_loc_sum_rec.date_sid|| 
                    '; LOC_SID = '||iss_loc_sum_rec.loc_sid);      
      zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Warning',v_source_name,'Continued',v_error_code,substr(v_error_mssg,1,200),null,v_comment,null,null,null); 
end loop;        
 
-------------------------------- Processing has ended ----------------------------------------- 
select count(*) 
into v_row_count 
from pbms_iss_location_sum_fact 
where load_sid = gv_load_sid; 
 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,null,v_row_count,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
---------------------------------- Error Handling ---------------------------------------------- 
 
exception 
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Build_Loc_Sum; 
 
/*********************************************************************************************************** 
************************************************************************************************************ 
************************************************************************************************************/ 
 
/*---------------------------------------------------------------------------------------------------------- 
 *  Procedure: proc_PBMS_ISS_Housekeeping  
 *   
 *  This is a validation routine that checks for zero ISS totals by district and writes out the  
 *  result to the ETL_LOAD_DIM validation table. If a district's data is valid,  
 *  the ETL_LOAD_DIM.MOST_RECENT_FLAG is set to 'MOST_RECENT'; if not valid, the flag is set  
 *  to 'HISTORY'. 
 *  
 *   Column Name                          Description 
 *   -----------------------              ---------------------------------------------------------------- 
 *   p_school_year                        The school year to process. 
 *   p_error                              Error handler return. 
 *---------------------------------------------------------------------------------------------------------*/ 
PROCEDURE proc_PBMS_ISS_Housekeeping(p_school_year in varchar2 := '2012', p_error in out boolean )   
 
IS 
 
v_error_code                   VARCHAR2(50); 
v_error_mssg                   VARCHAR2(200); 
v_sql_string                   VARCHAR2(32767); 
v_proc_name                    VARCHAR2(100); 
v_object_name                  VARCHAR2(100); 
v_source_name                  VARCHAR2(100); 
v_school_year                  VARCHAR2(4); 
v_start_datetime               TIMESTAMP(6) := SYSTIMESTAMP; 
v_end_datetime                 TIMESTAMP(6) := SYSTIMESTAMP; 
v_row_count                    NUMBER; 
E_ISS_LOAD_ERROR               EXCEPTION; 
 
cursor c1 is  
      select  
             iss_dist_sum.load_sid 
            ,iss_dist_sum.district_sid 
			,substr(date_dim.date_key,1,6) as loc_county_dist_id 
            ,sum(student_count) as student_count 
            ,sum(ytd_student_count) as ytd_student_count 
      from pbms_iss_district_sum_fact iss_dist_sum, date_dim  
      where iss_dist_sum.date_sid = date_dim.date_sid 
        and date_dim.school_year = v_school_year 
        and iss_dist_sum.load_sid = gv_load_sid 
      group by  iss_dist_sum.district_sid 
               ,iss_dist_sum.load_sid 
			   ,substr(date_dim.date_key,1,6); 
BEGIN 
 
v_school_year := p_school_year; 
v_proc_name := 'PROC_PBMS_ISS_HOUSEKEEPING'; 
v_source_name := 'PL/SQL Procedure'; 
v_start_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Started',null,null,null,('Begin '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,null,null); 
 
--------------------------------------- Update the ETL_LOAD_DIM validation table ------------------------- 
v_object_name := 'ZEUS.ETL_LOAD_DIM'; 
v_error_mssg := null; 
if p_error = TRUE then 
   rollback; 
   v_error_mssg := 'Use previous load/run ISS data: LOAD_SID = '||gv_previous_load_sid||'.  ZEUS.ETL_LOAD_DIM not written to because one or more ISS procedure(s) has errors.'; 
   raise E_ISS_LOAD_ERROR; 
else 
    if gv_previous_load_sid is not null then 
		delete from pbms_iss_student_fact where load_sid = gv_previous_load_sid; 
		delete from pbms_iss_placement_fact where load_sid = gv_previous_load_sid; 
		delete from pbms_iss_district_sum_fact where load_sid = gv_previous_load_sid; 
		delete from pbms_iss_location_sum_fact where load_sid = gv_previous_load_sid; 
	end if; 
	for iss_dist_sum_rec in c1 
	loop 
		  if ( iss_dist_sum_rec.student_count = 0) or (iss_dist_sum_rec.ytd_student_count = 0) then   
			 zeus.pkg_utilities.proc_ETL_LOAD_DIM(iss_dist_sum_rec.load_sid, gv_previous_load_sid, iss_dist_sum_rec.district_sid,'ISS',iss_dist_sum_rec.loc_county_dist_id,v_start_datetime, v_start_datetime,'NOT_VALID','MOST_RECENT'); 
		  else 
			 zeus.pkg_utilities.proc_ETL_LOAD_DIM(iss_dist_sum_rec.load_sid, gv_previous_load_sid, iss_dist_sum_rec.district_sid,'ISS',iss_dist_sum_rec.loc_county_dist_id,v_start_datetime, v_start_datetime,'VALID','MOST_RECENT'); 
		  end if; 
	end loop;  
	commit; 
end if;  
 
----------------------------------- Analyze Statistics --------------------------------------------------- 
v_sql_string := 'analyze table pbms_iss_student_fact estimate statistics sample 20 percent'; 
execute immediate v_sql_string; 
dbms_output.put_line(v_sql_string); 
 
v_sql_string := 'analyze table pbms_iss_placement_fact estimate statistics sample 20 percent'; 
execute immediate v_sql_string; 
dbms_output.put_line(v_sql_string); 
 
v_sql_string := 'analyze table pbms_iss_district_sum_fact estimate statistics sample 20 percent'; 
execute immediate v_sql_string; 
dbms_output.put_line(v_sql_string); 
 
v_sql_string := 'analyze table pbms_iss_location_sum_fact estimate statistics sample 20 percent'; 
execute immediate v_sql_string; 
dbms_output.put_line(v_sql_string); 
 
--------------------------------------- End Processing --------------------------------------------------- 
select count(*) 
into v_row_count 
from zeus.etl_load_dim 
where load_sid = gv_load_sid; 
 
v_end_datetime := SYSTIMESTAMP; 
zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Succeeded',null,v_error_mssg,v_row_count,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime)); 
 
--------------------------------------- Error Handling --------------------------------------------------- 
exception 
  when E_ISS_LOAD_ERROR then 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Warning',v_source_name,'Ended',null,v_error_mssg,0,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
   
  when others then  
              p_error := TRUE; 
              v_error_code := SQLCODE; 
              v_error_mssg := (SQLERRM || ';' || dbms_utility.format_error_backtrace); 
			  v_end_datetime := SYSTIMESTAMP; 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'ERROR',v_source_name,'Failed',v_error_code,substr(v_error_mssg,1,200),null,('Error occurred when building object '||('EMPOWER.'||v_object_name) ||'.'),null,null,null); 
              zeus.pkg_utilities.proc_ETL_LOG_EVENT(v_proc_name,'Informational',v_source_name,'Ended',null,null,null,('End '||v_proc_name||' Procedure ('||v_school_year||' school year); LOAD_SID = '||gv_load_sid||'.'),v_start_datetime,v_end_datetime,zeus.pkg_utilities.fn_GET_ELAPSED_TIME(v_start_datetime, v_end_datetime) ); 
 
END proc_PBMS_ISS_Housekeeping; 
 
END pkg_ISS;
/


spool off
