-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725680 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_subdivision_geografica.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_subdivision_geografica.sql:null:343dc1af84f2cd8d06866def7347be35a322f2d1:create

create or replace editionable synonym fimaki_app.bko_subdivision_geografica for fimaki_back_db.bko_subdivision_geografica;

