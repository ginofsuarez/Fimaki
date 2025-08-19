-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726074 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/mail_template_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/mail_template_pkg.sql:null:6684428b483c4f589a8e47416f995082c43bc422:create

create or replace package fimaki_back_db.mail_template_pkg as

	-- Tipo para manejar parámetros dinámicos
    type t_template_params is
        table of varchar2(4000) index by varchar2(100);

	-- Función para obtener una plantilla por su código
    function get_template (
        p_codigo in varchar2
    ) return mail_template%rowtype;

	-- Función para renderizar una plantilla con parámetros
    function render_template (
        p_codigo in varchar2,
        p_params in t_template_params
    ) return clob;

	-- Procedimiento para enviar correo usando una plantilla
    procedure send_template_email (
        p_to              in varchar2,
        p_template_codigo in varchar2,
        p_params          in t_template_params,
        p_from            in varchar2 default null
    );

	-- Procedimiento para crear/actualizar una plantilla
    procedure save_template (
        p_codigo    in varchar2,
        p_nombre    in varchar2,
        p_asunto    in varchar2,
        p_contenido in clob,
        p_usuario   in varchar2
    );

	-- Procedimiento para desactivar una plantilla
    procedure disable_template (
        p_codigo  in varchar2,
        p_usuario in varchar2
    );

 	-- Función para obtener una vista previa de una plantilla
    function get_template_preview (
        p_template_codigo in mail_template.codigo%type,
        p_params          in t_template_params
    ) return clob;

	-- Función para obtener parámetros de depósito
    function get_deposito_params (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type
    ) return t_template_params;

end mail_template_pkg;
/

