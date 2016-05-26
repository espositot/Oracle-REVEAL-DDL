-----------------------------------------------------------
-- Export file for user EMPOWERSTAGING@DATAWH            --
-- Created by espositot on 5/26/2016, 15:39:03 15:39:03  --
-----------------------------------------------------------

set define off
spool empower_staging_ddl.log

prompt
prompt Creating table ETL_ACCOUNT_FISCAL_YEAR_DIM
prompt ==========================================
prompt
create table EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM
(
  account_fiscal_year_sid  NUMBER(2),
  account_fiscal_year_code VARCHAR2(1),
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
comment on column EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM.account_fiscal_year_code
  is 'The financial fiscal year of the account.
Values:
0-9';
comment on column EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM.account_fiscal_year_desc
  is 'The fiscal year in century format.
Example:
2009';
alter table EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM
  add constraint PK_ETL_ACCOUNT_FISCAL_YEAR_DIM primary key (ACCOUNT_FISCAL_YEAR_DESC)
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
alter index EMPOWERSTAGING.PK_ETL_ACCOUNT_FISCAL_YEAR_DIM nologging;

prompt
prompt Creating table ETL_DISTRICT
prompt ===========================
prompt
create table EMPOWERSTAGING.ETL_DISTRICT
(
  district_sid       NUMBER(4),
  district_id        VARCHAR2(6) not null,
  district_name      VARCHAR2(20),
  esc_region         VARCHAR2(2),
  square_miles       NUMBER(5,2),
  fiscal_start_month NUMBER(1),
  logo_url           VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWERSTAGING.ETL_DISTRICT
  add constraint PK_ETL_DISTRICT primary key (DISTRICT_ID)
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
alter index EMPOWERSTAGING.PK_ETL_DISTRICT nologging;

prompt
prompt Creating table ETL_BUDGET_TRANS_TYPE_DIM
prompt ========================================
prompt
create table EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM
(
  budget_transaction_type_key   VARCHAR2(30) not null,
  district_id                   VARCHAR2(6),
  budget_transaction_type_sid   NUMBER(3),
  local_budget_transaction_type VARCHAR2(15) not null,
  budget_transaction_type       VARCHAR2(15)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM.budget_transaction_type
  is 'Values:
Original Budget
Budget Revision';
alter table EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM
  add constraint PK_ETL_BUDGET_TRANS_TYPE_DIM primary key (BUDGET_TRANSACTION_TYPE_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_BUDGET_TRANS_TYPE_DIM nologging;
alter table EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM
  add constraint AK_BUDGET_TRANS_BUS_K_ETL_BUDG unique (DISTRICT_ID, LOCAL_BUDGET_TRANSACTION_TYPE)
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
alter index EMPOWERSTAGING.AK_BUDGET_TRANS_BUS_K_ETL_BUDG nologging;
alter table EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM
  add constraint FK_ETL_BUDG_TRAN_TYPE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_DATE_DIM
prompt ===========================
prompt
create table EMPOWERSTAGING.ETL_DATE_DIM
(
  date_key                    VARCHAR2(15) not null,
  district_id                 VARCHAR2(6),
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
  school_year                 VARCHAR2(4),
  school_year_description     VARCHAR2(9),
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
comment on column EMPOWERSTAGING.ETL_DATE_DIM.date_id
  is 'A specific day of the year';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_year
  is 'Example: 2009';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_year_quarter
  is 'Example: 2009 Q1';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_quarter
  is 'Example: 1';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_year_month
  is 'Example: 200912';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_month
  is 'Example: 12';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_month_name
  is 'Example: December';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_month_short_name
  is 'Example: Dec';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.calendar_week
  is 'Example: 50';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.day_of_week
  is 'Example: 5 (Thursday)';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.day_of_week_name
  is 'Example: Thursday';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.day_of_week_short_name
  is 'Example: Thu';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.school_year
  is 'Begins Aug 1 of the calendar year and ends July 31 of the next calendar year.
Example: 2009';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.school_year_description
  is 'Example: 2009/2010';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.school_week
  is 'Example: 24';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.year_month_day
  is 'Example: 20091215';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.short_date
  is 'Example: 12/15/2009';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.long_date
  is 'Example: December 15, 2009';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.fiscal_year
  is 'Example: 2010';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.fiscal_year_quarter
  is 'Example: 2010 Q2';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.fiscal_quarter
  is 'Example: 2';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.fiscal_period
  is 'Example: 05';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.school_day_indicator
  is 'Denotes what type of school day this particular day represents.
Values:
Instructional
Professional
Non-Academic';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.academic_week
  is 'The week number of the instructional school year';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.academic_6_weeks
  is 'Example: 3';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.academic_9_weeks
  is 'Example: 2';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.semester
  is 'Example: 1';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.snapshot_date_indicator
  is 'For the last friday of the month of October, Set to ''Y'' else ''N''';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.academic_day
  is 'The count of the instructional days for the associated shool year.

IMPORTANT: This must be resequenced for snow/make up days';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.first_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.last_day_academic_6_weeks
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.first_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.last_day_academic_9_weeks
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.first_day_semester
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.last_day_semester
  is 'Values: Yes/No';
comment on column EMPOWERSTAGING.ETL_DATE_DIM.discipline_reporting_period
  is 'Used for capturing all discipline incidents into reporting periods roughly associated to the academic 6 weeks.
The first period runs from August 1 of the School_Year to the end of the first academic_6_weeks.
The second period runs from the day after the end of the of the first academic_6_weeks to the end of the second academic_6_weeks and so on.
The last 6 weeks ends on July 31.';
create index EMPOWERSTAGING.IX_DATE_DIM_DIST_DATE_ID on EMPOWERSTAGING.ETL_DATE_DIM (DISTRICT_ID, DATE_ID)
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
alter table EMPOWERSTAGING.ETL_DATE_DIM
  add constraint PK_ETL_DATE_DIM primary key (DATE_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_DATE_DIM nologging;
alter table EMPOWERSTAGING.ETL_DATE_DIM
  add constraint FK_ETL_DATE_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_FUNCTION_DIM
prompt ===============================
prompt
create table EMPOWERSTAGING.ETL_FUNCTION_DIM
(
  function_sid              NUMBER(4),
  function_major_code       VARCHAR2(2),
  function_major_code_desc  VARCHAR2(100),
  function_code             VARCHAR2(2) not null,
  function_code_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWERSTAGING.ETL_FUNCTION_DIM
  add constraint PK_ETL_FUNCTION_DIM primary key (FUNCTION_CODE)
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
alter index EMPOWERSTAGING.PK_ETL_FUNCTION_DIM nologging;

prompt
prompt Creating table ETL_FUND_DIM
prompt ===========================
prompt
create table EMPOWERSTAGING.ETL_FUND_DIM
(
  fund_key              VARCHAR2(10) not null,
  district_id           VARCHAR2(6),
  fund_code             VARCHAR2(3) not null,
  fund_code_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_FUND_DIM.fund_code_description
  is 'The districts local description';
alter table EMPOWERSTAGING.ETL_FUND_DIM
  add constraint PK_ETL_FUND_DIM primary key (FUND_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_FUND_DIM nologging;
alter table EMPOWERSTAGING.ETL_FUND_DIM
  add constraint AK_FUND_BUS_KEY_ETL_FUND unique (DISTRICT_ID, FUND_CODE)
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
alter index EMPOWERSTAGING.AK_FUND_BUS_KEY_ETL_FUND nologging;
alter table EMPOWERSTAGING.ETL_FUND_DIM
  add constraint FK_ETL_FUND_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_LOCAL_OPTION_CODE_DIM
prompt ========================================
prompt
create table EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM
(
  local_option_code_key         VARCHAR2(10) not null,
  district_id                   VARCHAR2(6) not null,
  local_option_code             VARCHAR2(3) not null,
  local_option_code_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM.local_option_code_key
  is '057922*123';
alter table EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM
  add constraint PK_ETL_LOCAL_OPTION_CODE_DIM primary key (LOCAL_OPTION_CODE_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_LOCAL_OPTION_CODE_DIM nologging;
alter table EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM
  add constraint AK_LOCAL_OPTION_BUS_K_ETL_LOCA unique (DISTRICT_ID, LOCAL_OPTION_CODE)
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
alter index EMPOWERSTAGING.AK_LOCAL_OPTION_BUS_K_ETL_LOCA nologging;
alter table EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM
  add constraint FK_ETL_LOCAL_OPT_REF_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_OBJECT_DIM
prompt =============================
prompt
create table EMPOWERSTAGING.ETL_OBJECT_DIM
(
  object_key                     VARCHAR2(15) not null,
  district_id                    VARCHAR2(6),
  object_code                    VARCHAR2(4) not null,
  object_code_description        VARCHAR2(100),
  object_code_conformed_desc     VARCHAR2(100),
  sub_object_code                VARCHAR2(2),
  sub_object_code_description    VARCHAR2(100),
  object_class_code              VARCHAR2(4),
  object_class_code_description  VARCHAR2(100),
  object_major_code              VARCHAR2(4),
  object_major_code_description  VARCHAR2(100),
  object_detail_code             VARCHAR2(4),
  object_detail_code_description VARCHAR2(100),
  object_rollup_code             VARCHAR2(5),
  object_rollup_code_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_OBJECT_DIM.object_key
  is '057922*6114*01';
comment on column EMPOWERSTAGING.ETL_OBJECT_DIM.object_code_description
  is 'District local description';
alter table EMPOWERSTAGING.ETL_OBJECT_DIM
  add constraint PK_ETL_OBJECT_DIM primary key (OBJECT_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_OBJECT_DIM nologging;
alter table EMPOWERSTAGING.ETL_OBJECT_DIM
  add constraint AK_OBJECT_BUS_KEY_ETL_OBJE unique (DISTRICT_ID, OBJECT_CODE, SUB_OBJECT_CODE)
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
alter index EMPOWERSTAGING.AK_OBJECT_BUS_KEY_ETL_OBJE nologging;
alter table EMPOWERSTAGING.ETL_OBJECT_DIM
  add constraint FK_ETL_OBJE_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_ORGANIZATION_DIM
prompt ===================================
prompt
create table EMPOWERSTAGING.ETL_ORGANIZATION_DIM
(
  organization_key            VARCHAR2(15) not null,
  district_id                 VARCHAR2(6),
  organization_code           VARCHAR2(3) not null,
  organization_name           VARCHAR2(50),
  organization_admin_type     VARCHAR2(20),
  organization_local_type     VARCHAR2(20),
  organization_conformed_type VARCHAR2(20),
  organization_rollup_code    VARCHAR2(4),
  organization_rollup_desc    VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_ORGANIZATION_DIM.organization_admin_type
  is 'Describes the kind of oranization.
Values:
High School
Middle School
Elementary School
Finance';
alter table EMPOWERSTAGING.ETL_ORGANIZATION_DIM
  add constraint PK_ETL_ORGANIZATION_DIM primary key (ORGANIZATION_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_ORGANIZATION_DIM nologging;
alter table EMPOWERSTAGING.ETL_ORGANIZATION_DIM
  add constraint AK_ORG_BUS_KEY_ETL_ORGA unique (DISTRICT_ID, ORGANIZATION_CODE)
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
alter index EMPOWERSTAGING.AK_ORG_BUS_KEY_ETL_ORGA nologging;
alter table EMPOWERSTAGING.ETL_ORGANIZATION_DIM
  add constraint FK_ETL_ORGA_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_PROGRAM_INTENT_DIM
prompt =====================================
prompt
create table EMPOWERSTAGING.ETL_PROGRAM_INTENT_DIM
(
  program_intent_sid         NUMBER(4),
  program_intent_code        VARCHAR2(2) not null,
  program_intent_description VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWERSTAGING.ETL_PROGRAM_INTENT_DIM
  add constraint PK_ETL_PROGRAM_INTENT_DIM primary key (PROGRAM_INTENT_CODE)
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
alter index EMPOWERSTAGING.PK_ETL_PROGRAM_INTENT_DIM nologging;

prompt
prompt Creating table ETL_BUDGET_FACT
prompt ==============================
prompt
create table EMPOWERSTAGING.ETL_BUDGET_FACT
(
  district_id                 VARCHAR2(6) not null,
  transaction_date_key        VARCHAR2(15) not null,
  budget_transaction_id       VARCHAR2(25) not null,
  post_date_key               VARCHAR2(15),
  fund_key                    VARCHAR2(10),
  function_code               VARCHAR2(2),
  object_key                  VARCHAR2(15),
  organization_key            VARCHAR2(15),
  account_fiscal_year_desc    VARCHAR2(4),
  program_intent_code         VARCHAR2(2),
  local_option_code_key       VARCHAR2(10),
  budget_transaction_type_key VARCHAR2(30),
  account_string              VARCHAR2(28),
  budget_amount               NUMBER(12,2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_BUDGET_FACT.account_fiscal_year_desc
  is 'The fiscal year in century format.
Example:
2009';
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint PK_ETL_BUDGET_FACT primary key (DISTRICT_ID, TRANSACTION_DATE_KEY, BUDGET_TRANSACTION_ID)
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
alter index EMPOWERSTAGING.PK_ETL_BUDGET_FACT nologging;
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDGET_F_REF_LOCAL_OPT foreign key (LOCAL_OPTION_CODE_KEY)
  references EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM (LOCAL_OPTION_CODE_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_ACCO foreign key (ACCOUNT_FISCAL_YEAR_DESC)
  references EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM (ACCOUNT_FISCAL_YEAR_DESC);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_BUDG foreign key (BUDGET_TRANSACTION_TYPE_KEY)
  references EMPOWERSTAGING.ETL_BUDGET_TRANS_TYPE_DIM (BUDGET_TRANSACTION_TYPE_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_FUNC foreign key (FUNCTION_CODE)
  references EMPOWERSTAGING.ETL_FUNCTION_DIM (FUNCTION_CODE);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_FUND foreign key (FUND_KEY)
  references EMPOWERSTAGING.ETL_FUND_DIM (FUND_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_OBJE foreign key (OBJECT_KEY)
  references EMPOWERSTAGING.ETL_OBJECT_DIM (OBJECT_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_ORGA foreign key (ORGANIZATION_KEY)
  references EMPOWERSTAGING.ETL_ORGANIZATION_DIM (ORGANIZATION_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REFERENCE_ETL_PROG foreign key (PROGRAM_INTENT_CODE)
  references EMPOWERSTAGING.ETL_PROGRAM_INTENT_DIM (PROGRAM_INTENT_CODE);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REF_POST_ETL_DATE foreign key (POST_DATE_KEY)
  references EMPOWERSTAGING.ETL_DATE_DIM (DATE_KEY);
alter table EMPOWERSTAGING.ETL_BUDGET_FACT
  add constraint FK_ETL_BUDG_REF_TRAN_ETL_DATE foreign key (TRANSACTION_DATE_KEY)
  references EMPOWERSTAGING.ETL_DATE_DIM (DATE_KEY);

prompt
prompt Creating table ETL_CONFORMED_TYPE
prompt =================================
prompt
create table EMPOWERSTAGING.ETL_CONFORMED_TYPE
(
  conformed_type      VARCHAR2(25) not null,
  local_value         VARCHAR2(100) not null,
  conformed_value     VARCHAR2(200),
  conformed_value_1   VARCHAR2(200),
  conformed_value_2   VARCHAR2(200),
  conformed_value_3   VARCHAR2(200),
  conformed_value_map VARCHAR2(200)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_CONFORMED_TYPE.conformed_type
  is 'Ex: ''ABSENCE TYPE'', ''GRADE TYPE'', ''COURSE''';
comment on column EMPOWERSTAGING.ETL_CONFORMED_TYPE.conformed_value_map
  is 'This column identifies the mapping of the conformed value columns.
Example:
"0-Type; 1-Department; 2-Subject; 3-Description"

Where 
0 = conformed_value
1 = conformed_value_1
2 = conformed_value_2
3 = conformed_value_3';
alter table EMPOWERSTAGING.ETL_CONFORMED_TYPE
  add constraint PK_ETL_CONFORMED_TYPE primary key (CONFORMED_TYPE, LOCAL_VALUE)
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
alter index EMPOWERSTAGING.PK_ETL_CONFORMED_TYPE nologging;

prompt
prompt Creating table ETL_DISTRICT_CALENDAR
prompt ====================================
prompt
create table EMPOWERSTAGING.ETL_DISTRICT_CALENDAR
(
  district_sid         NUMBER(6),
  district_id          VARCHAR2(6),
  school_date          VARCHAR2(10),
  school_day_indicator VARCHAR2(13),
  academic_week        VARCHAR2(2),
  academic_6_weeks     VARCHAR2(1),
  academic_9_weeks     VARCHAR2(1),
  semester             VARCHAR2(1)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ETL_EVENT_LOG
prompt ============================
prompt
create table EMPOWERSTAGING.ETL_EVENT_LOG
(
  job_name            VARCHAR2(100) not null,
  event_time          TIMESTAMP(6) default SYSDATE not null,
  event_type          VARCHAR2(50),
  source_name         VARCHAR2(50),
  status              VARCHAR2(50),
  error_code          VARCHAR2(50),
  error_message       VARCHAR2(500),
  user_id             VARCHAR2(50),
  terminal_id         VARCHAR2(50),
  rows_affected_count NUMBER(10),
  comments            VARCHAR2(500),
  start_time          TIMESTAMP(6),
  end_time            TIMESTAMP(6),
  elapsed_time        TIMESTAMP(6)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_EVENT_LOG.event_time
  is 'Defaults to SYSDATE';
comment on column EMPOWERSTAGING.ETL_EVENT_LOG.event_type
  is 'Values: Warning, Informational, Error';
comment on column EMPOWERSTAGING.ETL_EVENT_LOG.source_name
  is 'Values: Cognos, PL/SQL, Perl, SQL*Loader, Other';
comment on column EMPOWERSTAGING.ETL_EVENT_LOG.status
  is 'Values: Started, Running, Failed, Succeeded';
comment on column EMPOWERSTAGING.ETL_EVENT_LOG.elapsed_time
  is 'In seconds';
create index EMPOWERSTAGING.BMI_EVENT_LOG_EVENT_TYPE on EMPOWERSTAGING.ETL_EVENT_LOG (EVENT_TYPE)
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
create index EMPOWERSTAGING.BMI_EVENT_LOG_STATUS on EMPOWERSTAGING.ETL_EVENT_LOG (STATUS)
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
alter table EMPOWERSTAGING.ETL_EVENT_LOG
  add constraint PK_ETL_EVENT_LOG primary key (JOB_NAME, EVENT_TIME)
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
alter index EMPOWERSTAGING.PK_ETL_EVENT_LOG nologging;

prompt
prompt Creating table ETL_FAR_GUIDE_CODES
prompt ==================================
prompt
create table EMPOWERSTAGING.ETL_FAR_GUIDE_CODES
(
  type                           VARCHAR2(14) not null,
  code                           VARCHAR2(4) not null,
  code_description               VARCHAR2(100),
  class_code                     VARCHAR2(4),
  class_description              VARCHAR2(100),
  major_code                     VARCHAR2(4),
  major_description              VARCHAR2(100),
  object_detail_code             VARCHAR2(4),
  object_detail_code_description VARCHAR2(100),
  roll_up_code                   VARCHAR2(5),
  roll_up_description            VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on table EMPOWERSTAGING.ETL_FAR_GUIDE_CODES
  is 'This table is used to look up the descriptions and rollups for Funds, Functions, Objects, & Program Intent codes.
Basic logic is:



select (where applicable)
CODE DESCRIPTION
CLASS CODE
CLASS DESCRIPTION
MAJOR CODE
MAJOR DESCRIPTION
OBJECT DETAIL CODE	
OBJECT DETAIL CODE 	
ROLL UP CODE
ROLL UP DESCRIPTION
USE LOCAL DESCRIPTION FLAG
where CODE = SourceCode
and TYPE = ''FUND'' or whichever type is being processed

If USE LOCAL DESCRIPTION FLAG = ''N'' Then CODE DESCRIPTION
ElseIF USE LOCAL DESCRIPTION FLAG = ''Y''Then SourceDescription
       Else CODE DESCRIPTION
';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.type
  is 'Identifies what kind of account codes the detail code represents.
Values:
FUND
FUNCTION
OBJECT
PROGRAM INTENT';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.code
  is 'The detail account code used in the account string.
Example:
101 
6112';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.code_description
  is 'The description of the detail account code.
Example:
Head Start
National School Breakfast and Lunch Program';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.class_code
  is 'The object class code for the detail code.  Only applies to Objects.
Example:
1000
2000
3000
';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.class_description
  is 'The full description of the object class code.  Only applies to Object.
Example:
LIABILITIES
REVENUE CONTROL ACCOUNTS';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.major_code
  is 'The major grouping code for a set of detail codes.
Example:
1200
1300
2500';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.major_description
  is 'The full description of the Major code.
Example:
Receivables
Inventories';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.roll_up_code
  is 'Identifies the code used to sum up a group of locally defined codes.
Example:
199R  for codes 161-199
For non rollup codes CODE=ROLL_UP_CODE (no "R" on the end)

Business Rule: 
If the detail code is not locally defined then roll up code = detail code';
comment on column EMPOWERSTAGING.ETL_FAR_GUIDE_CODES.roll_up_description
  is 'Describes the roll up code.
Example:
Locally defined Classifications
Permenant Funds - Locally defined';
alter table EMPOWERSTAGING.ETL_FAR_GUIDE_CODES
  add constraint PK_ETL_FAR_GUIDE_CODES primary key (TYPE, CODE)
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
alter index EMPOWERSTAGING.PK_ETL_FAR_GUIDE_CODES nologging;

prompt
prompt Creating table ETL_ORGANIZATION_ROLLUP
prompt ======================================
prompt
create table EMPOWERSTAGING.ETL_ORGANIZATION_ROLLUP
(
  organization_code        VARCHAR2(3) not null,
  organization_rollup_code VARCHAR2(4),
  organization_rollup_desc VARCHAR2(100)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on table EMPOWERSTAGING.ETL_ORGANIZATION_ROLLUP
  is 'This is a look up table that identifies org codes that have rollup codes and descriptions associated to them.';
alter table EMPOWERSTAGING.ETL_ORGANIZATION_ROLLUP
  add constraint PK_ETL_ORGANIZATION_ROLLUP primary key (ORGANIZATION_CODE)
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
alter index EMPOWERSTAGING.PK_ETL_ORGANIZATION_ROLLUP nologging;

prompt
prompt Creating table ETL_PEIMS_ETHNICITY_CODES
prompt ========================================
prompt
create table EMPOWERSTAGING.ETL_PEIMS_ETHNICITY_CODES
(
  code        VARCHAR2(1),
  description VARCHAR2(35)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
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
prompt Creating table ETL_TEA_CDC
prompt ==========================
prompt
create table EMPOWERSTAGING.ETL_TEA_CDC
(
  district_id  VARCHAR2(6) not null,
  school_id    CHAR(3) not null,
  campusid     CHAR(9),
  type         VARCHAR2(25) not null,
  campusname   VARCHAR2(65),
  status       VARCHAR2(20),
  regionname   VARCHAR2(15),
  districtid   CHAR(6),
  countyname   VARCHAR2(25),
  districtname VARCHAR2(50),
  grades       VARCHAR2(10),
  regionid     CHAR(2),
  school_year  VARCHAR2(4)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table EMPOWERSTAGING.ETL_TEA_CDC
  add constraint PK_ETL_TEA_CDC primary key (DISTRICT_ID, SCHOOL_ID)
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
alter index EMPOWERSTAGING.PK_ETL_TEA_CDC nologging;

prompt
prompt Creating table ETL_TRANSACTION_TYPE_DIM
prompt =======================================
prompt
create table EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM
(
  transaction_type_key   VARCHAR2(30) not null,
  district_id            VARCHAR2(6),
  transaction_type_sid   NUMBER(2),
  local_transaction_type VARCHAR2(10) not null,
  transaction_type       VARCHAR2(10)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM.transaction_type
  is 'Indicates the type of transaction being reported.
Values:
Expense
Revenue';
alter table EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM
  add constraint PK_ETL_TRANSACTION_TYPE_DIM primary key (TRANSACTION_TYPE_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_TRANSACTION_TYPE_DIM nologging;
alter table EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM
  add constraint AK_TRANSACTION_TYPE_B_ETL_TRAN unique (DISTRICT_ID, LOCAL_TRANSACTION_TYPE)
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
alter index EMPOWERSTAGING.AK_TRANSACTION_TYPE_B_ETL_TRAN nologging;
alter table EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM
  add constraint FK_ETL_TRANSACT_TYP_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);

prompt
prompt Creating table ETL_TRANSACTION_FACT
prompt ===================================
prompt
create table EMPOWERSTAGING.ETL_TRANSACTION_FACT
(
  district_id              VARCHAR2(6) not null,
  transaction_date_key     VARCHAR2(15) not null,
  transaction_id           VARCHAR2(25) not null,
  post_date_key            VARCHAR2(15),
  transaction_type_key     VARCHAR2(30),
  fund_key                 VARCHAR2(10),
  function_code            VARCHAR2(2),
  object_key               VARCHAR2(15),
  organization_key         VARCHAR2(15),
  account_fiscal_year_desc VARCHAR2(4),
  program_intent_code      VARCHAR2(2),
  local_option_code_key    VARCHAR2(10),
  account_string           VARCHAR2(28),
  transaction_amount       NUMBER(13,2)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  is 'The account to which transactions are applied.
Example:
396-11-6321-00-001-9-11-S-X1';
comment on column EMPOWERSTAGING.ETL_TRANSACTION_FACT.post_date_key
  is 'A specific day of the year';
comment on column EMPOWERSTAGING.ETL_TRANSACTION_FACT.account_fiscal_year_desc
  is 'The fiscal year in century format.
Example:
2009';
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint PK_ETL_TRANSACTION_FACT primary key (DISTRICT_ID, TRANSACTION_ID, TRANSACTION_DATE_KEY)
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
alter index EMPOWERSTAGING.PK_ETL_TRANSACTION_FACT nologging;
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_ACCO foreign key (ACCOUNT_FISCAL_YEAR_DESC)
  references EMPOWERSTAGING.ETL_ACCOUNT_FISCAL_YEAR_DIM (ACCOUNT_FISCAL_YEAR_DESC);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_DIST foreign key (DISTRICT_ID)
  references EMPOWERSTAGING.ETL_DISTRICT (DISTRICT_ID);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_FUNC foreign key (FUNCTION_CODE)
  references EMPOWERSTAGING.ETL_FUNCTION_DIM (FUNCTION_CODE);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_FUND foreign key (FUND_KEY)
  references EMPOWERSTAGING.ETL_FUND_DIM (FUND_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_OBJE foreign key (OBJECT_KEY)
  references EMPOWERSTAGING.ETL_OBJECT_DIM (OBJECT_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_ORGA foreign key (ORGANIZATION_KEY)
  references EMPOWERSTAGING.ETL_ORGANIZATION_DIM (ORGANIZATION_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_PROG foreign key (PROGRAM_INTENT_CODE)
  references EMPOWERSTAGING.ETL_PROGRAM_INTENT_DIM (PROGRAM_INTENT_CODE);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REFERENCE_ETL_TRAN foreign key (TRANSACTION_TYPE_KEY)
  references EMPOWERSTAGING.ETL_TRANSACTION_TYPE_DIM (TRANSACTION_TYPE_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REF_POST_ETL_DATE foreign key (POST_DATE_KEY)
  references EMPOWERSTAGING.ETL_DATE_DIM (DATE_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_ETL_TRAN_REF_TRAN_ETL_DATE foreign key (TRANSACTION_DATE_KEY)
  references EMPOWERSTAGING.ETL_DATE_DIM (DATE_KEY);
alter table EMPOWERSTAGING.ETL_TRANSACTION_FACT
  add constraint FK_TRANSACT_REF_ETL_LOCAL_OPT foreign key (LOCAL_OPTION_CODE_KEY)
  references EMPOWERSTAGING.ETL_LOCAL_OPTION_CODE_DIM (LOCAL_OPTION_CODE_KEY);

prompt
prompt Creating table TEMP_DATE_DIM
prompt ============================
prompt
create table EMPOWERSTAGING.TEMP_DATE_DIM
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
prompt Creating package PKG_ISS
prompt ========================
prompt
CREATE OR REPLACE PACKAGE EMPOWERSTAGING."PKG_ISS"
AS

/*PROCEDURE proc_PBMS_ISS_Main(p_school_year in varchar2 := '2009');
PROCEDURE proc_PBMS_ISS_Initialize(p_school_year in varchar2 := '2009', p_error in out number);
PROCEDURE proc_PBMS_ISS_Build_Students(p_school_year in varchar2 := '2009', p_error in out number);
PROCEDURE proc_PBMS_ISS_Build_Placements(p_school_year in varchar2 := '2009', p_error in out number);*/

--PROCEDURE proc_PBMS_ISS_Build_Loc_Sum(p_school_year in varchar2 := '2009', p_error in out number);
--PROCEDURE proc_PBMS_ISS_Build_Dist_Sum(p_school_year in varchar2 := '2009', p_error in out number);
--PROCEDURE proc_PBMS_ISS_Housekeeping(p_school_year in varchar2 := '2009', p_error in out number);

FUNCTION increment_counter(p_date_sid number) RETURN NUMBER;
PROCEDURE proc_Test;

END ;
/

prompt
prompt Creating function FN_CONVERT_ACCOUNT_FISCAL_YEAR
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."FN_CONVERT_ACCOUNT_FISCAL_YEAR" (v_acct_FY in varchar2, v_district_id in varchar2)
RETURN varchar2
AS
    v_current_fiscal_year varchar2(4);
    v_account_fiscal_year varchar2(4);

BEGIN
-- ******************************************************************************************
-- Created by: Chris Bull
-- Date: 8/11/2009
-- Purpose: This function converts the single digit fiscal year found on the account string
--          to a 4 digit year based on the current fiscal year of the district.
--
--          Assumption: the account fiscal year will be either 7 years prior or 2 years into
--          the future.
-- Inputs: v_acct_fy - the single digit fiscal year from the account string
--         v_district_sid - the sid of the district for which this operation is being performed.
-- Output: the 4 digit year, i.e. 2010, that corresponds to the fiscal year of the account.
-- ********************************************************************************************

-- Pull the current fiscal year from the etl_date_dim
    select fiscal_year 
    into v_current_fiscal_year 
    from etl_date_dim 
    where district_id = v_district_id 
    and date_id = trunc(sysdate);

-- Translate the fiscal year based on its relative position to the current fiscal year
    case v_acct_FY
        when substr(v_current_fiscal_year,4,1) then v_account_fiscal_year := v_current_fiscal_year;
        when substr(to_char(to_number(v_current_fiscal_year)-1),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-1);
        when substr(to_char(to_number(v_current_fiscal_year)-2),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-2);
        when substr(to_char(to_number(v_current_fiscal_year)+1),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)+1);
        when substr(to_char(to_number(v_current_fiscal_year)+2),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)+2);
        when substr(to_char(to_number(v_current_fiscal_year)-3),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-3);
        when substr(to_char(to_number(v_current_fiscal_year)-4),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-4);
        when substr(to_char(to_number(v_current_fiscal_year)-5),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-5);
        when substr(to_char(to_number(v_current_fiscal_year)-6),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-6);
        when substr(to_char(to_number(v_current_fiscal_year)-7),4,1) then v_account_fiscal_year := to_char(to_number(v_current_fiscal_year)-7);
        else v_account_fiscal_year := 'unkn';
    end case;

	RETURN v_account_fiscal_year;
END;
/

prompt
prompt Creating function FN_FISCAL_PERIOD
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."FN_FISCAL_PERIOD" (v_date in date, v_district_sid number) RETURN VARCHAR2 AS

v_fiscal_period varchar2(2);

BEGIN
-- ******************************************************************************************
-- Created by: Pat Carlson
-- Date: 8/11/2009
-- Purpose: This function returns the fiscal period based on the district and month
--          of the supplied date.
--
-- Inputs: v_date - the current date being processed
--         v_district_sid - the sid of the district for which this operation is being performed.
-- Output: the 2 digit fiscal period
-- ********************************************************************************************
select case fiscal_start_month
        when 7 then
              case to_char(v_date,'MM')
                    when '07' then '01'
                    when '08' then '02'
                    when '09' then '03'
                    when '10' then '04'
                    when '11' then '05'
                    when '12' then '06'
                    when '01' then '07'
                    when '02' then '08'
                    when '03' then '09'
                    when '04' then '10'
                    when '05' then '11'
                    when '06' then '12'
                    else ''
              end
        when 9 then
              case to_char(v_date,'MM')
                    when '09' then '01'
                    when '10' then '02'
                    when '11' then '03'
                    when '12' then '04'
                    when '01' then '05'
                    when '02' then '06'
                    when '03' then '07'
                    when '04' then '08'
                    when '05' then '09'
                    when '06' then '10'
                    when '07' then '11'
                    when '08' then '12'
                    else ''
              end
        else ''
        end
        into v_fiscal_period from etl_district where district_sid = v_district_sid;
  RETURN v_fiscal_period;
END FN_FISCAL_PERIOD;
/

prompt
prompt Creating function FN_FISCAL_QUARTER
prompt ===================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."FN_FISCAL_QUARTER" (v_date in date, v_district_sid in number)
RETURN varchar2
AS
	v_quarter varchar2(2);
    v_fiscal_start date;
    
BEGIN
-- ******************************************************************************************
-- Created by: Pat Carlson
-- Date: 8/11/2009
-- Purpose: This function returns the fiscal quarter based on the district and month
--          of the supplied date.
--
-- Inputs: v_date - the date for which the fiscal quarter needs to be determined
--         v_district_sid - the sid of the district for which this operation is being performed.
-- Output: number of the quarter that corresponds to the fiscal year of the district.
-- ********************************************************************************************
    select 
        case when v_date < to_date(to_char(fiscal_start_month)||'/01/'||to_char(v_date,'YYYY'),'MM/DD/YYYY')
            then to_date(to_char(fiscal_start_month)||'/01/'||to_char(to_number(to_char(v_date,'YYYY'))-1),'MM/DD/YYYY')
            else to_date(to_char(fiscal_start_month)||'/01/'||to_char(v_date,'YYYY'),'MM/DD/YYYY')
        end
    into v_fiscal_start from etl_district where district_sid = v_district_sid;

    select 
        case when ceil(abs(months_between(v_date,v_fiscal_start))) = abs(months_between(v_date,v_fiscal_start))
            then ceil(abs((months_between(v_date,v_fiscal_start))+1)/3)
            else ceil(abs(months_between(v_date,v_fiscal_start))/3)
        end as fiscal_quarter
    into v_quarter from dual;

	RETURN v_quarter;
END;
/

prompt
prompt Creating function FN_FISCAL_YEAR
prompt ================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."FN_FISCAL_YEAR" (v_date in date, v_district_sid in number)
RETURN varchar2
AS
    v_year varchar2(4);
    v_fiscal_start_month number(2,0);

BEGIN
-- ******************************************************************************************
-- Created by: Pat Carlson
-- Date: 8/11/2009
-- Purpose: This function returns the fiscal year based on the district and
--          the supplied date.
--
-- Inputs: v_date - the date for which the fiscal year needs to be determined
--         v_district_sid - the sid of the district for which this operation is being performed.
-- Output: 4 digit year that corresponds to the fiscal year of the district.
-- ********************************************************************************************
  select fiscal_start_month into v_fiscal_start_month from etl_district where district_sid = v_district_sid;

	select case v_fiscal_start_month
                        when 7 then 
                             case when v_date < to_date('7/1/'|| to_char(v_date,'YYYY'),'MM/DD/YYYY')
                                      and v_date >=  to_date('1/1/'|| to_char(v_date,'YYYY'),'MM/DD/YYYY')
                                then to_char(v_date, 'YYYY')
                                else to_char(to_number(to_char(v_date,'YYYY')) + 1)
                             end
                         when 9 then
                            case when v_date < to_date('9/1/'|| to_char(v_date,'YYYY'),'MM/DD/YYYY')
                                      and v_date >=  to_date('1/1/'|| to_char(v_date,'YYYY'),'MM/DD/YYYY')
                                then to_char(v_date, 'YYYY')
                                else to_char(to_number(to_char(v_date,'YYYY')) + 1)
                            end
                         else ''
                     end into v_year from dual;
	RETURN v_year;
END;
/

prompt
prompt Creating function FN_SCHOOL_WEEK
prompt ================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."FN_SCHOOL_WEEK" (v_date in date) RETURN VARCHAR2 AS

v_school_start_date date;
v_school_week varchar2(2);
v_calc_date date;

BEGIN
-- ******************************************************************************************
-- Created by: Pat Carlson
-- Date: 8/11/2009
-- Purpose: This function returns the school week based 
--          the supplied date.
-- Assumption: school week is computed from 8/1/20xx to 7/31/20xx
-- Inputs: v_date - the date for which the school week needs to be determined
-- Output: 2 digit school week that corresponds to the provided date.
-- ********************************************************************************************
  select to_date( '8/1/'||  case when to_number(to_char(v_date,'mm')) < 8 
          then to_number(to_char(v_date,'YYYY')) -1
          else to_number(to_char(v_date,'YYYY')) end,'MM/DD/YYYY') into v_school_start_date from dual;
          
  select next_day(v_school_start_date,'SUNDAY') - 7 into v_calc_date from dual;
          
  select substr('0'||to_char(ceil((v_date - v_calc_date)/7)),-2,2)  into v_school_week from dual;
       
  RETURN v_school_week;
END FN_SCHOOL_WEEK;
/

prompt
prompt Creating function INCREMENT_COUNTER
prompt ===================================
prompt
CREATE OR REPLACE FUNCTION EMPOWERSTAGING."INCREMENT_COUNTER" (p_val number, p_counter number )

return number
is

v_counter number;

begin
v_counter := p_counter;
if p_val is null then
 v_counter := p_counter + 1;
else
 v_counter := p_val;
end if;
  
  return v_counter;

end increment_counter;
/

prompt
prompt Creating procedure PROC_LOAD_FUNCTION_DIM
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWERSTAGING."PROC_LOAD_FUNCTION_DIM"
is
-- ******************************************************************
-- Created By: Chris Bull
-- Date: 8-03-2009
-- Purpose: This procdure loads the Function Dim for all districts from the 
--          ETL_FAR_GUIDE_CODES table.
-- ******************************************************************

    V_SID NUMBER(6,0);

BEGIN
    SELECT nvl(MAX(FUNCTION_SID),0)+1
    INTO V_SID
    FROM ETL_FUNCTION_DIM;
  
    FOR ITEM IN
    (SELECT * FROM ETL_FAR_GUIDE_CODES WHERE ETL_FAR_GUIDE_CODES.TYPE = 'Function' ORDER BY ETL_FAR_GUIDE_CODES.code)
    LOOP
      INSERT INTO etl_function_dim
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
prompt Creating procedure PROC_LOAD_PROGRAM_INTENT_DIM
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE EMPOWERSTAGING."PROC_LOAD_PROGRAM_INTENT_DIM"
is
-- ******************************************************************
-- Created By: Chris Bull
-- Date: 8-03-2009
-- Purpose: This procdure loads the Program Intent Dim for all districts from the 
--          ETL_FAR_GUIDE_CODES table.
-- ******************************************************************

    V_SID NUMBER(6,0);

BEGIN
    SELECT nvl(MAX(PROGRAM_INTENT_SID),0)+1
    INTO V_SID
    FROM empowerstaging.ETL_Program_Intent_dim;
  
    FOR ITEM IN
    (SELECT * FROM ETL_FAR_GUIDE_CODES WHERE ETL_FAR_GUIDE_CODES.TYPE = 'Program Intent' ORDER BY ETL_FAR_GUIDE_CODES.code)
    LOOP
      INSERT INTO empowerstaging.ETL_program_intent_dim
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
CREATE OR REPLACE PACKAGE BODY EMPOWERSTAGING."PKG_ISS" AS

gv_counter number := 0;
gv_tracker number := 0;

function increment_counter(p_date_sid number)

return number
is
v_counter number;
begin

v_counter := 0;

/*dbms_output.put_line('-------------------------');
dbms_output.put_line('before p_date_sid: '||p_date_sid);
dbms_output.put_line('before v_counter: '||v_counter);
dbms_output.put_line('before gv_counter: '||gv_counter);
dbms_output.put_line(' ');
*/
if p_date_sid is null then
    v_counter := gv_counter;
else
    v_counter := p_date_sid; 
end if;

gv_counter := v_counter;

/*
dbms_output.put_line(' ');
dbms_output.put_line('after p_date_sid: '||p_date_sid);
dbms_output.put_line('after v_counter: '||v_counter);
dbms_output.put_line('after gv_counter: '||gv_counter);
dbms_output.put_line(' ');
*/
return v_counter;

end increment_counter;



-------------------
PROCEDURE proc_Test
IS

begin
  -- Test statements here
gv_counter := 0;
gv_tracker := 0;

--execute immediate 'drop table empowerstaging.tmp_iss_transfer purge';
execute immediate 'create table empowerstaging.tmp_iss_transfer
as
select distinct 

tmp_iss_date_dim.load_sid
,case
 
     when first_value(enrollment_fact.date_sid) over (order by enrollment_fact.date_sid ) =  enrollment_fact.date_sid
     then  pkg_iss.increment_counter(enrollment_fact.date_sid)
     when lag(district_dim.district_sid||tmp_iss_location_dim.loc_sid||tmp_iss_date_dim.reporting_period ) OVER ( ORDER BY tmp_iss_date_dim.reporting_period, enrollment_fact.date_sid ) 
     = (district_dim.district_sid||tmp_iss_location_dim.loc_sid||tmp_iss_date_dim.reporting_period)
     then pkg_iss.increment_counter(null)
     else pkg_iss.increment_counter(enrollment_fact.date_sid)
end as loc_number
,tmp_iss_location_dim.loc_sid
,enrollment_fact.date_sid

  ,enrollment_fact.loc_county_dist_id
  ,district_dim.district_sid

  ,tmp_iss_location_dim.loc_id
  ,tmp_iss_date_dim.reporting_period 
  ,enrollment_fact.stu_sid 
  ,tmp_iss_date_dim.enroll_end_date_sid 

from sdm.enrollment_fact

join empower.district_dim
  on enrollment_fact.loc_county_dist_id = district_dim.district_id

join sdm.location_dim
  on enrollment_fact.loc_county_dist_id = location_dim.loc_county_dist_id
 and enrollment_fact.loc_sid = location_dim.loc_sid

join empowerstaging.tmp_iss_location_dim
  on district_dim.district_sid = tmp_iss_location_dim.district_sid
 and location_dim.loc_id = tmp_iss_location_dim.loc_id

join empowerstaging.tmp_iss_date_dim
  on district_dim.district_sid = tmp_iss_date_dim.district_sid
 and tmp_iss_date_dim.reporting_period <= tmp_iss_date_dim.max_reporting_period
 and enrollment_fact.date_sid between tmp_iss_date_dim.enroll_beg_date_sid and tmp_iss_date_dim.enroll_end_date_sid

where enrollment_fact.stu_sid = 126689
and tmp_iss_date_dim.reporting_period = ''3''

order by enrollment_fact.date_sid '
;

commit; 

end proc_Test;

/*----------------------------------------------------------------------------------------------------------
 *  Procedure: proc_PBMS_ISS_Main  
 *  
 *  Driver procedure for building the PBMS_ISS_PERFORMANCE_FACT and the PBMS_ISS_PERFORMANCE_SUM_FACT.
 *   
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_school_year                        The school year to process.
 *---------------------------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------------------------
 *  Procedure: proc_PBMS_ISS_Initialize  
 *  
 *  Procedure for initializing the temporary tables needed to build the PBMS_ISS_PERFORMANCE_FACT
 *  and the PBMS_ISS_PERFORMANCE_SUM_FACT.
 *   
 *   Column                                Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_school_year                        The school year to process.
 *    p_error                              Flag indicating whether an error occurred during processing.
 *---------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------
 *  Procedure: proc_PBMS_ISS_Build_Detail 
 *  
 *  Driver procedure for building the PBMS_ISS_PERFORMANCE_FACT and the PBMS_ISS_PERFORMANCE_SUM_FACT.
 *   
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_school_year                        The school year to process.
 *---------------------------------------------------------------------------------------------------------*/

END pkg_ISS;
/

prompt
prompt Creating trigger TRG_CREATE_FUND_KEY
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER EMPOWERSTAGING."TRG_CREATE_FUND_KEY"
BEFORE INSERT ON empowerstaging.etl_fund_dim
FOR EACH ROW 
BEGIN
:new.fund_key := :new.district_id||'*'||:new.fund_code;
END;
/

prompt
prompt Creating trigger TRG_CREATE_LOC_OPT_CD_KEY
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER EMPOWERSTAGING."TRG_CREATE_LOC_OPT_CD_KEY"
BEFORE INSERT ON empowerstaging.etl_local_option_code_dim
FOR EACH ROW
BEGIN
:new.local_option_code_key := :new.district_id||'*'||:new.local_option_code;
END;
/

prompt
prompt Creating trigger TRG_CREATE_OBJECT_KEY
prompt ======================================
prompt
CREATE OR REPLACE TRIGGER EMPOWERSTAGING."TRG_CREATE_OBJECT_KEY"
BEFORE INSERT ON empowerstaging.etl_object_dim
FOR EACH ROW
BEGIN
:new.object_key := :new.district_id||'*'||:new.object_code||'*'||:new.sub_object_code;
END;
/

prompt
prompt Creating trigger TRG_CREATE_ORGANIZATION_KEY
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER EMPOWERSTAGING."TRG_CREATE_ORGANIZATION_KEY"
BEFORE INSERT ON empowerstaging.etl_organization_dim
FOR EACH ROW 
BEGIN
:new.organization_key := :new.district_id||'*'||:new.organization_code;
END;
/


spool off
