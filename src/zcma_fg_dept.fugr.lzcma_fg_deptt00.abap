*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/16/2020 at 13:18:00
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_DEPARTMENT.................................*
DATA:  BEGIN OF STATUS_ZCMA_DEPARTMENT               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_DEPARTMENT               .
CONTROLS: TCTRL_ZCMA_DEPARTMENT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_DEPARTMENT               .
TABLES: ZCMA_DEPARTMENT                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
