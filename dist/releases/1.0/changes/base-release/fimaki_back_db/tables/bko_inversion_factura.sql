-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726426 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_inversion_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_inversion_factura.sql:null:5c4e53fcc1ea5595d1895e6a893e4e4c24c2f021:create

create table fimaki_back_db.bko_inversion_factura (
    id_inversion_factura  number
        generated always as identity
    not null enable,
    id_factura            number not null enable,
    id_rol_persona        number not null enable,
    monto_invertido       number not null enable,
    rendimiento_estimado  number,
    fecha_inversion       date default sysdate not null enable,
    fecha_vencimiento_est date,
    plazo_en_dias         number,
    estado_rc             varchar2(30 byte) default 'VIGENTE',
    creado                timestamp(6) with local time zone default current_timestamp not null enable,
    creado_por            varchar2(100 char) default sys_context('USERENV', 'SESSION_USER') not null enable,
    modificado_por        varchar2(100 char),
    modificado            timestamp(6) with local time zone,
    moneda_rc             varchar2(20 byte)
);

alter table fimaki_back_db.bko_inversion_factura add primary key ( id_inversion_factura )
    using index enable;

