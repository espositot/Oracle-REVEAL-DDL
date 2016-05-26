-----------------------------------------------------------
-- Export file for user HARLANDALEAPP@DATAWH             --
-- Created by espositot on 5/26/2016, 15:57:16 15:57:16  --
-----------------------------------------------------------

set define off
spool harlandaleapp_ddl.log

prompt
prompt Creating synonym EXECUTION_LOAD_CAMPUS_VW
prompt =========================================
prompt
create or replace synonym HARLANDALEAPP.EXECUTION_LOAD_CAMPUS_VW
  for HARLANDALEDATA.EXECUTION_LOAD_CAMPUS_VW;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.PKG_DWS_INTERVENTION
  for HARLANDALEDATA.PKG_DWS_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION_NOTE
prompt ==========================================
prompt
create or replace synonym HARLANDALEAPP.PKG_DWS_INTERVENTION_NOTE
  for HARLANDALEDATA.PKG_DWS_INTERVENTION_NOTE;

prompt
prompt Creating synonym PKG_DWS_INTERV_CATEGORY
prompt ========================================
prompt
create or replace synonym HARLANDALEAPP.PKG_DWS_INTERV_CATEGORY
  for HARLANDALEDATA.PKG_DWS_INTERV_CATEGORY;

prompt
prompt Creating synonym PKG_DWS_STUDENT_INTERVENTION
prompt =============================================
prompt
create or replace synonym HARLANDALEAPP.PKG_DWS_STUDENT_INTERVENTION
  for HARLANDALEDATA.PKG_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.PKG_DWS_STUDENT_NOTE
  for HARLANDALEDATA.PKG_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym HARLANDALEAPP.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym PKG_SV_SECURITY
prompt ================================
prompt
create or replace synonym HARLANDALEAPP.PKG_SV_SECURITY
  for HARLANDALEDATA.PKG_SV_SECURITY;

prompt
prompt Creating synonym USER_ACCOUNT_V
prompt ===============================
prompt
create or replace synonym HARLANDALEAPP.USER_ACCOUNT_V
  for HARLANDALEDATA.USER_ACCOUNT_V;

prompt
prompt Creating synonym V_DWS_ALL_RISK_FACTORS
prompt =======================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_ALL_RISK_FACTORS
  for HARLANDALEDATA.V_DWS_ALL_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt =============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_CAMPUS_RISK_FACTOR_SUM
  for HARLANDALEDATA.V_DWS_CAMPUS_RISK_FACTOR_SUM;

prompt
prompt Creating synonym V_DWS_CHAMPIONS_LIST
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_CHAMPIONS_LIST
  for HARLANDALEDATA.V_DWS_CHAMPIONS_LIST;

prompt
prompt Creating synonym V_DWS_CREDITS_DETAIL
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_CREDITS_DETAIL
  for HARLANDALEDATA.V_DWS_CREDITS_DETAIL;

prompt
prompt Creating synonym V_DWS_CREDITS_SUMMARY
prompt ======================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_CREDITS_SUMMARY
  for HARLANDALEDATA.V_DWS_CREDITS_SUMMARY;

prompt
prompt Creating synonym V_DWS_CURR_RISK_FACTORS
prompt ========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_CURR_RISK_FACTORS
  for HARLANDALEDATA.V_DWS_CURR_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_DISC_ACT_DETAIL
prompt ======================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_DISC_ACT_DETAIL
  for HARLANDALEDATA.V_DWS_DISC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_ACT_DETAIL
prompt ==========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_DISC_INC_ACT_DETAIL
  for HARLANDALEDATA.V_DWS_DISC_INC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_DETAIL
prompt ======================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_DISC_INC_DETAIL
  for HARLANDALEDATA.V_DWS_DISC_INC_DETAIL;

