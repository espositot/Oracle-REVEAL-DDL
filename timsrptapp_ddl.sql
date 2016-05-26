-----------------------------------------------------------
-- Export file for user TIMSRPTAPP@DATAWH                --
-- Created by espositot on 5/26/2016, 16:52:05 16:52:05  --
-----------------------------------------------------------

set define off
spool timsrptapp_ddl.log

prompt
prompt Creating synonym APPLICATION_V
prompt ==============================
prompt
create or replace synonym TIMSRPTAPP.APPLICATION_V
  for TIMSRPTDATA.APPLICATION_V;

prompt
prompt Creating synonym DATE_DIM
prompt =========================
prompt
create or replace synonym TIMSRPTAPP.DATE_DIM
  for TIMSRPTDATA.DATE_DIM;

prompt
prompt Creating synonym EXECUTION_LOAD_CAMPUS_VW
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.EXECUTION_LOAD_CAMPUS_VW
  for SOMEWHEREISDDATA.EXECUTION_LOAD_CAMPUS_VW;

prompt
prompt Creating synonym MV_TXSTU_BUS_ACCT_SEC_D
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.MV_TXSTU_BUS_ACCT_SEC_D
  for TIMSRPTDATA.MV_TXSTU_BUS_ACCT_SEC_D;

prompt
prompt Creating synonym ORG_DIM
prompt ========================
prompt
create or replace synonym TIMSRPTAPP.ORG_DIM
  for TIMSRPTDATA.ORG_DIM;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.PKG_DWS_INTERVENTION
  for SOMEWHEREISDDATA.PKG_DWS_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_INTERVENTION_NOTE
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.PKG_DWS_INTERVENTION_NOTE
  for SOMEWHEREISDDATA.PKG_DWS_INTERVENTION_NOTE;

prompt
prompt Creating synonym PKG_DWS_INTERV_CATEGORY
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.PKG_DWS_INTERV_CATEGORY
  for SOMEWHEREISDDATA.PKG_DWS_INTERV_CATEGORY;

prompt
prompt Creating synonym PKG_DWS_STUDENT_INTERVENTION
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.PKG_DWS_STUDENT_INTERVENTION
  for SOMEWHEREISDDATA.PKG_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym PKG_DWS_STUDENT_NOTE
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.PKG_DWS_STUDENT_NOTE
  for SOMEWHEREISDDATA.PKG_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym PKG_IDMGR_DISTRICT
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.PKG_IDMGR_DISTRICT
  for TIMSRPTDATA.PKG_IDMGR_DISTRICT;

prompt
prompt Creating synonym PKG_IDMGR_USER_ACCOUNT
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.PKG_IDMGR_USER_ACCOUNT
  for TIMSRPTDATA.PKG_IDMGR_USER_ACCOUNT;

prompt
prompt Creating synonym PKG_REVEAL_SECURITY
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.PKG_REVEAL_SECURITY
  for FIZZBIN.PKG_REVEAL_SECURITY;

prompt
prompt Creating synonym PKG_RPT_DATA_SOURCE
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.PKG_RPT_DATA_SOURCE
  for TIMSRPTDATA.PKG_RPT_DATA_SOURCE;

prompt
prompt Creating synonym PKG_SV_ACCT_MGMT
prompt =================================
prompt
create or replace synonym TIMSRPTAPP.PKG_SV_ACCT_MGMT
  for TIMSRPTDATA.PKG_SV_ACCT_MGMT;

prompt
prompt Creating synonym PKG_SV_SECURITY
prompt ================================
prompt
create or replace synonym TIMSRPTAPP.PKG_SV_SECURITY
  for TIMSRPTDATA.PKG_SV_SECURITY;

prompt
prompt Creating synonym PKG_TIMS_DATAMART
prompt ==================================
prompt
create or replace synonym TIMSRPTAPP.PKG_TIMS_DATAMART
  for TIMSRPTDATA.PKG_TIMS_DATAMART;

prompt
prompt Creating synonym SECURITY_QUESTION_USER_V
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.SECURITY_QUESTION_USER_V
  for TIMSRPTDATA.SECURITY_QUESTION_USER_V;

prompt
prompt Creating synonym USER_ACCOUNT_V
prompt ===============================
prompt
create or replace synonym TIMSRPTAPP.USER_ACCOUNT_V
  for TIMSRPTDATA.USER_ACCOUNT_V;

