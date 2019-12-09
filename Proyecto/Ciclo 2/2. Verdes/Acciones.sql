--Al eliminar una empresa de envios, se elimina la pertenencia de repartidores
ALTER TABLE PertenecenA
DROP CONSTRAINT FK_Pertenecen_Empresa;
ALTER TABLE PertenecenA
ADD CONSTRAINT FK_Pertenecen_Empresa
FOREIGN KEY (empresa) REFERENCES EmpresasDeEnvios (idEmpresa)
ON DELETE CASCADE;

--Al eliminar una ciudad, se elimina la posible operación de repartidores en la misma
ALTER TABLE OperanEn
DROP CONSTRAINT FK_OperanEn_Ciudades;
ALTER TABLE OperanEn
ADD CONSTRAINT FK_OperanEn_Ciudades
FOREIGN KEY (ciudad) REFERENCES Ciudades (idCiudad)
ON DELETE CASCADE;

--Al eliminar un repartidor se eliminan todas sus relaciones excepto en paquetes, allí se pone nulo
ALTER TABLE PertenecenA
DROP CONSTRAINT FK_Pertenecen_Repartidores;
ALTER TABLE PertenecenA
ADD CONSTRAINT FK_Pertenecen_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor)
ON DELETE CASCADE;

ALTER TABLE OperaEn
DROP CONSTRAINT FK_OperaEn_Repartidor;
ALTER TABLE OperaEn
ADD CONSTRAINT FK_OperaEn_Repartidor
FOREIGN KEY (repartidor) REFERENCES Repartidores (idrepartidor)
ON DELETE CASCADE;

ALTER TABLE Telefonos
DROP CONSTRAINT FK_Telefonos_Repartidores;
ALTER TABLE Telefonos
ADD CONSTRAINT FK_Telefonos_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor)
ON DELETE CASCADE;

ALTER TABLE Paquetes
DROP CONSTRAINT FK_Paquetes_Repartidores;
ALTER TABLE Paquetes
ADD CONSTRAINT FK_Paquetes_Repartidores
FOREIGN KEY (repartidor) REFERENCES Repartidores (idRepartidor)
ON DELETE SET NULL;
