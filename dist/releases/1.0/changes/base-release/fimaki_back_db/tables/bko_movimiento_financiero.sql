-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726439 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_movimiento_financiero.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_movimiento_financiero.sql:null:20961714c0b727c7b3ab86326967b770438d8fe0:create

create table fimaki_back_db.bko_movimiento_financiero (
    id_movimiento_financiero number
        generated always as identity
    not null enable,
    id_rol_persona           number not null enable,
    id_factura               number,
    id_inversion_factura     number,
    tipo_movimiento_rc       varchar2(30 char) not null enable,
    monto                    number(12, 2) not null enable,
    moneda_rc                varchar2(10 char) default 'PEN' not null enable,
    estado_rc                varchar2(30 char) default 'PENDIENTE' not null enable,
    referencia_externa       varchar2(100 char),
    fecha_movimiento         date default sysdate not null enable,
    observaciones            varchar2(500 char),
    creado                   timestamp(6) with local time zone default current_timestamp not null enable,
    creado_por               varchar2(100 char) default sys_context('USERENV', 'SESSION_USER') not null enable,
    modificado               timestamp(6) with local time zone,
    modificado_por           varchar2(100 char),
    id_deposito              number,
    id_cuenta_bancaria       number
);

alter table fimaki_back_db.bko_movimiento_financiero add primary key ( id_movimiento_financiero )
    using index enable;

