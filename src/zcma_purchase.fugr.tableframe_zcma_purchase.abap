*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZCMA_PURCHASE
*   generation date: 03/12/2020 at 15:43:44
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZCMA_PURCHASE      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
