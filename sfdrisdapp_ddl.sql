-----------------------------------------------------------
-- Export file for user SFDRISDAPP@DATAWH                --
-- Created by espositot on 5/26/2016, 16:31:40 16:31:40  --
-----------------------------------------------------------

set define off
spool sfdrisdapp_ddl.log

prompt
prompt Creating synonym EXECUTION_LOAD_CAMPUS_VW
prompt =========================================
prompt
create or replace synonym SFDRISDAPP.EXECUTION_LOAD_CAMPUS_VW
  for SFDRISDDATA.EXECUTION_LOAD_CAMPUS_VW;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.PKG_DWS_INTERVENTION
  for SFDRISDDATA.PKG_DWS_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION_NOTE
prompt ==========================================
prompt
create or replace synonym SFDRISDAPP.PKG_DWS_INTERVENTION_NOTE
  for SFDRISDDATA.PKG_DWS_INTERVENTION_NOTE;

prompt
prompt Creating synonym PKG_DWS_INTERV_CATEGORY
prompt ========================================
prompt
create or replace synonym SFDRISDAPP.PKG_DWS_INTERV_CATEGORY
  for SFDRISDDATA.PKG_DWS_INTERV_CATEGORY;

prompt
prompt Creating synonym PKG_DWS_STUDENT_INTERVENTION
prompt =============================================
prompt
create or replace synonym SFDRISDAPP.PKG_DWS_STUDENT_INTERVENTION
  for SFDRISDDATA.PKG_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.PKG_DWS_STUDENT_NOTE
  for SFDRISDDATA.PKG_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym SFDRISDAPP.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym PKG_SV_SECURITY
prompt ================================
prompt
create or replace synonym SFDRISDAPP.PKG_SV_SECURITY
  for SFDRISDDATA.PKG_SV_SECURITY;

prompt
prompt Creating synonym USER_ACCOUNT_V
prompt ===============================
prompt
create or replace synonym SFDRISDAPP.USER_ACCOUNT_V
  for SFDRISDDATA.USER_ACCOUNT_V;

prompt
prompt Creating synonym V_DWS_ALL_RISK_FACTORS
prompt =======================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_ALL_RISK_FACTORS
  for SFDRISDDATA.V_DWS_ALL_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt =============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_CAMPUS_RISK_FACTOR_SUM
  for SFDRISDDATA.V_DWS_CAMPUS_RISK_FACTOR_SUM;

prompt
prompt Creating synonym V_DWS_CHAMPIONS_LIST
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_CHAMPIONS_LIST
  for SFDRISDDATA.V_DWS_CHAMPIONS_LIST;

prompt
prompt Creating synonym V_DWS_CREDITS_DETAIL
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_CREDITS_DETAIL
  for SFDRISDDATA.V_DWS_CREDITS_DETAIL;

prompt
prompt Creating synonym V_DWS_CREDITS_SUMMARY
prompt ======================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_CREDITS_SUMMARY
  for SFDRISDDATA.V_DWS_CREDITS_SUMMARY;

prompt
prompt Creating synonym V_DWS_CURR_RISK_FACTORS
prompt ========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_CURR_RISK_FACTORS
  for SFDRISDDATA.V_DWS_CURR_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_DISC_ACT_DETAIL
prompt ======================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_DISC_ACT_DETAIL
  for SFDRISDDATA.V_DWS_DISC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_ACT_DETAIL
prompt ==========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_DISC_INC_ACT_DETAIL
  for SFDRISDDATA.V_DWS_DISC_INC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_DETAIL
prompt ======================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_DISC_INC_DETAIL
  for SFDRISDDATA.V_DWS_DISC_INC_DETAIL;

prompt
prompt Creating synonym V_DWS_ENROLLMENT_HISTORY
prompt =========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_ENROLLMENT_HISTORY
  for SFDRISDDATA.V_DWS_ENROLLMENT_HISTORY;

prompt
prompt Creating synonym V_DWS_GRADES_DETAIL
prompt ====================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_GRADES_DETAIL
  for SFDRISDDATA.V_DWS_GRADES_DETAIL;

prompt
prompt Creating synonym V_DWS_INTERVENTION
prompt ===================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_INTERVENTION
  for SFDRISDDATA.V_DWS_INTERVENTION;

prompt
prompt Creating synonym V_DWS_INTERVENTION_CATEGORY
prompt ============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_INTERVENTION_CATEGORY
  for SFDRISDDATA.V_DWS_INTERVENTION_CATEGORY;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTES
prompt =========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_INTERVENTION_NOTES
  for SFDRISDDATA.V_DWS_INTERVENTION_NOTES;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTE_TYPE
prompt =============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_INTERVENTION_NOTE_TYPE
  for SFDRISDDATA.V_DWS_INTERVENTION_NOTE_TYPE;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_DETAIL
prompt ========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_PERIOD_ABS_DETAIL
  for SFDRISDDATA.V_DWS_PERIOD_ABS_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_PERIOD_ABS_SUM
  for SFDRISDDATA.V_DWS_PERIOD_ABS_SUM;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM_RPT
prompt =========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_PERIOD_ABS_SUM_RPT
  for SFDRISDDATA.V_DWS_PERIOD_ABS_SUM_RPT;

prompt
prompt Creating synonym V_DWS_RECENTLY_ADDED_STUDENTS
prompt ==============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_RECENTLY_ADDED_STUDENTS
  for SFDRISDDATA.V_DWS_RECENTLY_ADDED_STUDENTS;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_FLOW
prompt =======================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_RISK_FACTOR_FLOW
  for SFDRISDDATA.V_DWS_RISK_FACTOR_FLOW;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_HISTORY
prompt ==========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_RISK_FACTOR_HISTORY
  for SFDRISDDATA.V_DWS_RISK_FACTOR_HISTORY;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION
prompt ===========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STUDENT_INTERVENTION
  for SFDRISDDATA.V_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION_IR
prompt ==============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STUDENT_INTERVENTION_IR
  for SFDRISDDATA.V_DWS_STUDENT_INTERVENTION_IR;

prompt
prompt Creating synonym V_DWS_STUDENT_MASTER
prompt =====================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STUDENT_MASTER
  for SFDRISDDATA.V_DWS_STUDENT_MASTER;

prompt
prompt Creating synonym V_DWS_STUDENT_NOTE
prompt ===================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STUDENT_NOTE
  for SFDRISDDATA.V_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ===============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STUDENT_RISK_FACTOR_LIST
  for SFDRISDDATA.V_DWS_STUDENT_RISK_FACTOR_LIST;

prompt
prompt Creating synonym V_DWS_STU_INTERVENTION_STATUS
prompt ==============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STU_INTERVENTION_STATUS
  for SFDRISDDATA.V_DWS_STU_INTERVENTION_STATUS;

prompt
prompt Creating synonym V_DWS_STU_RISK_HISTOGRAM
prompt =========================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_STU_RISK_HISTOGRAM
  for SFDRISDDATA.V_DWS_STU_RISK_HISTOGRAM;

prompt
prompt Creating synonym V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt =============================================
prompt
create or replace synonym SFDRISDAPP.V_DWS_WKLY_ATTENDANCE_RF_CNT
  for SFDRISDDATA.V_DWS_WKLY_ATTENDANCE_RF_CNT;

prompt
prompt Creating synonym V_USER_APP_LIST
prompt ================================
prompt
create or replace synonym SFDRISDAPP.V_USER_APP_LIST
  for SFDRISDDATA.V_USER_APP_LIST;


spool off
