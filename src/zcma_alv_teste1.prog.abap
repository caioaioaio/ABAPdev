REPORT.

"tables zcma_t_teste1.

CLASS main DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA document_id TYPE zcma_t_teste1-documento.
    CLASS-DATA item_id TYPE zcma_t_teste1-item.
    CLASS-DATA material TYPE zcma_t_teste1-material.
    CLASS-METHODS main.

  PRIVATE SECTION.
    CLASS-DATA results TYPE STANDARD TABLE OF zcma_t_teste1.
    CLASS-METHODS:
      select_data,
      display_data.

ENDCLASS.

SELECTION-SCREEN BEGIN OF BLOCK bloco1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_docid FOR main=>document_id NO INTERVALS no-extension.
  SELECT-OPTIONS s_itemid FOR main=>item_id NO INTERVALS no-extension.
SELECTION-SCREEN END OF BLOCK bloco1.

SELECTION-SCREEN BEGIN OF BLOCK bloco2 WITH FRAME TITLE TEXT-002.
  SELECT-OPTIONS s_mat FOR main=>material NO INTERVALS no-extension.
SELECTION-SCREEN END OF BLOCK bloco2.

CLASS main IMPLEMENTATION.

  METHOD main.
    select_data( ).
    display_data( ).
  ENDMETHOD.

  METHOD select_data.
    data: badi_enhspot type ref to zcma_badi_def.

    get badi badi_enhspot.
    call badi badi_enhspot->select_data
      EXPORTING
        IM_DOCID = S_DOCID[]
        IM_ITEMID = S_ITEMID[]
        IM_MATERIAL = S_MAT[]
      CHANGING
        CH_TABELA = results.

    if results is initial.
      message 'Não tem nenhum resultado para esta seleção' type 'E'.
      leave LIST-PROCESSING.
    endif.
*
*    SELECT *
*      FROM zcma_t_teste1
*      INTO TABLE @results
*      WHERE zcma_t_teste1~documento IN @s_docid
*      AND zcma_t_teste1~item IN @s_itemid
*      AND zcma_t_teste1~material IN @s_mat.

  ENDMETHOD.

  METHOD display_data.
    TRY.
        cl_salv_table=>factory(
          IMPORTING r_salv_table = DATA(salv_table)
          CHANGING t_table = results ).
      CATCH cx_salv_msg.
        MESSAGE `Não foi possível exibir a lista de valores` TYPE 'E'.
    ENDTRY.
    salv_table->get_functions( )->set_all( ).
    salv_table->display( ).
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
