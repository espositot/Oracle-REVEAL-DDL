-----------------------------------------------------------
-- Export file for user WACOISDAPP@DATAWH                --
-- Created by espositot on 5/26/2016, 14:48:26 14:48:26  --
-----------------------------------------------------------

set define off
spool wacoapp_ddl.log

prompt
prompt Creating synonym APPLICATION_V
prompt ==============================
prompt
create or replace synonym WACOISDAPP.APPLICATION_V
  for WACOISDDATA.APPLICATION_V;

prompt
prompt Creating synonym EXECUTION_LOAD_CAMPUS_VW
prompt =========================================
prompt
create or replace synonym WACOISDAPP.EXECUTION_LOAD_CAMPUS_VW
  for WACOISDDATA.EXECUTION_LOAD_CAMPUS_VW;

prompt
prompt Creating synonym MV_TXSTU_BUS_ACCT_SEC_D
prompt ========================================
prompt
create or replace synonym WACOISDAPP.MV_TXSTU_BUS_ACCT_SEC_D
  for WACOISDDATA.MV_TXSTU_BUS_ACCT_SEC_D;

prompt
prompt Creating synonym PKG_DWS_AUDIT_LOG
prompt ==================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_AUDIT_LOG
  for WACOISDDATA.PKG_DWS_AUDIT_LOG;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION
prompt =====================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_INTERVENTION
  for WACOISDDATA.PKG_DWS_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION_NOTE
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_INTERVENTION_NOTE
  for WACOISDDATA.PKG_DWS_INTERVENTION_NOTE;

prompt
prompt Creating synonym PKG_DWS_INTERV_CATEGORY
prompt ========================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_INTERV_CATEGORY
  for WACOISDDATA.PKG_DWS_INTERV_CATEGORY;

prompt
prompt Creating synonym PKG_DWS_PEIMS_AT_RISK
prompt ======================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_PEIMS_AT_RISK
  for WACOISDDATA.PKG_DWS_PEIMS_AT_RISK;

prompt
prompt Creating synonym PKG_DWS_STUDENT_INTERVENTION
prompt =============================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_STUDENT_INTERVENTION
  for WACOISDDATA.PKG_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace synonym WACOISDAPP.PKG_DWS_STUDENT_NOTE
  for WACOISDDATA.PKG_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym PKG_IDMGR_DISTRICT
prompt ===================================
prompt
create or replace synonym WACOISDAPP.PKG_IDMGR_DISTRICT
  for WACOISDDATA.PKG_IDMGR_DISTRICT;

prompt
prompt Creating synonym PKG_IDMGR_USER_ACCOUNT
prompt =======================================
prompt
create or replace synonym WACOISDAPP.PKG_IDMGR_USER_ACCOUNT
  for WACOISDDATA.PKG_IDMGR_USER_ACCOUNT;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym WACOISDAPP.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym PKG_SV_ACCT_MGMT
prompt =================================
prompt
create or replace synonym WACOISDAPP.PKG_SV_ACCT_MGMT
  for WACOISDDATA.PKG_SV_ACCT_MGMT;

prompt
prompt Creating synonym PKG_SV_SECURITY
prompt ================================
prompt
create or replace synonym WACOISDAPP.PKG_SV_SECURITY
  for WACOISDDATA.PKG_SV_SECURITY;

prompt
prompt Creating synonym PKG_TXEIS_SECURITY
prompt ===================================
prompt
create or replace synonym WACOISDAPP.PKG_TXEIS_SECURITY
  for WACOISDDATA.PKG_TXEIS_SECURITY;

prompt
prompt Creating synonym SECURITY_QUESTION_USER_V
prompt =========================================
prompt
create or replace synonym WACOISDAPP.SECURITY_QUESTION_USER_V
  for WACOISDDATA.SECURITY_QUESTION_USER_V;

prompt
prompt Creating synonym USER_ACCOUNT_V
prompt ===============================
prompt
create or replace synonym WACOISDAPP.USER_ACCOUNT_V
  for WACOISDDATA.USER_ACCOUNT_V;

prompt
prompt Creating synonym USER_APPS_ROLES_V
prompt ==================================
prompt
create or replace synonym WACOISDAPP.USER_APPS_ROLES_V
  for WACOISDDATA.USER_APPS_ROLES_V;

