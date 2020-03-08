/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     30/5/2019 10:39:54                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTES') and o.name = 'FK_CLIENTES_ATIENDE_EMPLEADO')
alter table CLIENTES
   drop constraint FK_CLIENTES_ATIENDE_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMPRA') and o.name = 'FK_COMPRA_COMPRA_PRODUCTO')
alter table COMPRA
   drop constraint FK_COMPRA_COMPRA_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMPRA') and o.name = 'FK_COMPRA_COMPRA2_CLIENTES')
alter table COMPRA
   drop constraint FK_COMPRA_COMPRA2_CLIENTES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISTRIBUYE') and o.name = 'FK_DISTRIBU_DISTRIBUY_PRODUCTO')
alter table DISTRIBUYE
   drop constraint FK_DISTRIBU_DISTRIBUY_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISTRIBUYE') and o.name = 'FK_DISTRIBU_DISTRIBUY_PROVEEDO')
alter table DISTRIBUYE
   drop constraint FK_DISTRIBU_DISTRIBUY_PROVEEDO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADOS') and o.name = 'FK_EMPLEADO_OCUPADO_CARGOS')
alter table EMPLEADOS
   drop constraint FK_EMPLEADO_OCUPADO_CARGOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADOS') and o.name = 'FK_EMPLEADO_PERTENECE_SUCURSUL')
alter table EMPLEADOS
   drop constraint FK_EMPLEADO_PERTENECE_SUCURSUL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARGOS')
            and   type = 'U')
   drop table CARGOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTES')
            and   name  = 'ATIENDE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTES.ATIENDE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTES')
            and   type = 'U')
   drop table CLIENTES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMPRA')
            and   name  = 'COMPRA_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMPRA.COMPRA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMPRA')
            and   name  = 'COMPRA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMPRA.COMPRA2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPRA')
            and   type = 'U')
   drop table COMPRA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DISTRIBUYE')
            and   name  = 'DISTRIBUYE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DISTRIBUYE.DISTRIBUYE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DISTRIBUYE')
            and   name  = 'DISTRIBUYE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DISTRIBUYE.DISTRIBUYE2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DISTRIBUYE')
            and   type = 'U')
   drop table DISTRIBUYE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADOS')
            and   name  = 'PERTENECE_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADOS.PERTENECE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADOS')
            and   name  = 'OCUPADO_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADOS.OCUPADO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADOS')
            and   type = 'U')
   drop table EMPLEADOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTOS')
            and   type = 'U')
   drop table PRODUCTOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVEEDORES')
            and   type = 'U')
   drop table PROVEEDORES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUCURSULES')
            and   type = 'U')
   drop table SUCURSULES
go

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS (
   NCARGO               varchar(32)          not null,
   SALARIOMIN           int                  not null,
   SALARIOMAX           int                  not null,
   SUCURSALCLI          varchar(32)          not null,
   constraint PK_CARGOS primary key nonclustered (NCARGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CARGOS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CARGOS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Cargos dentro de la empresa', 
   'user', @CurrentUser, 'table', 'CARGOS'
go

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   NITCLI               int                  not null,
   CED                  int                  null,
   NOMBCLI              varchar(32)          not null,
   APELLCLI             varchar(32)          not null,
   SUCURSALCLI          varchar(32)          not null,
   DIRECCCLI            varchar(32)          not null,
   EMAILCLI             varchar(32)          not null,
   TELCLI               int                  not null,
   IDPRO                int                  not null,
   DESCRIP              varchar(32)          null,
   CEDVENDEDOR          int                  not null,
   constraint PK_CLIENTES primary key nonclustered (NITCLI)
)
go

/*==============================================================*/
/* Index: ATIENDE_FK                                            */
/*==============================================================*/
create index ATIENDE_FK on CLIENTES (
CED ASC
)
go

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   IDPROD               int                  not null,
   NITCLI               int                  not null,
   PRECIOCOMPRA         int                  not null,
   constraint PK_COMPRA primary key nonclustered (IDPROD, NITCLI)
)
go

/*==============================================================*/
/* Index: COMPRA2_FK                                            */
/*==============================================================*/
create index COMPRA2_FK on COMPRA (
NITCLI ASC
)
go

/*==============================================================*/
/* Index: COMPRA_FK                                             */
/*==============================================================*/
create index COMPRA_FK on COMPRA (
IDPROD ASC
)
go

/*==============================================================*/
/* Table: DISTRIBUYE                                            */
/*==============================================================*/
create table DISTRIBUYE (
   IDPROD               int                  not null,
   NITPRO               int                  not null,
   constraint PK_DISTRIBUYE primary key nonclustered (IDPROD, NITPRO)
)
go

