create table category
(
    id   int8 generated by default as identity,
    name varchar(255),
    primary key (id)
);
create table comments
(
    id         int8 generated by default as identity,
    comment    varchar(255),
    product_id int8,
    users_id   int8,
    primary key (id)
);
create table korzina
(
    id      int8 generated by default as identity,
    user_id int8,
    primary key (id)
);
create table korzina_products
(
    korzina_id  int8 not null,
    products_id int8 not null
);
create table order_details
(
    id         int8 generated by default as identity,
    amount     numeric(19, 2),
    price      numeric(19, 2),
    orders_id  int8,
    product_id int8,
    primary key (id)
);
create table orders
(
    id           int8 generated by default as identity,
    address      varchar(255),
    created      timestamp,
    order_status varchar(255),
    total_price  numeric(19, 2),
    user_id      int8,
    primary key (id)
);
create table orders_order_details
(
    orders_id        int8 not null,
    order_details_id int8 not null
);
create table product
(
    id            int8 generated by default as identity,
    price         numeric(19, 2),
    product_image varchar(255),
    title         varchar(255),
    primary key (id)
);
create table product_categories
(
    product_id    int8 not null,
    categories_id int8 not null
);
create table role
(
    id   int8 generated by default as identity,
    role varchar(255),
    primary key (id)
);
create table users
(
    id         int8 generated by default as identity,
    address    varchar(255),
    archive    boolean not null,
    avatar     varchar(255),
    email      varchar(255),
    full_name  varchar(255),
    password   varchar(255),
    korzina_id int8,
    primary key (id)
);
create table users_roles
(
    users_id int8 not null,
    roles_id int8 not null
);
alter table if exists orders_order_details
    drop constraint if exists UK_22wlf6q0mc7mkuqp7bvm3dm2d
;
alter table if exists orders_order_details
    add constraint UK_22wlf6q0mc7mkuqp7bvm3dm2d unique (order_details_id);
alter table if exists comments
    add constraint FKj9to9e3tjoimlgn3w4vjm4xe3 foreign key (product_id) references product;
alter table if exists comments
    add constraint FKt55y2infwbbw3o942o2mhm0v4 foreign key (users_id) references users;
alter table if exists korzina
    add constraint FK52hpum1vxf5mp6goj2k7yg21t foreign key (user_id) references users;
alter table if exists korzina_products
    add constraint FK3u403ki66p6efaqr9vjaet0dx foreign key (products_id) references product;
alter table if exists korzina_products
    add constraint FKofnwkm1sha3ysau9t9fhsix9k foreign key (korzina_id) references korzina;
alter table if exists order_details
    add constraint FKint27bl8qoql1ksaw8ik7cq95 foreign key (orders_id) references orders;
alter table if exists order_details
    add constraint FKinivj2k1370kw224lavkm3rqm foreign key (product_id) references product;
alter table if exists orders
    add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users;
alter table if exists orders_order_details
    add constraint FK5tqkl4l12ncaw7q7ua2gc4a3w foreign key (order_details_id) references order_details;
alter table if exists orders_order_details
    add constraint FKpjk9623wyjqoyvueqb09eh2ws foreign key (orders_id) references orders;
alter table if exists product_categories
    add constraint FK86pfomapgvxb87x9nnxuc0pdj foreign key (categories_id) references category;
alter table if exists product_categories
    add constraint FKppc5s0f38pgb35a32dlgyhorc foreign key (product_id) references product;
alter table if exists users
    add constraint FKa2issxeok4g7gwyrosctlqnh9 foreign key (korzina_id) references korzina;
alter table if exists users_roles
    add constraint FK15d410tj6juko0sq9k4km60xq foreign key (roles_id) references role;
alter table if exists users_roles
    add constraint FKml90kef4w2jy7oxyqv742tsfc foreign key (users_id) references users