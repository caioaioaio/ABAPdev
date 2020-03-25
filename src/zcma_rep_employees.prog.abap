REPORT zcma_rep_employees.

CLASS main DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA name TYPE zcma_employee-name.
    CLASS-DATA admission_date TYPE zcma_employee-admission_date.
    CLASS-METHODS main.

  PRIVATE SECTION.
    class-DATA t_values type STANDARD TABLE OF zcma_employee.
    CLASS-METHODS start_selection.
    CLASS-METHODS display_selection.


ENDCLASS.

SELECT-OPTIONS s_name FOR main=>name NO INTERVALS NO-EXTENSION.
SELECT-OPTIONS s_admdat FOR main=>admission_date.

CLASS main IMPLEMENTATION.

  METHOD main.
    start_selection( ).
    display_selection( ).
  ENDMETHOD.

  METHOD start_selection.
    SELECT *
      FROM ZCMA_EMPLOYEE
      INTO TABLE @t_values
      WHERE zcma_employee~name in @s_name
      and zcma_employee~admission_date in @s_admdat.
  ENDMETHOD.

  METHOD display_selection.
    IF t_values is not initial.
      try.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table   = DATA(SALV_TABLE)
        CHANGING
          t_table        = t_values
      ).
      salv_table->get_functions( )->set_all( ).
      salv_table->display( ).
      CATCH cx_salv_msg.
        message `Não foi possível completar a solicitação` type 'E'.
        leave LIST-PROCESSING.
      endtry.
    else.

    ENDIF.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
