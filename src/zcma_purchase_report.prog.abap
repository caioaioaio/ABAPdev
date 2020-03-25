REPORT zcma_purchase_report.

CLASS main DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA header_id type zcma_purchase-id.
    CLASS-DATA purch_date type zcma_purchase-created_on.
    CLASS-METHODS main.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_report_line,
           header TYPE zcma_purchase,
           item TYPE zcma_purch_item,
           end of  TY_REPORT_LINE,
           ty_report_table TYPE TABLE OF ty_report_line.
    CLASS-DATA reports TYPE ty_report_table.
    CLASS-METHODS display_alv.
    CLASS-METHODS select_data.

ENDCLASS.

SELECT-OPTIONS s_id FOR main=>header_id no INTERVALS NO-EXTENSION.
SELECT-OPTIONS s_date FOR main=>purch_date.

CLASS main IMPLEMENTATION.

  METHOD main.
    SELECT_DATA( ).
    display_alv( ).
  ENDMETHOD.

  METHOD display_alv.
  TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table   = DATA(salv_table)
      CHANGING
        t_table        = reports
    ).
    salv_table->get_columns( )->get_column( : 'HEADER-CLIENT' )->set_technical( ),
                                                'ITEM-CLIENT' )->set_technical( ).
    CATCH cx_salv_msg cx_salv_not_found.
    MESSAGE `Erro ao listar os dados` TYPE 'E'.
    LEAVE LIST-PROCESSING.
    ENDTRY.

    salv_table->get_functions( )->set_all( ).
    salv_table->display( ).
  ENDMETHOD.

  METHOD select_data.
    select *
    from zcma_purchase AS header INNER JOIN zcma_purch_item as item
    on header~id = item~purchase_id
    where header~id IN @s_id
    and header~created_on IN @s_date
    into table @reports.

    if reports is initial.
       MESSAGE `Não há resultados para estes parâmetos` TYPE 'E'.
       leave LIST-PROCESSING.
    endif.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  main=>main(  ).
