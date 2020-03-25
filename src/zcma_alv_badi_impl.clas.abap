class ZCMA_ALV_BADI_IMPL definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZIF_ALV_BADI .
protected section.
private section.
ENDCLASS.



CLASS ZCMA_ALV_BADI_IMPL IMPLEMENTATION.


  method ZIF_ALV_BADI~SELECT_DATA.

    SELECT *
      FROM bkpf
      INTO TABLE @ch_table
      WHERE bldat IN @im_docdat_range.

  endmethod.
ENDCLASS.
