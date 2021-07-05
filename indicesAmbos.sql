--Creación de indices

--CREATE INDEX [nombre_del_indice] ON [nombre_de_tabla] ([nombre_columna]);

-- Indices pertinentes en el modelo de ventas
CREATE INDEX productCosto ON qa.productos (costo);
CREATE INDEX afiliadPersona ON qa.personas (esAfiliado);
CREATE INDEX tarjFactura ON qa.facturas (metodoPago);
CREATE INDEX montoFactura ON qa.facturas (montoTotal);

-- Indices pertinentes en el modelo de ventas
CREATE INDEX productStock ON qa_inv.productos (stock);
CREATE INDEX cantFP ON qa_inv.facturaproducto (cantidad);
CREATE INDEX horaFP ON qa_inv.facturaproducto (hora);