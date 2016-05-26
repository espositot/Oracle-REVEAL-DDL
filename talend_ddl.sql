-----------------------------------------------------------
-- Export file for user TALEND@DATAWH                    --
-- Created by espositot on 5/26/2016, 16:51:30 16:51:30  --
-----------------------------------------------------------

set define off
spool talend_ddl.log

prompt
prompt Creating synonym ABSENCE_REASON_DIM
prompt ===================================
prompt
create or replace synonym TALEND.ABSENCE_REASON_DIM
  for CORE.ABSENCE_REASON_DIM;

prompt
prompt Creating synonym ACADEMIC_RECORD_SOURCE_DIM
prompt ===========================================
prompt
create or replace synonym TALEND.ACADEMIC_RECORD_SOURCE_DIM
  for CORE.ACADEMIC_RECORD_SOURCE_DIM;

prompt
prompt Creating synonym CAMPUS_DIM
prompt ===========================
prompt
create or replace synonym TALEND.CAMPUS_DIM
  for CORE.CAMPUS_DIM;

prompt
prompt Creating synonym CLASS_PERIOD_DIM
prompt =================================
prompt
create or replace synonym TALEND.CLASS_PERIOD_DIM
  for CORE.CLASS_PERIOD_DIM;

prompt
prompt Creating synonym COURSE_DIM
prompt ===========================
prompt
create or replace synonym TALEND.COURSE_DIM
  for CORE.COURSE_DIM;

prompt
prompt Creating synonym COURSE_SECTION_DIM
prompt ===================================
prompt
create or replace synonym TALEND.COURSE_SECTION_DIM
  for CORE.COURSE_SECTION_DIM;

prompt
prompt Creating synonym DATE_DIM
prompt =========================
prompt
create or replace synonym TALEND.DATE_DIM
  for CORE.DATE_DIM;

prompt
prompt Creating synonym DISTRICT_DIM
prompt =============================
prompt
create or replace synonym TALEND.DISTRICT_DIM
  for CORE.DISTRICT_DIM;

prompt
prompt Creating synonym DWS_GLOBAL_DEFAULT
prompt ===================================
prompt
create or replace synonym TALEND.DWS_GLOBAL_DEFAULT
  for DWS.DWS_GLOBAL_DEFAULT;

prompt
prompt Creating synonym ETL_GRADINGPERIOD_TO_GRADETYPE
prompt ===============================================
prompt
create or replace synonym TALEND.ETL_GRADINGPERIOD_TO_GRADETYPE
  for CORE.ETL_GRADINGPERIOD_TO_GRADETYPE;

prompt
prompt Creating synonym EXECUTION_LOG
prompt ==============================
prompt
create or replace synonym TALEND.EXECUTION_LOG
  for DWS.EXECUTION_LOG;

prompt
prompt Creating synonym GRADE_LEVEL_DIM
prompt ================================
prompt
create or replace synonym TALEND.GRADE_LEVEL_DIM
  for CORE.GRADE_LEVEL_DIM;

prompt
prompt Creating synonym GRADE_TYPE_DIM
prompt ===============================
prompt
create or replace synonym TALEND.GRADE_TYPE_DIM
  for CORE.GRADE_TYPE_DIM;

prompt
prompt Creating synonym NINTH_GRD_COHORT
prompt =================================
prompt
create or replace synonym TALEND.NINTH_GRD_COHORT
  for DWS.NINTH_GRD_COHORT;

prompt
prompt Creating synonym RACE_ETHNICITY_DIM
prompt ===================================
prompt
create or replace synonym TALEND.RACE_ETHNICITY_DIM
  for CORE.RACE_ETHNICITY_DIM;

prompt
prompt Creating synonym SID_SEQUENCE
prompt =============================
prompt
create or replace synonym TALEND.SID_SEQUENCE
  for CORE.SID_SEQUENCE;

prompt
prompt Creating synonym STATE_COURSE_DIM
prompt =================================
prompt
create or replace synonym TALEND.STATE_COURSE_DIM
  for CORE.STATE_COURSE_DIM;

prompt
prompt Creating synonym STUDENT_CREDIT_FACT
prompt ====================================
prompt
create or replace synonym TALEND.STUDENT_CREDIT_FACT
  for CORE.STUDENT_CREDIT_FACT;