prompt
prompt Creating synonym V_DWS_ALL_RISK_FACTORS
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_DWS_ALL_RISK_FACTORS
  for WACOISDDATA.V_DWS_ALL_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_CAMPUS_LIST
prompt ==================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CAMPUS_LIST
  for WACOISDDATA.V_DWS_CAMPUS_LIST;

prompt
prompt Creating synonym V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CAMPUS_RISK_FACTOR_SUM
  for WACOISDDATA.V_DWS_CAMPUS_RISK_FACTOR_SUM;

prompt
prompt Creating synonym V_DWS_CHAMPIONS_LIST
prompt =====================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CHAMPIONS_LIST
  for WACOISDDATA.V_DWS_CHAMPIONS_LIST;

prompt
prompt Creating synonym V_DWS_CHANGE_LOG
prompt =================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CHANGE_LOG
  for WACOISDDATA.V_DWS_CHANGE_LOG;

prompt
prompt Creating synonym V_DWS_CREDITS_DETAIL
prompt =====================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CREDITS_DETAIL
  for WACOISDDATA.V_DWS_CREDITS_DETAIL;

prompt
prompt Creating synonym V_DWS_CREDITS_SUMMARY
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CREDITS_SUMMARY
  for WACOISDDATA.V_DWS_CREDITS_SUMMARY;

prompt
prompt Creating synonym V_DWS_CURR_RISK_FACTORS
prompt ========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_CURR_RISK_FACTORS
  for WACOISDDATA.V_DWS_CURR_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_DISC_ACT_DETAIL
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_DWS_DISC_ACT_DETAIL
  for WACOISDDATA.V_DWS_DISC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_ACT_DETAIL
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_DISC_INC_ACT_DETAIL
  for WACOISDDATA.V_DWS_DISC_INC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_DETAIL
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_DWS_DISC_INC_DETAIL
  for WACOISDDATA.V_DWS_DISC_INC_DETAIL;

prompt
prompt Creating synonym V_DWS_DISPROPORTION_DISCIPLINE
prompt ===============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_DISPROPORTION_DISCIPLINE
  for WACOISDDATA.V_DWS_DISPROPORTION_DISCIPLINE;

prompt
prompt Creating synonym V_DWS_ENROLLMENT_HISTORY
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_ENROLLMENT_HISTORY
  for WACOISDDATA.V_DWS_ENROLLMENT_HISTORY;

prompt
prompt Creating synonym V_DWS_GRADES_DETAIL
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_DWS_GRADES_DETAIL
  for WACOISDDATA.V_DWS_GRADES_DETAIL;

prompt
prompt Creating synonym V_DWS_GRADE_LEVEL
prompt ==================================
prompt
create or replace synonym WACOISDAPP.V_DWS_GRADE_LEVEL
  for WACOISDDATA.V_DWS_GRADE_LEVEL;

prompt
prompt Creating synonym V_DWS_INTERVENTION
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_DWS_INTERVENTION
  for WACOISDDATA.V_DWS_INTERVENTION;

prompt
prompt Creating synonym V_DWS_INTERVENTION_CATEGORY
prompt ============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_INTERVENTION_CATEGORY
  for WACOISDDATA.V_DWS_INTERVENTION_CATEGORY;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTES
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_INTERVENTION_NOTES
  for WACOISDDATA.V_DWS_INTERVENTION_NOTES;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTE_TYPE
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_INTERVENTION_NOTE_TYPE
  for WACOISDDATA.V_DWS_INTERVENTION_NOTE_TYPE;

prompt
prompt Creating synonym V_DWS_PEIMS_AT_RISK_DTL
prompt ========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_PEIMS_AT_RISK_DTL
  for WACOISDDATA.V_DWS_PEIMS_AT_RISK_DTL;

prompt
prompt Creating synonym V_DWS_PEIMS_AT_RISK_LIST
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_PEIMS_AT_RISK_LIST
  for WACOISDDATA.V_DWS_PEIMS_AT_RISK_LIST;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_DETAIL
prompt ========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_PERIOD_ABS_DETAIL
  for WACOISDDATA.V_DWS_PERIOD_ABS_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM
