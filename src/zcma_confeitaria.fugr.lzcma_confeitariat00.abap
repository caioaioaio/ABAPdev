*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/16/2020 at 18:37:34
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_CONFEITARIA................................*
DATA:  BEGIN OF STATUS_ZCMA_CONFEITARIA              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_CONFEITARIA              .
CONTROLS: TCTRL_ZCMA_CONFEITARIA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_CONFEITARIA              .
TABLES: ZCMA_CONFEITARIA               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