prompt
prompt Creating synonym USER_APPS_ROLES_V
prompt ==================================
prompt
create or replace synonym TIMSRPTAPP.USER_APPS_ROLES_V
  for TIMSRPTDATA.USER_APPS_ROLES_V;

prompt
prompt Creating synonym V_DWS_ALL_RISK_FACTORS
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_ALL_RISK_FACTORS
  for SOMEWHEREISDDATA.V_DWS_ALL_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_CAMPUS_RISK_FACTOR_SUM
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_CAMPUS_RISK_FACTOR_SUM
  for SOMEWHEREISDDATA.V_DWS_CAMPUS_RISK_FACTOR_SUM;

prompt
prompt Creating synonym V_DWS_CHAMPIONS_LIST
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_CHAMPIONS_LIST
  for SOMEWHEREISDDATA.V_DWS_CHAMPIONS_LIST;

prompt
prompt Creating synonym V_DWS_CREDITS_DETAIL
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_CREDITS_DETAIL
  for SOMEWHEREISDDATA.V_DWS_CREDITS_DETAIL;

prompt
prompt Creating synonym V_DWS_CREDITS_SUMMARY
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_CREDITS_SUMMARY
  for SOMEWHEREISDDATA.V_DWS_CREDITS_SUMMARY;

prompt
prompt Creating synonym V_DWS_CURR_RISK_FACTORS
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_CURR_RISK_FACTORS
  for SOMEWHEREISDDATA.V_DWS_CURR_RISK_FACTORS;

prompt
prompt Creating synonym V_DWS_DISC_ACT_DETAIL
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_DISC_ACT_DETAIL
  for SOMEWHEREISDDATA.V_DWS_DISC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_ACT_DETAIL
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_DISC_INC_ACT_DETAIL
  for SOMEWHEREISDDATA.V_DWS_DISC_INC_ACT_DETAIL;

prompt
prompt Creating synonym V_DWS_DISC_INC_DETAIL
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_DISC_INC_DETAIL
  for SOMEWHEREISDDATA.V_DWS_DISC_INC_DETAIL;

prompt
prompt Creating synonym V_DWS_ENROLLMENT_HISTORY
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_ENROLLMENT_HISTORY
  for SOMEWHEREISDDATA.V_DWS_ENROLLMENT_HISTORY;

prompt
prompt Creating synonym V_DWS_GRADES_DETAIL
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_GRADES_DETAIL
  for SOMEWHEREISDDATA.V_DWS_GRADES_DETAIL;

prompt
prompt Creating synonym V_DWS_INTERVENTION
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_INTERVENTION
  for SOMEWHEREISDDATA.V_DWS_INTERVENTION;

prompt
prompt Creating synonym V_DWS_INTERVENTION_CATEGORY
prompt ============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_INTERVENTION_CATEGORY
  for SOMEWHEREISDDATA.V_DWS_INTERVENTION_CATEGORY;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTES
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_INTERVENTION_NOTES
  for SOMEWHEREISDDATA.V_DWS_INTERVENTION_NOTES;

prompt
prompt Creating synonym V_DWS_INTERVENTION_NOTE_TYPE
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_INTERVENTION_NOTE_TYPE
  for SOMEWHEREISDDATA.V_DWS_INTERVENTION_NOTE_TYPE;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_DETAIL
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_PERIOD_ABS_DETAIL
  for SOMEWHEREISDDATA.V_DWS_PERIOD_ABS_DETAIL;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_PERIOD_ABS_SUM
  for SOMEWHEREISDDATA.V_DWS_PERIOD_ABS_SUM;

prompt
prompt Creating synonym V_DWS_PERIOD_ABS_SUM_RPT
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_PERIOD_ABS_SUM_RPT
  for SOMEWHEREISDDATA.V_DWS_PERIOD_ABS_SUM_RPT;

prompt
prompt Creating synonym V_DWS_RECENTLY_ADDED_STUDENTS
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_RECENTLY_ADDED_STUDENTS
  for SOMEWHEREISDDATA.V_DWS_RECENTLY_ADDED_STUDENTS;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_FLOW
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_RISK_FACTOR_FLOW
  for SOMEWHEREISDDATA.V_DWS_RISK_FACTOR_FLOW;

prompt
prompt Creating synonym V_DWS_RISK_FACTOR_HISTORY
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_RISK_FACTOR_HISTORY
  for SOMEWHEREISDDATA.V_DWS_RISK_FACTOR_HISTORY;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION
