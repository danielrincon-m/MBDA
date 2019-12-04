REVOKE adm_donaciones FROM bd3104340;
REVOKE adm_sucursales FROM bd3104340;
REVOKE org_productos FROM bd3104340;
REVOKE adm_sistema FROM bd3104340;
REVOKE cliente2 FROM bd3104340;
REVOKE banco_alimentos FROM bd3104340;

REVOKE EXECUTE ON PA_ADMIN_DONACIONES FROM adm_donaciones;
REVOKE EXECUTE ON PA_ADMIN_SUCURSALES FROM adm_sucursales;
REVOKE EXECUTE ON PA_ORG_PRODUCTOS FROM org_productos;
REVOKE EXECUTE ON PA_ADMIN_SISTEMA FROM adm_sistema;
REVOKE EXECUTE ON PA_CLIENTE FROM cliente2;
REVOKE EXECUTE ON PA_BANCO_ALIMENTOS FROM banco_alimentos;

DROP ROLE adm_donaciones;
DROP ROLE adm_sucursales;
DROP ROLE org_productos;
DROP ROLE adm_sistema;
DROP ROLE cliente2;
DROP ROLE banco_alimentos;

DROP PACKAGE PA_ADMIN_DONACIONES;
DROP PACKAGE PA_ADMIN_SUCURSALES;
DROP PACKAGE PA_ORG_PRODUCTOS;
DROP PACKAGE PA_ADMIN_SISTEMA;
DROP PACKAGE PA_CLIENTE;
DROP PACKAGE PA_BANCO_ALIMENTOS;