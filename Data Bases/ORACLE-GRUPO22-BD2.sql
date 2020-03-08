/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     30/5/2019 10:32:58                           */
/*==============================================================*/


alter table CLIENTES
   drop constraint FK_CLIENTES_ATIENDE_EMPLEADO;

alter table COMPRA
   drop constraint FK_COMPRA_COMPRA_PRODUCTO;

alter table COMPRA
   drop constraint FK_COMPRA_COMPRA2_CLIENTES;

alter table DISTRIBUYE
   drop constraint FK_DISTRIBU_DISTRIBUY_PRODUCTO;

alter table DISTRIBUYE
   drop constraint FK_DISTRIBU_DISTRIBUY_PROVEEDO;

alter table EMPLEADOS
   drop constraint FK_EMPLEADO_OCUPADO_CARGOS;

alter table EMPLEADOS
   drop constraint FK_EMPLEADO_PERTENECE_SUCURSUL;

drop table CARGOS cascade constraints;

drop index ATIENDE_FK;

drop table CLIENTES cascade constraints;

drop index COMPRA_FK;

drop index COMPRA2_FK;

drop table COMPRA cascade constraints;

drop index DISTRIBUYE_FK;

drop index DISTRIBUYE2_FK;

drop table DISTRIBUYE cascade constraints;

drop index PERTENECE_FK;

drop index OCUPADO_FK;

drop table EMPLEADOS cascade constraints;

drop table PRODUCTOS cascade constraints;

drop table PROVEEDORES cascade constraints;

drop table SUCURSULES cascade constraints;

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS 
(
   NCARGO               VARCHAR2(32)         not null,
   SALARIOMIN           INTEGER              not null,
   SALARIOMAX           INTEGER              not null,
   SUCURSALCLI          VARCHAR2(32)         not null,
   constraint PK_CARGOS primary key (NCARGO)
);

comment on table CARGOS is
'Cargos dentro de la empresa';

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES 
(
   NITCLI               INTEGER              not null,
   CED                  INTEGER,
   NOMBCLI              VARCHAR2(32)         not null,
   APELLCLI             VARCHAR2(32)         not null,
   SUCURSALCLI          VARCHAR2(32)         not null,
   DIRECCCLI            VARCHAR2(32)         not null,
   EMAILCLI             VARCHAR2(32)         not null,
   TELCLI               INTEGER              not null,
   IDPRO                INTEGER              not null,
   DESCRIP              VARCHAR2(32),
   CEDVENDEDOR          INTEGER              not null,
   constraint PK_CLIENTES primary key (NITCLI)
);

