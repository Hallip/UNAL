/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/7/2019 12:52:27                           */
/*==============================================================*/



/*==============================================================*/
/* Table: BODEGA                                                */
/*==============================================================*/
create table BODEGA
(
   ID_PRODUCTO          INTEGER              not null,
   CANTIDAD             INTEGER,
   SUCUR_BOD            VARCHAR2(32)         not null,
   CIUDADSU             VARCHAR2(32),
   PAISSU               VARCHAR2(32),
   constraint PK_BODEGA primary key (ID_PRODUCTO, SUCUR_BOD)
);

/*==============================================================*/
/* Index: INVENTARIO2_FK                                        */
/*==============================================================*/
create index INVENTARIO2_FK on BODEGA (
   CIUDADSU ASC,
   PAISSU ASC
);

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS
(
   NOM_CAR              VARCHAR2(32)         not null,
   NOMBRE_DEP           VARCHAR2(32),
   SUCURSAL             VARCHAR2(32),
   DEP_CAR              VARCHAR2(32),
   S_MIN                INTEGER,
   S_MAX                INTEGER,
   constraint PK_CARGOS primary key (NOM_CAR)
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on CARGOS (
   NOMBRE_DEP ASC,
   SUCURSAL ASC
);

/*==============================================================*/
/* Table: CIUDADES                                              */
/*==============================================================*/
create table CIUDADES
(
   NOM_CIU              VARCHAR2(32),
   IATACIU              VARCHAR2(3)          not null,
   ISO3166              INTEGER,
   CIUDADSU             VARCHAR2(32),
   PAISSU               VARCHAR2(32),
   ISO3166CIU           INTEGER,
   constraint PK_CIUDADES primary key (IATACIU)
);

/*==============================================================*/
/* Index: LUGAR_FK                                              */
/*==============================================================*/
create index LUGAR_FK on CIUDADES (
   ISO3166 ASC
);

/*==============================================================*/
/* Index: SPER_FK                                               */
/*==============================================================*/
create index SPER_FK on CIUDADES (
   CIUDADSU ASC,
   PAISSU ASC
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES
(
   CED_EMP              INTEGER,
   CED_CLI              INTEGER              not null,
   NOMB_CLI             VARCHAR2(32),
   AP_CLI               VARCHAR2(32),
   SUCUR_CLI            VARCHAR2(32),
   DIREC_CLI            VARCHAR2(32),
   EMAIL_CLI            VARCHAR2(32),
   TEL_CLI              INTEGER,
   VENDEDOR             VARCHAR2(32),
   constraint PK_CLIENTES primary key (CED_CLI)
);

/*==============================================================*/
/* Index: ATIENDE_FK                                            */
/*==============================================================*/
create index ATIENDE_FK on CLIENTES (
   CED_EMP ASC
);

/*==============================================================*/
/* Index: CITA_CLI_FK                                           */
/*==============================================================*/

/*==============================================================*/
/* Table: DEPARTAMENTOS                                         */
/*==============================================================*/
create table DEPARTAMENTOS
(
   NOMBRE_DEP           VARCHAR2(32)         not null,
   DIRECTOR_DEP         VARCHAR2(32)         not null,
   SUCURSAL             VARCHAR2(32)         not null,
   constraint PK_DEPARTAMENTOS primary key (NOMBRE_DEP, SUCURSAL)
);

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS
(
   CED_EMP              INTEGER              not null,
   NOM_CAR              VARCHAR2(32),
   NOMB_EMP             VARCHAR2(1024)       not null,
   AP_EMP               VARCHAR2(1024)       not null,
   GEN_EMP              VARCHAR2(1024)       not null,
   EMAIL_EMP            VARCHAR2(1024)       not null,
   FECHA_INGRESO        DATE                 not null,
   DEP_EMP              VARCHAR2(1024)       not null,
   SUCURSAL_EMP         VARCHAR2(1024)       not null,
   JEFE                 VARCHAR2(1024)       not null,
   SALARIO              INTEGER              not null,
   COMISION             INTEGER,
   SANCION              SMALLINT,
   constraint PK_EMPLEADOS primary key (CED_EMP)
);

/*==============================================================*/
/* Index: TRABAJA_FK                                            */
/*==============================================================*/
create index TRABAJA_FK on EMPLEADOS (
   NOM_CAR ASC
);

/*==============================================================*/
/* Table: LISTA_DE_CANDIDATOS                                   */
/*==============================================================*/
create table LISTA_DE_CANDIDATOS
(
   CED_CAN              INTEGER              not null,
   NOM_CAR              VARCHAR2(32),
   NOM_CAN_             VARCHAR2(1024),
   AP_CAN               VARCHAR2(1024),
   GEN_CAN              VARCHAR2(1024),
   TEL_CAN              INTEGER,
   EMAIL_CAN            VARCHAR2(1024),
   APTITUD              INTEGER,
   SUCUR_CAN            VARCHAR2(1024),
   constraint PK_LISTA_DE_CANDIDATOS primary key (CED_CAN)
);

/*==============================================================*/
/* Index: ASPIRANTE_FK                                          */
/*==============================================================*/
create index ASPIRANTE_FK on LISTA_DE_CANDIDATOS (
   NOM_CAR ASC
);

/*==============================================================*/
/* Table: LLENA_BODEGA                                          */
/*==============================================================*/
create table LLENA_BODEGA
(
   CIUDADSU             VARCHAR2(32)         not null,
   PAISSU               VARCHAR2(32)         not null,
   NIT_PRO              INTEGER              not null,
   constraint PK_LLENA_BODEGA primary key (CIUDADSU, PAISSU, NIT_PRO)
);

/*==============================================================*/
/* Index: LLENA_BODEGA2_FK                                      */
/*==============================================================*/
create index LLENA_BODEGA2_FK on LLENA_BODEGA (
   NIT_PRO ASC
);

/*==============================================================*/
/* Index: LLENA_BODEGA_FK                                       */
/*==============================================================*/
create index LLENA_BODEGA_FK on LLENA_BODEGA (
   CIUDADSU ASC,
   PAISSU ASC
);

/*==============================================================*/
/* Table: PAISES                                                */
/*==============================================================*/
create table PAISES
(
   NOM_PAIS             VARCHAR2(32),
   ISO3166              INTEGER              not null,
   IATAPAIS             VARCHAR2(2),
   PREFIX               INTEGER              not null,
   constraint PK_PAISES primary key (ISO3166)
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS
(
   ID_PROD              INTEGER              not null,
   SUCUR_BOD            VARCHAR2(32),
   NIT_PRO              INTEGER,
   DESCRIP_PROD         VARCHAR2(32)         not null,
   PRECIO_COMPRA        INTEGER              not null,
   PRECIO_DE_VENTA      INTEGER              not null,
   NOM_PRO              VARCHAR2(32)         not null,
   constraint PK_PRODUCTOS primary key (ID_PROD)
);

/*==============================================================*/
/* Index: TENER_FK                                              */
/*==============================================================*/
create index TENER_FK on PRODUCTOS (
   ID_PRODUCTO ASC,
   SUCUR_BOD ASC
);

/*==============================================================*/
/* Index: VENDE_EMPRE_FK                                        */
/*==============================================================*/
create index VENDE_EMPRE_FK on PRODUCTOS (
   NIT_PRO ASC
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES
(
   NOM_PRO              VARCHAR2(32),
   NIT_PRO              INTEGER              not null,
   COD                  INTEGER,
   TEL_PRO              INTEGER,
   DIREC_PRO            VARCHAR2(32),
   NOM_GER              VARCHAR2(32),
   CED_GER              INTEGER,
   TEL_GER              INTEGER,
   CIUDAD               VARCHAR2(32),
   EMAIL_PRO            VARCHAR2(32),
   constraint PK_PROVEEDORES primary key (NIT_PRO)
);

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES
(
   CIUDADSU             VARCHAR2(32)         not null,
   PAISSU               VARCHAR2(32)         not null,
   IATACIU              VARCHAR2(3),
   ID_PRODUCTO          INTEGER,
   SUCUR_BOD            VARCHAR2(32),
   DIRECTOR_DE_SUCURSAL VARCHAR2(32),
   PREFIJOSU            INTEGER,
   TELEFONOSU           INTEGER,
   constraint PK_SUCURSALES primary key (CIUDADSU, PAISSU)
);

/*==============================================================*/
/* Index: SPER2_FK                                              */
/*==============================================================*/
create index SPER2_FK on SUCURSALES (
   IATACIU ASC
);

/*==============================================================*/
/* Index: INVENTARIO_FK                                         */
/*==============================================================*/
create index INVENTARIO_FK on SUCURSALES (
   ID_PRODUCTO ASC,
   SUCUR_BOD ASC
);

/*==============================================================*/
/* Table: VENTAS                                                */
/*==============================================================*/
create table VENTAS
(
   ID_VENTA             INTEGER              not null,
   ID_PRODUCTO          INTEGER,
   SUCUR_BOD            VARCHAR2(32),
   CED_EMP              INTEGER,
   CED_CLI              INTEGER,
   VENDEDOR_VE          VARCHAR2(1024),
   CLIENTE_VE           VARCHAR2(1024),
   IDPROVE              INTEGER,
   CANTIDAD_PRO         INTEGER,
   VALOR_VE             INTEGER,
   constraint PK_VENTAS primary key (ID_VENTA)
);

/*==============================================================*/
/* Index: SUMINISTRA_FK                                         */
/*==============================================================*/
create index SUMINISTRA_FK on VENTAS (
   ID_PRODUCTO ASC,
   SUCUR_BOD ASC
);

/*==============================================================*/
/* Index: VENDE_FK                                              */
/*==============================================================*/
create index VENDE_FK on VENTAS (
   CED_EMP ASC
);

/*==============================================================*/
/* Index: COMPRA_FK                                             */
/*==============================================================*/
create index COMPRA_FK on VENTAS (
   CED_CLI ASC
);

/*==============================================================*/
/* Table: VISITAS                                               */
/*==============================================================*/
create table VISITAS
(
   VENDEDOR_CI          VARCHAR2(32)         not null,
   CLIENTE_CI           VARCHAR2(32)         not null,
   CED_CLI              INTEGER,
   CED_EMP              INTEGER,
   FECHA_CI             DATE,
   ESTADO               VARCHAR2(32),
   constraint PK_VISITAS primary key (CLIENTE_CI, VENDEDOR_CI)
);

/*==============================================================*/
/* Index: CITA_CLI2_FK                                          */
/*==============================================================*/
create index CITA_CLI2_FK on VISITAS (
   CED_CLI ASC
);

/*==============================================================*/
/* Index: CITA_EMP_FK                                           */
/*==============================================================*/
create index CITA_EMP_FK on VISITAS (
   CED_EMP ASC
);

alter table BODEGA
   add constraint FK_BODEGA_INVENTARI_SUCURSAL foreign key (CIUDADSU, PAISSU)
      references SUCURSALES (CIUDADSU, PAISSU);

alter table CARGOS
   add constraint FK_CARGOS_PERTENECE_DEPARTAM foreign key (NOMBRE_DEP, SUCURSAL)
      references DEPARTAMENTOS (NOMBRE_DEP, SUCURSAL);

alter table CIUDADES
   add constraint FK_CIUDADES_LUGAR_PAISES foreign key (ISO3166)
      references PAISES (ISO3166);

alter table CIUDADES
   add constraint FK_CIUDADES_SPER_SUCURSAL foreign key (CIUDADSU, PAISSU)
      references SUCURSALES (CIUDADSU, PAISSU);

alter table CLIENTES
   add constraint FK_CLIENTES_ATIENDE_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP);

alter table CLIENTES
   add constraint FK_CLIENTES_CITA_CLI_VISITAS foreign key (CLIENTE_CI, VENDEDOR_CI)
      references VISITAS (CLIENTE_CI, VENDEDOR_CI);

alter table EMPLEADOS
   add constraint FK_EMPLEADO_TRABAJA_CARGOS foreign key (NOM_CAR)
      references CARGOS (NOM_CAR);

alter table LISTA_DE_CANDIDATOS
   add constraint FK_LISTA_DE_ASPIRANTE_CARGOS foreign key (NOM_CAR)
      references CARGOS (NOM_CAR);

alter table LLENA_BODEGA
   add constraint FK_LLENA_BO_LLENA_BOD_SUCURSAL foreign key (CIUDADSU, PAISSU)
      references SUCURSALES (CIUDADSU, PAISSU);

alter table LLENA_BODEGA
   add constraint FK_LLENA_BO_LLENA_BOD_PROVEEDO foreign key (NIT_PRO)
      references PROVEEDORES (NIT_PRO);

alter table PRODUCTOS
   add constraint FK_PRODUCTO_TENER_BODEGA foreign key (ID_PRODUCTO, SUCUR_BOD)
      references BODEGA (ID_PRODUCTO, SUCUR_BOD);

alter table PRODUCTOS
   add constraint FK_PRODUCTO_VENDE_EMP_PROVEEDO foreign key (NIT_PRO)
      references PROVEEDORES (NIT_PRO);

alter table SUCURSALES
   add constraint FK_SUCURSAL_INVENTARI_BODEGA foreign key (ID_PRODUCTO, SUCUR_BOD)
      references BODEGA (ID_PRODUCTO, SUCUR_BOD);

alter table SUCURSALES
   add constraint FK_SUCURSAL_SPER2_CIUDADES foreign key (IATACIU)
      references CIUDADES (IATACIU);

alter table VENTAS
   add constraint FK_VENTAS_COMPRA_CLIENTES foreign key (CED_CLI)
      references CLIENTES (CED_CLI);

alter table VENTAS
   add constraint FK_VENTAS_SUMINISTR_BODEGA foreign key (ID_PRODUCTO, SUCUR_BOD)
      references BODEGA (ID_PRODUCTO, SUCUR_BOD);

alter table VENTAS
   add constraint FK_VENTAS_VENDE_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP);

alter table VISITAS
   add constraint FK_VISITAS_CITA_CLI2_CLIENTES foreign key (CED_CLI)
      references CLIENTES (CED_CLI);

alter table VISITAS
   add constraint FK_VISITAS_CITA_EMP_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP);

CREATE TABLE PAISES_REGISTRADOSE (nombre_pais varchar(32), estado varchar(32));
CREATE TABLE EMPLEADOS_REGISTRADOS ( cedula_empleado int,nombre_empleado varchar(32), fecha_ingreso DATE, fecha_cambio_car DATE,fecha_desv DATE, estado varchar(32));
CREATE TABLE CLIENTE_REGISTRADO (cedula_cliente int, nombre_cliente varchar(32), estado varchar(32));
CREATE TABLE PRODUCTO_REGISTRADO (id_producto int,estado varchar(32));
CREATE TABLE PROVEEDORES_REGISTRADOS (nit_proveedor int,nom_pro varchar(32), estado varchar(32) );
create table BITACORA_VENTAS (vendedor varchar(32), cliente varchar(32),sucursal varchar(32),usuario varchar(32),hostname varchar(32),operacion varchar(32),fecha date);

CREATE VIEW VIPAISES_REGISTRADOSE as select * from PAISES_REGISTRADOSE;
CREATE VIEW VRPAISES_REGISTRADOSE AS SELECT * FROM PAISES_REGISTRADOSE;
CREATE VIEW VIEMPLEADOS_REGISTRADOS AS SELECT * FROM EMPLEADOS_REGISTRADOS;
CREATE VIEW VREMPLEADOS_REGISTRADOS AS SELECT * FROM EMPLEADOS_REGISTRADOS;
CREATE VIEW VICLIENTE_REGISTRADO AS SELECT * FROM CLIENTE_REGISTRADO;
CREATE VIEW VRCLIENTE_REGISTRADO AS SELECT * FROM CLIENTE_REGISTRADO;
CREATE VIEW VIPRODUCTO_REGISTRADO AS SELECT * FROM PRODUCTO_REGISTRADO;
CREATE VIEW VRPRODUCTO_REGISTRADO AS SELECT * FROM PRODUCTO_REGISTRADO;
CREATE VIEW VIPROVEEDORES_REGISTRADOS AS SELECT * FROM PROVEEDORES_REGISTRADOS;
CREATE VIEW VRPROVEEDORES_REGISTRADOS AS SELECT * FROM PROVEEDORES_REGISTRADOS;
CREATE VIEW VIBITACORA_VENTAS AS SELECT * FROM BITACORA_VENTAS;
CREATE VIEW VRBITACORA_VENTAS AS SELECT * FROM BITACORA_VENTAS;

GRANT INSERT ON VIPAISES_REGISTRADOSE TO grupo22;
GRANT SELECT ON VRPAISES_REGISTRADOSE TO grupo22;
GRANT INSERT ON VIEMPLEADOS_REGISTRADOS TO grupo22;
GRANT SELECT ON VREMPLEADOS_REGISTRADOS TO grupo22;
GRANT INSERT ON VICLIENTE_REGISTRADO TO grupo22;
GRANT SELECT ON VRCLIENTE_REGISTRADO TO grupo22;
GRANT INSERT ON VIPRODUCTO_REGISTRADO TO grupo22;
GRANT SELECT ON VRPRODUCTO_REGISTRADO TO grupo22;
GRANT INSERT ON VIPROVEEDORES_REGISTRADOS TO grupo22;
GRANT SELECT ON VRPROVEEDORES_REGISTRADOS TO grupo22;
GRANT INSERT ON VIBITACORA_VENTAS TO grupo22;
GRANT SELECT ON VRBITACORA_VENTAS TO grupo22;


