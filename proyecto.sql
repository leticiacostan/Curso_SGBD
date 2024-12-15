/*Los siguientes datos se insertan mediante consulta.
Ejemplo de insercion de datos mediante consulta:
INSERT INTO Customers (Emp_ID ,Name)
         SELECT *
         FROM Employees;
		 
INSERTAR DATOS CALCULADOS:
 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned,
  primary key (codigo)
 );
 
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',15,100);
   select titulo, precio,cantidad,precio*cantidad
  from libros;  
  
Ejemplo de como añadir datos a una tabla con valores por defecto
insert into productos (IDProducto, NombreProducto, DescripcionProducto, PrecioProducto, Stock)
values('1', 'a', 'a', 2.05, 1);
select * from productos;
*/

/*Eliminacion de la base de datos en caso de que exista y creacion de la misma*/
drop database if exists proyecto1;
create database proyecto1;
use proyecto1; /*Se establece por defecto la bd que se debe de usar*/

/*Creacion de las mismas*/
create table clientes (
	DNICliente varchar(12) unique not null,
	NombreCliente varchar(45) not null,
	ApellidosCliente varchar(45) not null,
	TelefonoContacto int not null,
	Email varchar(45) not null,
	DireccionEnvio varchar(100) not null,
	primary key (DNICliente)
);

create table productos (
	IDProducto int unique not null,
    NombreProducto varchar(50) not null,
    DescripcionProducto varchar(100),
    PrecioProducto float(6,2) not null,
    Stock int,
    IVA int default 21, /*Establecemos el valor del IVA por defecto a 21*/
    primary key (IDProducto)
);

create table pedidos(
	NumPedido varchar(15) unique not null,
    IDCliente varchar(12) not null,
    FechaHoraPedido datetime not null,
    NombreCliente varchar(45) not null,
    ApellidosClinte varchar(45) not null,
    DirecciónEnvio varchar(100) not null,
    primary key (NumPedido, IDCliente),
    foreign key (IDCliente) references clientes(DNICliente)
);

create table detallesPedidos(
	NumPedido varchar(15) unique not null,
    IDProducto int unique not null,
    NombreProducto varchar(50) not null,
    CantidadProducto int not null,
    PrecioUnitario float(6,2) not null,
    PrecioTotalProducto float(10,2) not null,
    PrecioTotalPedido float(14, 2) not null,
    primary key (NumPedido, IDProducto),
    foreign key (NumPedido) references pedidos(NumPedido),
    foreign key (IDProducto) references productos(IDProducto)
);
