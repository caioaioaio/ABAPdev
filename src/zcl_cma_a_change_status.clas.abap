CLASS zcl_cma_a_change_status DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_superclass
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cma_a_change_status IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.

    DATA header_table TYPE zcma_t_root.

    io_read->retrieve(
      EXPORTING
        iv_node                 = zif_cma_purchase_order_c=>sc_node-root
        it_key                  = it_key
        IMPORTING
        et_data = header_table ).

    DATA(header) = REF zcma_s_root( header_table[ 1 ] ).
    header->status = SWITCH #( header->status
        WHEN 'N' THEN 'P'
        WHEN 'P' THEN 'F'
        ELSE 'P').

    io_modify->update(
      EXPORTING
        iv_node           = zif_cma_purchase_order_c=>sc_node-root
        iv_key            = it_key[ 1 ]-key
        is_data           = header ).

  ENDMETHOD.
ENDCLASS.
