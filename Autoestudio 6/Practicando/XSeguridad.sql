REVOKE ALL ON PC_Mantener_Musico FROM Musico;
REVOKE ALL ON PC_Registrar_Composicion FROM Compositor;
REVOKE ALL ON PA_Administrador FROM Administrador;
REVOKE ALL ON PA_Musico FROM Musico;

DROP PACKAGE PA_Administrador;
DROP PACKAGE PA_Musico;