prompt =====================================
prompt
create or replace synonym WACOISDAPP.V_DWS_PERIOD_ABS_SUM
  for WACOISDDATA.V_DWS_PERIOD_ABS_SUM;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM_RPT
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_PERIOD_ABS_SUM_RPT
  for WACOISDDATA.V_DWS_PERIOD_ABS_SUM_RPT;

prompt
prompt Creating synonym V_DWS_RECENTLY_ADDED_STUDENTS
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_RECENTLY_ADDED_STUDENTS
  for WACOISDDATA.V_DWS_RECENTLY_ADDED_STUDENTS;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_FLOW
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_DWS_RISK_FACTOR_FLOW
  for WACOISDDATA.V_DWS_RISK_FACTOR_FLOW;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_HISTORY
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_RISK_FACTOR_HISTORY
  for WACOISDDATA.V_DWS_RISK_FACTOR_HISTORY;

prompt
prompt Creating synonym V_DWS_SCHOOL_YEAR
prompt ==================================
prompt
create or replace synonym WACOISDAPP.V_DWS_SCHOOL_YEAR
  for WACOISDDATA.V_DWS_SCHOOL_YEAR;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION
prompt ===========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STUDENT_INTERVENTION
  for WACOISDDATA.V_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION_IR
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STUDENT_INTERVENTION_IR
  for WACOISDDATA.V_DWS_STUDENT_INTERVENTION_IR;

prompt
prompt Creating synonym V_DWS_STUDENT_MASTER
prompt =====================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STUDENT_MASTER
  for WACOISDDATA.V_DWS_STUDENT_MASTER;

prompt
prompt Creating synonym V_DWS_STUDENT_NOTE
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STUDENT_NOTE
  for WACOISDDATA.V_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ===============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STUDENT_RISK_FACTOR_LIST
  for WACOISDDATA.V_DWS_STUDENT_RISK_FACTOR_LIST;

prompt
prompt Creating synonym V_DWS_STU_INTERVENTION_STATUS
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STU_INTERVENTION_STATUS
  for WACOISDDATA.V_DWS_STU_INTERVENTION_STATUS;

prompt
prompt Creating synonym V_DWS_STU_RISK_HISTOGRAM
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_DWS_STU_RISK_HISTOGRAM
  for WACOISDDATA.V_DWS_STU_RISK_HISTOGRAM;

prompt
prompt Creating synonym V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_DWS_WKLY_ATTENDANCE_RF_CNT
  for WACOISDDATA.V_DWS_WKLY_ATTENDANCE_RF_CNT;

prompt
prompt Creating synonym V_ENROLLMENT_BY_DISTRICT
prompt =========================================
prompt
create or replace synonym WACOISDAPP.V_ENROLLMENT_BY_DISTRICT
  for WACOISDDATA.V_ENROLLMENT_BY_DISTRICT;

prompt
prompt Creating synonym V_ENROLLMENT_BY_ETHNICITY
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_ENROLLMENT_BY_ETHNICITY
  for WACOISDDATA.V_ENROLLMENT_BY_ETHNICITY;

prompt
prompt Creating synonym V_ENROLLMENT_BY_GENDER
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_ENROLLMENT_BY_GENDER
  for WACOISDDATA.V_ENROLLMENT_BY_GENDER;

prompt
prompt Creating synonym V_ENROLLMENT_BY_GRADE_LVL
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_ENROLLMENT_BY_GRADE_LVL
  for WACOISDDATA.V_ENROLLMENT_BY_GRADE_LVL;

prompt
prompt Creating synonym V_IDMGR_APP_ROLE
prompt =================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_APP_ROLE
  for WACOISDDATA.V_IDMGR_APP_ROLE;

prompt
prompt Creating synonym V_IDMGR_CAMPUS_MASTER
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_CAMPUS_MASTER
  for WACOISDDATA.V_IDMGR_CAMPUS_MASTER;

prompt
prompt Creating synonym V_IDMGR_LOGIN_MESSAGE
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_LOGIN_MESSAGE
  for WACOISDDATA.V_IDMGR_LOGIN_MESSAGE;

prompt
prompt Creating synonym V_IDMGR_REPORT_CATG_ALL
prompt ========================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_REPORT_CATG_ALL
  for WACOISDDATA.V_IDMGR_REPORT_CATG_ALL;

prompt
prompt Creating synonym V_IDMGR_REPORT_LIST
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_REPORT_LIST
  for WACOISDDATA.V_IDMGR_REPORT_LIST;

