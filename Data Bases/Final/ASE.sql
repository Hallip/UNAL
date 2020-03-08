create table BODEGA (
   ID_PRODUCTO          int                            not null,
   CANTIDAD             int                            null,
   SUCUR_BOD            varchar(32)                    not null,
   CIUDADSU             varchar(32)                    null,
   PAISSU               varchar(32)                    null,
   constraint PK_BODEGA primary key nonclustered (ID_PRODUCTO, SUCUR_BOD)
)
go

/*==============================================================*/
/* Index: INVENTARIO2_FK                                        */
/*==============================================================*/
create index INVENTARIO2_FK on BODEGA (
CIUDADSU ASC,
PAISSU ASC
)
go

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS (
   NOM_CAR              varchar(32)                    not null,
   NOMBRE_DEP           varchar(32)                    null,
   SUCURSAL             varchar(32)                    NOT null,
   DEP_CAR              varchar(32)                    not null,
   S_MIN                int                            null,
   S_MAX                int                            null,
   constraint PK_CARGOS primary key nonclustered (NOM_CAR, SUCURSAL,DEP_CAR)
)
go

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on CARGOS (
NOMBRE_DEP ASC,
SUCURSAL ASC
)
go

create table CIUDADES (
   NOM_CIU              varchar(32)                    null,
   IATACIU              varchar(3)                     not null,
   ISO3166              int                            null,
   CIUDADSU             varchar(32)                    null,
   constraint PK_CIUDADES primary key nonclustered (IATACIU)
)
go

/*==============================================================*/
/* Index: LUGAR_FK                                              */
/*==============================================================*/
create index LUGAR_FK on CIUDADES (
ISO3166 ASC
)
go


/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CED_CLI              int                            not null,
   CED_EMP              int                            null,
   CLIENTE_CI           varchar(32)                    null,
   VENDEDOR_CI          varchar(32)                    null,
   NOMB_CLI             varchar(32)                    null,
   AP_CLI               varchar(32)                    null,
   SUCUR_CLI            varchar(32)                    null,
   DIREC_CLI            varchar(32)                    null,
   EMAIL_CLI            varchar(32)                    null,
   TEL_CLI              int                            null,
   VENDEDOR             varchar(32)                    null,
   constraint PK_CLIENTES primary key nonclustered (CED_CLI)
)
go

/*==============================================================*/
/* Index: ATIENDE_FK                                            */
/*==============================================================*/
create index ATIENDE_FK on CLIENTES (
CED_EMP ASC
)
go

/*==============================================================*/
/* Index: CITA_CLI_FK                                           */
/*==============================================================*/
create index CITA_CLI_FK on CLIENTES (
CLIENTE_CI ASC,
VENDEDOR_CI ASC
)
go

create table DEPARTAMENTOS (
   NOMBRE_DEP           varchar(32)                    not null,
   DIRECTOR_DEP         varchar(32)                    not null,
   SUCURSAL             varchar(32)                    not null,
   constraint PK_DEPARTAMENTOS primary key nonclustered (NOMBRE_DEP, SUCURSAL)
)
go

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   CED_EMP              int                            not null,
   NOM_CAR              varchar(32)                    null,
   NOMB_EMP             varchar(1024)                  not null,
   AP_EMP               varchar(1024)                  not null,
   GEN_EMP              varchar(1024)                  not null,
   EMAIL_EMP            varchar(1024)                  not null,
   FECHA_INGRESO        date                           not null,
   DEP_EMP              varchar(1024)                  not null,
   CARGO_               varchar(1024)                  not null,
   SUCURSAL_EMP         varchar(1024)                  not null,
   JEFE                 varchar(1024)                  not null,
   SALARIO              int                            not null,
   COMISION             int                            null,
   SANCION              int                            null,
   constraint PK_EMPLEADOS primary key nonclustered (CED_EMP)
)
go

/*==============================================================*/
/* Index: TRABAJA_FK                                            */
/*==============================================================*/
create index TRABAJA_FK on EMPLEADOS (
NOM_CAR ASC
)
go

