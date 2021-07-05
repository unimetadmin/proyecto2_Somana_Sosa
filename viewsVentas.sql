---Vistas de Ventas (Reporting) para el dashboard

--select * from business.ventas
--inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
--inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
--inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
--inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
--inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
--inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita

---Clientes que mas han gastado por dia tienda 1
create or replace view reporting.consumidia1 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
where business.ventas.id_tienda = 1
group by fecha, nombrec
order by fecha asc,cantidad desc;

---Clientes que mas han gastado por dia tienda 2
create or replace view reporting.consumidia2 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
where business.ventas.id_tienda = 2
group by fecha, nombrec
order by fecha asc,cantidad desc;

---Clientes que menos han gastado por dia tienda 1
create or replace view reporting.consumimenosdia1 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
where business.ventas.id_tienda = 1
group by fecha, nombrec
order by fecha asc,cantidad asc;

---Clientes que menos han gastado por dia tienda 2
create or replace view reporting.consumimenosdia2 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
where business.ventas.id_tienda = 2
group by fecha, nombrec
order by fecha asc,cantidad asc;

---Clientes con mas compras/visitas por dia tienda 1
create or replace view reporting.compramasdia1 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, qa.tiendas.id_tienda AS Tienda, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, count(qa.visitas.id_visita) as Nvisitas
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
Where qa.tiendas.id_tienda = 1
group by nombrec, fecha, Tienda
order by fecha asc, Nvisitas desc;

---Clientes con mas compras/visitas por dia tienda 2
create or replace view reporting.compramasdia2 as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, qa.tiendas.id_tienda AS Tienda, concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, count(qa.visitas.id_visita) as Nvisitas
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
Where qa.tiendas.id_tienda = 2
group by nombrec, fecha, Tienda
order by fecha asc, Nvisitas desc;

--Data de metodos de pago
create or replace view reporting.frecycantBanco as
select split_part(qa.visitas.hora_entrada,' ',1) as fecha, qa.facturas.metodopago as banco, 
count(qa.facturas.montoTotal) as frecuencia,  qa.tiendas.id_tienda AS Tienda, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
group by banco, fecha, Tienda
order by fecha asc;

--Ganancias por tienda
create or replace view reporting.ganacias as
select sum(qa.facturas.montoTotal) as Ganacias,  qa.tiendas.nombre AS Tienda
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
group by Tienda;

--Best Comprador
create or replace view reporting.mejorCompr as
select concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, sum(qa.facturas.montoTotal) as cantidad
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
group by nombrec
order by cantidad desc
limit 1;

--Best Aportador
create or replace view reporting.mejDinero as
select concat(qa.personas.nombre,' ',qa.personas.apellido) as nombrec, count(qa.visitas.id_visita) as Nvisitas
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
group by nombrec
order by Nvisitas desc
limit 1;

--Best Tarjeta
create or replace view reporting.mejBanco as
select qa.facturas.metodopago as banco, 
count(qa.facturas.montoTotal) as frecuencia
from business.ventas
inner join qa.tiendas On business.ventas.id_tienda = qa.tiendas.id_tienda
inner join qa.productos On business.ventas.id_producto = qa.productos.id_producto
inner join qa.categorias On business.ventas.id_categoria = qa.categorias.id_categoria
inner join qa.facturas On business.ventas.id_factura = qa.facturas.id_factura
inner join qa.personas On business.ventas.id_persona = qa.personas.id_persona
inner join qa.visitas On business.ventas.id_visita = qa.visitas.id_visita
group by banco
limit 1;
