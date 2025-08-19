alter table fimaki_back_db.bko_rol_persona
    add constraint bko_rol_persona_fk
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"f27fdf543aa936f698ec9a234d57930867f8f04a","type":"REF_CONSTRAINT","name":"BKO_ROL_PERSONA_FK","schemaName":"FIMAKI_BACK_DB","sxml":""}