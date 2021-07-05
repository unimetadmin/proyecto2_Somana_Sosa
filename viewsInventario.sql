---Vistas de Inventario (Reporting_inv) para el dashboard

--select * from business_inv.inventario
--inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
--inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
--inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
--inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp

---Productos mas solicitados por dia tienda 1
create or replace view reporting_inv.productMaspedidos1 as
(select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.productos.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 1
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.productos.nombre)
order by fecha asc,cantidad desc);

---Productos mas solicitados por dia tienda 2
create or replace view reporting_inv.productMaspedidos2 as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.productos.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 2
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.productos.nombre)
order by fecha asc,cantidad desc;

---Productos menos solicitados por dia tienda 1
create or replace view reporting_inv.productMenospedidos1 as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.productos.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 1
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.productos.nombre)
order by fecha asc,cantidad asc;

---Productos menos solicitados por dia tienda 2
create or replace view reporting_inv.productMenospedidos2 as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.productos.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 2
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.productos.nombre)
order by fecha asc,cantidad asc;

---Categoria de mayor flujo por dia tienda 1
create or replace view reporting_inv.productMas1dia as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.categorias.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 1
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.categorias.nombre)
order by fecha asc,cantidad desc;

---Categoria de mayor flujo por dia tienda 2
create or replace view reporting_inv.productMas2dia as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.categorias.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 2
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.categorias.nombre)
order by fecha asc,cantidad desc;

---Categoria de menor flujo por dia tienda 1
create or replace view reporting_inv.productMenos1dia as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.categorias.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 1
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.categorias.nombre)
order by fecha asc,cantidad asc;

---Categoria de menor flujo por dia tienda 2
create or replace view reporting_inv.productMenos2dia as
select split_part(business_inv.inventario.hora,' ',1) as fecha, qa_inv.categorias.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
where business_inv.inventario.id_tienda = 2
group by (split_part(business_inv.inventario.hora,' ',1), qa_inv.categorias.nombre)
order by fecha asc,cantidad asc;

---Tienda con mayor rotación de inventario
create or replace view reporting_inv.mayRot as
select qa_inv.tiendas.nombre, sum(qa_inv.facturaproducto.cantidad) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
group by qa_inv.tiendas.nombre
order by cantidad;

---Tienda con mayor stock actual
create or replace view reporting_inv.mayStock as
select qa_inv.tiendas.nombre, sum(qa_inv.productos.stock) as cantidad
from business_inv.inventario
inner join qa_inv.tiendas On business_inv.inventario.id_tienda = qa_inv.tiendas.id_tienda
inner join qa_inv.productos On business_inv.inventario.id_producto = qa_inv.productos.id_producto
inner join qa_inv.categorias On business_inv.inventario.id_categoria = qa_inv.categorias.id_categoria
inner join qa_inv.facturaproducto On business_inv.inventario.id_fp = qa_inv.facturaproducto.id_fp
group by qa_inv.tiendas.nombre
order by cantidad ;