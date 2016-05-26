-----------------------------------------------------------
-- Export file for user QUINLANAPP@DATAWH                --
-- Created by espositot on 5/26/2016, 16:04:27 16:04:27  --
-----------------------------------------------------------

set define off
spool quinlanapp_ddl.log

prompt
prompt Creating synonym EXECUTION_LOAD_CAMPUS_VW
prompt =========================================
prompt
create or replace synonym QUINLANAPP.EXECUTION_LOAD_CAMPUS_VW
  for CEHLISDDATA.EXECUTION_LOAD_CAMPUS_VW;

prompt
prompt Creating synonym PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace synonym QUINLANAPP.PKG_DWS_STUDENT_NOTE
  for CEHLISDDATA.PKG_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym QUINLANAPP.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym PKG_SV_SECURITY
prompt ================================
prompt
create or replace synonym QUINLANAPP.PKG_SV_SECURITY
  for CEHLISDDATA.PKG_SV_SECURITY;

prompt
prompt Creating synonym V_DWS_ALL_RISK_FACTORS
prompt =======================================
prompt
create or replace synonym QUINLANAPP.V_DWS_ALL_RISK_FACTORS
  for CEHLISDDATA.V_DWS_ALL_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt =============================================
prompt
create or replace synonym QUINLANAPP.V_DWS_CAMPUS_RISK_FACTOR_SUM
  for CEHLISDDATA.V_DWS_CAMPUS_RISK_FACTOR_SUM;

prompt
prompt Creating synonym V_DWS_CREDITS_DETAIL
prompt =====================================
prompt
create or replace synonym QUINLANAPP.V_DWS_CREDITS_DETAIL
  for CEHLISDDATA.V_DWS_CREDITS_DETAIL;

prompt
prompt Creating synonym V_DWS_CREDITS_SUMMARY
prompt ======================================
prompt
create or replace synonym QUINLANAPP.V_DWS_CREDITS_SUMMARY
  for CEHLISDDATA.V_DWS_CREDITS_SUMMARY;

prompt
prompt Creating synonym V_DWS_CURR_RISK_FACTORS
prompt ========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_CURR_RISK_FACTORS
  for CEHLISDDATA.V_DWS_CURR_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_DISC_ACT_DETAIL
prompt ======================================
prompt
create or replace synonym QUINLANAPP.V_DWS_DISC_ACT_DETAIL
  for CEHLISDDATA.V_DWS_DISC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_ACT_DETAIL
prompt ==========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_DISC_INC_ACT_DETAIL
  for CEHLISDDATA.V_DWS_DISC_INC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_DETAIL
prompt ======================================
prompt
create or replace synonym QUINLANAPP.V_DWS_DISC_INC_DETAIL
  for CEHLISDDATA.V_DWS_DISC_INC_DETAIL;

prompt
prompt Creating synonym V_DWS_ENROLLMENT_HISTORY
prompt =========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_ENROLLMENT_HISTORY
  for CEHLISDDATA.V_DWS_ENROLLMENT_HISTORY;

prompt
prompt Creating synonym V_DWS_GRADES_DETAIL
prompt ====================================
prompt
create or replace synonym QUINLANAPP.V_DWS_GRADES_DETAIL
  for CEHLISDDATA.V_DWS_GRADES_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_DETAIL
prompt ========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_PERIOD_ABS_DETAIL
  for CEHLISDDATA.V_DWS_PERIOD_ABS_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM
prompt =====================================
prompt
create or replace synonym QUINLANAPP.V_DWS_PERIOD_ABS_SUM
  for CEHLISDDATA.V_DWS_PERIOD_ABS_SUM;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM_RPT
prompt =========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_PERIOD_ABS_SUM_RPT
  for CEHLISDDATA.V_DWS_PERIOD_ABS_SUM_RPT;

prompt
prompt Creating synonym V_DWS_RECENTLY_ADDED_STUDENTS
prompt ==============================================
prompt
create or replace synonym QUINLANAPP.V_DWS_RECENTLY_ADDED_STUDENTS
  for CEHLISDDATA.V_DWS_RECENTLY_ADDED_STUDENTS;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_FLOW
prompt =======================================
prompt
create or replace synonym QUINLANAPP.V_DWS_RISK_FACTOR_FLOW
  for CEHLISDDATA.V_DWS_RISK_FACTOR_FLOW;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_HISTORY
prompt ==========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_RISK_FACTOR_HISTORY
  for CEHLISDDATA.V_DWS_RISK_FACTOR_HISTORY;

prompt
prompt Creating synonym V_DWS_STUDENT_MASTER
prompt =====================================
prompt
create or replace synonym QUINLANAPP.V_DWS_STUDENT_MASTER
  for CEHLISDDATA.V_DWS_STUDENT_MASTER;

prompt
prompt Creating synonym V_DWS_STUDENT_NOTE
prompt ===================================
prompt
create or replace synonym QUINLANAPP.V_DWS_STUDENT_NOTE
  for CEHLISDDATA.V_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ===============================================
prompt
create or replace synonym QUINLANAPP.V_DWS_STUDENT_RISK_FACTOR_LIST
  for CEHLISDDATA.V_DWS_STUDENT_RISK_FACTOR_LIST;

prompt
prompt Creating synonym V_DWS_STU_RISK_HISTOGRAM
prompt =========================================
prompt
create or replace synonym QUINLANAPP.V_DWS_STU_RISK_HISTOGRAM
  for CEHLISDDATA.V_DWS_STU_RISK_HISTOGRAM;

prompt
prompt Creating synonym V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt =============================================
prompt
create or replace synonym QUINLANAPP.V_DWS_WKLY_ATTENDANCE_RF_CNT
  for CEHLISDDATA.V_DWS_WKLY_ATTENDANCE_RF_CNT;

prompt
prompt Creating synonym V_USER_APP_LIST
prompt ================================
prompt
create or replace synonym QUINLANAPP.V_USER_APP_LIST
  for CEHLISDDATA.V_USER_APP_LIST;


spool off
