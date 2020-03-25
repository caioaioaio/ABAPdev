*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/12/2020 at 15:43:45
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_PURCHASE...................................*
DATA:  BEGIN OF STATUS_ZCMA_PURCHASE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_PURCHASE                 .
CONTROLS: TCTRL_ZCMA_PURCHASE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_PURCHASE                 .
TABLES: ZCMA_PURCHASE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
