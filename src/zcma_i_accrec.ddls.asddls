@AbapCatalog.sqlViewName: 'ZCMA_V_ACCREC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZCMA_I_ACCREC'
@Search.searchable: true
@ObjectModel:{
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZCMA_ACC_RCVBL',
    semanticKey: ['id'],
    representativeKey: 'id',
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZCMA_I_ACCREC as select from zcma_acc_rcvbl as AccountReceivable 
association [1..*] to ZCMA_I_PARCELS as _Parcel
on $projection.id = _Parcel.acc_id{
    //zcma_acc_rcvbl
    @Search.defaultSearchElement: true
    key id,
    nf,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _Parcel
}
