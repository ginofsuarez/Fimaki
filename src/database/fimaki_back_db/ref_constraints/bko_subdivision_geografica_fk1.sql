alter table fimaki_back_db.bko_subdivision_geografica
    add constraint bko_subdivision_geografica_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"8381194b0cf81be604755fa57daee19c7f4991db","type":"REF_CONSTRAINT","name":"BKO_SUBDIVISION_GEOGRAFICA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}