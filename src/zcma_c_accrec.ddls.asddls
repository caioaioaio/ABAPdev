@AbapCatalog.sqlViewName: 'ZCMA_CV_ACCREC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZCMA_C_ACCREC'
@Search.searchable: true

@OData.publish: true

@UI.headerInfo.typeName: 'Contas a receber'
@UI.headerInfo.title.value: 'id'
@ObjectModel:{
    compositionRoot: true,
    transactionalProcessingDelegated: true,
    semanticKey: ['id'],
    representativeKey: 'id',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZCMA_C_ACCREC as select from ZCMA_I_ACCREC as AccountReceivable 
association [1..*] to ZCMA_C_PARCELS as _Parcel
on $projection.id = _Parcel.acc_id{
    //zcma_acc_rcvbl
    
    @Search.defaultSearchElement: true
    @ObjectModel.readOnly: true
    @UI.identification: [{position: 10, importance: #HIGH }]
    @UI.lineItem: [ {position: 10, importance: #HIGH } ]
    key id,
    @UI.identification: [{position: 20, importance: #HIGH }]
    @UI.lineItem: [ {position: 20, importance: #HIGH } ]
    nf, 
    crea_date_time,  
    crea_uname,
    lchg_date_time,
    lchg_uname,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _Parcel
}
