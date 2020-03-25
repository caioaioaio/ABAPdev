*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZCMA_T_TESTE1
*   generation date: 03/06/2020 at 17:15:03
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZCMA_T_TESTE1      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
