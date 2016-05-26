-----------------------------------------------------------
-- Export file for user ZEUS@DATAWH                      --
-- Created by espositot on 5/26/2016, 17:11:03 17:11:03  --
-----------------------------------------------------------

set define off
spool zeus_ddl.log

prompt
prompt Creating table ETL_EVENT_LOG
prompt ============================
prompt
create table ZEUS.ETL_EVENT_LOG
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
comment on column ZEUS.ETL_EVENT_LOG.event_time
  is 'Defaults to SYSDATE';
comment on column ZEUS.ETL_EVENT_LOG.event_type
  is 'Values: Warning, Informational, Error';
comment on column ZEUS.ETL_EVENT_LOG.source_name
  is 'Values: Cognos, PL/SQL, Perl, SQL*Loader, Other';
comment on column ZEUS.ETL_EVENT_LOG.status
  is 'Values: Started, Running, Failed, Succeeded';
comment on column ZEUS.ETL_EVENT_LOG.elapsed_time
  is 'In seconds';
create index ZEUS.BMI_EVENT_LOG_EVENT_TYPE on ZEUS.ETL_EVENT_LOG (EVENT_TYPE)
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
create index ZEUS.BMI_EVENT_LOG_STATUS on ZEUS.ETL_EVENT_LOG (STATUS)
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
alter table ZEUS.ETL_EVENT_LOG
  add primary key (JOB_NAME, EVENT_TIME)
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
alter index ZEUS.SYS_C00521655 nologging;

prompt
prompt Creating table ETL_LOAD_DIM
prompt ===========================
prompt
create table ZEUS.ETL_LOAD_DIM
(
  load_sid            NUMBER not null,
  district_sid        NUMBER not null,
  load_type           VARCHAR2(50),
  loc_county_dist_id  VARCHAR2(6),
  load_datetime       TIMESTAMP(6),
  validation_datetime TIMESTAMP(6),
  data_valid_flag     VARCHAR2(20),
  most_recent_flag    VARCHAR2(20)
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 80K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
comment on column ZEUS.ETL_LOAD_DIM.load_sid
  is 'A unique identifier for every load constructed from a sequence';
comment on column ZEUS.ETL_LOAD_DIM.district_sid
  is 'The disrict surrogate id';
comment on column ZEUS.ETL_LOAD_DIM.load_type
  is 'Ex. Enrollment, Absence, ISS, etc.';
comment on column ZEUS.ETL_LOAD_DIM.loc_county_dist_id
  is 'The state issued district id';
comment on column ZEUS.ETL_LOAD_DIM.load_datetime
  is 'The date the district data was loaded';
comment on column ZEUS.ETL_LOAD_DIM.validation_datetime
  is 'The date for which the data was validated';
comment on column ZEUS.ETL_LOAD_DIM.data_valid_flag
  is 'Values: VALID, INVALID';
comment on column ZEUS.ETL_LOAD_DIM.most_recent_flag
  is 'Values: MOST_RECENT, HISTORY';
create bitmap index ZEUS.BMI_ETL_LOAD_DISTRICT on ZEUS.ETL_LOAD_DIM (DISTRICT_SID)
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
create bitmap index ZEUS.BMI_ETL_LOAD_LOAD_DTTME on ZEUS.ETL_LOAD_DIM (LOAD_DATETIME)
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
create bitmap index ZEUS.BMI_ETL_LOAD_LOC_CNTY_DIST on ZEUS.ETL_LOAD_DIM (LOC_COUNTY_DIST_ID)
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
create bitmap index ZEUS.BMI_ETL_LOAD_MOST_RECENT on ZEUS.ETL_LOAD_DIM (MOST_RECENT_FLAG)
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
create bitmap index ZEUS.BMI_ETL_LOAD_VALID on ZEUS.ETL_LOAD_DIM (DATA_VALID_FLAG)
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
create bitmap index ZEUS.BMI_ETL_LOAD_VAL_DTTME on ZEUS.ETL_LOAD_DIM (VALIDATION_DATETIME)
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
alter table ZEUS.ETL_LOAD_DIM
  add primary key (LOAD_SID, DISTRICT_SID)
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
alter index ZEUS.SYS_C0015363 nologging;

prompt
prompt Creating table ETL_LOAD_VALIDATION
prompt ==================================
prompt
create table ZEUS.ETL_LOAD_VALIDATION
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
  )
nologging;
comment on column ZEUS.ETL_LOAD_VALIDATION.load_validation_type
  is 'Ex. Enrollment, Absence';
comment on column ZEUS.ETL_LOAD_VALIDATION.validation_date_sid
  is 'The date for which the data was validated';