prompt
prompt Creating synonym V_IDMGR_SECURITY_QUESTION
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_SECURITY_QUESTION
  for WACOISDDATA.V_IDMGR_SECURITY_QUESTION;

prompt
prompt Creating synonym V_IDMGR_SECURITY_TRANS_LOG
prompt ===========================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_SECURITY_TRANS_LOG
  for WACOISDDATA.V_IDMGR_SECURITY_TRANS_LOG;

prompt
prompt Creating synonym V_IDMGR_SEC_USERS_LIST_FILTER
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_SEC_USERS_LIST_FILTER
  for WACOISDDATA.V_IDMGR_SEC_USERS_LIST_FILTER;

prompt
prompt Creating synonym V_IDMGR_TXEIS_REPORT_CATG_ALL
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_TXEIS_REPORT_CATG_ALL
  for WACOISDDATA.V_IDMGR_TXEIS_REPORT_CATG_ALL;

prompt
prompt Creating synonym V_IDMGR_USER_ACCT_COLUMN_AUTH
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_ACCT_COLUMN_AUTH
  for WACOISDDATA.V_IDMGR_USER_ACCT_COLUMN_AUTH;

prompt
prompt Creating synonym V_IDMGR_USER_CAMPUS
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_CAMPUS
  for WACOISDDATA.V_IDMGR_USER_CAMPUS;

prompt
prompt Creating synonym V_IDMGR_USER_REPORT
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_REPORT
  for WACOISDDATA.V_IDMGR_USER_REPORT;

prompt
prompt Creating synonym V_IDMGR_USER_REPORT_CATEGORY
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_REPORT_CATEGORY
  for WACOISDDATA.V_IDMGR_USER_REPORT_CATEGORY;

prompt
prompt Creating synonym V_IDMGR_USER_ROLE
prompt ==================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_ROLE
  for WACOISDDATA.V_IDMGR_USER_ROLE;

prompt
prompt Creating synonym V_IDMGR_USER_TXEIS_BUS_ACT_PRM
prompt ===============================================
prompt
create or replace synonym WACOISDAPP.V_IDMGR_USER_TXEIS_BUS_ACT_PRM
  for WACOISDDATA.V_IDMGR_USER_TXEIS_BUS_ACT_PRM;

prompt
prompt Creating synonym V_REPORTER_DATA_AS_OF_DATE
prompt ===========================================
prompt
create or replace synonym WACOISDAPP.V_REPORTER_DATA_AS_OF_DATE
  for WACOISDDATA.V_REPORTER_DATA_AS_OF_DATE;

prompt
prompt Creating synonym V_SCHOOL_YEAR
prompt ==============================
prompt
create or replace synonym WACOISDAPP.V_SCHOOL_YEAR
  for WACOISDDATA.V_SCHOOL_YEAR;

prompt
prompt Creating synonym V_SOURCE
prompt =========================
prompt
create or replace synonym WACOISDAPP.V_SOURCE
  for WACOISDDATA.V_SOURCE;

prompt
prompt Creating synonym V_TXBUS_ACCT_SECURITY
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_TXBUS_ACCT_SECURITY
  for WACOISDDATA.V_TXBUS_ACCT_SECURITY;

prompt
prompt Creating synonym V_TXBUS_ACCT_SECURITY_IMPORT
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_TXBUS_ACCT_SECURITY_IMPORT
  for WACOISDDATA.V_TXBUS_ACCT_SECURITY_IMPORT;

prompt
prompt Creating synonym V_TXFIN_BFN_OPTIONS
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_BFN_OPTIONS
  for WACOISDDATA.V_TXFIN_BFN_OPTIONS;

prompt
prompt Creating synonym V_TXFIN_CHECK_TRANS
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_CHECK_TRANS
  for WACOISDDATA.V_TXFIN_CHECK_TRANS;

prompt
prompt Creating synonym V_TXFIN_EXP_YR_OVR_YR
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_EXP_YR_OVR_YR
  for WACOISDDATA.V_TXFIN_EXP_YR_OVR_YR;

prompt
prompt Creating synonym V_TXFIN_GL
prompt ===========================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_GL
  for WACOISDDATA.V_TXFIN_GL;

prompt
prompt Creating synonym V_TXFIN_GL_JE_TRANS
prompt ====================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_GL_JE_TRANS
  for WACOISDDATA.V_TXFIN_GL_JE_TRANS;

