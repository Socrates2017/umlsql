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

CREATE trigger deposit_record_insert  after insert on `deposit_record` for each row 
 begin
 insert into ods_charge.ods_deposit_record(id,user_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger deposit_record_update  after update on `deposit_record` for each row 
 begin
 insert into ods_charge.ods_deposit_record(id,user_id,money,type,sn_third,status,version,creator,updator,create_time,update_time) 
values (new.id,new.user_id,new.money,new.type,new.sn_third,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
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

