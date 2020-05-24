CREATE trigger user_insert  after insert on `user` for each row 
 begin
 insert into ods_charge.ods_user(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_update  after update on `user` for each row 
 begin
 insert into ods_charge.ods_user(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_detail_insert  after insert on `user_detail` for each row 
 begin
 insert into ods_charge.ods_user_detail(user_id,group_id,name,nick_name,id_number,sex,money,version,creator,updator,create_time,update_time) 
values (new.user_id,new.group_id,new.name,new.nick_name,new.id_number,new.sex,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_detail_update  after update on `user_detail` for each row 
 begin
 insert into ods_charge.ods_user_detail(user_id,group_id,name,nick_name,id_number,sex,money,version,creator,updator,create_time,update_time) 
values (new.user_id,new.group_id,new.name,new.nick_name,new.id_number,new.sex,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_third_insert  after insert on `user_third` for each row 
 begin
 insert into ods_charge.ods_user_third(type,third_id,user_id,name,version,creator,updator,create_time,update_time) 
values (new.type,new.third_id,new.user_id,new.name,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_third_update  after update on `user_third` for each row 
 begin
 insert into ods_charge.ods_user_third(type,third_id,user_id,name,version,creator,updator,create_time,update_time) 
values (new.type,new.third_id,new.user_id,new.name,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_login_record_insert  after insert on `user_login_record` for each row 
 begin
 insert into ods_charge.ods_user_login_record(id,user_id,phone_models,device_id,imei,ip,latitude,longitude,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.phone_models,new.device_id,new.imei,new.ip,new.latitude,new.longitude,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_login_record_update  after update on `user_login_record` for each row 
 begin
 insert into ods_charge.ods_user_login_record(id,user_id,phone_models,device_id,imei,ip,latitude,longitude,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.phone_models,new.device_id,new.imei,new.ip,new.latitude,new.longitude,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_insert  after insert on `order` for each row 
 begin
 insert into ods_charge.ods_order(id,status,sn,user_id,merchant_id,cu_id,money,version,creator,updator,create_time,update_time) 
values (new.id,new.status,new.sn,new.user_id,new.merchant_id,new.cu_id,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_update  after update on `order` for each row 
 begin
 insert into ods_charge.ods_order(id,status,sn,user_id,merchant_id,cu_id,money,version,creator,updator,create_time,update_time) 
values (new.id,new.status,new.sn,new.user_id,new.merchant_id,new.cu_id,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_detail_insert  after insert on `order_detail` for each row 
 begin
 insert into ods_charge.ods_order_detail(order_id,cp_id,version,creator,updator,create_time,update_time) 
values (new.order_id,new.cp_id,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_detail_update  after update on `order_detail` for each row 
 begin
 insert into ods_charge.ods_order_detail(order_id,cp_id,version,creator,updator,create_time,update_time) 
values (new.order_id,new.cp_id,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger pay_record_insert  after insert on `pay_record` for each row 
 begin
 insert into ods_charge.ods_pay_record(id,user_id,order_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.order_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger pay_record_update  after update on `pay_record` for each row 
 begin
 insert into ods_charge.ods_pay_record(id,user_id,order_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.order_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


