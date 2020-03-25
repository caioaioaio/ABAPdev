*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/16/2020 at 13:25:22
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_EMPLOYEE...................................*
DATA:  BEGIN OF STATUS_ZCMA_EMPLOYEE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_EMPLOYEE                 .
CONTROLS: TCTRL_ZCMA_EMPLOYEE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_EMPLOYEE                 .
TABLES: ZCMA_EMPLOYEE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
