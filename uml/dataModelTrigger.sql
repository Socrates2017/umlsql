CREATE trigger user_insert  after insert on user for each row 
 begin
 insert into ods_user(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_update  after update on user for each row 
 begin
 insert into ods_user(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_detail_insert  after insert on user_detail for each row 
 begin
 insert into ods_user_detail(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_detail_update  after update on user_detail for each row 
 begin
 insert into ods_user_detail(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_third_insert  after insert on user_third for each row 
 begin
 insert into ods_user_third(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_third_update  after update on user_third for each row 
 begin
 insert into ods_user_third(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_login_record_insert  after insert on user_login_record for each row 
 begin
 insert into ods_user_login_record(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger user_login_record_update  after update on user_login_record for each row 
 begin
 insert into ods_user_login_record(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger order_insert  after insert on order for each row 
 begin
 insert into ods_order(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger order_update  after update on order for each row 
 begin
 insert into ods_order(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger order_detail_insert  after insert on order_detail for each row 
 begin
 insert into ods_order_detail(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger order_detail_update  after update on order_detail for each row 
 begin
 insert into ods_order_detail(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger pay_record_insert  after insert on pay_record for each row 
 begin
 insert into ods_pay_record(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

CREATE trigger pay_record_update  after update on pay_record for each row 
 begin
 insert into ods_pay_record(id,type,phone,password,status,version,creator,updator,create_time,update_time) 
values (new.id,new.type,new.phone,new.password,new.status,new.version,new.creator,new.updator,new.create_time,new.update_time);
end;

