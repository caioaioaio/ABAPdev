class ZCMA_BADI_IMPL definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZCMA_IF_BADI .
protected section.
private section.
ENDCLASS.



CLASS ZCMA_BADI_IMPL IMPLEMENTATION.


  method ZCMA_IF_BADI~SELECT_DATA.
    SELECT *
      FROM zcma_t_teste1
      INTO TABLE @ch_tabela
      WHERE zcma_t_teste1~documento IN @im_docid
      AND zcma_t_teste1~item IN @im_itemid
      AND zcma_t_teste1~material IN @im_material.
  endmethod.
ENDCLASS.