prompt
prompt Creating synonym V_DWS_ENROLLMENT_HISTORY
prompt =========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_ENROLLMENT_HISTORY
  for HARLANDALEDATA.V_DWS_ENROLLMENT_HISTORY;

prompt
prompt Creating synonym V_DWS_GRADES_DETAIL
prompt ====================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_GRADES_DETAIL
  for HARLANDALEDATA.V_DWS_GRADES_DETAIL;

prompt
prompt Creating synonym V_DWS_INTERVENTION
prompt ===================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_INTERVENTION
  for HARLANDALEDATA.V_DWS_INTERVENTION;

prompt
prompt Creating synonym V_DWS_INTERVENTION_CATEGORY
prompt ============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_INTERVENTION_CATEGORY
  for HARLANDALEDATA.V_DWS_INTERVENTION_CATEGORY;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTES
prompt =========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_INTERVENTION_NOTES
  for HARLANDALEDATA.V_DWS_INTERVENTION_NOTES;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTE_TYPE
prompt =============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_INTERVENTION_NOTE_TYPE
  for HARLANDALEDATA.V_DWS_INTERVENTION_NOTE_TYPE;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_DETAIL
prompt ========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_PERIOD_ABS_DETAIL
  for HARLANDALEDATA.V_DWS_PERIOD_ABS_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_PERIOD_ABS_SUM
  for HARLANDALEDATA.V_DWS_PERIOD_ABS_SUM;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM_RPT
prompt =========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_PERIOD_ABS_SUM_RPT
  for HARLANDALEDATA.V_DWS_PERIOD_ABS_SUM_RPT;

prompt
prompt Creating synonym V_DWS_RECENTLY_ADDED_STUDENTS
prompt ==============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_RECENTLY_ADDED_STUDENTS
  for HARLANDALEDATA.V_DWS_RECENTLY_ADDED_STUDENTS;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_FLOW
prompt =======================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_RISK_FACTOR_FLOW
  for HARLANDALEDATA.V_DWS_RISK_FACTOR_FLOW;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_HISTORY
prompt ==========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_RISK_FACTOR_HISTORY
  for HARLANDALEDATA.V_DWS_RISK_FACTOR_HISTORY;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION
prompt ===========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STUDENT_INTERVENTION
  for HARLANDALEDATA.V_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION_IR
prompt ==============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STUDENT_INTERVENTION_IR
  for HARLANDALEDATA.V_DWS_STUDENT_INTERVENTION_IR;

prompt
prompt Creating synonym V_DWS_STUDENT_MASTER
prompt =====================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STUDENT_MASTER
  for HARLANDALEDATA.V_DWS_STUDENT_MASTER;

prompt
prompt Creating synonym V_DWS_STUDENT_NOTE
prompt ===================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STUDENT_NOTE
  for HARLANDALEDATA.V_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ===============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STUDENT_RISK_FACTOR_LIST
  for HARLANDALEDATA.V_DWS_STUDENT_RISK_FACTOR_LIST;

prompt
prompt Creating synonym V_DWS_STU_INTERVENTION_STATUS
prompt ==============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STU_INTERVENTION_STATUS
  for HARLANDALEDATA.V_DWS_STU_INTERVENTION_STATUS;

prompt
prompt Creating synonym V_DWS_STU_RISK_HISTOGRAM
prompt =========================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_STU_RISK_HISTOGRAM
  for HARLANDALEDATA.V_DWS_STU_RISK_HISTOGRAM;

prompt
prompt Creating synonym V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt =============================================
prompt
create or replace synonym HARLANDALEAPP.V_DWS_WKLY_ATTENDANCE_RF_CNT
  for HARLANDALEDATA.V_DWS_WKLY_ATTENDANCE_RF_CNT;

prompt
prompt Creating synonym V_USER_APP_LIST
prompt ================================
prompt
create or replace synonym HARLANDALEAPP.V_USER_APP_LIST
  for HARLANDALEDATA.V_USER_APP_LIST;


spool off
