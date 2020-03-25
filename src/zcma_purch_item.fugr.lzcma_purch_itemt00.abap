*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/12/2020 at 16:37:10
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_PURCH_ITEM.................................*
DATA:  BEGIN OF STATUS_ZCMA_PURCH_ITEM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_PURCH_ITEM               .
CONTROLS: TCTRL_ZCMA_PURCH_ITEM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_PURCH_ITEM               .
TABLES: ZCMA_PURCH_ITEM                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
