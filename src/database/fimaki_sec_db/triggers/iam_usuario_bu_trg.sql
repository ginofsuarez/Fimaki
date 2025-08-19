create or replace editionable trigger fimaki_sec_db.iam_usuario_bu_trg before
    update on fimaki_sec_db.iam_usuario
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end iam_usuario_bu_trg;
/

alter trigger fimaki_sec_db.iam_usuario_bu_trg enable;


-- sqlcl_snapshot {"hash":"fd2111598c97fc44319978c82ecc54b1008138f9","type":"TRIGGER","name":"IAM_USUARIO_BU_TRG","schemaName":"FIMAKI_SEC_DB","sxml":""}