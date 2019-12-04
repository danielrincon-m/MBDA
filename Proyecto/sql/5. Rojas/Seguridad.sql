CREATE ROLE adm_donaciones;
CREATE ROLE adm_sucursales;
CREATE ROLE org_productos;
CREATE ROLE adm_sistema;
CREATE ROLE cliente2;
CREATE ROLE banco_alimentos;

GRANT EXECUTE ON PA_ADMIN_DONACIONES TO adm_donaciones;
GRANT EXECUTE ON PA_ADMIN_SUCURSALES TO adm_sucursales;
GRANT EXECUTE ON PA_ORG_PRODUCTOS TO org_productos;
GRANT EXECUTE ON PA_ADMIN_SISTEMA TO adm_sistema;
GRANT EXECUTE ON PA_CLIENTE TO cliente2;
GRANT EXECUTE ON PA_BANCO_ALIMENTOS TO banco_alimentos;

GRANT adm_donaciones TO bd3104340;
GRANT adm_sucursales TO bd3104340;
GRANT org_productos TO bd3104340;
GRANT adm_sistema TO bd3104340;
GRANT cliente2 TO bd3104340;
GRANT banco_alimentos TO bd3104340;