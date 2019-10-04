alter table camera add constraint ck_camera_id check (id between 1 and 99999999999);

alter table camera add constraint ck_camera_perim check (perim in ('IN','OUT'));

alter table image add constraint ck_image_camera check (camera between 1 and 99999999999);

alter table keeper add constraint ck_keeper_id check (id between 1 and 99999999999);