-----------------------------------------------------------
-- Export file for user ALLEN@DATAWH                     --
-- Created by espositot on 5/26/2016, 15:04:53 15:04:53  --
-----------------------------------------------------------

set define off
spool allen_ddl.log

prompt
prompt Creating table AADD
prompt ===================
prompt
create table ALLEN.AADD
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  code          VARCHAR2(3),
  descript      VARCHAR2(15),
  demerits      NUMBER(2),
  security      NUMBER(1),
  credit        VARCHAR2(1),
  affectelig    VARCHAR2(1),
  reserved      VARCHAR2(5),
  altcode       VARCHAR2(4),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AADD_SASI_SCH on ALLEN.AADD (ETL_SASI_SCH)
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
prompt Creating table AATC
prompt ===================
prompt
create table ALLEN.AATC
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  calendate     DATE,
  holiday       VARCHAR2(1),
  tracks        VARCHAR2(9),
  reserved      VARCHAR2(17),
  filler        VARCHAR2(35),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AATC_HOLIDAY on ALLEN.AATC (HOLIDAY)
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
create bitmap index ALLEN.BIX_AATC_SASI_SCH on ALLEN.AATC (ETL_SASI_SCH)
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
create bitmap index ALLEN.BIX_AATC_SCHOOLNUM on ALLEN.AATC (SCHOOLNUM)
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
prompt Creating table AATG
prompt ===================
prompt
create table ALLEN.AATG
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  permnum       VARCHAR2(12),
  sequence      NUMBER(4),
  stulink       NUMBER(5),
  absdate       VARCHAR2(32),
  daycode       VARCHAR2(1),
  daycode2      VARCHAR2(1),
  daytitle      VARCHAR2(10),
  daytitle2     VARCHAR2(10),
  dayabbrev     VARCHAR2(3),
  dayabbrev2    VARCHAR2(3),
  abstype       NUMBER(1),
  abstype2      NUMBER(1),
  absdesc       VARCHAR2(30),
  absdesc2      VARCHAR2(30),
  per1abs       VARCHAR2(1),
  per1absty     NUMBER(1),
  per2abs       VARCHAR2(1),
  per2absty     NUMBER(1),
  per3abs       VARCHAR2(1),
  per3absty     NUMBER(1),
  per4abs       VARCHAR2(1),
  per4absty     NUMBER(1),
  per5abs       VARCHAR2(1),
  per5absty     NUMBER(1),
  per6abs       VARCHAR2(1),
  per6absty     NUMBER(1),
  per7abs       VARCHAR2(1),
  per7absty     NUMBER(1),
  per8abs       VARCHAR2(1),
  per8absty     NUMBER(1),
  per9abs       VARCHAR2(1),
  per9absty     NUMBER(1),
  per10abs      VARCHAR2(1),
  per10absty    NUMBER(1),
  per11abs      VARCHAR2(1),
  per11absty    NUMBER(1),
  per12abs      VARCHAR2(1),
  per12absty    NUMBER(1),
  per13abs      VARCHAR2(1),
  per13absty    NUMBER(1),
  per14abs      VARCHAR2(1),
  per14absty    NUMBER(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 22M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AATG_SASI_SCH on ALLEN.AATG (ETL_SASI_SCH)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table AATR
prompt ===================
prompt
create table ALLEN.AATR
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  code          CHAR(1),
  title         VARCHAR2(20),
  abbrev        VARCHAR2(10),
  type          NUMBER(1),
  rcvapport     CHAR(1),
  inclltrs      CHAR(1),
  incldialer    CHAR(1),
  inclrpts      CHAR(1),
  affectelig    CHAR(1),
  reserved      CHAR(1),
  filler        CHAR(1),
  absgrp        CHAR(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
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
prompt Creating table ACLH
prompt ===================
prompt
create table ALLEN.ACLH
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  classlink     NUMBER(4),
  course        VARCHAR2(14),
  tchnum        NUMBER(3),
  sequence      NUMBER(3),
  startdate     VARCHAR2(32),
  enddate       VARCHAR2(32),
  tchaide       VARCHAR2(1),
  adddroptag    VARCHAR2(1),
  overtermcd    VARCHAR2(2),
  inclgrade     VARCHAR2(1),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  linkcode      VARCHAR2(1),
  linktype      VARCHAR2(4),
  reserved      VARCHAR2(5),
  filler        VARCHAR2(10),
  usercd1       VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 8M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ACLH_SASI_SCH on ALLEN.ACLH (ETL_SASI_SCH)
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
prompt Creating table ACLS
prompt ===================
prompt
create table ALLEN.ACLS
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  classlink     NUMBER(4),
  startdate     VARCHAR2(32),
  enddate       VARCHAR2(32),
  tchaide       VARCHAR2(1),
  addtag        VARCHAR2(1),
  mrggrdcrs     VARCHAR2(14),
  overtermcd    VARCHAR2(2),
  overfa        VARCHAR2(2),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  linkcode      VARCHAR2(1),
  linktype      VARCHAR2(4),
  reserved      VARCHAR2(5),
  filler        VARCHAR2(10),
  workbased     VARCHAR2(1),
  usercode1     VARCHAR2(30),
  usercode2     VARCHAR2(30),
  usercode3     VARCHAR2(30),
  usercode4     VARCHAR2(30),
  userdate1     VARCHAR2(32),
  userdate2     VARCHAR2(32),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 26M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ACLS_SASI_SCH on ALLEN.ACLS (ETL_SASI_SCH)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ACRS
prompt ===================
prompt
create table ALLEN.ACRS
(
  etl_sasi_sch  CHAR(3),
  etl_sasi_year CHAR(1),
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  course        VARCHAR2(14),
  effdate       VARCHAR2(32),
  expdate       VARCHAR2(32),
  narrdesc      VARCHAR2(10),
  title         VARCHAR2(18),
  longtitle     VARCHAR2(40),
  nonacadem     VARCHAR2(1),
  gpaweight     VARCHAR2(1),
  subjarea1     VARCHAR2(3),
  subjarea2     VARCHAR2(3),
  subjarea3     VARCHAR2(3),
  department    VARCHAR2(4),
  crtype        VARCHAR2(1),
  statecrs1     VARCHAR2(10),
  statecrs2     VARCHAR2(10),
  altcrs1       VARCHAR2(14),
  altcrs2       VARCHAR2(14),
  masschgcrs    VARCHAR2(14),
  credvalue     NUMBER(6,3),
  maxcredits    NUMBER(6,3),
  fee1          NUMBER(6,2),
  fee2          NUMBER(6,2),
  duration      VARCHAR2(2),
  lowgrade      VARCHAR2(2),
  highgrade     VARCHAR2(2),
  genderrest    VARCHAR2(1),
  excltag       VARCHAR2(2),
  cbedsgrp      VARCHAR2(1),
  cbedsvoced    VARCHAR2(1),
  sectnum       NUMBER(3),
  timestruct    VARCHAR2(16),
  ssopt         NUMBER(3),
  ssmax         NUMBER(3),
  ssvar         NUMBER(3),
  ssincr        NUMBER(3),
  tchnum        NUMBER(2),
  termdur       NUMBER(2),
  nrsect        NUMBER(2),
  unused1       NUMBER(2),
  schedprio     NUMBER(1),
  trpriority    VARCHAR2(1),
  requelect     VARCHAR2(1),
  duplicates    VARCHAR2(1),
  prereq        VARCHAR2(14),
  qualaid       VARCHAR2(1),
  category      VARCHAR2(2),
  collarea1     VARCHAR2(3),
  collarea2     VARCHAR2(3),
  collarea3     VARCHAR2(3),
  univarea1     VARCHAR2(3),
  univarea2     VARCHAR2(3),
  univarea3     VARCHAR2(3),
  colprep       VARCHAR2(1),
  voccourse     VARCHAR2(14),
  vocprogid     VARCHAR2(7),
  scholar       VARCHAR2(2),
  comp1         NUMBER(2),
  comp2         NUMBER(2),
  comp3         NUMBER(2),
  comp4         NUMBER(2),
  regentscrs    VARCHAR2(1),
  esl           VARCHAR2(3),
  appcategry    VARCHAR2(3),
  crstype       VARCHAR2(3),
  prof_core     VARCHAR2(1),
  spterm        VARCHAR2(156),
  trvector      VARCHAR2(20),
  crsgroups     VARCHAR2(12),
  reqprior      VARCHAR2(1),
  clarray       VARCHAR2(32),
  csarray       VARCHAR2(32),
  usercode1     VARCHAR2(4),
  usercode2     VARCHAR2(4),
  usercode3     VARCHAR2(8),
  usercode4     VARCHAR2(8),
  instrlang     VARCHAR2(3),
  gdonrpt       VARCHAR2(1),
  gdontrans     VARCHAR2(1),
  subjclsatt    VARCHAR2(1),
  instrtype     VARCHAR2(3),
  fundprgcd     NUMBER(4),
  qbecatgcd     VARCHAR2(2),
  subjarea4     VARCHAR2(3),
  subjarea5     VARCHAR2(3),
  usercode5     VARCHAR2(12),
  usercode6     VARCHAR2(12),
  usercode7     VARCHAR2(12),
  usercode8     VARCHAR2(12),
  usercode9     VARCHAR2(12),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  filler        VARCHAR2(70),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ACRS_SASI_SCH on ALLEN.ACRS (ETL_SASI_SCH)
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
prompt Creating table ADF1
prompt ===================
prompt
create table ALLEN.ADF1
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  filecode      VARCHAR2(4),
  qualified     VARCHAR2(1),
  vieworder     NUMBER(3),
  mastersub     VARCHAR2(1),
  filetype      VARCHAR2(2),
  descript      VARCHAR2(30),
  dfltfield     VARCHAR2(20),
  dfltkey       VARCHAR2(10),
  distown       VARCHAR2(1),
  nightxfr      VARCHAR2(1),
  schoolxfr     VARCHAR2(1),
  crtblank      VARCHAR2(1),
  domain        VARCHAR2(1),
  dfltaccess    VARCHAR2(1),
  accesslock    VARCHAR2(1),
  tchqual       VARCHAR2(1),
  sasi3type     VARCHAR2(2),
  sasi3sec      VARCHAR2(1),
  dbaseonly     VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table ADF2
prompt ===================
prompt
create table ALLEN.ADF2
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  filecode      VARCHAR2(4),
  fieldseq      NUMBER(4),
  intfldname    VARCHAR2(20),
  intfldnum     NUMBER(4),
  fieldname     VARCHAR2(10),
  fieldid       VARCHAR2(2),
  descript      VARCHAR2(30),
  fieldlevel    VARCHAR2(1),
  fieldtype     VARCHAR2(1),
  actsize       NUMBER(3),
  actdec        NUMBER(1),
  editsize      NUMBER(3),
  editdec       NUMBER(1),
  editcode      VARCHAR2(1),
  mandatory     VARCHAR2(1),
  relfile       VARCHAR2(4),
  reltable      VARCHAR2(3),
  colsize       NUMBER(3),
  colhead       VARCHAR2(30),
  formhead      VARCHAR2(30),
  vieword       NUMBER(3),
  groupnum      NUMBER(3),
  distown       VARCHAR2(1),
  distupdt      VARCHAR2(1),
  schoolxfr     VARCHAR2(1),
  domain        VARCHAR2(1),
  dfltaccess    VARCHAR2(1),
  accesslock    VARCHAR2(1),
  dfltvalue     VARCHAR2(30),
  minvalue      VARCHAR2(30),
  maxvalue      VARCHAR2(30),
  occurs        NUMBER(4),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table ADF3
prompt ===================
prompt
create table ALLEN.ADF3
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  filecode      VARCHAR2(4),
  fieldseq      NUMBER(4),
  valueseq      NUMBER(3),
  value         VARCHAR2(30),
  descript      VARCHAR2(30),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table ADF4
prompt ===================
prompt
create table ALLEN.ADF4
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  filecode      VARCHAR2(4),
  keyseq        NUMBER(3),
  keyname       VARCHAR2(10),
  vieword       NUMBER(2),
  uniquekey     VARCHAR2(1),
  descend       VARCHAR2(1),
  field1        VARCHAR2(20),
  upper1        VARCHAR2(1),
  field2        VARCHAR2(20),
  upper2        VARCHAR2(1),
  field3        VARCHAR2(20),
  upper3        VARCHAR2(1),
  field4        VARCHAR2(20),
  upper4        VARCHAR2(1),
  field5        VARCHAR2(20),
  upper5        VARCHAR2(1),
  spclodbc      VARCHAR2(1),
  aggreg1       VARCHAR2(1),
  aggreg2       VARCHAR2(1),
  aggreg3       VARCHAR2(1),
  aggreg4       VARCHAR2(1),
  aggreg5       VARCHAR2(1),
  r10_loaddate  DATE
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
prompt Creating table ADIS
prompt ===================
prompt
create table ALLEN.ADIS
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  comments      VARCHAR2(4000),
  sequence      NUMBER(3),
  desccode      VARCHAR2(3),
  reportdate    VARCHAR2(32),
  dispcode      VARCHAR2(4),
  dispstrtdt    VARCHAR2(32),
  dispenddt     VARCHAR2(32),
  dispdays      NUMBER(5,1),
  disphrs       NUMBER(5,1),
  demerits      NUMBER(3),
  security      NUMBER(1),
  referredby    VARCHAR2(15),
  referdate     VARCHAR2(32),
  actionby      VARCHAR2(15),
  code          VARCHAR2(3),
  tag           VARCHAR2(1),
  timein        NUMBER(4),
  timeout       NUMBER(4),
  reserved      VARCHAR2(5),
  filler        VARCHAR2(10),
  zone          VARCHAR2(6),
  incidentid    VARCHAR2(25),
  altdiscode    VARCHAR2(4),
  prevact       VARCHAR2(4),
  prevact2      VARCHAR2(4),
  incidloc      VARCHAR2(4),
  tchconf       VARCHAR2(1),
  actdislen     NUMBER(3),
  lendiffrsn    VARCHAR2(2),
  discampus     VARCHAR2(10),
  incdcontxt    VARCHAR2(1),
  incnum        NUMBER(3),
  dispdesc      VARCHAR2(20),
  dispnum       NUMBER(2),
  reportfn      VARCHAR2(20),
  reportln      VARCHAR2(30),
  discode1      VARCHAR2(12),
  discode2      VARCHAR2(12),
  discode3      VARCHAR2(12),
  discode4      VARCHAR2(12),
  discode5      VARCHAR2(12),
  statenum      VARCHAR2(10),
  disschnum     VARCHAR2(3),
  crimcharge    VARCHAR2(2),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ADIS_SASI_SCH on ALLEN.ADIS (ETL_SASI_SCH)
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
prompt Creating table ADPO
prompt ===================
prompt
create table ALLEN.ADPO
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  incidentid    NUMBER(3),
  sequence      NUMBER(3),
  dispcode      VARCHAR2(4),
  dispstrtdt    VARCHAR2(32),
  dispenddt     VARCHAR2(32),
  actionby      VARCHAR2(15),
  comments      VARCHAR2(100),
  dispdays      NUMBER(5,1),
  disphrs       NUMBER(5,1),
  timein        NUMBER(4),
  timeout       NUMBER(4),
  prevact       VARCHAR2(4),
  prevact2      VARCHAR2(4),
  incidloc      VARCHAR2(4),
  tchconf       VARCHAR2(1),
  actdislen     NUMBER(3),
  lendiffrsn    VARCHAR2(2),
  incdcontxt    VARCHAR2(1),
  dispdesc      VARCHAR2(20),
  dispnum       NUMBER(2),
  discampus     VARCHAR2(10),
  datatype      VARCHAR2(1),
  actionby2     VARCHAR2(15),
  altplace      VARCHAR2(2),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ADPO_SASI_SCH on ALLEN.ADPO (ETL_SASI_SCH)
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
prompt Creating table AENR
prompt ===================
prompt
create table ALLEN.AENR
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year NUMBER(1) not null,
  status        CHAR(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  sequence      NUMBER(3) not null,
  effdate       DATE not null,
  entercode     VARCHAR2(3),
  leavecode     VARCHAR2(3),
  eligada       CHAR(1),
  schoolattn    VARCHAR2(3) not null,
  track         CHAR(1),
  grade         VARCHAR2(2) not null,
  tchnum        NUMBER(3),
  instrset      VARCHAR2(5),
  userpgm1      VARCHAR2(8),
  userpgm2      VARCHAR2(8),
  userpgm3      VARCHAR2(8),
  userpgm4      VARCHAR2(8),
  userpgm5      VARCHAR2(8),
  userpgm6      VARCHAR2(8),
  userpgm7      VARCHAR2(8),
  userpgm8      VARCHAR2(8),
  userpgm9      VARCHAR2(8),
  usernum1      NUMBER(8,2),
  usernum2      NUMBER(8,2),
  usernum3      NUMBER(8,2),
  usernum4      NUMBER(8,2),
  usernum5      NUMBER(8,2),
  transyear     VARCHAR2(2) not null,
  dropreason    VARCHAR2(2),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  reserved      VARCHAR2(20),
  filler        VARCHAR2(41),
  movedto       VARCHAR2(20),
  camefrom      VARCHAR2(20),
  summrecflg    CHAR(1),
  u_date        VARCHAR2(20),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AENR_ENTERCODE on ALLEN.AENR (ENTERCODE)
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
create bitmap index ALLEN.BIX_AENR_LEAVECODE on ALLEN.AENR (LEAVECODE)
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
create bitmap index ALLEN.BIX_AENR_SASI_SCH on ALLEN.AENR (ETL_SASI_SCH)
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
create bitmap index ALLEN.BIX_AENR_SCHOOLATTN on ALLEN.AENR (SCHOOLATTN)
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
prompt Creating table AGRD
prompt ===================
prompt
create table ALLEN.AGRD
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3) not null,
  stulink       NUMBER(5) not null,
  sequence      NUMBER(3) not null,
  course        VARCHAR2(14) not null,
  classlink     NUMBER(4) not null,
  beginprd      VARCHAR2(2) not null,
  endperiod     VARCHAR2(2) not null,
  tchnum        NUMBER(3) not null,
  crdattmpt     NUMBER(6,3),
  track         VARCHAR2(1),
  nextrptper    NUMBER(2),
  termcode      VARCHAR2(2),
  changenum     NUMBER(3),
  tchaide       VARCHAR2(1),
  rptper        NUMBER(2),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 31M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AGRD_SASI_SCH on ALLEN.AGRD (ETL_SASI_SCH)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRD_SCHOOLNUM on ALLEN.AGRD (SCHOOLNUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRD_SEQUENCE on ALLEN.AGRD (SEQUENCE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRD_TERMCODE on ALLEN.AGRD (TERMCODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index ALLEN.IX_AGRD_COURSE on ALLEN.AGRD (COURSE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index ALLEN.IX_AGRD_STULINK on ALLEN.AGRD (STULINK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index ALLEN.IX_AGRD_TCHNUM on ALLEN.AGRD (TCHNUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table AGRE
prompt ===================
prompt
create table ALLEN.AGRE
(
  etl_sasi_sch  CHAR(3),
  etl_sasi_year CHAR(1),
  status        CHAR(1),
  schoolnum     VARCHAR2(3),
  altnumber     VARCHAR2(10),
  schoolabrv    VARCHAR2(5),
  name          VARCHAR2(35),
  address       VARCHAR2(35),
  city          VARCHAR2(24),
  state         VARCHAR2(2),
  zipcode       VARCHAR2(10),
  permit        VARCHAR2(20),
  permitcty     VARCHAR2(30),
  reporttit     VARCHAR2(30),
  periodbeg     VARCHAR2(10),
  periodend     VARCHAR2(10),
  schoolmsg1    VARCHAR2(80),
  schoolmsg2    VARCHAR2(80),
  mrk1hd1       VARCHAR2(4),
  mrk1hd2       VARCHAR2(4),
  mrk2hd1       VARCHAR2(4),
  mrk2hd2       VARCHAR2(4),
  mrk3hd1       VARCHAR2(4),
  mrk3hd2       VARCHAR2(4),
  mrk4hd1       VARCHAR2(4),
  mrk4hd2       VARCHAR2(4),
  mrk5hd1       VARCHAR2(4),
  mrk5hd2       VARCHAR2(4),
  mrk6hd1       VARCHAR2(4),
  mrk6hd2       VARCHAR2(4),
  mrk7hd1       VARCHAR2(4),
  mrk7hd2       VARCHAR2(4),
  mrk8hd1       VARCHAR2(4),
  mrk8hd2       VARCHAR2(4),
  mrk9hd1       VARCHAR2(4),
  mrk9hd2       VARCHAR2(4),
  mrk10hd1      VARCHAR2(4),
  mrk10hd2      VARCHAR2(4),
  mrk11hd1      VARCHAR2(4),
  mrk11hd2      VARCHAR2(4),
  mrk12hd1      VARCHAR2(4),
  mrk12hd2      VARCHAR2(4),
  mrk13hd1      VARCHAR2(4),
  mrk13hd2      VARCHAR2(4),
  mrk14hd1      VARCHAR2(4),
  mrk14hd2      VARCHAR2(4),
  mrk15hd1      VARCHAR2(4),
  mrk15hd2      VARCHAR2(4),
  mrk16hd1      VARCHAR2(4),
  mrk16hd2      VARCHAR2(4),
  mrk17hd1      VARCHAR2(4),
  mrk17hd2      VARCHAR2(4),
  mrk18hd1      VARCHAR2(4),
  mrk18hd2      VARCHAR2(4),
  mrk19hd1      VARCHAR2(4),
  mrk19hd2      VARCHAR2(4),
  mrk20hd1      VARCHAR2(4),
  mrk20hd2      VARCHAR2(4),
  mrk21hd1      VARCHAR2(4),
  mrk21hd2      VARCHAR2(4),
  abs1hd1       VARCHAR2(3),
  abs1hd2       VARCHAR2(3),
  abs2hd1       VARCHAR2(3),
  abs2hd2       VARCHAR2(3),
  rptexpl1      VARCHAR2(80),
  rptexpl2      VARCHAR2(80),
  rptexpl3      VARCHAR2(80),
  rptexpl4      VARCHAR2(80),
  rptexpl5      VARCHAR2(80),
  rptexpl6      VARCHAR2(80),
  rptexpl7      VARCHAR2(80),
  rptexpl8      VARCHAR2(80),
  rptexpl9      VARCHAR2(80),
  gpa1title     VARCHAR2(20),
  gpa2title     VARCHAR2(20),
  schyear       VARCHAR2(10),
  currperiod    VARCHAR2(3),
  r10_loaddate  DATE
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
prompt Creating table AGRL
prompt ===================
prompt
create table ALLEN.AGRL
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5) not null,
  sequence      NUMBER(3) not null,
  marknum       NUMBER(2) not null,
  mark          VARCHAR2(3),
  conduct       VARCHAR2(3),
  comment1      VARCHAR2(3),
  comment2      VARCHAR2(3),
  comment3      VARCHAR2(3),
  comment4      VARCHAR2(3),
  comment5      VARCHAR2(3),
  att1          NUMBER(3),
  att2          NUMBER(3),
  wrkhabits     VARCHAR2(3),
  repeattag     VARCHAR2(1),
  crdearned     NUMBER(7,3),
  grllink       NUMBER(10),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 187648K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AGRL_MARK on ALLEN.AGRL (MARK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRL_SASI_SCH on ALLEN.AGRL (ETL_SASI_SCH)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRL_SCHOOLNUM on ALLEN.AGRL (SCHOOLNUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BIX_AGRL_SEQUENCE on ALLEN.AGRL (SEQUENCE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create index ALLEN.IX_AGRL_STULINK on ALLEN.AGRL (STULINK)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 38M
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table AGRP
prompt ===================
prompt
create table ALLEN.AGRP
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  track$0101    VARCHAR2(254),
  track$0102    VARCHAR2(254),
  track$0103    VARCHAR2(254),
  track$0104    VARCHAR2(254),
  track$0105    VARCHAR2(254),
  track$0106    VARCHAR2(254),
  track$0107    VARCHAR2(254),
  track$0108    VARCHAR2(254),
  track$0109    VARCHAR2(254),
  track$0110    VARCHAR2(254),
  track$0111    VARCHAR2(254),
  track$0112    VARCHAR2(254),
  track$0113    VARCHAR2(254),
  track$0114    VARCHAR2(254),
  track$0115    VARCHAR2(254),
  track$0116    VARCHAR2(254),
  track$0117    VARCHAR2(254),
  track$0118    VARCHAR2(254),
  track$0119    VARCHAR2(254),
  track$0120    VARCHAR2(254),
  track$0121    VARCHAR2(254),
  track$0122    VARCHAR2(254),
  track$0123    VARCHAR2(254),
  track$0124    VARCHAR2(254),
  track$0125    VARCHAR2(254),
  track$0126    VARCHAR2(254),
  track$0127    VARCHAR2(254),
  track$0128    VARCHAR2(254),
  track$0129    VARCHAR2(254),
  track$0130    VARCHAR2(254),
  track$0131    VARCHAR2(254),
  track$0132    VARCHAR2(254),
  track$0133    VARCHAR2(254),
  track$0134    VARCHAR2(123),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
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
create bitmap index ALLEN.BIX_AGRP_SASI_SCH on ALLEN.AGRP (ETL_SASI_SCH)
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
prompt Creating table AMST
prompt ===================
prompt
create table ALLEN.AMST
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  classlink     NUMBER(4),
  sectionid     VARCHAR2(18),
  begperiod     VARCHAR2(2),
  endperiod     VARCHAR2(2),
  meetperiod    VARCHAR2(48),
  track         VARCHAR2(1),
  termcode      VARCHAR2(2),
  course        VARCHAR2(14),
  crstitle      VARCHAR2(18),
  tchnum        NUMBER(3),
  tchname       VARCHAR2(15),
  room          VARCHAR2(6),
  credit        NUMBER(6,3),
  genderrest    VARCHAR2(1),
  lowgrdrest    VARCHAR2(2),
  higrdrest     VARCHAR2(2),
  termexcl      VARCHAR2(2),
  exclattend    VARCHAR2(1),
  exclgrade     VARCHAR2(1),
  teamnum       NUMBER(3),
  maxclasssz    NUMBER(3),
  semtotals     VARCHAR2(45),
  ownersch      VARCHAR2(3),
  totinclh      NUMBER(3),
  scdmaxsize    NUMBER(3),
  totparts      NUMBER(1),
  partnum       NUMBER(1),
  currcode      VARCHAR2(2),
  usercode1     VARCHAR2(1),
  usercode2     VARCHAR2(1),
  usercode3     VARCHAR2(2),
  usercode4     VARCHAR2(3),
  house         VARCHAR2(1),
  updateres     VARCHAR2(1),
  sectseqnum    NUMBER(3),
  sprunresar    VARCHAR2(3),
  spschdctla    VARCHAR2(3),
  clarray       VARCHAR2(32),
  csarray       VARCHAR2(32),
  dstamptime    VARCHAR2(32),
  tstamptime    NUMBER(6),
  dstamptchr    VARCHAR2(32),
  tstamptchr    NUMBER(6),
  dstamproom    VARCHAR2(32),
  tstamproom    NUMBER(6),
  extdayopt     VARCHAR2(2),
  altsectid     VARCHAR2(18),
  instrlang     VARCHAR2(3),
  instrtype     VARCHAR2(3),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  schtrack      NUMBER(2),
  gftdelmdl     VARCHAR2(1),
  gftcaocur     VARCHAR2(2),
  intentcer     VARCHAR2(1),
  locirn        VARCHAR2(6),
  ppirn         VARCHAR2(6),
  prgbuilder    VARCHAR2(15),
  nuserdate1    VARCHAR2(32),
  nuserdate2    VARCHAR2(32),
  nusercode1    VARCHAR2(30),
  nusercode2    VARCHAR2(30),
  nusercode3    VARCHAR2(30),
  nusercode4    VARCHAR2(30),
  clssvctype    VARCHAR2(3),
  starttime     NUMBER(4),
  totalmin      NUMBER(3),
  classtype     VARCHAR2(2),
  othinstid     NUMBER(9),
  othinsflag    VARCHAR2(2),
  plantype      VARCHAR2(2),
  eiptchid      NUMBER(9),
  inclinext     VARCHAR2(1),
  insmins       NUMBER(3),
  subar$0101    VARCHAR2(254),
  subar$0102    VARCHAR2(34),
  stufstsun     VARCHAR2(1),
  stufstmon     VARCHAR2(1),
  stufsttue     VARCHAR2(1),
  stufstwed     VARCHAR2(1),
  stufstthu     VARCHAR2(1),
  stufstfri     VARCHAR2(1),
  stufstsat     VARCHAR2(1),
  stusecsun     VARCHAR2(1),
  stusecmon     VARCHAR2(1),
  stusectue     VARCHAR2(1),
  stusecwed     VARCHAR2(1),
  stusecthu     VARCHAR2(1),
  stusecfri     VARCHAR2(1),
  stusecsat     VARCHAR2(1),
  tchfstsun     VARCHAR2(1),
  tchfstmon     VARCHAR2(1),
  tchfsttue     VARCHAR2(1),
  tchfstwed     VARCHAR2(1),
  tchfstthu     VARCHAR2(1),
  tchfstfri     VARCHAR2(1),
  tchfstsat     VARCHAR2(1),
  tchsecsun     VARCHAR2(1),
  tchsecmon     VARCHAR2(1),
  tchsectue     VARCHAR2(1),
  tchsecwed     VARCHAR2(1),
  tchsecthu     VARCHAR2(1),
  tchsecfri     VARCHAR2(1),
  tchsecsat     VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_AMST_SASI_SCH on ALLEN.AMST (ETL_SASI_SCH)
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
prompt Creating table ASCH
prompt ===================
prompt
create table ALLEN.ASCH
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  altnumber     VARCHAR2(10),
  schoolabrv    VARCHAR2(5),
  name          VARCHAR2(35),
  address       VARCHAR2(35),
  city          VARCHAR2(24),
  state         VARCHAR2(2),
  zipcode       VARCHAR2(10),
  unused1       NUMBER(3),
  telephone     NUMBER(15),
  grdlevels     VARCHAR2(40),
  principal     VARCHAR2(35),
  atttel        NUMBER(15),
  attextn       VARCHAR2(4),
  meetssat      VARCHAR2(1),
  begperiod     VARCHAR2(2),
  endperiod     VARCHAR2(2),
  atttype       VARCHAR2(1),
  crslength     NUMBER(2),
  sectlength    NUMBER(2),
  classtype     VARCHAR2(1),
  genclassid    VARCHAR2(1),
  teldialer     VARCHAR2(1),
  schooltype    NUMBER(1),
  fullclass     NUMBER(1),
  duplcrs       NUMBER(1),
  numtracks     NUMBER(1),
  tracktype     VARCHAR2(1),
  locker        NUMBER(1),
  sembasis      VARCHAR2(1),
  splitweek     NUMBER(1),
  semreq        VARCHAR2(1),
  trkenroll     VARCHAR2(1),
  grdenroll     VARCHAR2(1),
  instenroll    VARCHAR2(1),
  tchenroll     VARCHAR2(1),
  usrcd1enr     VARCHAR2(1),
  usrcd2enr     VARCHAR2(1),
  usrcd3enr     VARCHAR2(1),
  usrcd4enr     VARCHAR2(1),
  usrcd5enr     VARCHAR2(1),
  usrcd6enr     VARCHAR2(1),
  usrcd7enr     VARCHAR2(1),
  usrcd8enr     VARCHAR2(1),
  usrcd9enr     VARCHAR2(1),
  valstreet     VARCHAR2(1),
  sharelkr      VARCHAR2(1),
  grdfollow     VARCHAR2(1),
  transschl     VARCHAR2(40),
  confirmadd    VARCHAR2(1),
  confirmchg    VARCHAR2(1),
  confirmdel    VARCHAR2(1),
  elemtch       VARCHAR2(1),
  tchaidecrs    VARCHAR2(14),
  minpasslen    NUMBER(2),
  allownosho    VARCHAR2(1),
  entercode     VARCHAR2(3),
  leavecode     VARCHAR2(3),
  shutdwnmin    NUMBER(3),
  lockscrmin    NUMBER(3),
  usingphoto    VARCHAR2(1),
  deftoddate    VARCHAR2(1),
  leave_day     VARCHAR2(1),
  lckmstsch     VARCHAR2(1),
  homermper     NUMBER(2),
  forupptype    VARCHAR2(1),
  dstlookup     VARCHAR2(1),
  reserved      VARCHAR2(241),
  filler        VARCHAR2(84),
  permit        VARCHAR2(10),
  ngrdlevels    VARCHAR2(40),
  loccode       VARCHAR2(2),
  distnum       VARCHAR2(10),
  usrcd10enr    VARCHAR2(1),
  usrcd11enr    VARCHAR2(1),
  usrcd12enr    VARCHAR2(1),
  usrcd13enr    VARCHAR2(1),
  usrcd14enr    VARCHAR2(1),
  periodrot     NUMBER(2),
  schedcycle    NUMBER(2),
  schedcodes    VARCHAR2(12),
  disttype      VARCHAR2(2),
  kindersch     VARCHAR2(1),
  gradlvcode    VARCHAR2(3),
  faxnum        NUMBER(7),
  attloccd      VARCHAR2(2),
  grdloccd      VARCHAR2(2),
  trnloccd      VARCHAR2(2),
  schloccd      VARCHAR2(2),
  speloccd      VARCHAR2(2),
  paswdexpir    NUMBER(3),
  disbdist      VARCHAR2(1),
  comboinuse    VARCHAR2(1),
  svcprgxcod    VARCHAR2(3),
  useenrval     VARCHAR2(1),
  titleone      VARCHAR2(1),
  schoolyear    NUMBER(4),
  useseclink    VARCHAR2(1),
  fundtype      VARCHAR2(2),
  schoolcat     VARCHAR2(2),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  datefmt       VARCHAR2(1),
  datedelim     VARCHAR2(1),
  phonefmt      VARCHAR2(1),
  phonefmt2     VARCHAR2(5),
  phonedelim    VARCHAR2(1),
  timeformat    VARCHAR2(1),
  currfmt       VARCHAR2(1),
  dispcntry     VARCHAR2(1),
  dispprov      VARCHAR2(1),
  disppass      VARCHAR2(1),
  addr1itm1     VARCHAR2(1),
  addr1itm2     VARCHAR2(1),
  addr1itm3     VARCHAR2(1),
  addr2itm1     VARCHAR2(1),
  addr2itm2     VARCHAR2(1),
  addr2itm3     VARCHAR2(1),
  clsstdate     VARCHAR2(1),
  usetchfltr    VARCHAR2(1),
  scheduletp    VARCHAR2(1),
  usedfltcmp    VARCHAR2(1),
  valaddr       VARCHAR2(1),
  defattprm     VARCHAR2(1),
  allwstudel    VARCHAR2(1),
  clsrltmupd    VARCHAR2(1),
  noaddstu20    VARCHAR2(1),
  distschool    VARCHAR2(3),
  minpercyl     NUMBER(3),
  paperless     VARCHAR2(1),
  country       VARCHAR2(30),
  province      VARCHAR2(30),
  valoption     VARCHAR2(1),
  r10_loaddate  DATE
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
prompt Creating table ASTU
prompt ===================
prompt
create table ALLEN.ASTU
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  enterdate     VARCHAR2(32),
  leavedate     VARCHAR2(32),
  entercode     VARCHAR2(3),
  leavecode     VARCHAR2(3),
  permnum       VARCHAR2(12) not null,
  socsecnum     VARCHAR2(10),
  familynum     NUMBER(7),
  lastname      VARCHAR2(40),
  firstname     VARCHAR2(20),
  middlename    VARCHAR2(13),
  othername     VARCHAR2(20),
  nickname      VARCHAR2(13),
  birthdate     VARCHAR2(32),
  gender        VARCHAR2(1),
  grade         VARCHAR2(2),
  track         VARCHAR2(1),
  ethniccode    VARCHAR2(3),
  prntguard     VARCHAR2(35),
  mailaddr      VARCHAR2(35),
  city          VARCHAR2(24),
  zipcode       VARCHAR2(10),
  state         VARCHAR2(2),
  gridcode      VARCHAR2(8),
  telephone     NUMBER(15),
  birthplace    VARCHAR2(20),
  birthmeth     VARCHAR2(2),
  notused5      VARCHAR2(1),
  engprof       VARCHAR2(1),
  primarylng    VARCHAR2(3),
  homelng       VARCHAR2(3),
  homelngcor    VARCHAR2(3),
  notused1      VARCHAR2(1),
  notused2      VARCHAR2(1),
  notused3      VARCHAR2(1),
  fosterhome    VARCHAR2(1),
  freemeals     VARCHAR2(1),
  uscitizen     VARCHAR2(1),
  counselor     NUMBER(3),
  advisor       NUMBER(3),
  nextschool    VARCHAR2(3),
  nextgrade     VARCHAR2(2),
  nexttrack     VARCHAR2(1),
  retain        VARCHAR2(1),
  credatmpt     NUMBER(7,3),
  credearned    NUMBER(7,3),
  cummgpa1      NUMBER(8,4),
  cummgpa2      NUMBER(8,4),
  cummgpa3      NUMBER(8,4),
  cummgpa4      NUMBER(8,4),
  curgpa1       NUMBER(8,4),
  curgpa2       NUMBER(8,4),
  curgpa3       NUMBER(8,4),
  curgpa4       NUMBER(8,4),
  cum2gpa1      NUMBER(8,4),
  cum2gpa2      NUMBER(8,4),
  cum2gpa3      NUMBER(8,4),
  cum2gpa4      NUMBER(8,4),
  cur2gpa1      NUMBER(8,4),
  cur2gpa2      NUMBER(8,4),
  cur2gpa3      NUMBER(8,4),
  cur2gpa4      NUMBER(8,4),
  classrank1    NUMBER(4),
  classrank2    NUMBER(4),
  classsize     NUMBER(4),
  grdaverage    NUMBER(3),
  instrset      VARCHAR2(5),
  lastschool    VARCHAR2(3),
  querytag      VARCHAR2(1),
  locatortag    VARCHAR2(1),
  customtag1    VARCHAR2(1),
  customtag2    VARCHAR2(1),
  locker        VARCHAR2(6),
  altlocker     VARCHAR2(6),
  lowperiod     VARCHAR2(2),
  highperiod    VARCHAR2(2),
  schoolres     VARCHAR2(3),
  distrctres    VARCHAR2(6),
  concschool    VARCHAR2(3),
  concishome    VARCHAR2(1),
  restdirinf    VARCHAR2(1),
  unlisttel     VARCHAR2(1),
  autodial      VARCHAR2(1),
  migrant       VARCHAR2(1),
  refugee       VARCHAR2(1),
  homeless      VARCHAR2(1),
  postsecond    VARCHAR2(2),
  drvtrnelg     VARCHAR2(1),
  drvtrndate    VARCHAR2(32),
  pewaiver      VARCHAR2(1),
  homeroom      VARCHAR2(6),
  entergrade    VARCHAR2(2),
  origentcd     VARCHAR2(3),
  origentdt     VARCHAR2(32),
  pctapport     NUMBER(3),
  attprmcode    VARCHAR2(1),
  attprmdate    VARCHAR2(32),
  militaryp     VARCHAR2(6),
  origyrgrad    NUMBER(4),
  usercd1       VARCHAR2(8),
  usercd2       VARCHAR2(8),
  usercd3       VARCHAR2(8),
  usercd4       VARCHAR2(8),
  usercd5       VARCHAR2(8),
  usercd6       VARCHAR2(8),
  usercd7       VARCHAR2(8),
  usercd8       VARCHAR2(8),
  usercd9       VARCHAR2(8),
  notused4      VARCHAR2(1),
  eligada       VARCHAR2(1),
  teamnum       NUMBER(3),
  balcode       VARCHAR2(1),
  getsaid       VARCHAR2(1),
  absencetag    VARCHAR2(1),
  abstagdate    VARCHAR2(32),
  classrank3    NUMBER(4),
  classrank4    NUMBER(4),
  multienr      VARCHAR2(1),
  endyrst       VARCHAR2(3),
  usernum1      NUMBER(8,2),
  usernum2      NUMBER(8,2),
  usernum3      NUMBER(8,2),
  usernum4      NUMBER(8,2),
  clssftion     VARCHAR2(3),
  prgram        VARCHAR2(3),
  usernum5      NUMBER(8,2),
  altid1        VARCHAR2(13),
  altid2        VARCHAR2(13),
  house         VARCHAR2(1),
  gifted        VARCHAR2(1),
  feebal        NUMBER(7,2),
  hnrrolltag    VARCHAR2(1),
  pridayenr     NUMBER(3),
  summerschl    VARCHAR2(3),
  school_att    VARCHAR2(3),
  schlsstulk    NUMBER(5),
  graddate      VARCHAR2(32),
  msgcode       VARCHAR2(3),
  comp_ed       VARCHAR2(1),
  resaddr       VARCHAR2(35),
  rescity       VARCHAR2(24),
  reszipcode    VARCHAR2(10),
  resstate      VARCHAR2(2),
  reshouse      VARCHAR2(9),
  resstdir      VARCHAR2(2),
  resstname     VARCHAR2(25),
  ressttype     VARCHAR2(4),
  resaptnum     VARCHAR2(10),
  privacy       VARCHAR2(6),
  dstampreq     VARCHAR2(32),
  tstampreq     NUMBER(6),
  dstampsch     VARCHAR2(32),
  tstampsch     NUMBER(6),
  ssoutdated    VARCHAR2(1),
  schedopen     VARCHAR2(1),
  passport      VARCHAR2(15),
  country       VARCHAR2(30),
  province      VARCHAR2(30),
  generation    VARCHAR2(4),
  resfract      VARCHAR2(3),
  prfsession    VARCHAR2(1),
  spstatflag    NUMBER(10),
  familylink    NUMBER(12),
  diplomatyp    VARCHAR2(3),
  gradpgrm      VARCHAR2(3),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  disusercd     VARCHAR2(8),
  honorarray    VARCHAR2(21),
  birthcntry    VARCHAR2(11),
  title3immg    VARCHAR2(1),
  usschentdt    VARCHAR2(32),
  reserved      VARCHAR2(69),
  resvstate     VARCHAR2(127),
  stateid       VARCHAR2(25),
  filler        VARCHAR2(254),
  emailaddr     VARCHAR2(60),
  demorev       VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 29M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ASTU_SASI_SCH on ALLEN.ASTU (ETL_SASI_SCH)
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
prompt Creating table ATBL
prompt ===================
prompt
create table ALLEN.ATBL
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  schoolnum     VARCHAR2(3),
  tabletype     VARCHAR2(3) not null,
  code          VARCHAR2(8),
  codedesc      VARCHAR2(40),
  alt_code      VARCHAR2(8),
  usercode1     VARCHAR2(8),
  usercode2     VARCHAR2(8),
  usercode3     VARCHAR2(8),
  usercode4     VARCHAR2(8),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ATBL_SASI_SCH on ALLEN.ATBL (ETL_SASI_SCH)
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
create bitmap index ALLEN.BIX_ATBL_TABLETYPE on ALLEN.ATBL (TABLETYPE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BMI_ATBL_SCHOOLNUM on ALLEN.ATBL (SCHOOLNUM)
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
create index ALLEN.IX_ATBL_CODE on ALLEN.ATBL (CODE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ATCH
prompt ===================
prompt
create table ALLEN.ATCH
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  tchnum        NUMBER(3),
  lastname      VARCHAR2(20),
  firstname     VARCHAR2(20),
  middlename    VARCHAR2(13),
  abbrevname    VARCHAR2(15),
  socsecnum     VARCHAR2(10),
  altnumber     VARCHAR2(10),
  gender        VARCHAR2(1),
  ethnic        VARCHAR2(3),
  yearsexper    NUMBER(2),
  colldeglev    VARCHAR2(1),
  maxperiods    NUMBER(2),
  counselor     VARCHAR2(1),
  telephone     NUMBER(7),
  telextn       NUMBER(4),
  notused       VARCHAR2(1),
  capacity      NUMBER(3),
  minperload    NUMBER(3),
  homeroom      VARCHAR2(6),
  track         VARCHAR2(1),
  mailbox       VARCHAR2(6),
  dept          VARCHAR2(4),
  maxperload    NUMBER(3),
  lunchpers     NUMBER(1),
  maxstu        NUMBER(3),
  dept2         VARCHAR2(4),
  dept3         VARCHAR2(4),
  dept4         VARCHAR2(4),
  preppers      NUMBER(1),
  maxseqper     VARCHAR2(2),
  firstlunch    VARCHAR2(2),
  lastlunch     VARCHAR2(2),
  prefroom      VARCHAR2(6),
  mintrmload    NUMBER(3),
  maxtrmload    NUMBER(3),
  mindayload    NUMBER(3),
  maxdayload    NUMBER(3),
  hrsperday     NUMBER(5),
  begbalance    NUMBER(5),
  usedhours     NUMBER(5),
  availhours    NUMBER(5),
  hrsasofdt     VARCHAR2(32),
  lvstartdt     VARCHAR2(32),
  lvenddt       VARCHAR2(32),
  itin          VARCHAR2(3),
  numlunch      VARCHAR2(2),
  tchrgroups    VARCHAR2(12),
  clarray       VARCHAR2(32),
  csarray       VARCHAR2(32),
  licensenum    VARCHAR2(15),
  generation    VARCHAR2(4),
  stuloadday    NUMBER(5),
  stuloadtrm    NUMBER(5),
  stuloadtot    NUMBER(5),
  servtype      VARCHAR2(4),
  emailaddr     VARCHAR2(60),
  userstamp     VARCHAR2(10),
  datestamp     VARCHAR2(32),
  timestamp     NUMBER(6),
  filler        VARCHAR2(70),
  staffnum      NUMBER(4),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 576K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_ATCH_SASI_SCH on ALLEN.ATCH (ETL_SASI_SCH)
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
create bitmap index ALLEN.BIX_ATCH_SCHOOLNUM on ALLEN.ATCH (SCHOOLNUM)
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
create index ALLEN.IX_ATCH_SSN on ALLEN.ATCH (SOCSECNUM)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table ATND_ABSENCE_REASON
prompt ==================================
prompt
create table ALLEN.ATND_ABSENCE_REASON
(
  entity_id            VARCHAR2(10),
  school_year          NUMBER,
  aar_id               VARCHAR2(4),
  aar_sdesc            VARCHAR2(30),
  aar_ldesc            VARCHAR2(60),
  live                 VARCHAR2(1),
  aar_fam_access_entry VARCHAR2(1)
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
prompt Creating table ATND_ABSENCE_TYPE
prompt ================================
prompt
create table ALLEN.ATND_ABSENCE_TYPE
(
  entity_id             VARCHAR2(5),
  school_year           VARCHAR2(10),
  aat_id                VARCHAR2(1),
  aat_sdesc             VARCHAR2(15),
  aat_ldesc             VARCHAR2(30),
  aat_exc_unexc_tar_oth VARCHAR2(1),
  aat_abs_exp_isus_osus VARCHAR2(1),
  aat_cnt_in_truancy    VARCHAR2(10),
  aat_incl_in_cls_atnd  VARCHAR2(10),
  aat_incl_in_tot_atnd  VARCHAR2(10),
  live                  VARCHAR2(10),
  aat_count_in_funding  VARCHAR2(10),
  aat_funding_type      VARCHAR2(1),
  sif_atnd_type_ref_id  VARCHAR2(32),
  color_code            VARCHAR2(30),
  state_code            VARCHAR2(1),
  aat_grading_points    VARCHAR2(10)
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
create bitmap index ALLEN.BMX_ATND_ABS_TYPE_AATID on ALLEN.ATND_ABSENCE_TYPE (AAT_ID)
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
create bitmap index ALLEN.BMX_ATND_ABS_TYPE_ENTITYID on ALLEN.ATND_ABSENCE_TYPE (ENTITY_ID)
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
create bitmap index ALLEN.BMX_ATND_ABS_TYPE_SCH00LYEAR on ALLEN.ATND_ABSENCE_TYPE (SCHOOL_YEAR)
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
create bitmap index ALLEN.BMX_ATND_ABS_TYPE_SCHENTAATID on ALLEN.ATND_ABSENCE_TYPE (SCHOOL_YEAR, ENTITY_ID, AAT_ID)
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
prompt Creating table BUILDING
prompt =======================
prompt
create table ALLEN.BUILDING
(
  building_id     VARCHAR2(5),
  school_id       VARCHAR2(5),
  building_sdesc  VARCHAR2(15),
  building_ldesc  VARCHAR2(30),
  combination_set VARCHAR2(10),
  address_id      VARCHAR2(10),
  live            VARCHAR2(10),
  parcel_nbr      VARCHAR2(10),
  fish_nbr        VARCHAR2(5)
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
prompt Creating table CALENDAR_DAY
prompt ===========================
prompt
create table ALLEN.CALENDAR_DAY
(
  entity_id          VARCHAR2(5),
  track              VARCHAR2(25),
  calendar_id        VARCHAR2(5),
  cal_date           VARCHAR2(14),
  cal_prds_in_day    VARCHAR2(2),
  cal_days           VARCHAR2(5),
  cal_day_nbr        VARCHAR2(5),
  cal_alt_fri        VARCHAR2(1),
  cal_min_each_prd   VARCHAR2(160),
  cal_comment        VARCHAR2(40),
  cal_day_prds_meet  VARCHAR2(320),
  live               VARCHAR2(2),
  day_time_id        VARCHAR2(1),
  cal_non_instr_days VARCHAR2(5),
  cal_zero_meet      VARCHAR2(20),
  cal_zero_min       VARCHAR2(3)
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
create bitmap index ALLEN.BMI_ on ALLEN.CALENDAR_DAY (CAL_DAY_NBR)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.BMI_CAL_DATE on ALLEN.CALENDAR_DAY (CAL_DATE)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.BMI_CAL_DAYS on ALLEN.CALENDAR_DAY (CAL_DAYS)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.BMI_CAL_DAY_ENTITY_ID on ALLEN.CALENDAR_DAY (ENTITY_ID)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table CALENDAR_MASTER
prompt ==============================
prompt
create table ALLEN.CALENDAR_MASTER
(
  school_year                NUMBER(9),
  entity_id                  VARCHAR2(10),
  track                      NUMBER(9),
  calendar_id                VARCHAR2(10),
  cal_str_dte                DATE,
  cal_stp_dte                DATE,
  cal_def_prds_per_day_max   NUMBER(9),
  cal_def_atnd_prds_meet     VARCHAR2(160),
  cal_def_schd_prds_meet     VARCHAR2(160),
  cal_def_day_length_mins    NUMBER(9),
  cal_def_hrs_in_yr          NUMBER(9),
  cal_formula_or_cal_method  VARCHAR2(2),
  cal_formula_nbr_of_prds    NUMBER(9),
  cal_use_zero_mod           VARCHAR2(2),
  cal_incl_zero_mod_in_cnts  VARCHAR2(2),
  live                       VARCHAR2(1),
  cal_def_nbr_non_instr_day  NUMBER(17,2),
  cal_serves_meal            VARCHAR2(1),
  cal_funding_prds           VARCHAR2(60),
  cal_avg_instr_per_week_hr  NUMBER(9),
  cal_avg_instr_per_week_min NUMBER(9),
  cal_core_days              NUMBER(17,2),
  tn_teacher_day_stop        NUMBER(9),
  tn_teacher_day_start       NUMBER(9),
  tn_instructional_program   NUMBER(9),
  tn_scheduled_days          NUMBER(9),
  tn_instructional_cal       VARCHAR2(2),
  tn_cal_number              NUMBER(9),
  calendar_type              VARCHAR2(2)
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
create bitmap index ALLEN.bmi_cal_mstr_funding_prds on ALLEN.CALENDAR_MASTER (CAL_FUNDING_PRDS)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.bmi_cal_mstr_schl_yr on ALLEN.CALENDAR_MASTER (SCHOOL_YEAR)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table CALENDAR_TERMS
prompt =============================
prompt
create table ALLEN.CALENDAR_TERMS
(
  school_year      NUMBER,
  entity_id        VARCHAR2(10),
  track            NUMBER,
  calendar_id      VARCHAR2(10),
  sch_term         NUMBER,
  cal_trm_str_dte  VARCHAR2(8),
  cal_trm_stp_dte  VARCHAR2(8),
  cal_nbr_sch_days NUMBER,
  live             VARCHAR2(1)
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
prompt Creating table CLASS
prompt ====================
prompt
create table ALLEN.CLASS
(
  cor_num_id               NUMBER not null,
  track                    NUMBER not null,
  clas_section             VARCHAR2(10) not null,
  entity_id                VARCHAR2(10) not null,
  team_schd_id             VARCHAR2(6),
  clas_status              VARCHAR2(2) not null,
  clas_nbr_stds_enr_obs    VARCHAR2(112),
  calendar_id              VARCHAR2(10),
  clas_wrk_female_cnts_obs VARCHAR2(176),
  clas_nbr_stds_opt        NUMBER not null,
  clas_nbr_stds_max        NUMBER not null,
  clas_nbr_stds_min        NUMBER not null,
  clas_wrk_male_cnts_obs   VARCHAR2(176),
  clas_anytime             VARCHAR2(1),
  clas_grd_reg_when_obs    VARCHAR2(48),
  clas_alt_fri_flag        VARCHAR2(2),
  clas_grd_mid_when_obs    VARCHAR2(48),
  clas_mst_bld_dsp_days    VARCHAR2(20),
  clas_mst_bld_flag        NUMBER not null,
  clas_mst_bld_days        NUMBER not null,
  clas_coreq_section       VARCHAR2(6),
  clas_use_var_tch_rm      VARCHAR2(1),
  control_set_id           VARCHAR2(4),
  clas_mode_teaching       VARCHAR2(2),
  clas_coreq_id            NUMBER,
  atnd_method              VARCHAR2(2),
  use_asgn_seats           VARCHAR2(1),
  atnd_nbr_rows            NUMBER,
  atnd_nbr_cols            NUMBER,
  clas_nbr_stds_enr        VARCHAR2(168),
  clas_wrk_female_cnts     VARCHAR2(264),
  clas_wrk_male_cnts       VARCHAR2(264),
  clas_grd_reg_when        VARCHAR2(72),
  clas_grd_mid_when        VARCHAR2(72),
  use_meeting_times        VARCHAR2(1),
  clas_wgt_schd_add_on     VARCHAR2(168),
  grd_method               VARCHAR2(2),
  distance_learning_ind    VARCHAR2(20),
  population_served        VARCHAR2(20),
  instructional_setting    VARCHAR2(20),
  cor_seq_code             NUMBER,
  cor_seq_code2            NUMBER,
  allow_cece               VARCHAR2(1),
  x_bilingual              VARCHAR2(1),
  sif_class_ref_id         VARCHAR2(64),
  ss_class                 VARCHAR2(1),
  bld_room_type_id         NUMBER,
  mb_clas_locked           VARCHAR2(1),
  mb_control_set_schd      VARCHAR2(1),
  mb_control_set_locked    VARCHAR2(1),
  clas_nbr_days            NUMBER,
  clas_nbr_periods         NUMBER,
  clas_nbr_teachers        NUMBER,
  x_consecutive_prds       VARCHAR2(1),
  cm_time_type             VARCHAR2(16),
  schd_categories          VARCHAR2(20),
  class_gpa_set_id_1       NUMBER,
  class_gpa_set_id_2       NUMBER,
  class_gpa_set_id_3       NUMBER,
  class_gpa_set_id_4       NUMBER,
  class_gpa_set_id_5       NUMBER,
  class_gpa_set_id_6       NUMBER,
  class_gpa_set_id_7       NUMBER,
  class_gpa_set_id_8       NUMBER,
  class_gpa_set_id_9       NUMBER,
  class_gpa_crdts_1        NUMBER(17,2),
  class_gpa_crdts_2        NUMBER(17,2),
  class_gpa_crdts_3        NUMBER(17,2),
  class_gpa_crdts_4        NUMBER(17,2),
  class_gpa_crdts_5        NUMBER(17,2),
  class_gpa_crdts_6        NUMBER(17,2),
  class_gpa_crdts_7        NUMBER(17,2),
  class_gpa_crdts_8        NUMBER(17,2),
  class_gpa_crdts_9        NUMBER(17,2),
  clas_nbr_est_stds        NUMBER,
  cm_building_id           VARCHAR2(16),
  cte_flag                 VARCHAR2(1),
  spec_ed_limit            NUMBER(17,2),
  clas_minutes_per_week    NUMBER,
  tn_service_district      NUMBER,
  tn_class_type            VARCHAR2(2),
  tn_service_school        NUMBER,
  aide_percentage          NUMBER,
  title_iii                VARCHAR2(2),
  cor_alphakey             VARCHAR2(20),
  sr_char                  VARCHAR2(270),
  tn_fed_funded            VARCHAR2(1),
  fl_period_number         NUMBER,
  course_flag              VARCHAR2(8),
  schedule_method          VARCHAR2(2)
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
create bitmap index ALLEN.BMX_CLASS_CLASSECT on ALLEN.CLASS (CLAS_SECTION)
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
create bitmap index ALLEN.BMX_CLASS_CLASSTATUS on ALLEN.CLASS (CLAS_STATUS)
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
create bitmap index ALLEN.BMX_CLASS_CORNUMID on ALLEN.CLASS (COR_NUM_ID)
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
prompt Creating table CLASS_MEET
prompt =========================
prompt
create table ALLEN.CLASS_MEET
(
  cor_num_id            NUMBER,
  track                 NUMBER,
  clas_section          VARCHAR2(10),
  dsp_str_trm           NUMBER,
  dsp_stp_trm           NUMBER,
  dsp_period            NUMBER,
  clas_lun_code         VARCHAR2(2),
  dsp_day_nbr           NUMBER,
  sch_str_trm           NUMBER,
  sch_stp_trm           NUMBER,
  sch_period            NUMBER,
  sch_day_nbr           NUMBER,
  atn_period            NUMBER,
  name_id               NUMBER,
  building_id           VARCHAR2(10),
  room_number           VARCHAR2(10),
  tchr_prime_flag       VARCHAR2(2),
  dsp_days_meet         VARCHAR2(20),
  sch_days_meet         VARCHAR2(20),
  atn_day_nbr           NUMBER,
  atn_days_meet         VARCHAR2(20),
  entity_id             VARCHAR2(10),
  school_year           NUMBER,
  cor_alphakey          VARCHAR2(20),
  clas_str_time         NUMBER,
  clas_stp_time         NUMBER,
  time_type             VARCHAR2(2),
  cece_type             VARCHAR2(16),
  cece_cor_num_id       NUMBER,
  x_print_meet          VARCHAR2(1),
  mb_days_schd          VARCHAR2(1),
  mb_period_schd        VARCHAR2(1),
  mb_room_schd          VARCHAR2(1),
  mb_teacher_schd       VARCHAR2(1),
  mb_days_locked        VARCHAR2(1),
  mb_period_locked      VARCHAR2(1),
  mb_room_locked        VARCHAR2(1),
  mb_teacher_locked     VARCHAR2(1),
  x_access_gradebook    VARCHAR2(1),
  x_access_ea_plus      VARCHAR2(1),
  st_rpt_code_2         VARCHAR2(8),
  st_rpt_code_1         VARCHAR2(2),
  team_teacher_training VARCHAR2(2),
  highly_qualified      VARCHAR2(2),
  cert_status           VARCHAR2(2),
  fl_period_nbr         VARCHAR2(1)
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
create bitmap index ALLEN.BMX_CLASS_MEET_CLASSECTION on ALLEN.CLASS_MEET (COR_NUM_ID, CLAS_SECTION)
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
create bitmap index ALLEN.BMX_CLASS_MEET_ENTITYID on ALLEN.CLASS_MEET (ENTITY_ID)
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
create bitmap index ALLEN.BMX_CLASS_MEET_NAMEID on ALLEN.CLASS_MEET (NAME_ID)
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
create bitmap index ALLEN.BMX_CLASS_MEET_SCHOOLYEAR on ALLEN.CLASS_MEET (SCHOOL_YEAR)
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
create bitmap index ALLEN.BMX_CLASS_MEET_TCHRFLAG on ALLEN.CLASS_MEET (TCHR_PRIME_FLAG)
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
prompt Creating table CLAS_CONTROL_SET
prompt ===============================
prompt
create table ALLEN.CLAS_CONTROL_SET
(
  entity_id            VARCHAR2(5),
  school_year          VARCHAR2(10),
  cor_length_set_id    VARCHAR2(3),
  control_set_id       VARCHAR2(2),
  ccs_atnd_str_dte     VARCHAR2(14),
  ccs_atnd_stp_dte     VARCHAR2(14),
  ccs_dsp_trm_lit      VARCHAR2(3),
  ccs_dsp_nbr_trms     VARCHAR2(10),
  ccs_dsp_str_trm      VARCHAR2(10),
  ccs_dsp_stp_trm      VARCHAR2(10),
  ccs_sch_nbr_trms     VARCHAR2(10),
  ccs_sch_str_trm      VARCHAR2(10),
  ccs_sch_stp_trm      VARCHAR2(10),
  ccs_desc             VARCHAR2(15),
  control_set_ref      VARCHAR2(10),
  live                 VARCHAR2(10),
  track                VARCHAR2(10),
  ccs_sem_use_trms_obs VARCHAR2(10),
  ccs_sem_use_trms     VARCHAR2(20),
  ccs_let_std_take     VARCHAR2(10),
  sif_ccs_ref_id       VARCHAR2(32),
  fl_term_xref         VARCHAR2(2)
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
prompt Creating table COURSE
prompt =====================
prompt
create table ALLEN.COURSE
(
  cor_num_id                 NUMBER,
  area_comment_id            VARCHAR2(2),
  course_type_id             VARCHAR2(6),
  department_id              VARCHAR2(6),
  lock_group_id              VARCHAR2(10),
  schd_grd_id                VARCHAR2(2),
  subject_id                 VARCHAR2(6),
  instr_area_id              VARCHAR2(14),
  report_card_grp_id         VARCHAR2(10),
  entity_id                  VARCHAR2(10),
  school_year                NUMBER,
  cor_alphakey               VARCHAR2(20),
  cor_schd_priority          NUMBER,
  cor_grd_rng_low            NUMBER,
  cor_length_set_id          VARCHAR2(6),
  cor_status                 VARCHAR2(2),
  cor_sdesc                  VARCHAR2(30),
  cor_ldesc                  VARCHAR2(60),
  cor_tracks                 VARCHAR2(18),
  cor_has_grades             VARCHAR2(1),
  cor_has_attendance         VARCHAR2(1),
  cor_reg_lun_stdy_tran      VARCHAR2(2),
  cor_nbr_chairs_max         NUMBER,
  cor_nbr_requests           NUMBER,
  cor_fee                    NUMBER(17,2),
  cor_anytime                VARCHAR2(1),
  cor_tmp_has_skd            VARCHAR2(1),
  cor_academic_hours         NUMBER(18,3),
  cor_req_elec               VARCHAR2(2),
  cor_grd_rng_high           NUMBER,
  cor_schd_type              VARCHAR2(2),
  cor_ctrl_sets_poss         VARCHAR2(384),
  cor_est_nbr_sections       NUMBER,
  cor_team_schd_priority     NUMBER,
  gpa_set_id                 NUMBER,
  mn_cor_assign_code         NUMBER,
  mag_hs_code_id             VARCHAR2(10),
  cor_credits_good           NUMBER(18,3),
  cor_credits_gpa            NUMBER(18,3),
  cor_credits_gpa_2          NUMBER(18,3),
  mn_cor_lang_level          NUMBER,
  live                       VARCHAR2(1),
  cor_leveling_type          VARCHAR2(2),
  mn_cor_grd_level           NUMBER,
  mn_cor_prd_length          NUMBER,
  gpa_set_id_2               NUMBER,
  prev_cor_num_id            NUMBER,
  gpa_set_id_3               NUMBER,
  gpa_set_id_4               NUMBER,
  gpa_set_id_5               NUMBER,
  gpa_set_id_6               NUMBER,
  gpa_set_id_7               NUMBER,
  gpa_set_id_8               NUMBER,
  gpa_set_id_9               NUMBER,
  cor_credits_gpa_3          NUMBER(18,3),
  cor_credits_gpa_4          NUMBER(18,3),
  cor_credits_gpa_5          NUMBER(18,3),
  cor_credits_gpa_6          NUMBER(18,3),
  cor_credits_gpa_7          NUMBER(18,3),
  cor_credits_gpa_8          NUMBER(18,3),
  cor_credits_gpa_9          NUMBER(18,3),
  cor_cat_num_id             NUMBER,
  wa_dual_credit_code        VARCHAR2(16),
  wa_articulated_tech_prep   VARCHAR2(1),
  wa_direct_transcription_av VARCHAR2(1),
  cip_code                   NUMBER,
  cte_prg_code               VARCHAR2(20),
  service_id                 VARCHAR2(20),
  trans_area                 VARCHAR2(20),
  voc_ed_contact_hrs         NUMBER,
  unit_desc                  VARCHAR2(20),
  honor_roll                 VARCHAR2(1),
  wi_pi_1215_subj_topic      VARCHAR2(16),
  cece_type                  VARCHAR2(16),
  cece_cor_num_id            NUMBER,
  trn_grd_lvl_ovr            VARCHAR2(16),
  cor_repeatable             VARCHAR2(4),
  sif_cor_ref_id             VARCHAR2(64),
  cor_avail_to_oas           VARCHAR2(1),
  clas_bld_room_type_id      NUMBER,
  cor_act_nbr_sections       NUMBER,
  cor_max_nbr_requests       NUMBER,
  clas_calendar_id           VARCHAR2(10),
  clas_nbr_days              NUMBER,
  clas_nbr_periods           NUMBER,
  clas_nbr_teachers          NUMBER,
  clas_nbr_stds_min          NUMBER,
  clas_nbr_stds_opt          NUMBER,
  clas_nbr_stds_max          NUMBER,
  clas_use_meeting_times     VARCHAR2(1),
  mb_allow_mult_same_prd     VARCHAR2(1),
  mb_max_same_prd            NUMBER(17,2),
  mb_cor_rank                NUMBER,
  mb_manual_cor_rank         NUMBER,
  certification_req          VARCHAR2(1),
  wa_college_hs              VARCHAR2(1),
  wa_hecb_core_course        VARCHAR2(1),
  wa_internatl_baccal        VARCHAR2(1),
  wa_running_start           VARCHAR2(1),
  wa_tech_prep               VARCHAR2(1),
  clas_x_consecutive_prds    VARCHAR2(1),
  cor_prds_possible          VARCHAR2(141),
  wi_prog_area_part          VARCHAR2(16),
  cor_control_set_dist       VARCHAR2(165),
  cor_core                   VARCHAR2(1),
  clas_time_type             VARCHAR2(16),
  x_allow_gpa_set_override   VARCHAR2(1),
  mn_cor_code_cpe            NUMBER,
  mn_incl_cor_in_stars       VARCHAR2(1),
  x_use_tran_glo_in_gpa      VARCHAR2(1),
  cor_days_meet_possible     VARCHAR2(120),
  wa_adv_placement_code      VARCHAR2(16),
  x_use_tran_glo_in_earn_crd VARCHAR2(1),
  cor_grade_system           VARCHAR2(16),
  cor_grade_type             VARCHAR2(16),
  wa_honors_option           VARCHAR2(1),
  wa_recurring               VARCHAR2(1),
  egb_academic_id            VARCHAR2(16),
  egb_academic_dflt_entity   VARCHAR2(16),
  excl_from_rank             VARCHAR2(1),
  cor_nbr_alt_reqs           NUMBER,
  mi_cor_assign_code         NUMBER,
  activity_id                VARCHAR2(16),
  ut_where_taught            VARCHAR2(6),
  ut_college_code            VARCHAR2(16),
  ut_college_crdt            NUMBER(17,2),
  ut_duel_crdt_cor           VARCHAR2(1),
  wa_int_bac                 VARCHAR2(16),
  cor_academic_minutes       NUMBER,
  reading_intervention       VARCHAR2(2),
  dual_enroll_ind            VARCHAR2(2),
  schedule_method            VARCHAR2(2),
  special_program            VARCHAR2(2),
  fefp_number                NUMBER,
  fte_eligible               VARCHAR2(1),
  fl_course_flag             VARCHAR2(8),
  nces_subj_ident_lvl        VARCHAR2(32),
  clas_sr_char               VARCHAR2(270),
  content_area               VARCHAR2(6),
  st_cor_subj_ident          VARCHAR2(10),
  nces_credit_seq            VARCHAR2(12),
  sr_char                    VARCHAR2(450),
  has_wrtg_emphasis          VARCHAR2(1)
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
create bitmap index ALLEN.BMX_COURSE_CORHASGRADES on ALLEN.COURSE (COR_HAS_GRADES)
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
create bitmap index ALLEN.BMX_COURSE_CORNUMID on ALLEN.COURSE (COR_NUM_ID)
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
create bitmap index ALLEN.BMX_COURSE_CORSTATUS on ALLEN.COURSE (COR_STATUS)
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
create bitmap index ALLEN.BMX_COURSE_SCHOOLYEAR on ALLEN.COURSE (SCHOOL_YEAR)
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
prompt Creating table COURSE_EXT
prompt =========================
prompt
create table ALLEN.COURSE_EXT
(
  entity_id            VARCHAR2(5) not null,
  school_year          NUMBER not null,
  cor_alphakey         VARCHAR2(10) not null,
  service_id           VARCHAR2(50),
  trans_area           VARCHAR2(10),
  voc_ed_contact_hrs   NUMBER,
  cor_num_id           NUMBER not null,
  unit_desc            VARCHAR2(50),
  honor_roll           NUMBER,
  multiple_trans_areas NUMBER,
  pe_waiver_semesters  NUMBER,
  tx_aar_sem_bucket    NUMBER,
  r10_loaddate         DATE
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
create bitmap index ALLEN.BXI_COURSE_EXT_COR_NUM_ID on ALLEN.COURSE_EXT (COR_NUM_ID)
  tablespace DW_DEFAULT02
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
prompt Creating table COURSE_STAFF
prompt ===========================
prompt
create table ALLEN.COURSE_STAFF
(
  clone_to_ny         VARCHAR2(1),
  min_percentage      NUMBER,
  max_percentage      NUMBER,
  priority            NUMBER,
  name_id             NUMBER,
  cor_num_id          NUMBER,
  use_percent_nbr_rng VARCHAR2(16)
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
prompt Creating table DIS_ACTION
prompt =========================
prompt
create table ALLEN.DIS_ACTION
(
  dis_action_id           VARCHAR2(3),
  dis_action_sdesc        VARCHAR2(15),
  dis_action_ldesc        VARCHAR2(30),
  dis_action_flag         VARCHAR2(1),
  dis_action_time         NUMBER(7,2),
  dis_action_susp_type    VARCHAR2(1),
  dis_action_points       NUMBER(7,2),
  dis_action_severity     VARCHAR2(10),
  dis_action_unused_char1 VARCHAR2(30),
  dis_action_unused_char2 VARCHAR2(30),
  use_in_referrals        VARCHAR2(10),
  state_act_code          VARCHAR2(10)
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
prompt Creating table DIS_ACTION_DIFF_REASON
prompt =====================================
prompt
create table ALLEN.DIS_ACTION_DIFF_REASON
(
  diff_reason_ldesc VARCHAR2(30),
  diff_reason_sdesc VARCHAR2(15),
  diff_reason_id    VARCHAR2(12)
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
prompt Creating table DIS_OFFENSE
prompt ==========================
prompt
create table ALLEN.DIS_OFFENSE
(
  dis_offense_id       VARCHAR2(3),
  dis_offense_sdesc    VARCHAR2(15),
  dis_offense_ldesc    VARCHAR2(30),
  dis_offense_points   NUMBER(7,2),
  live                 VARCHAR2(10),
  dis_offense_severity VARCHAR2(10),
  dis_action_id        VARCHAR2(3),
  dis_drug_related     VARCHAR2(10),
  dis_weapon_related   VARCHAR2(10),
  dis_injury_related   VARCHAR2(10),
  off_unused_char_1    VARCHAR2(30),
  off_unused_char_2    VARCHAR2(30),
  off_unused_date_1    VARCHAR2(14),
  off_unused_date_2    VARCHAR2(14),
  off_unused_dec_1     NUMBER(7,2),
  off_unused_dec_2     NUMBER(7,2),
  off_unused_int_1     VARCHAR2(10),
  off_unused_int_2     VARCHAR2(10),
  off_unused_log_1     VARCHAR2(10),
  off_unused_log_2     VARCHAR2(10),
  sys_mi_off_type      VARCHAR2(2),
  dis_felony_misdem    VARCHAR2(1),
  dis_exp_reason       VARCHAR2(2),
  use_in_referrals     VARCHAR2(10),
  dis_alcohol_related  VARCHAR2(10),
  dis_hate_related     VARCHAR2(10),
  dis_gang_related     VARCHAR2(10),
  state_off_code       VARCHAR2(10),
  bullying_related     VARCHAR2(10)
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
prompt Creating table ENTITY_YEAR
prompt ==========================
prompt
create table ALLEN.ENTITY_YEAR
(
  entity_id    VARCHAR2(5),
  school_year  VARCHAR2(10),
  max_sch_prds VARCHAR2(10)
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
prompt Creating table ERP_ADDRESS
prompt ==========================
prompt
create table ALLEN.ERP_ADDRESS
(
  address_id        NUMBER(11),
  street_dir        VARCHAR2(6),
  street_number     VARCHAR2(20),
  street_name       VARCHAR2(50),
  street_appt       VARCHAR2(17),
  pobox             VARCHAR2(21),
  address2          VARCHAR2(60),
  zip_code          VARCHAR2(12),
  plus4             VARCHAR2(8),
  carrier_number    VARCHAR2(12),
  township_id       VARCHAR2(6),
  county_id         VARCHAR2(6),
  hazard_id         VARCHAR2(6),
  own_rent_code     VARCHAR2(2),
  dwelling_id       VARCHAR2(6),
  address_conf_code CHAR(1),
  census_area       VARCHAR2(12),
  census_sub_area   VARCHAR2(12),
  loc_ver           VARCHAR2(12),
  loc_hor           VARCHAR2(12),
  live              CHAR(1),
  old_address_key   VARCHAR2(30),
  path_id           VARCHAR2(6),
  mail_to           VARCHAR2(2),
  apt_lot           VARCHAR2(4),
  path_id_minority  VARCHAR2(16),
  country_id        VARCHAR2(16),
  path_id_majority  VARCHAR2(16),
  rural_box_nbr     VARCHAR2(16),
  r10_loaddate      DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPKADDRESS on ALLEN.ERP_ADDRESS (ADDRESS_ID)
  tablespace DW_DEFAULT02
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
prompt Creating table ERP_NAME
prompt =======================
prompt
create table ALLEN.ERP_NAME
(
  name_id                   NUMBER,
  bus_ind_type              CHAR(1),
  first_name                VARCHAR2(30),
  middle_name               VARCHAR2(30),
  last_name                 VARCHAR2(60),
  nalphakey                 VARCHAR2(22),
  federal_id_no             VARCHAR2(18),
  address_id                NUMBER,
  primary_phone             VARCHAR2(20),
  second_phone              VARCHAR2(20),
  fax_number                VARCHAR2(20),
  confidential_code         VARCHAR2(1),
  contact_person            VARCHAR2(60),
  comments                  VARCHAR2(240),
  internet_address          VARCHAR2(80),
  obs_x_duser               VARCHAR2(1),
  obs_x_emer_contact        VARCHAR2(1),
  obs_x_employer            VARCHAR2(1),
  obs_x_feeder_school       VARCHAR2(1),
  obs_x_guardian            VARCHAR2(1),
  obs_x_health_professional VARCHAR2(1),
  obs_x_hospital            VARCHAR2(1),
  obs_x_incl_census         VARCHAR2(1),
  obs_x_insurance_co        VARCHAR2(1),
  obs_x_organization        VARCHAR2(1),
  obs_x_physician           VARCHAR2(1),
  obs_x_staff               VARCHAR2(1),
  obs_x_student             VARCHAR2(1),
  obs_x_vendor              VARCHAR2(1),
  birthdate                 VARCHAR2(8),
  gender                    VARCHAR2(2),
  marital_status            VARCHAR2(2),
  highest_ed_level_id       VARCHAR2(6),
  occupation_id             VARCHAR2(10),
  language_code             VARCHAR2(6),
  race_code                 VARCHAR2(6),
  n_employer                NUMBER,
  n_organization            NUMBER,
  live                      VARCHAR2(1),
  salutation_id             VARCHAR2(6),
  primary_phone_ext         VARCHAR2(10),
  second_phone_ext          VARCHAR2(10),
  obs_x_publisher           VARCHAR2(1),
  obs_x_alumni              VARCHAR2(1),
  alumni_grad_yr            NUMBER,
  addr_mail_id              NUMBER,
  third_phone               VARCHAR2(20),
  third_phone_ext           VARCHAR2(10),
  second_phone_type         VARCHAR2(2),
  third_phone_type          VARCHAR2(2),
  name_suffix_id            VARCHAR2(8),
  ein                       VARCHAR2(18),
  barcode_nbr               NUMBER,
  barcode_date              VARCHAR2(8),
  birth_place               VARCHAR2(60),
  primary_phone_cat         VARCHAR2(16),
  second_phone_cat          VARCHAR2(16),
  third_phone_cat           VARCHAR2(16),
  sif_name_ref_id           VARCHAR2(64),
  state_code                VARCHAR2(16),
  conf_addr                 VARCHAR2(1),
  conf_phone2               VARCHAR2(1),
  conf_phone3               VARCHAR2(1),
  conf_ssn                  VARCHAR2(1),
  conf_marital_sts          VARCHAR2(8),
  conf_dob                  VARCHAR2(1),
  truetime_code             NUMBER,
  birth_city                VARCHAR2(16),
  birth_state               VARCHAR2(16),
  birth_country             VARCHAR2(16),
  birth_county              VARCHAR2(16),
  mothers_maiden_name       VARCHAR2(60),
  birth_country_code        VARCHAR2(8),
  country_of_citizenship    VARCHAR2(8),
  country_of_residence      VARCHAR2(8),
  country_arrival_date      VARCHAR2(8),
  citizenship_status        VARCHAR2(8),
  deceased_dte              VARCHAR2(8),
  qqqblb_blob_id            NUMBER,
  use_biometric             VARCHAR2(6),
  alternative_link_id       NUMBER,
  alternate_id              VARCHAR2(7),
  primary_phone_long_dist   VARCHAR2(1),
  custodial_parent          VARCHAR2(1),
  sexual_offender           VARCHAR2(1),
  no_connect_ed             VARCHAR2(1),
  allow_pick_up             VARCHAR2(1),
  ethnicity_hisp_x          VARCHAR2(1),
  wi_payee_id               VARCHAR2(20),
  race_verified_by          VARCHAR2(30),
  wa_race_subgroup          VARCHAR2(6),
  race_verified_date        VARCHAR2(8),
  fed_race_flags            VARCHAR2(10),
  conf_race_x               VARCHAR2(1),
  wa_ethnicity_group        VARCHAR2(6),
  conv_field_1              VARCHAR2(16),
  conv_field_2              VARCHAR2(16)
)
tablespace DW_DEFAULT_INDEX
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
create unique index ALLEN.XAK16NAME_ADDRESS on ALLEN.ERP_NAME (ADDRESS_ID, NALPHAKEY)
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
create unique index ALLEN.XAK18NAME_ADDR_MAIL_ID on ALLEN.ERP_NAME (ADDR_MAIL_ID, NAME_ID)
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
create unique index ALLEN.XAK2NAME_ALPHAKEY on ALLEN.ERP_NAME (NALPHAKEY)
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
create unique index ALLEN.XPKNAME on ALLEN.ERP_NAME (NAME_ID)
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
prompt Creating table ERP_QGT97_GENERIC_TABLE
prompt ======================================
prompt
create table ALLEN.ERP_QGT97_GENERIC_TABLE
(
  qgt97_unique_code VARCHAR2(16),
  qgt97_date        VARCHAR2(440),
  qgt97_logical     VARCHAR2(160),
  qgt97_dec         VARCHAR2(440),
  qgt97_int         VARCHAR2(440),
  qgt97_chr         VARCHAR2(540),
  qgt97_sort2_3     VARCHAR2(16),
  qgt97_sort2_2     VARCHAR2(16),
  qgt97_sort2_1     VARCHAR2(16),
  qgt97_sort3       VARCHAR2(16),
  qgt97_sort2       VARCHAR2(16),
  qgt97_sort1       VARCHAR2(16),
  qgt97_src_code    VARCHAR2(16),
  qgt97_src_id      NUMBER,
  qgt97_table_name  VARCHAR2(28),
  qgt97_record_id   NUMBER
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
create bitmap index ALLEN.BMI_ERP_QGT97_SRC_ID on ALLEN.ERP_QGT97_GENERIC_TABLE (QGT97_SRC_ID)
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
create bitmap index ALLEN.BMI_ERP_QGT97_TABLE_NAME on ALLEN.ERP_QGT97_GENERIC_TABLE (QGT97_TABLE_NAME)
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
prompt Creating table ERP_SYS_CTD
prompt ==========================
prompt
create table ALLEN.ERP_SYS_CTD
(
  date_1     VARCHAR2(8),
  dec_1      NUMBER,
  int_2      NUMBER,
  int_1      NUMBER,
  log_2      VARCHAR2(1),
  log_1      VARCHAR2(1),
  char_2     VARCHAR2(4000),
  char_1     VARCHAR2(4000),
  end_year   NUMBER,
  start_year NUMBER,
  time_added NUMBER,
  date_added VARCHAR2(8),
  code_sdesc VARCHAR2(4000),
  code_ldesc VARCHAR2(4000),
  code_id    VARCHAR2(50),
  table_id   VARCHAR2(50),
  x_default  VARCHAR2(1)
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
create bitmap index ALLEN.BMI_ERP_SYS_CTD_CODE_ID on ALLEN.ERP_SYS_CTD (CODE_ID)
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
create bitmap index ALLEN.BMI_ERP_SYS_CTD_TABLE_ID on ALLEN.ERP_SYS_CTD (TABLE_ID)
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
prompt Creating table ERP_SYS_CTM
prompt ==========================
prompt
create table ALLEN.ERP_SYS_CTM
(
  unused_char_1    VARCHAR2(16),
  time_added       NUMBER,
  date_added       VARCHAR2(8),
  tbl_sdesc        VARCHAR2(100),
  tbl_ldesc        VARCHAR2(100),
  table_id         VARCHAR2(100),
  x_allow_maintain VARCHAR2(1)
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
create bitmap index ALLEN.BMI_ERP_SYS_CTM_TABLE_ID on ALLEN.ERP_SYS_CTM (TABLE_ID)
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
prompt Creating table ERP_ZIP
prompt ======================
prompt
create table ALLEN.ERP_ZIP
(
  zip_code       VARCHAR2(12),
  zip_city       VARCHAR2(40),
  zip_state      VARCHAR2(4),
  zip_country    VARCHAR2(16),
  live           CHAR(1),
  x_validate_zip CHAR(1),
  x_dist_zip     CHAR(1),
  r10_loaddate   DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table FAMILY
prompt =====================
prompt
create table ALLEN.FAMILY
(
  family_id                  NUMBER not null,
  salutation_id              VARCHAR2(6),
  language_code              VARCHAR2(6),
  salutation_label           VARCHAR2(120),
  salutation_override        VARCHAR2(1),
  family_transportation_code VARCHAR2(22),
  x_use_hard_copy_rpt_crd    VARCHAR2(1),
  x_use_hard_copy_trans      VARCHAR2(1),
  family_common              VARCHAR2(1),
  x_use_lang_code            VARCHAR2(1),
  ny_track_req               VARCHAR2(20),
  ny_track                   VARCHAR2(4),
  cy_track_req               VARCHAR2(20),
  cy_track                   VARCHAR2(4),
  lang_survey_date           VARCHAR2(8)
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
create bitmap index ALLEN.XPKFAMILY on ALLEN.FAMILY (FAMILY_ID)
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
prompt Creating table FFAMAD_ACCT_DESCS
prompt ================================
prompt
create table ALLEN.FFAMAD_ACCT_DESCS
(
  ffasdc_ind    VARCHAR2(8),
  ffamad_code   VARCHAR2(16),
  ffamad_fund   VARCHAR2(20),
  ffamad_desc   VARCHAR2(60),
  ffamad_sdesc  VARCHAR2(30),
  ffamad_prim   VARCHAR2(20),
  ffamad_xwalk  VARCHAR2(20),
  wa_ct_fund    NUMBER(11),
  wa_ct_dist_id VARCHAR2(16),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table FFAMAM_ACCT_MST
prompt ==============================
prompt
create table ALLEN.FFAMAM_ACCT_MST
(
  ffamam_acct_id        NUMBER,
  ffamam_edited_acct    VARCHAR2(80),
  ffamg1_code           VARCHAR2(8),
  ffamam_acct_dim       VARCHAR2(240),
  ffamam_active_flag    VARCHAR2(1),
  ffamsa_code           VARCHAR2(16),
  ffamam_sum_enc_code   VARCHAR2(16),
  ffamg2_code           VARCHAR2(8),
  ffamg3_code           VARCHAR2(8),
  ffamgc_code           VARCHAR2(16),
  ffamam_acct_string    VARCHAR2(80),
  ffamam_deleted        VARCHAR2(1),
  ffamam_on_ann_bud     VARCHAR2(2),
  ffamam_date_created   VARCHAR2(10),
  ffamam_quick_key      VARCHAR2(24),
  ffamam_line           VARCHAR2(30),
  ffamam_misc_char      VARCHAR2(30),
  ffampt_project_number VARCHAR2(20),
  ffamsa_closing_acct   VARCHAR2(16)
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
prompt Creating table FFAMDH_HISTORY
prompt =============================
prompt
create table ALLEN.FFAMDH_HISTORY
(
  ffamdh_id                NUMBER,
  ffamdh_ref1              VARCHAR2(90),
  ffamdh_ref2              VARCHAR2(90),
  ffamam_acct_id           NUMBER,
  ffamdh_amount            NUMBER,
  name_id                  NUMBER,
  ffambt_code              VARCHAR2(16),
  ffamdh_desc1             VARCHAR2(216),
  ffamdh_desc2             VARCHAR2(120),
  ffamgd_line_nbr          NUMBER,
  ffamdh_source            VARCHAR2(12),
  ffamdh_batch             VARCHAR2(16),
  ffamdh_upd_date          VARCHAR2(8),
  ffamdh_amt_credit        NUMBER(17,2),
  ffamdh_amt_debit         NUMBER(17,2),
  ffamdh_sub_source        VARCHAR2(12),
  ffamdh_upd_time          NUMBER,
  ffamud_id                NUMBER,
  ffamdh_tran_date         VARCHAR2(8),
  ffamdh_create_date       VARCHAR2(8),
  ffamdh_create_time       NUMBER,
  ffamdh_create_by         NUMBER,
  ffamdh_cash_ffapbr_id    NUMBER,
  ffamdh_stmt_ffapbr_id    NUMBER,
  ffamdh_equity_id         NUMBER,
  ffamdh_cash_id           NUMBER(17,2),
  ffamdh_accrual_id        NUMBER,
  ffamdh_accr_rev_id       NUMBER,
  ffamdh_po_enc_reserve_id NUMBER,
  ffamdh_po_enc_offset_id  NUMBER,
  ffampt_project_number    VARCHAR2(20),
  ffamdh_misc_char1        VARCHAR2(16),
  ffamdh_sum_type          VARCHAR2(16),
  ffamdh_dtl_sum_tran      VARCHAR2(16),
  ffamdh_audit_entry_type  VARCHAR2(20),
  ffamdh_audit_entry_x     VARCHAR2(1)
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
prompt Creating table FFAMFA_FIS_YTD
prompt =============================
prompt
create table ALLEN.FFAMFA_FIS_YTD
(
  ffamfa_fis_year       VARCHAR2(4),
  ffamam_acct_id        VARCHAR2(10),
  ffamfa_amt_credit     NUMBER(12,3),
  ffamfa_beg_balance    NUMBER(12,3),
  ffamfa_amt_debit      NUMBER(12,3),
  ffamfa_org_budget     NUMBER(12,3),
  ffamfa_revisions      NUMBER(12,3),
  ffamfa_transfers      NUMBER(12,3),
  ffamfa_enc            NUMBER(12,3),
  ffamfa_dpt_budget     NUMBER(12,3),
  ffamfa_adm_budget     NUMBER(12,3),
  ffamfa_board_budget   NUMBER(12,3),
  ffamfa_budget_froze_x NUMBER(12,3),
  ffamfa_est_actual_amt NUMBER(12,3),
  ffamfa_enc_from_py    NUMBER(12,3),
  ffamfa_budget_from_py NUMBER(12,3),
  wa_transfer_in        NUMBER(12,3),
  wa_transfer_out       NUMBER(12,3),
  wa_debits             NUMBER(12,3),
  wa_credits            NUMBER(12,3),
  ffamfa_bud_adopt_dt   VARCHAR2(12),
  ffamfa_eq_sum_acct_id VARCHAR2(10),
  ffamfa_fte_projected  NUMBER(12,3),
  ffamfa_fte_est        NUMBER(7,4),
  ffamfa_fte_act        NUMBER(7,4),
  ffampt_project_number VARCHAR2(10)
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
create bitmap index ALLEN.BMI_FFAMFA_FIS_YTD_ACCT_ID on ALLEN.FFAMFA_FIS_YTD (FFAMAM_ACCT_ID)
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

prompt
prompt Creating table FFAMMA_MONTH_ACT
prompt ===============================
prompt
create table ALLEN.FFAMMA_MONTH_ACT
(
  ffamma_cal_year        NUMBER(11),
  ffamma_month           NUMBER(11),
  ffamam_acct_id         NUMBER(11),
  ffamma_amt_credit      NUMBER,
  ffamma_amt_debit       NUMBER,
  ffamma_enc             NUMBER,
  wa_debits              NUMBER,
  wa_credits             NUMBER,
  wa_transfer_out        NUMBER,
  wa_transfer_in         NUMBER,
  ffamma_original_budget NUMBER,
  ffamma_revisions       NUMBER,
  ffamma_transfers       NUMBER,
  r10_loaddate           DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_FFAMMA on ALLEN.FFAMMA_MONTH_ACT (FFAMAM_ACCT_ID, FFAMMA_CAL_YEAR, FFAMMA_MONTH)
  tablespace DW_DEFAULT02
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
prompt Creating table FS_TRANSACTION
prompt =============================
prompt
create table ALLEN.FS_TRANSACTION
(
  fs_tran_date             VARCHAR2(8),
  fs_tran_time             NUMBER(17,2),
  fs_tran_user_id          NUMBER,
  name_id                  NUMBER,
  fs_tran_ref_nbr          NUMBER,
  fs_tran_effective_date   VARCHAR2(8),
  fs_lun_code_id           VARCHAR2(2),
  fs_name_id_payor         NUMBER,
  fs_tran_payor_amt        NUMBER,
  fs_tran_payor_incentive  NUMBER,
  fs_price_cat_id          VARCHAR2(6),
  fs_tran_program_from     VARCHAR2(16),
  nalphakey                VARCHAR2(22),
  fs_tran_appl_type        VARCHAR2(2),
  x_current_record         VARCHAR2(1),
  wa_fs_lun_fr_rdc_rsn_cde VARCHAR2(16),
  x_wa_fr_consent          VARCHAR2(1)
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
create bitmap index ALLEN.BMI_LUNCH_CODE_ID on ALLEN.FS_TRANSACTION (FS_LUN_CODE_ID)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.BMI_NAME_ID on ALLEN.FS_TRANSACTION (NAME_ID)
  tablespace DW_DEFAULT02
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
create bitmap index ALLEN.BMI_TRANS_EFF_DT on ALLEN.FS_TRANSACTION (FS_TRAN_EFFECTIVE_DATE)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table FTX_EMP_DEMOGRAPHIC
prompt ==================================
prompt
create table ALLEN.FTX_EMP_DEMOGRAPHIC
(
  name_id                NUMBER(11),
  total_exp              NUMBER(11),
  district_exp           NUMBER(11),
  pct_day_employed       NUMBER(11),
  actual_days_employed   NUMBER(11),
  position_days_employed NUMBER(11),
  fis_year               NUMBER(11),
  r10_loaddate           DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_FTX_EMP_DEMOGRAPHIC on ALLEN.FTX_EMP_DEMOGRAPHIC (NAME_ID, FIS_YEAR)
  tablespace DW_DEFAULT02
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
prompt Creating table GRADING_PERIOD
prompt =============================
prompt
create table ALLEN.GRADING_PERIOD
(
  entity_id              VARCHAR2(10),
  school_year            NUMBER,
  track                  NUMBER,
  gp_start_date          VARCHAR2(8),
  gp_end_date            VARCHAR2(8),
  grading_period_nbr     NUMBER,
  gp_dsp_str_trm         NUMBER,
  gp_dsp_stp_trm         NUMBER,
  gp_schd_str_trm        NUMBER,
  gp_schd_stp_trm        NUMBER,
  gp_prnt_input_date     VARCHAR2(8),
  gp_turnin_input_date   VARCHAR2(8),
  gp_athletic_other_only VARCHAR2(1),
  gp_print_rc            VARCHAR2(1),
  gp_run_honor_roll      VARCHAR2(1),
  gp_run_ranking         VARCHAR2(1),
  gp_desc                VARCHAR2(40),
  gp_gra_str_trm         NUMBER,
  gp_gra_stp_trm         NUMBER,
  gp_input_str_time      NUMBER,
  gp_input_stp_time      NUMBER,
  sgb_minimum_percent    NUMBER
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
prompt Creating table HAABLD_BLD_CODES
prompt ===============================
prompt
create table ALLEN.HAABLD_BLD_CODES
(
  haabld_desc        VARCHAR2(60),
  haabld_sdesc       VARCHAR2(30),
  haabld_bld_code    VARCHAR2(10),
  haabld_state_code  VARCHAR2(20),
  haabld_misc_char_1 VARCHAR2(256),
  haabld_school_type VARCHAR2(16),
  r10_loaddate       DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_HAABLD on ALLEN.HAABLD_BLD_CODES (HAABLD_BLD_CODE)
  tablespace DW_DEFAULT02
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
prompt Creating table HAADSC_DESCS
prompt ===========================
prompt
create table ALLEN.HAADSC_DESCS
(
  haadsc_code                 VARCHAR2(16),
  haadsc_desc                 VARCHAR2(60),
  haadsc_id                   NUMBER(11),
  haadsc_ind                  VARCHAR2(24),
  haadsc_old_char_code        VARCHAR2(16),
  haadsc_tecs_rpt_peims       CHAR(1),
  haadsc_tecs_trs_grp         VARCHAR2(16),
  haadsc_job_type_flag        VARCHAR2(24),
  haadsc_pa_rnd_x             CHAR(1),
  haadsc_chkwrtamt_prt_suf_x  CHAR(1),
  haadsc_chkwrtamt_suf_lit_s  VARCHAR2(16),
  haadsc_chkwrtamt_suf_lit_p  VARCHAR2(16),
  haadsc_chkwrtamt_prt_pre_x  CHAR(1),
  haadsc_chkwrtamt_prt_frac_x CHAR(1),
  haadsc_chkwrtamt_pre_lit_s  VARCHAR2(16),
  haadsc_chkwrtamt_pre_lit_p  VARCHAR2(16),
  haadsc_chkwrtamt_frac_lit_s VARCHAR2(16),
  haadsc_chkwrtamt_frac_lit_p VARCHAR2(16),
  haadsc_chkwrtdate_format    VARCHAR2(16),
  r10_loaddate                DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_HAADSC on ALLEN.HAADSC_DESCS (HAADSC_ID)
  tablespace DW_DEFAULT02
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
prompt Creating table HAAPRO_PROFILE
prompt =============================
prompt
create table ALLEN.HAAPRO_PROFILE
(
  haapro_ret_class_mi          VARCHAR2(8),
  hpadcx_pera_exclsn_code      NUMBER,
  haapro_ret_emp_type_sd       VARCHAR2(4),
  haapro_ret_cls_idaho         VARCHAR2(4),
  haapro_ret_type_mm           VARCHAR2(2),
  haapro_ret_assoc_mm          VARCHAR2(2),
  haapro_ret_cat               VARCHAR2(4),
  haapro_uniq_code_mm          VARCHAR2(4),
  haapro_ret_nbr               VARCHAR2(18),
  haapro_ret_yn                VARCHAR2(1),
  haapro_tax_sts_st            VARCHAR2(2),
  haapro_tax_sts_fed           VARCHAR2(2),
  haabld_bld_code              VARCHAR2(10),
  haaety_emp_type_code         VARCHAR2(10),
  hpadcl_chk_loc_code          VARCHAR2(10),
  haapro_faculty               VARCHAR2(1),
  aastc_state_abbrev           VARCHAR2(4),
  haapro_dep_add               NUMBER,
  haapro_dep_st                NUMBER,
  haapro_dep_fed               NUMBER,
  haapro_dep_act               NUMBER,
  name_id                      NUMBER not null,
  haapro_hire_dte              VARCHAR2(8),
  haapro_start_dte             VARCHAR2(8),
  haapro_term_dte              VARCHAR2(8),
  haapro_active                VARCHAR2(1),
  hpeter_term_code             VARCHAR2(10),
  haapro_i9_date               VARCHAR2(8),
  nalphakey                    VARCHAR2(22),
  haapro_ref_type              VARCHAR2(2),
  haapro_ret_active            VARCHAR2(2),
  haapro_ret_cat2              VARCHAR2(4),
  haapro_maiden_name           VARCHAR2(40),
  haapro_spouse_name           VARCHAR2(60),
  haapro_ret_pay_rate_mi       NUMBER(17,2),
  haaplc_code                  VARCHAR2(10),
  tecs_trs_member              VARCHAR2(16),
  haapro_loc_tax_cod_1         VARCHAR2(10),
  haapro_loc_tax_exempts_per_1 NUMBER,
  haapro_loc_tax_exempts_dep_1 NUMBER,
  haapro_loc_tax_cod_2         VARCHAR2(10),
  haapro_loc_tax_res_2_x       VARCHAR2(1),
  haapro_loc_tax_res_1_x       VARCHAR2(1),
  haapro_loc_tax_exempts_per_2 NUMBER,
  haapro_loc_tax_exempts_dep_2 NUMBER,
  haapro_exmpts_per            NUMBER,
  haapro_exmpts_dep            NUMBER,
  haadsc_id_hr_type            NUMBER,
  haapro_flx_eta_nbr           NUMBER,
  haapro_pct_of_yr             NUMBER,
  haapro_hrt_id                NUMBER,
  haapro_ret_emplymnt_typ_il   VARCHAR2(2),
  haapro_seq_nbr               NUMBER,
  qqqblb_id                    NUMBER,
  haapro_hire_time             NUMBER,
  haapro_tax_sts_eic           VARCHAR2(16),
  haapro_uc_tax_state          VARCHAR2(16),
  haapro_haacam_id             NUMBER,
  haapro_tx_er10_part_cod      VARCHAR2(22),
  haapro_tx_mem_id_typ         VARCHAR2(16),
  haapro_tx_trs_alt_id         VARCHAR2(18),
  haapro_us_citizen_x          VARCHAR2(1),
  haapro_tx_yrrnd_tch_x        VARCHAR2(1),
  haapro_prt_deposit_x         VARCHAR2(1),
  haapro_other_id              VARCHAR2(24),
  haapro_yrs_exp1              NUMBER,
  haapro_yrs_exp2              NUMBER,
  haapro_yrs_exp3              NUMBER,
  haapro_yrs_exp4              NUMBER,
  haapro_yrs_exp5              NUMBER,
  haapro_conf_tax_info         VARCHAR2(1),
  haapro_conf_spouse_name      VARCHAR2(1),
  haapro_conf_former_name      VARCHAR2(1),
  haapro_retired               VARCHAR2(16),
  haapro_retired_dte           VARCHAR2(8),
  haapro_init_cert_year        NUMBER,
  haapro_eligibility_date      VARCHAR2(8),
  haapro_tasb_lock_x           VARCHAR2(1),
  haapro_gen_asp_id            NUMBER,
  haapro_yrs_exp6              NUMBER,
  haapro_yrs_exp7              NUMBER,
  haapro_yrs_exp8              NUMBER,
  haapro_yrs_exp9              NUMBER,
  haapro_yrs_exp10             NUMBER,
  haapro_rehire_flag           VARCHAR2(16),
  haapro_rehire_date           VARCHAR2(8),
  haapro_retire                VARCHAR2(16),
  haapro_w2_consent_x          VARCHAR2(1),
  haapro_rep_hire_date         VARCHAR2(8),
  haapro_rep_pic               NUMBER,
  hwptrt_status                VARCHAR2(16),
  hwptrt_duration              VARCHAR2(16),
  hwptrt_return_time           VARCHAR2(16),
  hwptrt_summary               VARCHAR2(16),
  hwptrt_customer              VARCHAR2(16),
  hwptrt_start_time            NUMBER,
  hwptrt_stop_time             NUMBER,
  hwptrt_date                  VARCHAR2(8),
  hwptrt_misc_char_1           VARCHAR2(16),
  hwptrt_misc_char_2           VARCHAR2(16),
  hwptrt_misc_char_3           VARCHAR2(16),
  hwptrt_misc_int_1            NUMBER,
  hwptrt_misc_int_2            NUMBER,
  hwptrt_misc_date_1           VARCHAR2(8),
  hwptrt_misc_date_2           VARCHAR2(8),
  haapro_char_1                VARCHAR2(16),
  haapro_char_2                VARCHAR2(16),
  haapro_char_3                VARCHAR2(16),
  haapro_char_4                VARCHAR2(16),
  haapro_char_5                VARCHAR2(16),
  haapro_w2_delivery_addr      VARCHAR2(36),
  haapro_w2_location_addr      VARCHAR2(30),
  haapro_trs_term_date         VARCHAR2(8),
  haapro_prt_chk_curr_ind      VARCHAR2(16),
  haapro_eeoc_type             VARCHAR2(16),
  haapro_eeoc_code             VARCHAR2(16),
  haapro_w2_addr_zip_plus4     VARCHAR2(16),
  haapro_w2_addr_zip           VARCHAR2(30),
  haapro_w2_addr_st            VARCHAR2(46),
  haapro_ret_serv_credit_tn    NUMBER,
  haapro_ret_fte_nm            NUMBER,
  haapro_ret_job_class_nm      VARCHAR2(16),
  haapro_ret_job_cat_nm        VARCHAR2(16),
  haapro_ret_typ_tn            NUMBER,
  haapro_ret_dept_tn           NUMBER,
  exempt_pr_law                VARCHAR2(1),
  haapro_pos_start_dte         VARCHAR2(8),
  haapro_yrs_exp15             NUMBER,
  haapro_yrs_exp14             NUMBER,
  haapro_yrs_exp13             NUMBER,
  haapro_yrs_exp12             NUMBER,
  haapro_yrs_exp11             NUMBER,
  haapro_fl_fish_nbr           VARCHAR2(16),
  haapro_status                VARCHAR2(30),
  haapro_hold_time_sheet_x     VARCHAR2(1),
  haapro_ret_dept              VARCHAR2(24),
  haapro_ret_term_dte          VARCHAR2(8),
  haapro_ret_position          VARCHAR2(20),
  haapro_ret_class             VARCHAR2(10),
  haapro_ret_educ_emp_x        VARCHAR2(1),
  haapro_ret_plan              VARCHAR2(4),
  haapro_non_res_alien_x       VARCHAR2(1),
  haapro_officer_py_x          VARCHAR2(1),
  haapro_officer_cy_x          VARCHAR2(1),
  haapro_doe_emp_type          VARCHAR2(1),
  haapro_employment_length     NUMBER,
  haapro_w2_addr_country       VARCHAR2(128),
  haapro_w2_addr_city          VARCHAR2(38),
  haapro_conf_veteran_sts_x    VARCHAR2(1),
  haabld_bld_2                 VARCHAR2(16),
  haapro_citizenship_country   VARCHAR2(16),
  haapro_contract_status       VARCHAR2(16),
  haapro_veteran_status        VARCHAR2(16),
  haapro_alternate_id          VARCHAR2(50),
  haapro_curr_ind              VARCHAR2(16),
  haapro_sick_bank_user_x      VARCHAR2(1),
  sif_haapro_ref_id            VARCHAR2(32)
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
prompt Creating table HPMCED_CERT_DTL
prompt ==============================
prompt
create table ALLEN.HPMCED_CERT_DTL
(
  hpmced_line_nbr           NUMBER(11),
  hpmcem_id                 NUMBER(11),
  haadsc_id_scope           NUMBER(11),
  haadsc_id_cert2           NUMBER(11),
  haadsc_id_cert1           NUMBER(11),
  hpmced_highly_qualified_x CHAR(1),
  hpmced_active_cert_x      CHAR(1),
  r10_loaddate              DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_HPMCED on ALLEN.HPMCED_CERT_DTL (HPMCEM_ID, HPMCED_LINE_NBR)
  tablespace DW_DEFAULT02
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
prompt Creating table HPMCEM_CERT_MST
prompt ==============================
prompt
create table ALLEN.HPMCEM_CERT_MST
(
  hpmcem_state        VARCHAR2(4),
  hpmcem_exp_date     VARCHAR2(10),
  hpmcem_issue_date   VARCHAR2(10),
  haadsc_id_cert_type NUMBER(11),
  hpmcem_cert_nbr     VARCHAR2(40),
  name_id             NUMBER(11),
  hpmcem_id           NUMBER(11),
  hpmcem_inst_name_id NUMBER(11),
  hpmcem_current_x    CHAR(1),
  r10_loaddate        DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_HPMCEM on ALLEN.HPMCEM_CERT_MST (HPMCEM_ID)
  tablespace DW_DEFAULT02
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
prompt Creating table HTODCD_TOF_CODES
prompt ===============================
prompt
create table ALLEN.HTODCD_TOF_CODES
(
  htodcd_unit_type           VARCHAR2(2),
  htodrs_grp_code            VARCHAR2(2),
  htodcd_desc                VARCHAR2(60),
  htodcd_tof_code            VARCHAR2(10),
  htodcd_neg_bal_warn        VARCHAR2(16),
  htodcd_tof_sale_ratio      NUMBER(11),
  htodcd_tof_minimun_balance NUMBER,
  htodcd_tx_rd_sr_crd_x      CHAR(1),
  htodcd_display_x           CHAR(1),
  htodcd_allow_neg_tof_req_x CHAR(1),
  htodcd_misc3               VARCHAR2(16),
  htodcd_misc2               VARCHAR2(16),
  htodcd_misc1               VARCHAR2(16),
  htodcd_display_in_ea_x     CHAR(1),
  r10_loaddate               DATE
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.XPK_HTODCD on ALLEN.HTODCD_TOF_CODES (HTODCD_TOF_CODE)
  tablespace DW_DEFAULT02
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
prompt Creating table HTODGR_GROUP_CODES
prompt =================================
prompt
create table ALLEN.HTODGR_GROUP_CODES
(
  htodgr_is_sick_leave CHAR(1),
  htodgr_desc          VARCHAR2(60),
  htodgr_grp_code      VARCHAR2(2),
  r10_loaddate         DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table HTODHP_HPD_CODES
prompt ===============================
prompt
create table ALLEN.HTODHP_HPD_CODES
(
  htodhp_hpd_amt  NUMBER,
  htodhp_desc     VARCHAR2(60),
  htodhp_hpd_code VARCHAR2(10),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table HTODRS_REASON_CODES
prompt ==================================
prompt
create table ALLEN.HTODRS_REASON_CODES
(
  htodrs_desc              VARCHAR2(60),
  htodrs_reason_code       VARCHAR2(10),
  htodrs_restrictions_x    CHAR(1),
  htodrs_long_desc         VARCHAR2(163),
  htodrs_exclude_from_ea_x CHAR(1),
  r10_loaddate             DATE
)
tablespace DW_DEFAULT02
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
create bitmap index ALLEN.xpk_htodrs on ALLEN.HTODRS_REASON_CODES (HTODRS_REASON_CODE)
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
  )
  nologging;

prompt
prompt Creating table HTOTRN_TRANS
prompt ===========================
prompt
create table ALLEN.HTOTRN_TRANS
(
  htotrn_desc         VARCHAR2(223),
  htotrn_ltd_record   VARCHAR2(2),
  htotrn_ltd_dys      NUMBER,
  htotrn_ltd_hrs      NUMBER,
  htodhp_hpd_code     VARCHAR2(10),
  htotrn_reason_code  VARCHAR2(18),
  htoacr_code         VARCHAR2(2),
  htotrn_del_flag     VARCHAR2(2),
  htodcd_unit_type    VARCHAR2(2),
  htotrn_dys          NUMBER,
  htotrn_hrs          NUMBER,
  htodgr_grp_code     VARCHAR2(2),
  htotrn_type         VARCHAR2(2),
  htotrn_trans_date   VARCHAR2(8),
  htodcd_tof_codes    VARCHAR2(10),
  name_id             NUMBER,
  htotrn_id           NUMBER not null,
  htotrn_calculated_x VARCHAR2(1),
  hpahdm_id           NUMBER,
  htotrn_misc3        VARCHAR2(16),
  htotrn_misc2        VARCHAR2(16),
  htotrn_misc1        VARCHAR2(16),
  htotrn_3rd_party_id NUMBER,
  htotrn_flma_rec_x   VARCHAR2(1),
  htotrn_add_time     NUMBER,
  htotrn_add_date     VARCHAR2(8)
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
prompt Creating table LOCATION
prompt =======================
prompt
create table ALLEN.LOCATION
(
  location_id       VARCHAR2(10),
  location_sdesc    VARCHAR2(30),
  location_ldesc    VARCHAR2(60),
  live              CHAR(1),
  loc_unused_dec_2  NUMBER(17,2),
  loc_unused_dec_1  NUMBER(17,2),
  loc_unused_char_2 VARCHAR2(16),
  loc_unused_char_1 VARCHAR2(16),
  loc_state_code    VARCHAR2(2),
  loc_unused_int_1  NUMBER,
  loc_unused_int_2  NUMBER,
  loc_unused_log_1  CHAR(1),
  loc_unused_log_2  CHAR(1),
  entity_id         VARCHAR2(10),
  st_int_2          NUMBER,
  st_int_1          NUMBER
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
prompt Creating table PATH
prompt ===================
prompt
create table ALLEN.PATH
(
  path_id     VARCHAR2(18),
  path_sdesc  VARCHAR2(30),
  path_ldesc  VARCHAR2(60),
  live        VARCHAR2(1),
  school_year VARCHAR2(10),
  misc_char   VARCHAR2(360),
  master_path VARCHAR2(16)
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
prompt Creating table RACE
prompt ===================
prompt
create table ALLEN.RACE
(
  race_code       VARCHAR2(6),
  race_sdesc      VARCHAR2(30),
  race_ldesc      VARCHAR2(50),
  live            CHAR(1),
  tecs_peims_code VARCHAR2(16),
  race_sif_id     VARCHAR2(16),
  r10_loaddate    DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table SCHD_PERIOD_TIMES
prompt ================================
prompt
create table ALLEN.SCHD_PERIOD_TIMES
(
  schd_prd_str_time_1 NUMBER,
  schd_prd_stp_time_2 NUMBER,
  schd_prd_str_time_2 NUMBER,
  schd_prd_stp_time_1 NUMBER,
  split_period        VARCHAR2(1),
  days_meet           VARCHAR2(80),
  day_nbr             NUMBER,
  clas_lun_code       VARCHAR2(16),
  dsp_period          NUMBER,
  school_year         NUMBER,
  entity_id           VARCHAR2(10),
  schd_period_hrs     NUMBER(17,2),
  allow_mb_to_suggest VARCHAR2(1),
  is_lunch_prd        VARCHAR2(1),
  sch_periods         VARCHAR2(440),
  spm_id              NUMBER
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
create bitmap index ALLEN.BMX_SCHD_PER_ENTITYID on ALLEN.SCHD_PERIOD_TIMES (ENTITY_ID)
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
create bitmap index ALLEN.BMX_SCHD_PER_SCHOOLYEAR on ALLEN.SCHD_PERIOD_TIMES (SCHOOL_YEAR)
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
prompt Creating table SCHOOL
prompt =====================
prompt
create table ALLEN.SCHOOL
(
  school_id               VARCHAR2(10) not null,
  school_principal        NUMBER,
  district_code           VARCHAR2(14),
  school_name             VARCHAR2(60),
  school_beg_grade        VARCHAR2(6),
  school_end_grade        VARCHAR2(6),
  school_phone            VARCHAR2(20),
  school_fax              VARCHAR2(20),
  live                    VARCHAR2(1),
  school_number           NUMBER,
  school_org_number       NUMBER,
  school_kindergarden_ind VARCHAR2(2),
  school_public_private   VARCHAR2(2),
  x_chapter_1             VARCHAR2(1),
  wa_remote_necessary     VARCHAR2(1),
  wa_fire_protection      VARCHAR2(16),
  wa_sch_entry_grade_lvl  VARCHAR2(16),
  wa_sch_bld_lvl          VARCHAR2(16),
  sif_sch_ref_id          VARCHAR2(64),
  building_id             VARCHAR2(10),
  in_sch_nbr              VARCHAR2(16),
  wa_title_1_reading      VARCHAR2(1),
  wa_title_1_math         VARCHAR2(1),
  title_1_type            VARCHAR2(16),
  wa_csrs_reporting       VARCHAR2(1),
  wa_summer_school        VARCHAR2(1),
  spec_ed_dept_chair      NUMBER
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
prompt Creating table SIS_ADDRESS
prompt ==========================
prompt
create table ALLEN.SIS_ADDRESS
(
  address_id        NUMBER not null,
  street_dir        VARCHAR2(6),
  street_number     VARCHAR2(20),
  street_name       VARCHAR2(50),
  street_appt       VARCHAR2(13),
  pobox             VARCHAR2(20),
  address2          VARCHAR2(60),
  zip_code          VARCHAR2(12),
  plus4             VARCHAR2(8),
  carrier_number    VARCHAR2(12),
  township_id       VARCHAR2(6),
  county_id         VARCHAR2(6),
  hazard_id         VARCHAR2(6),
  own_rent_code     VARCHAR2(2),
  dwelling_id       VARCHAR2(6),
  address_conf_code VARCHAR2(1),
  census_area       VARCHAR2(12),
  census_sub_area   VARCHAR2(12),
  loc_ver           VARCHAR2(12),
  loc_hor           VARCHAR2(12),
  live              VARCHAR2(1),
  old_address_key   VARCHAR2(30),
  path_id           VARCHAR2(18),
  mail_to           VARCHAR2(2),
  apt_lot           VARCHAR2(100),
  path_id_minority  VARCHAR2(18),
  country_id        VARCHAR2(16),
  path_id_majority  VARCHAR2(18),
  rural_box_nbr     VARCHAR2(16)
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
create bitmap index ALLEN.BMX_ADDRESSID on ALLEN.SIS_ADDRESS (ADDRESS_ID)
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
  )
  nologging;

prompt
prompt Creating table SIS_NAME
prompt =======================
prompt
create table ALLEN.SIS_NAME
(
  name_id                   NUMBER not null,
  bus_ind_type              VARCHAR2(1),
  first_name                VARCHAR2(30),
  middle_name               VARCHAR2(30),
  last_name                 VARCHAR2(60),
  nalphakey                 VARCHAR2(22) not null,
  federal_id_no             VARCHAR2(18),
  address_id                NUMBER,
  primary_phone             VARCHAR2(20),
  second_phone              VARCHAR2(20),
  fax_number                VARCHAR2(20),
  confidential_code         VARCHAR2(1) not null,
  contact_person            VARCHAR2(60),
  comments                  VARCHAR2(240),
  internet_address          VARCHAR2(80),
  obs_x_duser               VARCHAR2(1) not null,
  obs_x_emer_contact        VARCHAR2(1) not null,
  obs_x_employer            VARCHAR2(1) not null,
  obs_x_feeder_school       VARCHAR2(1) not null,
  obs_x_guardian            VARCHAR2(1) not null,
  obs_x_health_professional VARCHAR2(1) not null,
  obs_x_hospital            VARCHAR2(1) not null,
  obs_x_incl_census         VARCHAR2(1),
  obs_x_insurance_co        VARCHAR2(1) not null,
  obs_x_organization        VARCHAR2(1) not null,
  obs_x_physician           VARCHAR2(1) not null,
  obs_x_staff               VARCHAR2(1) not null,
  obs_x_student             VARCHAR2(1) not null,
  obs_x_vendor              VARCHAR2(1) not null,
  birthdate                 VARCHAR2(8),
  gender                    VARCHAR2(2),
  marital_status            VARCHAR2(2),
  highest_ed_level_id       VARCHAR2(6),
  occupation_id             VARCHAR2(10),
  language_code             VARCHAR2(6),
  race_code                 VARCHAR2(6),
  n_employer                NUMBER,
  n_organization            NUMBER,
  live                      VARCHAR2(1),
  salutation_id             VARCHAR2(6),
  primary_phone_ext         VARCHAR2(10),
  second_phone_ext          VARCHAR2(10),
  obs_x_publisher           VARCHAR2(1),
  obs_x_alumni              VARCHAR2(1),
  alumni_grad_yr            NUMBER,
  addr_mail_id              NUMBER,
  third_phone               VARCHAR2(20),
  third_phone_ext           VARCHAR2(10),
  second_phone_type         VARCHAR2(2),
  third_phone_type          VARCHAR2(2),
  name_suffix_id            VARCHAR2(8),
  ein                       VARCHAR2(10),
  barcode_nbr               NUMBER,
  barcode_date              VARCHAR2(8),
  birth_place               VARCHAR2(60),
  primary_phone_cat         VARCHAR2(16),
  second_phone_cat          VARCHAR2(16),
  third_phone_cat           VARCHAR2(16),
  sif_name_ref_id           VARCHAR2(64),
  state_code                VARCHAR2(16),
  conf_addr                 VARCHAR2(1),
  conf_phone2               VARCHAR2(1),
  conf_phone3               VARCHAR2(1),
  conf_ssn                  VARCHAR2(1),
  conf_marital_sts          VARCHAR2(1),
  conf_dob                  VARCHAR2(1),
  truetime_code             NUMBER,
  birth_city                VARCHAR2(16),
  birth_state               VARCHAR2(16),
  birth_country             VARCHAR2(16),
  birth_county              VARCHAR2(16),
  mothers_maiden_name       VARCHAR2(60),
  birth_country_code        VARCHAR2(8),
  country_of_citizenship    VARCHAR2(8),
  country_of_residence      VARCHAR2(8),
  country_arrival_date      VARCHAR2(8),
  citizenship_status        VARCHAR2(8),
  deceased_dte              VARCHAR2(8),
  qqqblb_blob_id            NUMBER,
  use_biometric             VARCHAR2(1),
  alternative_link_id       NUMBER,
  alternate_id              VARCHAR2(4),
  primary_phone_long_dist   VARCHAR2(1),
  custodial_parent          VARCHAR2(1),
  sexual_offender           VARCHAR2(1),
  no_connect_ed             VARCHAR2(1),
  allow_pick_up             VARCHAR2(1),
  ethnicity_hisp_x          VARCHAR2(1),
  wi_payee_id               VARCHAR2(20),
  race_verified_by          VARCHAR2(30),
  wa_race_subgroup          VARCHAR2(6),
  race_verified_date        VARCHAR2(8),
  fed_race_flags            VARCHAR2(10),
  conf_race_x               VARCHAR2(1),
  wa_ethnicity_group        VARCHAR2(6),
  conv_field_1              VARCHAR2(16),
  conv_field_2              VARCHAR2(16)
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
create bitmap index ALLEN.BMX_NAMEID on ALLEN.SIS_NAME (NAME_ID)
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
prompt Creating table SIS_QGT97_GENERIC_TABLE
prompt ======================================
prompt
create table ALLEN.SIS_QGT97_GENERIC_TABLE
(
  qgt97_unique_code VARCHAR2(50),
  qgt97_date        VARCHAR2(440),
  qgt97_logical     VARCHAR2(160),
  qgt97_dec         VARCHAR2(440),
  qgt97_int         VARCHAR2(440),
  qgt97_chr         VARCHAR2(540),
  qgt97_sort2_3     VARCHAR2(16),
  qgt97_sort2_2     VARCHAR2(16),
  qgt97_sort2_1     VARCHAR2(16),
  qgt97_sort3       VARCHAR2(16),
  qgt97_sort2       VARCHAR2(16),
  qgt97_sort1       VARCHAR2(50),
  qgt97_src_code    VARCHAR2(16),
  qgt97_src_id      NUMBER,
  qgt97_table_name  VARCHAR2(50),
  qgt97_record_id   NUMBER
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
create bitmap index ALLEN.BMI_SIS_QGT97_SRC_ID on ALLEN.SIS_QGT97_GENERIC_TABLE (QGT97_SRC_ID)
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
create bitmap index ALLEN.BMI_SIS_QGT97_TABLE_NAME on ALLEN.SIS_QGT97_GENERIC_TABLE (QGT97_TABLE_NAME)
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
prompt Creating table SIS_SYS_CTD
prompt ==========================
prompt
create table ALLEN.SIS_SYS_CTD
(
  date_1     VARCHAR2(8),
  dec_1      NUMBER,
  int_2      NUMBER,
  int_1      NUMBER,
  log_2      VARCHAR2(1),
  log_1      VARCHAR2(1),
  char_2     VARCHAR2(4000),
  char_1     VARCHAR2(4000),
  end_year   NUMBER,
  start_year NUMBER,
  time_added NUMBER,
  date_added VARCHAR2(8),
  code_sdesc VARCHAR2(4000),
  code_ldesc VARCHAR2(4000),
  code_id    VARCHAR2(50),
  table_id   VARCHAR2(50),
  x_default  VARCHAR2(1)
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
create bitmap index ALLEN.BMI_SIS_SYS_CTD_CODE_ID on ALLEN.SIS_SYS_CTD (CODE_ID)
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
create bitmap index ALLEN.BMI_SIS_SYS_CTD_TABLE_ID on ALLEN.SIS_SYS_CTD (TABLE_ID)
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
prompt Creating table SIS_SYS_CTM
prompt ==========================
prompt
create table ALLEN.SIS_SYS_CTM
(
  unused_char_1    VARCHAR2(16),
  time_added       NUMBER,
  date_added       VARCHAR2(8),
  tbl_sdesc        VARCHAR2(100),
  tbl_ldesc        VARCHAR2(100),
  table_id         VARCHAR2(100),
  x_allow_maintain VARCHAR2(1)
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
create bitmap index ALLEN.BMI_SIS_SYS_CTM_TABLE_ID on ALLEN.SIS_SYS_CTM (TABLE_ID)
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
prompt Creating table SIS_ZIP
prompt ======================
prompt
create table ALLEN.SIS_ZIP
(
  zip_code       VARCHAR2(7),
  zip_city       VARCHAR2(20),
  zip_state      VARCHAR2(5),
  zip_country    VARCHAR2(10),
  live           VARCHAR2(10),
  x_dist_zip     VARCHAR2(10),
  x_validate_zip VARCHAR2(10)
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
prompt Creating table STAFF
prompt ====================
prompt
create table ALLEN.STAFF
(
  name_id                 NUMBER,
  staff_title             VARCHAR2(60),
  short_name              VARCHAR2(20),
  initials                VARCHAR2(8),
  tchr_gradebook_used     VARCHAR2(2),
  mn_tchr_file_folder_nbr NUMBER,
  x_dis_officer           VARCHAR2(1),
  x_teacher               VARCHAR2(1),
  staff_gb_filename       VARCHAR2(10),
  x_substitute            VARCHAR2(1),
  sub_assgn_access        VARCHAR2(2),
  staff_gradebook         VARCHAR2(16),
  srsd_tch_license_no     VARCHAR2(30),
  long_name               VARCHAR2(40),
  sif_staff_ref_id        VARCHAR2(64),
  x_highly_qualified      VARCHAR2(1),
  alternate_id            NUMBER,
  internet_address        VARCHAR2(40),
  staff_profile           VARCHAR2(16),
  staff_misc_char         VARCHAR2(180),
  tn_position_code        NUMBER
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
prompt Creating table STAFF_ENTITY
prompt ===========================
prompt
create table ALLEN.STAFF_ENTITY
(
  name_id          NUMBER,
  entity_id        VARCHAR2(10),
  status_cur_yr    VARCHAR2(2),
  status_nxt_yr    VARCHAR2(2),
  building_id      VARCHAR2(10),
  room_number      VARCHAR2(10),
  department_id    VARCHAR2(16),
  ny_team_schd_id  VARCHAR2(16),
  cy_team_schd_id  VARCHAR2(16),
  max_consec_hours NUMBER,
  max_total_hours  NUMBER,
  sif_se_ref_id    VARCHAR2(32),
  grade            VARCHAR2(16),
  track            NUMBER
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
prompt Creating table STUDENT
prompt ======================
prompt
create table ALLEN.STUDENT
(
  student_id                     NUMBER not null,
  name_id                        NUMBER,
  alphakey                       VARCHAR2(22) not null,
  other_name                     VARCHAR2(90),
  other_id                       VARCHAR2(24),
  cnv_key                        VARCHAR2(24),
  internet_address               VARCHAR2(80),
  library_card_no                VARCHAR2(30),
  grad_yr                        NUMBER,
  nxt_grad_yr                    NUMBER,
  graduated                      VARCHAR2(1),
  retained                       VARCHAR2(1),
  resident                       VARCHAR2(1),
  district_code                  VARCHAR2(14),
  attendance_area                VARCHAR2(6),
  feeder_school_id               NUMBER,
  primary_physician              NUMBER,
  student_insurance_co           NUMBER,
  med_info                       VARCHAR2(2000),
  med_note_obs                   VARCHAR2(400),
  ins_nbr                        VARCHAR2(60),
  hospital_preference            NUMBER,
  transportation_id              VARCHAR2(6),
  transported                    VARCHAR2(1),
  bus_info                       VARCHAR2(48),
  miles                          NUMBER(17,2),
  driver_license_no              VARCHAR2(50),
  grad_followup                  VARCHAR2(3),
  x_vocational_participant       VARCHAR2(1),
  x_special_education            VARCHAR2(1),
  x_atrisk                       VARCHAR2(1),
  x_gifted_talented              VARCHAR2(1),
  x_section_504                  VARCHAR2(1),
  live                           VARCHAR2(1),
  x_chapter_1                    VARCHAR2(1),
  mn_ede_nbr                     NUMBER,
  mn_limited_english             VARCHAR2(1),
  mn_hmbnd_serv_ind              VARCHAR2(1),
  mn_hmbnd_hrs                   NUMBER,
  mn_secondary_opt_ind           VARCHAR2(1),
  mn_instr_set_id                VARCHAR2(4),
  mn_assess_hrs                  NUMBER,
  county_id                      VARCHAR2(6),
  mo_std_desegregated            VARCHAR2(2),
  mn_lep_start_date              VARCHAR2(8),
  path_id                        VARCHAR2(18),
  student_ecp                    VARCHAR2(4),
  school_id                      VARCHAR2(10),
  nxt_yr_sch_flag                VARCHAR2(2),
  obs_bar_code_nbr               NUMBER,
  obs_bar_code_date              VARCHAR2(8),
  mn_grad_stnd_yr                NUMBER,
  graduation_date                VARCHAR2(8),
  x_migrant                      VARCHAR2(1),
  mn_trans_cat                   VARCHAR2(4),
  sped_fte                       NUMBER,
  unused_char_1                  VARCHAR2(6),
  unused_char_2                  VARCHAR2(6),
  unused_char_3                  VARCHAR2(6),
  unused_int_1                   NUMBER,
  unused_int_2                   NUMBER,
  unused_dec_1                   NUMBER(20,5),
  unused_dec_2                   NUMBER(20,5),
  engl_prof                      NUMBER,
  x_iep                          VARCHAR2(1),
  x_iep_accom                    VARCHAR2(1),
  wa_migrant_id                  VARCHAR2(24),
  wa_migrant_lst_qual_move_dte   VARCHAR2(8),
  wa_migrant_advisor             NUMBER,
  wa_migrant_comment             VARCHAR2(400),
  sif_stu_ref_id                 VARCHAR2(64),
  advance                        VARCHAR2(1),
  student_web_permission         VARCHAR2(1),
  lang_minority                  VARCHAR2(16),
  student_gqe                    VARCHAR2(16),
  in_instruction                 VARCHAR2(16),
  in_gift_talented_code          VARCHAR2(16),
  in_esea_title1                 VARCHAR2(16),
  wa_grad_yr                     NUMBER,
  student_in_stn                 VARCHAR2(1),
  wi_native_lang_instr           VARCHAR2(1),
  wi_lep_served_prog             VARCHAR2(1),
  wi_lep_eligible                VARCHAR2(4),
  wasl_prev_passed_reading       VARCHAR2(1),
  wasl_prev_passed_writing       VARCHAR2(1),
  wasl_prev_passed_math          VARCHAR2(1),
  former_name                    VARCHAR2(150),
  wi_long_term_us_std_ind        VARCHAR2(1),
  x_esl                          VARCHAR2(1),
  sd_old_ede_nbr                 NUMBER,
  mi_merit_id_nbr                NUMBER,
  dip_code                       VARCHAR2(16),
  sd_served_in_mep               VARCHAR2(1),
  sd_served_in_sum_mep           VARCHAR2(1),
  sd_us_res_citizen_status       NUMBER,
  wasl_prev_passed_listening     VARCHAR2(1),
  mi_out_of_state_std            VARCHAR2(1),
  mi_dev_ret_kg                  VARCHAR2(1),
  mi_alternative_ed              VARCHAR2(1),
  twentyfirst_century_pgm        VARCHAR2(1),
  il_last_image_test             VARCHAR2(16),
  wi_1st_entry_sch_yr            NUMBER,
  in_eng_lang_accom              VARCHAR2(1),
  in_math_accom                  VARCHAR2(1),
  in_special_codes               VARCHAR2(16),
  in_retake_istep                VARCHAR2(1),
  wi_testing_status              VARCHAR2(16),
  student_gradebook_id           NUMBER,
  wa_most_recent_dist_enrollment VARCHAR2(8),
  wasl_prev_passed_science       VARCHAR2(1),
  med_info_critical              VARCHAR2(1),
  wi_dist_entry_override         VARCHAR2(8),
  mn_homeless                    VARCHAR2(1),
  mn_ward_of_state               VARCHAR2(1),
  mn_suppl_ed_serv               NUMBER,
  x_foreign_exchange             VARCHAR2(1),
  x_immigrant                    VARCHAR2(1),
  x_section_504_accom            VARCHAR2(1),
  in_rnd_drg_tst_form            VARCHAR2(16),
  in_rnd_drg_tst_nbr             NUMBER,
  x_ma_elig                      VARCHAR2(1),
  medicaid_nbr                   VARCHAR2(16),
  primary_dentist                NUMBER,
  full_name_lfm                  VARCHAR2(120),
  regen_grad_req                 VARCHAR2(1),
  addr_dropoff_id                NUMBER,
  addr_pickup_id                 NUMBER,
  x_lives_with_par_guard         VARCHAR2(1),
  dist_demographic_public        VARCHAR2(1),
  dist_demographic_military      VARCHAR2(1),
  dist_demographic_high_ed       VARCHAR2(1),
  dist_demographic_local_use     VARCHAR2(1),
  bus_am_number                  VARCHAR2(16),
  bus_pm_number                  VARCHAR2(16),
  grad_req_plan_id               NUMBER,
  date_entered_9th_grd           VARCHAR2(8),
  wa_summer_school               VARCHAR2(1),
  wa_csrs_reporting              VARCHAR2(1),
  fee_waiver                     VARCHAR2(16),
  dist_demographic_district      VARCHAR2(1),
  grad_status                    VARCHAR2(20),
  x_fed_form_506                 VARCHAR2(1),
  x_credential_type              VARCHAR2(1),
  alias_number                   VARCHAR2(20),
  native_language                VARCHAR2(6),
  ib_diploma                     VARCHAR2(2),
  differentiated_diploma         VARCHAR2(2),
  scholarship_award              VARCHAR2(2),
  migrant_birth_state            VARCHAR2(4),
  migrant_residency_date         VARCHAR2(8),
  national_hispanic_scholar      VARCHAR2(2),
  read_fluency                   VARCHAR2(2),
  lunch_share                    VARCHAR2(2),
  national_merit_scholar         VARCHAR2(2),
  national_achievement_scholar   VARCHAR2(2),
  major_interest                 VARCHAR2(8),
  first_start                    VARCHAR2(2),
  federal_impact_aid             VARCHAR2(2),
  even_start                     VARCHAR2(2),
  met_community_service          VARCHAR2(2),
  community_service_hours        NUMBER,
  passed_mathematics             NUMBER,
  passed_communications          NUMBER,
  ged_results                    VARCHAR2(2),
  dropout_influences             VARCHAR2(20),
  responsible_teacher_math       VARCHAR2(18),
  responsible_teacher_write      VARCHAR2(19),
  responsible_teacher_read       VARCHAR2(18),
  x_offender_transfer            VARCHAR2(1),
  x_hurricane_affected           VARCHAR2(1),
  educational_choice             VARCHAR2(2),
  prior_country                  VARCHAR2(4),
  prior_state                    VARCHAR2(4),
  prior_district                 VARCHAR2(4),
  nclb_supplemental_services     VARCHAR2(2),
  math_remediation               VARCHAR2(2),
  nclb_transportation            VARCHAR2(2),
  test_accom                     VARCHAR2(2),
  career_academy_participant     VARCHAR2(2),
  prekinder_prog                 VARCHAR2(2),
  career_academy                 VARCHAR2(6),
  prog_prior_to_kinder           VARCHAR2(2),
  health_examination             VARCHAR2(2),
  immunization_status            VARCHAR2(2),
  x_child_of_military            VARCHAR2(1),
  neglected_institution          VARCHAR2(8),
  graduation_option              VARCHAR2(2),
  additional_school_yr_student   VARCHAR2(2),
  fl_agency_programs             VARCHAR2(2),
  school_referred                NUMBER,
  district_refferred             NUMBER,
  grad_req_basis                 VARCHAR2(4),
  college_ready_diploma          VARCHAR2(2),
  birthdate_verification         VARCHAR2(2),
  career_plan_id                 NUMBER,
  fte_eligibility                VARCHAR2(2),
  fefp_weekly_minutes            NUMBER(19,4),
  bus_off_number                 VARCHAR2(24),
  date_entered_us                VARCHAR2(8),
  sent_in_survey                 VARCHAR2(270),
  transport_in_survey            VARCHAR2(270),
  neglected_institution_2        VARCHAR2(8),
  medical_contact                NUMBER,
  dip_date                       VARCHAR2(8),
  cert_compl_type                VARCHAR2(6),
  dist_demographic_trips         VARCHAR2(1),
  dist_demographic_media         VARCHAR2(1),
  dist_demographic_vendors       VARCHAR2(1),
  fl_fte_adv_cert_dip            NUMBER(17,2),
  fl_adv_cert_dip                VARCHAR2(2),
  fl_adv_cert_prog               VARCHAR2(2),
  fl_tot_days_abs                NUMBER(17,2),
  fl_tot_days_pres               NUMBER(17,2),
  fte_eligibility4               VARCHAR2(2),
  fte_eligibility3               VARCHAR2(2),
  fte_eligibility2               VARCHAR2(2),
  fte_eligibility1               VARCHAR2(2),
  marital_status                 VARCHAR2(2),
  incarcerated_stu               VARCHAR2(2),
  military_family                VARCHAR2(2),
  cc_ny_asgn_dte                 VARCHAR2(8),
  cc_cy_asgn_dte                 VARCHAR2(8),
  cc_cy_reason                   VARCHAR2(6),
  cc_cy_school                   VARCHAR2(8),
  cc_cy_status                   VARCHAR2(10),
  fl_fte_adv_place               NUMBER(17,2),
  fl_fte_bac_score               NUMBER(17,2),
  fl_fte_bac_dip                 NUMBER(17,2),
  fl_fte_adv_cert_score          NUMBER(17,2),
  cc_ny_grad_yr                  NUMBER,
  ny_schd_status                 VARCHAR2(2),
  date_fld_2                     VARCHAR2(8),
  date_fld_1                     VARCHAR2(8),
  dec_fld_5                      NUMBER(20,5),
  dec_fld_4                      NUMBER(20,5),
  dec_fld_3                      NUMBER(20,5),
  int_fld_5                      NUMBER,
  int_fld_4                      NUMBER,
  int_fld_3                      NUMBER,
  char_fld_10                    VARCHAR2(6),
  char_fld_9                     VARCHAR2(6),
  char_fld_8                     VARCHAR2(6),
  char_fld_7                     VARCHAR2(6),
  char_fld_6                     VARCHAR2(6),
  char_fld_5                     VARCHAR2(6),
  char_fld_4                     VARCHAR2(6),
  fl_sif_test_score              VARCHAR2(16),
  date_fld_5                     VARCHAR2(8),
  date_fld_4                     VARCHAR2(8),
  date_fld_3                     VARCHAR2(8),
  fl_cert_exp_date               VARCHAR2(8),
  fl_vac_exemption               VARCHAR2(20),
  migrant_status_term            VARCHAR2(2)
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
create unique index ALLEN.PK_STUDENT on ALLEN.STUDENT (STUDENT_ID)
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
create unique index ALLEN.UX_NAME_ID on ALLEN.STUDENT (NAME_ID)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table STUDENT_ATND_DETAIL
prompt ==================================
prompt
create table ALLEN.STUDENT_ATND_DETAIL
(
  student_id          NUMBER not null,
  atnd_date           VARCHAR2(8) not null,
  entity_id           VARCHAR2(10) not null,
  school_year         NUMBER not null,
  alphakey            VARCHAR2(22),
  zer_mod_aat_id      VARCHAR2(2),
  zer_mod_aar_id      VARCHAR2(4),
  sad_parent_notified VARCHAR2(1),
  aat_id              VARCHAR2(160),
  aar_id              VARCHAR2(240),
  calendar_id         VARCHAR2(10),
  duser_id            VARCHAR2(24),
  atnd_trn_date       VARCHAR2(8),
  atnd_trn_time       NUMBER,
  atnd_trn_type       VARCHAR2(2),
  cece_type           VARCHAR2(16),
  cece_entity         VARCHAR2(10),
  fl_daily_mark       VARCHAR2(6)
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
create bitmap index ALLEN.BMX_STUD_ATND_DET_ENTITYID on ALLEN.STUDENT_ATND_DETAIL (ENTITY_ID)
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
create bitmap index ALLEN.BMX_STUD_ATND_DET_SCHOOLYEAR on ALLEN.STUDENT_ATND_DETAIL (SCHOOL_YEAR)
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
create bitmap index ALLEN.BMX_STUD_ATND_DET_STUDENT on ALLEN.STUDENT_ATND_DETAIL (SCHOOL_YEAR, ENTITY_ID, STUDENT_ID)
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
create bitmap index ALLEN.BMX_STUD_ATND_DET_STUDENTID on ALLEN.STUDENT_ATND_DETAIL (STUDENT_ID)
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
prompt Creating table STUDENT_CLASS
prompt ============================
prompt
create table ALLEN.STUDENT_CLASS
(
  alphakey                   VARCHAR2(22),
  cor_num_id                 NUMBER,
  track                      NUMBER,
  clas_section               VARCHAR2(10),
  school_year                NUMBER,
  entity_id                  VARCHAR2(10),
  schd_priority              NUMBER,
  schd_str_trm               NUMBER,
  schd_stp_trm               NUMBER,
  schd_record_type           VARCHAR2(2),
  schd_status                VARCHAR2(2),
  schd_special_type          VARCHAR2(2),
  schd_schd_teq              VARCHAR2(4),
  schd_trm_abs_obs           VARCHAR2(176),
  schd_trm_tdy_obs           VARCHAR2(176),
  schd_num_crds              NUMBER(18,3),
  schd_flag1                 VARCHAR2(2),
  schd_flag2                 VARCHAR2(2),
  schd_flag3                 VARCHAR2(2),
  schd_ar_billing            VARCHAR2(2),
  schd_ar_refund_flag        VARCHAR2(2),
  schd_ar_refund_billed      VARCHAR2(2),
  schd_ar_refund_amt         NUMBER(17,2),
  schd_ar_course_fee         NUMBER(17,2),
  schd_grad_req_grp          VARCHAR2(6),
  semester_nbr               NUMBER,
  student_id                 NUMBER,
  term_nbr                   NUMBER,
  grd_mid_trm_mrk_obs        VARCHAR2(64),
  grd_trm_mrk_obs            VARCHAR2(64),
  grd_sem_exm_mrk            VARCHAR2(32),
  grd_sem_mrk                VARCHAR2(32),
  grd_fnl_exm_mrk            VARCHAR2(6),
  grd_fnl_mrk                VARCHAR2(6),
  grd_ath_mrk                VARCHAR2(6),
  grd_ath_eff_date           VARCHAR2(8),
  duser_id                   VARCHAR2(24),
  grd_ath_trn_date           VARCHAR2(8),
  grd_oth_mrk                VARCHAR2(6),
  grd_oth_eff_date           VARCHAR2(8),
  grd_oth_duser_id           VARCHAR2(24),
  grd_oth_trn_date           VARCHAR2(8),
  grd_citizen_mrk_obs        VARCHAR2(64),
  schd_hst_grad_year         NUMBER,
  schd_hst_ecp               VARCHAR2(4),
  schd_ytd_earn_crds         NUMBER(18,3),
  seat                       NUMBER,
  schd_ytd_fail_crds         NUMBER(18,3),
  schd_ytd_gpa_crds          VARCHAR2(198),
  schd_ytd_gpa_pnts          VARCHAR2(198),
  schd_trm_abs               VARCHAR2(264),
  schd_trm_tdy               VARCHAR2(264),
  grd_mid_trm_mrk            VARCHAR2(96),
  grd_trm_mrk                VARCHAR2(96),
  grd_citizen_mrk            VARCHAR2(192),
  wgt_schd_add_on            NUMBER(17,2),
  has_var_earn_crdts         VARCHAR2(1),
  earn_crdt_poss             NUMBER(18,3),
  earn_crdt_str_trm          NUMBER,
  earn_crdt_stp_trm          NUMBER,
  earn_crdt_duser_id         NUMBER,
  earn_crdt_lst_dte_upd      VARCHAR2(8),
  has_var_gpa_crdts          VARCHAR2(72),
  gpa_crdts_poss             VARCHAR2(144),
  gpa_crdts_str_trm          VARCHAR2(54),
  gpa_crdts_stp_trm          VARCHAR2(54),
  gpa_crdt_duser_id          VARCHAR2(198),
  gpa_crdt_lst_dte_upd       VARCHAR2(198),
  transfer_atnd              VARCHAR2(1),
  transfer_atnd_cor          NUMBER,
  transfer_atnd_track        NUMBER,
  transfer_atnd_section      VARCHAR2(6),
  transfer_atnd_duser_id     NUMBER,
  transfer_atnd_lst_dte_upd  VARCHAR2(8),
  schd_ytd_add_on_gpa        VARCHAR2(180),
  unused_char_1              VARCHAR2(4000),
  unused_char_2              VARCHAR2(4000),
  unused_int_1               NUMBER,
  unused_int_2               NUMBER,
  unused_dec_1               NUMBER(20,5),
  unused_dec_2               NUMBER(20,5),
  schd_ytd_remain_crds       NUMBER(18,3),
  gpa_set_override           VARCHAR2(36),
  schd_drp_type              VARCHAR2(16),
  schd_schd_conflict_reason  VARCHAR2(16),
  service_id                 VARCHAR2(20),
  trans_area                 VARCHAR2(20),
  unit_desc                  VARCHAR2(20),
  course_type_id             VARCHAR2(16),
  trn_grd_lvl_ovr            VARCHAR2(16),
  cece_type                  VARCHAR2(16),
  cece_cor_num_id            NUMBER,
  grd_cit_earn_crds          VARCHAR2(528),
  grd_cit_fail_crds          VARCHAR2(528),
  grd_mid_earn_crds          VARCHAR2(264),
  grd_mid_fail_crds          VARCHAR2(264),
  grd_trm_earn_crds          VARCHAR2(264),
  grd_trm_fail_crds          VARCHAR2(264),
  grd_sem_earn_crds          VARCHAR2(88),
  grd_sem_fail_crds          VARCHAR2(88),
  modified_by_name_id        NUMBER,
  grade_replace_flag         VARCHAR2(16),
  sif_stu_cls_ref_id         VARCHAR2(64),
  name_id                    NUMBER,
  wn_cor_comp_date           VARCHAR2(8),
  x_use_tran_glo_in_gpa      VARCHAR2(1),
  stu_gpa_set_id_1           NUMBER,
  stu_gpa_set_id_2           NUMBER,
  stu_gpa_set_id_3           NUMBER,
  stu_gpa_set_id_4           NUMBER,
  stu_gpa_set_id_5           NUMBER,
  stu_gpa_set_id_6           NUMBER,
  stu_gpa_set_id_7           NUMBER,
  stu_gpa_set_id_8           NUMBER,
  stu_gpa_set_id_9           NUMBER,
  stu_gpa_crdts_1            NUMBER(17,3),
  stu_gpa_crdts_2            NUMBER(17,3),
  stu_gpa_crdts_3            NUMBER(17,3),
  stu_gpa_crdts_4            NUMBER(17,3),
  stu_gpa_crdts_5            NUMBER(17,3),
  stu_gpa_crdts_6            NUMBER(17,3),
  stu_gpa_crdts_7            NUMBER(17,3),
  stu_gpa_crdts_8            NUMBER(17,3),
  stu_gpa_crdts_9            NUMBER(17,3),
  x_use_tran_glo_in_earn_crd VARCHAR2(1),
  wa_honors_option           VARCHAR2(1),
  wa_repeated_for_credit     VARCHAR2(1),
  cor_schd_priority          NUMBER,
  x_tn_voc_outside_iep       VARCHAR2(1),
  ut_dual_crdt_cor           VARCHAR2(1),
  transfer_district          VARCHAR2(4),
  fte_earned                 NUMBER(18,3),
  fefp_number                NUMBER,
  substituted_course         VARCHAR2(14),
  transfer_school            VARCHAR2(8),
  fefp_weekly_minutes        NUMBER(19,3),
  ytd_info_updated_by        NUMBER,
  cor_ernd_crdt_override     NUMBER(18,3),
  ytd_info_date_updated      VARCHAR2(8)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_ENTITYID on ALLEN.STUDENT_CLASS (ENTITY_ID)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_SCHDRECTYPE on ALLEN.STUDENT_CLASS (SCHD_RECORD_TYPE)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_SCHDSTATUS on ALLEN.STUDENT_CLASS (SCHD_STATUS)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_SCHOOLYEAR on ALLEN.STUDENT_CLASS (SCHOOL_YEAR)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_STUDENTID on ALLEN.STUDENT_CLASS (STUDENT_ID)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_STUDENTITY on ALLEN.STUDENT_CLASS (STUDENT_ID, ENTITY_ID)
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
create bitmap index ALLEN.BMX_STUDENT_CLASS_TYPESTATYR on ALLEN.STUDENT_CLASS (SCHD_RECORD_TYPE, SCHD_STATUS, SCHOOL_YEAR)
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
prompt Creating table STUDENT_CLASSIFICATIONS
prompt ======================================
prompt
create table ALLEN.STUDENT_CLASSIFICATIONS
(
  sc_char_5      VARCHAR2(100),
  sc_char_4      VARCHAR2(100),
  sc_char_3      VARCHAR2(100),
  sc_char_2      VARCHAR2(100),
  sc_char_1      VARCHAR2(120),
  sc_dec_2       NUMBER,
  sc_dec_1       NUMBER,
  sc_log_12      VARCHAR2(1),
  sc_log_11      VARCHAR2(1),
  sc_log_10      VARCHAR2(1),
  sc_log_9       VARCHAR2(1),
  sc_log_8       VARCHAR2(1),
  sc_log_7       VARCHAR2(1),
  sc_log_6       VARCHAR2(1),
  sc_log_5       VARCHAR2(1),
  sc_log_4       VARCHAR2(1),
  sc_log_3       VARCHAR2(1),
  sc_log_2       VARCHAR2(1),
  sc_log_1       VARCHAR2(1),
  sc_date_2      VARCHAR2(8),
  sc_date_1      VARCHAR2(8),
  sc_code_2      VARCHAR2(16),
  sc_code_1      VARCHAR2(16),
  sc_end_date    VARCHAR2(8),
  sc_str_date    VARCHAR2(8) not null,
  entity_id      VARCHAR2(10),
  sc_record_type VARCHAR2(16) not null,
  school_year    NUMBER,
  student_id     NUMBER not null,
  sc_int_1       NUMBER,
  sc_int_2       NUMBER,
  sc_int_3       NUMBER,
  sc_int_4       NUMBER,
  sc_int_5       NUMBER,
  sc_char_6      VARCHAR2(16),
  sc_char_7      VARCHAR2(16),
  sc_char_8      VARCHAR2(16),
  sc_char_9      VARCHAR2(16),
  sc_char_10     VARCHAR2(16),
  sc_code_3      VARCHAR2(16),
  sc_code_4      VARCHAR2(16),
  sc_dec_3       NUMBER,
  sc_dec_4       NUMBER,
  sc_code_5      VARCHAR2(16),
  sc_code_8      VARCHAR2(16),
  sc_code_7      VARCHAR2(16),
  sc_code_6      VARCHAR2(16),
  sc_date_6      VARCHAR2(8),
  sc_dec_6       NUMBER,
  sc_dec_5       NUMBER,
  sc_date_5      VARCHAR2(8),
  sc_date_4      VARCHAR2(8),
  sc_date_3      VARCHAR2(8)
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
create bitmap index ALLEN.BMX_STUDENT_CLASSIF_STUDENTID on ALLEN.STUDENT_CLASSIFICATIONS (STUDENT_ID)
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
  )
  nologging;

prompt
prompt Creating table STUDENT_DIS_ACTION
prompt =================================
prompt
create table ALLEN.STUDENT_DIS_ACTION
(
  entity_id              VARCHAR2(10) not null,
  school_year            NUMBER not null,
  follow_up_name_id      NUMBER,
  student_id             NUMBER not null,
  offense_ref_no         NUMBER not null,
  action_ref_no          NUMBER not null,
  action_time            NUMBER,
  dis_action_id          VARCHAR2(6) not null,
  action_date            VARCHAR2(8) not null,
  dis_action_time        NUMBER(17,2),
  school_id              VARCHAR2(10),
  location_id            VARCHAR2(10),
  action_comment         VARCHAR2(4000),
  action_parent_not      VARCHAR2(1),
  action_points          NUMBER(17,2),
  dis_action_flag        VARCHAR2(2),
  action_time_served     NUMBER(17,2),
  dis_action_status      VARCHAR2(2) not null,
  dis_action_susp_type   VARCHAR2(2),
  diff_reason_id         VARCHAR2(4),
  dis_act_date_ent       VARCHAR2(8),
  dis_act_time_ent       NUMBER,
  follow_up_type         VARCHAR2(6),
  act_unused_char1       VARCHAR2(16),
  act_unused_char2       VARCHAR2(16),
  act_unused_date1       VARCHAR2(8),
  act_unused_date2       VARCHAR2(8),
  act_unused_dec1        NUMBER(17,2),
  act_unused_dec2        NUMBER(17,2),
  act_unused_int1        NUMBER,
  act_unused_int2        NUMBER,
  act_unused_log1        VARCHAR2(1),
  act_unused_log2        VARCHAR2(1),
  alternative_school     VARCHAR2(16),
  dis_act_date_ord       VARCHAR2(8),
  in_exp_sus_reason      VARCHAR2(16),
  in_exp_sus_hearing_off VARCHAR2(16),
  in_exp_alt_school      VARCHAR2(16),
  dis_officer_name_id    NUMBER,
  st_char_1              VARCHAR2(16),
  st_dec_1               NUMBER(17,2),
  st_int_3               NUMBER,
  st_int_2               NUMBER,
  st_int_1               NUMBER,
  st_date_1              VARCHAR2(8),
  st_log_6               VARCHAR2(1),
  st_log_5               VARCHAR2(1),
  st_log_4               VARCHAR2(1),
  st_log_3               VARCHAR2(1),
  st_log_2               VARCHAR2(1),
  st_log_1               VARCHAR2(1)
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
prompt Creating table STUDENT_DIS_ACT_DET
prompt ==================================
prompt
create table ALLEN.STUDENT_DIS_ACT_DET
(
  offense_ref_no       VARCHAR2(10),
  action_ref_no        VARCHAR2(10),
  act_det_date         VARCHAR2(14),
  act_det_time         VARCHAR2(10),
  act_det_sts          VARCHAR2(1),
  follow_up_name_id    VARCHAR2(10),
  location_id          VARCHAR2(5),
  act_det_comment      VARCHAR2(2000),
  act_det_parent_not   VARCHAR2(10),
  act_det_time_served  NUMBER(7,2),
  det_diff_reason_id   VARCHAR2(2),
  act_det_date_entered VARCHAR2(14),
  act_det_time_entered VARCHAR2(10),
  entered_by           VARCHAR2(10),
  act_det_unused_char2 VARCHAR2(30),
  act_det_unused_char1 VARCHAR2(30)
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
prompt Creating table STUDENT_DIS_OFFENSE
prompt ==================================
prompt
create table ALLEN.STUDENT_DIS_OFFENSE
(
  entity_id                  VARCHAR2(10) not null,
  school_year                NUMBER not null,
  incident_no                NUMBER,
  student_id                 NUMBER not null,
  offense_ref_no             NUMBER not null,
  dis_officer_name_id        NUMBER,
  dis_offense_id             VARCHAR2(6) not null,
  off_date                   VARCHAR2(8) not null,
  off_time                   NUMBER,
  off_ref_by_flag            VARCHAR2(2),
  off_ref_by_name_id         NUMBER,
  off_first_name             VARCHAR2(32),
  off_last_name              VARCHAR2(40),
  school_id                  VARCHAR2(10),
  location_id                VARCHAR2(10),
  off_comment                VARCHAR2(4000),
  off_parent_not             VARCHAR2(1),
  dis_offense_points         NUMBER(17,2),
  dis_date_entered           VARCHAR2(8),
  dis_time_entered           NUMBER,
  off_est_cost               NUMBER(17,2),
  off_unused_char1           VARCHAR2(16),
  off_unused_char2           VARCHAR2(16),
  off_unused_date1           VARCHAR2(8),
  off_unused_date2           VARCHAR2(8),
  off_unused_dec1            NUMBER(17,2),
  off_unused_dec2            NUMBER(17,2),
  off_unused_int1            NUMBER,
  off_unused_int2            NUMBER,
  off_unused_log1            VARCHAR2(1),
  off_unused_log2            VARCHAR2(1),
  off_time_comment           VARCHAR2(16),
  tx_campus_of_dis_resp      VARCHAR2(16),
  off_period                 NUMBER,
  sif_dis_off_ref_id         VARCHAR2(16),
  st_int_10                  NUMBER,
  st_int_9                   NUMBER,
  st_int_8                   NUMBER,
  st_int_7                   NUMBER,
  st_int_6                   NUMBER,
  st_char_11                 VARCHAR2(16),
  st_char_10                 VARCHAR2(16),
  st_char_9                  VARCHAR2(16),
  st_char_8                  VARCHAR2(16),
  st_char_7                  VARCHAR2(16),
  st_char_6                  VARCHAR2(16),
  st_log_5                   VARCHAR2(1),
  st_char_5                  VARCHAR2(16),
  st_int_5                   NUMBER,
  st_int_4                   NUMBER,
  st_log_4                   VARCHAR2(1),
  st_log_3                   VARCHAR2(1),
  st_log_2                   VARCHAR2(1),
  st_log_1                   VARCHAR2(1),
  st_char_4                  VARCHAR2(16),
  st_int_3                   NUMBER,
  st_char_3                  VARCHAR2(16),
  st_int_2                   NUMBER,
  st_char_2                  VARCHAR2(16),
  st_char_1                  VARCHAR2(16),
  st_int_1                   NUMBER,
  offense_referral           VARCHAR2(16),
  drug_desc                  VARCHAR2(2),
  incident_context           VARCHAR2(2),
  weapon_desc                VARCHAR2(2),
  reported_to_law_enforcemen VARCHAR2(1),
  st_log_8                   VARCHAR2(1),
  st_log_7                   VARCHAR2(1),
  st_log_6                   VARCHAR2(1),
  fl_disability_related      VARCHAR2(1),
  fl_others_involved         VARCHAR2(16),
  fl_prior_action            VARCHAR2(16),
  fl_poss_motivation         VARCHAR2(16),
  involvement_type           VARCHAR2(2)
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
prompt Creating table STUDENT_ENTITY
prompt =============================
prompt
create table ALLEN.STUDENT_ENTITY
(
  entity_id                VARCHAR2(10),
  student_id               NUMBER,
  calendar_id              VARCHAR2(10),
  school_id                VARCHAR2(10),
  homeroom_number          VARCHAR2(10),
  alphakey_entity          VARCHAR2(22),
  x_default_entity         VARCHAR2(1),
  advisor                  NUMBER,
  student_status           VARCHAR2(2),
  student_ny_status        VARCHAR2(2),
  student_full_part        VARCHAR2(2),
  student_percent_enrolled NUMBER(18,3),
  student_incl_rank        VARCHAR2(1),
  student_incl_honor_roll  VARCHAR2(1),
  student_hist_grade_level VARCHAR2(4),
  history_entity           VARCHAR2(10),
  track                    NUMBER,
  prds_attending           NUMBER,
  band_instrument_id       VARCHAR2(6),
  student_cy_member        VARCHAR2(1),
  type_student_id          VARCHAR2(6),
  team_schd_id             VARCHAR2(6),
  wgt_schd_add_on          NUMBER(17,2),
  unused_char_1            VARCHAR2(6),
  unused_char_2            VARCHAR2(6),
  unused_int_1             NUMBER,
  unused_dec_1             NUMBER(20,5),
  dis_officer              NUMBER,
  cy_team_schd_id          VARCHAR2(6),
  student_entity_id        NUMBER,
  sif_sten_ref_id          VARCHAR2(64),
  cece_flag                VARCHAR2(1),
  nxt_yr_band_ins_id       VARCHAR2(16),
  cy_schedule_status       VARCHAR2(16),
  ny_schedule_status       VARCHAR2(16),
  ss_entity                VARCHAR2(10),
  ss_sch_yr                NUMBER,
  cy_schd_cat              VARCHAR2(20),
  ny_schd_cat              VARCHAR2(20),
  x_roll_ss_records        VARCHAR2(1),
  stu_promoted_retained    VARCHAR2(16),
  full_name_lfm            VARCHAR2(120),
  incl_class_count         VARCHAR2(1),
  wa_primary_school        VARCHAR2(16),
  x_signed_activity        VARCHAR2(1),
  auto_schd_priority       NUMBER,
  ny_track                 NUMBER,
  ny_trk_req_grp_id        NUMBER,
  cy_trk_req_grp_id        NUMBER,
  ny_track_reqs            VARCHAR2(144),
  cy_track_reqs            VARCHAR2(19),
  se_tchr_of_record        NUMBER,
  part_full_hours          VARCHAR2(2),
  promote_status           VARCHAR2(2),
  promote_status_good      VARCHAR2(4),
  summer_school_indicator  VARCHAR2(10),
  summer_school_school     VARCHAR2(16),
  summer_school_entity     VARCHAR2(16),
  reason_not_ranked        VARCHAR2(60)
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
create bitmap index ALLEN.BMX_STUDENT_ENTITY on ALLEN.STUDENT_ENTITY (ENTITY_ID, STUDENT_ID)
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
  )
  nologging;
create bitmap index ALLEN.BMX_STUDENT_ENTITY_ENTITYID on ALLEN.STUDENT_ENTITY (ENTITY_ID)
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
  )
  nologging;
create bitmap index ALLEN.BMX_STUDENT_ENTITY_STUDENTID on ALLEN.STUDENT_ENTITY (STUDENT_ID)
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
  )
  nologging;
create bitmap index ALLEN.BMX_STUDENT_ENTITY_XDEFAULT on ALLEN.STUDENT_ENTITY (X_DEFAULT_ENTITY)
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
prompt Creating table STUDENT_EW
prompt =========================
prompt
create table ALLEN.STUDENT_EW
(
  entity_id                  VARCHAR2(10) not null,
  student_id                 NUMBER not null,
  ew_date                    VARCHAR2(14) not null,
  entryc_code                VARCHAR2(6),
  entry_comment              VARCHAR2(100),
  entry_duser_id             VARCHAR2(24),
  withdrawal_date            VARCHAR2(14),
  withdrawal_code            VARCHAR2(6),
  withdrawal_comment         VARCHAR2(100),
  withdrawal_duser_id        VARCHAR2(24),
  district_code              VARCHAR2(14),
  district_type_id           VARCHAR2(6),
  aid_category_id            VARCHAR2(6),
  grade_level                VARCHAR2(4),
  spec_ed_eval_status_id     VARCHAR2(6),
  last_attn_loc_id           VARCHAR2(6),
  pseo_hours                 NUMBER,
  percent_enrolled           NUMBER,
  school_id                  VARCHAR2(10),
  homeroom_number            VARCHAR2(10),
  transportation_id          VARCHAR2(6),
  attendance_days            NUMBER(16,1),
  membership_days            NUMBER(16,1),
  calendar_id                VARCHAR2(10),
  status_end_id              VARCHAR2(6),
  track                      NUMBER,
  type_student_id            VARCHAR2(6),
  absence_days               NUMBER(17,2),
  withdrawal_school_year     NUMBER,
  withdrawal_grad_yr         NUMBER,
  x_withdrawal_retained      VARCHAR2(1),
  withdrawal_code_2          VARCHAR2(6),
  withdrawal_code_3          VARCHAR2(6),
  sped_fte                   NUMBER(17,2),
  unused_char_1              VARCHAR2(6),
  unused_char_2              VARCHAR2(6),
  unused_int_1               NUMBER,
  unused_int_2               NUMBER,
  unused_dec_1               NUMBER(20,5),
  unused_dec_2               NUMBER(20,5),
  ew_sif_grade               VARCHAR2(16),
  sif_stew_ref_id            VARCHAR2(64),
  x_withdrawal_advanced      VARCHAR2(1),
  open_enrollment_flag       VARCHAR2(16),
  miles                      NUMBER(17,2),
  in_retained_reason         VARCHAR2(16),
  enrolled_in                VARCHAR2(1),
  enrolled_out               VARCHAR2(1),
  open_enrolled_type         VARCHAR2(16),
  ewh_prds_att               VARCHAR2(320),
  x_withdrawal_default_entit VARCHAR2(1),
  mn_stu_res_sch_num         NUMBER,
  mn_indep_study             VARCHAR2(1),
  mn_res_schl_id             VARCHAR2(16),
  mn_hom_bnd_srv             VARCHAR2(1),
  mn_spec_ed_instr_setting   VARCHAR2(16),
  obs_mn_trans_dist_num      VARCHAR2(16),
  obs_mn_trans_dist_type     VARCHAR2(16),
  transfer_to_dist           VARCHAR2(16),
  transfer_to_schl           VARCHAR2(16),
  district_state             VARCHAR2(6),
  wa_dist_enr_dte_at_wthdrw  VARCHAR2(8),
  tn_ineligibility_status    NUMBER,
  course_of_study            VARCHAR2(2),
  residence_status           VARCHAR2(4),
  promote_status             VARCHAR2(2),
  fl_test_distr              VARCHAR2(14),
  fl_instruct_distr          VARCHAR2(14),
  fl_instruct_schl_id        VARCHAR2(10),
  fl_enroll_schl_id          VARCHAR2(10),
  fl_test_schl_id            VARCHAR2(10),
  promote_status_good        VARCHAR2(4),
  withdrawal_reason          VARCHAR2(6),
  choice_trans               VARCHAR2(2),
  hurricane                  VARCHAR2(2),
  dropout_reason             VARCHAR2(2),
  assign_reason              VARCHAR2(4),
  sr_char                    VARCHAR2(360)
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
create bitmap index ALLEN.BMX_STUDENT_EW on ALLEN.STUDENT_EW (ENTITY_ID, STUDENT_ID)
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
  )
  nologging;
create bitmap index ALLEN.BMX_STUDENT_EW_ENTITYID on ALLEN.STUDENT_EW (ENTITY_ID)
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
  )
  nologging;
create bitmap index ALLEN.BMX_STUDENT_EW_EWDATE on ALLEN.STUDENT_EW (EW_DATE)
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
create bitmap index ALLEN.BMX_STUDENT_EW_STUDENTID on ALLEN.STUDENT_EW (STUDENT_ID)
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
create bitmap index ALLEN.BMX_STUDENT_EW_WITHDRAWDT on ALLEN.STUDENT_EW (WITHDRAWAL_DATE)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table STUDENT_EXT
prompt ==========================
prompt
create table ALLEN.STUDENT_EXT
(
  student_id                 NUMBER not null,
  tea_stu_id                 VARCHAR2(18),
  last_peims_sub_1_stu_id    VARCHAR2(18),
  last_peims_sub_3_stu_id    VARCHAR2(18),
  last_peims_sub_4_stu_id    VARCHAR2(18),
  use_state_assigned_id_flag VARCHAR2(1),
  bilingual                  VARCHAR2(2),
  esl                        VARCHAR2(2),
  gifted_talented            VARCHAR2(2),
  preg_rel_svcs              VARCHAR2(2),
  pep                        VARCHAR2(2),
  voc_ed                     VARCHAR2(2),
  spec_ed                    VARCHAR2(4),
  lep_ind_code               VARCHAR2(2),
  home_lang_code             VARCHAR2(4),
  par_perm_code              VARCHAR2(2),
  grad_type_code             VARCHAR2(4),
  coll_ent_ind_code          VARCHAR2(2),
  career_tech_ind_code       VARCHAR2(2),
  sgl_par_preg_teen_code     VARCHAR2(2),
  wrk_stdy_voc_supt_svc      VARCHAR2(2),
  day_care_voc_supt_srv      VARCHAR2(2),
  trns_voc_supt_svc          VARCHAR2(2),
  pri_disability             VARCHAR2(4),
  sec_disability             VARCHAR2(4),
  ter_disability             VARCHAR2(4),
  mult_disabled              VARCHAR2(2),
  chld_cnt_fund_type         VARCHAR2(2),
  ard_date                   VARCHAR2(10),
  ard_type                   VARCHAR2(6),
  iep_date                   VARCHAR2(10),
  eys_student                VARCHAR2(2),
  grad_plan                  VARCHAR2(1),
  indv_trans_plan            VARCHAR2(1),
  adapt_pe                   VARCHAR2(1),
  behavior_mgmt_plan         VARCHAR2(1),
  medicaid_elig              VARCHAR2(1),
  medicaid_parent_notify     VARCHAR2(1),
  stu_attr_code              VARCHAR2(4),
  campus_id_res              VARCHAR2(18),
  at_risk_ind                VARCHAR2(2),
  econ_disad_code            VARCHAR2(4),
  migrant_ind_code           VARCHAR2(2),
  immigrant_ind_code         VARCHAR2(2),
  parent_participation       VARCHAR2(2),
  eoc_algebra                VARCHAR2(1),
  eoc_biology                VARCHAR2(1),
  eoc_english                VARCHAR2(1),
  eoc_ushist                 VARCHAR2(1),
  taas_array                 VARCHAR2(70),
  campus_id_acct             VARCHAR2(18),
  opt_extnd_year_pgm         VARCHAR2(1),
  ny_instr_setting_code      VARCHAR2(4),
  ssi_pro_ret_code           VARCHAR2(16),
  even_str_ind_cd            VARCHAR2(16),
  bil_esl_ss_ind_cd          VARCHAR2(16),
  taks_array                 VARCHAR2(90),
  tx_grant_elig              VARCHAR2(1),
  grant_eligible             VARCHAR2(1),
  eoc_algebra_yr             NUMBER,
  eoc_biology_yr             NUMBER,
  eoc_english_yr             NUMBER,
  eoc_ushist_yr              NUMBER,
  tx_grant_ind               VARCHAR2(2)
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
create bitmap index ALLEN.BMX_STUDENT_EXT_STUDENTID on ALLEN.STUDENT_EXT (STUDENT_ID)
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
  )
  nologging;

prompt
prompt Creating table STUDENT_FAMILY
prompt =============================
prompt
create table ALLEN.STUDENT_FAMILY
(
  student_id          VARCHAR2(10),
  family_number       VARCHAR2(10),
  family_id           VARCHAR2(10),
  rcv_report_cards    VARCHAR2(10),
  rcv_forms           VARCHAR2(10),
  obs_relationship_id VARCHAR2(5)
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
prompt Creating table STUDENT_SERVICE
prompt ==============================
prompt
create table ALLEN.STUDENT_SERVICE
(
  student_id               VARCHAR2(10),
  district_code            VARCHAR2(5),
  school_year              NUMBER,
  special_service_id       VARCHAR2(3),
  program_number           VARCHAR2(4),
  sequence_number          NUMBER,
  placement_ser_id         NUMBER,
  student_service_beg_date VARCHAR2(8),
  student_service_end_date VARCHAR2(8),
  fte                      NUMBER(3,2),
  discontinued_x           NUMBER
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
prompt Creating table STUDENT_VACINATION
prompt =================================
prompt
create table ALLEN.STUDENT_VACINATION
(
  student_id             VARCHAR2(10),
  hlt_vacination_id      VARCHAR2(20),
  vacination_no          VARCHAR2(10),
  vacination_date        VARCHAR2(14),
  vacination_dosage      NUMBER(7,2),
  vacination_comment     VARCHAR2(120),
  hlt_vacination_dose_id VARCHAR2(4),
  vacination_lot_nbr     VARCHAR2(15),
  hlt_vac_waiver_id      VARCHAR2(3),
  vacination_note        VARCHAR2(120),
  char_fld               VARCHAR2(200),
  date_fld               VARCHAR2(100),
  int_fld                VARCHAR2(100),
  dec_fld                VARCHAR2(100),
  log_fld                VARCHAR2(100)
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
prompt Creating table STU_ATND_CLS_TOT
prompt ===============================
prompt
create table ALLEN.STU_ATND_CLS_TOT
(
  entity_id            VARCHAR2(10),
  school_year          NUMBER,
  student_id           NUMBER,
  semester_nbr         NUMBER,
  term_nbr             NUMBER,
  threshold            NUMBER,
  cor_num_id           NUMBER,
  track                NUMBER,
  clas_section         VARCHAR2(10),
  sacm_letter_sent     VARCHAR2(2),
  sact_nbr_missed      NUMBER,
  sact_nbr_updates     NUMBER,
  sact_nbr_let_sent    NUMBER,
  sact_update_date     VARCHAR2(8),
  sact_update_duser_id VARCHAR2(24),
  cls_atnd_type_id     VARCHAR2(6),
  sact_dates           VARCHAR2(4000),
  sact_prds            VARCHAR2(4000),
  sact_types           VARCHAR2(4000),
  date_range_id        NUMBER
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
prompt Creating table STU_ATND_PRD_DET
prompt ===============================
prompt
create table ALLEN.STU_ATND_PRD_DET
(
  entity_id        VARCHAR2(10),
  school_year      NUMBER,
  student_id       NUMBER,
  semester_nbr     NUMBER,
  term_nbr         NUMBER,
  threshold        NUMBER,
  atnd_period      NUMBER,
  sapd_ref         NUMBER,
  sapd_dates       VARCHAR2(256),
  prd_atnd_type_id VARCHAR2(6)
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
prompt Creating table STU_FREE_RDUC_LNCH
prompt =================================
prompt
create table ALLEN.STU_FREE_RDUC_LNCH
(
  stu_key            VARCHAR2(31),
  stu_id             VARCHAR2(24),
  name_id            NUMBER,
  stu_free_rduc_lnch CHAR(1)
)
tablespace DW_DEFAULT02
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
create unique index ALLEN.UX_STU_FREE_RDUC_LNCH on ALLEN.STU_FREE_RDUC_LNCH (STU_ID)
  tablespace DW_DEFAULT02
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

prompt
prompt Creating table STU_GRADE_CUM
prompt ============================
prompt
create table ALLEN.STU_GRADE_CUM
(
  student_id           VARCHAR2(10),
  entity_id            VARCHAR2(5),
  sgc_school_year      VARCHAR2(10),
  sgc_gpa_nbr          VARCHAR2(1),
  sgc_cum_type         VARCHAR2(5),
  sgc_cum_type_nbr     VARCHAR2(10),
  sgc_origin_entity_id VARCHAR2(5),
  sgc_rec_type         VARCHAR2(3),
  sgc_gpa_crdts        VARCHAR2(20),
  sgc_gpa_pnts         VARCHAR2(20),
  sgc_gpa_bns_pnts     VARCHAR2(20),
  sgc_gpa_gpa          VARCHAR2(20),
  sgc_add_on_gpa       VARCHAR2(20),
  sgc_add_on_gpa_div   VARCHAR2(20),
  sgc_gpa_with_add_on  VARCHAR2(20),
  sgc_earnd_crdts      VARCHAR2(20),
  sgc_faild_crdts      VARCHAR2(20),
  sgc_incl_rank        VARCHAR2(10),
  sgc_rank             VARCHAR2(10),
  sgc_nbr_in_rank      VARCHAR2(10),
  sgc_rank_value       NUMBER(9,4),
  sgc_rank_date        VARCHAR2(14),
  sgc_grad_year        VARCHAR2(10),
  grading_period_id    VARCHAR2(10),
  duser_name_id        VARCHAR2(10),
  sgc_date_upd         VARCHAR2(14),
  sgc_time_upd         VARCHAR2(10),
  sgc_api_cme_wgt_fact VARCHAR2(10),
  sgc_api_use_wgt_fact VARCHAR2(10),
  sgc_api_sme_wgt_fact VARCHAR2(10),
  sgc_rank_time        VARCHAR2(10)
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
create bitmap index ALLEN.BMX_STU_GRADE_CUM_STUDENTID on ALLEN.STU_GRADE_CUM (STUDENT_ID)
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
  )
  nologging;

prompt
prompt Creating table STX8
prompt ===================
prompt
create table ALLEN.STX8
(
  etl_sasi_sch  VARCHAR2(3) not null,
  etl_sasi_year VARCHAR2(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  admindate     VARCHAR2(32),
  grade         VARCHAR2(2),
  region        VARCHAR2(2),
  campusid      NUMBER(9),
  distname      VARCHAR2(34),
  campusname    VARCHAR2(34),
  ethniccode    NUMBER(1),
  econdisadv    VARCHAR2(2),
  title1        NUMBER(1),
  migramsrts    NUMBER(1),
  lepind        NUMBER(1),
  bilingind     NUMBER(1),
  eslindic      NUMBER(1),
  specialed     NUMBER(1),
  gifttalent    NUMBER(1),
  atrisk        NUMBER(1),
  careertech    NUMBER(1),
  testver       VARCHAR2(1),
  fallcdcno     NUMBER(9),
  tmip          NUMBER(1),
  localuse1     VARCHAR2(4),
  localuse2     VARCHAR2(4),
  rdwbrailad    NUMBER(1),
  rdbrailad     NUMBER(1),
  rwlgprint     NUMBER(1),
  rdlgprint     NUMBER(1),
  oraladmath    NUMBER(1),
  oraladss      NUMBER(1),
  oraladsci     NUMBER(1),
  forexela      NUMBER(1),
  forexspr      NUMBER(1),
  lepppela      NUMBER(1),
  lepppspr      NUMBER(1),
  readsccde     VARCHAR2(1),
  mathsccde     VARCHAR2(1),
  writesccde    VARCHAR2(1),
  socstudysc    VARCHAR2(1),
  scisccde      VARCHAR2(1),
  rddefcde      NUMBER(1),
  mathdefcde    NUMBER(1),
  wrdefcde      NUMBER(1),
  socdefcde     NUMBER(1),
  scidefcde     NUMBER(1),
  rditemcor1    NUMBER(2),
  rditemcor2    NUMBER(2),
  rditemcor3    NUMBER(2),
  rditemcor4    NUMBER(2),
  readrawsc     NUMBER(2),
  rdscalesc     VARCHAR2(4),
  readmetmin    NUMBER(1),
  readcomper    NUMBER(1),
  ewricomrd1    NUMBER(1),
  ewricomrd2    NUMBER(1),
  ewricomrd3    NUMBER(1),
  ewrifinsc     NUMBER(1),
  eanalytic1    NUMBER(1),
  eanalytic2    NUMBER(1),
  eanalytic3    NUMBER(1),
  eanalytic4    NUMBER(1),
  eanalytic5    NUMBER(1),
  eanalytic6    NUMBER(1),
  rdrdr1        NUMBER(1),
  rdrdr2        NUMBER(1),
  rdrdr3        NUMBER(1),
  rdfinsc       NUMBER(1),
  rd2rdr1       NUMBER(1),
  rd2rdr2       NUMBER(1),
  rd2rdr3       NUMBER(1),
  rd2finsc      NUMBER(1),
  rd3rdr1       NUMBER(1),
  rd3rdr2       NUMBER(1),
  rd3rdr3       NUMBER(1),
  rd3finsc      NUMBER(1),
  marcdcno      NUMBER(9),
  marreadscd    VARCHAR2(1),
  marrdmin      NUMBER(1),
  marrdcmper    NUMBER(1),
  marrdsclsc    VARCHAR2(4),
  aprcdcno      NUMBER(9),
  aprreadscd    VARCHAR2(1),
  aprrdmin      NUMBER(1),
  aprrdcmper    NUMBER(1),
  aprrdsclsc    VARCHAR2(4),
  mthitmcor1    NUMBER(2),
  mthitmcor2    NUMBER(2),
  mthitmcor3    NUMBER(2),
  mthitmcor4    NUMBER(2),
  mthitmcor5    NUMBER(2),
  mthitmcor6    NUMBER(2),
  mthitmcor7    NUMBER(2),
  mthitmcor8    NUMBER(2),
  mthitmcor9    NUMBER(2),
  mthitmcor0    NUMBER(2),
  mathrawsc     NUMBER(2),
  mathscalsc    VARCHAR2(4),
  mathmin       NUMBER(1),
  mathcomper    NUMBER(1),
  wriitmcor1    NUMBER(2),
  wriitmcor2    NUMBER(2),
  wriitmcor3    NUMBER(2),
  wriitmcor4    NUMBER(2),
  wrirawsc      NUMBER(2),
  wriscalsc     VARCHAR2(4),
  wrimin        NUMBER(1),
  wricomper     NUMBER(1),
  wricomrdr1    NUMBER(1),
  wricomrdr2    NUMBER(1),
  wricomrdr3    NUMBER(1),
  wrifinsc      NUMBER(1),
  analytic1     NUMBER(1),
  analytic2     NUMBER(1),
  analytic3     NUMBER(1),
  analytic4     NUMBER(1),
  analytic5     NUMBER(1),
  analytic6     NUMBER(1),
  ssitemcor1    NUMBER(2),
  ssitemcor2    NUMBER(2),
  ssitemcor3    NUMBER(2),
  ssitemcor4    NUMBER(2),
  ssitemcor5    NUMBER(2),
  ssrawsc       NUMBER(2),
  ssscalsc      VARCHAR2(4),
  ssmetmin      NUMBER(1),
  sscomper      NUMBER(1),
  sciitmcor1    NUMBER(2),
  sciitmcor2    NUMBER(2),
  sciitmcor3    NUMBER(2),
  sciitmcor4    NUMBER(2),
  sciitmcor5    NUMBER(2),
  scirawsc      NUMBER(2),
  sciscalsc     VARCHAR2(4),
  scimetmin     NUMBER(1),
  scicomper     NUMBER(1),
  makeform      NUMBER(1),
  hisupdate     VARCHAR2(1),
  ldaaread      VARCHAR2(1),
  ldaardmin     NUMBER(1),
  ldaamath      CHAR(1),
  ldaamthmin    NUMBER(1),
  ldaasocstu    CHAR(1),
  ldaassmin     NUMBER(1),
  ldaasci       CHAR(1),
  ldaascimin    NUMBER(1),
  thecbrd       NUMBER(1),
  thecbmth      NUMBER(1),
  apmthcdc      VARCHAR2(9),
  apmthsccd     CHAR(1),
  apmthmin      NUMBER(1),
  apmthcom      NUMBER(1),
  apmthscsc     VARCHAR2(4),
  studguidal    CHAR(1),
  studguidms    CHAR(1),
  passstand     CHAR(1),
  latinfo       CHAR(1),
  latengsp      CHAR(1),
  latrdasst     CHAR(1),
  latdict       CHAR(1),
  lattrans      CHAR(1),
  latbilglo     CHAR(1),
  latengglo     CHAR(1),
  latsimlng     CHAR(1),
  latpicges     CHAR(1),
  latprev       CHAR(1),
  latwrimat     CHAR(1),
  latimcomp     CHAR(1),
  latabsent     CHAR(1),
  latstuind     CHAR(1),
  elecfrmrd     CHAR(1),
  elecfrmma     CHAR(1),
  secmthcdc     VARCHAR2(9),
  secmthsccd    CHAR(1),
  secmthmin     NUMBER(1),
  secmthcom     NUMBER(1),
  secmthscsc    VARCHAR2(4),
  elecfrmss     CHAR(1),
  elecfrmsci    CHAR(1),
  firscicdc     NUMBER(9),
  firsciscd     CHAR(1),
  firscimin     NUMBER(1),
  firsccmper    NUMBER(1),
  firscsclsc    VARCHAR2(4),
  brailmath     CHAR(1),
  lgprtmath     CHAR(1),
  brailsocst    CHAR(1),
  lgprtsoc      CHAR(1),
  latlngsimp    CHAR(1),
  elataksi      CHAR(1),
  lexile        VARCHAR2(5),
  dyslexia      CHAR(1),
  scitaksi      CHAR(1),
  pycampatt     VARCHAR2(9),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 35M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table STXE
prompt ===================
prompt
create table ALLEN.STXE
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  course        VARCHAR2(14),
  prdcontol     VARCHAR2(1),
  daysweeks     VARCHAR2(3),
  serviceid     VARCHAR2(9),
  popserid      VARCHAR2(3),
  instrset      VARCHAR2(5),
  roleid        VARCHAR2(3),
  rept          VARCHAR2(1),
  insttech      VARCHAR2(1),
  duration      VARCHAR2(9),
  vocfund       VARCHAR2(1),
  examflag      VARCHAR2(1),
  seqtype       VARCHAR2(1),
  splitsec      VARCHAR2(1),
  seqcrs        VARCHAR2(8),
  label         VARCHAR2(8),
  location      VARCHAR2(8),
  examcrs       VARCHAR2(1),
  spcapp        VARCHAR2(2),
  locdesign     VARCHAR2(1),
  uilcrs        VARCHAR2(3),
  passfail      VARCHAR2(1),
  subject       NUMBER(2),
  repeattag     VARCHAR2(1),
  subjectcd     VARCHAR2(1),
  grdexmpt      VARCHAR2(1),
  conexempt     VARCHAR2(1),
  gradept6      VARCHAR2(1),
  gradept7      VARCHAR2(1),
  gradept8      VARCHAR2(1),
  gradept9      VARCHAR2(1),
  gradept10     VARCHAR2(1),
  gradept11     VARCHAR2(1),
  gradept12     VARCHAR2(1),
  aarcode       VARCHAR2(2),
  rprttitle     VARCHAR2(15),
  grdpttbl      VARCHAR2(1),
  vocedhours    NUMBER(1),
  conduct       VARCHAR2(3),
  servidname    VARCHAR2(40),
  seqcrs2       VARCHAR2(8),
  seqcrs3       VARCHAR2(8),
  seqcrs4       VARCHAR2(8),
  statelocal    VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXE_SASI_SCH on ALLEN.STXE (ETL_SASI_SCH)
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
prompt Creating table STXI
prompt ===================
prompt
create table ALLEN.STXI
(
  etl_sasi_sch  CHAR(3),
  etl_sasi_year CHAR(1),
  status        VARCHAR2(1),
  enterdate     VARCHAR2(32),
  exitdate      VARCHAR2(32),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  general       VARCHAR2(1),
  specified     VARCHAR2(1),
  creative      VARCHAR2(1),
  leadership    VARCHAR2(1),
  u_exitdate    VARCHAR2(20),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXI_SASI_SCH on ALLEN.STXI (ETL_SASI_SCH)
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
prompt Creating table STXJ
prompt ===================
prompt
create table ALLEN.STXJ
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  sequence      NUMBER(3),
  course        VARCHAR2(14),
  crstitle      VARCHAR2(18),
  mark          VARCHAR2(3),
  credatmpt     NUMBER(6,3),
  credearned    NUMBER(6,3),
  schlyear      NUMBER(4),
  term          VARCHAR2(2),
  grade         VARCHAR2(2),
  schoolattn    VARCHAR2(4),
  serviceid     VARCHAR2(9),
  translabel    VARCHAR2(8),
  crsgroup      VARCHAR2(1),
  aarcode       VARCHAR2(2),
  distlrn       VARCHAR2(3),
  dualcredit    VARCHAR2(3),
  passfail      VARCHAR2(3),
  countydst     VARCHAR2(9),
  chsseq        NUMBER(3),
  calmonth      NUMBER(2),
  calyear       NUMBER(4),
  repeattag     VARCHAR2(1),
  statelocal    VARCHAR2(1),
  coursepart    VARCHAR2(1),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 43M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXJ_SASI_SCH on ALLEN.STXJ (ETL_SASI_SCH)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;

prompt
prompt Creating table STXL
prompt ===================
prompt
create table ALLEN.STXL
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  notused       VARCHAR2(3),
  cntryorg      VARCHAR2(3),
  lepstatus     VARCHAR2(3),
  progplace     VARCHAR2(3),
  instrlevel    VARCHAR2(1),
  migratory     VARCHAR2(1),
  msrtsnum      NUMBER(8),
  mstrsalpha    VARCHAR2(3),
  parentnot     VARCHAR2(32),
  parperdate    VARCHAR2(32),
  parpercode    VARCHAR2(3),
  origplcdt     VARCHAR2(32),
  lastexitdt    VARCHAR2(32),
  lastreent     VARCHAR2(32),
  waiver        VARCHAR2(32),
  enterus       VARCHAR2(32),
  entussch      VARCHAR2(32),
  origlpacdt    VARCHAR2(32),
  lastlpac      VARCHAR2(32),
  pilotesl      VARCHAR2(1),
  enterpilot    VARCHAR2(32),
  attenzone     VARCHAR2(1),
  summer        VARCHAR2(1),
  offcampus     VARCHAR2(1),
  yr1cy1        VARCHAR2(1),
  yr1cy2        VARCHAR2(1),
  yr1cy3        VARCHAR2(1),
  yr1cy4        VARCHAR2(1),
  yr1cy5        VARCHAR2(1),
  yr1cy6        VARCHAR2(1),
  yr2cy1        VARCHAR2(1),
  yr2cy2        VARCHAR2(1),
  yr2cy3        VARCHAR2(1),
  yr2cy4        VARCHAR2(1),
  yr2cy5        VARCHAR2(1),
  yr2cy6        VARCHAR2(1),
  type1         VARCHAR2(1),
  readscr1      VARCHAR2(2),
  readnce1      NUMBER(4,1),
  langscr1      VARCHAR2(2),
  langnce1      NUMBER(4,1),
  grade1        VARCHAR2(2),
  date1         VARCHAR2(32),
  type2         VARCHAR2(1),
  readscr2      VARCHAR2(2),
  readnce2      NUMBER(4,1),
  langscr2      VARCHAR2(2),
  langnce2      NUMBER(4,1),
  grade2        VARCHAR2(2),
  date2         VARCHAR2(32),
  type3         VARCHAR2(1),
  readscr3      VARCHAR2(2),
  readnce3      NUMBER(4,1),
  langscr3      VARCHAR2(2),
  langnce3      NUMBER(4,1),
  grade3        VARCHAR2(2),
  date3         VARCHAR2(32),
  type4         VARCHAR2(1),
  readscr4      VARCHAR2(2),
  readnce4      NUMBER(4,1),
  langscr4      VARCHAR2(2),
  langnce4      NUMBER(4,1),
  grade4        VARCHAR2(2),
  date4         VARCHAR2(32),
  type5         VARCHAR2(1),
  readscr5      VARCHAR2(2),
  readnce5      NUMBER(4,1),
  langscr5      VARCHAR2(2),
  langnce5      NUMBER(4,1),
  grade5        VARCHAR2(2),
  date5         VARCHAR2(32),
  type6         VARCHAR2(1),
  readscr6      VARCHAR2(2),
  readnce6      NUMBER(4,1),
  langscr6      VARCHAR2(2),
  langnce6      NUMBER(4,1),
  grade6        VARCHAR2(2),
  date6         VARCHAR2(32),
  lptscore1     VARCHAR2(3),
  lptgrade1     VARCHAR2(2),
  lptscrlvl1    VARCHAR2(3),
  lptdate1      VARCHAR2(32),
  lptscore2     VARCHAR2(3),
  lptgrade2     VARCHAR2(2),
  lptscrlvl2    VARCHAR2(3),
  lptdate2      VARCHAR2(32),
  lptscore3     VARCHAR2(3),
  lptgrade3     VARCHAR2(2),
  lptscrlvl3    VARCHAR2(3),
  lptdate3      VARCHAR2(32),
  lptscore4     VARCHAR2(3),
  lptgrade4     VARCHAR2(2),
  lptscrlvl4    VARCHAR2(3),
  lptdate4      VARCHAR2(32),
  lptscore5     VARCHAR2(3),
  lptgrade5     VARCHAR2(2),
  lptscrlvl5    VARCHAR2(3),
  lptdate5      VARCHAR2(32),
  wrttt1        VARCHAR2(1),
  wrtdt1        VARCHAR2(32),
  wrtor1        VARCHAR2(2),
  wrtcr1        VARCHAR2(2),
  wrttt2        VARCHAR2(1),
  wrtdt2        VARCHAR2(32),
  wrtor2        VARCHAR2(2),
  wrtcr2        VARCHAR2(2),
  wrttt3        VARCHAR2(1),
  wrtdt3        VARCHAR2(32),
  wrtor3        VARCHAR2(2),
  wrtcr3        VARCHAR2(2),
  wrttt4        VARCHAR2(1),
  wrtdt4        VARCHAR2(32),
  wrtor4        VARCHAR2(2),
  wrtcr4        VARCHAR2(2),
  wrttt5        VARCHAR2(1),
  wrtdt5        VARCHAR2(32),
  wrtor5        VARCHAR2(2),
  wrtcr5        VARCHAR2(2),
  comments      VARCHAR2(75),
  fullyrus      VARCHAR2(2),
  prgexitrsn    VARCHAR2(1),
  perabsout     VARCHAR2(10),
  remainprof    VARCHAR2(1),
  numyroutus    NUMBER(2),
  yrsinussch    VARCHAR2(3),
  lptscore6     VARCHAR2(3),
  lptgrade6     VARCHAR2(2),
  lptscrlvl6    VARCHAR2(3),
  lptdate6      VARCHAR2(32),
  lptscore7     VARCHAR2(3),
  lptgrade7     VARCHAR2(2),
  lptscrlvl7    VARCHAR2(3),
  lptdate7      VARCHAR2(32),
  lptscore8     VARCHAR2(3),
  lptgrade8     VARCHAR2(2),
  lptscrlvl8    VARCHAR2(3),
  lptdate8      VARCHAR2(32),
  lptscore9     VARCHAR2(3),
  lptgrade9     VARCHAR2(2),
  lptscrlvl9    VARCHAR2(3),
  lptdate9      VARCHAR2(32),
  lptscore10    VARCHAR2(3),
  lptgrade10    VARCHAR2(2),
  lptscrlv10    VARCHAR2(3),
  lptdate10     VARCHAR2(32),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXL_SASI_SCH on ALLEN.STXL (ETL_SASI_SCH)
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
create bitmap index ALLEN.BMI_STXL_DATE1 on ALLEN.STXL (DATE1)
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
create bitmap index ALLEN.BMI_STXL_PARENTNOT on ALLEN.STXL (PARENTNOT)
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
prompt Creating table STXM
prompt ===================
prompt
create table ALLEN.STXM
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  classlink     NUMBER(4),
  popser        VARCHAR2(3),
  setting       VARCHAR2(3),
  roleid        VARCHAR2(3),
  altprd        VARCHAR2(2),
  spltperiod    VARCHAR2(2),
  rept          VARCHAR2(1),
  weeks         VARCHAR2(3),
  insttech      VARCHAR2(1),
  lunch         VARCHAR2(1),
  limit         NUMBER(1),
  sequence      VARCHAR2(3),
  avgtbl        VARCHAR2(1),
  avghrs        VARCHAR2(1),
  abscode       VARCHAR2(1),
  serviceid     VARCHAR2(9),
  daysweek      VARCHAR2(3),
  distlearn     VARCHAR2(3),
  dualcredit    VARCHAR2(3),
  multiserv     VARCHAR2(3),
  servidname    VARCHAR2(40),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXM_SASI_SCH on ALLEN.STXM (ETL_SASI_SCH)
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
prompt Creating table STXN
prompt ===================
prompt
create table ALLEN.STXN
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  enterdate     VARCHAR2(32) not null,
  exitdate      VARCHAR2(32),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5) not null,
  notused       VARCHAR2(3),
  lepstatus     VARCHAR2(3),
  progplace     VARCHAR2(3),
  parpercode    VARCHAR2(3),
  u_exitdate    VARCHAR2(16),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 768K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BMI_STXN_ENTERDATE on ALLEN.STXN (ENTERDATE)
  tablespace DW_DEFAULT_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging;
create bitmap index ALLEN.BMI_STXN_EXITDATE on ALLEN.STXN (EXITDATE)
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
create bitmap index ALLEN.BMI_STXN_LEPSTATUS on ALLEN.STXN (LEPSTATUS)
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
create bitmap index ALLEN.BMI_STXN_PROGPLACE on ALLEN.STXN (PROGPLACE)
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
create bitmap index ALLEN.BMI_STXN_SCHOOLNUM on ALLEN.STXN (SCHOOLNUM)
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
prompt Creating table STXP
prompt ===================
prompt
create table ALLEN.STXP
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  primdis       VARCHAR2(3),
  seconddis     VARCHAR2(3),
  tertdis       VARCHAR2(3),
  enterdate     VARCHAR2(32),
  dismssdate    VARCHAR2(32),
  dismissrea    VARCHAR2(2),
  severe_hc     VARCHAR2(1),
  severespch    VARCHAR2(1),
  oldcdcnum     NUMBER(9),
  stateexmpt    VARCHAR2(1),
  taasexempt    VARCHAR2(1),
  newtodist     VARCHAR2(1),
  ttl1fiscal    VARCHAR2(1),
  caretreat     VARCHAR2(1),
  contractmo    VARCHAR2(2),
  primarylng    VARCHAR2(2),
  degreehear    VARCHAR2(1),
  etiology      VARCHAR2(1),
  childfndcd    VARCHAR2(3),
  refsrc        VARCHAR2(1),
  initrefdt     VARCHAR2(32),
  initassdt     VARCHAR2(32),
  initarddt     VARCHAR2(32),
  parentdt      VARCHAR2(32),
  annualard     VARCHAR2(32),
  parlastnt     VARCHAR2(32),
  compassess    VARCHAR2(32),
  selfcont      VARCHAR2(32),
  leastret      VARCHAR2(1),
  ardleast      VARCHAR2(32),
  indvedplan    VARCHAR2(32),
  initcompdt    VARCHAR2(32),
  latecompdt    VARCHAR2(32),
  referrvoc     VARCHAR2(1),
  level1        NUMBER(4),
  level2        NUMBER(4),
  level3        NUMBER(4),
  lastspeech    VARCHAR2(32),
  lastoccup     VARCHAR2(32),
  lastphys      VARCHAR2(32),
  instrloc      VARCHAR2(2),
  instrset      VARCHAR2(3),
  speechonly    VARCHAR2(3),
  adapt_pe      VARCHAR2(1),
  behavior      VARCHAR2(1),
  regndfsch     VARCHAR2(3),
  voced         VARCHAR2(1),
  offcampus     VARCHAR2(1),
  nonpubschl    VARCHAR2(19),
  nonpubcode    VARCHAR2(1),
  nonpubid      VARCHAR2(6),
  gradplan      VARCHAR2(1),
  extendyear    VARCHAR2(1),
  summer        VARCHAR2(1),
  erlychdinv    VARCHAR2(3),
  itpdate       VARCHAR2(32),
  specarrang    VARCHAR2(1),
  asst_tech     VARCHAR2(3),
  interpsrv     VARCHAR2(3),
  counsel       VARCHAR2(3),
  medfrag       VARCHAR2(3),
  music         VARCHAR2(1),
  occ           VARCHAR2(3),
  mobil         VARCHAR2(3),
  physical      VARCHAR2(3),
  rec           VARCHAR2(3),
  vision        VARCHAR2(1),
  audio         VARCHAR2(3),
  meddiag       VARCHAR2(3),
  psychserv     VARCHAR2(3),
  schlhlth      VARCHAR2(3),
  socialwork    VARCHAR2(3),
  parenttrn     VARCHAR2(1),
  adapteqp      VARCHAR2(1),
  transport     VARCHAR2(3),
  lastmed       VARCHAR2(32),
  lasthear      VARCHAR2(32),
  lastpsyc      VARCHAR2(32),
  lastvist      VARCHAR2(32),
  lastophth     VARCHAR2(32),
  lastaudio     VARCHAR2(32),
  ritesneel     VARCHAR2(8),
  ritevisual    VARCHAR2(2),
  riteother     VARCHAR2(2),
  leftsneel     VARCHAR2(8),
  leftvisual    VARCHAR2(2),
  leftother     VARCHAR2(2),
  braille       VARCHAR2(2),
  largetype     VARCHAR2(2),
  regulartyp    VARCHAR2(2),
  auditory      VARCHAR2(2),
  otherlevel    VARCHAR2(1),
  tearelease    VARCHAR2(1),
  crsarddate    VARCHAR2(32),
  lstcrsardd    VARCHAR2(32),
  crs1          NUMBER(4),
  crs2          NUMBER(4),
  crs3          NUMBER(4),
  crs4          NUMBER(4),
  crs5          NUMBER(4),
  crs6          NUMBER(4),
  crs7          NUMBER(4),
  crs8          NUMBER(4),
  crs9          NUMBER(4),
  crs10         NUMBER(4),
  number_tch    NUMBER(3),
  tch1          NUMBER(3),
  tch2          NUMBER(3),
  tch3          NUMBER(3),
  tch4          NUMBER(3),
  tch5          NUMBER(3),
  tch6          NUMBER(3),
  tch7          NUMBER(3),
  tch8          NUMBER(3),
  tch9          NUMBER(3),
  tch10         NUMBER(3),
  multidisab    VARCHAR2(3),
  mdcaidno      NUMBER(9),
  time1         NUMBER(4),
  time2         NUMBER(4),
  time3         NUMBER(4),
  time4         NUMBER(4),
  time5         NUMBER(4),
  time6         NUMBER(4),
  time7         NUMBER(4),
  time8         NUMBER(4),
  time9         NUMBER(4),
  time10        NUMBER(4),
  usercode3     VARCHAR2(1),
  usercode4     VARCHAR2(6),
  evalcde1      VARCHAR2(3),
  evalcde2      VARCHAR2(3),
  evalcde3      VARCHAR2(3),
  lastoccevl    VARCHAR2(32),
  lastphyevl    VARCHAR2(32),
  folderloc     VARCHAR2(3),
  couasseval    VARCHAR2(32),
  funvisass     VARCHAR2(32),
  lrnmedass     VARCHAR2(32),
  medelig       VARCHAR2(1),
  staffunav     VARCHAR2(1),
  spedind       VARCHAR2(3),
  preschcdis    VARCHAR2(3),
  usercode1     VARCHAR2(3),
  hours1        NUMBER(5,1),
  usercode2     VARCHAR2(3),
  hours2        NUMBER(5,1),
  adddis        VARCHAR2(3),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXP_SASI_SCH on ALLEN.STXP (ETL_SASI_SCH)
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
prompt Creating table STXQ
prompt ===================
prompt
create table ALLEN.STXQ
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  enterdate     VARCHAR2(32),
  exitdate      VARCHAR2(32),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER(5),
  primdis       VARCHAR2(3),
  seconddis     VARCHAR2(3),
  tertdis       VARCHAR2(3),
  childfndcd    VARCHAR2(3),
  instrset      VARCHAR2(3),
  speechonly    VARCHAR2(3),
  regndfsch     VARCHAR2(3),
  erlychdinv    VARCHAR2(3),
  asst_tech     VARCHAR2(3),
  interpsrv     VARCHAR2(3),
  counsel       VARCHAR2(3),
  medfrag       VARCHAR2(3),
  occ           VARCHAR2(3),
  mobil         VARCHAR2(3),
  physical      VARCHAR2(3),
  rec           VARCHAR2(3),
  audio         VARCHAR2(3),
  meddiag       VARCHAR2(3),
  psychserv     VARCHAR2(3),
  schlhlth      VARCHAR2(3),
  socialwork    VARCHAR2(3),
  transport     VARCHAR2(3),
  multidisab    VARCHAR2(3),
  spedind       VARCHAR2(3),
  preschcdis    VARCHAR2(3),
  adddis        VARCHAR2(3),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 0
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
create bitmap index ALLEN.BIX_STXQ_SASI_SCH on ALLEN.STXQ (ETL_SASI_SCH)
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
prompt Creating table STXR
prompt ===================
prompt
create table ALLEN.STXR
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        CHAR(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER,
  notprom       CHAR(1),
  offgrade      CHAR(1),
  notgrad       CHAR(1),
  failtaas      CHAR(1),
  readytest     CHAR(1),
  abused        CHAR(1),
  deliqcond     CHAR(1),
  homeless      CHAR(1),
  residfac      CHAR(1),
  origid        VARCHAR2(32),
  origassmt     VARCHAR2(32),
  testtype      VARCHAR2(3),
  origplace     VARCHAR2(32),
  origplacd     VARCHAR2(2),
  lastplace     VARCHAR2(32),
  lastplacd     VARCHAR2(2),
  parnot        VARCHAR2(32),
  origprgent    VARCHAR2(32),
  origprgext    VARCHAR2(32),
  lateprgent    VARCHAR2(32),
  lateprgext    VARCHAR2(32),
  mathgreq      NUMBER,
  mathtest      VARCHAR2(32),
  readgreq      NUMBER,
  readtest      VARCHAR2(32),
  dotype        CHAR(1),
  doyr1         VARCHAR2(2),
  doyr2         VARCHAR2(2),
  doexrea       VARCHAR2(2),
  parent        CHAR(1),
  comments      VARCHAR2(75),
  atrisk        VARCHAR2(3),
  usercode      VARCHAR2(3),
  placedaep     VARCHAR2(3),
  expulsion     VARCHAR2(3),
  parole        VARCHAR2(3),
  lep           VARCHAR2(3),
  dprs          VARCHAR2(3),
  r10_loaddate  DATE
)
tablespace DW_DEFAULT01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;

prompt
prompt Creating table STXS
prompt ===================
prompt
create table ALLEN.STXS
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        CHAR(1),
  schoolnum     VARCHAR2(3),
  stulink       NUMBER,
  streetaddr    VARCHAR2(35),
  city          VARCHAR2(24),
  zipcode       VARCHAR2(10),
  state         VARCHAR2(2),
  birthcity     VARCHAR2(17),
  birthstate    VARCHAR2(2),
  campusid      NUMBER,
  nonattrsn     CHAR(1),
  countyres     NUMBER,
  firstdist     VARCHAR2(32),
  movedadr      VARCHAR2(32),
  drivlic       CHAR(1),
  yearswith     NUMBER,
  numbro        NUMBER,
  numsis        NUMBER,
  earedtyp      VARCHAR2(2),
  parfedemp     CHAR(1),
  supmilres     CHAR(1),
  corppun       CHAR(1),
  emergrem      CHAR(1),
  suspended     CHAR(1),
  expelled      CHAR(1),
  saepdays      CHAR(1),
  saepweeks     CHAR(1),
  saepover      CHAR(1),
  gradtype      VARCHAR2(3),
  dippurs       CHAR(1),
  notused       VARCHAR2(32),
  collbound     VARCHAR2(3),
  notused2      NUMBER,
  notused3      VARCHAR2(3),
  notused4      VARCHAR2(32),
  notused5      VARCHAR2(32),
  notused6      VARCHAR2(32),
  econstatus    VARCHAR2(3),
  frlunchbeg    VARCHAR2(32),
  frlunchend    VARCHAR2(32),
  otherecon     CHAR(1),
  transsta      CHAR(1),
  transret      CHAR(1),
  yearendsta    VARCHAR2(2),
  rettrancd     VARCHAR2(2),
  secondret     VARCHAR2(2),
  failedp4      CHAR(1),
  failed58      CHAR(1),
  failed0912    VARCHAR2(2),
  placedty      CHAR(1),
  speccode1     CHAR(1),
  speccode2     CHAR(1),
  speccode3     CHAR(1),
  speccode4     CHAR(1),
  speccode5     CHAR(1),
  speccode6     CHAR(1),
  speccode7     CHAR(1),
  speccode8     CHAR(1),
  speccode9     CHAR(1),
  speccode10    CHAR(1),
  speccode11    CHAR(1),
  speccode12    CHAR(1),
  speccode13    CHAR(1),
  reqtrans      VARCHAR2(32),
  reqcode       CHAR(1),
  parsign       CHAR(1),
  adul_ed       CHAR(1),
  followthru    CHAR(1),
  employ        CHAR(1),
  married       CHAR(1),
  cntyres       CHAR(1),
  tuition       CHAR(1),
  negdel        CHAR(1),
  cartrtctr     CHAR(1),
  uilcomp       VARCHAR2(2),
  remedid       VARCHAR2(32),
  remedcat      CHAR(1),
  altlang       VARCHAR2(2),
  stusta        CHAR(1),
  supcomm       VARCHAR2(75),
  grdretcd2     VARCHAR2(2),
  prg2drlex     VARCHAR2(32),
  prgltrlent    VARCHAR2(32),
  prgltrlex     VARCHAR2(32),
  yrperfatt     VARCHAR2(2),
  thirdret      VARCHAR2(2),
  zone_chool    NUMBER,
  txscholar     CHAR(1),
  compged       CHAR(1),
  newtrans      CHAR(1),
  magnet        CHAR(1),
  aptno         VARCHAR2(5),
  geonum        VARCHAR2(6),
  geoprefix     VARCHAR2(2),
  geostreet     VARCHAR2(15),
  geotype       VARCHAR2(4),
  geosuffix     VARCHAR2(2),
  geotranrsn    VARCHAR2(2),
  geotranreq    CHAR(1),
  geoampm       CHAR(1),
  previd        VARCHAR2(13),
  attbtn        VARCHAR2(3),
  asof          VARCHAR2(3),
  exclpeims     VARCHAR2(3),
  migrant       CHAR(1),
  immigrant     CHAR(1),
  noshowdt      VARCHAR2(32),
  lvereason1    VARCHAR2(3),
  campusacc     NUMBER,
  serv504       CHAR(1),
  reason504     VARCHAR2(6),
  oeypproret    VARCHAR2(3),
  supmidname    VARCHAR2(14),
  certdate      VARCHAR2(32),
  r10_loaddate  DATE
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
prompt Creating table STXZ
prompt ===================
prompt
create table ALLEN.STXZ
(
  etl_sasi_sch  CHAR(3) not null,
  etl_sasi_year CHAR(1) not null,
  status        VARCHAR2(1),
  serviceid     VARCHAR2(9),
  servidname    VARCHAR2(40),
  translabel    VARCHAR2(8),
  identify      VARCHAR2(5),
  crsgroup      VARCHAR2(1),
  usercode      VARCHAR2(4),
  r10_loaddate  DATE
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
prompt Creating table T040
prompt ===================
prompt
create table ALLEN.T040
(
  school_year  NUMBER(11),
  submission   NUMBER(11),
  e0755        VARCHAR2(6),
  e0212        VARCHAR2(12),
  e0505        VARCHAR2(18),
  e0703        VARCHAR2(34),
  e0704        VARCHAR2(28),
  e0705        VARCHAR2(50),
  e0706        VARCHAR2(2),
  e0004        VARCHAR2(2),
  e0005        VARCHAR2(2),
  e0130        VARCHAR2(4),
  e0730        VARCHAR2(10),
  r10_loaddate DATE
)
tablespace DW_DEFAULT02
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
prompt Creating table TERM_DEFINITION
prompt ==============================
prompt
create table ALLEN.TERM_DEFINITION
(
  entity_id        VARCHAR2(10),
  school_year      NUMBER,
  semester_nbr     NUMBER,
  term_nbr         NUMBER,
  semester_desc    VARCHAR2(40),
  term_desc        VARCHAR2(40),
  schd_trm_str     NUMBER,
  schd_trm_stp     NUMBER,
  live             VARCHAR2(1),
  semester_lit     VARCHAR2(6),
  term_lit         VARCHAR2(6),
  track            NUMBER,
  sem_trm_str_date DATE,
  sem_trm_stp_date DATE
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
create bitmap index ALLEN.BMX_TERM_DEFINITION_ENTITYID on ALLEN.TERM_DEFINITION (SCHOOL_YEAR, ENTITY_ID)
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
create bitmap index ALLEN.BMX_TERM_DEFINITION_STPDATE on ALLEN.TERM_DEFINITION (SEM_TRM_STP_DATE)
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
create bitmap index ALLEN.BMX_TERM_DEFINITION_STRDATE on ALLEN.TERM_DEFINITION (SEM_TRM_STR_DATE)
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
prompt Creating table TITLE_I_PART_A
prompt =============================
prompt
create table ALLEN.TITLE_I_PART_A
(
  student_id               VARCHAR2(10),
  title_i_parta_ind        VARCHAR2(1),
  school_year              VARCHAR2(10),
  homeless_ind             VARCHAR2(1),
  reading_ind              VARCHAR2(1),
  mathematics_ind          VARCHAR2(1),
  science_ind              VARCHAR2(1),
  social_studies_ind       VARCHAR2(1),
  guidance_counseling_ind  VARCHAR2(1),
  social_work_services_ind VARCHAR2(1),
  health_services_ind      VARCHAR2(1),
  entity_id                VARCHAR2(5)
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
prompt Creating table TRANS_EQUIP_DIM_DEX0
prompt ===================================
prompt
create table ALLEN.TRANS_EQUIP_DIM_DEX0
(
  loc_county_dist_id CHAR(6),
  bus_key            VARCHAR2(25),
  bus_id             VARCHAR2(15),
  permit_num         VARCHAR2(25),
  state_inspect      VARCHAR2(25),
  sum_inspect        VARCHAR2(25),
  sticker_num        VARCHAR2(25),
  vin_num            VARCHAR2(50),
  chassis_make       VARCHAR2(25),
  chassis_year       VARCHAR2(25),
  body_make          VARCHAR2(25),
  body_year          VARCHAR2(25),
  primary_use        VARCHAR2(25),
  capacity           VARCHAR2(25),
  fuel_type          VARCHAR2(25),
  prim_handicap      VARCHAR2(25),
  wheelchair_lift    VARCHAR2(25),
  purch_method       VARCHAR2(25),
  purch_amt          VARCHAR2(25),
  purch_date         DATE
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
prompt Creating table TRANS_PER_FACT_FEX0
prompt ==================================
prompt
create table ALLEN.TRANS_PER_FACT_FEX0
(
  loc_county_dist_id CHAR(6),
  date_id            VARCHAR2(32),
  loc_key            VARCHAR2(55),
  staff_key          VARCHAR2(51),
  cdl_num            VARCHAR2(10),
  physical_date      VARCHAR2(32),
  driv_rec           VARCHAR2(10),
  crim_back          VARCHAR2(10),
  drug_test          VARCHAR2(10),
  inserv_train       VARCHAR2(10)
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
prompt Creating table TRANS_ROUTE_FACT_FEX0
prompt ====================================
prompt
create table ALLEN.TRANS_ROUTE_FACT_FEX0
(
  loc_county_dist_id CHAR(6),
  date_id            VARCHAR2(32),
  bus_key            VARCHAR2(25),
  trans_type_id      VARCHAR2(15),
  stu_key            VARCHAR2(55),
  staff_key          VARCHAR2(51),
  loc_key            VARCHAR2(55)
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
prompt Creating view V_ALLEN_GRADES_MAP
prompt ================================
prompt
create or replace force view allen.v_allen_grades_map as
select distinct 

ETL_SASI_SCH, 
ETL_SASI_YEAR, 
SCHOOLNUM, 
MARKNUM,
case
    when marknum in (1,3,5,9,11,13)
    then 'Six Weeks Grade'
    when marknum in (0,2,4,8,10,12)
    then 'Progress Report'
    when marknum in (6,14)
    then 'Term Exam'
    when marknum in (7,15)
    then 'Term Grade'
    when marknum in (16)
    then 'Final Grade'
    else 'Unknown'
end as grades_type,

case
    when marknum in (0,1)
    then 1
    when marknum in (2,3)
    then 2
    when marknum in (4,5)
    then 3
    when marknum in (8,9)
    then 4
    when marknum in (10,11)
    then 5
    when marknum in (12,13)
    then 6
    when marknum in (6,7)
    then 1
    when marknum in (14,15)
    then 2
    when marknum=16
    then 0
    else 0
end as grading_period

from AGRL

where
    schoolnum < '100'


union all

select distinct 

ETL_SASI_SCH, 
ETL_SASI_YEAR, 
SCHOOLNUM, 
MARKNUM,
case
    when marknum in (1,3,5,8,10,12)
    then 'Six Weeks Grade'
    when marknum in (0,2,4,7,9,11)
    then 'Progress Report'
    when marknum in (6,13)
    then 'Term Grade'
    when marknum in (14)
    then 'Final Grade'
    else 'Unknown'
end as grades_type,

case
    when marknum in (0,1)
    then 1
    when marknum in (2,3)
    then 2
    when marknum in (4,5)
    then 3
    when marknum in (7,8)
    then 4
    when marknum in (9,10)
    then 5
    when marknum in (11,12)
    then 6
    when marknum in (6)
    then 1
    when marknum in (13)
    then 2
    when marknum=14
    then 0
    else 0
end as grading_period

from AGRL

where
    schoolnum >= '100';

prompt
prompt Creating view V_EMP_DEMOGRAPHIC
prompt ===============================
prompt
create or replace force view allen.v_emp_demographic as
Select "NAME_ID","TOTAL_EXP","DISTRICT_EXP","FIS_YEAR","RANK" from (select NAME_ID, TOTAL_EXP, DISTRICT_EXP, FIS_YEAR, 
    rank() over (partition by NAME_ID order by  FIS_YEAR desc) as rank 
from ftx_emp_demographic
)
where rank=1;

prompt
prompt Creating view V_ENROLLED_STUDENTS
prompt =================================
prompt
create or replace force view allen.v_enrolled_students as
select student_id
         ,entity_id
         ,ew_date
         ,entryc_code
         ,case
            when withdrawal_date is null
            then to_char(sysdate,'YYYY-MM-DD')
            else withdrawal_date
          end as withdrawal_date
         ,rank() over(partition by student_id order by ew_date desc,entity_id desc) as ranktrans

from student_ew
where ew_date between '20100823' and to_char(sysdate,'YYYYMMDD')
and (withdrawal_date <= to_char(sysdate,'YYYY-MM-DD') or (withdrawal_date is null));

prompt
prompt Creating view V_T040
prompt ====================
prompt
create or replace force view allen.v_t040 as
Select "SCHOOL_YEAR","E0730","E0505","RANK","E0212" from (select School_year,e0730 ,e0505 ,
    rank() over (partition by e0505 order by  School_year desc) as rank ,e0212
    from T040
    )
    where rank=1;

prompt
prompt Creating function FN_CURRENT_GRADE
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION ALLEN."FN_CURRENT_GRADE"
(p_student_id IN varchar2)

return varchar2
is

    v_cur_grd varchar2(10);
    v_cur_yr number;

begin 

    v_cur_grd := '';
    select distinct to_number(schl_year)
                into v_cur_yr
                from dw.date_dim date_dim
                where date_dim.date_sid = to_char(sysdate, 'YYYYMMDD');


    select case
                when (12 - (student.grad_yr - v_cur_yr)) < -1 then 'EE'
                when (12 - (student.grad_yr - v_cur_yr)) = -1 then 'PK'
                when (12 - (student.grad_yr - v_cur_yr)) = 0 then 'KG'
                else lpad(to_char((12 - (student.grad_yr - v_cur_yr))),2,'0')
           end
    into v_cur_grd
    from
        allen.student student
    where
        student.student_id = p_student_id;

    return v_cur_grd;
end;
/

prompt
prompt Creating function FN_EMPTY_ARRAY
prompt ================================
prompt
CREATE OR REPLACE FUNCTION ALLEN."FN_EMPTY_ARRAY"
(p_valarray IN VARCHAR2)
RETURN NUMBER
IS
wrkarray VARCHAR2(4026);

BEGIN

wrkarray := p_valarray;
wrkarray := replace(translate(wrkarray,';',' '),' ','');

IF wrkarray IS NULL THEN                                            
    RETURN 1;                                                 
ELSE
    RETURN 0;              
END IF;
END;
/

prompt
prompt Creating function FN_GET_VALUE
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION ALLEN."FN_GET_VALUE"
(p_levelno IN NUMBER, p_valsep IN VARCHAR2, p_valarray IN VARCHAR2)
RETURN VARCHAR2
IS
begpos NUMBER(4);
endpos NUMBER(4);
strlength NUMBER(4);
wrkarray VARCHAR2(4000); 

BEGIN
strlength := 0;
begpos := 0;
endpos := 0;
wrkarray := NULL;
wrkarray := replace(p_valarray,' ',''); 

IF (p_levelno > 0) AND (wrkarray IS NOT NULL) THEN
    endpos := instr(wrkarray, p_valsep, 1, p_levelno);              -- Ending position is position of p_valsep
END IF;

IF (p_levelno < 1) OR (p_levelno IS NULL) OR (wrkarray IS NULL) THEN                                            
    RETURN NULL;                                                    -- Invalid p_levelno or p_valarray so return nothing
ELSIF (p_levelno = 1) THEN                                           
    begpos := 1;                                                    -- begpos to retrieve the first element in the array                                              
ELSIF (endpos = 0) THEN
    begpos := instr(wrkarray, p_valsep, 1,(p_levelno - 1));         -- begpos to retrieve the last or only element in the array
    IF (begpos > 0) AND (begpos < length(wrkarray)) THEN        
       begpos := begpos + 1;                                    
    END IF;
ELSE
    begpos := instr(wrkarray, p_valsep, 1,(p_levelno - 1)) + 1;     -- begpos to retrieve element from in the middle of the array
END IF;

IF (endpos = 0)  THEN                                           
    strlength := length(wrkarray);                                  -- Calculate strlength to get the last or only element in the array
    IF (begpos = 0) OR (begpos = strlength) THEN 
       strlength := 0;                                              -- No element in the array; reset strlength  
    END IF;                           
ELSE   
    strlength := endpos - begpos;                                   -- Element in the array; calculate the strlength
END IF;

IF (strlength = 0) THEN
    RETURN NULL;                                                    -- Nothing there so return nothing
ELSE 
    RETURN ( substr(wrkarray, begpos, strlength) );                 -- Return array element
END IF; 
END;
/


spool off
