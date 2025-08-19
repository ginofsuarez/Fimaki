create or replace package body fimaki_back_db.bko_persona_pkg as
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
    ) is
    begin
        -- Si el ID de la persona es NULL, insertar un nuevo registro
        if p_id_persona is null then
            insert into bko_persona (
                tipo_persona_rc,
                tipo_documento_rc,
                numero_doc,
                nombres,
                apellido_paterno,
                apellido_materno,
                razon_social,
                fecha_nacimiento,
                estado_rc,
                id_pais,
                id_subdivision_n1,
                id_subdivision_n2
            ) values ( p_tipo_persona_rc,
                       p_tipo_documento_rc,
                       p_numero_doc,
                       p_nombres,
                       p_apellido_paterno,
                       p_apellido_materno,
                       p_razon_social,
                       p_fecha_nacimiento,
                       p_estado_rc,
                       p_id_pais,
                       p_id_subdivision_n1,
                       p_id_subdivision_n2 ) returning id_persona into p_id_persona;

        else
            -- Si el ID de la persona ya existe, actualizar el registro
            update bko_persona
            set
                tipo_persona_rc = p_tipo_persona_rc,
                tipo_documento_rc = p_tipo_documento_rc,
                numero_doc = p_numero_doc,
                nombres = p_nombres,
                apellido_paterno = p_apellido_paterno,
                apellido_materno = p_apellido_materno,
                razon_social = p_razon_social,
                fecha_nacimiento = p_fecha_nacimiento,
                estado_rc = p_estado_rc,
                id_pais = p_id_pais,
                id_subdivision_n1 = p_id_subdivision_n1,
                id_subdivision_n2 = p_id_subdivision_n2
            where
                id_persona = p_id_persona;

        end if;
    exception
        when others then
            raise_application_error(-20001, 'Error en el procedimiento UPSERT_PERSONA: ' || sqlerrm);
    end upsert_persona;

    /*
    * Procedure: upsert_rol_persona
    * Description: Inserta o actualiza un registro en la tabla bko_rol_persona.
    * Si el registro ya existe (basado en id_rol_persona), se actualiza.
    * Si no existe, se inserta un nuevo registro.
    */
    procedure upsert_rol_persona (
        p_id_rol_persona in out bko_rol_persona.id_rol_persona%type,
        p_id_persona     in bko_rol_persona.id_persona%type,
        p_tipo_rol_rc    in bko_rol_persona.tipo_rol_rc%type,
        p_fecha_inicio   in bko_rol_persona.fecha_inicio%type,
        p_fecha_fin      in bko_rol_persona.fecha_fin%type,
        p_activo_sn      in bko_rol_persona.activo_sn%type
    ) is
    begin
        -- Si el ID del rol es NULL, insertar un nuevo registro
        if p_id_rol_persona is null then
            insert into bko_rol_persona (
                id_persona,
                tipo_rol_rc,
                fecha_inicio,
                fecha_fin,
                activo_sn
            ) values ( p_id_persona,
                       p_tipo_rol_rc,
                       p_fecha_inicio,
                       p_fecha_fin,
                       p_activo_sn ) returning id_rol_persona into p_id_rol_persona;

        else
            -- Si el ID del rol ya existe, actualizar el registro
            update bko_rol_persona
            set
                id_persona = p_id_persona,
                tipo_rol_rc = p_tipo_rol_rc,
                fecha_inicio = p_fecha_inicio,
                fecha_fin = p_fecha_fin,
                activo_sn = p_activo_sn
            where
                id_rol_persona = p_id_rol_persona;

        end if;
    exception
        when others then
            raise_application_error(-20002, 'Error en el procedimiento UPSERT_ROL_PERSONA: ' || sqlerrm);
    end upsert_rol_persona;

    procedure actualizar_origen_fondos_rc (
        p_id_persona       in number,
        p_origen_fondos_rc in varchar2
    ) is
    begin
        update bko_persona
        set
            origen_fondos_rc = p_origen_fondos_rc
        where
            id_persona = p_id_persona;

    end actualizar_origen_fondos_rc;

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
    ) is
    begin
        if p_id_contacto is null then
            insert into bko_contacto (
                id_persona,
                tipo_contacto_rc,
                activo_sn,
                cargo_rc,
                notas,
                correo,
                telefono_1,
                telefono_2
            ) values ( p_id_persona,
                       p_tipo_contacto_rc,
                       p_activo_sn,
                       p_cargo_rc,
                       p_notas,
                       p_correo,
                       p_telefono_1,
                       p_telefono_2 ) returning id_contacto into p_id_contacto;

        else
            update bko_contacto
            set
                tipo_contacto_rc = p_tipo_contacto_rc,
                activo_sn = p_activo_sn,
                cargo_rc = p_cargo_rc,
                notas = p_notas,
                correo = p_correo,
                telefono_1 = p_telefono_1,
                telefono_2 = p_telefono_2
            where
                id_contacto = p_id_contacto;

        end if;
    end upsert_contacto;

end bko_persona_pkg;
/


-- sqlcl_snapshot {"hash":"cef680d5ac66c5f9b0b51ebafb2dcc4fff8f41c5","type":"PACKAGE_BODY","name":"BKO_PERSONA_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}