create table LISTA_DE_CANDIDATOS (
   CED_CAN              int                            not null,
   NOM_CAR              varchar(32)                    null,
   NOM_CAN             varchar(32)                  null,
   AP_CAN               varchar(32)                  null,
   GEN_CAN              varchar(32)                  null,
   TEL_CAN              int                            null,
   EMAIL_CAN            varchar(32)                  null,
   APTITUD              int                            null,
   CARGO                varchar(32)                  null,
   SUCUR_CAN            varchar(32)                  null,
   constraint PK_LISTA_DE_CANDIDATOS primary key nonclustered (CED_CAN)
)
go

/*==============================================================*/
/* Index: ASPIRANTE_FK                                          */
/*==============================================================*/
create index ASPIRANTE_FK on LISTA_DE_CANDIDATOS (
NOM_CAR ASC
)
go

/*==============================================================*/
/* Table: PAISES                                                */
/*==============================================================*/
create table PAISES (
   NOM_PAIS             varchar(32)                    null,
   ISO3166              int                            not null,
   IATAPAIS             varchar(2)                     null,
   PREFIX               int                            not null,
   constraint PK_PAISES primary key nonclustered (ISO3166)
)
go

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   ID_PROD              int                            not null,
   NIT_PRO              bigint                            null,
   DESCRIP_PROD         varchar(32)                    not null,
   PRECIO_COMPRA        int                            not null,
   PRECIO_DE_VENTA      int                            not null,
   NOM_PRO              varchar(32)                    not null,
   constraint PK_PRODUCTOS primary key nonclustered (ID_PROD)
)
go


/*==============================================================*/
/* Index: VENDE_EMPRE_FK                                        */
/*==============================================================*/
create index VENDE_EMPRE_FK on PRODUCTOS (
NIT_PRO ASC
)
go


/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   NOM_PRO              varchar(32)                    null,
   NIT_PRO              bigint                         not null,
   COD                  int                            null,
   TEL_PRO              int                            null,
   DIREC_PRO            varchar(32)                    null,
   NOM_GER              varchar(32)                    null,
   CED_GER              int                            null,
   TEL_GER              int                            null,
   CIUDAD               varchar(32)                    null,
   EMAIL_PRO            varchar(32)                    null,
   constraint PK_PROVEEDORES primary key nonclustered (NIT_PRO)
)
go

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES (
   CIUDADSU             varchar(32)                    not null,
   PAISSU               varchar(32)                    not null,
   DIRECTOR_DE_SUCURSAL varchar(32)                    null,
   PREFIJOSU            int                            null,
   TELEFONOSU           int                            null,
   constraint PK_SUCURSALES primary key nonclustered (CIUDADSU, PAISSU)
)
go

/*==============================================================*/
/* Table: VENTAS                                                */
/*==============================================================*/
create table VENTAS (
   ID_VENTA             int                            not null,
   ID_PRODUCTO          int                            null,
   SUCUR_BOD            varchar(32)                    null,
   CED_EMP              int                            null,
   CED_CLI              int                            null,
   VENDEDOR_VE          varchar(32)                  null,
   CLIENTE_VE           varchar(32)                  null,
   IDPROVE              int                            null,
   CANTIDAD_PRO         int                            null,
   VALOR_VE             int                            null,
   constraint PK_VENTAS primary key nonclustered (ID_VENTA)
)
go

/*==============================================================*/
/* Index: SUMINISTRA_FK                                         */
/*==============================================================*/
create index SUMINISTRA_FK on VENTAS (
ID_PRODUCTO ASC,
SUCUR_BOD ASC
)
go

/*==============================================================*/
/* Index: VENDE_FK                                              */
/*==============================================================*/
create index VENDE_FK on VENTAS (
CED_EMP ASC
)
go

/*==============================================================*/
/* Index: COMPRA_FK                                             */
/*==============================================================*/
create index COMPRA_FK on VENTAS (
CED_CLI ASC
)
go


