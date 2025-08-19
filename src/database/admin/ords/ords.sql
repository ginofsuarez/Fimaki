
--
        
DECLARE
  l_roles     OWA.VC_ARR;
  l_modules   OWA.VC_ARR;
  l_patterns  OWA.VC_ARR;

BEGIN
  ORDS_ADMIN.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'admin',
      p_auto_rest_auth      => FALSE);

  ORDS_ADMIN.CREATE_ROLE(
      p_schema         => 'ADMIN',
      p_role_name=> 'oracle.dbtools.role.autorest.ADMIN');
  ORDS_ADMIN.CREATE_ROLE(
      p_schema         => 'ADMIN',
      p_role_name=> 'oracle.dbtools.role.autorest.any.ADMIN');
  l_roles(1) := 'oracle.dbtools.autorest.any.schema';
  l_roles(2) := 'oracle.dbtools.role.autorest.ADMIN';

  ORDS_ADMIN.DEFINE_PRIVILEGE(
      p_schema         => 'ADMIN',
      p_privilege_name => 'oracle.dbtools.autorest.privilege.ADMIN',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => NULL,
      p_description    => NULL,
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;

  l_roles(1) := 'SODA Developer';
  l_patterns(1) := '/soda/*';

  ORDS_ADMIN.DEFINE_PRIVILEGE(
      p_schema         => 'ADMIN',
      p_privilege_name => 'oracle.soda.privilege.developer',
      p_roles          => l_roles,
      p_patterns       => l_patterns,
      p_modules        => l_modules,
      p_label          => NULL,
      p_description    => NULL,
      p_comments       => NULL); 

  l_roles.DELETE;
  l_modules.DELETE;
  l_patterns.DELETE;


COMMIT;

END;


-- sqlcl_snapshot {"hash":"b4b55a7e9827fb2209187b373bbb3d13c673483a","type":"ORDS_SCHEMA","name":"ords","schemaName":"ADMIN","sxml":""}