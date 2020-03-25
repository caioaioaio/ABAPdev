*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/24/2020 at 18:52:29
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_TURMA......................................*
DATA:  BEGIN OF STATUS_ZCMA_TURMA                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_TURMA                    .
CONTROLS: TCTRL_ZCMA_TURMA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_TURMA                    .
TABLES: ZCMA_TURMA                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