/*==============================================================*/
/* Table: VISITAS                                               */
/*==============================================================*/
create table VISITAS (
   VENDEDOR_CI          varchar(32)                    not null,
   CLIENTE_CI           varchar(32)                    not null,
   CED_CLI              int                            null,
   CED_EMP              int                            null,
   FECHA_CI             datetime                       null,
   ESTADO               varchar(32)                    null,
   constraint PK_VISITAS primary key nonclustered (CLIENTE_CI, VENDEDOR_CI)
)
go

/*==============================================================*/
/* Index: CITA_CLI2_FK                                          */
/*==============================================================*/
create index CITA_CLI2_FK on VISITAS (
CED_CLI ASC
)
go

/*==============================================================*/
/* Index: CITA_EMP_FK                                           */
/*==============================================================*/
create index CITA_EMP_FK on VISITAS (
CED_EMP ASC
)
go


alter table BODEGA
   add constraint FK_BODEGA_INVENTARI_SUCURSAL foreign key (CIUDADSU, PAISSU)
      references SUCURSALES (CIUDADSU, PAISSU)
go

alter table CARGOS
   add constraint FK_CARGOS_PERTENECE_DEPARTAM foreign key (NOMBRE_DEP, SUCURSAL)
      references DEPARTAMENTOS (NOMBRE_DEP, SUCURSAL)
go

alter table CIUDADES
   add constraint FK_CIUDADES_LUGAR_PAISES foreign key (ISO3166)
      references PAISES (ISO3166)
go



alter table CLIENTES
   add constraint FK_CLIENTES_ATIENDE_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP)
go

alter table CLIENTES
   add constraint FK_CLIENTES_CITA_CLI_VISITAS foreign key (CLIENTE_CI, VENDEDOR_CI)
      references VISITAS (CLIENTE_CI, VENDEDOR_CI)
go


alter table PRODUCTOS
   add constraint FK_PRODUCTO_VENDE_EMP_PROVEEDO foreign key (NIT_PRO)
      references PROVEEDORES (NIT_PRO)
go


alter table VENTAS
   add constraint FK_VENTAS_COMPRA_CLIENTES foreign key (CED_CLI)
      references CLIENTES (CED_CLI)
go

alter table VENTAS
   add constraint FK_VENTAS_SUMINISTR_BODEGA foreign key (ID_PRODUCTO, SUCUR_BOD)
      references BODEGA (ID_PRODUCTO, SUCUR_BOD)
go

alter table VENTAS
   add constraint FK_VENTAS_VENDE_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP)
go

alter table VISITAS
   add constraint FK_VISITAS_CITA_CLI2_CLIENTES foreign key (CED_CLI)
      references CLIENTES (CED_CLI)
go

alter table VISITAS
   add constraint FK_VISITAS_CITA_EMP_EMPLEADO foreign key (CED_EMP)
      references EMPLEADOS (CED_EMP)
go

CREATE TABLE PAISES_REGISTRADOSE (nombre_pais varchar(32), estado varchar(32))
CREATE TABLE EMPLEADOS_REGISTRADOS ( cedula_empleado int,nombre_empleado varchar(32), fecha_ingreso DATE, fecha_cambio_car DATE,fecha_desv DATE, estado varchar(32))
CREATE TABLE CLIENTE_REGISTRADO (cedula_cliente int, nombre_cliente varchar(32), estado varchar(32))
CREATE TABLE PRODUCTO_REGISTRADO (id_producto int,estado varchar(32))
CREATE TABLE PROVEEDORES_REGISTRADOS (nit_proveedor int,nom_pro varchar(32), estado varchar(32) )
create table BITACORA_VENTAS (vendedor varchar(32), cliente varchar(32),sucursal varchar(32),usuario varchar(32),hostname varchar(32),operacion varchar(32),fecha date)

