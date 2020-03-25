REPORT zcma_report_confeitaria.

CLASS main DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA flavour TYPE zcma_confeitaria-bolo_sabor.
    CLASS-METHODS main.

  PRIVATE SECTION.
    CLASS-DATA results TYPE STANDARD TABLE OF zcma_confeitaria.

ENDCLASS.

SELECT-OPTIONS sflav FOR main=>flavour NO INTERVALS NO-EXTENSION.

CLASS main IMPLEMENTATION.

  METHOD main.

    SELECT *
      FROM zcma_confeitaria
      INTO TABLE @results
      WHERE zcma_confeitaria~bolo_sabor IN @sflav.

    IF results IS INITIAL.
      MESSAGE `Não há resultados` TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.

    TRY.
    CL_SALV_TABLE=>factory(
      IMPORTING
        r_salv_table   = DATA(salv_table)
      CHANGING
        t_table        = results
    ).
    CATCH cx_salv_msg.
      MESSAGE `Não foi possível gerar a lista` TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDTRY.

    salv_table->display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
main=>main( ).
