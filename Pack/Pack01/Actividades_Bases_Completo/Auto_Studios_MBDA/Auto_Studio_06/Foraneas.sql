alter table vehicle add constraint fk_vehicle_keeper foreign key (keeper) references keeper (id);

alter table permit add constraint fk_permit_vehicle foreign key (reg) references vehicle (id);

alter table image add constraint fk_image_vehicle foreign key (reg) references vehicle (id);

alter table image add constraint fk_image_camera foreign key (camera) references camera (id);

alter table pagos add constraint fk_pagos_permit foreign key (permit, permit_fecha) references permit (reg, sdate);

alter table permit add constraint fk_permit_tarifa foreign key (chargeType) references tarifas (chargeType) on delete cascade;