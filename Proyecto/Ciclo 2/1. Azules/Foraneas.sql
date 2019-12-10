ALTER TABLE PertenecenA
ADD CONSTRAINT FK_Pertenecen_Empresa
FOREIGN KEY (empresa) REFERENCES EmpresasDeEnvios (idEmpresa);

ALTER TABLE PertenecenA
ADD CONSTRAINT FK_Pertenecen_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor);

ALTER TABLE OperanEn
ADD CONSTRAINT FK_OperanEn_Ciudades
FOREIGN KEY (ciudad) REFERENCES Ciudades (idCiudad);

ALTER TABLE OperanEn
ADD CONSTRAINT FK_OperanEn_Repartidor
FOREIGN KEY (repartidor) REFERENCES Repartidores (idrepartidor);

ALTER TABLE Contienen
ADD CONSTRAINT FK_Contienen_Paquetes
FOREIGN KEY (paquete) REFERENCES Paquetes (idPaquete);

ALTER TABLE Telefonos
ADD CONSTRAINT FK_Telefonos_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor);

ALTER TABLE Paquetes
ADD CONSTRAINT FK_Paquetes_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor);

ALTER TABLE Paquetes
ADD CONSTRAINT FK_Paquetes_Compras
FOREIGN KEY (compra) REFERENCES Compras (idCompra);