*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZCMA_ALUNO_GF
*   generation date: 03/24/2020 at 18:55:40
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZCMA_ALUNO_GF      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