prompt ===========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STUDENT_INTERVENTION
  for SOMEWHEREISDDATA.V_DWS_STUDENT_INTERVENTION;

prompt
prompt Creating synonym V_DWS_STUDENT_INTERVENTION_IR
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STUDENT_INTERVENTION_IR
  for SOMEWHEREISDDATA.V_DWS_STUDENT_INTERVENTION_IR;

prompt
prompt Creating synonym V_DWS_STUDENT_MASTER
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STUDENT_MASTER
  for SOMEWHEREISDDATA.V_DWS_STUDENT_MASTER;

prompt
prompt Creating synonym V_DWS_STUDENT_NOTE
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STUDENT_NOTE
  for SOMEWHEREISDDATA.V_DWS_STUDENT_NOTE;

prompt
prompt Creating synonym V_DWS_STUDENT_RISK_FACTOR_LIST
prompt ===============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STUDENT_RISK_FACTOR_LIST
  for SOMEWHEREISDDATA.V_DWS_STUDENT_RISK_FACTOR_LIST;

prompt
prompt Creating synonym V_DWS_STU_INTERVENTION_STATUS
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STU_INTERVENTION_STATUS
  for SOMEWHEREISDDATA.V_DWS_STU_INTERVENTION_STATUS;

prompt
prompt Creating synonym V_DWS_STU_RISK_HISTOGRAM
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_STU_RISK_HISTOGRAM
  for SOMEWHEREISDDATA.V_DWS_STU_RISK_HISTOGRAM;

prompt
prompt Creating synonym V_DWS_WKLY_ATTENDANCE_RF_CNT
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_DWS_WKLY_ATTENDANCE_RF_CNT
  for SOMEWHEREISDDATA.V_DWS_WKLY_ATTENDANCE_RF_CNT;

prompt
prompt Creating synonym V_ENROLLMENT_BY_CAMPUS
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_ENROLLMENT_BY_CAMPUS
  for TIMSRPTDATA.V_ENROLLMENT_BY_CAMPUS;

prompt
prompt Creating synonym V_ENROLLMENT_BY_DISTRICT
prompt =========================================
prompt
create or replace synonym TIMSRPTAPP.V_ENROLLMENT_BY_DISTRICT
  for TIMSRPTDATA.V_ENROLLMENT_BY_DISTRICT;

prompt
prompt Creating synonym V_ENROLLMENT_BY_ETHNICITY
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_ENROLLMENT_BY_ETHNICITY
  for TIMSRPTDATA.V_ENROLLMENT_BY_ETHNICITY;

prompt
prompt Creating synonym V_ENROLLMENT_BY_GENDER
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_ENROLLMENT_BY_GENDER
  for TIMSRPTDATA.V_ENROLLMENT_BY_GENDER;

prompt
prompt Creating synonym V_ENROLLMENT_BY_GRADE_LVL
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_ENROLLMENT_BY_GRADE_LVL
  for TIMSRPTDATA.V_ENROLLMENT_BY_GRADE_LVL;

prompt
prompt Creating synonym V_IDMGR_APP_ROLE
prompt =================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_APP_ROLE
  for TIMSRPTDATA.V_IDMGR_APP_ROLE;

prompt
prompt Creating synonym V_IDMGR_CAMPUS_MASTER
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_CAMPUS_MASTER
  for TIMSRPTDATA.V_IDMGR_CAMPUS_MASTER;

prompt
prompt Creating synonym V_IDMGR_LOGIN_MESSAGE
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_LOGIN_MESSAGE
  for TIMSRPTDATA.V_IDMGR_LOGIN_MESSAGE;

prompt
prompt Creating synonym V_IDMGR_REPORT_CATG_ALL
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_REPORT_CATG_ALL
  for TIMSRPTDATA.V_IDMGR_REPORT_CATG_ALL;

prompt
prompt Creating synonym V_IDMGR_REPORT_LIST
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_REPORT_LIST
  for TIMSRPTDATA.V_IDMGR_REPORT_LIST;

prompt
prompt Creating synonym V_IDMGR_SECURITY_QUESTION
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_SECURITY_QUESTION
  for TIMSRPTDATA.V_IDMGR_SECURITY_QUESTION;

prompt
prompt Creating synonym V_IDMGR_SECURITY_TRANS_LOG
prompt ===========================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_SECURITY_TRANS_LOG
  for TIMSRPTDATA.V_IDMGR_SECURITY_TRANS_LOG;