prompt
prompt Creating synonym STUDENT_CREDIT_FACT_ERR
prompt ========================================
prompt
create or replace synonym TALEND.STUDENT_CREDIT_FACT_ERR
  for CORE.STUDENT_CREDIT_FACT_ERR;

prompt
prompt Creating synonym STUDENT_CREDIT_FACT_REJ
prompt ========================================
prompt
create or replace synonym TALEND.STUDENT_CREDIT_FACT_REJ
  for CORE.STUDENT_CREDIT_FACT_REJ;

prompt
prompt Creating synonym STUDENT_CREDIT_SUMMARY_MV
prompt ==========================================
prompt
create or replace synonym TALEND.STUDENT_CREDIT_SUMMARY_MV
  for CORE.STUDENT_CREDIT_SUMMARY_MV;

prompt
prompt Creating synonym STUDENT_DIM
prompt ============================
prompt
create or replace synonym TALEND.STUDENT_DIM
  for CORE.STUDENT_DIM;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT
prompt ========================================
prompt
create or replace synonym TALEND.STUDENT_ENROLLMENT_FACT
  for CORE.STUDENT_ENROLLMENT_FACT;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT_ERR
prompt ============================================
prompt
create or replace synonym TALEND.STUDENT_ENROLLMENT_FACT_ERR
  for CORE.STUDENT_ENROLLMENT_FACT_ERR;

prompt
prompt Creating synonym STUDENT_ENROLLMENT_FACT_REJ
prompt ============================================
prompt
create or replace synonym TALEND.STUDENT_ENROLLMENT_FACT_REJ
  for CORE.STUDENT_ENROLLMENT_FACT_REJ;

prompt
prompt Creating synonym STUDENT_GRADE_FACT
prompt ===================================
prompt
create or replace synonym TALEND.STUDENT_GRADE_FACT
  for CORE.STUDENT_GRADE_FACT;

prompt
prompt Creating synonym STUDENT_GRADE_FACT_ERR
prompt =======================================
prompt
create or replace synonym TALEND.STUDENT_GRADE_FACT_ERR
  for CORE.STUDENT_GRADE_FACT_ERR;

prompt
prompt Creating synonym STUDENT_GRADE_FACT_REJ
prompt =======================================
prompt
create or replace synonym TALEND.STUDENT_GRADE_FACT_REJ
  for CORE.STUDENT_GRADE_FACT_REJ;

prompt
prompt Creating synonym STUDENT_PERIOD_ABSENCE_FACT
prompt ============================================
prompt
create or replace synonym TALEND.STUDENT_PERIOD_ABSENCE_FACT
  for CORE.STUDENT_PERIOD_ABSENCE_FACT;

prompt
prompt Creating synonym STUDENT_PERIOD_ABS_FACT_ERR
prompt ============================================
prompt
create or replace synonym TALEND.STUDENT_PERIOD_ABS_FACT_ERR
  for CORE.STUDENT_PERIOD_ABS_FACT_ERR;

prompt
prompt Creating synonym STUDENT_PERIOD_ABS_FACT_REJ
prompt ============================================
prompt
create or replace synonym TALEND.STUDENT_PERIOD_ABS_FACT_REJ
  for CORE.STUDENT_PERIOD_ABS_FACT_REJ;

prompt
prompt Creating synonym TALEND_ETL_PROCESS
prompt ===================================
prompt
create or replace synonym TALEND.TALEND_ETL_PROCESS
  for CORE.TALEND_ETL_PROCESS;

prompt
prompt Creating synonym TALEND_FLOW_METER_CATCHER
prompt ==========================================
prompt
create or replace synonym TALEND.TALEND_FLOW_METER_CATCHER
  for CORE.TALEND_FLOW_METER_CATCHER;

prompt
prompt Creating synonym TALEND_LEA_CONTEXTS
prompt ====================================
prompt
create or replace synonym TALEND.TALEND_LEA_CONTEXTS
  for CORE.TALEND_LEA_CONTEXTS;

prompt
prompt Creating synonym TALEND_LOG_CATCHER
prompt ===================================
prompt
create or replace synonym TALEND.TALEND_LOG_CATCHER
  for CORE.TALEND_LOG_CATCHER;

prompt
prompt Creating synonym TALEND_STAT_CATCHER
prompt ====================================
prompt
create or replace synonym TALEND.TALEND_STAT_CATCHER
  for CORE.TALEND_STAT_CATCHER;


spool off
