/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Cesar
 * Created: 25 jun. 2024
 */

CREATE DEFINER=`root`@`localhost` PROCEDURE `posjava`.`SP_FACTURA_VENTA`(in idcliente int,in total numeric(8,1))
begin
	DECLARE last_inserted_id INT;
INSERT INTO ventas (IdCliente, IdUsuario, FechaVenta, Impuesto, Total, Estado, UsuarioCrea, FechaCrea) 
VALUES( idcliente, 1, NOW(), (total*0.18), total, 1, 1, NOW());
SET last_inserted_id = LAST_INSERT_ID();
SELECT last_inserted_id AS IdVenta;
end;


CALL SP_FACTURA_VENTA(10, 11.00);
