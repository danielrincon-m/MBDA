CREATE ROLE adm_envios;
CREATE ROLE adm_sucursales;
CREATE ROLE cliente;

GRANT EXECUTE ON PA_ADMIN_ENVIOS TO adm_envios;
GRANT EXECUTE ON PA_ADMIN_SUCURSALES TO adm_sucursales;
GRANT EXECUTE ON PA_CLIENTE TO cliente;

GRANT adm_envios TO bd2103370;
GRANT adm_sucursales TO bd2103370;
GRANT cliente TO bd2103370;