-----------------------------------------------------------
-- Export file for user FIZZBIN@DATAWH                   --
-- Created by espositot on 5/26/2016, 15:47:14 15:47:14  --
-----------------------------------------------------------

set define off
spool fizzbin_ddl.log

prompt
prompt Creating package PKG_REVEAL_SECURITY
prompt ====================================
prompt
CREATE OR REPLACE PACKAGE FIZZBIN."PKG_REVEAL_SECURITY"
AS

PROCEDURE prc_set_context;

PROCEDURE prc_set_context_manual (v_user IN VARCHAR2);

PROCEDURE prc_clear_context;

END PKG_REVEAL_SECURITY ;
/

prompt
prompt Creating package body PKG_REVEAL_SECURITY
prompt =========================================
prompt
CREATE OR REPLACE PACKAGE BODY FIZZBIN.PKG_REVEAL_SECURITY
AS
-- set the context for the APEX application user --
PROCEDURE prc_set_context IS
BEGIN
 dbms_session.set_context
         (namespace => 'REVEAL_CTX'
         ,attribute => 'USER_NAME'
         ,value     => v('APP_USER')
         ,client_id => sys_context('USERENV','CLIENT_IDENTIFIER'));
 dbms_session.set_identifier( sys_context('USERENV','CLIENT_IDENTIFIER') );
END prc_set_context;
-- set the context for a manually connected user --
PROCEDURE prc_set_context_manual (v_user IN VARCHAR2) IS
BEGIN
 dbms_session.set_context
         (namespace => 'REVEAL_CTX'
         ,attribute => 'USER_NAME'
         ,value     => v_user
         ,client_id => v_user||':'||sys_context('USERENV','SID'));
 dbms_session.set_identifier( v_user||':'||sys_context('USERENV','SID') );
END prc_set_context_manual;
-- clear the global context for a connected user --
PROCEDURE prc_clear_context IS
BEGIN
 dbms_session.clear_identifier ( );
 dbms_session.clear_context('REVEAL_CTX',sys_context('USERENV','CLIENT_IDENTIFIER'));
END prc_clear_context;

END PKG_REVEAL_SECURITY;
/


spool off
