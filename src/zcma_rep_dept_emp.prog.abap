REPORT zcma_rep_dept_emp.

CLASS main DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA depno TYPE zcma_department-department_id.
    CLASS-DATA depname TYPE zcma_department-name.
    CLASS-METHODS main.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_report_line,
             dname TYPE zcma_department-name,
             ename TYPE zcma_employee-name,
             erole TYPE zcma_employee-role,
           END OF ty_report_line,
           ty_report TYPE TABLE OF ty_report_line.
    CLASS-DATA results TYPE ty_report.
    CLASS-METHODS select_data.
    CLASS-METHODS display_data.

ENDCLASS.

SELECT-OPTIONS s_depno FOR main=>depno.
SELECT-OPTIONS s_depnam FOR main=>depname NO INTERVALS NO-EXTENSION.

CLASS main IMPLEMENTATION.

  METHOD main.
    select_data( ).
    display_data( ).
  ENDMETHOD.

  METHOD select_data.
    SELECT dep~name, emp~name, emp~role
    FROM zcma_department AS dep
    INNER JOIN zcma_employee as emp ON dep~department_id = emp~department_id
    INTO TABLE @results
    WHERE dep~department_id IN @s_depno
      AND dep~name IN @s_depnam.
  ENDMETHOD.

  METHOD display_data.
    IF results IS NOT INITIAL.
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
          MESSAGE `Não foi possível exibir a lista` TYPE 'E'.
      ENDTRY.
    ELSE.
      MESSAGE `Não há resultados para esta seleção` TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