prompt
prompt Creating synonym V_TXFIN_PO_ENCUM_TRANS
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_PO_ENCUM_TRANS
  for WACOISDDATA.V_TXFIN_PO_ENCUM_TRANS;

prompt
prompt Creating synonym V_TXFIN_REV_BOARD_RPT
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_REV_BOARD_RPT
  for WACOISDDATA.V_TXFIN_REV_BOARD_RPT;

prompt
prompt Creating synonym V_TXFIN_REV_CASH_RECEIPTS
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_REV_CASH_RECEIPTS
  for WACOISDDATA.V_TXFIN_REV_CASH_RECEIPTS;

prompt
prompt Creating synonym V_TXFIN_REV_DETAIL
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_REV_DETAIL
  for WACOISDDATA.V_TXFIN_REV_DETAIL;

prompt
prompt Creating synonym V_TXFIN_REV_YR_OVER_YR
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_TXFIN_REV_YR_OVER_YR
  for WACOISDDATA.V_TXFIN_REV_YR_OVER_YR;

prompt
prompt Creating synonym V_TXSEC_SEC_USERS_LIST_FILTER
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_TXSEC_SEC_USERS_LIST_FILTER
  for WACOISDDATA.V_TXSEC_SEC_USERS_LIST_FILTER;

prompt
prompt Creating synonym V_TXSEC_SEC_USER_CAMPUS_LIST
prompt =============================================
prompt
create or replace synonym WACOISDAPP.V_TXSEC_SEC_USER_CAMPUS_LIST
  for WACOISDDATA.V_TXSEC_SEC_USER_CAMPUS_LIST;

prompt
prompt Creating synonym V_TXSTU_ATT_STU_ENROLL_DETAIL
prompt ==============================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_ATT_STU_ENROLL_DETAIL
  for WACOISDDATA.V_TXSTU_ATT_STU_ENROLL_DETAIL;

prompt
prompt Creating synonym V_TXSTU_CONTACT_PARENT
prompt =======================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_CONTACT_PARENT
  for WACOISDDATA.V_TXSTU_CONTACT_PARENT;

prompt
prompt Creating synonym V_TXSTU_DISCIPLINE
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_DISCIPLINE
  for WACOISDDATA.V_TXSTU_DISCIPLINE;

prompt
prompt Creating synonym V_TXSTU_GRADEBK_LOGIN
prompt ======================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_GRADEBK_LOGIN
  for WACOISDDATA.V_TXSTU_GRADEBK_LOGIN;

prompt
prompt Creating synonym V_TXSTU_GRADES
prompt ===============================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_GRADES
  for WACOISDDATA.V_TXSTU_GRADES;

prompt
prompt Creating synonym V_TXSTU_IMMUNIZ
prompt ================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_IMMUNIZ
  for WACOISDDATA.V_TXSTU_IMMUNIZ;

prompt
prompt Creating synonym V_TXSTU_INSTRUCTOR
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_INSTRUCTOR
  for WACOISDDATA.V_TXSTU_INSTRUCTOR;

prompt
prompt Creating synonym V_TXSTU_REGISTRATION
prompt =====================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_REGISTRATION
  for WACOISDDATA.V_TXSTU_REGISTRATION;

prompt
prompt Creating synonym V_TXSTU_STU_CAMPUS_MASTER
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_TXSTU_STU_CAMPUS_MASTER
  for WACOISDDATA.V_TXSTU_STU_CAMPUS_MASTER;

prompt
prompt Creating synonym V_USER_APP_LIST
prompt ================================
prompt
create or replace synonym WACOISDAPP.V_USER_APP_LIST
  for WACOISDDATA.V_USER_APP_LIST;

prompt
prompt Creating synonym V_USER_CAMPUS_MASTER_LIST
prompt ==========================================
prompt
create or replace synonym WACOISDAPP.V_USER_CAMPUS_MASTER_LIST
  for WACOISDDATA.V_USER_CAMPUS_MASTER_LIST;

prompt
prompt Creating synonym V_USER_REPORT_LIST
prompt ===================================
prompt
create or replace synonym WACOISDAPP.V_USER_REPORT_LIST
  for WACOISDDATA.V_USER_REPORT_LIST;


spool off