CREATE VIEW VIPAISES_REGISTRADOSE as select * from PAISES_REGISTRADOSE
CREATE VIEW VRPAISES_REGISTRADOSE AS SELECT * FROM PAISES_REGISTRADOSE
CREATE VIEW VIEMPLEADOS_REGISTRADOS AS SELECT * FROM EMPLEADOS_REGISTRADOS
CREATE VIEW VREMPLEADOS_REGISTRADOS AS SELECT * FROM EMPLEADOS_REGISTRADOS
CREATE VIEW VICLIENTE_REGISTRADO AS SELECT * FROM CLIENTE_REGISTRADO
CREATE VIEW VRCLIENTE_REGISTRADO AS SELECT * FROM CLIENTE_REGISTRADO
CREATE VIEW VIPRODUCTO_REGISTRADO AS SELECT * FROM PRODUCTO_REGISTRADO
CREATE VIEW VRPRODUCTO_REGISTRADO AS SELECT * FROM PRODUCTO_REGISTRADO
CREATE VIEW VIPROVEEDORES_REGISTRADOS AS SELECT * FROM PROVEEDORES_REGISTRADOS
CREATE VIEW VRPROVEEDORES_REGISTRADOS AS SELECT * FROM PROVEEDORES_REGISTRADOS
CREATE VIEW VIBITACORA_VENTAS AS SELECT * FROM BITACORA_VENTAS
CREATE VIEW VRBITACORA_VENTAS AS SELECT * FROM BITACORA_VENTAS

GRANT INSERT ON VIPAISES_REGISTRADOSE TO grupo22
GRANT SELECT ON VRPAISES_REGISTRADOSE TO grupo22
GRANT INSERT ON VIEMPLEADOS_REGISTRADOS TO grupo22
GRANT SELECT ON VREMPLEADOS_REGISTRADOS TO grupo22
GRANT INSERT ON VICLIENTE_REGISTRADO TO grupo22
GRANT SELECT ON VRCLIENTE_REGISTRADO TO grupo22
GRANT INSERT ON VIPRODUCTO_REGISTRADO TO grupo22
GRANT SELECT ON VRPRODUCTO_REGISTRADO TO grupo22
GRANT INSERT ON VIPROVEEDORES_REGISTRADOS TO grupo22
GRANT SELECT ON VRPROVEEDORES_REGISTRADOS TO grupo22
GRANT INSERT ON VIBITACORA_VENTAS TO grupo22
GRANT SELECT ON VRBITACORA_VENTAS TO grupo22




create  trigger PR on PAISES
  for insert as
    declare @NP varchar(30)
    select @NP = (select NOM_PAIS from inserted)
    insert VIPAISES_REGISTRADOSE values ( @NP,'Resgitrados')
go



create trigger CLIEN_RESGIS
ON CLIENTES for insert
AS
	declare @IDCLI int
	declare @NOMCLI varchar(30)
	select @IDCLI = (select CED_CLI from inserted)
	select @NOMCLI = (select NOMB_CLI from inserted)
	insert VICLIENTE_REGISTRADO values (@IDCLI, @NOMCLI, 'Registrado')
go


create trigger PROD_RESGIS
ON PRODUCTOS for insert
AS
	declare @IDPRO int
	select @IDPRO = (select ID_PROD from inserted)
	insert VIPRODUCTO_REGISTRADO values (@IDPRO, 'Registrado')
go

create trigger PROVE_REGIS
ON PROVEEDORES for insert
AS
	declare @NITP int
	declare @NOMPROVE varchar(32)
	select @NITP = (select NIT_PRO from inserted)
	select @NOMPROVE = (select NOM_PRO from inserted)
	insert VIPROVEEDORES_REGISTRADOS values (@NITP, @NOMPROVE, 'Registrado')
go

create trigger EMPLE_RESGIS
ON EMPLEADOS for insert
AS
	declare @IDEMPL int
	declare @NOMEMPL varchar(30)
	declare @FE_INGRE date
	select @IDEMPL = (select CED_EMP from inserted)
	select @NOMEMPL = (select NOMB_EMP from inserted)
	select @FE_INGRE = (select FECHA_INGRESO from inserted)
	insert VIEMPLEADOS_REGISTRADOS values (@IDEMPL, @NOMEMPL, @FE_INGRE, null, null, 'Registrado')