prompt
prompt Creating synonym V_IDMGR_SEC_USERS_LIST_FILTER
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_SEC_USERS_LIST_FILTER
  for TIMSRPTDATA.V_IDMGR_SEC_USERS_LIST_FILTER;

prompt
prompt Creating synonym V_IDMGR_TXEIS_REPORT_CATG_ALL
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_TXEIS_REPORT_CATG_ALL
  for TIMSRPTDATA.V_IDMGR_TXEIS_REPORT_CATG_ALL;

prompt
prompt Creating synonym V_IDMGR_USER_ACCT_COLUMN_AUTH
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_ACCT_COLUMN_AUTH
  for TIMSRPTDATA.V_IDMGR_USER_ACCT_COLUMN_AUTH;

prompt
prompt Creating synonym V_IDMGR_USER_CAMPUS
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_CAMPUS
  for TIMSRPTDATA.V_IDMGR_USER_CAMPUS;

prompt
prompt Creating synonym V_IDMGR_USER_REPORT
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_REPORT
  for TIMSRPTDATA.V_IDMGR_USER_REPORT;

prompt
prompt Creating synonym V_IDMGR_USER_REPORT_CATEGORY
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_REPORT_CATEGORY
  for TIMSRPTDATA.V_IDMGR_USER_REPORT_CATEGORY;

prompt
prompt Creating synonym V_IDMGR_USER_ROLE
prompt ==================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_ROLE
  for TIMSRPTDATA.V_IDMGR_USER_ROLE;

prompt
prompt Creating synonym V_IDMGR_USER_TXEIS_BUS_ACT_PRM
prompt ===============================================
prompt
create or replace synonym TIMSRPTAPP.V_IDMGR_USER_TXEIS_BUS_ACT_PRM
  for TIMSRPTDATA.V_IDMGR_USER_TXEIS_BUS_ACT_PRM;

prompt
prompt Creating synonym V_P80_STUDENT_CATE_ATTEND
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_P80_STUDENT_CATE_ATTEND
  for TIMSRPTDATA.V_P80_STUDENT_CATE_ATTEND;

prompt
prompt Creating synonym V_REPORTER_DATA_AS_OF_DATE
prompt ===========================================
prompt
create or replace synonym TIMSRPTAPP.V_REPORTER_DATA_AS_OF_DATE
  for TIMSRPTDATA.V_REPORTER_DATA_AS_OF_DATE;

prompt
prompt Creating synonym V_SCHOOL_YEAR
prompt ==============================
prompt
create or replace synonym TIMSRPTAPP.V_SCHOOL_YEAR
  for TIMSRPTDATA.V_SCHOOL_YEAR;

prompt
prompt Creating synonym V_SOURCE
prompt =========================
prompt
create or replace synonym TIMSRPTAPP.V_SOURCE
  for TIMSRPTDATA.V_SOURCE;

prompt
prompt Creating synonym V_TIMS_ISSUE
prompt =============================
prompt
create or replace synonym TIMSRPTAPP.V_TIMS_ISSUE
  for TIMSRPTDATA.V_TIMS_ISSUE;

prompt
prompt Creating synonym V_TIMS_ISSUE_HISTORY
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_TIMS_ISSUE_HISTORY
  for TIMSRPTDATA.V_TIMS_ISSUE_HISTORY;

prompt
prompt Creating synonym V_TIMS_ISSUE_TRANSITION
prompt ========================================
prompt
create or replace synonym TIMSRPTAPP.V_TIMS_ISSUE_TRANSITION
  for TIMSRPTDATA.V_TIMS_ISSUE_TRANSITION;

prompt
prompt Creating synonym V_TXBUS_ACCT_SECURITY
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_TXBUS_ACCT_SECURITY
  for TIMSRPTDATA.V_TXBUS_ACCT_SECURITY;

prompt
prompt Creating synonym V_TXBUS_ACCT_SECURITY_IMPORT
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXBUS_ACCT_SECURITY_IMPORT
  for TIMSRPTDATA.V_TXBUS_ACCT_SECURITY_IMPORT;

prompt
prompt Creating synonym V_TXFIN_BFN_OPTIONS
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_BFN_OPTIONS
  for TIMSRPTDATA.V_TXFIN_BFN_OPTIONS;

prompt
prompt Creating synonym V_TXFIN_GL
prompt ===========================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_GL
  for TIMSRPTDATA.V_TXFIN_GL;

prompt
prompt Creating synonym V_TXFIN_GL_JE_TRANS
prompt ====================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_GL_JE_TRANS
  for TIMSRPTDATA.V_TXFIN_GL_JE_TRANS;

