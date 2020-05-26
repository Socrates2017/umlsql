CREATE trigger merchant_insert  after insert on `merchant` for each row 
 begin
 insert into ods_charge.ods_merchant(id,phone,password,version,creator,updator,create_time,update_time) 
values (new.id,new.phone,new.password,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_update  after update on `merchant` for each row 
 begin
 insert into ods_charge.ods_merchant(id,phone,password,version,creator,updator,create_time,update_time) 
values (new.id,new.phone,new.password,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_detail_insert  after insert on `merchant_detail` for each row 
 begin
 insert into ods_charge.ods_merchant_detail(merchant_id,name,address,version,creator,updator,create_time,update_time) 
values (new.merchant_id,new.name,new.address,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_detail_update  after update on `merchant_detail` for each row 
 begin
 insert into ods_charge.ods_merchant_detail(merchant_id,name,address,version,creator,updator,create_time,update_time) 
values (new.merchant_id,new.name,new.address,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_login_record_insert  after insert on `merchant_login_record` for each row 
 begin
 insert into ods_charge.ods_merchant_login_record(id,merchant_id,phone_models,device_id,imei,ip,latitude,longitude,version,creator,updator,create_time,update_time) 
values (new.id,new.merchant_id,new.phone_models,new.device_id,new.imei,new.ip,new.latitude,new.longitude,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_login_record_update  after update on `merchant_login_record` for each row 
 begin
 insert into ods_charge.ods_merchant_login_record(id,merchant_id,phone_models,device_id,imei,ip,latitude,longitude,version,creator,updator,create_time,update_time) 
values (new.id,new.merchant_id,new.phone_models,new.device_id,new.imei,new.ip,new.latitude,new.longitude,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_third_insert  after insert on `merchant_third` for each row 
 begin
 insert into ods_charge.ods_merchant_third(type,third_id,user_id,name,version,creator,updator,create_time,update_time) 
values (new.type,new.third_id,new.user_id,new.name,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_third_update  after update on `merchant_third` for each row 
 begin
 insert into ods_charge.ods_merchant_third(type,third_id,user_id,name,version,creator,updator,create_time,update_time) 
values (new.type,new.third_id,new.user_id,new.name,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


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
 insert into ods_charge.ods_user_detail(user_id,group_id,name,nick_name,id_number,sex,version,creator,updator,create_time,update_time) 
values (new.user_id,new.group_id,new.name,new.nick_name,new.id_number,new.sex,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger user_detail_update  after update on `user_detail` for each row 
 begin
 insert into ods_charge.ods_user_detail(user_id,group_id,name,nick_name,id_number,sex,version,creator,updator,create_time,update_time) 
values (new.user_id,new.group_id,new.name,new.nick_name,new.id_number,new.sex,new.version,new.creator,new.updator,new.create_time,new.update_time);
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


CREATE trigger car_insert  after insert on `car` for each row 
 begin
 insert into ods_charge.ods_car(id,user_id,vin,license_number,self_number,brand,category,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.vin,new.license_number,new.self_number,new.brand,new.category,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger car_update  after update on `car` for each row 
 begin
 insert into ods_charge.ods_car(id,user_id,vin,license_number,self_number,brand,category,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.vin,new.license_number,new.self_number,new.brand,new.category,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_insert  after insert on `order` for each row 
 begin
 insert into ods_charge.ods_order(id,status,sn,user_id,merchant_id,cg_id,money,version,creator,updator,create_time,update_time) 
values (new.id,new.status,new.sn,new.user_id,new.merchant_id,new.cg_id,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_update  after update on `order` for each row 
 begin
 insert into ods_charge.ods_order(id,status,sn,user_id,merchant_id,cg_id,money,version,creator,updator,create_time,update_time) 
values (new.id,new.status,new.sn,new.user_id,new.merchant_id,new.cg_id,new.money,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_detail_insert  after insert on `order_detail` for each row 
 begin
 insert into ods_charge.ods_order_detail(order_id,cp_id,car_id,version,creator,updator,create_time,update_time) 
values (new.order_id,new.cp_id,new.car_id,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger order_detail_update  after update on `order_detail` for each row 
 begin
 insert into ods_charge.ods_order_detail(order_id,cp_id,car_id,version,creator,updator,create_time,update_time) 
values (new.order_id,new.cp_id,new.car_id,new.version,new.creator,new.updator,new.create_time,new.update_time);
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


CREATE trigger wallet_insert  after insert on `wallet` for each row 
 begin
 insert into ods_charge.ods_wallet(user_id,money,status,version,creator,updator,create_time,update_time) 
values (new.user_id,new.money,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger wallet_update  after update on `wallet` for each row 
 begin
 insert into ods_charge.ods_wallet(user_id,money,status,version,creator,updator,create_time,update_time) 
values (new.user_id,new.money,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger deposit_record_insert  after insert on `deposit_record` for each row 
 begin
 insert into ods_charge.ods_deposit_record(id,user_id,money,type,sn,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.type,new.sn,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger deposit_record_update  after update on `deposit_record` for each row 
 begin
 insert into ods_charge.ods_deposit_record(id,user_id,money,type,sn,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.type,new.sn,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger balance_pay_record_insert  after insert on `balance_pay_record` for each row 
 begin
 insert into ods_charge.ods_balance_pay_record(id,user_id,money,sn,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.sn,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger balance_pay_record_update  after update on `balance_pay_record` for each row 
 begin
 insert into ods_charge.ods_balance_pay_record(id,user_id,money,sn,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.sn,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger withdraw_record_insert  after insert on `withdraw_record` for each row 
 begin
 insert into ods_charge.ods_withdraw_record(id,merchant_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.merchant_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger withdraw_record_update  after update on `withdraw_record` for each row 
 begin
 insert into ods_charge.ods_withdraw_record(id,merchant_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.merchant_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_wallet_insert  after insert on `merchant_wallet` for each row 
 begin
 insert into ods_charge.ods_merchant_wallet(merchant_id,money,status,version,creator,updator,create_time,update_time) 
values (new.merchant_id,new.money,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


CREATE trigger merchant_wallet_update  after update on `merchant_wallet` for each row 
 begin
 insert into ods_charge.ods_merchant_wallet(merchant_id,money,status,version,creator,updator,create_time,update_time) 
values (new.merchant_id,new.money,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;


