@AbapCatalog.sqlViewName: 'ZCMA_V_PARC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZCMA_I_PARCEL'
@Search.searchable: true
@ObjectModel:{
    writeActivePersistence: 'ZCMA_PARCEL',
    semanticKey: ['acc_id', 'parcel_id'],
    representativeKey: 'parcel_id',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view ZCMA_I_PARCELS as select from zcma_parcel as Parcel
association [0..1] to ZCMA_I_ACCREC as _AccountReceivable
on $projection.acc_id = _AccountReceivable.id {
    //zcma_parcel
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    key acc_id,
    @Search.defaultSearchElement: true
    key parcel_id,
    customer,
    parcel_no,
    value,
    curr_code,
    due_date,
    status,
    paid_date,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _AccountReceivable
}