prompt
prompt Creating synonym V_TXFIN_REQ_PO_VEN_ITM_ACCT
prompt ============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_REQ_PO_VEN_ITM_ACCT
  for TIMSRPTDATA.V_TXFIN_REQ_PO_VEN_ITM_ACCT;

prompt
prompt Creating synonym V_TXFIN_REQ_PO_VEN_ITM_MASTR
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_REQ_PO_VEN_ITM_MASTR
  for TIMSRPTDATA.V_TXFIN_REQ_PO_VEN_ITM_MASTR;

prompt
prompt Creating synonym V_TXFIN_REV_BOARD_RPT
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_REV_BOARD_RPT
  for TIMSRPTDATA.V_TXFIN_REV_BOARD_RPT;

prompt
prompt Creating synonym V_TXFIN_REV_CASH_RECEIPTS
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_REV_CASH_RECEIPTS
  for TIMSRPTDATA.V_TXFIN_REV_CASH_RECEIPTS;

prompt
prompt Creating synonym V_TXFIN_REV_YR_OVER_YR
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_TXFIN_REV_YR_OVER_YR
  for TIMSRPTDATA.V_TXFIN_REV_YR_OVER_YR;

prompt
prompt Creating synonym V_TXSEC_SEC_USERS_LIST_FILTER
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSEC_SEC_USERS_LIST_FILTER
  for TIMSRPTDATA.V_TXSEC_SEC_USERS_LIST_FILTER;

prompt
prompt Creating synonym V_TXSEC_SEC_USER_CAMPUS_LIST
prompt =============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSEC_SEC_USER_CAMPUS_LIST
  for TIMSRPTDATA.V_TXSEC_SEC_USER_CAMPUS_LIST;

prompt
prompt Creating synonym V_TXSTU_ATT_STU_ENROLL_DETAIL
prompt ==============================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_ATT_STU_ENROLL_DETAIL
  for TIMSRPTDATA.V_TXSTU_ATT_STU_ENROLL_DETAIL;

prompt
prompt Creating synonym V_TXSTU_CONTACT_PARENT
prompt =======================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_CONTACT_PARENT
  for TIMSRPTDATA.V_TXSTU_CONTACT_PARENT;

prompt
prompt Creating synonym V_TXSTU_DISCIPLINE
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_DISCIPLINE
  for TIMSRPTDATA.V_TXSTU_DISCIPLINE;

prompt
prompt Creating synonym V_TXSTU_GRADEBK_LOGIN
prompt ======================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_GRADEBK_LOGIN
  for TIMSRPTDATA.V_TXSTU_GRADEBK_LOGIN;

prompt
prompt Creating synonym V_TXSTU_GRADES
prompt ===============================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_GRADES
  for TIMSRPTDATA.V_TXSTU_GRADES;

prompt
prompt Creating synonym V_TXSTU_IMMUNIZ
prompt ================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_IMMUNIZ
  for TIMSRPTDATA.V_TXSTU_IMMUNIZ;

prompt
prompt Creating synonym V_TXSTU_INSTRUCTOR
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_INSTRUCTOR
  for TIMSRPTDATA.V_TXSTU_INSTRUCTOR;

prompt
prompt Creating synonym V_TXSTU_REGISTRATION
prompt =====================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_REGISTRATION
  for TIMSRPTDATA.V_TXSTU_REGISTRATION;

prompt
prompt Creating synonym V_TXSTU_STU_CAMPUS_MASTER
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_TXSTU_STU_CAMPUS_MASTER
  for TIMSRPTDATA.V_TXSTU_STU_CAMPUS_MASTER;

prompt
prompt Creating synonym V_USER_APP_LIST
prompt ================================
prompt
create or replace synonym TIMSRPTAPP.V_USER_APP_LIST
  for TIMSRPTDATA.V_USER_APP_LIST;

prompt
prompt Creating synonym V_USER_CAMPUS_MASTER_LIST
prompt ==========================================
prompt
create or replace synonym TIMSRPTAPP.V_USER_CAMPUS_MASTER_LIST
  for TIMSRPTDATA.V_USER_CAMPUS_MASTER_LIST;

prompt
prompt Creating synonym V_USER_REPORT_LIST
prompt ===================================
prompt
create or replace synonym TIMSRPTAPP.V_USER_REPORT_LIST
  for TIMSRPTDATA.V_USER_REPORT_LIST;


spool off