/*==============================================================*/
/* Index: DISTRIBUYE2_FK                                        */
/*==============================================================*/
create index DISTRIBUYE2_FK on DISTRIBUYE (
NITPRO ASC
)
go

/*==============================================================*/
/* Index: DISTRIBUYE_FK                                         */
/*==============================================================*/
create index DISTRIBUYE_FK on DISTRIBUYE (
IDPROD ASC
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   CED                  int                  not null,
   NCARGO               varchar(32)          null,
   COD_PAIS             int                  null,
   NOMBEMP              varchar(32)          not null,
   APELLEMP             varchar(32)          not null,
   TELEMP               int                  not null,
   DIRECCEMP            varchar(32)          not null,
   GENERO               varchar(15)          not null,
   EMAILEMP             varchar(32)          not null,
   FECHAINGRE           datetime             not null,
   DEPARTAMENTO         varchar(32)          not null,
   CARGO                varchar(32)          not null,
   SUCURSALCLI          varchar(32)          not null,
   JEFE                 varchar(32)          null,
   SALARIO              int                  not null,
   COMISION             varchar(32)          null,
   constraint PK_EMPLEADOS primary key nonclustered (CED)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('EMPLEADOS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'EMPLEADOS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Tabla con informacion de empleados en la empresa "Ventas Colombia SAS"', 
   'user', @CurrentUser, 'table', 'EMPLEADOS'
go

/*==============================================================*/
/* Index: OCUPADO_FK                                            */
/*==============================================================*/
create index OCUPADO_FK on EMPLEADOS (
NCARGO ASC
)
go

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on EMPLEADOS (
COD_PAIS ASC
)
go

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   IDPROD               int                  not null,
   DESCRIP              varchar(32)          not null,
   UNIDAD               int                  not null,
   PRECIO               int                  not null,
   NITPROVEEDOR         int                  not null,
   constraint PK_PRODUCTOS primary key nonclustered (IDPROD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PRODUCTOS') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PRODUCTOS' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Tabla de informacion de los productos distribuidos por la empresa "Ventas Colombia SAS"', 
   'user', @CurrentUser, 'table', 'PRODUCTOS'
go

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   NITPRO               int                  not null,
   COD                  int                  not null,
   NOMBEMP              varchar(32)          not null,
   NOMGEREN             varchar(32)          not null,
   CEDGEREN             varchar(32)          not null,
   TELGEREN             varchar(32)          not null,
   CIUDAD               varchar(32)          not null,
   DIRECCEMP            varchar(32)          not null,
   TELEMP               int                  not null,
   EMAILEMP             varchar(32)          not null,
   constraint PK_PROVEEDORES primary key nonclustered (NITPRO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PROVEEDORES') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PROVEEDORES' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Lista de proveedores que venden productos a la empresa.', 
   'user', @CurrentUser, 'table', 'PROVEEDORES'
go

/*==============================================================*/
/* Table: SUCURSULES                                            */
/*==============================================================*/
create table SUCURSULES (
   COD_PAIS             int                  not null,
   NOMBRE               varchar(32)          not null,
   CIUDAD               varchar(32)          not null,
   TELEMP               int                  not null,
   constraint PK_SUCURSULES primary key nonclustered (COD_PAIS)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SUCURSULES') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SUCURSULES' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Lista de sucursales de la empresa.', 
   'user', @CurrentUser, 'table', 'SUCURSULES'
go

alter table CLIENTES
   add constraint FK_CLIENTES_ATIENDE_EMPLEADO foreign key (CED)
      references EMPLEADOS (CED)
go

alter table COMPRA
   add constraint FK_COMPRA_COMPRA_PRODUCTO foreign key (IDPROD)
      references PRODUCTOS (IDPROD)
go

alter table COMPRA
   add constraint FK_COMPRA_COMPRA2_CLIENTES foreign key (NITCLI)
      references CLIENTES (NITCLI)
go

alter table DISTRIBUYE
   add constraint FK_DISTRIBU_DISTRIBUY_PRODUCTO foreign key (IDPROD)
      references PRODUCTOS (IDPROD)
go

alter table DISTRIBUYE
   add constraint FK_DISTRIBU_DISTRIBUY_PROVEEDO foreign key (NITPRO)
      references PROVEEDORES (NITPRO)
go

alter table EMPLEADOS
   add constraint FK_EMPLEADO_OCUPADO_CARGOS foreign key (NCARGO)
      references CARGOS (NCARGO)
go

alter table EMPLEADOS
   add constraint FK_EMPLEADO_PERTENECE_SUCURSUL foreign key (COD_PAIS)
      references SUCURSULES (COD_PAIS)
go

