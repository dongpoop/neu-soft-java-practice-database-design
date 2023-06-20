/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/5/8 18:53:47                            */
/*==============================================================*/


drop table if exists address;

drop table if exists cart;

drop table if exists comment;

drop table if exists order_detail;

drop table if exists order_summary;

drop table if exists product;

drop table if exists product_type;

drop table if exists user;

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   address_id           int not null auto_increment,
   user_id              int,
   name                 varchar(10),
   tel                  char(11),
   address              varchar(50),
   is_default           int,
   primary key (address_id)
);

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   cart_id              int not null,
   user_id              int not null,
   product_id           int not null,
   quantity             int,
   is_checked           int,
   primary key (cart_id)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           int not null,
   user_id              int not null,
   product_id           int not null,
   content              varchar(50),
   score                int,
   comment_time         datetime,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail
(
   detail_id            int not null,
   product_id           int not null,
   order_no             char(20) not null,
   quantity             int,
   primary key (detail_id)
);

/*==============================================================*/
/* Table: order_summary                                         */
/*==============================================================*/
create table order_summary
(
   order_no             char(20) not null,
   user_id              int,
   address_id           int,
   order_status         int,
   create_time          datetime,
   pay_time             datetime,
   primary key (order_no)
);

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           int not null auto_increment,
   type_id              int,
   product_name         varchar(10),
   product_price        int,
   product_image        varchar(20),
   product_stock        int,
   sell_count           int,
   is_recommend         int,
   create_time          datetime,
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_type                                          */
/*==============================================================*/
create table product_type
(
   type_id              int not null auto_increment,
   type_name            varchar(10),
   type_image           varchar(20),
   primary key (type_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null auto_increment,
   user_name            varchar(10),
   password             varchar(32),
   photo                varchar(20),
   reg_time             datetime,
   primary key (user_id)
);

alter table address add constraint FK_user_address foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table cart add constraint FK_cart foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table cart add constraint FK_cart2 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment2 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table order_detail add constraint FK_order_detail foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table order_detail add constraint FK_order_detail2 foreign key (order_no)
      references order_summary (order_no) on delete restrict on update restrict;

alter table order_summary add constraint FK_address_order_summary foreign key (address_id)
      references address (address_id) on delete restrict on update restrict;

alter table order_summary add constraint FK_user_order_summary foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table product add constraint FK_product_type foreign key (type_id)
      references product_type (type_id) on delete restrict on update restrict;