go

create trigger BITA_VEN
ON VENTAS for insert
AS
	declare @VENDEDOR varchar(32)
	declare @CLIENTE varchar(32)
	declare @SUCURSAL varchar(32)
	select @VENDEDOR = (select VENDEDOR_VE from inserted)
	select @CLIENTE = (select CLIENTE_VE from inserted)
	select @SUCURSAL = (select SUCUR_BOD from inserted)
	insert VIBITACORA_VENTAS values (@VENDEDOR, @CLIENTE, @SUCURSAL, user_name(), suser_name(), 'Adicion', getdate())
go



create trigger BITA_VEN_UP

ON VENTAS for update
AS
	declare @VENDEDOR varchar(32)
	declare @CLIENTE varchar(32)
	declare @SUCURSAL varchar(32)
	select @VENDEDOR = (select VENDEDOR_VE from inserted)
	select @CLIENTE = (select CLIENTE_VE from inserted)
	select @SUCURSAL = (select SUCUR_BOD from inserted)
	insert VIBITACORA_VENTAS values (@VENDEDOR, @CLIENTE, @SUCURSAL, user_name(), suser_name(), 'Actualizacion', getdate())
go


create trigger BITA_VEN_DE
ON VENTAS for delete
AS
	declare @VENDEDOR varchar(32)
	declare @CLIENTE varchar(32)
	declare @SUCURSAL varchar(32)
	select @VENDEDOR = (select VENDEDOR_VE from deleted)
	select @CLIENTE = (select CLIENTE_VE from deleted)
	select @SUCURSAL = (select SUCUR_BOD from deleted)
	insert VIBITACORA_VENTAS values (@VENDEDOR, @CLIENTE, @SUCURSAL, user_name(), suser_name(), 'Borrado', getdate())
go



CREATE VIEW VIPAISES AS SELECT * FROM PAISES
CREATE VIEW VRPAISES AS SELECT * FROM PAISES
CREATE VIEW VIPAISESR AS SELECT * FROM PAISES_REGISTRADOSE
CREATE VIEW VRPAISESR AS SELECT * FROM PAISES_REGISTRADOSE
CREATE VIEW VICIUDADES AS SELECT * FROM CIUDADES
CREATE VIEW VRCIUDADES AS SELECT * FROM CIUDADES
CREATE VIEW VIBODEGA AS SELECT * FROM BODEGA
CREATE VIEW VRBODEGA AS SELECT * FROM BODEGA
CREATE VIEW VICARGOS AS SELECT * FROM CARGOS
CREATE VIEW VRCARGOS AS SELECT * FROM CARGOS
CREATE VIEW VICLIENTES AS SELECT * FROM CLIENTES
CREATE VIEW VRCLIENTES AS SELECT * FROM CLIENTES
CREATE VIEW VIEMPLEADOS AS SELECT * FROM EMPLEADOS
CREATE VIEW VREMPLEADOS AS SELECT * FROM EMPLEADOS
CREATE VIEW VIDEPARTAMENTOS AS SELECT * FROM DEPARTAMENTOS
CREATE VIEW VRDEPARTAMENTOS AS SELECT * FROM DEPARTAMENTOS
CREATE VIEW VILC AS SELECT * FROM LISTA_DE_CANDIDATOS
CREATE VIEW VRLC AS SELECT * FROM LISTA_DE_CANDIDATOS
CREATE VIEW VIPRODUCTOS AS SELECT * FROM PRODUCTOS
CREATE VIEW VRPRODUCTOS AS SELECT * FROM PRODUCTOS
CREATE VIEW VIPROVEEDORES AS SELECT * FROM PROVEEDORES
CREATE VIEW VRPROVEEDORES AS SELECT * FROM PROVEEDORES
CREATE VIEW VISUCURSALES AS SELECT * FROM SUCURSALES
CREATE VIEW VRSUCURSALES AS SELECT * FROM SUCURSALES
CREATE VIEW VIVENTAS AS SELECT * FROM VENTAS
CREATE VIEW VRVENTAS AS SELECT * FROM VENTAS
CREATE VIEW VIVISITAS AS SELECT * FROM VISITAS
CREATE VIEW VRVISITAS AS SELECT * FROM VISITAS
CREATE VIEW VICLIENREG AS SELECT * FROM CLIENTE_REGISTRADO
CREATE VIEW VRCLIENREG AS SELECT * FROM CLIENTE_REGISTRADO


