*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/24/2020 at 18:55:41
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZCMA_ALUNO......................................*
DATA:  BEGIN OF STATUS_ZCMA_ALUNO                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZCMA_ALUNO                    .
CONTROLS: TCTRL_ZCMA_ALUNO
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZCMA_ALUNO                    .
TABLES: ZCMA_ALUNO                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
