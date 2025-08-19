-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726056 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/bko_persona_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/bko_persona_pkg.sql:null:519567ffc4535315bc3d7be03f467ac01d85a511:create

create or replace package fimaki_back_db.bko_persona_pkg as
    /*
    * Package: bko_persona_pkg
    * Description: Este paquete contiene procedimientos relacionados con la gestión de personas y roles en el sistema.
    */

    /*
    * Procedure: upsert_persona
    * Description: Inserta o actualiza un registro en la tabla bko_persona.
    * Si el registro ya existe (basado en id_persona), se actualiza.
    * Si no existe, se inserta un nuevo registro.
    */

    procedure upsert_persona (
        p_id_persona        in out bko_persona.id_persona%type,
        p_tipo_persona_rc   in bko_persona.tipo_persona_rc%type,
        p_tipo_documento_rc in bko_persona.tipo_documento_rc%type,
        p_numero_doc        in bko_persona.numero_doc%type,
        p_nombres           in bko_persona.nombres%type,
        p_apellido_paterno  in bko_persona.apellido_paterno%type,
        p_apellido_materno  in bko_persona.apellido_materno%type,
        p_razon_social      in bko_persona.razon_social%type,
        p_fecha_nacimiento  in bko_persona.fecha_nacimiento%type,
        p_estado_rc         in bko_persona.estado_rc%type,
        p_id_pais           in bko_persona.id_pais%type,
        p_id_subdivision_n1 in bko_persona.id_subdivision_n1%type,
        p_id_subdivision_n2 in bko_persona.id_subdivision_n2%type
    );

    /*
    * Procedure: upsert_rol_persona
    * Description: Inserta o actualiza un registro en la tabla bko_rol_persona.
    * Si el registro ya existe (basado en id_rol_persona), se actualiza.
    * Si no existe, se inserta un nuevo registro.
    * Parameters:
    *   - p_id_rol_persona: Identificador único del rol asignado a la persona. Si es NULL, se inserta un nuevo registro.
    *   - p_id_persona: Identificador de la persona a la que se asigna el rol.
    *   - p_tipo_rol_rc: Tipo de rol asignado (ej. CEDENTE, PAGADOR, INVERSIONISTA, etc.).
    *   - p_fecha_inicio: Fecha desde la cual el rol está activo.
    *   - p_fecha_fin: Fecha hasta la cual el rol estuvo activo (NULL si aún vigente).
    *   - p_activo_sn: Indica si el rol está activo (S=Sí, N=No).
    */
    procedure upsert_rol_persona (
        p_id_rol_persona in out bko_rol_persona.id_rol_persona%type,
        p_id_persona     in bko_rol_persona.id_persona%type,
        p_tipo_rol_rc    in bko_rol_persona.tipo_rol_rc%type,
        p_fecha_inicio   in bko_rol_persona.fecha_inicio%type,
        p_fecha_fin      in bko_rol_persona.fecha_fin%type,
        p_activo_sn      in bko_rol_persona.activo_sn%type
    );

    /*
    * Procedure: actualizar_origen_fondos_rc
    * Description: Actualiza el campo origen_fondos_rc en la tabla bko_persona
    *              para una persona específica.
    * Parameters:
    *   - p_id_persona: Identificador único de la persona cuyo origen de fondos será actualizado.
    *   - p_origen_fondos_rc: Valor que se asignará al campo origen_fondos_rc (ej. AHORROS, SUELDO, etc.).
    */
    procedure actualizar_origen_fondos_rc (
        p_id_persona       in number,
        p_origen_fondos_rc in varchar2
    );

    procedure upsert_contacto (
        p_id_contacto      in out bko_contacto.id_contacto%type,
        p_tipo_contacto_rc in bko_contacto.tipo_contacto_rc%type,
        p_activo_sn        in bko_contacto.activo_sn%type,
        p_id_persona       in bko_contacto.id_persona%type,
        p_cargo_rc         in bko_contacto.cargo_rc%type,
        p_notas            in bko_contacto.notas%type,
        p_correo           in bko_contacto.correo%type,
        p_telefono_1       in bko_contacto.telefono_1%type,
        p_telefono_2       in bko_contacto.telefono_2%type
    );

end bko_persona_pkg;
/

