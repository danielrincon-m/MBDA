--tipo documento correcto
ALTER TABLE Repartidor
ADD CONSTRAINT CHK_repartidor_tDoc
CHECK (
    tipoDocumento IN ('CC', 'TI', 'CE')
);

--El NIT debe contener un guión
ALTER TABLE EmpresasDeEnvios
ADD CONSTRAINT CHK_Empresa_nit
CHECK (
    nit LIKE ('%-%')
);

--El número de telefono debe ser de al menos 7 digitos
ALTER TABLE Telefonos
ADD CONSTRAINT CHK_Telefonos_tel
CHECK (
    LENGTH(telefono) >= 7
);

--El peso, largo, ancho y alto de un paquete deben ser mayores a cero
ALTER TABLE Paquetes
ADD CONSTRAINT CHK_Paquetes_values
CHECK (
    peso > 0
    AND largo > 0
    AND ancho > 0
    AND alto > 0
);

--El estado debe tener ciertos valores
ALTER TABLE Paquetes
ADD CONSTRAINT CHK_Paquetes_estado
CHECK (
    estado IN ('Recogida', 'Reparto', 'Entregado')
);

--El valor de la compra debe ser mayor a cero
ALTER TABLE Compras
ADD CONSTRAINT CHK_Compras_valor
CHECK (
    valor > 0
);