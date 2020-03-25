REPORT zcma_report.

CLASS main DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA document_date TYPE bkpf-bldat.
    CLASS-METHODS main.

  PRIVATE SECTION.

    CLASS-DATA results TYPE STANDARD TABLE OF bkpf.
    CLASS-METHODS: select_data,
      display_alv.

ENDCLASS.

SELECT-OPTIONS s_docdat FOR main=>document_date.

CLASS main IMPLEMENTATION.
  METHOD main.
    select_data( ).
    display_alv( ).
  ENDMETHOD.

  METHOD select_data.

    SELECT *
      FROM bkpf
      WHERE bkpf~bldat IN @s_docdat
      INTO TABLE @results.

    IF results IS INITIAL.
      MESSAGE TEXT-e01 TYPE 'S' DISPLAY LIKE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.

  ENDMETHOD.

  METHOD display_alv.

    TRY.
        cl_salv_table=>factory(
                        IMPORTING r_salv_table = DATA(salv_table)
                        CHANGING t_table = results ).
        salv_table->get_functions( )->set_all( ).
        salv_table->display( ).
      CATCH cx_salv_msg.
        MESSAGE `Não foi possível gerar a lista de valores` TYPE 'E'.
        LEAVE LIST-PROCESSING.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
