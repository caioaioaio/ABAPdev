*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZCMA_FG_DEPT
*   generation date: 03/16/2020 at 13:17:59
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZCMA_FG_DEPT       .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
