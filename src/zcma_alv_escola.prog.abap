REPORT zcma_alv_escola.

CLASS main DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA nturma TYPE zcma_turma-codigo.
    CLASS-METHODS main.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_line,
             tcode TYPE zcma_turma-codigo,
             acode TYPE zcma_aluno-matricula,
             aname TYPE zcma_aluno-nome,
           END OF ty_line,
           ty_table TYPE TABLE OF ty_line.
    CLASS-DATA results TYPE ty_table.
    CLASS-METHODS select_data.
    CLASS-METHODS display_data.

ENDCLASS.

SELECTION-SCREEN BEGIN OF BLOCK bloco1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS sturma FOR main=>nturma NO INTERVALS NO-EXTENSION.
SELECTION-SCREEN END OF BLOCK bloco1.

CLASS main IMPLEMENTATION.
  METHOD main.
    select_data( ).
    display_data( ).
  ENDMETHOD.

  METHOD select_data.
    SELECT turma~codigo, aluno~matricula, aluno~nome
      FROM zcma_turma AS turma
        INNER JOIN zcma_aluno AS aluno ON turma~codigo = aluno~turma
    INTO TABLE @results
      WHERE turma~codigo IN @sturma.

    IF results IS INITIAL.
      MESSAGE `Não há valores para sua busca` TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.

  METHOD display_data.
    TRY.
        cl_salv_table=>factory(
          IMPORTING
            r_salv_table   = DATA(salv_table)
          CHANGING
            t_table        = results
        ).
        salv_table->get_functions( )->set_all( ).
        salv_table->display( ).
      CATCH cx_salv_msg.
        MESSAGE `Erro ao criar a lista de valores` TYPE `E`.
        LEAVE LIST-PROCESSING.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
