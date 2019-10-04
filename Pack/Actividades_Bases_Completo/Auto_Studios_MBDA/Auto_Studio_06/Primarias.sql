alter table camera add constraint pk_camera primary key (id);

alter table keeper add constraint pk_keeper primary key (id);

alter table vehicle add constraint pk_vehicle primary key (id);

alter table permit add constraint pk_permit primary key (reg, sDate);

alter table image add constraint pk_image primary key (camera, whn);

alter table pagos add constraint pk_pagos primary key (numero);

alter table tarifas add constraint pk_tarifas primary key (chargeType);