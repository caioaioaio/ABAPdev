CLASS zcl_cma_d_convert_value DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_changes
      IMPORTING
                io_read               TYPE REF TO /bobf/if_frw_read
                it_key                TYPE /bobf/t_frw_key
      CHANGING
                item_table            TYPE zcma_t_item
      RETURNING VALUE(change_content) TYPE /bobf/t_frw_change_content.

    METHODS do_update
      IMPORTING
        item_table     TYPE zcma_t_item
        change_content TYPE /bobf/t_frw_change_content
        io_read        TYPE REF TO /bobf/if_frw_read
        io_modify      TYPE REF TO /bobf/if_frw_modify
      CHANGING
        change_table   TYPE zcma_t_item.

ENDCLASS.


CLASS zcl_cma_d_convert_value IMPLEMENTATION.
  METHOD /bobf/if_frw_determination~execute.

    DATA: item_table     TYPE zcma_t_item,
          change_table   TYPE zcma_t_item,
          change_content TYPE /bobf/t_frw_change_content.

    me->get_changes(
      EXPORTING
        io_read    = io_read
        it_key     = it_key
      CHANGING
        item_table = item_table
      RECEIVING
        change_content     = change_content
    ).
    me->do_update(
      EXPORTING
        item_table     = item_table
        change_content =  change_content
        io_read        =  io_read
        io_modify      = io_modify
      CHANGING
        change_table   = change_table
    ).
  ENDMETHOD.

  METHOD get_changes.
    io_read->retrieve(
      EXPORTING
        iv_node                 = zif_cma_purchase_order_c=>sc_node-item
        it_key                  = it_key
      IMPORTING
        et_data                 = item_table
    ).

    io_read->compare(
      EXPORTING
        iv_node_key        = zif_cma_purchase_order_c=>sc_node-item
        it_key             = it_key
      IMPORTING
         eo_change          = DATA(change)
    ).


    IF NOT change->has_changes( ).
      RETURN.
    ENDIF.

    change->get(
        IMPORTING
        et_content_change     = change_content ).
  ENDMETHOD.

  METHOD do_update.
    LOOP AT item_table ASSIGNING FIELD-SYMBOL(<item>).
      READ TABLE change_content ASSIGNING FIELD-SYMBOL(<changing_content>) WITH KEY key = <item>-key.
      CHECK sy-subrc = 0.
      io_read->retrieve(
        EXPORTING
          iv_node                 = zif_cma_purchase_order_c=>sc_node-item
          it_key                  = VALUE /bobf/t_frw_key( ( key = <changing_content>-content_key ) )
        IMPORTING
          et_data                 = change_table
      ).

      DATA(change_line) = VALUE zcma_s_item( change_table[ key = <item>-key ] OPTIONAL ).
      CHECK NOT change_line IS INITIAL.

      CALL FUNCTION 'CONVERT_TO_LOCAL_CURRENCY'
        EXPORTING
          date             = sy-datum
          foreign_amount   = <item>-value
          foreign_currency = <item>-currency_code
          local_currency   = change_line-currency_code
        IMPORTING
          local_amount     = <item>-value
        EXCEPTIONS
          no_rate_found    = 1
          overflow         = 2
          no_factors_found = 3
          no_spread_found  = 4
          derived_2_times  = 5
          OTHERS           = 6.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.

      io_modify->update(
        EXPORTING
          iv_node           = zif_cma_purchase_order_c=>sc_node-item
          iv_key            = <item>-key
          is_data           = REF #( <item> )
          it_changed_fields = VALUE /bobf/t_frw_name( ( `VALUE` ) )
      ).

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
