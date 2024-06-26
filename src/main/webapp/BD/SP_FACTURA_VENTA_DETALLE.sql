/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Cesar
 * Created: 25 jun. 2024
 */

CREATE DEFINER=`root`@`localhost` PROCEDURE `posjava`.`SP_FACTURA_VENTA_DETALLE`(idventa int, idproducto int,  cantidad int, precio decimal(18,2))
begin
	INSERT INTO detallesventa
( IdVenta, IdProducto, Cantidad, Precio, Descuento, UsuarioCrea, FechaCrea)
VALUES( idventa, idproducto, cantidad, precio, 0, 1, now());
update productos set Stock= Stock -cantidad where IdProducto =idproducto;
end

CALL SP_FACTURA_VENTA_DETALLE(48, 1, 1, 99);