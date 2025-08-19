-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726313 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_deposito_comprobante_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_deposito_comprobante_jn.sql:null:71aee0bd08b0d96471ed4f11460f6dccdcdf056c:create

create table fimaki_back_db.bko_deposito_comprobante_jn (
    jn_operation      char(3 byte),
    jn_oracle_user    varchar2(30 byte),
    jn_datetime       date,
    jn_notes          varchar2(240 byte),
    jn_appln          varchar2(100 byte),
    jn_session        number(38, 0),
    id_comprobante    number,
    id_deposito       number,
    archivo_nombre    varchar2(255 char),
    archivo_tipo_mime varchar2(100 char),
    archivo_contenido blob,
    usuario_registro  varchar2(100 char),
    creado_por        varchar2(100 char),
    creado            timestamp(6) with local time zone,
    modificado_por    varchar2(100 char),
    modificado        timestamp(6) with local time zone,
    activo_sn         char(1 byte)
);