GRANT INSERT ON VIPAISES TO grupo22
GRANT select ON VRPAISES TO grupo22
GRANT INSERT ON VIPAISESR TO grupo22
GRANT select ON VRPAISESR TO grupo22
GRANT INSERT ON VIBODEGA TO grupo22
GRANT select ON VRBODEGA TO grupo22
GRANT INSERT ON VICARGOS TO grupo22
GRANT select ON VRCARGOS TO grupo22
GRANT INSERT ON VICIUDADES TO grupo22
GRANT select ON VRCIUDADES TO grupo22
GRANT INSERT ON VICLIENTES TO grupo22
GRANT select ON VRCLIENTES TO grupo22
GRANT INSERT ON VIDEPARTAMENTOS TO grupo22
GRANT select ON VRDEPARTAMENTOS TO grupo22
GRANT INSERT ON VIEMPLEADOS TO grupo22
GRANT select ON VREMPLEADOS TO grupo22
GRANT INSERT ON VILC TO grupo22
GRANT select ON VRLC TO grupo22
GRANT INSERT ON VIPRODUCTOS TO grupo22
GRANT select ON VRPRODUCTOS TO grupo22
GRANT INSERT ON VIPROVEEDORES TO grupo22
GRANT select ON VRPROVEEDORES TO grupo22
GRANT INSERT ON VISUCURSALES TO grupo22
GRANT select ON VRSUCURSALES TO grupo22
GRANT INSERT ON VIVENTAS TO grupo22
GRANT select ON VRVENTAS TO grupo22
GRANT INSERT ON VIVISITAS TO grupo22
GRANT select ON VRVISITAS TO grupo22
GRANT INSERT ON VICLIENREG TO grupo22
GRANT INSERT ON VRCLIENREG TO grupo22

GRANT INSERT ON BODEGA TO grupo22
GRANT INSERT ON CARGOS TO grupo22
GRANT INSERT ON CIUDADES TO grupo22
GRANT INSERT ON CLIENTES TO grupo22
GRANT INSERT ON DEPARTAMENTOS TO grupo22
GRANT INSERT ON EMPLEADOS TO grupo22
GRANT INSERT ON LISTA_DE_CANDIDATOS TO grupo22
GRANT INSERT ON PAISES TO grupo22
GRANT INSERT ON PRODUCTOS TO grupo22
GRANT INSERT ON PROVEEDORES TO grupo22
GRANT INSERT ON SUCURSALES TO grupo22
GRANT INSERT ON VENTAS TO grupo22
GRANT INSERT ON VISITAS TO grupo22

CREATE FUNCTION COMISIONVEN(@SALVEN FLOAT, @PORVEN FLOAT)
	RETURNS FLOAT
as
	BEGIN
		declare @COMVEN FLOAT
		set @COMVEN = @SALVEN * (@PORVEN/100)
		return @COMVEN
	END
go


SELECT jugonzalezv.COMISIONVEN (100000,4)

CREATE PROCEDURE COMISION_VENDEDOR (@C int)
AS
	declare @S float
	declare @O float
	SELECT @S = (SELECT SALARIO FROM EMPLEADOS WHERE CED_EMP = @C)
	SELECT @O = (select COMISION FROM EMPLEADOS WHERE CED_EMP = @C)
	SELECT jugonzalezv.COMISIONVEN (@S, @O)
go

 EXEC COMISION_VENDEDOR (423477824)