comment on column ZEUS.ETL_LOAD_VALIDATION.load_date_sid
  is 'The date the district data was loaded';
comment on column ZEUS.ETL_LOAD_VALIDATION.data_valid_flag
  is 'Values: Yes, No';
comment on column ZEUS.ETL_LOAD_VALIDATION.most_recent_flag
  is 'Values: Yes, No';
create bitmap index ZEUS.BMI_ETL_LOAD_VAL_MOST_REC on ZEUS.ETL_LOAD_VALIDATION (MOST_RECENT_FLAG)
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
create unique index ZEUS.PK_ETL_LOAD_VALIDATION on ZEUS.ETL_LOAD_VALIDATION (VALIDATION_DATE_SID, LOAD_VALIDATION_TYPE)
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
  );
alter table ZEUS.ETL_LOAD_VALIDATION
  add primary key (LOAD_VALIDATION_TYPE, VALIDATION_DATE_SID)
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
alter index ZEUS.SYS_C0015462 nologging;

prompt
prompt Creating sequence ETL_LOAD_SEQ
prompt ==============================
prompt
create sequence ZEUS.ETL_LOAD_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 83
increment by 1
nocache
order;

prompt
prompt Creating package PKG_EMPOWER_POST_PROCESSING
prompt ============================================
prompt
create or replace package zeus.pkg_empower_post_processing is

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
prompt Creating package PKG_UTILITIES
prompt ==============================
prompt
CREATE OR REPLACE PACKAGE ZEUS."PKG_UTILITIES"

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

PROCEDURE proc_ETL_LOAD_DIM(
p_load_sid                NUMBER
,p_district_sid           NUMBER
,p_load_type              VARCHAR2
,p_loc_county_dist_id     VARCHAR2
,p_load_datetime          TIMESTAMP
,p_validation_datetime    TIMESTAMP
,p_data_valid_flag        VARCHAR2
,p_most_recent_flag       VARCHAR2
);

PROCEDURE proc_ETL_LOAD_DIM(
p_load_sid                NUMBER
,p_update_load_sid        NUMBER
,p_district_sid           NUMBER
,p_load_type              VARCHAR2
,p_loc_county_dist_id     VARCHAR2
,p_load_datetime          TIMESTAMP
,p_validation_datetime    TIMESTAMP
,p_data_valid_flag        VARCHAR2
,p_most_recent_flag       VARCHAR2
);

END pkg_UTILITIES;
/

prompt
prompt Creating package body PKG_UTILITIES
prompt ===================================
prompt
CREATE OR REPLACE PACKAGE BODY ZEUS."PKG_UTILITIES"
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
insert into zeus.etl_event_log
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

/***********************************************************************************************************
************************************************************************************************************
************************************************************************************************************/

/*----------------------------------------------------------------------------------------------------------
 *   PROCEDURE: proc_ETL_LOAD_DIM 
 *  
 *   Procedure for loading load validation information into the ETL_LOAD_DIM table if you know that 
 *   the previous load_sid is consecutive in time to the current but are unaware of its actual value.
 *   IMPORTANT NOTE:  DO NOT USE this procedure if previous load/run was for previous year data or 
 *   for any run that is considered separate from the ongoing current runs.
 *   
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_load_sid                           A unique identifier for every load constructed from a sequence
 *    p_district_sid                       The district id
 *    p_load_type                          The functional name of the process/application.  E.g. Enrollment, 
 *                                         Absence, ISS, etc. 
 *    p_loc_county_dist_id                 The state issued district id
 *    p_load_datetime                      The date on which the district data was loaded
 *    p_validation_datetime                The date on which the data was validated
 *    p_data_valid_flag                    Flag indicating whether the data is valid.  Values: VALID, 
 *                                         INVALID
 *    p_most_recent_flag                   Flag indicating whether this run is the most recent run.
 *                                         Values: MOST_RECENT, HISTORY
 *---------------------------------------------------------------------------------------------------------*/
PROCEDURE proc_ETL_LOAD_DIM(
p_load_sid                NUMBER
,p_district_sid           NUMBER
,p_load_type              VARCHAR2
,p_loc_county_dist_id     VARCHAR2
,p_load_datetime          TIMESTAMP
,p_validation_datetime    TIMESTAMP
,p_data_valid_flag        VARCHAR2
,p_most_recent_flag       VARCHAR2
)

IS

