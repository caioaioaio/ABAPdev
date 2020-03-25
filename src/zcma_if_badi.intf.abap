interface ZCMA_IF_BADI
  public .


  interfaces IF_BADI_INTERFACE .

  types:
    TY_RANGE_DOCID type RANGE OF zcma_t_teste1-documento .
  types:
    TY_RANGE_ITEMID type RANGE OF zcma_t_teste1-item .
  types:
    TY_RANGE_MATERIAL type RANGE OF zcma_t_teste1-material .

  methods SELECT_DATA
    importing
      !IM_DOCID type TY_RANGE_DOCID
      !IM_ITEMID type TY_RANGE_ITEMID
      !IM_MATERIAL type TY_RANGE_MATERIAL
    changing
      !CH_TABELA type ANY TABLE .
endinterface.
