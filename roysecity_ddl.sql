-----------------------------------------------------------
-- Export file for user ROYSECITY@DATAWH                 --
-- Created by espositot on 5/26/2016, 16:22:05 16:22:05  --
-----------------------------------------------------------

set define off
spool roysecity_ddl.log

prompt
prompt Creating table AAAGRADE_CHKSUM
prompt ==============================
prompt
create table ROYSECITY.AAAGRADE_CHKSUM
(
  dist_id VARCHAR2(6),
  sch_yr  VARCHAR2(4),
  stu_id  VARCHAR2(6),
  total   NUMBER
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

prompt
prompt Creating table AAAGRADE_XML_EXTRACT
prompt ===================================
prompt
create table ROYSECITY.AAAGRADE_XML_EXTRACT
(
  dist_id            VARCHAR2(6),
  campus_id          VARCHAR2(3),
  sch_yr             VARCHAR2(4),
  stu_id             VARCHAR2(6),
  crs_nbr            VARCHAR2(4),
  sec_nbr            VARCHAR2(2),
  crs_sem_enroll     CHAR(1),
  assesmentscore     VARCHAR2(3),
  numericgradeearned VARCHAR2(3),
  lettergradeearned  VARCHAR2(3),
  gradingperiodtype  VARCHAR2(16)
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

prompt
prompt Creating table AAA_CREDIT_XFER_DATA
prompt ===================================
prompt
create table ROYSECITY.AAA_CREDIT_XFER_DATA
(
  sch_yr         VARCHAR2(4),
  campus         CHAR(3),
  grade_level    CHAR(3),
  stu_id         VARCHAR2(6),
  crs_nbr        CHAR(3),
  sec_nbr        CHAR(3),
  crs_sem_enroll CHAR(3),
  seq_nbr        NUMBER(4),
  title          VARCHAR2(15),
  service_id     VARCHAR2(8),
  svcid_typ      VARCHAR2(4),
  svcid_descr    VARCHAR2(10),
  grd_sem        CHAR(3),
  grd_avg        VARCHAR2(3),
  crs_credit     NUMBER
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

prompt
prompt Creating table AAA_OOAK
prompt =======================
prompt
create table ROYSECITY.AAA_OOAK
(
  campus_id VARCHAR2(3),
  sch_yr    VARCHAR2(4),
  sql1      CHAR(200)
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

prompt
prompt Creating table ADDRESS
prompt ======================
prompt
create table ROYSECITY.ADDRESS
(
  address_id        NUMBER(11),
  street_dir        VARCHAR2(50),
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
  path_id_minority  VARCHAR2(16),
  country_id        VARCHAR2(16),
  path_id_majority  VARCHAR2(16),
  rural_box_nbr     VARCHAR2(16),
  r10_loaddate      DATE
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
create unique index ROYSECITY.XPKADDRESS on ROYSECITY.ADDRESS (ADDRESS_ID)
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
prompt Creating table BINMARKS
prompt =======================
prompt
create table ROYSECITY.BINMARKS
(
  binname      VARCHAR2(29),
  mkclssctn    NUMBER(5),
  mkclstrm1    CHAR(1),
  mkclstrm10   CHAR(1),
  mkclstrm11   CHAR(1),
  mkclstrm12   CHAR(1),
  mkclstrm2    CHAR(1),
  mkclstrm3    CHAR(1),
  mkclstrm4    CHAR(1),
  mkclstrm5    CHAR(1),
  mkclstrm6    CHAR(1),
  mkclstrm7    CHAR(1),
  mkclstrm8    CHAR(1),
  mkclstrm9    CHAR(1),
  mkcomment1   VARCHAR2(4),
  mkcomment2   VARCHAR2(4),
  mkcomment3   VARCHAR2(4),
  mkcomment4   VARCHAR2(4),
  mkcomment5   VARCHAR2(4),
  mkctznship   VARCHAR2(4),
  mkerncredt   NUMBER(8,3),
  mkfinalmrk   CHAR(1),
  mkgdpoints   NUMBER(8,3),
  mkhonorcrs   CHAR(1),
  mkinactive   CHAR(1),
  mkincprint   CHAR(1),
  mkiswghted   CHAR(1),
  mkltrgrade   VARCHAR2(3),
  mkoccpres    NUMBER(7,1),
  mkoccuxabs   NUMBER(7,1),
  mkoccuxlte   NUMBER(7,1),
  mkoccxabs    NUMBER(7,1),
  mkoccxlte    NUMBER(7,1),
  mkpassfail   VARCHAR2(17),
  mkpercent    NUMBER(8,3),
  mkpotcredt   NUMBER(8,3),
  mkusedgpa    CHAR(1),
  mkusedinec   CHAR(1),
  mkvalpres    NUMBER(7,1),
  mkvaluxabs   NUMBER(7,1),
  mkvaluxlte   NUMBER(7,1),
  mkvalxabs    NUMBER(7,1),
  mkvalxlte    NUMBER(7,1),
  mkwrkhabit   VARCHAR2(4),
  schoolid     VARCHAR2(9),
  mkbinseq     VARCHAR2(23),
  mkpmcredit   VARCHAR2(63),
  idbin        NUMBER(11),
  idclass      NUMBER(11),
  idcourse     NUMBER(11),
  idmkaltsrv   VARCHAR2(8),
  idpmbinsq    NUMBER(11),
  idpmcred     NUMBER(11),
  idschlicns   NUMBER(6),
  idstudent    NUMBER(11),
  idteacher    NUMBER(11),
  mktransflg   CHAR(1),
  userflg1     CHAR(1),
  userflg2     CHAR(1),
  userflg3     CHAR(1),
  userflg4     CHAR(1),
  userflg5     CHAR(1),
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_BINMARKS_MKINACTIVE on ROYSECITY.BINMARKS (MKINACTIVE)
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
create bitmap index ROYSECITY.BIX_BINMARKS_MKINACTIVE_ACTIVE on ROYSECITY.BINMARKS (SCHOOLID, MKINACTIVE)
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
create bitmap index ROYSECITY.BIX_BINMARKS_SCHOOLID on ROYSECITY.BINMARKS (SCHOOLID)
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
prompt Creating table CALENDAR
prompt =======================
prompt
create table ROYSECITY.CALENDAR
(
  dayatdterm   NUMBER(2),
  daydate      DATE,
  dayhasatd    CHAR(1),
  dayinatdtm   NUMBER(3),
  dayinschtm   NUMBER(3),
  dayinyear    NUMBER(3),
  daysched     NUMBER(2),
  dayschterm   NUMBER(2),
  daytype      VARCHAR2(21),
  dayvalue     NUMBER(3,1),
  schoolid     VARCHAR2(9),
  dayinpmtm    NUMBER(3),
  daypmterm    NUMBER(2),
  iddaysched   NUMBER(11),
  iddaytype    NUMBER(11),
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_CALENDAR_SCHOOLID on ROYSECITY.CALENDAR (SCHOOLID)
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
prompt Creating table CALTTBL
prompt ======================
prompt
create table ROYSECITY.CALTTBL
(
  calperiod    NUMBER(2),
  daydate      DATE,
  daysched     NUMBER(2),
  dayschterm   NUMBER(2),
  schoolid     VARCHAR2(9),
  timeslot     NUMBER(5),
  iddaysched   NUMBER(11),
  idperiod     NUMBER(11),
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_CALTTBL_SCHOOLID on ROYSECITY.CALTTBL (SCHOOLID)
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
prompt Creating table CLSINFO
prompt ======================
prompt
create table ROYSECITY.CLSINFO
(
  clspopsrvd   VARCHAR2(29),
  clsdistlrn   VARCHAR2(29),
  clsinstset   VARCHAR2(37),
  crsnumber    VARCHAR2(9),
  dualcredit   VARCHAR2(3),
  idclass      NUMBER(11),
  iddistlrn    NUMBER(11),
  idpminstr    NUMBER(11),
  idpopsrvd    NUMBER(11),
  idschlicns   NUMBER(6),
  mkclssctn    NUMBER(5),
  schoolid     VARCHAR2(9) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_CLSINFO_SCHOOLID on ROYSECITY.CLSINFO (SCHOOLID)
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
create unique index ROYSECITY.PK_CLSINFO on ROYSECITY.CLSINFO (IDCLASS)
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
prompt Creating table CLSTTBL
prompt ======================
prompt
create table ROYSECITY.CLSTTBL
(
  dayschterm   NUMBER(2),
  mkclssctn    NUMBER(5),
  rmnumber     VARCHAR2(7),
  schoolid     VARCHAR2(9),
  timeslot     NUMBER(5),
  idclass      NUMBER(11),
  idcourse     NUMBER(11),
  idschlicns   NUMBER(6),
  idtchaide    NUMBER(11),
  idteacher    NUMBER(11),
  idteacher2   NUMBER(11),
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_CLSTTBL_SCHOOLID on ROYSECITY.CLSTTBL (SCHOOLID)
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
prompt Creating table CRSDEMO
prompt ======================
prompt
create table ROYSECITY.CRSDEMO
(
  crsactive    CHAR(1),
  crsaidtype   VARCHAR2(29),
  crsaltname   VARCHAR2(20),
  crsdept      VARCHAR2(29),
  crsdistuse   CHAR(1),
  crsgrade     VARCHAR2(17),
  crsislocal   CHAR(1),
  crsname      VARCHAR2(20),
  crsnumber    VARCHAR2(9),
  crsseqnum    NUMBER(6),
  crssubarea   VARCHAR2(29),
  crstrack     VARCHAR2(29),
  crstrmntnd   DATE,
  crstype      VARCHAR2(29),
  crsufld1     VARCHAR2(15),
  crsufld10    VARCHAR2(15),
  crsufld2     VARCHAR2(15),
  crsufld3     VARCHAR2(15),
  crsufld4     VARCHAR2(15),
  crsufld5     VARCHAR2(15),
  crsufld6     VARCHAR2(15),
  crsufld7     VARCHAR2(15),
  crsufld8     VARCHAR2(15),
  crsufld9     VARCHAR2(15),
  crsuflg1     CHAR(1),
  crsuflg10    CHAR(1),
  crsuflg2     CHAR(1),
  crsuflg3     CHAR(1),
  crsuflg4     CHAR(1),
  crsuflg5     CHAR(1),
  crsuflg6     CHAR(1),
  crsuflg7     CHAR(1),
  crsuflg8     CHAR(1),
  crsuflg9     CHAR(1),
  schoolid     VARCHAR2(9),
  crsbinsd1    VARCHAR2(23),
  crsbinsd10   VARCHAR2(23),
  crsbinsd11   VARCHAR2(23),
  crsbinsd12   VARCHAR2(23),
  crsbinsd13   VARCHAR2(23),
  crsbinsd14   VARCHAR2(23),
  crsbinsd15   VARCHAR2(23),
  crsbinsd16   VARCHAR2(23),
  crsbinsd17   VARCHAR2(23),
  crsbinsd18   VARCHAR2(23),
  crsbinsd19   VARCHAR2(23),
  crsbinsd2    VARCHAR2(23),
  crsbinsd20   VARCHAR2(23),
  crsbinsd21   VARCHAR2(23),
  crsbinsd22   VARCHAR2(23),
  crsbinsd23   VARCHAR2(23),
  crsbinsd24   VARCHAR2(23),
  crsbinsd25   VARCHAR2(23),
  crsbinsd26   VARCHAR2(23),
  crsbinsd27   VARCHAR2(23),
  crsbinsd28   VARCHAR2(23),
  crsbinsd29   VARCHAR2(23),
  crsbinsd3    VARCHAR2(23),
  crsbinsd30   VARCHAR2(23),
  crsbinsd4    VARCHAR2(23),
  crsbinsd5    VARCHAR2(23),
  crsbinsd6    VARCHAR2(23),
  crsbinsd7    VARCHAR2(23),
  crsbinsd8    VARCHAR2(23),
  crsbinsd9    VARCHAR2(23),
  crscoopvoc   CHAR(1),
  crscrtechh   VARCHAR2(14),
  crsservid    VARCHAR2(8),
  crsufld11    VARCHAR2(15),
  crsufld12    VARCHAR2(15),
  crsufld13    VARCHAR2(15),
  crsufld14    VARCHAR2(15),
  crsufld15    VARCHAR2(15),
  crsufld16    VARCHAR2(15),
  crsuflg11    CHAR(1),
  crsuflg12    CHAR(1),
  crsuflg13    CHAR(1),
  crsuflg14    CHAR(1),
  crsuflg15    CHAR(1),
  crsuflg16    CHAR(1),
  crsulist1    VARCHAR2(29),
  crsulist2    VARCHAR2(29),
  crsulist3    VARCHAR2(29),
  crsulist4    VARCHAR2(29),
  crsulist5    VARCHAR2(29),
  crsulist6    VARCHAR2(29),
  crsulist7    VARCHAR2(29),
  crsulist8    VARCHAR2(29),
  idaidetype   NUMBER(11),
  idbinsqd1    NUMBER(11),
  idbinsqd10   NUMBER(11),
  idbinsqd11   NUMBER(11),
  idbinsqd12   NUMBER(11),
  idbinsqd13   NUMBER(11),
  idbinsqd14   NUMBER(11),
  idbinsqd15   NUMBER(11),
  idbinsqd16   NUMBER(11),
  idbinsqd17   NUMBER(11),
  idbinsqd18   NUMBER(11),
  idbinsqd19   NUMBER(11),
  idbinsqd2    NUMBER(11),
  idbinsqd20   NUMBER(11),
  idbinsqd21   NUMBER(11),
  idbinsqd22   NUMBER(11),
  idbinsqd23   NUMBER(11),
  idbinsqd24   NUMBER(11),
  idbinsqd25   NUMBER(11),
  idbinsqd26   NUMBER(11),
  idbinsqd27   NUMBER(11),
  idbinsqd28   NUMBER(11),
  idbinsqd29   NUMBER(11),
  idbinsqd3    NUMBER(11),
  idbinsqd30   NUMBER(11),
  idbinsqd4    NUMBER(11),
  idbinsqd5    NUMBER(11),
  idbinsqd6    NUMBER(11),
  idbinsqd7    NUMBER(11),
  idbinsqd8    NUMBER(11),
  idbinsqd9    NUMBER(11),
  idcourse     NUMBER(11),
  idcrstype    NUMBER(11),
  idcrsudls1   NUMBER(11),
  idcrsudls2   NUMBER(11),
  idcrsudls3   NUMBER(11),
  idcrsudls4   NUMBER(11),
  idcrsudls5   NUMBER(11),
  idcrsudls6   NUMBER(11),
  idcrsudls7   NUMBER(11),
  idcrsudls8   NUMBER(11),
  iddept       NUMBER(11),
  idgrade      NUMBER(11),
  idschlicns   NUMBER(6),
  idsubjarea   NUMBER(11),
  idtrack      NUMBER(11) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_CRSDEMO_CRSACTIVE on ROYSECITY.CRSDEMO (CRSACTIVE)
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
create bitmap index ROYSECITY.BIX_CRSDEMO_CRSACTIVE_ACTIVE on ROYSECITY.CRSDEMO (SCHOOLID, CRSACTIVE)
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
create bitmap index ROYSECITY.BIX_CRSDEMO_SCHOOLID on ROYSECITY.CRSDEMO (SCHOOLID)
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
create unique index ROYSECITY.PK_CRSDEMO on ROYSECITY.CRSDEMO (IDCOURSE)
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
prompt Creating table CR_ATT_CAL
prompt =========================
prompt
create table ROYSECITY.CR_ATT_CAL
(
  sch_yr          VARCHAR2(4),
  campus_id       VARCHAR2(3),
  track           VARCHAR2(1),
  day_date        VARCHAR2(8),
  membership_code CHAR(1),
  att_cycle       CHAR(1),
  att_semester    CHAR(1),
  jul_day         VARCHAR2(3),
  jul_year        VARCHAR2(4),
  grd_semester    CHAR(1),
  grd_cycle       CHAR(1),
  post_period     VARCHAR2(2),
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
create bitmap index ROYSECITY.BMI_CR_ATT_CAL_CAMPUSID on ROYSECITY.CR_ATT_CAL (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_CR_ATT_CAL_DAYDATE on ROYSECITY.CR_ATT_CAL (DAY_DATE)
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
create bitmap index ROYSECITY.BMI_CR_ATT_CAL_MBRCD on ROYSECITY.CR_ATT_CAL (MEMBERSHIP_CODE)
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
create bitmap index ROYSECITY.BMI_CR_ATT_CAL_SCH_YR on ROYSECITY.CR_ATT_CAL (SCH_YR)
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
create bitmap index ROYSECITY.BMI_CR_ATT_CAL_TRACK on ROYSECITY.CR_ATT_CAL (TRACK)
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
prompt Creating table CR_ATT_OPT
prompt =========================
prompt
create table ROYSECITY.CR_ATT_OPT
(
  sch_yr                  VARCHAR2(4),
  campus_id               VARCHAR2(3),
  track                   CHAR(1),
  att_cal                 VARCHAR2(366),
  dt_f_day_sch            VARCHAR2(8),
  dt_l_day_sch            VARCHAR2(8),
  type_cyc_att            CHAR(1),
  am_pm_flg               CHAR(1),
  att_per_nbr_taken       VARCHAR2(2),
  auto_tii_xfer           CHAR(1),
  att_ada_post_per        VARCHAR2(2),
  campus_excl_dist_rpt    CHAR(1),
  prt_stu_city_st_flg     CHAR(1),
  att_per_first           VARCHAR2(2),
  att_per_last            VARCHAR2(2),
  spread_abs              CHAR(1),
  dt_first_cyc0           VARCHAR2(8),
  dt_first_cyc1           VARCHAR2(8),
  dt_first_cyc2           VARCHAR2(8),
  dt_first_cyc3           VARCHAR2(8),
  dt_first_cyc4           VARCHAR2(8),
  dt_first_cyc5           VARCHAR2(8),
  tot_days_in_att_cyc0    VARCHAR2(2),
  tot_days_in_att_cyc1    VARCHAR2(2),
  tot_days_in_att_cyc2    VARCHAR2(2),
  tot_days_in_att_cyc3    VARCHAR2(2),
  tot_days_in_att_cyc4    VARCHAR2(2),
  tot_days_in_att_cyc5    VARCHAR2(2),
  fatal_warning_none_edit CHAR(1),
  kinder_half_day         CHAR(1),
  prt_ctrl_nbr            CHAR(1),
  att_ue_scan_wand_form   CHAR(1),
  pregrid_form_type       CHAR(1),
  admin_area_cd           CHAR(1),
  rpt_seq_summary         CHAR(1),
  rpt_seq_att_post        CHAR(1),
  rpt_seq_att_daily       CHAR(1),
  rpt_seq_att_edit        CHAR(1),
  rpt_seq_pregrid         CHAR(1),
  rpt_interim_seq         CHAR(1),
  rpt_seq_principal       CHAR(1),
  rpt_interim_abs_sem     VARCHAR2(2),
  rpt_interim_abs_ytd     VARCHAR2(2),
  rpt_interim_abs_cyc     VARCHAR2(2),
  speced_svc_offrd        CHAR(1),
  bil_esl_svc_offrd       CHAR(1),
  gt_svcs_offrd           CHAR(1),
  preg_related_svc_offrd  CHAR(1),
  tii_svc_offrd           CHAR(1),
  pat1010_default_sem     CHAR(1),
  grd_lvl1_trk            VARCHAR2(2),
  grd_lvl2_trk            VARCHAR2(2),
  grd_lvl3_trk            VARCHAR2(2),
  grd_lvl4_trk            VARCHAR2(2),
  grd_lvl5_trk            VARCHAR2(2),
  grd_lvl6_trk            VARCHAR2(2),
  grd_lvl7_trk            VARCHAR2(2),
  grd_lvl8_trk            VARCHAR2(2),
  grd_lvl9_trk            VARCHAR2(2),
  grd_lvl10_trk           VARCHAR2(2),
  grd_lvl11_trk           VARCHAR2(2),
  grd_lvl12_trk           VARCHAR2(2),
  grd_lvl13_trk           VARCHAR2(2),
  grd_lvl14_trk           VARCHAR2(2),
  grd_lvl15_trk           VARCHAR2(2),
  r10_loaddate            DATE
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
create bitmap index ROYSECITY.BMI_CR_ATT_OPT_ATT_ADA on ROYSECITY.CR_ATT_OPT (ATT_ADA_POST_PER)
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
create bitmap index ROYSECITY.BMI_CR_ATT_OPT_CAMPUSID on ROYSECITY.CR_ATT_OPT (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_CR_ATT_OPT_SCHL_YR on ROYSECITY.CR_ATT_OPT (SCH_YR)
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
create bitmap index ROYSECITY.BMI_CR_ATT_OPT_TRACK on ROYSECITY.CR_ATT_OPT (TRACK)
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
prompt Creating table CR_CATEG
prompt =======================
prompt
create table ROYSECITY.CR_CATEG
(
  campus_id    VARCHAR2(3),
  typ          NUMBER,
  descr        VARCHAR2(25),
  pct_wgt      NUMBER(3),
  is_locked    CHAR(1),
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
prompt Creating table CR_CRS_ASSGN
prompt ===========================
prompt
create table ROYSECITY.CR_CRS_ASSGN
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem          CHAR(1),
  cyc          CHAR(1),
  assgn_nbr    NUMBER(5),
  typ          NUMBER,
  descr        VARCHAR2(50),
  max_grd      VARCHAR2(3),
  dt_assgn     VARCHAR2(8),
  dt_due       VARCHAR2(8),
  extr_crdt    CHAR(1),
  notes        VARCHAR2(3270),
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
prompt Creating table CR_CRS_OFFERED_CYR
prompt =================================
prompt
create table ROYSECITY.CR_CRS_OFFERED_CYR
(
  sch_yr                   VARCHAR2(4),
  campus_id                VARCHAR2(3),
  crs_nbr                  VARCHAR2(4),
  allow_blank_grd          CHAR(1),
  incl_conflict_matrix     CHAR(1),
  grd_rstrctn              VARCHAR2(2),
  grd_rstrctn_addl         CHAR(1),
  pregrid_grd_rstrctn      VARCHAR2(2),
  pregrid_addl_grd_rstrctn CHAR(1),
  extract_for_grading      CHAR(1),
  can_split_opt            CHAR(1),
  grd_type                 CHAR(1),
  max_seats                VARCHAR2(3),
  excl_stu_crs_req         CHAR(1),
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

prompt
prompt Creating table CR_DEMO
prompt ======================
prompt
create table ROYSECITY.CR_DEMO
(
  sch_yr                    VARCHAR2(4),
  campus_id                 VARCHAR2(3),
  campus_name               VARCHAR2(34),
  str_nbr                   VARCHAR2(9),
  str_name                  VARCHAR2(19),
  city_name                 VARCHAR2(17),
  tb_campus_state           VARCHAR2(2),
  zip                       VARCHAR2(5),
  zip4                      VARCHAR2(4),
  phone_area_cd             VARCHAR2(3),
  phone_nbr                 VARCHAR2(7),
  grd_rng_low               VARCHAR2(2),
  grd_rng_hi                VARCHAR2(2),
  sch_accrd_flg             CHAR(1),
  college_brd_campus_cd     VARCHAR2(6),
  stu_info_amt_print        CHAR(1),
  stu_info_type_form        CHAR(1),
  nbr_sem_sch               CHAR(1),
  incl_campus_del_stu       CHAR(1),
  dist_id                   VARCHAR2(6),
  allow_campus_del_stu      CHAR(1),
  using_subsidiary_campuses CHAR(1),
  default_attend_trk        CHAR(1),
  fax_ac                    VARCHAR2(3),
  fax_nbr                   VARCHAR2(7),
  demo_rev_warn             CHAR(1),
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

prompt
prompt Creating table CR_GAVG
prompt ======================
prompt
create table ROYSECITY.CR_GAVG
(
  sch_yr            VARCHAR2(4),
  campus_id         VARCHAR2(3),
  grd_avg_table_typ CHAR(1),
  grd_avg_grd_value VARCHAR2(3),
  grd_avg_pts_value NUMBER,
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

prompt
prompt Creating table CR_GRADEBK_ATT_OPT
prompt =================================
prompt
create table ROYSECITY.CR_GRADEBK_ATT_OPT
(
  campus_id    VARCHAR2(3),
  dflt_abs_cd  CHAR(1),
  dflt_tdy_cd  CHAR(1),
  a_day_post   VARCHAR2(2),
  b_day_post   VARCHAR2(2),
  tdy_dur_ada  CHAR(1),
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
prompt Creating table CR_GRADEBK_OPT
prompt =============================
prompt
create table ROYSECITY.CR_GRADEBK_OPT
(
  campus_id            VARCHAR2(3),
  gradebk_use_flg      CHAR(1),
  open_grd_post        CHAR(1),
  prior_dys_post       CHAR(1),
  gradebk_msg          VARCHAR2(3270),
  econ_disadv          CHAR(1),
  spec_ed              CHAR(1),
  gt_opt               CHAR(1),
  bil_esl              CHAR(1),
  tii                  CHAR(1),
  prs                  CHAR(1),
  pep                  CHAR(1),
  at_risk              CHAR(1),
  migr                 CHAR(1),
  overr_sem            CHAR(1),
  teach_add_categ_flag CHAR(1),
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
prompt Creating table CR_GRD_RPTNG_INFO
prompt ================================
prompt
create table ROYSECITY.CR_GRD_RPTNG_INFO
(
  sch_yr                       VARCHAR2(4),
  campus_id                    VARCHAR2(3),
  curr_sem                     CHAR(1),
  curr_cyc                     CHAR(1),
  grd_rptng_typ                CHAR(1),
  grading_concept              CHAR(1),
  rpt_card_seq                 CHAR(1),
  grd_low_grd_lvl              VARCHAR2(2),
  grd_high_grd_lvl             VARCHAR2(2),
  low_grd_allowed              VARCHAR2(3),
  high_grd_allowed             VARCHAR2(3),
  low_exam_grd_allowed         VARCHAR2(3),
  high_exam_grd_allowed        VARCHAR2(3),
  highest_non_passing_grd      VARCHAR2(3),
  auto_citizenship             CHAR(1),
  citizenship_grd              CHAR(1),
  tot_wgt                      VARCHAR2(2),
  grd_rpt_exam_wgt             CHAR(1),
  expect_exam_grd              CHAR(1),
  grd_rpt_exam_wgt_equal       CHAR(1),
  incl_exam                    CHAR(1),
  prt_exempt_exam_grd          CHAR(1),
  allow_cr_wp                  CHAR(1),
  allow_spec_cr                CHAR(1),
  rpt_card_fail_msg            CHAR(1),
  typ_avg_school_or_computer   CHAR(1),
  abs_tardy_src                CHAR(1),
  grds_to_prt                  CHAR(1),
  replacement_grd_value        CHAR(1),
  conv_e                       CHAR(1),
  conv_s                       CHAR(1),
  conv_n                       CHAR(1),
  conv_u                       CHAR(1),
  conv_p                       CHAR(1),
  grd_cvsn_a_value             VARCHAR2(3),
  grd_cvsn_b_value             VARCHAR2(3),
  grd_cvsn_c_value             VARCHAR2(3),
  grd_cvsn_d_value             VARCHAR2(3),
  grd_cvsn_f_value             VARCHAR2(3),
  allow_abs                    CHAR(1),
  allow_tardy                  CHAR(1),
  allow_cyc_grd                CHAR(1),
  allow_fin_grd                CHAR(1),
  allow_sem_grd                CHAR(1),
  cr_if_failed_1st_sem         CHAR(1),
  allow_exempt_exam            CHAR(1),
  allow_numeric_exam           CHAR(1),
  allow_alpha_exam             CHAR(1),
  use_generic_rpt_card         CHAR(1),
  typ_elem_rpt_card            CHAR(1),
  allow_cr_basic               CHAR(1),
  blnk_out_alpha_final_grd     CHAR(1),
  elem_rpt_card_prt_instr      CHAR(1),
  crs_seq_on_report_card       CHAR(1),
  prt_ng_on_rpt_card           CHAR(1),
  prt_ng_on_lbl                CHAR(1),
  crs_non_cr                   VARCHAR2(2),
  use_plus_minus               CHAR(1),
  rpt_card_non_cr              CHAR(1),
  match_like_crs               CHAR(1),
  prt_nc_on_lbl                CHAR(1),
  nbr_cyc_per_sem              CHAR(1),
  excl_citz_from_hroll         CHAR(1),
  hroll_cls_load               CHAR(1),
  hroll_excl_msg               CHAR(1),
  grd_used_for_gavg            CHAR(1),
  type_gavg_used               CHAR(1),
  gavg_low_grd                 VARCHAR2(2),
  gavg_computation_use         CHAR(1),
  gavg_4pt_scale               CHAR(1),
  gavg_incl_wd_stu_in_avg      CHAR(1),
  use_gp_hroll_tbl_for_hroll   CHAR(1),
  gavg_incl_wd_stu_in_rank     CHAR(1),
  gavg_incl_se_in_rank         CHAR(1),
  incl_wd_crs_in_rank          CHAR(1),
  abnormal_cd_crs              CHAR(1),
  pe_waiver_cr                 CHAR(1),
  allow_recomp                 CHAR(1),
  blnk_out_sem_fin             CHAR(1),
  remove_cr_recomp             CHAR(1),
  grd_rpt_end_sem1_cyc1_dt     VARCHAR2(8),
  grd_rpt_end_sem1_cyc2_dt     VARCHAR2(8),
  grd_rpt_end_sem1_cyc3_dt     VARCHAR2(8),
  grd_rpt_end_sem2_cyc1_dt     VARCHAR2(8),
  grd_rpt_end_sem2_cyc2_dt     VARCHAR2(8),
  grd_rpt_end_sem2_cyc3_dt     VARCHAR2(8),
  proof_list_seq               VARCHAR2(8),
  proof_lst_per_prt            VARCHAR2(8),
  rpt_card_per_prt             VARCHAR2(8),
  grd_rpt_prt_ipr_comments     VARCHAR2(8),
  grd_rpt_incl_non_grd_crs     VARCHAR2(8),
  prt_wf                       VARCHAR2(8),
  prt_wp                       VARCHAR2(8),
  use_rpt_card_comments_on_ipr VARCHAR2(8),
  prt_wd_crs_rpt_card          VARCHAR2(8),
  prt_wd_stu_rpt_card          VARCHAR2(8),
  prt_cr_on_rpt_card           VARCHAR2(8),
  prt_cr_on_lbl                VARCHAR2(8),
  prt_wd_stu                   VARCHAR2(8),
  grd_rpt_prt_honors           VARCHAR2(8),
  prt_cr_to_date               VARCHAR2(8),
  prt_comments_rpt_card        VARCHAR2(8),
  nbr_sem                      VARCHAR2(8),
  allow_cr_honors              VARCHAR2(8),
  hroll_cutoff_value1          VARCHAR2(8),
  hroll_cutoff_value2          VARCHAR2(8),
  hroll_cutoff_value3          VARCHAR2(8),
  hroll_cutoff_value4          VARCHAR2(8),
  gavg_method_for_rank         VARCHAR2(8),
  sched_seq_grd1               VARCHAR2(8),
  sched_seq_grd2               VARCHAR2(8),
  sched_seq_grd3               VARCHAR2(8),
  sched_seq_grd4               VARCHAR2(8),
  sched_seq_grd5               VARCHAR2(8),
  sched_seq_grd6               VARCHAR2(8),
  sched_seq_grd7               VARCHAR2(8),
  sched_seq_grd8               VARCHAR2(8),
  sched_seq_grd9               VARCHAR2(8),
  sched_seq_grd10              VARCHAR2(8),
  sched_seq_grd11              VARCHAR2(8),
  sched_seq_grd12              VARCHAR2(8),
  use_mini_crs                 VARCHAR2(8),
  per_beg                      VARCHAR2(8),
  per_end                      VARCHAR2(8),
  grd_rpt_end_sem3_cyc1_dt     VARCHAR2(8),
  grd_rpt_end_sem3_cyc2_dt     VARCHAR2(8),
  grd_rpt_end_sem3_cyc3_dt     VARCHAR2(8),
  grd_rpt_end_sem4_cyc1_dt     VARCHAR2(8),
  grd_rpt_end_sem4_cyc2_dt     VARCHAR2(8),
  grd_rpt_end_sem4_cyc3_dt     VARCHAR2(8),
  grd_rpt_end_sem5_cyc1_dt     VARCHAR2(8),
  grd_rpt_end_sem5_cyc2_dt     VARCHAR2(8),
  grd_rpt_end_sem5_cyc3_dt     VARCHAR2(8),
  r10_loaddate                 DATE
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
prompt Creating table CR_INSTR_CYR
prompt ===========================
prompt
create table ROYSECITY.CR_INSTR_CYR
(
  sch_yr                VARCHAR2(4),
  campus_id             VARCHAR2(3),
  instr_id              VARCHAR2(3),
  staff_id              VARCHAR2(9),
  name_l                VARCHAR2(25),
  name_m                VARCHAR2(14),
  name_f                VARCHAR2(17),
  gen_cd                CHAR(1),
  excl_from_peims_rptng CHAR(1),
  dept_nbr              VARCHAR2(3),
  grade_lvl             VARCHAR2(2),
  homeroom              VARCHAR2(4),
  instr_desig_1         CHAR(1),
  instr_desig_2         CHAR(1),
  instr_desig_3         CHAR(1),
  max_classes           VARCHAR2(2),
  max_per               VARCHAR2(2),
  max_preps             VARCHAR2(2),
  max_stu               VARCHAR2(4),
  section               VARCHAR2(2),
  subject_area          CHAR(1),
  reserved_room         VARCHAR2(4),
  max_studyhall         VARCHAR2(2),
  r10_loaddate          DATE
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
create bitmap index ROYSECITY.BMI_CR_INST_CAMPUSID on ROYSECITY.CR_INSTR_CYR (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_CR_INST_INSTRID on ROYSECITY.CR_INSTR_CYR (INSTR_ID)
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
create bitmap index ROYSECITY.BMI_CR_INST_SCH_YR on ROYSECITY.CR_INSTR_CYR (SCH_YR)
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
prompt Creating table CR_MET_CYR
prompt =========================
prompt
create table ROYSECITY.CR_MET_CYR
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem_cd       CHAR(1),
  days_cd      VARCHAR2(2),
  room_nbr     VARCHAR2(4),
  per_begin    VARCHAR2(2),
  per_end      VARCHAR2(2),
  time_begin   VARCHAR2(5),
  time_end     VARCHAR2(5),
  instr_id     VARCHAR2(3),
  lockout_cd   CHAR(1),
  seq_nbr      VARCHAR2(2),
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
create bitmap index ROYSECITY.BMI_CR_MET_CMPID on ROYSECITY.CR_MET_CYR (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_CR_MET_INSTR_ID on ROYSECITY.CR_MET_CYR (INSTR_ID)
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
create bitmap index ROYSECITY.BMI_CR_MET_SCH_YR on ROYSECITY.CR_MET_CYR (SCH_YR)
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
prompt Creating table CR_NUMERIC_AVGNG
prompt ===============================
prompt
create table ROYSECITY.CR_NUMERIC_AVGNG
(
  sch_yr                 VARCHAR2(4),
  campus_id              VARCHAR2(3),
  gavg_crs_typ           CHAR(1),
  gavg_operator          CHAR(1),
  gavg_operator_low_grd  VARCHAR2(3),
  gavg_operator_high_grd VARCHAR2(3),
  gavg_value             NUMBER,
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

prompt
prompt Creating table CR_OTHER_SPECIAL_PGMS
prompt ====================================
prompt
create table ROYSECITY.CR_OTHER_SPECIAL_PGMS
(
  sch_yr           VARCHAR2(4),
  campus_id_enroll VARCHAR2(3),
  other_spec_pgms  VARCHAR2(3),
  r10_loaddate     DATE
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
prompt Creating table CR_PERIOD_PATTERN
prompt ================================
prompt
create table ROYSECITY.CR_PERIOD_PATTERN
(
  sch_yr            VARCHAR2(4),
  campus_id         VARCHAR2(3),
  track_id          CHAR(1),
  period_pattern_cd CHAR(1),
  post_period       VARCHAR2(2),
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

prompt
prompt Creating table CR_PRINCIPAL_COUNSELORS
prompt ======================================
prompt
create table ROYSECITY.CR_PRINCIPAL_COUNSELORS
(
  sch_yr            VARCHAR2(4),
  campus_id         VARCHAR2(3),
  counselor_nbr_stu VARCHAR2(3),
  role_id           VARCHAR2(3),
  staff_id          VARCHAR2(9),
  name_l            VARCHAR2(25),
  name_f            VARCHAR2(17),
  name_m            VARCHAR2(14),
  gen               CHAR(1),
  grd_lvl_cd        VARCHAR2(2),
  name_rng_begin    VARCHAR2(2),
  name_rng_end      VARCHAR2(2),
  phone_area_cd     VARCHAR2(3),
  phone_nbr         VARCHAR2(7),
  phone_ext         VARCHAR2(4),
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

prompt
prompt Creating table CR_RESOURCE_MET
prompt ==============================
prompt
create table ROYSECITY.CR_RESOURCE_MET
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem_cd       CHAR(1),
  days_cd      VARCHAR2(2),
  room_nbr     VARCHAR2(4),
  per_begin    VARCHAR2(2),
  per_end      VARCHAR2(2),
  time_begin   VARCHAR2(5),
  time_end     VARCHAR2(5),
  instr_id     VARCHAR2(3),
  lockout_cd   CHAR(1),
  seq_nbr      VARCHAR2(2),
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
prompt Creating table CR_RESOURCE_OPTIONS
prompt ==================================
prompt
create table ROYSECITY.CR_RESOURCE_OPTIONS
(
  campus_id            VARCHAR2(3),
  assgn_tchr           CHAR(1),
  tchr_by_dept         CHAR(1),
  tchr_by_subj_area    CHAR(1),
  overr_tchr_free_time CHAR(1),
  gen_no_tchr          CHAR(1),
  assgn_room           CHAR(1),
  room_by_dept         CHAR(1),
  room_by_subj_area    CHAR(1),
  overr_room_free_time CHAR(1),
  gen_no_room          CHAR(1),
  cons_tchr_limit      NUMBER(3),
  dt_time_trial        VARCHAR2(27),
  dt_time_accept       VARCHAR2(27),
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
prompt Creating table CR_RESOURCE_SEC_OFFERED
prompt ======================================
prompt
create table ROYSECITY.CR_RESOURCE_SEC_OFFERED
(
  campus_id          VARCHAR2(3),
  crs_nbr            VARCHAR2(4),
  sec_nbr            VARCHAR2(2),
  max_seats          VARCHAR2(3),
  ethn_rstrctn       CHAR(1),
  grd_rstrctn        VARCHAR2(2),
  addl_grd_rstrctn   CHAR(1),
  gender_rstrctn     CHAR(1),
  typ_rstrctn        CHAR(1),
  loc_rstrctn        CHAR(1),
  instruct_set       VARCHAR2(2),
  multi_svc_ind      CHAR(1),
  pop_srvd           VARCHAR2(2),
  role_id            VARCHAR2(3),
  wks_mon            VARCHAR2(2),
  spec_crs_consider  VARCHAR2(2),
  assgnd_stu_wd_sem1 NUMBER(3),
  assgnd_stu_wd_sem2 NUMBER(3),
  assgnd_stu_sem1    NUMBER(3),
  assgnd_stu_sem2    NUMBER(3),
  aar_use_cd         CHAR(1),
  prt_daysmet_sched  CHAR(1),
  coop_voc_ed        CHAR(1),
  crs_seq_cd         CHAR(1),
  mini_cyc           VARCHAR2(2),
  incl_elig_sec      CHAR(1),
  assgnd_stu_wd_sem3 NUMBER(3),
  assgnd_stu_sem3    NUMBER(3),
  assgnd_stu_wd_sem4 NUMBER(3),
  assgnd_stu_sem4    NUMBER(3),
  assgnd_stu_wd_sem5 NUMBER(3),
  assgnd_stu_sem5    NUMBER(3),
  team_cd            VARCHAR2(2),
  crs_typ            CHAR(1),
  dual_credit_ind    CHAR(1),
  distan_lrn_ind     VARCHAR2(2),
  lock_sec           CHAR(1),
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

prompt
prompt Creating table CR_RESOURCE_TIME_PATTERNS
prompt ========================================
prompt
create table ROYSECITY.CR_RESOURCE_TIME_PATTERNS
(
  campus_id    VARCHAR2(3),
  pattern_type CHAR(1),
  pattern      VARCHAR2(6),
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
prompt Creating table CR_ROUTE_ADA
prompt ===========================
prompt
create table ROYSECITY.CR_ROUTE_ADA
(
  sch_yr        VARCHAR2(3),
  campus_id     VARCHAR2(4),
  route_cd      CHAR(1),
  avg_daily_att VARCHAR2(6),
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
prompt Creating table CR_SCHED_ACCEPT_CRS
prompt ==================================
prompt
create table ROYSECITY.CR_SCHED_ACCEPT_CRS
(
  campus_id    VARCHAR2(3),
  grd_lvl      VARCHAR2(2),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  seat_count   NUMBER(3),
  female_count NUMBER(3),
  male_count   NUMBER(3),
  ethn1_count  NUMBER(3),
  ethn2_count  NUMBER(3),
  ethn3_count  NUMBER(3),
  ethn4_count  NUMBER(3),
  ethn5_count  NUMBER(3),
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
prompt Creating table CR_SCHED_CRS
prompt ===========================
prompt
create table ROYSECITY.CR_SCHED_CRS
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  max_seats    NUMBER(3),
  seat_count   NUMBER(3),
  female_count NUMBER(3),
  male_count   NUMBER(3),
  ethn1_count  NUMBER(3),
  ethn2_count  NUMBER(3),
  ethn3_count  NUMBER(3),
  ethn4_count  NUMBER(3),
  ethn5_count  NUMBER(3),
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
prompt Creating table CR_SCHED_INFO
prompt ============================
prompt
create table ROYSECITY.CR_SCHED_INFO
(
  campus_id                VARCHAR2(3),
  nbr_sem_sched            CHAR(1),
  normal_per_ctrl          VARCHAR2(2),
  auto_drop_stdy_flg       CHAR(1),
  incl_wd_stu              CHAR(1),
  sched_pregrid_seq        CHAR(1),
  sched_potential_drop_seq CHAR(1),
  sched_stu_request_seq    CHAR(1),
  sched_trial_sched_seq    CHAR(1),
  grd_low                  VARCHAR2(2),
  grd_high                 VARCHAR2(2),
  sched_sched_seq          CHAR(1),
  load_dt                  VARCHAR2(8),
  per_begin                VARCHAR2(2),
  per_end                  VARCHAR2(2),
  ethn_majority            CHAR(1),
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

prompt
prompt Creating table CR_SCHED_OPTIONS
prompt ===============================
prompt
create table ROYSECITY.CR_SCHED_OPTIONS
(
  campus_id       VARCHAR2(3),
  crs_bal_ethn    CHAR(1),
  crs_bal_sex     CHAR(1),
  seat_bal_intens CHAR(1),
  lift_restr_sex  CHAR(1),
  lift_restr_team CHAR(1),
  lift_restr_grd  CHAR(1),
  keep_part_sched CHAR(1),
  seat_load_fctr  NUMBER(3),
  sched_altern    CHAR(1),
  dt_time_trial   VARCHAR2(27),
  grd_lvls_trial  VARCHAR2(45),
  dt_time_accept  VARCHAR2(27),
  grd_lvls_accept VARCHAR2(45),
  excl_preassign  CHAR(1),
  crs_fill        VARCHAR2(4),
  proxy_match_sec CHAR(1),
  replace_elec    CHAR(1),
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
prompt Creating table CR_SCHED_SEQ
prompt ===========================
prompt
create table ROYSECITY.CR_SCHED_SEQ
(
  campus_id    VARCHAR2(3),
  sched_seq    VARCHAR2(2),
  grd_lvl      VARCHAR2(2),
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
prompt Creating table CR_SEC_GRDEBK
prompt ============================
prompt
create table ROYSECITY.CR_SEC_GRDEBK
(
  campus_id      VARCHAR2(3),
  crs_nbr        VARCHAR2(4),
  sec_nbr        VARCHAR2(2),
  wgt_typ        CHAR(1),
  ipr_ready      CHAR(1),
  grd_ready_cyc1 CHAR(1),
  grd_ready_cyc2 CHAR(1),
  grd_ready_cyc3 CHAR(1),
  grd_ready_cyc4 CHAR(1),
  grd_ready_cyc5 CHAR(1),
  grd_ready_cyc6 CHAR(1),
  grd_typ        CHAR(1),
  notes          VARCHAR2(3270),
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
prompt Creating table CR_SEC_OFFERED_CYR
prompt =================================
prompt
create table ROYSECITY.CR_SEC_OFFERED_CYR
(
  sch_yr            CHAR(4),
  campus_id         CHAR(3),
  crs_nbr           CHAR(4),
  sec_nbr           CHAR(2),
  max_seats         CHAR(3),
  ethn_rstrctn      CHAR(1),
  grd_rstrctn       CHAR(2),
  addl_grd_rstrctn  CHAR(1),
  gender_rstrctn    CHAR(1),
  typ_rstrctn       CHAR(1),
  loc_rstrctn       CHAR(1),
  instruct_set      CHAR(2),
  multi_svc_ind     CHAR(1),
  pop_srvd          CHAR(2),
  role_id           CHAR(3),
  wks_mon           CHAR(2),
  spec_crs_consider CHAR(2),
  aar_use_cd        CHAR(1),
  prt_daysmet_sched CHAR(1),
  coop_voc_ed       CHAR(1),
  crs_seq_cd        CHAR(1),
  mini_cyc          CHAR(2),
  incl_elig_sec     CHAR(1),
  team_code         CHAR(2),
  crs_typ           CHAR(1),
  dual_credit_ind   CHAR(1),
  distan_lrn_ind    CHAR(2),
  lock_sec          CHAR(1),
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
create bitmap index ROYSECITY.BMI_CR_SEC_OFF_CMPID on ROYSECITY.CR_SEC_OFFERED_CYR (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_CR_SEC_OFF_CRSNBR on ROYSECITY.CR_SEC_OFFERED_CYR (CRS_NBR)
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
create bitmap index ROYSECITY.BMI_CR_SEC_OFF_SCH_YR on ROYSECITY.CR_SEC_OFFERED_CYR (SCH_YR)
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
create bitmap index ROYSECITY.BMI_CR_SEC_OFF_SECNBR on ROYSECITY.CR_SEC_OFFERED_CYR (SEC_NBR)
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
prompt Creating table DR_CATEG
prompt =======================
prompt
create table ROYSECITY.DR_CATEG
(
  typ          NUMBER,
  descr        VARCHAR2(25),
  pct_wgt      NUMBER(3),
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
prompt Creating table DR_CRS_OFFERED_CYR
prompt =================================
prompt
create table ROYSECITY.DR_CRS_OFFERED_CYR
(
  sch_yr              CHAR(4),
  crs_nbr             CHAR(4),
  title               CHAR(15),
  gavg_table          CHAR(1),
  dept_use            CHAR(3),
  aar_use_cd          CHAR(1),
  allow_credit_basic  CHAR(1),
  allow_credit_honors CHAR(1),
  auto_grd            CHAR(3),
  core_crs_cd         CHAR(1),
  gavg_wgt            CHAR(1),
  partial_credit_cd   CHAR(1),
  hroll_cd            CHAR(1),
  la_wgt_cd           CHAR(2),
  hroll_wgt           CHAR(1),
  nbr_credits         CHAR(2),
  nbr_of_sem          CHAR(1),
  credit_seq_cd       CHAR(1),
  role_id             CHAR(3),
  per_ctrl            NUMBER(2),
  prt_crs_info_flg    CHAR(1),
  priority_cd_crs     CHAR(1),
  gender_rstrctn      CHAR(1),
  spec_crs_consider   CHAR(2),
  svc_id              CHAR(8),
  voc_ed_credit_amt   CHAR(1),
  instruct_set_cd     CHAR(2),
  pop_srvd            CHAR(2),
  credit_lvl          CHAR(1),
  coop_voc_cd         CHAR(1),
  mini_crs_nbr_cyc    CHAR(1),
  incl_elig_crs       CHAR(1),
  prt_on_elem_labels  CHAR(1),
  seq_cd              CHAR(1),
  hroll_table         CHAR(1),
  graded_crs_cd       CHAR(1),
  textbook_isbn       CHAR(10),
  exam_sem_pattern    CHAR(1),
  abbrev_name         CHAR(8),
  self_paced          CHAR(1),
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
create bitmap index ROYSECITY.BMI_CR_CRS_CRSNBR on ROYSECITY.DR_CRS_OFFERED_CYR (CRS_NBR)
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
create bitmap index ROYSECITY.BMI_DR_CRS_SHL_YR on ROYSECITY.DR_CRS_OFFERED_CYR (SCH_YR)
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
prompt Creating table DR_CURRICULUM_CYR
prompt ================================
prompt
create table ROYSECITY.DR_CURRICULUM_CYR
(
  sch_yr           VARCHAR2(4),
  dist_id          VARCHAR2(6),
  sched_sem_cd_nbr CHAR(1),
  crs_nbr_length   CHAR(1),
  r10_loaddate     DATE
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
prompt Creating table DR_DEMO
prompt ======================
prompt
create table ROYSECITY.DR_DEMO
(
  sch_yr                    VARCHAR2(4),
  dist_id                   VARCHAR2(6),
  dist_name                 VARCHAR2(34),
  region_nbr                VARCHAR2(2),
  str_nbr_dist              VARCHAR2(9),
  str_name_dist             VARCHAR2(19),
  city_name_dist            VARCHAR2(17),
  state_cd                  VARCHAR2(2),
  zip_dist                  VARCHAR2(5),
  zip4_dist                 VARCHAR2(4),
  str_dir_edit              CHAR(1),
  area_cd_dist              VARCHAR2(3),
  phone_nbr_dist            VARCHAR2(7),
  superdt_name_l            VARCHAR2(25),
  superdt_name_f            VARCHAR2(17),
  superdt_name_m            VARCHAR2(14),
  title                     VARCHAR2(5),
  gen_superdt               CHAR(1),
  f_aval_state_id           VARCHAR2(9),
  lst_aval_state_id         VARCHAR2(9),
  nxt_aval_state_id         VARCHAR2(9),
  coop_fscl_agent_dist      VARCHAR2(6),
  coop_name                 VARCHAR2(30),
  reg_day_sch_deaf_dist     VARCHAR2(6),
  assign_id_nbrs            CHAR(1),
  nxt_aval_stu_id           VARCHAR2(6),
  opt_ect_undel_order       CHAR(1),
  auto_spec_pgms_wd         CHAR(1),
  auto_state_id_assign      CHAR(1),
  crs_add_drop_opt          CHAR(1),
  spec_pgm_wd_rsn           VARCHAR2(2),
  maintain_rec_stat_opt     CHAR(1),
  act_fnd_org_zero_opt      CHAR(1),
  act_fnd_org_nonzero_opt   CHAR(1),
  act_fnd_restr_opt         CHAR(1),
  saisd_auto_add_gl_opt     CHAR(1),
  bastrop_add_clrng_fnd     CHAR(1),
  food_svc_dir              VARCHAR2(25),
  food_svc_dir_title        VARCHAR2(45),
  hist_grd_avg_opt          CHAR(1),
  default_home_lang_cd      VARCHAR2(2),
  req_par_perm              CHAR(1),
  display_se_on_sds_screen  CHAR(1),
  use_flaps_update_nslp     CHAR(1),
  recs_req_src              CHAR(1),
  low_grd_lvl_for_trkng     VARCHAR2(2),
  flaps_use_addr_opt        CHAR(1),
  preprint_wd_form          CHAR(1),
  universal_discipline_updt CHAR(1),
  fax_phone                 VARCHAR2(7),
  fax_area_cd               VARCHAR2(3),
  campus_wd_rsn             CHAR(1),
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

prompt
prompt Creating table DR_GRADEBK_OPT
prompt =============================
prompt
create table ROYSECITY.DR_GRADEBK_OPT
(
  dist_id           VARCHAR2(6),
  gradebk_use_flg   CHAR(1),
  nbr_days_chg_pswd NUMBER(3),
  gradebk_msg       VARCHAR2(3270),
  url_photos        VARCHAR2(256),
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

prompt
prompt Creating table DR_GRADEBOOK
prompt ===========================
prompt
create table ROYSECITY.DR_GRADEBOOK
(
  sch_yr        VARCHAR2(4),
  dist_id       VARCHAR2(6),
  dt_time_stamp VARCHAR2(27),
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
prompt Creating table DR_OTHR_SPEC_PGMS
prompt ================================
prompt
create table ROYSECITY.DR_OTHR_SPEC_PGMS
(
  sch_yr              CHAR(4),
  other_spec_pgms     VARCHAR2(3),
  other_spec_pgm_desc VARCHAR2(40),
  auto_entry_wd_cd    CHAR(1),
  perform_att_edit    CHAR(1),
  move_to_grade_opt   CHAR(1),
  active_hist_opt     CHAR(1),
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

prompt
prompt Creating table DR_SUBSIDIARY_CAMPUS_TABLE
prompt =========================================
prompt
create table ROYSECITY.DR_SUBSIDIARY_CAMPUS_TABLE
(
  sch_yr               VARCHAR2(4),
  campus_id_subsidiary VARCHAR2(3),
  campus_id_primary    VARCHAR2(3),
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
prompt Creating table ERP_QGT97_GENERIC_TABLE
prompt ======================================
prompt
create table ROYSECITY.ERP_QGT97_GENERIC_TABLE
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
create bitmap index ROYSECITY.BMI_ERP_QGT97_SRC_ID on ROYSECITY.ERP_QGT97_GENERIC_TABLE (QGT97_SRC_ID)
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
create bitmap index ROYSECITY.BMI_ERP_QGT97_TABLE_NAME on ROYSECITY.ERP_QGT97_GENERIC_TABLE (QGT97_TABLE_NAME)
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
create table ROYSECITY.ERP_SYS_CTD
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
create bitmap index ROYSECITY.BMI_ERP_SYS_CTD_CODE_ID on ROYSECITY.ERP_SYS_CTD (CODE_ID)
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
create bitmap index ROYSECITY.BMI_ERP_SYS_CTD_TABLE_ID on ROYSECITY.ERP_SYS_CTD (TABLE_ID)
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
create table ROYSECITY.ERP_SYS_CTM
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
create bitmap index ROYSECITY.BMI_ERP_SYS_CTM_TABLE_ID on ROYSECITY.ERP_SYS_CTM (TABLE_ID)
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
prompt Creating table ET_C012_GEN
prompt ==========================
prompt
create table ROYSECITY.ET_C012_GEN
(
  sch_yr       VARCHAR2(4),
  gen_cd       CHAR(1),
  gen_descr    VARCHAR2(7),
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
prompt Creating table ET_C013_SEX
prompt ==========================
prompt
create table ROYSECITY.ET_C013_SEX
(
  sch_yr       VARCHAR2(4),
  sex_cd       CHAR(1),
  sex_descr    VARCHAR2(7),
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
prompt Creating table ET_C014_ETHN
prompt ===========================
prompt
create table ROYSECITY.ET_C014_ETHN
(
  sch_yr       VARCHAR2(4),
  ethn_cd      CHAR(1),
  ethn_descr   VARCHAR2(20),
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
prompt Creating table ET_C020_MULTISVC
prompt ===============================
prompt
create table ROYSECITY.ET_C020_MULTISVC
(
  sch_yr         VARCHAR2(4),
  multisvc_cd    CHAR(1),
  multisvc_descr VARCHAR2(40),
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
prompt Creating table ET_C022_SVC_ID
prompt =============================
prompt
create table ROYSECITY.ET_C022_SVC_ID
(
  sch_yr       VARCHAR2(4),
  svcid_cd     VARCHAR2(8),
  svcid_typ    VARCHAR2(4),
  svcid_descr  VARCHAR2(10),
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
prompt Creating table ET_C025_PERMITSUBJ
prompt =================================
prompt
create table ROYSECITY.ET_C025_PERMITSUBJ
(
  permitsubj_cd    VARCHAR2(2),
  permitsubj_descr VARCHAR2(40),
  r10_loaddate     DATE
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
prompt Creating table ET_C026_PERMITGRD
prompt ================================
prompt
create table ROYSECITY.ET_C026_PERMITGRD
(
  permitgrd_cd    VARCHAR2(2),
  permitgrd_descr VARCHAR2(15),
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
prompt Creating table ET_C027_DAYSWEEK
prompt ===============================
prompt
create table ROYSECITY.ET_C027_DAYSWEEK
(
  sch_yr         VARCHAR2(4),
  daysweek_cd    VARCHAR2(2),
  daysweek_descr VARCHAR2(6),
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
prompt Creating table ET_C030_POPSRVD
prompt ==============================
prompt
create table ROYSECITY.ET_C030_POPSRVD
(
  sch_yr        VARCHAR2(4),
  popsrvd_cd    VARCHAR2(2),
  popsrvd_descr VARCHAR2(21),
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
prompt Creating table ET_C035_INSTRUCTSET
prompt ==================================
prompt
create table ROYSECITY.ET_C035_INSTRUCTSET
(
  sch_yr            VARCHAR2(4),
  instructset_cd    VARCHAR2(2),
  instructset_descr VARCHAR2(40),
  instructset_hrs   NUMBER(5,3),
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

prompt
prompt Creating table ET_C039_WKSMON
prompt =============================
prompt
create table ROYSECITY.ET_C039_WKSMON
(
  sch_yr       VARCHAR2(4),
  wksmon_cd    VARCHAR2(2),
  wksmon_descr VARCHAR2(20),
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
prompt Creating table ET_C050_GRDLVL
prompt =============================
prompt
create table ROYSECITY.ET_C050_GRDLVL
(
  sch_yr       VARCHAR2(4),
  grdlvl_cd    VARCHAR2(2),
  grdlvl_descr VARCHAR2(15),
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
prompt Creating table ET_C053_HANDICAP
prompt ===============================
prompt
create table ROYSECITY.ET_C053_HANDICAP
(
  sch_yr       VARCHAR2(4),
  handi_cd     VARCHAR2(2),
  handi_descr  VARCHAR2(40),
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
prompt Creating table ET_C054_ECONDISADV
prompt =================================
prompt
create table ROYSECITY.ET_C054_ECONDISADV
(
  sch_yr           VARCHAR2(4),
  econdisadv_cd    VARCHAR2(2),
  econdisadv_descr VARCHAR2(40),
  r10_loaddate     DATE
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
prompt Creating table ET_C059_ADAELIG
prompt ==============================
prompt
create table ROYSECITY.ET_C059_ADAELIG
(
  sch_yr        VARCHAR2(4),
  adaelig_cd    CHAR(1),
  adaelig_descr VARCHAR2(40),
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
prompt Creating table ET_C061_LEP
prompt ==========================
prompt
create table ROYSECITY.ET_C061_LEP
(
  sch_yr       VARCHAR2(4),
  lep_cd       CHAR(1),
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
prompt Creating table ET_C062_GRADTYP
prompt ==============================
prompt
create table ROYSECITY.ET_C062_GRADTYP
(
  sch_yr           VARCHAR2(4),
  gradtyp_cd       VARCHAR2(2),
  gradtyp_descr    VARCHAR2(40),
  gradtyp_aar_type VARCHAR2(15),
  r10_loaddate     DATE
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
prompt Creating table ET_C064_SGLPARPREG
prompt =================================
prompt
create table ROYSECITY.ET_C064_SGLPARPREG
(
  sch_yr           VARCHAR2(4),
  sglparpreg_cd    CHAR(1),
  sglparpreg_descr VARCHAR2(40),
  r10_loaddate     DATE
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
prompt Creating table ET_C066_CHILDCNTFUNDING
prompt ======================================
prompt
create table ROYSECITY.ET_C066_CHILDCNTFUNDING
(
  sch_yr                VARCHAR2(4),
  childcntfunding_cd    CHAR(1),
  childcntfunding_descr VARCHAR2(40),
  r10_loaddate          DATE
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
prompt Creating table ET_C088_PARTICIND
prompt ================================
prompt
create table ROYSECITY.ET_C088_PARTICIND
(
  sch_yr          VARCHAR2(4),
  particind_cd    CHAR(1),
  particind_descr VARCHAR2(40),
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
prompt Creating table ET_C092_HOMELANG
prompt ===============================
prompt
create table ROYSECITY.ET_C092_HOMELANG
(
  sch_yr         VARCHAR2(4),
  homelang_cd    VARCHAR2(2),
  homelang_descr VARCHAR2(30),
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
prompt Creating table ET_C122_ELIGPARTIC
prompt =================================
prompt
create table ROYSECITY.ET_C122_ELIGPARTIC
(
  sch_yr           VARCHAR2(4),
  eligpartic_cd    CHAR(1),
  eligpartic_descr VARCHAR2(50),
  r10_loaddate     DATE
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
prompt Creating table ET_C130_RPTNGPER
prompt ===============================
prompt
create table ROYSECITY.ET_C130_RPTNGPER
(
  sch_yr         VARCHAR2(4),
  rptngper_cd    CHAR(1),
  rptngper_descr VARCHAR2(35),
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
prompt Creating table ET_C131_YRENDSTATUS
prompt ==================================
prompt
create table ROYSECITY.ET_C131_YRENDSTATUS
(
  sch_yr            VARCHAR2(4),
  yrend_status      VARCHAR2(2),
  yrendstatus_descr VARCHAR2(35),
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

prompt
prompt Creating table ET_C135_CRSSEQ
prompt =============================
prompt
create table ROYSECITY.ET_C135_CRSSEQ
(
  sch_yr       VARCHAR2(4),
  crsseq_cd    CHAR(1),
  crsseq_descr VARCHAR2(35),
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
prompt Creating table ET_C141_INSTRK
prompt =============================
prompt
create table ROYSECITY.ET_C141_INSTRK
(
  sch_yr           VARCHAR2(4),
  instructrk_ind   CHAR(1),
  instructrk_descr VARCHAR2(35),
  r10_loaddate     DATE
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
prompt Creating table ET_C142_CATE
prompt ===========================
prompt
create table ROYSECITY.ET_C142_CATE
(
  sch_yr       VARCHAR2(4),
  cate_ind     CHAR(1),
  cate_descr   VARCHAR2(35),
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
prompt Creating table ET_C162_LEAVER_REASONS
prompt =====================================
prompt
create table ROYSECITY.ET_C162_LEAVER_REASONS
(
  sch_yr        VARCHAR2(4),
  leaver_rsn_cd VARCHAR2(2),
  leaver_rsn    VARCHAR2(40),
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
prompt Creating table ET_C163_AS_OF_STATUS_CODES
prompt =========================================
prompt
create table ROYSECITY.ET_C163_AS_OF_STATUS_CODES
(
  sch_yr          VARCHAR2(4),
  as_of_status_cd CHAR(1),
  as_of_status    VARCHAR2(40),
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
prompt Creating table ET_C164_DISCPLN_ACTNS
prompt ====================================
prompt
create table ROYSECITY.ET_C164_DISCPLN_ACTNS
(
  sch_yr          VARCHAR2(4),
  discpln_actn_cd VARCHAR2(2),
  discpln_actn    VARCHAR2(40),
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
prompt Creating table ET_C165_DISCPLN_ACTN_RSNS
prompt ========================================
prompt
create table ROYSECITY.ET_C165_DISCPLN_ACTN_RSNS
(
  sch_yr              VARCHAR2(4),
  discpln_actn_rsn_cd VARCHAR2(2),
  discpln_actn_rsn    VARCHAR2(40),
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

prompt
prompt Creating table ET_C166_DISCPLN_LEN_DIFF_RSN
prompt ===========================================
prompt
create table ROYSECITY.ET_C166_DISCPLN_LEN_DIFF_RSN
(
  sch_yr                  VARCHAR2(4),
  discpln_len_diff_rsn_cd VARCHAR2(2),
  discpln_len_diff_rsn    VARCHAR2(40),
  r10_loaddate            DATE
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
prompt Creating table ET_C167_DISTANCE_LRN_IND
prompt =======================================
prompt
create table ROYSECITY.ET_C167_DISTANCE_LRN_IND
(
  sch_yr             VARCHAR2(4),
  distance_lrn_ind   VARCHAR2(2),
  distance_lrn_descr VARCHAR2(40),
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

prompt
prompt Creating table ET_C175_BIL_PGM_TYP
prompt ==================================
prompt
create table ROYSECITY.ET_C175_BIL_PGM_TYP
(
  sch_yr            VARCHAR2(4),
  bil_pgm_typ_cd    CHAR(1),
  bil_pgm_typ_descr VARCHAR2(40),
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

prompt
prompt Creating table ET_C176_ESL_PGM_TYP
prompt ==================================
prompt
create table ROYSECITY.ET_C176_ESL_PGM_TYP
(
  sch_yr            VARCHAR2(4),
  esl_pgm_typ_cd    CHAR(1),
  esl_pgm_typ_descr VARCHAR2(40),
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

prompt
prompt Creating table ET_X088_COLLEGE_ENTRY
prompt ====================================
prompt
create table ROYSECITY.ET_X088_COLLEGE_ENTRY
(
  sch_yr       VARCHAR2(4),
  entry_cd     CHAR(1),
  entry_desc   VARCHAR2(40),
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
prompt Creating table FFAMAD_ACCT_DESCS
prompt ================================
prompt
create table ROYSECITY.FFAMAD_ACCT_DESCS
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
create table ROYSECITY.FFAMAM_ACCT_MST
(
  ffamam_acct_id      NUMBER(11),
  ffamam_edited_acct  VARCHAR2(80),
  ffamg1_code         VARCHAR2(8),
  ffamam_acct_dim     VARCHAR2(240),
  ffamam_active_flag  CHAR(1),
  ffamsa_code         VARCHAR2(16),
  ffamam_sum_enc_code VARCHAR2(16),
  ffamg2_code         VARCHAR2(8),
  ffamg3_code         VARCHAR2(8),
  ffamgc_code         VARCHAR2(16),
  ffamam_acct_string  VARCHAR2(80),
  ffamam_deleted      CHAR(1),
  ffamam_on_ann_bud   VARCHAR2(2),
  ffamam_date_created VARCHAR2(10),
  ffamam_quick_key    VARCHAR2(24),
  ffamam_line         VARCHAR2(30),
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
create unique index ROYSECITY.XAK2_FFAMAM_STRING on ROYSECITY.FFAMAM_ACCT_MST (FFAMAM_ACCT_STRING)
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
create unique index ROYSECITY.XPK_FFAMAM on ROYSECITY.FFAMAM_ACCT_MST (FFAMAM_ACCT_ID)
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
prompt Creating table FFAMDH_HISTORY
prompt =============================
prompt
create table ROYSECITY.FFAMDH_HISTORY
(
  ffamdh_id                NUMBER(11),
  ffamdh_ref1              VARCHAR2(90),
  ffamdh_ref2              VARCHAR2(90),
  ffamam_acct_id           NUMBER(11),
  ffamdh_amount            NUMBER,
  name_id                  NUMBER(11),
  ffambt_code              VARCHAR2(16),
  ffamdh_desc1             VARCHAR2(4000),
  ffamdh_desc2             VARCHAR2(4000),
  ffamgd_line_nbr          NUMBER(11),
  ffamdh_source            VARCHAR2(12),
  ffamdh_batch             VARCHAR2(16),
  ffamdh_upd_date          VARCHAR2(10),
  ffamdh_amt_credit        NUMBER,
  ffamdh_amt_debit         NUMBER,
  ffamdh_sub_source        VARCHAR2(12),
  ffamdh_upd_time          NUMBER(11),
  ffamud_id                NUMBER(11),
  ffamdh_tran_date         VARCHAR2(10),
  ffamdh_create_date       VARCHAR2(10),
  ffamdh_create_time       NUMBER(11),
  ffamdh_create_by         NUMBER(11),
  ffamdh_cash_ffapbr_id    NUMBER(11),
  ffamdh_stmt_ffapbr_id    NUMBER(11),
  ffamdh_equity_id         NUMBER(11),
  ffamdh_cash_id           NUMBER(11),
  ffamdh_accrual_id        NUMBER(11),
  ffamdh_accr_rev_id       NUMBER(11),
  ffamdh_po_enc_reserve_id NUMBER(11),
  ffamdh_po_enc_offset_id  NUMBER(11),
  r10_loaddate             DATE
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
create unique index ROYSECITY.XAK1_FFAMDH_DATE on ROYSECITY.FFAMDH_HISTORY (FFAMAM_ACCT_ID, FFAMDH_UPD_DATE, FFAMDH_UPD_TIME, FFAMDH_ID)
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
create unique index ROYSECITY.XPK_FFAMDH on ROYSECITY.FFAMDH_HISTORY (FFAMDH_ID)
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
prompt Creating table FFAMFA_FIS_YTD
prompt =============================
prompt
create table ROYSECITY.FFAMFA_FIS_YTD
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
create bitmap index ROYSECITY.BMI_FFAMFA_FIS_YTD_ACCT_ID on ROYSECITY.FFAMFA_FIS_YTD (FFAMAM_ACCT_ID)
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
create table ROYSECITY.FFAMMA_MONTH_ACT
(
  ffamam_acct_id         NUMBER(11),
  ffamma_cal_year        NUMBER(11),
  ffamma_month           NUMBER(11),
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
create unique index ROYSECITY.XPK_FFAMMA on ROYSECITY.FFAMMA_MONTH_ACT (FFAMAM_ACCT_ID, FFAMMA_CAL_YEAR, FFAMMA_MONTH)
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
prompt Creating table FTX_EMP_DEMOGRAPHIC
prompt ==================================
prompt
create table ROYSECITY.FTX_EMP_DEMOGRAPHIC
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
create unique index ROYSECITY.XPK_FTX_EMP_DEMOGRAPHIC on ROYSECITY.FTX_EMP_DEMOGRAPHIC (NAME_ID, FIS_YEAR)
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
prompt Creating table HAABLD_BLD_CODES
prompt ===============================
prompt
create table ROYSECITY.HAABLD_BLD_CODES
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
create unique index ROYSECITY.XPK_HAABLD on ROYSECITY.HAABLD_BLD_CODES (HAABLD_BLD_CODE)
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
create table ROYSECITY.HAADSC_DESCS
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
create unique index ROYSECITY.XPK_HAADSC on ROYSECITY.HAADSC_DESCS (HAADSC_ID)
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
create table ROYSECITY.HAAPRO_PROFILE
(
  haapro_ret_class_mi          VARCHAR2(8),
  hpadcx_pera_exclsn_code      NUMBER(11),
  haapro_ret_emp_type_sd       VARCHAR2(4),
  haapro_ret_cls_idaho         VARCHAR2(4),
  haapro_ret_type_mm           VARCHAR2(2),
  haapro_ret_assoc_mm          VARCHAR2(2),
  haapro_ret_cat               VARCHAR2(4),
  haapro_uniq_code_mm          VARCHAR2(4),
  haapro_ret_nbr               VARCHAR2(18),
  haapro_ret_yn                CHAR(1),
  haapro_tax_sts_st            VARCHAR2(2),
  haapro_tax_sts_fed           VARCHAR2(2),
  haabld_bld_code              VARCHAR2(10),
  haaety_emp_type_code         VARCHAR2(10),
  hpadcl_chk_loc_code          VARCHAR2(10),
  haapro_faculty               CHAR(1),
  aastc_state_abbrev           VARCHAR2(4),
  haapro_dep_add               NUMBER(11),
  haapro_dep_st                NUMBER(11),
  haapro_dep_fed               NUMBER(11),
  haapro_dep_act               NUMBER(11),
  name_id                      NUMBER(11),
  haapro_hire_dte              VARCHAR2(10),
  haapro_start_dte             VARCHAR2(10),
  haapro_term_dte              VARCHAR2(10),
  haapro_active                CHAR(1),
  hpeter_term_code             VARCHAR2(10),
  haapro_i9_date               VARCHAR2(10),
  nalphakey                    VARCHAR2(22),
  haapro_ref_type              VARCHAR2(2),
  haapro_ret_active            VARCHAR2(2),
  haapro_ret_cat2              VARCHAR2(4),
  haapro_maiden_name           VARCHAR2(40),
  haapro_spouse_name           VARCHAR2(60),
  haapro_ret_pay_rate_mi       NUMBER,
  haaplc_code                  VARCHAR2(10),
  tecs_trs_member              VARCHAR2(16),
  haapro_loc_tax_cod_1         VARCHAR2(10),
  haapro_loc_tax_exempts_per_1 NUMBER(11),
  haapro_loc_tax_exempts_dep_1 NUMBER(11),
  haapro_loc_tax_cod_2         VARCHAR2(10),
  haapro_loc_tax_res_2_x       CHAR(1),
  haapro_loc_tax_res_1_x       CHAR(1),
  haapro_loc_tax_exempts_per_2 NUMBER(11),
  haapro_loc_tax_exempts_dep_2 NUMBER(11),
  haapro_exmpts_per            NUMBER(11),
  haapro_exmpts_dep            NUMBER(11),
  haadsc_id_hr_type            NUMBER(11),
  haapro_flx_eta_nbr           NUMBER(11),
  haapro_pct_of_yr             NUMBER,
  haapro_hrt_id                NUMBER(11),
  haapro_ret_emplymnt_typ_il   VARCHAR2(2),
  haapro_seq_nbr               NUMBER(11),
  qqqblb_id                    NUMBER(11),
  haapro_hire_time             NUMBER(11),
  haapro_tax_sts_eic           VARCHAR2(16),
  haapro_uc_tax_state          VARCHAR2(16),
  haapro_haacam_id             NUMBER(11),
  haapro_tx_er10_part_cod      VARCHAR2(22),
  haapro_tx_mem_id_typ         VARCHAR2(16),
  haapro_tx_trs_alt_id         VARCHAR2(18),
  haapro_us_citizen_x          CHAR(1),
  haapro_tx_yrrnd_tch_x        CHAR(1),
  haapro_prt_deposit_x         CHAR(1),
  haapro_other_id              VARCHAR2(24),
  haapro_yrs_exp1              NUMBER,
  haapro_yrs_exp2              NUMBER,
  haapro_yrs_exp3              NUMBER,
  haapro_yrs_exp4              NUMBER,
  haapro_yrs_exp5              NUMBER,
  haapro_conf_tax_info         CHAR(1),
  haapro_conf_spouse_name      CHAR(1),
  haapro_conf_former_name      CHAR(1),
  haapro_retired               VARCHAR2(16),
  haapro_retired_dte           VARCHAR2(10),
  haapro_init_cert_year        NUMBER(11),
  haapro_eligibility_date      VARCHAR2(10),
  haapro_tasb_lock_x           CHAR(1),
  haapro_gen_asp_id            NUMBER(11),
  haapro_yrs_exp6              NUMBER,
  haapro_yrs_exp7              NUMBER,
  haapro_yrs_exp8              NUMBER,
  haapro_yrs_exp9              NUMBER,
  haapro_yrs_exp10             NUMBER,
  haapro_rehire_flag           VARCHAR2(16),
  haapro_rehire_date           VARCHAR2(10),
  haapro_retire                VARCHAR2(16),
  haapro_w2_consent_x          CHAR(1),
  haapro_rep_hire_date         VARCHAR2(10),
  haapro_rep_pic               NUMBER(11),
  hwptrt_status                VARCHAR2(16),
  hwptrt_duration              VARCHAR2(16),
  hwptrt_return_time           VARCHAR2(16),
  hwptrt_summary               VARCHAR2(16),
  hwptrt_customer              VARCHAR2(16),
  hwptrt_start_time            NUMBER(11),
  hwptrt_stop_time             NUMBER(11),
  hwptrt_date                  VARCHAR2(10),
  hwptrt_misc_char_1           VARCHAR2(16),
  hwptrt_misc_char_2           VARCHAR2(16),
  hwptrt_misc_char_3           VARCHAR2(16),
  hwptrt_misc_int_1            NUMBER(11),
  hwptrt_misc_int_2            NUMBER(11),
  hwptrt_misc_date_1           VARCHAR2(10),
  hwptrt_misc_date_2           VARCHAR2(10),
  haapro_char_1                VARCHAR2(16),
  haapro_char_2                VARCHAR2(16),
  haapro_char_3                VARCHAR2(16),
  haapro_char_4                VARCHAR2(16),
  haapro_char_5                VARCHAR2(16),
  haapro_w2_delivery_addr      VARCHAR2(33),
  haapro_w2_location_addr      VARCHAR2(50),
  haapro_trs_term_date         VARCHAR2(10),
  haapro_prt_chk_curr_ind      VARCHAR2(16),
  haapro_eeoc_type             VARCHAR2(16),
  haapro_eeoc_code             VARCHAR2(16),
  haapro_w2_addr_zip_plus4     VARCHAR2(16),
  haapro_w2_addr_zip           VARCHAR2(30),
  haapro_w2_addr_st            VARCHAR2(46),
  haapro_ret_serv_credit_tn    NUMBER(17),
  haapro_ret_fte_nm            NUMBER(17),
  haapro_ret_job_class_nm      VARCHAR2(16),
  haapro_ret_job_cat_nm        VARCHAR2(16),
  haapro_ret_typ_tn            NUMBER(10),
  haapro_ret_dept_tn           NUMBER(10),
  exempt_pr_law                VARCHAR2(1),
  haapro_pos_start_dte         VARCHAR2(10),
  haapro_yrs_exp15             NUMBER(24),
  haapro_yrs_exp14             NUMBER(24),
  haapro_yrs_exp13             NUMBER(24),
  haapro_yrs_exp12             NUMBER(24),
  haapro_yrs_exp11             NUMBER(24),
  haapro_fl_fish_nbr           VARCHAR2(16),
  haapro_status                VARCHAR2(30),
  haapro_hold_time_sheet_x     VARCHAR2(1),
  haapro_ret_dept              VARCHAR2(24),
  haapro_ret_term_dte          VARCHAR2(10),
  haapro_ret_position          VARCHAR2(20),
  haapro_ret_class             VARCHAR2(10),
  haapro_ret_educ_emp_x        VARCHAR2(1),
  haapro_ret_plan              VARCHAR2(4),
  haapro_non_res_alien_x       VARCHAR2(1),
  haapro_officer_py_x          VARCHAR2(1),
  haapro_officer_cy_x          VARCHAR2(1),
  haapro_doe_emp_type          VARCHAR2(30),
  haapro_employment_length     NUMBER(10),
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
  sif_haapro_ref_id            VARCHAR2(32),
  haapro_conf_term_reason_x    VARCHAR2(1),
  haapro_conf_eeoc_x           VARCHAR2(1),
  haapro_ret_end_dte           VARCHAR2(10),
  haapro_ret_withdrawn_cntrb_x VARCHAR2(1),
  haapro_ret_reason_code       VARCHAR2(16),
  haapro_unpaid_days_off       NUMBER(19),
  haapro_actual_days_worked    NUMBER(19),
  r10_loaddate                 DATE
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
create unique index ROYSECITY.XPK_HAAPRO on ROYSECITY.HAAPRO_PROFILE (NAME_ID)
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
prompt Creating table HPMCED_CERT_DTL
prompt ==============================
prompt
create table ROYSECITY.HPMCED_CERT_DTL
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
create unique index ROYSECITY.XPK_HPMCED on ROYSECITY.HPMCED_CERT_DTL (HPMCEM_ID, HPMCED_LINE_NBR)
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
create table ROYSECITY.HPMCEM_CERT_MST
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
create unique index ROYSECITY.XPK_HPMCEM on ROYSECITY.HPMCEM_CERT_MST (HPMCEM_ID)
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
create table ROYSECITY.HTODCD_TOF_CODES
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
create unique index ROYSECITY.XPK_HTODCD on ROYSECITY.HTODCD_TOF_CODES (HTODCD_TOF_CODE)
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
create table ROYSECITY.HTODGR_GROUP_CODES
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
create table ROYSECITY.HTODHP_HPD_CODES
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
create table ROYSECITY.HTODRS_REASON_CODES
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
create bitmap index ROYSECITY.xpk_htodrs on ROYSECITY.HTODRS_REASON_CODES (HTODRS_REASON_CODE)
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
create table ROYSECITY.HTOTRN_TRANS
(
  htotrn_desc         VARCHAR2(60),
  htotrn_ltd_record   VARCHAR2(2),
  htotrn_ltd_dys      NUMBER,
  htotrn_ltd_hrs      NUMBER,
  htodhp_hpd_code     VARCHAR2(10),
  htotrn_reason_code  VARCHAR2(10),
  htoacr_code         VARCHAR2(18),
  htotrn_del_flag     VARCHAR2(2),
  htodcd_unit_type    VARCHAR2(2),
  htotrn_dys          NUMBER,
  htotrn_hrs          NUMBER,
  htodgr_grp_code     VARCHAR2(2),
  htotrn_type         VARCHAR2(2),
  htotrn_trans_date   VARCHAR2(10),
  htodcd_tof_codes    VARCHAR2(10),
  name_id             NUMBER(11),
  htotrn_id           NUMBER(11),
  htotrn_calculated_x CHAR(1),
  hpahdm_id           NUMBER(11),
  htotrn_misc3        VARCHAR2(16),
  htotrn_misc2        VARCHAR2(16),
  htotrn_misc1        VARCHAR2(16),
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
create unique index ROYSECITY.XPK_HTOTRN on ROYSECITY.HTOTRN_TRANS (HTOTRN_ID)
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
prompt Creating table NAME
prompt ===================
prompt
create table ROYSECITY.NAME
(
  name_id                    NUMBER(11),
  bus_ind_type               CHAR(1),
  first_name                 VARCHAR2(30),
  middle_name                VARCHAR2(30),
  last_name                  VARCHAR2(60),
  nalphakey                  VARCHAR2(22),
  federal_id_no              VARCHAR2(18),
  address_id                 NUMBER(11),
  primary_phone              VARCHAR2(20),
  second_phone               VARCHAR2(20),
  fax_number                 VARCHAR2(20),
  confidential_code          CHAR(1),
  contact_person             VARCHAR2(60),
  rsvd_comment               VARCHAR2(240),
  internet_address           VARCHAR2(80),
  obs_x_duser                CHAR(1),
  obs_x_emer_contact         CHAR(1),
  obs_x_employer             CHAR(1),
  obs_x_feeder_school        CHAR(1),
  obs_x_guardian             CHAR(1),
  obs_x_health_professional  CHAR(1),
  obs_x_hospital             CHAR(1),
  obs_x_incl_census          CHAR(1),
  obs_x_insurance_co         CHAR(1),
  obs_x_organization         CHAR(1),
  obs_x_physician            CHAR(1),
  obs_x_staff                CHAR(1),
  obs_x_student              CHAR(1),
  obs_x_vendor               CHAR(1),
  birthdate                  VARCHAR2(10),
  gender                     VARCHAR2(2),
  marital_status             VARCHAR2(2),
  highest_ed_level_id        VARCHAR2(6),
  occupation_id              VARCHAR2(10),
  language_code              VARCHAR2(6),
  race_code                  VARCHAR2(6),
  n_employer                 NUMBER(11),
  n_organization             NUMBER(11),
  live                       CHAR(1),
  salutation_id              VARCHAR2(6),
  primary_phone_ext          VARCHAR2(10),
  second_phone_ext           VARCHAR2(10),
  obs_x_publisher            CHAR(1),
  obs_x_alumni               CHAR(1),
  alumni_grad_yr             NUMBER(11),
  addr_mail_id               NUMBER(11),
  third_phone                VARCHAR2(20),
  third_phone_ext            VARCHAR2(10),
  second_phone_type          VARCHAR2(2),
  third_phone_type           VARCHAR2(2),
  name_suffix_id             VARCHAR2(8),
  web_access_password        VARCHAR2(16),
  ein                        VARCHAR2(18),
  barcode_nbr                NUMBER(11),
  barcode_date               VARCHAR2(10),
  birth_place                VARCHAR2(60),
  web_encrypted_access       VARCHAR2(16),
  primary_phone_cat          VARCHAR2(16),
  second_phone_cat           VARCHAR2(16),
  third_phone_cat            VARCHAR2(16),
  sif_name_ref_id            VARCHAR2(64),
  os_system_login            VARCHAR2(60),
  os_system_password         VARCHAR2(60),
  os_system_password_changed VARCHAR2(10),
  state_code                 VARCHAR2(16),
  conf_addr                  CHAR(1),
  conf_phone2                CHAR(1),
  conf_phone3                CHAR(1),
  conf_ssn                   CHAR(1),
  conf_marital_sts           CHAR(7),
  conf_dob                   CHAR(1),
  truetime_code              NUMBER(11),
  birth_city                 VARCHAR2(16),
  birth_state                VARCHAR2(16),
  birth_country              VARCHAR2(16),
  birth_county               VARCHAR2(16),
  mothers_maiden_name        VARCHAR2(60),
  birth_country_code         VARCHAR2(8),
  country_of_citizenship     VARCHAR2(8),
  country_of_residence       VARCHAR2(8),
  country_arrival_date       VARCHAR2(10),
  citizenship_status         VARCHAR2(8),
  deceased_dte               VARCHAR2(10),
  qqqblb_blob_id             NUMBER(11),
  use_biometric              CHAR(6),
  alternative_link_id        NUMBER(11),
  alternate_id               VARCHAR2(4),
  primary_phone_long_dist    VARCHAR2(1),
  custodial_parent           VARCHAR2(1),
  sexual_offender            VARCHAR2(1),
  no_connect_ed              VARCHAR2(1),
  allow_pick_up              VARCHAR2(1),
  ethnicity_hisp_x           VARCHAR2(1),
  wi_payee_id                VARCHAR2(20),
  race_verified_by           VARCHAR2(30),
  wa_race_subgroup           VARCHAR2(6),
  race_verified_date         VARCHAR2(8),
  fed_race_flags             VARCHAR2(10),
  conf_race_x                VARCHAR2(1),
  wa_ethnicity_group         VARCHAR2(6),
  conv_field_1               VARCHAR2(16),
  conv_field_2               VARCHAR2(16),
  r10_loaddate               DATE
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
create unique index ROYSECITY.XAK16NAME_ADDRESS on ROYSECITY.NAME (ADDRESS_ID, NALPHAKEY)
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
create unique index ROYSECITY.XAK18NAME_ADDR_MAIL_ID on ROYSECITY.NAME (ADDR_MAIL_ID, NAME_ID)
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
create unique index ROYSECITY.XAK2NAME_ALPHAKEY on ROYSECITY.NAME (NALPHAKEY)
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
create unique index ROYSECITY.XPKNAME on ROYSECITY.NAME (NAME_ID)
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
prompt Creating table PF_ATTENDANCE
prompt ============================
prompt
create table ROYSECITY.PF_ATTENDANCE
(
  state_stu_id          VARCHAR2(9),
  campus_id             VARCHAR2(3),
  instruct_trk          CHAR(1),
  rptng_per             CHAR(1),
  no_days_taught        NUMBER(3),
  grd_lvl               VARCHAR2(2),
  tot_days_abs          NUMBER(4,1),
  tot_inelig_days_pres  NUMBER(4,1),
  tot_elig_days_pres    NUMBER(4,1),
  tot_bil_esl_days_pres NUMBER(4,1),
  tot_preg_days_pres    NUMBER(4,1),
  tot_se_days_pres      NUMBER(4,1),
  gt_ind                CHAR(1),
  local_id              VARCHAR2(9),
  pep                   CHAR(1),
  pri_handi             VARCHAR2(2),
  multi_handi           CHAR(1),
  lep_ind               CHAR(1),
  r10_loaddate          DATE
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
prompt Creating table PF_CATE_ATTENDANCE
prompt =================================
prompt
create table ROYSECITY.PF_CATE_ATTENDANCE
(
  state_stu_id   VARCHAR2(9),
  campus_id      VARCHAR2(3),
  instruct_trk   CHAR(1),
  rptng_per      CHAR(1),
  no_days_taught NUMBER(3),
  grd_lvl        VARCHAR2(2),
  elig_days_v1   NUMBER(4,1),
  elig_days_v2   NUMBER(4,1),
  elig_days_v3   NUMBER(4,1),
  elig_days_v4   NUMBER(4,1),
  elig_days_v5   NUMBER(4,1),
  elig_days_v6   NUMBER(4,1),
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
prompt Creating table PF_CLASSROOM_RESP
prompt ================================
prompt
create table ROYSECITY.PF_CLASSROOM_RESP
(
  staff_id       VARCHAR2(9),
  dist_id_resp   VARCHAR2(6),
  campus_id_resp VARCHAR2(3),
  role_id        VARCHAR2(3),
  svc_id         VARCHAR2(8),
  resp_beg_time  VARCHAR2(5),
  resp_end_time  VARCHAR2(5),
  days_of_week   VARCHAR2(2),
  wks_of_mon     VARCHAR2(2),
  instruct_set   VARCHAR2(2),
  no_stu         VARCHAR2(3),
  pop_srvd       VARCHAR2(2),
  multi_svc      CHAR(1),
  esc_ssa        CHAR(1),
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
prompt Creating table PF_CRS_COMPLETION
prompt ================================
prompt
create table ROYSECITY.PF_CRS_COMPLETION
(
  state_stu_id    VARCHAR2(9),
  campus_id       VARCHAR2(3),
  svc_id          VARCHAR2(8),
  seq             CHAR(1),
  pass_fail       VARCHAR2(2),
  distan_lrn_ind  VARCHAR2(2),
  dual_credit_ind CHAR(1),
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
prompt Creating table PF_DISCIPLINE
prompt ============================
prompt
create table ROYSECITY.PF_DISCIPLINE
(
  state_stu_id               VARCHAR2(9),
  campus_id_enroll           VARCHAR2(9),
  campus_id_assgn            VARCHAR2(9),
  actn_nbr                   VARCHAR2(3),
  actn_cd                    VARCHAR2(2),
  actn_rsn                   VARCHAR2(2),
  offcl_length_discpln_assgn VARCHAR2(3),
  act_length_discpln_assgn   VARCHAR2(3),
  length_diff_rsn_cd         VARCHAR2(2),
  incident_num               VARCHAR2(6),
  report_pd                  CHAR(1),
  dt_discpln_actn            VARCHAR2(8),
  campus_id_discpln_respons  VARCHAR2(9),
  dist_id                    VARCHAR2(6),
  dist_name                  VARCHAR2(34),
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

prompt
prompt Creating table PF_FTE
prompt =====================
prompt
create table ROYSECITY.PF_FTE
(
  campus_id    VARCHAR2(3),
  pgm_int      VARCHAR2(2),
  fte_count    NUMBER(5,2),
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
prompt Creating table PF_SCHOOL_LEAVERS
prompt ================================
prompt
create table ROYSECITY.PF_SCHOOL_LEAVERS
(
  state_stu_id VARCHAR2(9),
  campus_id    VARCHAR2(3),
  leaver_rsn1  VARCHAR2(2),
  grad_dt      VARCHAR2(6),
  grad_typ_cd  VARCHAR2(2),
  local_id     VARCHAR2(9),
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
prompt Creating table PF_SE_ATT
prompt ========================
prompt
create table ROYSECITY.PF_SE_ATT
(
  state_stu_id   VARCHAR2(9),
  campus_id      VARCHAR2(3),
  instruct_trk   CHAR(1),
  rptng_per      CHAR(1),
  no_days_taught NUMBER(3),
  grd_lvl        VARCHAR2(2),
  instr_set      VARCHAR2(2),
  elig_days      NUMBER(4,1),
  excess_hrs     NUMBER(6,3),
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
prompt Creating table PF_STAFF_DEMO
prompt ============================
prompt
create table ROYSECITY.PF_STAFF_DEMO
(
  staff_id           VARCHAR2(9),
  name_f             VARCHAR2(17),
  name_m             VARCHAR2(14),
  name_l             VARCHAR2(25),
  gen                CHAR(1),
  sex                CHAR(1),
  dob                VARCHAR2(8),
  yrs_experi_in_dist NUMBER,
  demo_rev_confirm   CHAR(1),
  prior_staff_id     VARCHAR2(9),
  no_days_empld      NUMBER(3),
  pct_day_empld      NUMBER(3),
  r10_loaddate       DATE,
  tot_yrs_experi     NUMBER,
  high_deg           CHAR(10),
  ethn_hispanic      CHAR(1),
  race_pacific_isl   CHAR(1),
  race_amer_indian   CHAR(1),
  race_asian         CHAR(1),
  race_black         CHAR(1),
  race_white         CHAR(1),
  stf_type           CHAR(10)
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
prompt Creating table PF_STU_DEMO
prompt ==========================
prompt
create table ROYSECITY.PF_STU_DEMO
(
  submssn_typ        CHAR(1),
  state_stu_id       VARCHAR2(9),
  name_f             VARCHAR2(17),
  name_m             VARCHAR2(14),
  name_l             VARCHAR2(25),
  gen                CHAR(1),
  sex                CHAR(1),
  ethn               CHAR(1),
  dob                VARCHAR2(8),
  campus_id_of_resid VARCHAR2(9),
  prior_state_stu_id VARCHAR2(9),
  demo_rev_cd        CHAR(1),
  attribution_cd     VARCHAR2(2),
  as_of_status       CHAR(1),
  grd_lvl            VARCHAR2(2),
  campus_id_account  VARCHAR2(9),
  migrant_ind        CHAR(1),
  bil_esl_summer_ind CHAR(1),
  camp_enroll        VARCHAR2(3),
  crisis_cd          VARCHAR2(2),
  ethn_hispanic      VARCHAR2(1),
  race_pacific_isl   VARCHAR2(1),
  race_amer_indian   VARCHAR2(1),
  race_asian         VARCHAR2(1),
  race_black         VARCHAR2(1),
  race_white         VARCHAR2(1),
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
  );

prompt
prompt Creating table PF_STU_DEMO_EXT
prompt ==============================
prompt
create table ROYSECITY.PF_STU_DEMO_EXT
(
  state_stu_id       VARCHAR2(9),
  name_f             VARCHAR2(17),
  name_m             VARCHAR2(14),
  name_l             VARCHAR2(25),
  gen                CHAR(1),
  sex                CHAR(1),
  ethn               CHAR(1),
  dob                VARCHAR2(8),
  campus_id_of_resid VARCHAR2(9),
  prior_state_stu_id VARCHAR2(9),
  demo_rev_ind       CHAR(1),
  attribution_cd     VARCHAR2(2),
  grd_lvl            VARCHAR2(2),
  migrant_ind        CHAR(1),
  bil_esl_smr_ind    CHAR(1),
  even_strt          CHAR(1),
  campus_id_enroll   VARCHAR2(3),
  crisis_cd          VARCHAR2(2),
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

prompt
prompt Creating table PF_STU_ENROLL
prompt ============================
prompt
create table ROYSECITY.PF_STU_ENROLL
(
  state_stu_id       VARCHAR2(9),
  campus_id          VARCHAR2(3),
  ada_elig           CHAR(1),
  lep                CHAR(1),
  home_lang          VARCHAR2(2),
  parental_permiss   CHAR(1),
  at_risk            CHAR(1),
  tii                CHAR(1),
  se_ind             CHAR(1),
  gt_ind             CHAR(1),
  immigrant          CHAR(1),
  local_id           VARCHAR2(9),
  ssi_promo_retnt_cd VARCHAR2(2),
  pk_mil             CHAR(1),
  pk_foster_care     CHAR(1),
  bil                CHAR(1),
  esl                CHAR(1),
  r10_loaddate       DATE
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
prompt Creating table PF_STU_SE
prompt ========================
prompt
create table ROYSECITY.PF_STU_SE
(
  state_stu_id         VARCHAR2(9),
  pri_handi            VARCHAR2(2),
  scnd_handi           VARCHAR2(2),
  ter_handi            VARCHAR2(2),
  multi_handi          CHAR(1),
  child_cnt_funding    CHAR(1),
  early_childhd_interv CHAR(1),
  presch_pgm_dis       CHAR(1),
  reg_day_sch_deaf     CHAR(1),
  se_instruct_set      VARCHAR2(2),
  sp_thrpy             CHAR(1),
  audiol_svc           CHAR(1),
  couns_svc            CHAR(1),
  med_diag_svc         CHAR(1),
  occup_thrpy          CHAR(1),
  orient_mob_trng      CHAR(1),
  physcl_thrpy         CHAR(1),
  psych_svc            CHAR(1),
  recre_thrpy          CHAR(1),
  sch_hlth_svc         CHAR(1),
  soc_wrk_svc          CHAR(1),
  transport            CHAR(1),
  assistive_tech       CHAR(1),
  medically_fragile    CHAR(1),
  interp_svc           VARCHAR2(2),
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
prompt Creating table PF_TITLE1_PARTA
prompt ==============================
prompt
create table ROYSECITY.PF_TITLE1_PARTA
(
  stu_id           VARCHAR2(9),
  campus_id_enroll VARCHAR2(9),
  ti1_part_a_ind   CHAR(1),
  homeless_ind     CHAR(1),
  reading_ind      CHAR(1),
  math_ind         CHAR(1),
  sci_ind          CHAR(1),
  soc_studies_ind  CHAR(1),
  guid_ind         CHAR(1),
  soc_wrk_ind      CHAR(1),
  hlth_svc_ind     CHAR(1),
  r10_loaddate     DATE
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
prompt Creating table RACE
prompt ===================
prompt
create table ROYSECITY.RACE
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
prompt Creating table SDEPT
prompt ====================
prompt
create table ROYSECITY.SDEPT
(
  deptcode     VARCHAR2(4),
  deptdesc     VARCHAR2(29),
  schoolid     VARCHAR2(9),
  iddept       NUMBER(11),
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
prompt Creating table SDLYATD
prompt ======================
prompt
create table ROYSECITY.SDLYATD
(
  datdabsv     NUMBER(5,3),
  datdlatev    NUMBER(5,3),
  datdlong     VARCHAR2(21),
  datdpresv    NUMBER(5,3),
  datdshort    VARCHAR2(11),
  datdunexc    CHAR(1),
  schoolid     VARCHAR2(9),
  iddailyatd   NUMBER(11),
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
prompt Creating table SGRADES
prompt ======================
prompt
create table ROYSECITY.SGRADES
(
  grddayvalu   NUMBER(3,1),
  grdhalfday   CHAR(1),
  grdlong      VARCHAR2(17),
  grdshort     VARCHAR2(3),
  grdused      CHAR(1),
  schoolid     VARCHAR2(9),
  grdmsvalue   NUMBER(2),
  idgrade      NUMBER(11),
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
create unique index ROYSECITY.PK_SGRADES on ROYSECITY.SGRADES (SCHOOLID, IDGRADE)
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
prompt Creating table SGT_STR0511_EXTR01_DISCIP
prompt ========================================
prompt
create table ROYSECITY.SGT_STR0511_EXTR01_DISCIP
(
  student_id           VARCHAR2(6),
  building_id          VARCHAR2(3),
  incident_date        VARCHAR2(10),
  incident_description VARCHAR2(20),
  incident_number      VARCHAR2(6),
  action_date          VARCHAR2(10),
  actn_cd              VARCHAR2(2),
  action_description   VARCHAR2(20),
  duration             VARCHAR2(3),
  reffered_to          VARCHAR2(20),
  comment1             VARCHAR2(60),
  comment2             VARCHAR2(60),
  comment3             VARCHAR2(60),
  comment4             VARCHAR2(60),
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
prompt Creating table SGT_STR0511_EXTR01_MST_SCHED
prompt ===========================================
prompt
create table ROYSECITY.SGT_STR0511_EXTR01_MST_SCHED
(
  course_id                VARCHAR2(10),
  building_id              VARCHAR2(3),
  description              VARCHAR2(15),
  room                     VARCHAR2(5),
  credit                   VARCHAR2(6),
  grade_list               VARCHAR2(20),
  teacher_id               VARCHAR2(3),
  period                   VARCHAR2(3),
  days_cd                  VARCHAR2(2),
  meets_on_day1            CHAR(1),
  meets_on_day2            CHAR(1),
  meets_on_day3            CHAR(1),
  meets_on_day4            CHAR(1),
  meets_on_day5            CHAR(1),
  meets_on_day6            CHAR(1),
  meets_on_day7            CHAR(1),
  per_begin                VARCHAR2(2),
  per_end                  VARCHAR2(2),
  meets_in_marking_period1 CHAR(1),
  meets_in_marking_period2 CHAR(1),
  meets_in_marking_period3 CHAR(1),
  meets_in_marking_period4 CHAR(1),
  meets_in_marking_period5 CHAR(1),
  meets_in_marking_period6 CHAR(1),
  meets_in_marking_period7 CHAR(1),
  meets_in_marking_period8 CHAR(1),
  meets_in_marking_period9 CHAR(1),
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

prompt
prompt Creating table SGT_STR0511_EXTR01_STUDENT
prompt =========================================
prompt
create table ROYSECITY.SGT_STR0511_EXTR01_STUDENT
(
  student_id                     VARCHAR2(6),
  building_id                    VARCHAR2(3),
  first_name                     VARCHAR2(20),
  middle_name                    VARCHAR2(15),
  last_name                      VARCHAR2(25),
  ssn                            VARCHAR2(11),
  birth_date                     VARCHAR2(10),
  address                        VARCHAR2(32),
  city                           VARCHAR2(20),
  state                          VARCHAR2(2),
  zip                            VARCHAR2(10),
  phone_number                   VARCHAR2(13),
  gender                         CHAR(1),
  grade_level                    VARCHAR2(2),
  home_room                      VARCHAR2(5),
  counselor_id                   VARCHAR2(3),
  home_language                  VARCHAR2(20),
  lives_with                     VARCHAR2(20),
  seq_number1                    NUMBER(4),
  prim_flag1                     CHAR(1),
  relat1                         VARCHAR2(2),
  relation1                      VARCHAR2(20),
  parent1_name                   VARCHAR2(30),
  parent1_work_phone1            VARCHAR2(13),
  parent1_work_phone1_extension  VARCHAR2(4),
  parent1_home_phone             VARCHAR2(13),
  parent1_work_phone2            VARCHAR2(13),
  parent1_work_phone2_extension  VARCHAR2(4),
  parent1_address                VARCHAR2(32),
  parent1_city                   VARCHAR2(20),
  parent1_state                  VARCHAR2(2),
  parent1_zip_code               VARCHAR2(10),
  seq_number2                    NUMBER(4),
  prim_flag2                     CHAR(1),
  relat2                         VARCHAR2(2),
  relation2                      VARCHAR2(20),
  parent2_name                   VARCHAR2(30),
  parent2_work_phone1            VARCHAR2(13),
  parent2_work_phone1_extension  VARCHAR2(4),
  parent2_home_phone             VARCHAR2(13),
  parent2_work_phone2            VARCHAR2(13),
  parent2_work_phone2_extension  VARCHAR2(4),
  parent2_address                VARCHAR2(32),
  parent2_city                   VARCHAR2(30),
  parent2_state                  VARCHAR2(2),
  parent2_zip_code               VARCHAR2(10),
  students_driver_license_number VARCHAR2(10),
  locker_id                      VARCHAR2(15),
  r10_loaddate                   DATE
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
prompt Creating table SPMINSTR
prompt =======================
prompt
create table ROYSECITY.SPMINSTR
(
  idpminstr    NUMBER(11) not null,
  idschlicns   NUMBER(6) not null,
  pminstcode   VARCHAR2(3) not null,
  pminstdesc   VARCHAR2(37) not null,
  schoolid     VARCHAR2(9) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_SPMINSTR_SCHOOLID on ROYSECITY.SPMINSTR (SCHOOLID)
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
prompt Creating table SPRDNAME
prompt =======================
prompt
create table ROYSECITY.SPRDNAME
(
  prdendhr     NUMBER(2) not null,
  prdendmn     NUMBER(2) not null,
  prdendtm     VARCHAR2(5) not null,
  prdnmcode    NUMBER(2) not null,
  prdnmdesc    VARCHAR2(11) not null,
  prdnummins   NUMBER(4) not null,
  prdstrthr    NUMBER(2) not null,
  prdstrtmn    NUMBER(2) not null,
  prdstrttm    VARCHAR2(5) not null,
  schoolid     VARCHAR2(9) not null,
  idperiod     NUMBER(11) not null,
  idschlicns   NUMBER(6) not null,
  r10_loaddate DATE
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
create unique index ROYSECITY.PK_SPRDNAME on ROYSECITY.SPRDNAME (SCHOOLID, IDPERIOD)
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
prompt Creating table SR_ACCIDENT
prompt ==========================
prompt
create table ROYSECITY.SR_ACCIDENT
(
  stu_id              VARCHAR2(6),
  accident_date       VARCHAR2(8),
  dt_time_stamp       DATE,
  accident_time       VARCHAR2(8),
  attending_name      VARCHAR2(30),
  physician_name      VARCHAR2(27),
  par_notif_flag      CHAR(1),
  body_part_injured   VARCHAR2(3),
  hospitalized_flag   CHAR(1),
  school_days_lost    NUMBER(4,1),
  insurance_flag      CHAR(1),
  nature_of_accdnt_cd VARCHAR2(2),
  fatality_flg        CHAR(1),
  location            VARCHAR2(3),
  comments            VARCHAR2(3270),
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

prompt
prompt Creating table SR_ATT_POST
prompt ==========================
prompt
create table ROYSECITY.SR_ATT_POST
(
  sch_yr        VARCHAR2(4),
  stu_id        VARCHAR2(6),
  campus_id     VARCHAR2(3),
  abs_date      VARCHAR2(8),
  abs_per       VARCHAR2(2),
  abs_type      CHAR(1),
  crs_nbr       VARCHAR2(4),
  jul_day       VARCHAR2(3),
  jul_yr        VARCHAR2(4),
  post_flag     CHAR(1),
  user_id       VARCHAR2(12),
  dt_time_stamp DATE,
  comnt         VARCHAR2(3270),
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
create bitmap index ROYSECITY.BMI_SR_ATT_POST_ABS_PER on ROYSECITY.SR_ATT_POST (ABS_PER)
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
create bitmap index ROYSECITY.BMI_SR_ATT_POST_ABS_TYPE on ROYSECITY.SR_ATT_POST (ABS_TYPE)
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
create bitmap index ROYSECITY.BMI_SR_ATT_POST_CAMPUSID on ROYSECITY.SR_ATT_POST (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_SR_ATT_POST_SCHL_YR on ROYSECITY.SR_ATT_POST (SCH_YR)
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
create bitmap index ROYSECITY.BMI_SR_ATT_POST_STU_ID on ROYSECITY.SR_ATT_POST (STU_ID)
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
prompt Creating table SR_ATT_POST_HOMEBND
prompt ==================================
prompt
create table ROYSECITY.SR_ATT_POST_HOMEBND
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  first_day_wk VARCHAR2(8),
  no_hrs_srv   NUMBER(30,6),
  stu_id       VARCHAR2(6),
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
prompt Creating table SR_ATT_POST_INSTR_CLASS
prompt ======================================
prompt
create table ROYSECITY.SR_ATT_POST_INSTR_CLASS
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  att_dt       VARCHAR2(8),
  instr_id     VARCHAR2(3),
  per          VARCHAR2(2),
  crs_no       VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  post_flag    CHAR(1),
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
prompt Creating table SR_BIL_ESL
prompt =========================
prompt
create table ROYSECITY.SR_BIL_ESL
(
  sch_yr          VARCHAR2(4),
  stu_id          VARCHAR2(6),
  categ           CHAR(1),
  orig_entry_date VARCHAR2(8),
  lpac_date       VARCHAR2(8),
  exit_date       VARCHAR2(8),
  followup_one_yr CHAR(1),
  followup_two_yr VARCHAR2(10),
  ltr_entry_ind   CHAR(1),
  ltr_wd_ind      CHAR(1),
  sched_cd        CHAR(1),
  survey_done     CHAR(1),
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
prompt Creating table SR_CAMPUS_AWARD_CREDIT
prompt =====================================
prompt
create table ROYSECITY.SR_CAMPUS_AWARD_CREDIT
(
  sch_yr        VARCHAR2(4),
  stu_id        VARCHAR2(6),
  dist_id       VARCHAR2(6),
  campus_id     VARCHAR2(3),
  user_id       VARCHAR2(12),
  dt_time_stamp DATE,
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
prompt Creating table SR_CRS_ASSGN
prompt ===========================
prompt
create table ROYSECITY.SR_CRS_ASSGN
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem          CHAR(1),
  cyc          CHAR(1),
  assgn_nbr    NUMBER(5),
  stu_id       VARCHAR2(6),
  grd          VARCHAR2(3),
  excl         CHAR(1),
  redo_flg     CHAR(1),
  late_assgn   CHAR(1),
  has_comnt    CHAR(1),
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
prompt Creating table SR_CRS_GRD
prompt =========================
prompt
create table ROYSECITY.SR_CRS_GRD
(
  sch_yr               VARCHAR2(4),
  campus_id            VARCHAR2(3),
  stu_id               VARCHAR2(6),
  crs_nbr              VARCHAR2(4),
  sec_nbr              VARCHAR2(2),
  crs_sem_enroll       CHAR(1),
  dt_entry             VARCHAR2(8),
  dt_wd                VARCHAR2(8),
  grd_cyc1             VARCHAR2(3),
  grd_cyc2             VARCHAR2(3),
  grd_cyc3             VARCHAR2(3),
  grd_exam             VARCHAR2(3),
  grd_sem              VARCHAR2(3),
  grd_final            VARCHAR2(3),
  comments_cyc1_1      CHAR(1),
  comments_cyc1_2      CHAR(1),
  comments_cyc1_3      CHAR(1),
  comments_cyc1_4      CHAR(1),
  comments_cyc1_5      CHAR(1),
  comments_cyc2_1      CHAR(1),
  comments_cyc2_2      CHAR(1),
  comments_cyc2_3      CHAR(1),
  comments_cyc2_4      CHAR(1),
  comments_cyc2_5      CHAR(1),
  comments_cyc3_1      CHAR(1),
  comments_cyc3_2      CHAR(1),
  comments_cyc3_3      CHAR(1),
  comments_cyc3_4      CHAR(1),
  comments_cyc3_5      CHAR(1),
  conduct_cyc1         CHAR(1),
  conduct_cyc2         CHAR(1),
  conduct_cyc3         CHAR(1),
  scan_update          VARCHAR2(8),
  abs_cyc1             NUMBER(2),
  abs_cyc2             NUMBER(2),
  abs_cyc3             NUMBER(2),
  abs_exc_cyc1         NUMBER(2),
  abs_sch_cyc1         NUMBER(2),
  abs_unexc_cyc1       NUMBER(2),
  abs_exc_cyc2         NUMBER(2),
  abs_sch_cyc2         NUMBER(2),
  abs_unexc_cyc2       NUMBER(2),
  abs_exc_cyc3         NUMBER(2),
  abs_sch_cyc3         NUMBER(2),
  abs_unexc_cyc3       NUMBER(2),
  crs_credit           VARCHAR2(2),
  aar_use_cd           CHAR(1),
  ed_pgm_cd            CHAR(1),
  crs_spec_consider    VARCHAR2(2),
  tardy_cyc1           NUMBER(2),
  tardy_cyc2           NUMBER(2),
  tardy_cyc3           NUMBER(2),
  scan_grd_nbr         VARCHAR2(6),
  scan_grd_pos_nbr     VARCHAR2(2),
  scan_ipr_nbr         VARCHAR2(6),
  scan_ipr_pos_nbr     VARCHAR2(2),
  service_id           VARCHAR2(8),
  pass_fail_credit_ind VARCHAR2(2),
  spec_ed_pass_grd     VARCHAR2(2),
  excl_grd_compute     CHAR(1),
  svc_id_chg           CHAR(1),
  incl_elig            CHAR(1),
  honors_crs           CHAR(1),
  xfer_crs             CHAR(1),
  scan_track           CHAR(1),
  user_id              VARCHAR2(12),
  dt_time_stamp        DATE,
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_CMPID on ROYSECITY.SR_CRS_GRD (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_CRSNBR on ROYSECITY.SR_CRS_GRD (CRS_NBR)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_GRD_CYC1 on ROYSECITY.SR_CRS_GRD (GRD_CYC1)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_GRD_CYC2 on ROYSECITY.SR_CRS_GRD (GRD_CYC2)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_GRD_CYC3 on ROYSECITY.SR_CRS_GRD (GRD_CYC3)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_SCH_YR on ROYSECITY.SR_CRS_GRD (SCH_YR)
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
create bitmap index ROYSECITY.BMI_SR_CRS_GRD_SECNBR on ROYSECITY.SR_CRS_GRD (SEC_NBR)
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
prompt Creating table SR_CRS_GRD_DEL
prompt =============================
prompt
create table ROYSECITY.SR_CRS_GRD_DEL
(
  sch_yr               VARCHAR2(4),
  campus_id            VARCHAR2(3),
  stu_id               VARCHAR2(6),
  crs_nbr              VARCHAR2(4),
  sec_nbr              VARCHAR2(2),
  crs_sem_enroll       CHAR(1),
  dt_entry             VARCHAR2(8),
  dt_wd                VARCHAR2(8),
  grd_cyc1             VARCHAR2(3),
  grd_cyc2             VARCHAR2(3),
  grd_cyc3             VARCHAR2(3),
  grd_exam             VARCHAR2(3),
  grd_sem              VARCHAR2(3),
  grd_final            VARCHAR2(3),
  abs_cyc1             NUMBER(2),
  abs_cyc2             NUMBER(2),
  abs_cyc3             NUMBER(2),
  abs_exc_cyc1         NUMBER(2),
  abs_sch_cyc1         NUMBER(2),
  abs_unexc_cyc1       NUMBER(2),
  abs_exc_cyc2         NUMBER(2),
  abs_sch_cyc2         NUMBER(2),
  abs_unexc_cyc2       NUMBER(2),
  abs_exc_cyc3         NUMBER(2),
  abs_sch_cyc3         NUMBER(2),
  abs_unexc_cyc3       NUMBER(2),
  crs_credit           VARCHAR2(2),
  aar_use_cd           CHAR(1),
  crs_spec_consider    VARCHAR2(2),
  tardy_cyc1           NUMBER(2),
  tardy_cyc2           NUMBER(2),
  tardy_cyc3           NUMBER(2),
  service_id           VARCHAR2(8),
  pass_fail_credit_ind VARCHAR2(2),
  spec_ed_pass_grd     VARCHAR2(2),
  excl_grd_compute     CHAR(1),
  svc_id_chg           CHAR(1),
  incl_elig            CHAR(1),
  honors_crs           CHAR(1),
  xfer_crs             CHAR(1),
  instr_id             VARCHAR2(3),
  new_crs_nbr          VARCHAR2(4),
  new_sec_nbr          VARCHAR2(2),
  new_crs_sem          CHAR(1),
  user_id              VARCHAR2(12),
  dt_time_stamp        DATE,
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
prompt Creating table SR_CRS_GRD_ELEM
prompt ==============================
prompt
create table ROYSECITY.SR_CRS_GRD_ELEM
(
  sch_yr            VARCHAR2(4),
  campus_id         VARCHAR2(3),
  stu_id            VARCHAR2(6),
  crs_nbr           VARCHAR2(4),
  sec_nbr           VARCHAR2(2),
  dt_entry          VARCHAR2(8),
  dt_wd             VARCHAR2(8),
  grd_cyc1          VARCHAR2(3),
  grd_cyc2          VARCHAR2(3),
  grd_cyc3          VARCHAR2(3),
  grd_cyc4          VARCHAR2(3),
  grd_cyc5          VARCHAR2(3),
  grd_cyc6          VARCHAR2(3),
  grd_final         VARCHAR2(3),
  comment_1         CHAR(1),
  comment_2         CHAR(1),
  comment_3         CHAR(1),
  comment_4         CHAR(1),
  comment_5         CHAR(1),
  modified_ess_flg  CHAR(1),
  tutoring_reqd_flg CHAR(1),
  instruct_set      VARCHAR2(2),
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

prompt
prompt Creating table SR_CRS_GRD_TRANSFER
prompt ==================================
prompt
create table ROYSECITY.SR_CRS_GRD_TRANSFER
(
  sch_yr            VARCHAR2(4),
  stu_id            VARCHAR2(6),
  seq_nbr           NUMBER(4),
  title             VARCHAR2(15),
  service_id        VARCHAR2(8),
  svcid_typ         VARCHAR2(4),
  svcid_descr       VARCHAR2(10),
  crs_seq_cd        CHAR(1),
  aar_use_cd        CHAR(1),
  crs_spec_consider VARCHAR2(2),
  credit_lvl        CHAR(1),
  loc_crs_id        VARCHAR2(4),
  grd_sem1          VARCHAR2(3),
  grd_sem2          VARCHAR2(3),
  grd_sem3          VARCHAR2(3),
  grd_sem4          VARCHAR2(3),
  grd_avg           VARCHAR2(3),
  crs_credit        VARCHAR2(2),
  user_id           VARCHAR2(12),
  process_dt        VARCHAR2(8),
  exc_abs1          CHAR(1),
  exc_abs2          CHAR(1),
  exc_abs3          CHAR(1),
  exc_abs4          CHAR(1),
  dt_time_stamp     DATE,
  ga_weight         CHAR(1),
  ga_table          CHAR(1),
  check_grd_avg     CHAR(1),
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

prompt
prompt Creating table SR_CRS_SCHED
prompt ===========================
prompt
create table ROYSECITY.SR_CRS_SCHED
(
  campus_id          VARCHAR2(3),
  stu_id             VARCHAR2(6),
  crs_nbr_requested  VARCHAR2(4),
  sec_nbr_requested  VARCHAR2(2),
  sem_crs_requested  CHAR(1),
  sem1_crs_nbr_sched VARCHAR2(4),
  sem1_sec_nbr_sched VARCHAR2(2),
  sem2_crs_nbr_sched VARCHAR2(4),
  sem2_sec_nbr_sched VARCHAR2(2),
  dt_sched           VARCHAR2(8),
  sem3_crs_nbr_sched VARCHAR2(4),
  sem3_sec_nbr_sched VARCHAR2(2),
  sem4_crs_nbr_sched VARCHAR2(4),
  sem4_sec_nbr_sched VARCHAR2(2),
  sem5_crs_nbr_sched VARCHAR2(4),
  sem5_sec_nbr_sched VARCHAR2(2),
  req_src            CHAR(1),
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

prompt
prompt Creating table SR_DISCPLN
prompt =========================
prompt
create table ROYSECITY.SR_DISCPLN
(
  sch_yr           VARCHAR2(4),
  stu_id           VARCHAR2(6),
  ofens_stamp      VARCHAR2(27),
  ofens_time       VARCHAR2(8),
  campus_id        VARCHAR2(3),
  dt_ofens         VARCHAR2(8),
  modifier         VARCHAR2(10),
  ofens_semcyc     VARCHAR2(2),
  rep_by           VARCHAR2(3),
  rep_by_name_f    VARCHAR2(17),
  rep_by_name_l    VARCHAR2(25),
  inc_loc          VARCHAR2(3),
  course           VARCHAR2(4),
  crs_section      VARCHAR2(2),
  crs_title        VARCHAR2(15),
  period           VARCHAR2(2),
  crs_instr        VARCHAR2(3),
  parent_contact   CHAR(1),
  contact_dt       VARCHAR2(8),
  conf_requested   CHAR(1),
  conf_date        VARCHAR2(8),
  informal_hearing CHAR(1),
  appeal_exp       CHAR(1),
  witness          CHAR(1),
  discpln_comm     VARCHAR2(3270),
  admin_by         VARCHAR2(3),
  admin_by_name_f  VARCHAR2(17),
  admin_by_name_l  VARCHAR2(25),
  reported_by_desc VARCHAR2(60),
  incident_num     VARCHAR2(6),
  report_pd        CHAR(1),
  r10_loaddate     DATE
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
prompt Creating table SR_DISCPLN_ACTN
prompt ==============================
prompt
create table ROYSECITY.SR_DISCPLN_ACTN
(
  sch_yr                     VARCHAR2(4),
  stu_id                     VARCHAR2(6),
  ofens_stamp                VARCHAR2(27),
  actn_cd                    VARCHAR2(2),
  actn_to_dt                 VARCHAR2(8),
  amt                        VARCHAR2(10),
  actn_from_dt               VARCHAR2(8),
  campus_id_assgn            VARCHAR2(9),
  actn_nbr                   VARCHAR2(3),
  act_length_discpln_assgn   VARCHAR2(3),
  length_diff_rsn_cd         VARCHAR2(2),
  offcl_length_discpln_assgn VARCHAR2(3),
  date_displnry_action       VARCHAR2(8),
  campus_displnry_respnsblty VARCHAR2(3),
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

prompt
prompt Creating table SR_DISCPLN_ADMIN_BY
prompt ==================================
prompt
create table ROYSECITY.SR_DISCPLN_ADMIN_BY
(
  sch_yr       VARCHAR2(4),
  campus       VARCHAR2(3),
  admin_number VARCHAR2(3),
  name_l       VARCHAR2(25),
  name_f       VARCHAR2(17),
  name_m       VARCHAR2(14),
  name_suffix  CHAR(1),
  name_initial VARCHAR2(14),
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
prompt Creating table SR_DISCPLN_OFENS
prompt ===============================
prompt
create table ROYSECITY.SR_DISCPLN_OFENS
(
  sch_yr        VARCHAR2(4),
  stu_id        VARCHAR2(6),
  ofens_stamp   VARCHAR2(27),
  ofens_cd      VARCHAR2(4),
  ofens_level   CHAR(1),
  peims_extract CHAR(1),
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
prompt Creating table SR_DISCPLN_REPORTED_BY
prompt =====================================
prompt
create table ROYSECITY.SR_DISCPLN_REPORTED_BY
(
  sch_yr       VARCHAR2(4),
  campus       VARCHAR2(3),
  rpt_number   VARCHAR2(3),
  name_l       VARCHAR2(25),
  name_f       VARCHAR2(17),
  name_m       VARCHAR2(14),
  name_suffix  CHAR(1),
  rpt_initial  VARCHAR2(14),
  descr        VARCHAR2(60),
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
prompt Creating table SR_DROUT_TRKNG
prompt =============================
prompt
create table ROYSECITY.SR_DROUT_TRKNG
(
  sch_yr         VARCHAR2(4),
  campus_id      VARCHAR2(3),
  stu_id         VARCHAR2(6),
  wd_dt          VARCHAR2(8),
  wd_cd          VARCHAR2(2),
  wd_dt_rec      VARCHAR2(8),
  name_l         VARCHAR2(25),
  name_f         VARCHAR2(17),
  name_m         VARCHAR2(14),
  gen_cd         CHAR(1),
  state_id       VARCHAR2(9),
  prv_state_id   VARCHAR2(9),
  dob            VARCHAR2(8),
  grd_lvl        VARCHAR2(2),
  sex_cd         CHAR(1),
  ethn_cd        CHAR(1),
  econ_disadv_cd VARCHAR2(2),
  recs_rqstd_cd  VARCHAR2(2),
  drout_per      CHAR(1),
  drout_cd       VARCHAR2(2),
  drout_rsn1     VARCHAR2(2),
  drout_rsn2     VARCHAR2(2),
  drout_rsn3     VARCHAR2(2),
  spec_ed_cd     VARCHAR2(2),
  new_campus_id  VARCHAR2(3),
  explanation    VARCHAR2(14),
  drout_campus   VARCHAR2(3),
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
prompt Creating table SR_GRADEBK_SEC
prompt =============================
prompt
create table ROYSECITY.SR_GRADEBK_SEC
(
  campus_id    VARCHAR2(3),
  stu_id       VARCHAR2(6),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem          CHAR(1),
  cyc          CHAR(1),
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
prompt Creating table SR_GRADEBK_SEM
prompt =============================
prompt
create table ROYSECITY.SR_GRADEBK_SEM
(
  campus_id     VARCHAR2(3),
  stu_id        VARCHAR2(6),
  crs_nbr       VARCHAR2(4),
  sec_nbr       VARCHAR2(2),
  sem           CHAR(1),
  exam_grd      VARCHAR2(3),
  wrk_sem       VARCHAR2(3),
  overr_sem_avg VARCHAR2(3),
  crdt          VARCHAR2(2),
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
prompt Creating table SR_GRD_AVERAGING
prompt ===============================
prompt
create table ROYSECITY.SR_GRD_AVERAGING
(
  sch_yr             VARCHAR2(4),
  stu_id             VARCHAR2(6),
  gavg_nbr_sems      CHAR(1),
  gavg_gp_tot_pts    NUMBER(3),
  gavg_gp_tot_value  NUMBER(9,5),
  gavg_num_tot_pts   NUMBER(3),
  gavg_num_tot_value NUMBER(9,5),
  gavg_ytd_rank      NUMBER(5),
  gavg_credits       NUMBER(5,1),
  gavg_tot_nbr_stu   NUMBER(5),
  gavg_tot_gpa       NUMBER(9,5),
  four_pt_tot_pts    NUMBER(3),
  four_pt_tot_val    NUMBER(5,1),
  alt_gp_tot_pts     NUMBER(3),
  alt_gp_tot_value   NUMBER(9,5),
  alt_num_tot_pts    NUMBER(3),
  alt_num_tot_value  NUMBER(9,5),
  alt_tot_nbr_stu    NUMBER(5),
  alt_tot_gpa        NUMBER(9,5),
  alt_ytd_rank       NUMBER(5),
  best_rank          NUMBER(5),
  best_class         NUMBER(5),
  best_format        CHAR(1),
  credit_lvl         CHAR(1),
  user_id            VARCHAR2(12),
  dt_time_stamp      DATE,
  recalc             CHAR(1),
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

prompt
prompt Creating table SR_IMMUNIZ
prompt =========================
prompt
create table ROYSECITY.SR_IMMUNIZ
(
  stu_id         VARCHAR2(6),
  immuniz_date   VARCHAR2(8),
  dt_time_stamp  VARCHAR2(27),
  series_type    CHAR(1),
  exempt_flag    CHAR(1),
  reaction_flag  CHAR(1),
  immuniz_type   VARCHAR2(2),
  partial_amount VARCHAR2(2),
  affidavit_date VARCHAR2(8),
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
prompt Creating table SR_INSTR_ATT_CLASS_PSTNG
prompt =======================================
prompt
create table ROYSECITY.SR_INSTR_ATT_CLASS_PSTNG
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  att_dt       VARCHAR2(8),
  instr_id     VARCHAR2(3),
  per          VARCHAR2(2),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
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
prompt Creating table SR_PARENT
prompt ========================
prompt
create table ROYSECITY.SR_PARENT
(
  sch_yr            VARCHAR2(4),
  stu_id            VARCHAR2(6),
  seq_no            NUMBER(3),
  name_l            VARCHAR2(25),
  name_f            VARCHAR2(17),
  name_m            VARCHAR2(14),
  gen               CHAR(1),
  relat             VARCHAR2(2),
  str_nbr           VARCHAR2(6),
  str_name          VARCHAR2(19),
  apt_nbr           VARCHAR2(7),
  city              VARCHAR2(17),
  state_cd          VARCHAR2(2),
  zip               VARCHAR2(5),
  zip4              VARCHAR2(4),
  ssn               VARCHAR2(9),
  phone_area_cd     VARCHAR2(3),
  phone_nbr         VARCHAR2(7),
  phone_area_cd_bus VARCHAR2(3),
  phone_nbr_bus     VARCHAR2(7),
  phone_ext_bus     VARCHAR2(4),
  occupation        VARCHAR2(25),
  primary_flag      CHAR(1),
  emergency_flag    CHAR(1),
  migrant_flag      CHAR(1),
  other_phone_ac    VARCHAR2(3),
  other_phone_nbr   VARCHAR2(7),
  other_phone_ext   VARCHAR2(4),
  mil_ind           CHAR(1),
  mil_branch        CHAR(1),
  mil_rank          VARCHAR2(5),
  email             VARCHAR2(64),
  dob               VARCHAR2(8),
  enroll_par_ind    CHAR(1),
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

prompt
prompt Creating table SR_RESOURCE_CLASS
prompt ================================
prompt
create table ROYSECITY.SR_RESOURCE_CLASS
(
  campus_id        VARCHAR2(3),
  crs_nbr          VARCHAR2(4),
  from_sec         VARCHAR2(2),
  to_sec           VARCHAR2(2),
  max_stu          VARCHAR2(3),
  priority         CHAR(1),
  restr_typ        CHAR(1),
  restr_sex        CHAR(1),
  restr_team       CHAR(1),
  restr_grade      VARCHAR2(2),
  restr_grade_addl CHAR(1),
  restr_abil_low   CHAR(1),
  restr_abil_high  CHAR(1),
  dept_use         VARCHAR2(3),
  subject_area     CHAR(1),
  r10_loaddate     DATE
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
prompt Creating table SR_RESOURCE_CLASS_REQ
prompt ====================================
prompt
create table ROYSECITY.SR_RESOURCE_CLASS_REQ
(
  campus_id        VARCHAR2(3),
  crs_nbr          VARCHAR2(4),
  from_sec         VARCHAR2(2),
  to_sec           VARCHAR2(2),
  seq_nbr          NUMBER(1),
  common_meeting   CHAR(1),
  max_stu          VARCHAR2(3),
  per_typ          CHAR(1),
  per_cond         CHAR(1),
  from_or_nbr_per  VARCHAR2(2),
  to_per           VARCHAR2(2),
  sem_typ          CHAR(1),
  sem_cond         CHAR(1),
  sem_nbr_or_met   CHAR(1),
  sem_desig_from   VARCHAR2(3),
  sem_desig_to     VARCHAR2(3),
  days_typ         CHAR(1),
  nbr_days         CHAR(1),
  days_met         VARCHAR2(6),
  days_desig_from  VARCHAR2(3),
  days_desig_to    VARCHAR2(3),
  instr_typ        CHAR(1),
  instr_cond       CHAR(1),
  instr_nbr        VARCHAR2(3),
  instr_desig_from VARCHAR2(3),
  instr_desig_to   VARCHAR2(3),
  room_typ         CHAR(1),
  room_cond        CHAR(1),
  room_nbr         VARCHAR2(4),
  room_desig_from  VARCHAR2(3),
  room_desig_to    VARCHAR2(3),
  r10_loaddate     DATE
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
prompt Creating table SR_RESOURCE_FIXED
prompt ================================
prompt
create table ROYSECITY.SR_RESOURCE_FIXED
(
  campus_id     VARCHAR2(3),
  crs_nbr       VARCHAR2(4),
  fixed_res_typ CHAR(1),
  resource_nbr  VARCHAR2(4),
  max_classes   VARCHAR2(2),
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
prompt Creating table SR_RESOURCE_MET
prompt ==============================
prompt
create table ROYSECITY.SR_RESOURCE_MET
(
  campus_id      VARCHAR2(3),
  crs_nbr        VARCHAR2(4),
  from_sec       VARCHAR2(2),
  to_sec         VARCHAR2(2),
  seq_nbr        CHAR(1),
  common_meeting CHAR(1),
  prd_cond       CHAR(1),
  nbr_prd        VARCHAR2(2),
  prd_from       VARCHAR2(2),
  prd_to         VARCHAR2(2),
  sem_cond       CHAR(1),
  sem_nbr        CHAR(1),
  sem_pattern    VARCHAR2(2),
  days_pattern   VARCHAR2(2),
  nbr_days       CHAR(1),
  days_cond      CHAR(1),
  instr_cond     CHAR(1),
  instr_nbr      VARCHAR2(3),
  room_cond      CHAR(1),
  room_nbr       VARCHAR2(4),
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
prompt Creating table SR_RESOURCE_SH_CLASS
prompt ===================================
prompt
create table ROYSECITY.SR_RESOURCE_SH_CLASS
(
  campus_id      VARCHAR2(3),
  crs_nbr        VARCHAR2(4),
  max_stu        VARCHAR2(3),
  room_nbr       VARCHAR2(4),
  instr_id       VARCHAR2(3),
  restr_typ      CHAR(1),
  restr_sex      CHAR(1),
  restr_team     CHAR(1),
  restr_grd      VARCHAR2(2),
  restr_grd_addl CHAR(1),
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
prompt Creating table SR_RESOURCE_SH_PRDS
prompt ==================================
prompt
create table ROYSECITY.SR_RESOURCE_SH_PRDS
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  seq_nbr      CHAR(1),
  from_per     VARCHAR2(2),
  to_per       VARCHAR2(2),
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
prompt Creating table SR_RESOURCE_SH_SEMS
prompt ==================================
prompt
create table ROYSECITY.SR_RESOURCE_SH_SEMS
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  seq_nbr      CHAR(1),
  sem_pattern  VARCHAR2(2),
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
prompt Creating table SR_RPT_CARD_GRD
prompt ==============================
prompt
create table ROYSECITY.SR_RPT_CARD_GRD
(
  user_id           VARCHAR2(10),
  campus_id         VARCHAR2(3),
  stu_id            VARCHAR2(6),
  seq_num           NUMBER(5),
  sem_enroll        CHAR(1),
  crs_title         VARCHAR2(15),
  honors_crs        CHAR(1),
  per_begin         VARCHAR2(2),
  instr_name_l      VARCHAR2(25),
  grd_sem1_cyc1     VARCHAR2(3),
  grd_sem1_cyc2     VARCHAR2(3),
  grd_sem1_cyc3     VARCHAR2(3),
  grd_sem1_exam     VARCHAR2(3),
  grd_sem1_sem      VARCHAR2(3),
  grd_sem2_cyc1     VARCHAR2(3),
  grd_sem2_cyc2     VARCHAR2(3),
  grd_sem2_cyc3     VARCHAR2(3),
  grd_sem2_exam     VARCHAR2(3),
  grd_sem2_sem      VARCHAR2(3),
  grd_final         VARCHAR2(3),
  crs_credit        VARCHAR2(4),
  conduct_sem1_cyc1 CHAR(1),
  conduct_sem1_cyc2 CHAR(1),
  conduct_sem1_cyc3 CHAR(1),
  conduct_sem2_cyc1 CHAR(1),
  conduct_sem2_cyc2 CHAR(1),
  conduct_sem2_cyc3 CHAR(1),
  comments_cd_1     CHAR(1),
  comments_cd_2     CHAR(1),
  comments_cd_3     CHAR(1),
  comments_cd_4     CHAR(1),
  comments_cd_5     CHAR(1),
  abs_exc_cur_cyc   NUMBER(2),
  abs_exc_sem1      NUMBER(3),
  abs_exc_sem2      NUMBER(3),
  abs_exc_ytd       NUMBER(3),
  abs_unexc_cur_cyc NUMBER(2),
  abs_unexc_sem1    NUMBER(3),
  abs_unexc_sem2    NUMBER(3),
  abs_unexc_ytd     NUMBER(3),
  abs_sch_cur_cyc   NUMBER(2),
  abs_sch_sem1      NUMBER(3),
  abs_sch_sem2      NUMBER(3),
  abs_sch_ytd       NUMBER(3),
  tardy_cur_cyc     NUMBER(2),
  tardy_sem1        NUMBER(3),
  tardy_sem2        NUMBER(3),
  tardy_ytd         NUMBER(3),
  crs_nbr           VARCHAR2(4),
  sec_nbr           VARCHAR2(2),
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

prompt
prompt Creating table SR_RPT_CARD_STU
prompt ==============================
prompt
create table ROYSECITY.SR_RPT_CARD_STU
(
  user_id         VARCHAR2(10),
  campus_id       VARCHAR2(3),
  seq_num         NUMBER(5),
  stu_id          VARCHAR2(6),
  semester        CHAR(1),
  cycle           CHAR(1),
  stu_name        VARCHAR2(41),
  grd_lvl         VARCHAR2(2),
  cyr_ctrl_nbr    VARCHAR2(3),
  addr_line1      VARCHAR2(43),
  addr_line2      VARCHAR2(43),
  fail_msg        VARCHAR2(80),
  from_to_sch_yr  VARCHAR2(5),
  principal_name  VARCHAR2(32),
  campus_name     VARCHAR2(32),
  campus_addr1    VARCHAR2(54),
  campus_addr2    VARCHAR2(31),
  campus_phone    VARCHAR2(12),
  counselor_name  VARCHAR2(32),
  counselor_phone VARCHAR2(12),
  exam_flag       CHAR(1),
  sem_avg_flag    CHAR(1),
  fail_msg2       VARCHAR2(80),
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
prompt Creating table SR_SCHED_STU
prompt ===========================
prompt
create table ROYSECITY.SR_SCHED_STU
(
  campus_id      VARCHAR2(3),
  crs_nbr        VARCHAR2(4),
  from_sec       VARCHAR2(2),
  to_sec         VARCHAR2(2),
  seq_nbr        CHAR(1),
  common_meeting CHAR(1),
  prd_cond       CHAR(1),
  nbr_prd        VARCHAR2(2),
  prd_from       VARCHAR2(2),
  prd_to         VARCHAR2(2),
  sem_cond       CHAR(1),
  sem_nbr        CHAR(1),
  sem_pattern    VARCHAR2(2),
  days_pattern   VARCHAR2(2),
  nbr_days       CHAR(1),
  days_cond      CHAR(1),
  instr_cond     CHAR(1),
  instr_nbr      VARCHAR2(3),
  room_cond      CHAR(1),
  room_nbr       VARCHAR2(4),
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
prompt Creating table SR_SEC_CATEG
prompt ===========================
prompt
create table ROYSECITY.SR_SEC_CATEG
(
  campus_id    VARCHAR2(3),
  crs_nbr      VARCHAR2(4),
  sec_nbr      VARCHAR2(2),
  sem          CHAR(1),
  cyc          CHAR(1),
  typ          NUMBER,
  wgt          NUMBER(4),
  nbr_grd_drp  NUMBER(2),
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
prompt Creating table SR_SE_DEMO_CYR
prompt =============================
prompt
create table ROYSECITY.SR_SE_DEMO_CYR
(
  sch_yr                       VARCHAR2(4),
  stu_id                       VARCHAR2(6),
  sec_handi_cond_cd            VARCHAR2(2),
  ter_handi_cond_cd            VARCHAR2(2),
  multi_handi_cond_cd          CHAR(1),
  mental_retdtn_cd             CHAR(1),
  voc_ed_cd                    CHAR(1),
  dt_annual_review             VARCHAR2(8),
  dt_comp_assess_speech        VARCHAR2(8),
  dt_last_comp_assess          VARCHAR2(8),
  dt_hearing_exam              VARCHAR2(8),
  dt_med_exam                  VARCHAR2(8),
  dt_psych_exam                VARCHAR2(8),
  child_cnt_funding_typ        CHAR(1),
  early_childhd_interv_ind     CHAR(1),
  presch_pgm_child_disab       CHAR(1),
  contact_hrs_cd               CHAR(1),
  suppl_svc_cd                 CHAR(1),
  pri_pgm_cd                   CHAR(1),
  prof_prt_flg                 CHAR(1),
  cause_deaf_blind             CHAR(1),
  dt_visual_exam               VARCHAR2(8),
  vsn_loss_degree              VARCHAR2(2),
  left_eye_correct             VARCHAR2(9),
  right_eye_correct            VARCHAR2(9),
  degree_hear_loss             CHAR(1),
  etiology_cond                CHAR(1),
  fund_src                     CHAR(1),
  par_consent                  CHAR(1),
  read_lvl_aural               VARCHAR2(2),
  read_lvl_braille             VARCHAR2(2),
  read_lvl_lg_typ              VARCHAR2(2),
  read_lvl_other               CHAR(1),
  read_reg_typ                 VARCHAR2(2),
  registration_stat            CHAR(1),
  non_public_sch_name          VARCHAR2(20),
  adaptv_equip_ind             CHAR(1),
  art_thrpy_ind                CHAR(1),
  audiol_svc_ind               CHAR(1),
  corrctv_thrpy_ind            CHAR(1),
  couns_svc_ind                CHAR(1),
  sch_hlth_svc_ind             CHAR(1),
  instruct_ind                 CHAR(1),
  med_diag_ind                 CHAR(1),
  music_thrpy_ind              CHAR(1),
  occup_thrpy_ind              CHAR(1),
  orient_mob_ind               CHAR(1),
  par_trng_ind                 CHAR(1),
  physcl_thrpy_ind             CHAR(1),
  psych_svc_ind                CHAR(1),
  recre_thrpy_ind              CHAR(1),
  reg_day_sch_pgm_deaf         CHAR(1),
  soc_svc_ind                  CHAR(1),
  spec_seating_ind             CHAR(1),
  spec_transport_ind           CHAR(1),
  vsn_trng_ind                 CHAR(1),
  wheelchair_ind               CHAR(1),
  local_use1                   VARCHAR2(8),
  local_use2                   CHAR(1),
  local_use3                   CHAR(1),
  local_use4                   CHAR(1),
  local_use5                   CHAR(1),
  local_use6                   CHAR(1),
  local_use7                   CHAR(1),
  local_use8                   CHAR(1),
  local_use9                   CHAR(1),
  reg_day_sch_fiscal           VARCHAR2(6),
  curriculum_opt               CHAR(1),
  rehab_couns                  CHAR(1),
  dt_ref_initiated_reg_ed      VARCHAR2(8),
  dt_completed_rec_spec_ed     VARCHAR2(8),
  dt_genrl_notice_rights       VARCHAR2(8),
  dt_notice_preplac_assess     VARCHAR2(8),
  consent_preplac              VARCHAR2(8),
  init_preplac_assess          VARCHAR2(8),
  init_ard_commte_meet         VARCHAR2(8),
  preplac_assess_rpt           VARCHAR2(8),
  init_written_ard_commte_meet VARCHAR2(8),
  xfer_stu_2nd_ard_meet        VARCHAR2(8),
  iep_svc_init                 VARCHAR2(8),
  consent_init_placement       VARCHAR2(8),
  spec_ed_content_mastery      CHAR(1),
  adaptv_pe                    CHAR(1),
  most_recent_itp_dt           VARCHAR2(8),
  dt_placed_self_cont_sev      VARCHAR2(8),
  dt_moved_self_cont_mild      VARCHAR2(8),
  dt_from_self_cont_mild       VARCHAR2(8),
  yr_cnt_suppt_funds           VARCHAR2(4),
  assistive_tech               CHAR(1),
  interpretive_svcs            VARCHAR2(2),
  medically_fragile            CHAR(1),
  xtnd_yr_svc                  CHAR(1),
  eys                          CHAR(1),
  eys_hrs_spec_ed              VARCHAR2(4),
  eys_hrs_speech               VARCHAR2(4),
  r10_loaddate                 DATE
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
prompt Creating table SR_SE_INSTR_CYR
prompt ==============================
prompt
create table ROYSECITY.SR_SE_INSTR_CYR
(
  sch_yr       VARCHAR2(4),
  stu_id       VARCHAR2(6),
  se_instr_id  VARCHAR2(3),
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
prompt Creating table SR_SPEC_CREDITS
prompt ==============================
prompt
create table ROYSECITY.SR_SPEC_CREDITS
(
  sch_yr          VARCHAR2(4),
  stu_id          VARCHAR2(6),
  crs_nbr         VARCHAR2(4),
  crs_title       VARCHAR2(15),
  nbr_credits_crs VARCHAR2(3),
  generic_area_cd VARCHAR2(4),
  grad_typ_cd     VARCHAR2(2),
  credit_comments VARCHAR2(26),
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
prompt Creating table SR_SPEC_PGM_BIL_ESL
prompt ==================================
prompt
create table ROYSECITY.SR_SPEC_PGM_BIL_ESL
(
  sch_yr                 VARCHAR2(4),
  campus_id              VARCHAR2(3),
  stu_id                 VARCHAR2(6),
  dt_bil_esl_entry       VARCHAR2(8),
  bil_ind                CHAR(1),
  esl_ed_ind             CHAR(1),
  dt_bil_esl_wd          VARCHAR2(8),
  dt_bil_esl_entry_recip VARCHAR2(8),
  wd_rsn_cd              VARCHAR2(2),
  lep_ind                CHAR(1),
  par_perm_cd            CHAR(1),
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

prompt
prompt Creating table SR_SPEC_PGM_CHAP1
prompt ================================
prompt
create table ROYSECITY.SR_SPEC_PGM_CHAP1
(
  sch_yr                     VARCHAR2(4),
  stu_id                     VARCHAR2(6),
  campus_id                  VARCHAR2(3),
  tii_entry_dt               VARCHAR2(8),
  svc_cd                     VARCHAR2(2),
  tii_ind                    CHAR(1),
  par_involve_fund_cd        VARCHAR2(2),
  reading_instr_area_fund_cd VARCHAR2(2),
  math_instr_area_fund_cd    VARCHAR2(2),
  med_svcs_fund_cd           VARCHAR2(2),
  dental_svcs_fund_cd        VARCHAR2(2),
  nutrition_svcs_fund_cd     VARCHAR2(2),
  clothing_svcs_fund_cd      VARCHAR2(2),
  other_suppt_svcs_cd        VARCHAR2(2),
  eng_lim_instr_fund_cd      VARCHAR2(2),
  other_lang_arts_instr_fund VARCHAR2(2),
  other_instr_area_fund_cd   VARCHAR2(2),
  guid_couns_fund_cd         VARCHAR2(2),
  att_soc_wrk_fund_cd        VARCHAR2(2),
  tii_entry_dt_recip         VARCHAR2(8),
  tii_exit_dt                VARCHAR2(8),
  tii_wd_rsn                 VARCHAR2(2),
  homeless_cd                CHAR(1),
  read_cd                    CHAR(1),
  math_cd                    CHAR(1),
  science_cd                 CHAR(1),
  social_cd                  CHAR(1),
  guidance_cd                CHAR(1),
  social_wrk_cd              CHAR(1),
  health_cd                  CHAR(1),
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

prompt
prompt Creating table SR_SPEC_PGM_GT
prompt =============================
prompt
create table ROYSECITY.SR_SPEC_PGM_GT
(
  sch_yr            VARCHAR2(4),
  campus_id         VARCHAR2(3),
  stu_id            VARCHAR2(6),
  gt_entry_dt       VARCHAR2(8),
  gt_ind            CHAR(1),
  gt_ext_dt         VARCHAR2(8),
  gt_entry_recip_dt VARCHAR2(8),
  gt_wd_rsn_cd      VARCHAR2(2),
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

prompt
prompt Creating table SR_SPEC_PGM_OTHER
prompt ================================
prompt
create table ROYSECITY.SR_SPEC_PGM_OTHER
(
  sch_yr         VARCHAR2(4),
  wr_campus      VARCHAR2(3),
  stu_id         VARCHAR2(6),
  other_spec_pgm VARCHAR2(3),
  dt_entry       VARCHAR2(8),
  dt_wd          VARCHAR2(8),
  dt_entry_recip VARCHAR2(8),
  wd_rsn_cd      VARCHAR2(2),
  spec_cd1       CHAR(1),
  spec_cd2       VARCHAR2(2),
  spec_cd3       VARCHAR2(3),
  spec_cd4       VARCHAR2(4),
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
prompt Creating table SR_SPEC_PGM_PREG_PUPILS
prompt ======================================
prompt
create table ROYSECITY.SR_SPEC_PGM_PREG_PUPILS
(
  sch_yr              VARCHAR2(4),
  campus_id           VARCHAR2(3),
  stu_id              VARCHAR2(6),
  preg_pgm_entry_dt   VARCHAR2(8),
  preg_pupils_pgm_ind CHAR(1),
  preg_pgm_wd_dt      VARCHAR2(8),
  preg_entry_recip_dt VARCHAR2(8),
  wd_rsn_cd           VARCHAR2(2),
  cehi_ind            CHAR(1),
  pep_ind             CHAR(1),
  voced_elig          CHAR(1),
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

prompt
prompt Creating table SR_SPEC_PGM_SPEC_ED
prompt ==================================
prompt
create table ROYSECITY.SR_SPEC_PGM_SPEC_ED
(
  sch_yr             VARCHAR2(4),
  campus_id          VARCHAR2(3),
  stu_id             VARCHAR2(6),
  dt_entry_stu       VARCHAR2(8),
  pri_handi_ind      VARCHAR2(2),
  instruct_set_cd    VARCHAR2(2),
  speech_thrpy_ind   CHAR(1),
  dt_wd              VARCHAR2(8),
  dt_entry_stu_recip VARCHAR2(8),
  wd_rsn_cd          VARCHAR2(2),
  voc_hrs_elig       CHAR(1),
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

prompt
prompt Creating table SR_STU_AT_RISK
prompt =============================
prompt
create table ROYSECITY.SR_STU_AT_RISK
(
  sch_yr                       VARCHAR2(4),
  stu_id                       VARCHAR2(6),
  parent                       CHAR(1),
  at_risk                      CHAR(1),
  tot_at_risk_pts              VARCHAR2(2),
  elem_factor1                 CHAR(1),
  elem_factor2                 CHAR(1),
  elem_satis_test_score        CHAR(1),
  scnd_essential_elem          CHAR(1),
  scnd_below_grd_lvl           CHAR(1),
  homeless                     CHAR(1),
  other_rsn                    CHAR(1),
  read_test                    CHAR(1),
  bypass_flg                   CHAR(1),
  test_grd_lvl                 VARCHAR2(2),
  fail_2_crs_sem               CHAR(1),
  homeless_resid_placement     VARCHAR2(6),
  satis_tst_scores_pk_03       CHAR(1),
  satis_tst_scores_pk_03_doc   CHAR(1),
  fail_2_crs_sem_doc           CHAR(1),
  nbr_times_failed_doc         CHAR(1),
  satis_perf_taks_110_rule     CHAR(1),
  satis_perf_taks_110_rule_doc CHAR(1),
  preg_pupils_pgm_ind_doc      CHAR(1),
  daep_curr_prior_yrs          CHAR(1),
  daep_curr_prior_yrs_doc      CHAR(1),
  expelled_curr_prior_yr       CHAR(1),
  expelled_curr_prior_yr_doc   CHAR(1),
  judicial_release             CHAR(1),
  judicial_release_doc         CHAR(1),
  previous_dropout             CHAR(1),
  previous_dropout_doc         CHAR(1),
  lep_ind_doc                  CHAR(1),
  protective_serv_ref          CHAR(1),
  protective_serv_ref_doc      CHAR(1),
  homeless_doc                 CHAR(1),
  homeless_resid_placement_doc CHAR(1),
  preg_pupils_pgm_ind          CHAR(1),
  user1_1                      CHAR(1),
  user2_1                      CHAR(1),
  user3_3                      VARCHAR2(3),
  user4_3                      VARCHAR2(3),
  user5_8                      VARCHAR2(8),
  r10_loaddate                 DATE
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
prompt Creating table SR_STU_CAMPUS
prompt ============================
prompt
create table ROYSECITY.SR_STU_CAMPUS
(
  sch_yr        VARCHAR2(4),
  stu_id        VARCHAR2(6),
  campus_id     VARCHAR2(3),
  cyr_ctrl_nbr  VARCHAR2(3),
  nyr_ctrl_nbr  VARCHAR2(3),
  here_last_yr  CHAR(1),
  recomp_flg    CHAR(1),
  campus_id_nyr VARCHAR2(3),
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
prompt Creating table SR_STU_DEMO
prompt ==========================
prompt
create table ROYSECITY.SR_STU_DEMO
(
  sch_yr                       VARCHAR2(4),
  stu_id                       VARCHAR2(6),
  sex                          CHAR(1),
  grad_plan_cd                 VARCHAR2(2),
  counselor_nbr_stu            VARCHAR2(3),
  birth_place_city             VARCHAR2(17),
  birth_place_state_cd         VARCHAR2(2),
  dob                          VARCHAR2(8),
  ethn                         CHAR(1),
  locker_combntn1              VARCHAR2(9),
  locker_nbr                   VARCHAR2(6),
  out_state_elig_cd            CHAR(1),
  stu_phone_ac                 VARCHAR2(3),
  phone_nbr                    VARCHAR2(7),
  addr_tel_dir_rstrctd_flg     CHAR(1),
  str_nbr_phys                 VARCHAR2(6),
  str_name_phys                VARCHAR2(19),
  apt_nbr_phys_addr            VARCHAR2(7),
  city_name_phys_addr          VARCHAR2(17),
  zip_code_phys_addr           VARCHAR2(5),
  zip4_phys_addr               VARCHAR2(4),
  phys_addr_state              VARCHAR2(2),
  rqst_chg_flg                 CHAR(1),
  neighborhood_cd_stu          VARCHAR2(4),
  str_drctn_phys               VARCHAR2(2),
  nbr_times_failed             CHAR(1),
  last_grd_failed              VARCHAR2(2),
  lang_pri                     VARCHAR2(2),
  yr_last_failed               VARCHAR2(4),
  entry_dist_stu               VARCHAR2(8),
  last_yr_campus               VARCHAR2(3),
  campus_cd_prv                VARCHAR2(3),
  local_use_cd1                CHAR(1),
  local_use_cd2                CHAR(1),
  local_use_cd3                CHAR(1),
  local_use_cd4                CHAR(1),
  magnet_nyr                   CHAR(1),
  magnet_this_yr               CHAR(1),
  nslp                         CHAR(1),
  recs_forward_to              VARCHAR2(3),
  recs_rqstd_cd                VARCHAR2(2),
  second_home_lang_cd          VARCHAR2(2),
  spec_func                    CHAR(1),
  spec_func2                   CHAR(1),
  par_fed_connect              CHAR(1),
  par_military                 CHAR(1),
  immigrant_trking_fund        VARCHAR2(2),
  amnesty_nbr                  VARCHAR2(8),
  dt_amnesty_nbr               VARCHAR2(8),
  dt_grd_8_entry               VARCHAR2(8),
  dt_grd_9_entry               VARCHAR2(8),
  spec_pgm_bsm_lau             CHAR(1),
  spec_pgm_part_math           CHAR(1),
  continuous_enroll            CHAR(1),
  alien_tuition_cd             CHAR(1),
  test_dt_bsm                  VARCHAR2(8),
  test_dt_english              VARCHAR2(8),
  test_dt_spanish              VARCHAR2(8),
  test_score_spanish           VARCHAR2(3),
  test_typ_spanish             VARCHAR2(3),
  lep_ind                      CHAR(1),
  test_score_english           VARCHAR2(3),
  test_typ_english             VARCHAR2(3),
  spec_pgm_headstart           CHAR(1),
  state_comp_reading           CHAR(1),
  state_comp_math              CHAR(1),
  spec_pgm_part_cai            CHAR(1),
  state_comp_pk_yr             CHAR(1),
  spec_pgm_part_arp            CHAR(1),
  spec_pgm_chap2_mem           CHAR(1),
  spec_pgm_eddis_lang          CHAR(1),
  spec_pgm_eddis_math          CHAR(1),
  spec_pgm_eddis_read          CHAR(1),
  chap1_pk_yr                  CHAR(1),
  spec_pgm_undefined           CHAR(1),
  rolodex_ind                  CHAR(1),
  state_comp                   CHAR(1),
  locker_comb2                 VARCHAR2(9),
  state_cd_par2                VARCHAR2(2),
  dt_grd_5_entry               VARCHAR2(8),
  first_grd_transtnl_yr        VARCHAR2(4),
  last_yr_grd                  VARCHAR2(2),
  xfer_factor_nyr              CHAR(1),
  xfer_factor                  CHAR(1),
  att_impact                   CHAR(1),
  cumulative_gpa               NUMBER(10,5),
  cumulative_rank              NUMBER(3),
  cumulative_tot_nbr_stu       NUMBER(3),
  att_ltr_dt                   VARCHAR2(8),
  tii_orig_entry_dt            VARCHAR2(8),
  prev_dist                    VARCHAR2(8),
  par_svc_cd                   CHAR(1),
  par_svc_rank                 VARCHAR2(3),
  medicaid_elig                CHAR(1),
  birth_country_cd             VARCHAR2(2),
  dt_ranking                   VARCHAR2(8),
  quartile                     CHAR(1),
  reading_ela_mstry_dt         VARCHAR2(6),
  writing_mstry_dt             VARCHAR2(6),
  math_mstry_dt                VARCHAR2(6),
  social_studies_mstry_dt      VARCHAR2(6),
  science_mstry_dt             VARCHAR2(6),
  pk_foster                    CHAR(1),
  exit_reading_ela_mstry_dt    VARCHAR2(6),
  exit_math_mstry_dt           VARCHAR2(6),
  exit_social_studies_mstry_dt VARCHAR2(6),
  exit_science_mstry_dt        VARCHAR2(6),
  ethn_hispanic                CHAR(1),
  race_amer_indian             CHAR(1),
  race_asian                   CHAR(1),
  race_black                   CHAR(1),
  race_white                   CHAR(1),
  race_pacific_isl             CHAR(1),
  r10_loaddate                 DATE
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
prompt Creating table SR_STU_DEMO_PEIMS
prompt ================================
prompt
create table ROYSECITY.SR_STU_DEMO_PEIMS
(
  sch_yr                     VARCHAR2(4),
  stu_id                     VARCHAR2(6),
  day_care_voc_suppt_svc     CHAR(1),
  wrk_study_voc_suppt_svc    CHAR(1),
  econ_disadv_cd             VARCHAR2(2),
  sgl_par_preg_teen          CHAR(1),
  genrl_intelect_ability_ind CHAR(1),
  specific_subj_matter_apttd CHAR(1),
  creative_prod_thinking     CHAR(1),
  leadership_abil            CHAR(1),
  county_resid               VARCHAR2(3),
  immigrant_ind              CHAR(1),
  home_lang_cd               VARCHAR2(2),
  par_perm_cd                CHAR(1),
  peims_drout_exit_rsn1      VARCHAR2(2),
  peims_drout_exit_rsn2      VARCHAR2(2),
  peims_drout_exit_rsn3      VARCHAR2(2),
  per_drout_cd               CHAR(1),
  grd_lvl_drout              VARCHAR2(2),
  msrts_id_nbr               VARCHAR2(11),
  migrant_status_cd          CHAR(1),
  xfer_crs                   CHAR(1),
  par_perm_dt                VARCHAR2(8),
  couns_svc_ind              CHAR(1),
  cate_ind                   CHAR(1),
  college_entry_ind          CHAR(1),
  grad_typ_cd                VARCHAR2(2),
  proposed_dt_grad           VARCHAR2(8),
  demo_rev_confirm           CHAR(1),
  alien_ind                  CHAR(1),
  refugee_ind                CHAR(1),
  par_perm_denial_dt         VARCHAR2(8),
  transport_voc_suppt        CHAR(1),
  taas_exempt_cd_read        CHAR(1),
  taas_exempt_cd_writing     CHAR(1),
  taas_exempt_cd_math        CHAR(1),
  taas_exempt_cd_sci         CHAR(1),
  taas_exempt_cd_soc_sci     CHAR(1),
  neglected_delinquent_ind   CHAR(1),
  rptd_campus_id_enroll      VARCHAR2(9),
  yrend_status_ind           VARCHAR2(2),
  retnt_transit_rsn1         VARCHAR2(2),
  retnt_transit_rsn2         VARCHAR2(2),
  retnt_transit_rsn3         VARCHAR2(2),
  oeyp                       CHAR(1),
  campus_id_account          VARCHAR2(9),
  oeyp_retntn_cd             VARCHAR2(2),
  bil_esl_summer_ind         CHAR(1),
  ssi_promo_retntn_cd        VARCHAR2(2),
  even_start_ind             CHAR(1),
  yrs_usa_cd                 CHAR(1),
  lep_monitoring             CHAR(1),
  oeyp_days_taught           VARCHAR2(3),
  oeyp_days_abs              VARCHAR2(3),
  oeyp_elig_days_prsnt       VARCHAR2(3),
  dt_cert_crswrk             VARCHAR2(8),
  displc_hmkr_cd             CHAR(1),
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

prompt
prompt Creating table SR_STU_ENROLL
prompt ============================
prompt
create table ROYSECITY.SR_STU_ENROLL
(
  sch_yr             VARCHAR2(4),
  campus_id          VARCHAR2(3),
  stu_id             VARCHAR2(6),
  dt_entry           VARCHAR2(8),
  campus_id_nyr      VARCHAR2(3),
  grd_lvl            VARCHAR2(2),
  dt_withdraw        VARCHAR2(8),
  withdraw_cd        VARCHAR2(2),
  cyr_loc_restr      CHAR(1),
  elig_cd            CHAR(1),
  nyr_loc_restr      CHAR(1),
  active_cd          CHAR(1),
  status_cd          CHAR(1),
  exclusion_cd       CHAR(1),
  addr_str_nbr       VARCHAR2(6),
  addr_str_name      VARCHAR2(19),
  addr_apt_nbr       VARCHAR2(7),
  addr_city          VARCHAR2(17),
  addr_state         VARCHAR2(2),
  addr_zip           VARCHAR2(5),
  addr_zip4          VARCHAR2(4),
  state_stu_id_prior VARCHAR2(9),
  ssan_denied        CHAR(1),
  name_l             VARCHAR2(25),
  name_f             VARCHAR2(17),
  name_m             VARCHAR2(14),
  name_gen_cd        CHAR(1),
  dt_entry_recip     VARCHAR2(8),
  state_stu_id       VARCHAR2(9),
  dt_last_chg        VARCHAR2(8),
  addr_str_dir       VARCHAR2(2),
  sub_campus         VARCHAR2(3),
  dt_orig_entry      VARCHAR2(8),
  att_trk            CHAR(1),
  name_stu_goes_by   VARCHAR2(9),
  attribution_cd     VARCHAR2(2),
  campus_id_res      VARCHAR2(9),
  has_scnd_campus    CHAR(1),
  primary_campus     VARCHAR2(3),
  voced_elig         CHAR(1),
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
create bitmap index ROYSECITY.BMI_SR_STU_ENROLL_ATT_TRK on ROYSECITY.SR_STU_ENROLL (ATT_TRK)
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
create bitmap index ROYSECITY.BMI_SR_STU_ENROLL_CAMPUS_ID on ROYSECITY.SR_STU_ENROLL (CAMPUS_ID)
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
create bitmap index ROYSECITY.BMI_SR_STU_ENROLL_DT_ENTRY on ROYSECITY.SR_STU_ENROLL (DT_ENTRY)
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
create bitmap index ROYSECITY.BMI_SR_STU_ENROLL_SCHL_YR on ROYSECITY.SR_STU_ENROLL (SCH_YR)
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
create bitmap index ROYSECITY.BMI_SR_STU_ENROLL_STU_ID on ROYSECITY.SR_STU_ENROLL (STU_ID)
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
prompt Creating table SR_STU_LEAVER
prompt ============================
prompt
create table ROYSECITY.SR_STU_LEAVER
(
  sch_yr                   VARCHAR2(4),
  stu_id                   VARCHAR2(6),
  no_show                  CHAR(1),
  campus_id                VARCHAR2(3),
  state_stu_id             VARCHAR2(9),
  name_f                   VARCHAR2(17),
  name_m                   VARCHAR2(14),
  name_l                   VARCHAR2(25),
  gen                      CHAR(1),
  sex                      CHAR(1),
  ethn                     CHAR(1),
  dob                      VARCHAR2(8),
  as_of_status             CHAR(1),
  campus_id_of_resid       VARCHAR2(9),
  prior_state_stu_id       VARCHAR2(9),
  demo_rev_cd              CHAR(1),
  attribution_cd           VARCHAR2(2),
  grd_lvl                  VARCHAR2(2),
  migrant_ind              CHAR(1),
  even_strt_ind            CHAR(1),
  se_ind                   CHAR(1),
  econ_disadv              VARCHAR2(2),
  withdraw_cd              VARCHAR2(2),
  proposed_dt_grad         VARCHAR2(8),
  grad_typ_cd              VARCHAR2(2),
  college_entry            CHAR(1),
  exclude_from_peims_rptng CHAR(1),
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

prompt
prompt Creating table SR_STU_MIGRANT
prompt =============================
prompt
create table ROYSECITY.SR_STU_MIGRANT
(
  sch_yr                   VARCHAR2(4),
  stu_id                   VARCHAR2(6),
  birth_place_country      VARCHAR2(12),
  birth_verification       CHAR(1),
  multi_birth              CHAR(1),
  str_nbr_homebase         VARCHAR2(6),
  str_name_homebase        VARCHAR2(19),
  apt_nbr_addr_homebase    VARCHAR2(7),
  city_name_homebase       VARCHAR2(17),
  state_cd_homebase        VARCHAR2(2),
  zip_homebase             VARCHAR2(5),
  homebase_zip4            VARCHAR2(4),
  city_name_from           VARCHAR2(17),
  state_name_from          VARCHAR2(2),
  name_l_worker            VARCHAR2(25),
  name_f_worker            VARCHAR2(17),
  name_m_worker            CHAR(1),
  gen_worker               CHAR(1),
  designated_grad_sch      VARCHAR2(3),
  dt_lqm                   VARCHAR2(8),
  dt_end_migrant_elig      VARCHAR2(8),
  dt_certfd_elig_migrant   VARCHAR2(8),
  dt_migrant_info_sent_esc VARCHAR2(8),
  dt_migrant_info_rcvd     VARCHAR2(8),
  dt_migrant_info_dist     VARCHAR2(8),
  dt_wd_data_sent_esc      VARCHAR2(8),
  dt_desgntd_high_sch      VARCHAR2(8),
  dt_fall_crs              VARCHAR2(8),
  dt_fall_grds             VARCHAR2(8),
  dt_spring_sched          VARCHAR2(8),
  dt_spring_grds           VARCHAR2(8),
  dt_recmnd_sched          VARCHAR2(8),
  dt_immunz_sent           VARCHAR2(8),
  dt_scrng_sent            VARCHAR2(8),
  dt_hlth_problems_sent    VARCHAR2(8),
  dt_spec_ed_sent          VARCHAR2(8),
  dt_early_child           VARCHAR2(8),
  dt_reading               VARCHAR2(8),
  dt_math                  VARCHAR2(8),
  dt_oral_lang             VARCHAR2(8),
  math_pgm                 CHAR(1),
  reading_pgm              CHAR(1),
  writing_pgm              CHAR(1),
  esol_pgm                 CHAR(1),
  country_homebase         VARCHAR2(12),
  worker_relationship      VARCHAR2(2),
  lqm_from_city            VARCHAR2(17),
  lqm_from_state           VARCHAR2(2),
  lqm_from_country         VARCHAR2(12),
  lqm_to_city              VARCHAR2(17),
  lqm_to_state             VARCHAR2(2),
  typ_wrk                  VARCHAR2(20),
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

prompt
prompt Creating table SR_STU_MISC
prompt ==========================
prompt
create table ROYSECITY.SR_STU_MISC
(
  sch_yr                  VARCHAR2(4),
  stu_id                  VARCHAR2(6),
  clear_txt_addr          VARCHAR2(40),
  dist_prv                VARCHAR2(13),
  sch_last_att_stu        VARCHAR2(24),
  str_nbr_sch_prv         VARCHAR2(6),
  str_name_sch_prv        VARCHAR2(19),
  city_name_sch_prv       VARCHAR2(17),
  state_cd_campus         VARCHAR2(2),
  zip_sch_prv             VARCHAR2(5),
  zip4                    VARCHAR2(4),
  name_addr_employer_cd   VARCHAR2(2),
  name_employer_cd        VARCHAR2(2),
  addr_employer_cd        VARCHAR2(2),
  fed_property_cd         VARCHAR2(2),
  fed_relate_cd           CHAR(1),
  dt_prov_enroll_expir    VARCHAR2(8),
  dt_prov_enroll_followup VARCHAR2(8),
  spec_credits_cyc1       CHAR(1),
  spec_credits_cyc2       CHAR(1),
  spec_credits_cyc3       CHAR(1),
  spec_credits_cyc4       CHAR(1),
  spec_credits_cyc5       CHAR(1),
  spec_credits_cyc6       CHAR(1),
  bus_dropoff_dist_assgnd CHAR(1),
  bus_dropoff_route       VARCHAR2(6),
  bus_dropoff_stop_blk    VARCHAR2(6),
  bus_elig_flg            CHAR(1),
  bus_pickup_dist_assgnd  CHAR(1),
  bus_pickup_route        VARCHAR2(6),
  bus_pickup_stop_blk     VARCHAR2(6),
  bus_route               VARCHAR2(3),
  bus_run_nbr             CHAR(1),
  bus_seat_nbr            VARCHAR2(3),
  bus_data_att_oct        CHAR(1),
  bus_data_att_nov        CHAR(1),
  bus_data_att_dec        CHAR(1),
  bus_data_att_jan        CHAR(1),
  bus_data_att_feb        CHAR(1),
  bus_data_att_mar        CHAR(1),
  tx_gr_elg               CHAR(1),
  taas_taks_ind           CHAR(1),
  r10_loaddate            DATE
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
prompt Creating table SR_STU_YRLY_ATT_ABS
prompt ==================================
prompt
create table ROYSECITY.SR_STU_YRLY_ATT_ABS
(
  sch_yr         VARCHAR2(4),
  stu_id         VARCHAR2(6),
  prv_yr_abs_ytd VARCHAR2(3),
  prv_yr_att_ytd VARCHAR2(3),
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
prompt Creating table SR_TEACHER_ADD_DROP
prompt ==================================
prompt
create table ROYSECITY.SR_TEACHER_ADD_DROP
(
  sch_yr              VARCHAR2(4),
  campus_id_enroll    VARCHAR2(3),
  date_add_drop_trans VARCHAR2(8),
  instr_id_nbr        VARCHAR2(3),
  sem_trans           CHAR(1),
  stu_id              VARCHAR2(6),
  crs_nbr             VARCHAR2(4),
  sec_nbr             VARCHAR2(2),
  add_drop_cd         CHAR(1),
  dt_of_trans         VARCHAR2(8),
  per_day             VARCHAR2(2),
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

prompt
prompt Creating table SSCHINFO
prompt =======================
prompt
create table ROYSECITY.SSCHINFO
(
  schaddr1     VARCHAR2(35),
  schaddr2     VARCHAR2(35),
  schcity      VARCHAR2(35),
  schcountry   VARCHAR2(15),
  schcounty    VARCHAR2(15),
  schdisnum    VARCHAR2(5),
  schdistype   VARCHAR2(15),
  schemailid   VARCHAR2(39),
  schfax       VARCHAR2(21),
  schfax2      VARCHAR2(21),
  schflunch    CHAR(1),
  schinstday   NUMBER(5),
  schname      VARCHAR2(51),
  schnmcode    VARCHAR2(9),
  schnoninst   NUMBER(5),
  schoolid     VARCHAR2(9),
  schorgnum    VARCHAR2(5),
  schphone     VARCHAR2(21),
  schphone2    VARCHAR2(21),
  schprincpl   VARCHAR2(83),
  schprtitle   VARCHAR2(29),
  schrlunch    CHAR(1),
  schstate     VARCHAR2(29),
  schyearend   DATE,
  schyearsta   DATE,
  schzipcode   VARCHAR2(13),
  idcity       NUMBER(11),
  idcountry    NUMBER(11),
  idcounty     NUMBER(11),
  idschlicns   NUMBER,
  idschname    NUMBER(11),
  idstate      NUMBER(11),
  idtitledcn   NUMBER(11),
  idtitleprn   NUMBER(11),
  sch2linead   CHAR(3),
  schcemail    VARCHAR2(39),
  schcfax      VARCHAR2(21),
  schcfax2     VARCHAR2(21),
  schcfirstn   VARCHAR2(31),
  schclastn    VARCHAR2(31),
  schcmidln    VARCHAR2(31),
  schcphone    VARCHAR2(21),
  schcphone2   VARCHAR2(21),
  schctitle    VARCHAR2(29),
  schedmdcls   CHAR(1),
  schwdafter   CHAR(1),
  r10_loaddate DATE
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
create unique index ROYSECITY.PK_SSCHINFO on ROYSECITY.SSCHINFO (SCHOOLID)
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
prompt Creating table SSCHPEIM
prompt =======================
prompt
create table ROYSECITY.SSCHPEIM
(
  sspmatdprd   NUMBER(2),
  sspmtitle1   VARCHAR2(23),
  idpmatdprd   NUMBER(11),
  idpmtitle1   NUMBER(11),
  idschlicns   NUMBER(6),
  idschpeim    NUMBER(11),
  schoolid     VARCHAR2(9),
  sspmcoldef   CHAR(1) not null,
  r10_loaddate DATE
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
prompt Creating table STDBIESL
prompt =======================
prompt
create table ROYSECITY.STDBIESL
(
  schoolid     VARCHAR2(9),
  spmesl       VARCHAR2(3),
  spmeslcomm   VARCHAR2(101),
  spmesldate   DATE,
  stdnumber    VARCHAR2(15),
  idschlicns   NUMBER(6),
  idstdberec   NUMBER(16),
  idstudent    NUMBER(11) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STDBIESL_SCHOOLID on ROYSECITY.STDBIESL (SCHOOLID)
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
prompt Creating table STDGFTAL
prompt =======================
prompt
create table ROYSECITY.STDGFTAL
(
  idschlicns   NUMBER(6),
  idstdgtrec   NUMBER(16),
  idstudent    NUMBER(11),
  schoolid     VARCHAR2(9),
  spmgftal     VARCHAR2(3),
  spmgtcomm    VARCHAR2(101),
  spmgtdate    DATE,
  stdnumber    VARCHAR2(15) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STDGFTAL_SCHOOLID on ROYSECITY.STDGFTAL (SCHOOLID)
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
prompt Creating table STDPEIMS
prompt =======================
prompt
create table ROYSECITY.STDPEIMS
(
  spmeepkind   CHAR(1),
  spmmulthcp   CHAR(1),
  idchildcf    NUMBER(11),
  idcrtech     NUMBER(11),
  idecdisad    NUMBER(11),
  idparperm    NUMBER(11),
  idpmtitle    NUMBER(11),
  idrgndays    NUMBER(11),
  idschlicns   NUMBER(6),
  idstgener    NUMBER(11),
  idstudent    NUMBER(11),
  schoolid     VARCHAR2(9),
  spmareains   VARCHAR2(29),
  spmasct1fc   VARCHAR2(29),
  spmastchi    CHAR(1),
  spmatrisk    CHAR(1),
  spmattrcod   VARCHAR2(29),
  spmaudios    CHAR(1),
  spmcampres   VARCHAR2(51),
  spmcartech   VARCHAR2(29),
  spmchildcf   VARCHAR2(29),
  spmcltt1fc   VARCHAR2(29),
  spmcolgen    CHAR(1),
  spmcounsl    CHAR(1),
  spmdaycare   CHAR(1),
  spmdent1fc   VARCHAR2(29),
  spmecdisad   VARCHAR2(29),
  spmechildh   CHAR(1),
  spmeslprg    CHAR(1),
  spmguit1fc   VARCHAR2(29),
  spmhealth    CHAR(1),
  spmhomeles   CHAR(1),
  spmimmignt   CHAR(1),
  spmincpeim   CHAR(1),
  spmintsvcs   CHAR(1),
  spmlartins   VARCHAR2(29),
  spmlimengl   CHAR(1),
  spmltdengl   VARCHAR2(29),
  spmlxbdate   DATE,
  spmlxethni   VARCHAR2(29),
  spmlxfrstn   VARCHAR2(31),
  spmlxgendr   VARCHAR2(1),
  spmlxgener   VARCHAR2(29),
  spmlxlastn   VARCHAR2(31),
  spmlxmidn    VARCHAR2(31),
  spmlxssn     VARCHAR2(13),
  spmmath      CHAR(1),
  spmmathins   VARCHAR2(29),
  spmmeddiag   CHAR(1),
  spmmedfrag   CHAR(1),
  spmmedt1fc   VARCHAR2(29),
  spmmigrant   CHAR(1),
  spmnutt1fc   VARCHAR2(29),
  spmoccupth   CHAR(1),
  spmorientm   CHAR(1),
  spmotht1fc   VARCHAR2(29),
  spmparstat   VARCHAR2(20),
  spmpart1fc   VARCHAR2(29),
  spmpermprg   VARCHAR2(29),
  spmpreschl   CHAR(1),
  spmpsychos   CHAR(1),
  spmpyhsth    CHAR(1),
  spmreading   CHAR(1),
  spmreadins   VARCHAR2(29),
  spmrecrth    CHAR(1),
  spmregnday   VARCHAR2(29),
  spmschhlth   CHAR(1),
  spmscience   CHAR(1),
  spmsechcp    VARCHAR2(29),
  spmsocials   CHAR(1),
  spmsocwork   CHAR(1),
  spmsowork    CHAR(1),
  spmstbdate   DATE,
  spmstethni   VARCHAR2(29),
  spmstfrstn   VARCHAR2(31),
  spmstgendr   VARCHAR2(1),
  spmstgener   VARCHAR2(29),
  spmstlastn   VARCHAR2(31),
  spmstmidn    VARCHAR2(31),
  spmstssn     VARCHAR2(13),
  spmsupguid   CHAR(1),
  spmterthcp   VARCHAR2(29),
  spmtitle1a   VARCHAR2(28),
  spmtransp    CHAR(1),
  spmtranspo   CHAR(1),
  spmwrkstud   CHAR(1),
  stdnumber    VARCHAR2(15) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STDPEIMS_SCHOOLID on ROYSECITY.STDPEIMS (SCHOOLID)
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
prompt Creating table STDPRDIS
prompt =======================
prompt
create table ROYSECITY.STDPRDIS
(
  schoolid     VARCHAR2(9),
  spmpdcomm    VARCHAR2(101),
  spmpddate    DATE,
  spmpridis    VARCHAR2(29),
  stdnumber    VARCHAR2(15),
  idhandcnd    NUMBER(11),
  idschlicns   NUMBER(6),
  idstdpdrec   NUMBER(16),
  idstudent    NUMBER(11) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STDPRDIS_SCHOOLID on ROYSECITY.STDPRDIS (SCHOOLID)
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
prompt Creating table STUDCAL
prompt ======================
prompt
create table ROYSECITY.STUDCAL
(
  sdaydlyatd   VARCHAR2(11),
  daydate      DATE,
  schoolid     VARCHAR2(9),
  sdayactive   CHAR(1),
  sdayprhand   VARCHAR2(4),
  sdaystatus   VARCHAR2(5),
  sdayadael    VARCHAR2(31),
  sdayinstr    VARCHAR2(37),
  sdaysingl    VARCHAR2(3),
  sdayspech    VARCHAR2(29),
  iddailyatd   NUMBER(11),
  idschlicns   NUMBER(6),
  idsdayada    NUMBER(11),
  idsdaycd1    NUMBER(11),
  idsdaycd2    NUMBER(11),
  idsdaycd3    NUMBER(11),
  idsdaycd4    NUMBER(11),
  idsdaycd5    NUMBER(11),
  idsdaycd6    NUMBER(11),
  idsdayinst   NUMBER(11),
  idsdaysing   NUMBER(11),
  idsdayspch   NUMBER(11),
  idstatus     NUMBER(11),
  idstudent    NUMBER(11),
  sdaybiesl    VARCHAR2(3),
  sdayctech    VARCHAR2(16),
  sdaygftal    VARCHAR2(3) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STUDCAL_SCHOOLID on ROYSECITY.STUDCAL (SCHOOLID)
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
create bitmap index ROYSECITY.BIX_STUDCAL_SDAYACTIVE on ROYSECITY.STUDCAL (SDAYACTIVE)
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
create bitmap index ROYSECITY.BIX_STUDCAL_SDAYACTIVE_ACTIVE on ROYSECITY.STUDCAL (SCHOOLID, SDAYACTIVE)
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
prompt Creating table STUDCTBL
prompt =======================
prompt
create table ROYSECITY.STUDCTBL
(
  dayschterm   NUMBER(2),
  fromdate     DATE,
  idclass      NUMBER(11),
  idcourse     NUMBER(11),
  idschlicns   NUMBER(6),
  idstudent    NUMBER(11),
  mkclssctn    NUMBER(5),
  schoolid     VARCHAR2(9),
  timeslot     NUMBER(5),
  todate       DATE not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STUDCTBL_SCHOOLID on ROYSECITY.STUDCTBL (SCHOOLID)
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
prompt Creating table STUDDEMO
prompt =======================
prompt
create table ROYSECITY.STUDDEMO
(
  schoolid     VARCHAR2(9),
  stdactive    CHAR(1),
  stdaltnum    VARCHAR2(15),
  stdautodok   CHAR(1),
  stdbirth     DATE,
  stdbirthct   VARCHAR2(5),
  stdbirthpl   VARCHAR2(29),
  stdcallamb   CHAR(1),
  stdcalldr    CHAR(1),
  stddiscode   VARCHAR2(17),
  stddoctor    VARCHAR2(53),
  stddraddr1   VARCHAR2(35),
  stddraddr2   VARCHAR2(35),
  stddrcity    VARCHAR2(35),
  stddrhphn    VARCHAR2(21),
  stddrhphn2   VARCHAR2(21),
  stddrstate   VARCHAR2(29),
  stddrwphn    VARCHAR2(21),
  stddrwphn2   VARCHAR2(21),
  stddrzip     VARCHAR2(13),
  stdelemsch   VARCHAR2(51),
  stdenroll    DATE,
  stdethnic    VARCHAR2(29),
  stdfamnum    NUMBER(9),
  stdfamunit   VARCHAR2(3),
  stdfirstn    VARCHAR2(31),
  stdfldtrip   VARCHAR2(5),
  stdgender    VARCHAR2(1),
  stdgrade     VARCHAR2(17),
  stdgradsch   VARCHAR2(51),
  stdgraduat   CHAR(1),
  stdgradyr    NUMBER(4),
  stdhmlang    VARCHAR2(29),
  stdhomesch   VARCHAR2(51),
  stdhonroll   CHAR(1),
  stdhphone    VARCHAR2(21),
  stdhphone2   VARCHAR2(21),
  stdhroom     VARCHAR2(7),
  stdimmune    VARCHAR2(29),
  stdinactdt   DATE,
  stdistreat   CHAR(1),
  stdjrhgsch   VARCHAR2(51),
  stdlastn     VARCHAR2(31),
  stdlglalrt   VARCHAR2(121),
  stdlglname   VARCHAR2(53),
  stdlineage   VARCHAR2(29),
  stdlivewth   VARCHAR2(21),
  stdlockerc   VARCHAR2(11),
  stdlockern   VARCHAR2(7),
  stdlunch     VARCHAR2(29),
  stdmaddr1    VARCHAR2(35),
  stdmaddr2    VARCHAR2(35),
  stdmarea     VARCHAR2(15),
  stdmcity     VARCHAR2(35),
  stdmcounty   VARCHAR2(15),
  stdmedalrt   VARCHAR2(254),
  stdmedinum   VARCHAR2(13),
  stdmiddlen   VARCHAR2(31),
  stdmstate    VARCHAR2(29),
  stdmzip      VARCHAR2(13),
  stdnextsch   VARCHAR2(51),
  stdnprog     VARCHAR2(29),
  stdnumber    VARCHAR2(15),
  stdorgenrl   DATE,
  stdpaddr1    VARCHAR2(35),
  stdpaddr2    VARCHAR2(35),
  stdparea     VARCHAR2(15),
  stdpassed    CHAR(1),
  stdpcity     VARCHAR2(35),
  stdpcounty   VARCHAR2(15),
  stdprefern   VARCHAR2(31),
  stdprirsch   VARCHAR2(51),
  stdpstate    VARCHAR2(29),
  stdpzip      VARCHAR2(13),
  stdsprog     VARCHAR2(29),
  stdssn       VARCHAR2(13),
  stdtagdate   DATE,
  stdtagsch    VARCHAR2(51),
  stdtrack     VARCHAR2(29),
  stdtrans1    VARCHAR2(53),
  stdtrans2    VARCHAR2(53),
  stdtrans3    VARCHAR2(53),
  stdtrans4    VARCHAR2(53),
  stdtrans5    VARCHAR2(53),
  stdtrans6    VARCHAR2(53),
  stdufld1     VARCHAR2(23),
  stdufld10    VARCHAR2(23),
  stdufld11    VARCHAR2(23),
  stdufld12    VARCHAR2(23),
  stdufld13    VARCHAR2(23),
  stdufld14    VARCHAR2(23),
  stdufld15    VARCHAR2(23),
  stdufld16    VARCHAR2(23),
  stdufld17    VARCHAR2(23),
  stdufld18    VARCHAR2(23),
  stdufld19    VARCHAR2(23),
  stdufld2     VARCHAR2(23),
  stdufld20    VARCHAR2(23),
  stdufld21    VARCHAR2(23),
  stdufld22    VARCHAR2(23),
  stdufld23    VARCHAR2(23),
  stdufld24    VARCHAR2(23),
  stdufld25    VARCHAR2(23),
  stdufld26    VARCHAR2(23),
  stdufld27    VARCHAR2(49),
  stdufld28    VARCHAR2(49),
  stdufld3     VARCHAR2(23),
  stdufld4     VARCHAR2(23),
  stdufld5     VARCHAR2(23),
  stdufld6     VARCHAR2(23),
  stdufld7     VARCHAR2(23),
  stdufld8     VARCHAR2(23),
  stdufld9     VARCHAR2(23),
  stduflg1     CHAR(1),
  stduflg10    CHAR(1),
  stduflg11    CHAR(1),
  stduflg12    CHAR(1),
  stduflg2     CHAR(1),
  stduflg3     CHAR(1),
  stduflg4     CHAR(1),
  stduflg5     CHAR(1),
  stduflg6     CHAR(1),
  stduflg7     CHAR(1),
  stduflg8     CHAR(1),
  stduflg9     CHAR(1),
  stdulist1    VARCHAR2(29),
  stdulist2    VARCHAR2(29),
  stdulist3    VARCHAR2(29),
  stdulist4    VARCHAR2(29),
  stdulist5    VARCHAR2(29),
  gradpath     VARCHAR2(29),
  idadddirm    NUMBER(11),
  idadddirp    NUMBER(11),
  idaddtypem   NUMBER(11),
  idaddtypep   NUMBER(11),
  idareamail   NUMBER(11),
  idareaphys   NUMBER(11),
  idcitydr     NUMBER(11),
  idcitymail   NUMBER(11),
  idcityphys   NUMBER(11),
  idclssetup   NUMBER(11),
  idcountyma   NUMBER(11),
  idcountyph   NUMBER(11),
  idethnic     NUMBER(11),
  idfedethnc   NUMBER(11),
  idgrade      NUMBER(11),
  idgradpath   NUMBER(11),
  idlanguage   NUMBER(11),
  idlunch      NUMBER(11),
  idnormprog   NUMBER(11),
  idschlicns   NUMBER(6),
  idschnamee   NUMBER(11),
  idschnameg   NUMBER(11),
  idschnameh   NUMBER(11),
  idschnamej   NUMBER(11),
  idschnamen   NUMBER(11),
  idschnamep   NUMBER(11),
  idschnamet   NUMBER(11),
  idspecprog   NUMBER(11),
  idstatedr    NUMBER(11),
  idstatema    NUMBER(11),
  idstateph    NUMBER(11),
  idstdudls1   NUMBER(11),
  idstdudls2   NUMBER(11),
  idstdudls3   NUMBER(11),
  idstdudls4   NUMBER(11),
  idstdudls5   NUMBER(11),
  idstdudls6   NUMBER(11),
  idstdudls7   NUMBER(11),
  idstdudls8   NUMBER(11),
  idstdudls9   NUMBER(11),
  idstudent    NUMBER(11),
  idtrack      NUMBER(11),
  stdfedethn   VARCHAR2(45),
  stdmaddapt   VARCHAR2(5),
  stdmadddir   VARCHAR2(29),
  stdmaddnum   VARCHAR2(6),
  stdmaddst    VARCHAR2(20),
  stdmaddtyp   VARCHAR2(29),
  stdpaddapt   VARCHAR2(5),
  stdpadddir   VARCHAR2(29),
  stdpaddnum   VARCHAR2(6),
  stdpaddst    VARCHAR2(20),
  stdpaddtyp   VARCHAR2(29),
  stdufld29    VARCHAR2(49),
  stdufld30    VARCHAR2(49),
  stdufld31    VARCHAR2(49),
  stdufld32    VARCHAR2(49),
  stduflg13    CHAR(1),
  stduflg14    CHAR(1),
  stduflg15    CHAR(1),
  stduflg16    CHAR(1),
  stdulist6    VARCHAR2(29),
  stdulist7    VARCHAR2(29),
  stdulist8    VARCHAR2(29),
  stdulist9    VARCHAR2(29) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_STUDDEMO_SCHOOLID on ROYSECITY.STUDDEMO (SCHOOLID)
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
create bitmap index ROYSECITY.BIX_STUDDEMO_STDACTIVE on ROYSECITY.STUDDEMO (STDACTIVE)
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
create bitmap index ROYSECITY.BIX_STUDDEMO_STDACTIVE_ACTIVE on ROYSECITY.STUDDEMO (SCHOOLID, STDACTIVE)
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
prompt Creating table STUDENT_DISABILITIES_DWS_500
prompt ===========================================
prompt
create table ROYSECITY.STUDENT_DISABILITIES_DWS_500
(
  stu_id               VARCHAR2(6),
  name_f               VARCHAR2(17),
  name_m               VARCHAR2(14),
  name_l               VARCHAR2(25),
  sex                  CHAR(1),
  ethn_hispanic        CHAR(1),
  race_amer_indian     CHAR(1),
  race_asian           CHAR(1),
  race_black           CHAR(1),
  race_pacific_isl     CHAR(1),
  race_white           CHAR(1),
  dob                  VARCHAR2(8),
  str_nbr_phys         VARCHAR2(6),
  str_name_phys        VARCHAR2(19),
  apt_nbr_phys_addr    VARCHAR2(7),
  city_name_phys_addr  VARCHAR2(17),
  phys_addr_state      VARCHAR2(2),
  addr_zip             VARCHAR2(5),
  addr_zip4            VARCHAR2(4),
  stu_phone_ac         VARCHAR2(3),
  phone_nbr            VARCHAR2(7),
  econ_disadv_cd       VARCHAR2(2),
  sch_food_srv_elig    VARCHAR2(7),
  homesit              CHAR(9),
  lep_desc             VARCHAR2(20),
  lang_pri             VARCHAR2(2),
  disability_cd        VARCHAR2(40),
  order_of_disability  CHAR(1),
  dist_id              VARCHAR2(6),
  state_cd             VARCHAR2(2),
  dt_entered_ninth_grd VARCHAR2(8)
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

prompt
prompt Creating table STUDENT_DISABILITIES_DWS_5002
prompt ============================================
prompt
create table ROYSECITY.STUDENT_DISABILITIES_DWS_5002
(
  stu_id               VARCHAR2(6),
  name_f               VARCHAR2(17),
  name_m               VARCHAR2(14),
  name_l               VARCHAR2(25),
  sex                  CHAR(1),
  ethn_hispanic        CHAR(1),
  race_amer_indian     CHAR(1),
  race_asian           CHAR(1),
  race_black           CHAR(1),
  race_pacific_isl     CHAR(1),
  race_white           CHAR(1),
  dob                  VARCHAR2(8),
  str_nbr_phys         VARCHAR2(6),
  str_name_phys        VARCHAR2(19),
  apt_nbr_phys_addr    VARCHAR2(7),
  city_name_phys_addr  VARCHAR2(17),
  phys_addr_state      VARCHAR2(2),
  addr_zip             VARCHAR2(5),
  addr_zip4            VARCHAR2(4),
  stu_phone_ac         VARCHAR2(3),
  phone_nbr            VARCHAR2(7),
  econ_disadv_cd       VARCHAR2(2),
  sch_food_srv_elig    VARCHAR2(7),
  homesit              CHAR(9),
  lep_desc             VARCHAR2(20),
  lang_pri             VARCHAR2(2),
  disability_cd        VARCHAR2(40),
  order_of_disability  CHAR(1),
  dist_id              VARCHAR2(6),
  state_cd             VARCHAR2(2),
  dt_entered_ninth_grd VARCHAR2(8)
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

prompt
prompt Creating table STU_ENROLL_TBL
prompt =============================
prompt
create table ROYSECITY.STU_ENROLL_TBL
(
  sch_yr                VARCHAR2(4),
  student_id            VARCHAR2(6),
  grade_level           VARCHAR2(2),
  student_name          VARCHAR2(60),
  first_name            VARCHAR2(17),
  last_name             VARCHAR2(25),
  student_address_line1 VARCHAR2(50),
  student_address_line2 VARCHAR2(50),
  he_she_cap            VARCHAR2(3),
  his_her_cap           VARCHAR2(3),
  he_she                VARCHAR2(3),
  his_her               VARCHAR2(3),
  today_date            VARCHAR2(10),
  campus_id             VARCHAR2(3),
  r10_loaddate          DATE
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
prompt Creating table STV_0800_SR_CRS_GRD
prompt ==================================
prompt
create table ROYSECITY.STV_0800_SR_CRS_GRD
(
  sch_yr                    VARCHAR2(4),
  campus_id                 VARCHAR2(3),
  stu_id                    VARCHAR2(6),
  crs_nbr                   VARCHAR2(4),
  sec_nbr                   VARCHAR2(2),
  crs_sem_enroll            CHAR(1),
  crs_dt_entry              VARCHAR2(8),
  dt_wd                     VARCHAR2(8),
  grd_cyc1                  VARCHAR2(3),
  grd_cyc2                  VARCHAR2(3),
  grd_cyc3                  VARCHAR2(3),
  grd_exam                  VARCHAR2(3),
  grd_sem                   VARCHAR2(3),
  grd_final                 VARCHAR2(3),
  comments_cyc1_1           CHAR(1),
  comments_cyc1_2           CHAR(1),
  comments_cyc1_3           CHAR(1),
  comments_cyc1_4           CHAR(1),
  comments_cyc1_5           CHAR(1),
  comments_cyc2_1           CHAR(1),
  comments_cyc2_2           CHAR(1),
  comments_cyc2_3           CHAR(1),
  comments_cyc2_4           CHAR(1),
  comments_cyc2_5           CHAR(1),
  comments_cyc3_1           CHAR(1),
  comments_cyc3_2           CHAR(1),
  comments_cyc3_3           CHAR(1),
  comments_cyc3_4           CHAR(1),
  comments_cyc3_5           CHAR(1),
  conduct_cyc1              CHAR(1),
  conduct_cyc2              CHAR(1),
  conduct_cyc3              CHAR(1),
  scan_update               CHAR(1),
  abs_cyc1                  NUMBER(2),
  abs_cyc2                  NUMBER(2),
  abs_cyc3                  NUMBER(2),
  abs_exc_cyc1              NUMBER(2),
  abs_sch_cyc1              NUMBER(2),
  abs_unexc_cyc1            NUMBER(2),
  abs_exc_cyc2              NUMBER(2),
  abs_sch_cyc2              NUMBER(2),
  abs_unexc_cyc2            NUMBER(2),
  abs_exc_cyc3              NUMBER(2),
  abs_sch_cyc3              NUMBER(2),
  abs_unexc_cyc3            NUMBER(2),
  crs_credit                VARCHAR2(2),
  sr_crs_spec_consider      VARCHAR2(2),
  tardy_cyc1                NUMBER(2),
  tardy_cyc2                NUMBER(2),
  tardy_cyc3                NUMBER(2),
  service_id                VARCHAR2(8),
  pass_fail_credit_ind      VARCHAR2(2),
  spec_ed_pass_grd          VARCHAR2(2),
  honors_crs                CHAR(1),
  xfer_crs                  CHAR(1),
  crs_offered_cyr_sch_yr    VARCHAR2(4),
  title                     VARCHAR2(15),
  self_paced                CHAR(1),
  voc_ed_credit_amt         CHAR(1),
  cr_met_cyr_sch_yr         VARCHAR2(4),
  per_begin                 VARCHAR2(2),
  per_end                   VARCHAR2(2),
  room_nbr                  VARCHAR2(4),
  sem_cd                    CHAR(1),
  instr_sch_yr              VARCHAR2(4),
  instr_name_l              VARCHAR2(25),
  instr_name_f              VARCHAR2(17),
  instr_name_m              VARCHAR2(14),
  homeroom                  VARCHAR2(4),
  sr_aar_use_cd             CHAR(1),
  cr_sec_offered_cyr_sch_yr VARCHAR2(4),
  max_seats                 VARCHAR2(3),
  grd_rstrctn               VARCHAR2(2),
  addl_grd_rstrctn          CHAR(1),
  cr_gender_rstrctn         CHAR(1),
  typ_rstrctn               CHAR(1),
  instruct_set              VARCHAR2(2),
  multi_svc_ind             CHAR(1),
  cr_pop_srvd               VARCHAR2(2),
  cr_role_id                VARCHAR2(3),
  wks_mon                   VARCHAR2(2),
  cr_crs_spec_consider      VARCHAR2(2),
  cr_aar_use_cd             CHAR(1),
  prt_daysmet_sched         CHAR(1),
  coop_voc_ed               CHAR(1),
  crs_seq_cd                CHAR(1),
  mini_cyc                  VARCHAR2(2),
  incl_elig_sec             CHAR(1),
  team_code                 CHAR(1),
  crs_typ                   CHAR(1),
  dual_credit_ind           CHAR(1),
  distan_lrn_ind            VARCHAR2(2),
  dr_crs_offered_cyr_sch_yr VARCHAR2(4),
  gavg_table                CHAR(1),
  dr_aar_use_cd             CHAR(1),
  allow_credit_basic        CHAR(1),
  allow_credit_honors       CHAR(1),
  auto_grd                  VARCHAR2(3),
  core_crs_cd               CHAR(1),
  gavg_wgt                  CHAR(1),
  partial_credit_cd         CHAR(1),
  hroll_cd                  CHAR(1),
  la_wgt_cd                 VARCHAR2(2),
  hroll_wgt                 CHAR(1),
  nbr_credits               VARCHAR2(2),
  nbr_of_sem                CHAR(1),
  credit_seq_cd             CHAR(1),
  dr_role_id                VARCHAR2(3),
  per_ctrl                  NUMBER(2),
  prt_crs_info_flg          CHAR(1),
  priority_cd_crs           CHAR(1),
  dr_gender_rstrctn         CHAR(1),
  svc_id                    VARCHAR2(8),
  dr_crs_spec_consider      VARCHAR2(2),
  instruct_set_cd           VARCHAR2(2),
  dr_pop_srvd               VARCHAR2(2),
  credit_lvl                CHAR(1),
  coop_voc_cd               CHAR(1),
  mini_crs_nbr_cyc          CHAR(1),
  incl_elig_crs             CHAR(1),
  prt_on_elem_labels        CHAR(1),
  seq_cd                    CHAR(1),
  hroll_table               CHAR(1),
  graded_crs_cd             CHAR(1),
  textbook_isbn             VARCHAR2(10),
  exam_sem_pattern          CHAR(1),
  days_cd                   VARCHAR2(2),
  time_begin                VARCHAR2(5),
  time_end                  VARCHAR2(5),
  lockout_cd                CHAR(1),
  seq_nbr                   VARCHAR2(2),
  instr_id                  VARCHAR2(3),
  et_c027_daysweek_sch_yr   VARCHAR2(4),
  daysweek_descr            VARCHAR2(6),
  et_c022_svc_id_sch_yr     VARCHAR2(4),
  svcid_descr               VARCHAR2(10),
  abbrev_name               VARCHAR2(8),
  dept_use                  VARCHAR2(3),
  cr_sec_nbr                VARCHAR2(2),
  in_section                VARCHAR2(2),
  in_grade_level            VARCHAR2(2),
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

prompt
prompt Creating table STV_0800_SR_DISCPLN
prompt ==================================
prompt
create table ROYSECITY.STV_0800_SR_DISCPLN
(
  sch_yr                     CHAR(4),
  stu_id                     CHAR(6),
  ofens_stamp                CHAR(27),
  ofens_time                 CHAR(8),
  campus_id                  CHAR(3),
  dt_ofens                   CHAR(8),
  rep_by                     CHAR(3),
  rep_by_name_f              CHAR(17),
  rep_by_name_l              CHAR(25),
  inc_loc                    CHAR(3),
  course                     CHAR(4),
  section                    CHAR(2),
  crs_title                  CHAR(15),
  period                     CHAR(2),
  parent_contact             CHAR(1),
  contact_dt                 CHAR(8),
  conf_requested             CHAR(1),
  conf_date                  CHAR(8),
  informal_hearing           CHAR(1),
  appeal_exp                 CHAR(1),
  witness                    CHAR(1),
  admin_by                   CHAR(3),
  admin_by_name_f            CHAR(17),
  admin_by_name_l            CHAR(25),
  reported_by_desc           CHAR(60),
  instr                      CHAR(3),
  incident_num               CHAR(6),
  report_pd                  CHAR(1),
  ofens_sch_yr               CHAR(4),
  ofens_stu_id               CHAR(6),
  ofens_ofens_stamp          CHAR(27),
  ofens_cd                   CHAR(4),
  ofens_level                CHAR(1),
  peims_extract              CHAR(1),
  actn_sch_yr                CHAR(4),
  actn_stu_id                CHAR(6),
  actn_ofens_stamp           CHAR(27),
  actn_cd                    CHAR(2),
  actn_to_dt                 CHAR(8),
  amt                        CHAR(10),
  actn_from_dt               CHAR(8),
  campus_id_assgn            CHAR(9),
  actn_nbr                   CHAR(3),
  act_length_discpln_assgn   CHAR(3),
  length_diff_rsn_cd         CHAR(2),
  offcl_length_discpln_assgn CHAR(3),
  date_displnry_action       CHAR(8),
  campus_displnry_respnsblty CHAR(3),
  cyr_sch_yr                 CHAR(4),
  instr_id                   CHAR(3),
  name_f                     CHAR(17),
  name_m                     CHAR(14),
  name_l                     CHAR(25),
  gen_cd                     CHAR(1),
  spec_ed_sch_yr             CHAR(4),
  spec_ed_campus_id          CHAR(3),
  spec_ed_stu_id             CHAR(6),
  pri_handi_ind              CHAR(2),
  stu_campus_sch_yr          CHAR(4),
  stu_campus_campus_id       CHAR(3),
  stu_campus_stu_id          CHAR(6),
  cyr_ctrl_nbr               CHAR(3),
  sr_discpln_sch_yr          CHAR(4),
  sr_discpln_comments        VARCHAR2(3270),
  st_ofens_sch_yr            CHAR(4),
  st_ofens_ofens_cd          CHAR(4),
  st_ofens_peim_cd           CHAR(2),
  st_discpln_actn_sch_yr     CHAR(4),
  st_discpln_actn_actn_cd    CHAR(2),
  st_discpln_actn_peims_cd   CHAR(2),
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

prompt
prompt Creating table STV_0800_SR_SPEC_PGM_SPEC_ED
prompt ===========================================
prompt
create table ROYSECITY.STV_0800_SR_SPEC_PGM_SPEC_ED
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  stu_id       VARCHAR2(6),
  dt_entry     VARCHAR2(8),
  pri_handi    VARCHAR2(2),
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
prompt Creating table STV_0800_STU_AT_RISK
prompt ===================================
prompt
create table ROYSECITY.STV_0800_STU_AT_RISK
(
  sch_yr                       VARCHAR2(4),
  stu_id                       VARCHAR2(6),
  parent                       CHAR(1),
  at_risk                      CHAR(1),
  tot_at_risk_pts              VARCHAR2(2),
  elem_factor1                 CHAR(1),
  elem_factor2                 CHAR(1),
  elem_satis_test_score        CHAR(1),
  scnd_essential_elem          CHAR(1),
  scnd_below_grd_lvl           CHAR(1),
  homeless                     CHAR(1),
  other_rsn                    CHAR(1),
  read_test                    CHAR(1),
  bypass_flg                   CHAR(1),
  test_grd_lvl                 VARCHAR2(2),
  fail_2_crs_sem               CHAR(1),
  homeless_resid_placement     VARCHAR2(6),
  satis_tst_scores_pk_03       CHAR(1),
  satis_tst_scores_pk_03_doc   CHAR(1),
  fail_2_crs_sem_doc           CHAR(1),
  nbr_times_failed_doc         CHAR(1),
  satis_perf_taks_110_rule     CHAR(1),
  satis_perf_taks_110_rule_doc CHAR(1),
  preg_pupils_pgm_ind_doc      CHAR(1),
  daep_curr_prior_yrs          CHAR(1),
  daep_curr_prior_yrs_doc      CHAR(1),
  expelled_curr_prior_yr       CHAR(1),
  expelled_curr_prior_yr_doc   CHAR(1),
  judicial_release             CHAR(1),
  judicial_release_doc         CHAR(1),
  previous_dropout             CHAR(1),
  previous_dropout_doc         CHAR(1),
  lep_ind_doc                  CHAR(1),
  protective_serv_ref          CHAR(1),
  protective_serv_ref_doc      CHAR(1),
  homeless_doc                 CHAR(1),
  homeless_resid_placement_doc CHAR(1),
  preg_pupils_pgm_ind          CHAR(1),
  r10_loaddate                 DATE
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
prompt Creating table STV_MED_CONTACTS
prompt ===============================
prompt
create table ROYSECITY.STV_MED_CONTACTS
(
  relation_cd  VARCHAR2(2),
  description  VARCHAR2(20),
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
prompt Creating table STV_PARENT_VIEW
prompt ==============================
prompt
create table ROYSECITY.STV_PARENT_VIEW
(
  sch_yr         VARCHAR2(4),
  stu_id         VARCHAR2(6),
  name_l         VARCHAR2(25),
  name_f         VARCHAR2(17),
  name_m         VARCHAR2(14),
  emergency_flag CHAR(1),
  migrant_flag   CHAR(1),
  relat          VARCHAR2(2),
  description    VARCHAR2(20),
  mil_rank       VARCHAR2(5),
  email          VARCHAR2(64),
  dob            VARCHAR2(8),
  bos_desc       VARCHAR2(15),
  mil_ind        CHAR(1),
  phone_num      VARCHAR2(14),
  work_phone     VARCHAR2(24),
  other_phone    VARCHAR2(24),
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
prompt Creating table STV_REG_CONTACTS
prompt ===============================
prompt
create table ROYSECITY.STV_REG_CONTACTS
(
  relation_cd  VARCHAR2(2),
  description  VARCHAR2(20),
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
prompt Creating table STV_STU_DEMO_PEIMS_VIEW
prompt ======================================
prompt
create table ROYSECITY.STV_STU_DEMO_PEIMS_VIEW
(
  sch_yr                     VARCHAR2(4),
  stu_id                     VARCHAR2(6),
  immigrant_ind              CHAR(1),
  ssi_promo_retntn_cd        VARCHAR2(2),
  day_care_voc_suppt_svc     CHAR(1),
  displc_hmkr_cd             CHAR(1),
  econ_disadv_cd             VARCHAR2(2),
  sgl_par_preg_teen          CHAR(1),
  genrl_intelect_ability_ind CHAR(1),
  specific_subj_matter_apttd CHAR(1),
  creative_prod_thinking     CHAR(1),
  leadership_abil            CHAR(1),
  county_resid               VARCHAR2(3),
  home_lang_cd               VARCHAR2(2),
  par_perm_cd                CHAR(1),
  peims_drout_exit_rsn1      VARCHAR2(2),
  peims_drout_exit_rsn2      VARCHAR2(2),
  peims_drout_exit_rsn3      VARCHAR2(2),
  per_drout_cd               CHAR(1),
  grd_lvl_drout              VARCHAR2(2),
  msrts_id_nbr               VARCHAR2(11),
  migrant_status_cd          CHAR(1),
  xfer_crs                   CHAR(1),
  par_perm_dt                VARCHAR2(8),
  couns_svc_ind              CHAR(1),
  cate_ind                   CHAR(1),
  college_entry_ind          CHAR(1),
  grad_typ_cd                VARCHAR2(2),
  proposed_dt_grad           VARCHAR2(8),
  demo_rev_confirm           CHAR(1),
  alien_ind                  CHAR(1),
  refugee_ind                CHAR(1),
  par_perm_denial_dt         VARCHAR2(8),
  transport_voc_suppt        CHAR(1),
  taas_exempt_cd_read        CHAR(1),
  taas_exempt_cd_writing     CHAR(1),
  taas_exempt_cd_math        CHAR(1),
  taas_exempt_cd_sci         CHAR(1),
  taas_exempt_cd_soc_sci     CHAR(1),
  neglected_delinquent_ind   CHAR(1),
  rptd_campus_id_enroll      VARCHAR2(9),
  yrend_status_ind           VARCHAR2(2),
  retnt_transit_rsn1         VARCHAR2(2),
  retnt_transit_rsn2         VARCHAR2(2),
  retnt_transit_rsn3         VARCHAR2(2),
  oeyp                       CHAR(1),
  campus_id_account          VARCHAR2(9),
  oeyp_retntn_cd             VARCHAR2(2),
  bil_esl_summer_ind         CHAR(1),
  even_start_ind             CHAR(1),
  yrs_usa_cd                 CHAR(1),
  lep_monitoring             CHAR(1),
  oeyp_days_taught           VARCHAR2(3),
  oeyp_days_abs              VARCHAR2(3),
  oeyp_elig_days_prsnt       VARCHAR2(3),
  gradtyp_aar_type           VARCHAR2(15),
  dt_cert_crswrk             VARCHAR2(8),
  tx_gr_elg                  CHAR(1),
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

prompt
prompt Creating table ST_AAR_USE
prompt =========================
prompt
create table ROYSECITY.ST_AAR_USE
(
  sch_yr       VARCHAR2(4),
  aar_use_cd   CHAR(1),
  aar_use_desc VARCHAR2(60),
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
prompt Creating table ST_ACCRED
prompt ========================
prompt
create table ROYSECITY.ST_ACCRED
(
  sch_yr       VARCHAR2(4),
  accred_cd    CHAR(1),
  accred_desc  VARCHAR2(40),
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
prompt Creating table ST_ACTIVE_CD
prompt ===========================
prompt
create table ROYSECITY.ST_ACTIVE_CD
(
  sch_yr       VARCHAR2(4),
  active_cd    CHAR(1),
  description  VARCHAR2(10),
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
prompt Creating table ST_ATT_IMPACT
prompt ============================
prompt
create table ROYSECITY.ST_ATT_IMPACT
(
  sch_yr          VARCHAR2(4),
  att_impact_cd   CHAR(1),
  att_impact_desc VARCHAR2(40),
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
prompt Creating table ST_ATT_POST
prompt ==========================
prompt
create table ROYSECITY.ST_ATT_POST
(
  sch_yr         VARCHAR2(4),
  post_cd        CHAR(1),
  ada_abs        CHAR(1),
  posting_decode VARCHAR2(29),
  prepost        CHAR(1),
  rpt_crd_equiv  CHAR(1),
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
create bitmap index ROYSECITY.BMI_ST_ATT_POST_SCHL_YR on ROYSECITY.ST_ATT_POST (SCH_YR)
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
prompt Creating table ST_ATT_SUM
prompt =========================
prompt
create table ROYSECITY.ST_ATT_SUM
(
  sch_yr       VARCHAR2(4),
  sum_cd       CHAR(1),
  sum_desc     VARCHAR2(60),
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
prompt Creating table ST_BIL_ESL_CATEG
prompt ===============================
prompt
create table ROYSECITY.ST_BIL_ESL_CATEG
(
  sch_yr       VARCHAR2(4),
  categ_cd     CHAR(1),
  categ_desc   VARCHAR2(40),
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
prompt Creating table ST_CORE_CRS
prompt ==========================
prompt
create table ROYSECITY.ST_CORE_CRS
(
  sch_yr       VARCHAR2(4),
  core_cd      CHAR(1),
  core_desc    VARCHAR2(80),
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
prompt Creating table ST_COUNTRY
prompt =========================
prompt
create table ROYSECITY.ST_COUNTRY
(
  sch_yr       VARCHAR2(4),
  country_cd   VARCHAR2(2),
  country_desc VARCHAR2(25),
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
prompt Creating table ST_CRS_TYP
prompt =========================
prompt
create table ROYSECITY.ST_CRS_TYP
(
  sch_yr       VARCHAR2(4),
  crs_cd       CHAR(1),
  crs_desc     VARCHAR2(40),
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
prompt Creating table ST_CYCLE
prompt =======================
prompt
create table ROYSECITY.ST_CYCLE
(
  sch_yr       VARCHAR2(4),
  nbr_cycles   CHAR(1),
  cycle_nbr    CHAR(1),
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
prompt Creating table ST_CYCLE_TYP
prompt ===========================
prompt
create table ROYSECITY.ST_CYCLE_TYP
(
  sch_yr       VARCHAR2(4),
  cycle_typ    CHAR(1),
  cycle_desc   VARCHAR2(30),
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
prompt Creating table ST_DISCPLN_ACTN
prompt ==============================
prompt
create table ROYSECITY.ST_DISCPLN_ACTN
(
  sch_yr       VARCHAR2(4),
  actn_cd      VARCHAR2(2),
  update_flag  CHAR(1),
  actn_desc    VARCHAR2(60),
  peims_cd     VARCHAR2(2),
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
prompt Creating table ST_ELEM_CAMPUS_GRD_LVL
prompt =====================================
prompt
create table ROYSECITY.ST_ELEM_CAMPUS_GRD_LVL
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  grd_lvl      VARCHAR2(2),
  crs          VARCHAR2(4),
  nbr_secs     CHAR(1),
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
prompt Creating table ST_ELEM_CVSN
prompt ===========================
prompt
create table ROYSECITY.ST_ELEM_CVSN
(
  sch_yr       VARCHAR2(4),
  campus       VARCHAR2(3),
  core_cd      CHAR(1),
  elem_alpha   VARCHAR2(2),
  elem_hi_grd  VARCHAR2(3),
  elem_lo_grd  VARCHAR2(3),
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
prompt Creating table ST_ELEM_GRADE
prompt ============================
prompt
create table ROYSECITY.ST_ELEM_GRADE
(
  sch_yr       VARCHAR2(4),
  campus       VARCHAR2(3),
  grd_lvl      VARCHAR2(2),
  grading_typ  CHAR(1),
  comp_sem_avg CHAR(1),
  incl_exam    CHAR(1),
  exam_wgt     NUMBER(1),
  tot_wgt      NUMBER(2),
  comp_cum_avg CHAR(1),
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
prompt Creating table ST_ELEM_GRD_CTRL_NBR
prompt ===================================
prompt
create table ROYSECITY.ST_ELEM_GRD_CTRL_NBR
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  ctrl_nbr     VARCHAR2(3),
  section      VARCHAR2(2),
  grd_lvl      VARCHAR2(2),
  room_nbr     VARCHAR2(4),
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
prompt Creating table ST_ELEM_GRD_RPT_CRS
prompt ==================================
prompt
create table ROYSECITY.ST_ELEM_GRD_RPT_CRS
(
  sch_yr           VARCHAR2(4),
  grd_lvl          VARCHAR2(2),
  crs              VARCHAR2(4),
  print_on_grd_lbl CHAR(1),
  crs_pos          VARCHAR2(2),
  campus_id        VARCHAR2(3),
  period           VARCHAR2(2),
  days_cd          VARCHAR2(2),
  r10_loaddate     DATE
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
prompt Creating table ST_ETHN_MAJORITY
prompt ===============================
prompt
create table ROYSECITY.ST_ETHN_MAJORITY
(
  sch_yr               VARCHAR2(4),
  ethnic_majority_cd   CHAR(1),
  ethnic_majority_desc VARCHAR2(50),
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
prompt Creating table ST_GIFTED_TALENTED
prompt =================================
prompt
create table ROYSECITY.ST_GIFTED_TALENTED
(
  sch_yr       VARCHAR2(4),
  st_gt_cd     CHAR(1),
  st_gt_desc   VARCHAR2(20),
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
prompt Creating table ST_GRAD
prompt ======================
prompt
create table ROYSECITY.ST_GRAD
(
  sch_yr       VARCHAR2(4),
  grad_cd      VARCHAR2(2),
  grad_desc    VARCHAR2(50),
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
prompt Creating table ST_INST_LOC
prompt ==========================
prompt
create table ROYSECITY.ST_INST_LOC
(
  sch_yr        VARCHAR2(4),
  inst_loc_cd   VARCHAR2(2),
  inst_loc_desc VARCHAR2(40),
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
prompt Creating table ST_INST_TECH
prompt ===========================
prompt
create table ROYSECITY.ST_INST_TECH
(
  sch_yr         VARCHAR2(4),
  inst_tech_cd   VARCHAR2(2),
  inst_tech_desc VARCHAR2(70),
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
prompt Creating table ST_LAST_YR_GRD
prompt =============================
prompt
create table ROYSECITY.ST_LAST_YR_GRD
(
  sch_yr       VARCHAR2(4),
  grd_cd       VARCHAR2(2),
  grd_desc     VARCHAR2(50),
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
prompt Creating table ST_LOC_CD
prompt ========================
prompt
create table ROYSECITY.ST_LOC_CD
(
  sch_yr       VARCHAR2(4),
  loc_cd       VARCHAR2(3),
  loc_desc     VARCHAR2(25),
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
prompt Creating table ST_MIGRANT
prompt =========================
prompt
create table ROYSECITY.ST_MIGRANT
(
  sch_yr       VARCHAR2(4),
  migrant_cd   CHAR(1),
  migrant_desc VARCHAR2(40),
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
prompt Creating table ST_NBR_SEM_COURSE
prompt ================================
prompt
create table ROYSECITY.ST_NBR_SEM_COURSE
(
  sch_yr       VARCHAR2(4),
  nbr_sem      CHAR(1),
  sem_cd       CHAR(1),
  description  VARCHAR2(35),
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
prompt Creating table ST_OFENS_CD
prompt ==========================
prompt
create table ROYSECITY.ST_OFENS_CD
(
  sch_yr       VARCHAR2(4),
  ofens_cd     VARCHAR2(4),
  update_flag  CHAR(1),
  ofens_desc   VARCHAR2(60),
  peims_cd     VARCHAR2(2),
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
prompt Creating table ST_OFENS_LVL
prompt ===========================
prompt
create table ROYSECITY.ST_OFENS_LVL
(
  sch_yr          VARCHAR2(4),
  other_risk_cd   CHAR(1),
  other_risk_desc VARCHAR2(20),
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
prompt Creating table ST_OTHER_AT_RISK
prompt ===============================
prompt
create table ROYSECITY.ST_OTHER_AT_RISK
(
  sch_yr       VARCHAR2(4),
  level_cd     CHAR(1),
  level_desc   VARCHAR2(50),
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
prompt Creating table ST_REC_STATUS
prompt ============================
prompt
create table ROYSECITY.ST_REC_STATUS
(
  sch_yr       VARCHAR2(4),
  rec_status   CHAR(1),
  status_desc  VARCHAR2(80),
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
prompt Creating table ST_RELATION
prompt ==========================
prompt
create table ROYSECITY.ST_RELATION
(
  sch_yr       VARCHAR2(4),
  relation_cd  VARCHAR2(2),
  description  VARCHAR2(20),
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
prompt Creating table ST_SCHEDULE
prompt ==========================
prompt
create table ROYSECITY.ST_SCHEDULE
(
  sch_yr        VARCHAR2(4),
  schedule_cd   CHAR(1),
  schedule_desc VARCHAR2(60),
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
prompt Creating table ST_SEM_TAUGHT_CODE_2SEM
prompt ======================================
prompt
create table ROYSECITY.ST_SEM_TAUGHT_CODE_2SEM
(
  sch_yr       VARCHAR2(4),
  sem_code     CHAR(1),
  sem_nbr      CHAR(1),
  sem_descr    VARCHAR2(35),
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
prompt Creating table ST_SEM_TAUGHT_CODE_4SEM
prompt ======================================
prompt
create table ROYSECITY.ST_SEM_TAUGHT_CODE_4SEM
(
  sch_yr       VARCHAR2(4),
  sem_code     CHAR(1),
  sem_nbr      CHAR(1),
  sem_descr    VARCHAR2(35),
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
prompt Creating table ST_SE_CONTACT
prompt ============================
prompt
create table ROYSECITY.ST_SE_CONTACT
(
  sch_yr       VARCHAR2(4),
  contact_cd   CHAR(1),
  contact_desc VARCHAR2(40),
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
prompt Creating table ST_SE_PRI_PGM
prompt ============================
prompt
create table ROYSECITY.ST_SE_PRI_PGM
(
  sch_yr       VARCHAR2(4),
  pri_pgm_cd   CHAR(1),
  pri_pgm_desc VARCHAR2(40),
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
prompt Creating table ST_SE_STU_STAT
prompt =============================
prompt
create table ROYSECITY.ST_SE_STU_STAT
(
  sch_yr       VARCHAR2(4),
  stat_cd      CHAR(1),
  stat_desc    VARCHAR2(40),
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
prompt Creating table ST_SE_STU_STAT_PRIO
prompt ==================================
prompt
create table ROYSECITY.ST_SE_STU_STAT_PRIO
(
  sch_yr         VARCHAR2(4),
  stat_prio_cd   CHAR(1),
  stat_prio_desc VARCHAR2(40),
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
prompt Creating table ST_SE_SVC
prompt ========================
prompt
create table ROYSECITY.ST_SE_SVC
(
  sch_yr       VARCHAR2(4),
  svc_cd       CHAR(1),
  svc_desc     VARCHAR2(40),
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
prompt Creating table ST_SE_TRANS_FLG
prompt ==============================
prompt
create table ROYSECITY.ST_SE_TRANS_FLG
(
  sch_yr       VARCHAR2(4),
  trans_cd     CHAR(1),
  trans_desc   VARCHAR2(40),
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
prompt Creating table ST_SE_WD_RSN
prompt ===========================
prompt
create table ROYSECITY.ST_SE_WD_RSN
(
  sch_yr              VARCHAR2(4),
  spec_ed_wd_rsn_cd   VARCHAR2(2),
  spec_ed_wd_rsn_desc VARCHAR2(40),
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

prompt
prompt Creating table ST_SPEC_CRS
prompt ==========================
prompt
create table ROYSECITY.ST_SPEC_CRS
(
  sch_yr        VARCHAR2(4),
  spec_crs_cd   CHAR(1),
  spec_crs_desc VARCHAR2(70),
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
prompt Creating table ST_SPEC_PGMS
prompt ===========================
prompt
create table ROYSECITY.ST_SPEC_PGMS
(
  sch_yr       VARCHAR2(4),
  prg_cd       CHAR(1),
  prg_desc     VARCHAR2(40),
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
prompt Creating table ST_STU_PRINT_INFO
prompt ================================
prompt
create table ROYSECITY.ST_STU_PRINT_INFO
(
  sch_yr       VARCHAR2(4),
  print_cd     CHAR(1),
  print_desc   VARCHAR2(40),
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
prompt Creating table ST_TEAM_CYR
prompt ==========================
prompt
create table ROYSECITY.ST_TEAM_CYR
(
  sch_yr       VARCHAR2(4),
  campus_id    VARCHAR2(3),
  team_cd      CHAR(1),
  team_descr   VARCHAR2(30),
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
prompt Creating table ST_TITLE1_ACTN
prompt =============================
prompt
create table ROYSECITY.ST_TITLE1_ACTN
(
  sch_yr       VARCHAR2(4),
  actn_cd      CHAR(1),
  actn_desc    VARCHAR2(70),
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
prompt Creating table ST_TRACK
prompt =======================
prompt
create table ROYSECITY.ST_TRACK
(
  sch_yr       VARCHAR2(4),
  track_cd     CHAR(1),
  track_desc   VARCHAR2(40),
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
prompt Creating table ST_TRFR_FACTOR
prompt =============================
prompt
create table ROYSECITY.ST_TRFR_FACTOR
(
  sch_yr       VARCHAR2(4),
  trfr_cd      CHAR(1),
  trfr_desc    VARCHAR2(40),
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
prompt Creating table ST_UNDEFINED_PGM
prompt ===============================
prompt
create table ROYSECITY.ST_UNDEFINED_PGM
(
  sch_yr       VARCHAR2(4),
  pgm_cd       CHAR(1),
  pgm_desc     VARCHAR2(30),
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
prompt Creating table ST_VOC_ED
prompt ========================
prompt
create table ROYSECITY.ST_VOC_ED
(
  sch_yr       VARCHAR2(4),
  voc_ed_cd    CHAR(1),
  voc_ed_desc  VARCHAR2(60),
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
prompt Creating table ST_WD_RSN
prompt ========================
prompt
create table ROYSECITY.ST_WD_RSN
(
  sch_yr       VARCHAR2(4),
  wd_rsn_cd    VARCHAR2(2),
  wd_rsn_desc  VARCHAR2(60),
  update_flag  CHAR(1),
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
prompt Creating table T040
prompt ===================
prompt
create table ROYSECITY.T040
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
prompt Creating table TCHDEMO
prompt ======================
prompt
create table ROYSECITY.TCHDEMO
(
  schoolid     VARCHAR2(9),
  tchactive    CHAR(1),
  tchaddr1     VARCHAR2(35),
  tchaddr2     VARCHAR2(35),
  tchbirthd    DATE,
  tchcity      VARCHAR2(35),
  tchcnaddr1   VARCHAR2(35),
  tchcnaddr2   VARCHAR2(35),
  tchcncity    VARCHAR2(35),
  tchcnemply   VARCHAR2(39),
  tchcnhmph2   VARCHAR2(21),
  tchcnhmphn   VARCHAR2(21),
  tchcnname    VARCHAR2(39),
  tchcnreltn   VARCHAR2(15),
  tchcnstate   VARCHAR2(29),
  tchcnwkph2   VARCHAR2(21),
  tchcnwkphn   VARCHAR2(21),
  tchcnzip     VARCHAR2(13),
  tchdept      VARCHAR2(29),
  tchempnum    VARCHAR2(9),
  tchethnic    VARCHAR2(29),
  tchfirstn    VARCHAR2(31),
  tchgender    VARCHAR2(1),
  tchhiredt    DATE,
  tchhmroom    VARCHAR2(7),
  tchhphone    VARCHAR2(21),
  tchhphone2   VARCHAR2(21),
  tchinactdt   DATE,
  tchisadmin   CHAR(1),
  tchiscnslr   CHAR(1),
  tchisdpthd   CHAR(1),
  tchissub     CHAR(1),
  tchlang      VARCHAR2(29),
  tchlastn     VARCHAR2(31),
  tchmiddlen   VARCHAR2(31),
  tchnumber    VARCHAR2(9),
  tchssn       VARCHAR2(13),
  tchstate     VARCHAR2(29),
  tchtitle     VARCHAR2(15),
  tchtrack     VARCHAR2(29),
  tchufld1     VARCHAR2(15),
  tchufld10    VARCHAR2(15),
  tchufld2     VARCHAR2(15),
  tchufld3     VARCHAR2(15),
  tchufld4     VARCHAR2(15),
  tchufld5     VARCHAR2(15),
  tchufld6     VARCHAR2(15),
  tchufld7     VARCHAR2(15),
  tchufld8     VARCHAR2(15),
  tchufld9     VARCHAR2(15),
  tchuflg1     CHAR(1),
  tchuflg10    CHAR(1),
  tchuflg2     CHAR(1),
  tchuflg3     CHAR(1),
  tchuflg4     CHAR(1),
  tchuflg5     CHAR(1),
  tchuflg6     CHAR(1),
  tchuflg7     CHAR(1),
  tchuflg8     CHAR(1),
  tchuflg9     CHAR(1),
  tchzip       VARCHAR2(13),
  idcity       NUMBER(11),
  idcitycntc   NUMBER(11),
  idclssetup   NUMBER(11),
  iddept       NUMBER(11),
  idethnic     NUMBER(11),
  idlanguage   NUMBER(11),
  idrelation   NUMBER(11),
  idschlicns   NUMBER(6),
  idstate      NUMBER(11),
  idstatecnt   NUMBER(11),
  idtchposn    NUMBER(11),
  idtchudls1   NUMBER(11),
  idtchudls2   NUMBER(11),
  idtchudls3   NUMBER(11),
  idtchudls4   NUMBER(11),
  idtchudls5   NUMBER(11),
  idtchudls6   NUMBER(11),
  idtchudls7   NUMBER(11),
  idtchudls8   NUMBER(11),
  idteacher    NUMBER(11),
  idtitle      NUMBER(11),
  idtrack      NUMBER(11),
  tchposn      VARCHAR2(29),
  tchschtype   VARCHAR2(15),
  tchufld11    VARCHAR2(15),
  tchufld12    VARCHAR2(15),
  tchufld13    VARCHAR2(15),
  tchufld14    VARCHAR2(15),
  tchufld15    VARCHAR2(15),
  tchufld16    VARCHAR2(15),
  tchuflg11    CHAR(1),
  tchuflg12    CHAR(1),
  tchuflg13    CHAR(1),
  tchuflg14    CHAR(1),
  tchuflg15    CHAR(1),
  tchuflg16    CHAR(1),
  tchulist1    VARCHAR2(29),
  tchulist2    VARCHAR2(29),
  tchulist3    VARCHAR2(29),
  tchulist4    VARCHAR2(29),
  tchulist5    VARCHAR2(29),
  tchulist6    VARCHAR2(29),
  tchulist7    VARCHAR2(29),
  tchulist8    VARCHAR2(29),
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_TCHDEMO_SCHOOLID on ROYSECITY.TCHDEMO (SCHOOLID)
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
create bitmap index ROYSECITY.BIX_TCHDEMO_TCHACTIVE on ROYSECITY.TCHDEMO (TCHACTIVE)
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
create bitmap index ROYSECITY.BIX_TCHDEMO_TCHACTIVE_ACTIVE on ROYSECITY.TCHDEMO (SCHOOLID, TCHACTIVE)
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
create unique index ROYSECITY.PK_TCHDEMO on ROYSECITY.TCHDEMO (SCHOOLID, IDTEACHER)
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
create unique index ROYSECITY.UX_TCHDEMO on ROYSECITY.TCHDEMO (SCHOOLID, TCHNUMBER)
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
prompt Creating table TCHTTBL
prompt ======================
prompt
create table ROYSECITY.TCHTTBL
(
  dayschterm   NUMBER(2),
  mkclssctn    NUMBER(5),
  schoolid     VARCHAR2(9),
  timeslot     NUMBER(5),
  idclass      NUMBER(11),
  idcourse     NUMBER(11),
  idschlicns   NUMBER(6),
  idteacher    NUMBER(11) not null,
  r10_loaddate DATE
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
create bitmap index ROYSECITY.BIX_TCHTTBL_SCHOOLID on ROYSECITY.TCHTTBL (SCHOOLID)
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
prompt Creating table TRACKCAL
prompt =======================
prompt
create table ROYSECITY.TRACKCAL
(
  dayatdterm NUMBER(2),
  daydate    DATE,
  dayhasatd  VARCHAR2(1),
  dayinatdtm NUMBER(3),
  dayinpmtm  NUMBER(3),
  dayinschtm NUMBER(3),
  dayinyear  NUMBER(3),
  daypmterm  NUMBER(2),
  daysched   NUMBER(2),
  dayschterm NUMBER(2),
  daystrack  VARCHAR2(21),
  daytype    VARCHAR2(21),
  dayvalue   NUMBER(3,1),
  iddaysched NUMBER(11),
  iddaytype  NUMBER(11),
  idschlicns NUMBER(6),
  idtrack    NUMBER(11),
  schoolid   VARCHAR2(9)
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
create bitmap index ROYSECITY.BIX_TRACKCAL_DAYSTRACK on ROYSECITY.TRACKCAL (DAYSTRACK)
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
create bitmap index ROYSECITY.BIX_TRACKCAL_DAYVALUE on ROYSECITY.TRACKCAL (DAYVALUE)
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
create bitmap index ROYSECITY.BIX_TRACKCAL_IDTRACK on ROYSECITY.TRACKCAL (IDTRACK)
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
create bitmap index ROYSECITY.BIX_TRACKCAL_SCHOOLID on ROYSECITY.TRACKCAL (SCHOOLID)
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
prompt Creating table ZIP
prompt ==================
prompt
create table ROYSECITY.ZIP
(
  zip_code       VARCHAR2(12),
  zip_city       VARCHAR2(40),
  zip_state      VARCHAR2(4),
  zip_country    VARCHAR2(12),
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
prompt Creating view V_CLSMEET
prompt =======================
prompt
create or replace force view roysecity.v_clsmeet as
select  
  clsttbl.idcourse
, clsttbl.idclass
, clsttbl.mkclssctn
, clsttbl.dayschterm
, clsttbl.crsnumber
, clsttbl.crsname
, clsttbl.crsseqnum 
, calttbl.from_period
, calttbl.to_period
, to_char(min(calttbl.firstday),'YYYYMMDD') as from_date
, to_char(max(calttbl.lastday),'YYYYMMDD') as "to_date"
, to_char(calttbl.from_time,'HH24') as from_hour
, to_char(calttbl.from_time,'MI') as from_minute
, to_char(calttbl.to_time,'HH24') as to_hour
, to_char(calttbl.to_time,'MI') as to_minute
, calttbl.from_time
, calttbl.to_time
, REGEXP_REPLACE(clsttbl.crsgrade,'N/A','NA') as grade
, REGEXP_REPLACE(clsttbl.grdshort,'N/A','NA') as from_grd_lvl
, clsttbl.idteacher
, clsttbl.crscoopvoc as voc_intent
, clsttbl.rmnumber as room
, spminstr.pminstcode as instructional_stng
, to_char(sschinfo.schyearend,'YYYY') as schl_year
, 'S' || clsttbl.dayschterm as term
, sschinfo.schyearsta
, sschinfo.schyearend
, clsttbl.schoolid

from    SPMINSTR spminstr,
        SSCHINFO sschinfo,
        (select 
                clsttbl.schoolid 
              , clsttbl.dayschterm
              , clsttbl.idcourse
              , clsttbl.idclass
              , clsttbl.mkclssctn
              , clsttbl.timeslot
              , crsdemo.crsnumber
              , crsdemo.crsname
              , crsdemo.crsseqnum 
              , crsdemo.crscoopvoc 
              , crsdemo.crsgrade
              , sgrades.grdshort
              , clsttbl.rmnumber 
              , clsttbl.idteacher
         from CLSTTBL clsttbl, 
              CRSDEMO crsdemo,
              SGRADES sgrades
         where clsttbl.schoolid = crsdemo.schoolid(+)
           and clsttbl.idcourse = crsdemo.idcourse(+)
           and crsdemo.idgrade = sgrades.idgrade(+)
           and crsdemo.crsactive =1 ) clsttbl,  
       (select distinct 
              crsnumber
              , idclass
              , mkclssctn
              , idpminstr
              , schoolid 
        from CLSINFO) clsinfo,
        (select  
                  calttbl.schoolid
                , calttbl.dayschterm
                , null as daysched 
                , case
                      when (dayschterm = 1) and (substr(calttbl.schoolid,7,3) > 100) and (calttbl.timeslot < 0 )
                      then 0
                      when (dayschterm = 2) and (substr(calttbl.schoolid,7,3) > 100) and (calttbl.timeslot < 0 )
                      then 1
                      else calttbl.timeslot
                  end as timeslot
                , min(calttbl.calperiod) as from_period 
                , max(calttbl.calperiod) as to_period
                , median(calttbl.calperiod) as friday_period
                , min(calttbl.daydate) as firstday
                , max(calttbl.daydate) as lastday
                , min(calttbl.idperiod) as from_idperiod
                , max(calttbl.idperiod) as to_idperiod
                , min(to_date(sprdname.prdstrttm,'HH24:MI'))  as from_time
                , max(to_date(sprdname.prdendtm,'HH24:MI')) as to_time
          from  CALTTBL calttbl, 
                SPRDNAME sprdname
          where calttbl.schoolid = sprdname.schoolid(+)
            and calttbl.idperiod = sprdname.idperiod(+)
            and calttbl.dayschterm in (1, 2)
          group by calttbl.schoolid, calttbl.dayschterm, calttbl.timeslot ) calttbl

where clsttbl.schoolid = clsinfo.schoolid(+)
and clsttbl.idclass = clsinfo.idclass(+)
and clsttbl.mkclssctn = clsinfo.mkclssctn(+)
and clsttbl.crsnumber = clsinfo.crsnumber(+)

and clsttbl.schoolid = calttbl.schoolid(+)
and clsttbl.dayschterm = calttbl.dayschterm(+)
and clsttbl.timeslot = calttbl.timeslot(+)

and clsinfo.schoolid = spminstr.schoolid(+)
and clsinfo.idpminstr = spminstr.idpminstr(+)

and clsttbl.schoolid = sschinfo.schoolid(+)
and to_char(sschinfo.schyearend,'YYYY') = dw.fn_curr_schl_yr
and calttbl.firstday between sschinfo.schyearsta and sschinfo.schyearend
and calttbl.lastday between sschinfo.schyearsta and sschinfo.schyearend
 
group by  
  clsttbl.idcourse
, clsttbl.idclass
, clsttbl.mkclssctn
, clsttbl.dayschterm
, clsttbl.crsnumber
, clsttbl.crsname
, clsttbl.crsseqnum 
, calttbl.from_period
, calttbl.to_period
, calttbl.from_time
, calttbl.to_time
, clsttbl.crsgrade
, clsttbl.grdshort
, clsttbl.idteacher
, clsttbl.crscoopvoc
, clsttbl.rmnumber
, spminstr.pminstcode
, sschinfo.schyearsta
, sschinfo.schyearend
, clsttbl.schoolid

order by
  clsttbl.idcourse
, clsttbl.idclass
, clsttbl.mkclssctn
, clsttbl.dayschterm;

prompt
prompt Creating view V_EMP_DEMOGRAPHIC
prompt ===============================
prompt
create or replace force view roysecity.v_emp_demographic as
Select "NAME_ID","TOTAL_EXP","DISTRICT_EXP","FIS_YEAR","RANK" from (select NAME_ID, TOTAL_EXP, DISTRICT_EXP, FIS_YEAR, 
    rank() over (partition by NAME_ID order by  FIS_YEAR desc) as rank 
from ftx_emp_demographic
)
where rank=1
  and total_exp < 99;

prompt
prompt Creating view V_STUDDEMO
prompt ========================
prompt
create or replace force view roysecity.v_studdemo as
select 
studdemo.idstudent,
studdemo.stdnumber,
studdemo.stdactive,
to_char(studcalid.startday, 'YYYY-MM-DD') as startdate,
case when studcalid.lastday is null
           then to_char(studcalid.schyearend,'YYYY-MM-DD') 
           else to_char(studcalid.lastday, 'YYYY-MM-DD')
end as lastday,
studdemo.idgrade,
studdemo.stdssn,
studdemo.stdlastn, 
studdemo.stdfirstn,
studdemo.stdmiddlen,  
studdemo.stdbirth,
studdemo.stdpaddr1,
studdemo.stdpaddr2,
studdemo.stdpcity,
studdemo.stdpstate,
studdemo.stdpzip,
studdemo.stdhphone,
studdemo.stdhphone2,
studdemo.stdgender,
studdemo.stdethnic,
studdemo.schoolid,
studcalid.schyearsta,
studcalid.schyearend,
studcalid.schl_year,
studdemo.idschlicns

from    STUDDEMO studdemo,
        ( select
                studcal.schoolid,
                studcal.idstudent,
                min(studcal.daydate) as startday,
                max(studcal.daydate) as lastday,
                sschinfo.schyearsta,
                sschinfo.schyearend,
                to_number(to_char(sschinfo.schyearend,'YYYY')) as schl_year
          from STUDCAL studcal, SSCHINFO sschinfo
          where studcal.schoolid = sschinfo.schoolid
            and to_char(sschinfo.schyearend,'YYYY') = dw.fn_curr_schl_yr
            and daydate between sschinfo.schyearsta and sschinfo.schyearend
            and studcal.sdaystatus in ('E','OE','R','RE')
          group by studcal.schoolid, studcal.idstudent, sschinfo.schyearsta, sschinfo.schyearend ) studcalid


where studdemo.idstudent = studcalid.idstudent
  and studdemo.schoolid = studcalid.schoolid;

prompt
prompt Creating view V_STUDGRADES
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW ROYSECITY.V_STUDGRADES AS
SELECT DISTINCT
         studcrs.idstudent,
         studcrs.stdnumber,
         studcrs.idcourse,
         studcrs.idclass,
         studcrs.mkclssctn,
         studcrs.crsnumber,
         studcrs.dayschterm,
         studcrs.crsseqnum,
         studcrs.crsname,
         studcrs.todate,
         studcrs.schoolid,
         binmarks.idschlicns,
         REGEXP_REPLACE(sgrades.grdshort,'N/A','NA') AS   grade_lvl_id,
         substr(binmarks.binname,1,1) AS   grading_period,
         CASE   
            WHEN lower   (binmarks.binname) like '% six weeks'
            THEN  'Six Weeks'
            WHEN lower   (binmarks.binname) like '% term grade'
            THEN  'Term'
            WHEN lower   (binmarks.binname) like '% term exam'
            THEN  'Term Exam'
            WHEN lower   (binmarks.binname) like 'year end final grade'
            THEN 'Year End Final'
            ELSE  '###unknown###' || lower(binmarks.binname)
         END AS   grades_type,
         binmarks.mkpercent AS   sec_nbr_grd,
         binmarks.mkltrgrade AS   sec_letter_grd,
         binmarks.mkfinalmrk * binmarks.mkpotcredt AS   credits_attempted,
         binmarks.mkfinalmrk * binmarks.mkerncredt AS   credits_earned,
         binmarks.idteacher,
         studcrs.doubleblocked 
 FROM binmarks binmarks,
      SGRADES sgrades,
      ( SELECT  
            bin.idstudent,
            bin.stdnumber,
            bin.idcourse,
            bin.idclass,
            bin.mkclssctn,
            crs.crsnumber,
            crs.crsname,
            bin.dayschterm,
            crs.crsseqnum, 
            bin.idgrade,
            ctbl.todate,
            bin.schoolid,
            CASE    
                WHEN count(*) > 1 
                THEN 'Y'
                ELSE 'N'
            END AS doubleblocked
        FROM CRSDEMO crs,
             ( SELECT 
                     idstudent,
                     idcourse,
                     idclass,
                     mkclssctn,
                     dayschterm,
                     schoolid,
                     max(todate) AS todate
               FROM STUDCTBL
               GROUP BY idstudent, idcourse, idclass, mkclssctn, dayschterm, schoolid ) ctbl,
             ( SELECT DISTINCT
                     binmarks.idstudent,
                     studdemo.stdnumber,
                     binmarks.idcourse,
                     binmarks.idclass,
                     binmarks.mkclssctn,
                     CASE 
                        WHEN ((substr(binmarks.binname,1,1) IN ('1','2','3') AND lower(binmarks.binname) LIKE '% six weeks')
                         OR (substr(binmarks.binname,1,1) = '1' AND lower(binmarks.binname) LIKE '% term grade')
                         OR (substr(binmarks.binname,1,1) = '1' AND lower(binmarks.binname) LIKE '% term exam'))
                       THEN '1'
                       WHEN ((substr(binmarks.binname,1,1) IN ('4','5','6') AND lower(binmarks.binname) LIKE '% six weeks')
                         OR (substr(binmarks.binname,1,1) = '2' AND lower(binmarks.binname) LIKE '% term grade')
                         OR (substr(binmarks.binname,1,1) = '2' AND lower(binmarks.binname) LIKE '% term exam')
                         OR (binmarks.binname LIKE '%Year%'))
                       THEN '2'
                       ELSE '0'
                     END AS dayschterm,
                     studdemo.idgrade,
                     binmarks.schoolid
                FROM BINMARKS binmarks, STUDDEMO studdemo 
                WHERE studdemo.schoolid = binmarks.schoolid
                  AND studdemo.idstudent = binmarks.idstudent) bin
        WHERE  bin.schoolid = ctbl.schoolid(+)
          AND  bin.idstudent = ctbl.idstudent(+)
          AND  bin.idclass = ctbl.idclass(+)
          AND  bin.idcourse = ctbl.idcourse(+)
          AND  bin.mkclssctn = ctbl.mkclssctn(+)
          AND  bin.dayschterm = ctbl.dayschterm(+)
          AND  bin.idcourse = crs.idcourse(+)
          AND  bin.schoolid = crs.schoolid(+) 
          AND  crs.crsactive=1 
        GROUP BY bin.idstudent, bin.stdnumber, bin.idcourse, bin.idclass, bin.mkclssctn, crs.crsnumber, crs.crsname, bin.dayschterm, ctbl.todate, crs.crsseqnum, bin.idgrade, bin.schoolid ) studcrs

WHERE  binmarks.schoolid = studcrs.schoolid 
  AND  binmarks.idstudent = studcrs.idstudent 
  AND  binmarks.idclass = studcrs.idclass 
  AND  binmarks.idcourse = studcrs.idcourse 
  AND  binmarks.mkclssctn = studcrs.mkclssctn 

  AND  studcrs.idgrade = sgrades.idgrade(+)
  AND  studcrs.schoolid = sgrades.schoolid(+)
  AND    
     (  CASE 
           WHEN ((substr(binmarks.binname,1,1) IN ('1','2','3') AND lower(binmarks.binname) LIKE '% six weeks')
             OR (substr(binmarks.binname,1,1) = '1' AND lower(binmarks.binname) LIKE '% term grade')
             OR (substr(binmarks.binname,1,1) = '1' AND lower(binmarks.binname) LIKE '% term exam'))
           THEN '1'
           WHEN ((substr(binmarks.binname,1,1) IN ('4','5','6') AND lower(binmarks.binname) LIKE '% six weeks')
             OR (substr(binmarks.binname,1,1) = '2' AND lower(binmarks.binname) LIKE '% term grade')
             OR (substr(binmarks.binname,1,1) = '2' AND lower(binmarks.binname) LIKE '% term exam')
             OR (binmarks.binname LIKE '%Year%'))
           THEN '2'
           ELSE '0'
        END ) = studcrs.dayschterm

ORDER BY    studcrs.idstudent, 
            studcrs.stdnumber, 
            studcrs.idcourse, 
            studcrs.idclass, 
            studcrs.mkclssctn, 
            studcrs.crsnumber, 
            studcrs.dayschterm;

prompt
prompt Creating view V_T040
prompt ====================
prompt
create or replace force view roysecity.v_t040 as
Select "SCHOOL_YEAR","E0730","E0505","RANK","E0212" from (select School_year,e0730 ,e0505 ,
    rank() over (partition by e0505 order by  School_year desc) as rank ,e0212
    from T040
    )
    where rank=1;

prompt
prompt Creating package EMPOWER_RC_POST_PROCESSING
prompt ===========================================
prompt
create or replace package roysecity.empower_rc_post_processing is

  procedure encrypt_ssns;
  
end empower_rc_post_processing;
/

prompt
prompt Creating package body EMPOWER_RC_POST_PROCESSING
prompt ================================================
prompt
create or replace package body roysecity.empower_rc_post_processing is

  --**************************************************************************
  -- 
  -- Procedure: encrypt_federal_id_no -- changes ssn on the name table to ****     
  --
  -- Parameters: none
  --  
  -- Note:       processing time -- 0.203 seconds (5/11/2011)
  --             
  -- Revision History
  -- Date             Author            Remarks
  -- 5/10/2011        J. Jenkins        Original version
  --
  --**************************************************************************
  
  procedure encrypt_ssns
                               
  is
          
  begin
               
    -- update name federal_id_no (ssn)
    
      update name 
      set federal_id_no = '*********';
  
      commit;
        
    -- update sr_stu_enroll state_stu_id (ssn)
    
      update sr_stu_enroll 
      set state_stu_id = '*********';
  
      commit;
        
    -- update sr_stu_enroll state_stu_id_prior (ssn)
    
      update sr_stu_enroll 
      set state_stu_id_prior = '*********';
  
      commit;
                                                                                                
    exception
    when others then
      
      rollback;
      raise; 
  
  end encrypt_ssns;

end empower_rc_post_processing;
/


spool off
