create or replace package body fimaki_back_db.mail_template_pkg as

    -- Implementación de get_template
    function get_template (
        p_codigo in varchar2
    ) return mail_template%rowtype is
        l_template mail_template%rowtype;
    begin
        select
            *
        into l_template
        from
            mail_template
        where
                codigo = p_codigo
            and activo = 'S';

        return l_template;
    exception
        when no_data_found then
            raise_application_error(-20001, 'Plantilla no encontrada: ' || p_codigo);
    end get_template;

    -- Implementación de render_template
    function render_template (
        p_codigo in varchar2,
        p_params in t_template_params
    ) return clob is
        l_template mail_template%rowtype;
        l_content  clob;
        l_param    varchar2(100);
    begin
        -- Obtener la plantilla
        l_template := get_template(p_codigo);
        l_content := l_template.contenido_html;
        
        -- Reemplazar parámetros
        l_param := p_params.first;
        while l_param is not null loop
            l_content := replace(l_content,
                                 '{{'
                                 || l_param
                                 || '}}',
                                 p_params(l_param));

            l_param := p_params.next(l_param);
        end loop;

        return l_content;
    end render_template;

    -- Implementación de send_template_email
    procedure send_template_email (
        p_to              in varchar2,
        p_template_codigo in varchar2,
        p_params          in t_template_params,
        p_from            in varchar2 default null
    ) is
        l_template mail_template%rowtype;
        l_content  clob;
        l_from     varchar2(1000);
    begin
        -- Obtener la plantilla y renderizar el contenido
        l_template := get_template(p_template_codigo);
        l_content := render_template(p_template_codigo, p_params);
        
        -- Obtener el remitente por defecto si no se especifica
        l_from := nvl(p_from,
                      utils_pkg.get_variable('CORREO_NOTIF'));
        
        -- Enviar el correo
        apex_mail.send(
            p_to        => p_to,
            p_from      => l_from,
            p_subj      => l_template.asunto,
            p_body      => null,
            p_body_html => l_content
        );

        apex_mail.push_queue;
    end send_template_email;

    -- Implementación de save_template
    procedure save_template (
        p_codigo    in varchar2,
        p_nombre    in varchar2,
        p_asunto    in varchar2,
        p_contenido in clob,
        p_usuario   in varchar2
    ) is
    begin
        merge into mail_template t
        using (
            select
                p_codigo as codigo
            from
                dual
        ) s on ( t.codigo = s.codigo )
        when matched then update
        set nombre = p_nombre,
            asunto = p_asunto,
            contenido_html = p_contenido,
            modificado_por = p_usuario,
            modificado = current_timestamp
        when not matched then
        insert (
            codigo,
            nombre,
            asunto,
            contenido_html,
            creado_por )
        values
            ( p_codigo,
              p_nombre,
              p_asunto,
              p_contenido,
              p_usuario );

    end save_template;

    -- Implementación de disable_template
    procedure disable_template (
        p_codigo  in varchar2,
        p_usuario in varchar2
    ) is
    begin
        update mail_template
        set
            activo = 'N',
            modificado_por = p_usuario,
            modificado = current_timestamp
        where
            codigo = p_codigo;

        if sql%rowcount = 0 then
            raise_application_error(-20001, 'Plantilla no encontrada: ' || p_codigo);
        end if;

    end disable_template;

    function get_template_preview (
        p_template_codigo in mail_template.codigo%type,
        p_params          in t_template_params
    ) return clob is
        l_preview clob;
    begin
				
		-- Renderizar la plantilla con los datos
        l_preview := render_template(p_template_codigo, p_params);

		-- Retornar el contenido renderizado
        return l_preview;
    exception
        when others then
					-- Log del error y reenvío
            raise_application_error(-20001, 'Error al enviar notificación de voucher: ' || sqlerrm);
    end get_template_preview;

    function get_deposito_params (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type
    ) return t_template_params is
        l_params   mail_template_pkg.t_template_params;
        l_deposito solicitud_deposito_v%rowtype;
    begin
		-- Obtener datos del depósito y cliente
        select
            *
        into l_deposito
        from
            solicitud_deposito_v
        where
            id_deposito = p_id_deposito;

		-- Preparar parámetros
        l_params('nombre_cliente') := initcap(l_deposito.inversionista);
        l_params('nro_operacion') := 'OP-'
                                     || lpad(
            to_char(l_deposito.id_deposito),
            7,
            '0'
        );

        l_params('monto') := l_deposito.moneda_simbolo
                             || ' '
                             || to_char(l_deposito.monto, '999,999.00');

        l_params('fecha_operacion') := to_char(l_deposito.fecha_transferencia, 'DD/MM/YYYY');
        l_params('url_actualizacion') := utils_pkg.get_variable('URL_FIMAKI')
                                         || '/depositos/'
                                         || l_deposito.id_deposito
                                         || '/actualizar';

        l_params('correo_soporte') := utils_pkg.get_variable('CORREO_SOPORTE');

		-- Retornar parámetros
        return l_params;
    exception
        when no_data_found then
            raise_application_error(-20002, 'Depósito no encontrado: ' || p_id_deposito);
        when others then
            raise_application_error(-20003, 'Error al obtener parámetros del depósito: ' || sqlerrm);
    end get_deposito_params;

end mail_template_pkg;
/


-- sqlcl_snapshot {"hash":"360a91d5da528c801c7ca2cea4fe7a81279f51b4","type":"PACKAGE_BODY","name":"MAIL_TEMPLATE_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}