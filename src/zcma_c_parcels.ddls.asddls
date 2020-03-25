@AbapCatalog.sqlViewName: 'ZCMA_C_PARC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZCMA_C_PARCEL'
@Search.searchable: true

@UI.headerInfo.typeName: 'Parcela de compra'
@UI.headerInfo.title.value: 'parcel_id'

@ObjectModel:{
    transactionalProcessingDelegated: true,
    semanticKey: ['acc_id', 'parcel_id'],
    representativeKey: 'parcel_id',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view ZCMA_C_PARCELS as select from ZCMA_I_PARCELS
association [0..1] to ZCMA_C_ACCREC as _AccountReceivable
on $projection.acc_id = _AccountReceivable.id{
    //zcma_parcel
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    key acc_id,
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    key parcel_id,
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    customer,
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    parcel_no,
    @UI.identification: [{position: 20, importance: #HIGH }]
    @UI.lineItem: [ {position: 20, importance: #HIGH } ]
    value,
    curr_code,
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    due_date,
    @UI.identification: [{position: 1, importance: #HIGH }]
    @UI.lineItem: [ {position: 1, importance: #HIGH } ]
    status,
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    paid_date,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _AccountReceivable
}