BEGIN
------------------ Update previous MOST_RECENT_FLAG -----------------------------------
BEGIN
	  update zeus.etl_load_dim
	  set most_recent_flag = 'HISTORY'
	  where load_type = p_load_type
	  and district_sid = p_district_sid
	  and load_sid = (  select
							  max(load_sid)
						from zeus.etl_load_dim
						where load_type = p_load_type
						and district_sid = p_district_sid
						and p_most_recent_flag = 'MOST_RECENT');
      exception when NO_DATA_FOUND then null;
END;
			
-------------------- Load the ETL_LOAD_DIM table -------------------------------------
insert into zeus.etl_load_dim
values(
p_load_sid
,p_district_sid
,p_load_type
,p_loc_county_dist_id
,p_load_datetime
,p_validation_datetime
,p_data_valid_flag
,p_most_recent_flag
);

commit;

exception
  when others then
         proc_ETL_LOG_EVENT('PROC_ETL_LOAD_DIM','Error','PL/SQL Procedure','Failed',SQLCODE,(SQLERRM || ';' || dbms_utility.format_error_backtrace),null,('Error occurred when loading table ZEUS.ETL_LOAD_DIM with '||p_load_type ||' data.'),null,null,null);
         raise;

END proc_ETL_LOAD_DIM;

/***********************************************************************************************************
************************************************************************************************************
************************************************************************************************************/

/*----------------------------------------------------------------------------------------------------------
 *   PROCEDURE: proc_ETL_LOAD_DIM 
 *  
 *   Procedure for loading load validation information into the ETL_LOAD_DIM table if the previous load_sid 
 *   is not consecutive in time to the current and you know its actual value (passed as p_update_load_sid).
 *   
 *   Column Name                           Description
 *   -----------------------               ----------------------------------------------------------------
 *    p_load_sid                           A unique identifier for every load constructed from a sequence
 *    p_update_load_sid                    The unique identifier for the load/run that is to be updated.
 *                                         Use this procedure when the load/run that is being updated is 
 *                                         is a previous load but is not consecutive to the current load.
 *                                         Example: in ISS processing, while the current load may contain 
 *                                         current data, a previous load may consist of a load of previous  
 *                                         year data.  In which case, we would want to keep the most
 *                                         recent flag for this previous year's load as 'MOST_RECENT'     
 *										   (p_update_load_sid = NULL) and not update it as 'HISTORY'. 
 *    p_district_sid                       The district id
 *    p_load_type                          The functional name of the process/application.  E.g. Enrollment, 
 *                                         Absence, ISS, etc. 
 *    p_loc_county_dist_id                 The state issued district id
 *    p_load_datetime                      The date on which the district data was loaded
 *    p_validation_datetime                The date on which the data was validated
 *    p_data_valid_flag                    Flag indicating whether the data is valid.  Values: VALID, 
 *                                         INVALID
 *    p_most_recent_flag                   Flag indicating whether this run is the most recent run.
 *                                         Values: MOST_RECENT, HISTORY
 *---------------------------------------------------------------------------------------------------------*/
PROCEDURE proc_ETL_LOAD_DIM(
p_load_sid                NUMBER
,p_update_load_sid        NUMBER
,p_district_sid           NUMBER
,p_load_type              VARCHAR2
,p_loc_county_dist_id     VARCHAR2
,p_load_datetime          TIMESTAMP
,p_validation_datetime    TIMESTAMP
,p_data_valid_flag        VARCHAR2
,p_most_recent_flag       VARCHAR2
)

IS

BEGIN
------------------ Update previous MOST_RECENT_FLAG -----------------------------------
if 	p_update_load_sid is not null then								   
	begin
		  update zeus.etl_load_dim
		  set most_recent_flag = 'HISTORY'
		  where load_type = p_load_type
		  and district_sid = p_district_sid
		  and load_sid = p_update_load_sid;
		  
		  exception when NO_DATA_FOUND then null;
	end;	
end if;	
				
-------------------- Load the ETL_LOAD_DIM table -------------------------------------
insert into zeus.etl_load_dim
values(
p_load_sid
,p_district_sid
,p_load_type
,p_loc_county_dist_id
,p_load_datetime
,p_validation_datetime
,p_data_valid_flag
,p_most_recent_flag
);

commit;

exception
  when others then
         proc_ETL_LOG_EVENT('PROC_ETL_LOAD_DIM','Error','PL/SQL Procedure','Failed',SQLCODE,(SQLERRM || ';' || dbms_utility.format_error_backtrace),null,('Error occurred when loading table ZEUS.ETL_LOAD_DIM with '||p_load_type ||' data.'),null,null,null);
         raise;

END proc_ETL_LOAD_DIM;

END pkg_UTILITIES;
/


spool off