/*==============================================================*/
/* Index: ATIENDE_FK                                            */
/*==============================================================*/
create index ATIENDE_FK on CLIENTES (
   CED ASC
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA 
(
   IDPROD               INTEGER              not null,
   NITCLI               INTEGER              not null,
   PRECIOCOMPRA         INTEGER              not null,
   constraint PK_COMPRA primary key (IDPROD, NITCLI)
);

/*==============================================================*/
/* Index: COMPRA2_FK                                            */
/*==============================================================*/
create index COMPRA2_FK on COMPRA (
   NITCLI ASC
);

/*==============================================================*/
/* Index: COMPRA_FK                                             */
/*==============================================================*/
create index COMPRA_FK on COMPRA (
   IDPROD ASC
);

/*==============================================================*/
/* Table: DISTRIBUYE                                            */
/*==============================================================*/
create table DISTRIBUYE 
(
   IDPROD               INTEGER              not null,
   NITPRO               INTEGER              not null,
   constraint PK_DISTRIBUYE primary key (IDPROD, NITPRO)
);

/*==============================================================*/
/* Index: DISTRIBUYE2_FK                                        */
/*==============================================================*/
create index DISTRIBUYE2_FK on DISTRIBUYE (
   NITPRO ASC
);

/*==============================================================*/
/* Index: DISTRIBUYE_FK                                         */
/*==============================================================*/
create index DISTRIBUYE_FK on DISTRIBUYE (
   IDPROD ASC
);

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS 
(
   CED                  INTEGER              not null,
   NCARGO               VARCHAR2(32),
   COD_PAIS             INTEGER,
   NOMBEMP              VARCHAR2(32)         not null,
   APELLEMP             VARCHAR2(32)         not null,
   TELEMP               INTEGER              not null,
   DIRECCEMP            VARCHAR2(32)         not null,
   GENERO               VARCHAR2(15)         not null,
   EMAILEMP             VARCHAR2(32)         not null,
   FECHAINGRE           DATE                 not null,
   DEPARTAMENTO         VARCHAR2(32)         not null,
   CARGO                VARCHAR2(32)         not null,
   SUCURSALCLI          VARCHAR2(32)         not null,
   JEFE                 VARCHAR2(32),
   SALARIO              INTEGER              not null,
   COMISION             VARCHAR2(32),
   constraint PK_EMPLEADOS primary key (CED)
);

comment on table EMPLEADOS is
'Tabla con informacion de empleados en la empresa "Ventas Colombia SAS"';

/*==============================================================*/
/* Index: OCUPADO_FK                                            */
/*==============================================================*/
create index OCUPADO_FK on EMPLEADOS (
   NCARGO ASC
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on EMPLEADOS (
   COD_PAIS ASC
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS 
(
   IDPROD               INTEGER              not null,
   DESCRIP              VARCHAR2(32)         not null,
   UNIDAD               INTEGER              not null,
   PRECIO               INTEGER              not null,
   NITPROVEEDOR         INTEGER              not null,
   constraint PK_PRODUCTOS primary key (IDPROD)
);

comment on table PRODUCTOS is
'Tabla de informacion de los productos distribuidos por la empresa "Ventas Colombia SAS"';

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES 
(
   NITPRO               INTEGER              not null,
   COD                  INTEGER              not null,
   NOMBEMP              VARCHAR2(32)         not null,
   NOMGEREN             VARCHAR2(32)         not null,
   CEDGEREN             VARCHAR2(32)         not null,
   TELGEREN             VARCHAR2(32)         not null,
   CIUDAD               VARCHAR2(32)         not null,
   DIRECCEMP            VARCHAR2(32)         not null,
   TELEMP               INTEGER              not null,
   EMAILEMP             VARCHAR2(32)         not null,
   constraint PK_PROVEEDORES primary key (NITPRO)
);

comment on table PROVEEDORES is
'Lista de proveedores que venden productos a la empresa.';

/*==============================================================*/
/* Table: SUCURSULES                                            */
/*==============================================================*/
create table SUCURSULES 
(
   COD_PAIS             INTEGER              not null,
   NOMBRE               VARCHAR2(32)         not null,
   CIUDAD               VARCHAR2(32)         not null,
   TELEMP               INTEGER              not null,
   constraint PK_SUCURSULES primary key (COD_PAIS)
);

comment on table SUCURSULES is
'Lista de sucursales de la empresa.';

alter table CLIENTES
   add constraint FK_CLIENTES_ATIENDE_EMPLEADO foreign key (CED)
      references EMPLEADOS (CED);

alter table COMPRA
   add constraint FK_COMPRA_COMPRA_PRODUCTO foreign key (IDPROD)
      references PRODUCTOS (IDPROD);

alter table COMPRA
   add constraint FK_COMPRA_COMPRA2_CLIENTES foreign key (NITCLI)
      references CLIENTES (NITCLI);

alter table DISTRIBUYE
   add constraint FK_DISTRIBU_DISTRIBUY_PRODUCTO foreign key (IDPROD)
      references PRODUCTOS (IDPROD);

alter table DISTRIBUYE
   add constraint FK_DISTRIBU_DISTRIBUY_PROVEEDO foreign key (NITPRO)
      references PROVEEDORES (NITPRO);

alter table EMPLEADOS
   add constraint FK_EMPLEADO_OCUPADO_CARGOS foreign key (NCARGO)
      references CARGOS (NCARGO);

alter table EMPLEADOS
   add constraint FK_EMPLEADO_PERTENECE_SUCURSUL foreign key (COD_PAIS)
      references SUCURSULES (COD_PAIS);

