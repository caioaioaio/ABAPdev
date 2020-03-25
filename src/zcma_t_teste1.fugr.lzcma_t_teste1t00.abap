*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/06/2020 at 17:15:03
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_T_TESTE1...................................*
DATA:  BEGIN OF STATUS_ZCMA_T_TESTE1                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_T_TESTE1                 .
CONTROLS: TCTRL_ZCMA_T_TESTE1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_T_TESTE1                 .
TABLES: ZCMA_T_TESTE1                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
