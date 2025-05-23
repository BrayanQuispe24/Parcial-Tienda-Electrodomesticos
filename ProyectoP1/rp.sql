PGDMP  *    "                }            DB_tienda_parcial_api    17.4    17.4 �                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    33143    DB_tienda_parcial_api    DATABASE     }   CREATE DATABASE "DB_tienda_parcial_api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';
 '   DROP DATABASE "DB_tienda_parcial_api";
                     postgres    false            6           1255    49637 F   actualizar_carrito(integer, numeric, date, character varying, integer) 	   PROCEDURE     e  CREATE PROCEDURE public.actualizar_carrito(IN p_id integer, IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE carrito_compra
    SET total = p_total,
        fecha = p_fecha,
        estado = p_estado,
        cliente_id = p_cliente_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_carrito(IN p_id integer, IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer);
       public               postgres    false                       1255    41353 0   actualizar_categoria(integer, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_categoria(IN p_id integer, IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE categoria
    SET nombre = p_nombre
    WHERE id = p_id;
END;
$$;
 \   DROP PROCEDURE public.actualizar_categoria(IN p_id integer, IN p_nombre character varying);
       public               postgres    false            	           1255    41308 �   actualizar_cliente(integer, character varying, character varying, character varying, character varying, character varying, bigint) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_cliente(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_estado character varying, IN p_usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE cliente
    SET nombre = p_nombre,
        apellido = p_apellido,
        telefono = p_telefono,
        direccion = p_direccion,
		estado=p_estado,
        usuario_id = p_usuario_id
    WHERE id = p_id;
    
    -- Puedes agregar una condición para verificar si la actualización fue exitosa.
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Cliente no encontrado con el id %', p_id;
    END IF;
END;
$$;
 �   DROP PROCEDURE public.actualizar_cliente(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_estado character varying, IN p_usuario_id bigint);
       public               postgres    false            D           1255    49662 P   actualizar_detalle_carrito(integer, integer, numeric, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_detalle_carrito(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE detalle_carrito
    SET cantidad = p_cantidad,
        precio_unitario = p_precio_unitario,
        "subTotal" = p_subtotal,
        carrito_id = p_carrito_id,
        producto_id = p_producto_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_detalle_carrito(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer);
       public               postgres    false            2           1255    49633 G   actualizar_detalle_factura(integer, integer, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_detalle_factura(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE detalle_factura 
    SET cantidad = p_cantidad,
        precio_unitario = p_precio_unitario,
        producto_id = p_producto_id,
        factura_id = p_factura_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_detalle_factura(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer);
       public               postgres    false            .           1255    49629 O   actualizar_factura(integer, date, numeric, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_factura(IN p_id integer, IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE factura 
    SET fecha = p_fecha,
        total = p_total,
        estado = p_estado,
        metodo_id = p_metodo_id,
        cliente_id = p_cliente_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_factura(IN p_id integer, IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer);
       public               postgres    false                       1255    49541 9   actualizar_inventario(integer, numeric, integer, integer) 	   PROCEDURE     :  CREATE PROCEDURE public.actualizar_inventario(IN p_id integer, IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE inventario 
    SET costo = p_costo,
        cantidad = p_cantidad,
        producto_id = p_producto_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_inventario(IN p_id integer, IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer);
       public               postgres    false                       1255    41360 5   actualizar_marca(integer, character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_marca(IN p_id integer, IN p_nombre character varying, IN p_estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE marca
    SET nombre = p_nombre,
        estado = p_estado
    WHERE id = p_id;
END;
$$;
 m   DROP PROCEDURE public.actualizar_marca(IN p_id integer, IN p_nombre character varying, IN p_estado boolean);
       public               postgres    false            #           1255    49555 2   actualizar_metodo_pago(integer, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_metodo_pago(IN p_id integer, IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE metodo_pago
    SET nombre = p_nombre
    WHERE id = p_id;
END;
$$;
 ^   DROP PROCEDURE public.actualizar_metodo_pago(IN p_id integer, IN p_nombre character varying);
       public               postgres    false                       1255    41319 ?   actualizar_permiso(boolean, boolean, boolean, boolean, integer) 	   PROCEDURE     W  CREATE PROCEDURE public.actualizar_permiso(IN p_crear boolean, IN p_eliminar boolean, IN p_actualizar boolean, IN p_ver boolean, IN p_usuario_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE permiso
	SET
	   crear=p_crear,
	   eliminar=p_eliminar,
	   actualizar=p_actualizar,
	   ver=p_ver
	WHERE usuario_id=p_usuario_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_permiso(IN p_crear boolean, IN p_eliminar boolean, IN p_actualizar boolean, IN p_ver boolean, IN p_usuario_id integer);
       public               postgres    false                       1255    49537 �   actualizar_personal(integer, character varying, character varying, character varying, character varying, date, character varying, integer) 	   PROCEDURE     I  CREATE PROCEDURE public.actualizar_personal(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_usuario_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE personal 
    SET nombre = p_nombre,
        apellido = p_apellido,
        telefono = p_telefono,
        direccion = p_direccion,
        fecha_nacimiento = p_fecha_nacimiento,
        rol = p_rol,
        usuario_id = p_usuario_id
    WHERE id = p_id;
END;
$$;
   DROP PROCEDURE public.actualizar_personal(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_usuario_id integer);
       public               postgres    false            *           1255    49545 8   actualizar_precio(integer, numeric, date, date, integer) 	   PROCEDURE     z  CREATE PROCEDURE public.actualizar_precio(IN p_id integer, IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE precio 
    SET precio = p_precio,
        fecha_inicio = p_fecha_inicio,
        fecha_final = p_fecha_final,
        producto_id = p_producto_id
    WHERE id = p_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_precio(IN p_id integer, IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer);
       public               postgres    false            >           1255    49649 T   actualizar_producto(integer, character varying, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_producto(IN producto_id integer, IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE producto
    SET descripcion = descripcion_param,
        estado = estado_param,
        marca_id = marca_id_param,
        categoria_id = categoria_id_param
    WHERE id = producto_id;
END;
$$;
 �   DROP PROCEDURE public.actualizar_producto(IN producto_id integer, IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer);
       public               postgres    false            5           1255    49636 8   crear_carrito(numeric, date, character varying, integer) 	   PROCEDURE     *  CREATE PROCEDURE public.crear_carrito(IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO carrito_compra (total, fecha, estado, cliente_id)
    VALUES (p_total, p_fecha, p_estado, p_cliente_id);
END;
$$;
 �   DROP PROCEDURE public.crear_carrito(IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer);
       public               postgres    false                       1255    41352 "   crear_categoria(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_categoria(IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO categoria(nombre)
    VALUES (p_nombre);
END;
$$;
 F   DROP PROCEDURE public.crear_categoria(IN p_nombre character varying);
       public               postgres    false            C           1255    49661 B   crear_detalle_carrito(integer, numeric, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.crear_detalle_carrito(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO detalle_carrito (cantidad, precio_unitario, "subTotal", carrito_id, producto_id)
    VALUES (p_cantidad, p_precio_unitario, p_subtotal, p_carrito_id, p_producto_id);
END;
$$;
 �   DROP PROCEDURE public.crear_detalle_carrito(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer);
       public               postgres    false            1           1255    49632 9   crear_detalle_factura(integer, numeric, integer, integer) 	   PROCEDURE     b  CREATE PROCEDURE public.crear_detalle_factura(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO detalle_factura (cantidad, precio_unitario, producto_id, factura_id)
    VALUES (p_cantidad, p_precio_unitario, p_producto_id, p_factura_id);
END;
$$;
 �   DROP PROCEDURE public.crear_detalle_factura(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer);
       public               postgres    false            -           1255    49628 A   crear_factura(date, numeric, character varying, integer, integer) 	   PROCEDURE     S  CREATE PROCEDURE public.crear_factura(IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO factura (fecha, total, estado, metodo_id, cliente_id)
    VALUES (p_fecha, p_total, p_estado, p_metodo_id, p_cliente_id);
END;
$$;
 �   DROP PROCEDURE public.crear_factura(IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer);
       public               postgres    false            &           1255    49540 +   crear_inventario(numeric, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.crear_inventario(IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO inventario(costo, cantidad, producto_id)
    VALUES (p_costo, p_cantidad, p_producto_id);
END;
$$;
 m   DROP PROCEDURE public.crear_inventario(IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer);
       public               postgres    false                       1255    41359 '   crear_marca(character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_marca(IN p_nombre character varying, IN p_estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO marca(nombre, estado)
    VALUES (p_nombre, p_estado);
END;
$$;
 W   DROP PROCEDURE public.crear_marca(IN p_nombre character varying, IN p_estado boolean);
       public               postgres    false            "           1255    49554 $   crear_metodo_pago(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_metodo_pago(IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO metodo_pago(nombre)
    VALUES (p_nombre);
END;
$$;
 H   DROP PROCEDURE public.crear_metodo_pago(IN p_nombre character varying);
       public               postgres    false            G           1255    49669     crear_permiso_al_crear_usuario()    FUNCTION     �   CREATE FUNCTION public.crear_permiso_al_crear_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO permiso (crear, eliminar, actualizar, ver, usuario_id)
    VALUES (TRUE, TRUE, TRUE, TRUE, NEW.id);
    RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.crear_permiso_al_crear_usuario();
       public               postgres    false            $           1255    49536 |   crear_personal(character varying, character varying, character varying, character varying, date, character varying, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.crear_personal(IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_usuario_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO personal(nombre, apellido, telefono, direccion, fecha_nacimiento, rol, usuario_id)
    VALUES (p_nombre, p_apellido, p_telefono, p_direccion, p_fecha_nacimiento, p_rol, p_usuario_id);
END;
$$;
 �   DROP PROCEDURE public.crear_personal(IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_usuario_id integer);
       public               postgres    false            )           1255    49544 *   crear_precio(numeric, date, date, integer) 	   PROCEDURE     =  CREATE PROCEDURE public.crear_precio(IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO precio(precio, fecha_inicio, fecha_final, producto_id)
    VALUES (p_precio, p_fecha_inicio, p_fecha_final, p_producto_id);
END;
$$;
 �   DROP PROCEDURE public.crear_precio(IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer);
       public               postgres    false            =           1255    49648 F   crear_producto(character varying, character varying, integer, integer) 	   PROCEDURE     s  CREATE PROCEDURE public.crear_producto(IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO producto (descripcion, estado, marca_id, categoria_id)
    VALUES (descripcion_param, estado_param, marca_id_param, categoria_id_param);
END;
$$;
 �   DROP PROCEDURE public.crear_producto(IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer);
       public               postgres    false            8           1255    49639    obtener_carrito_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_carrito_id(p_id integer) RETURNS TABLE(id integer, total numeric, fecha date, estado character varying, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM carrito_compra cp WHERE cp.id = p_id;
END;
$$;
 7   DROP FUNCTION public.obtener_carrito_id(p_id integer);
       public               postgres    false            7           1255    49638    obtener_carritos()    FUNCTION     �   CREATE FUNCTION public.obtener_carritos() RETURNS TABLE(id integer, total numeric, fecha date, estado character varying, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM carrito_compra;
END;
$$;
 )   DROP FUNCTION public.obtener_carritos();
       public               postgres    false                       1255    41358    obtener_categoria(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_categoria(p_id integer) RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.nombre FROM categoria c
    WHERE c.id = p_id;
END;
$$;
 6   DROP FUNCTION public.obtener_categoria(p_id integer);
       public               postgres    false                       1255    41356    obtener_categorias()    FUNCTION     �   CREATE FUNCTION public.obtener_categorias() RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.nombre FROM categoria c;
END;
$$;
 +   DROP FUNCTION public.obtener_categorias();
       public               postgres    false            ;           1255    49642 #   obtener_detalle_carrito_id(integer)    FUNCTION     4  CREATE FUNCTION public.obtener_detalle_carrito_id(p_id integer) RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, subtotal numeric, carrito_id integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_carrito dc WHERE dc.id = p_id;
END;
$$;
 ?   DROP FUNCTION public.obtener_detalle_carrito_id(p_id integer);
       public               postgres    false            4           1255    49635 #   obtener_detalle_factura_id(integer)    FUNCTION        CREATE FUNCTION public.obtener_detalle_factura_id(p_id integer) RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, producto_id integer, factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_factura f WHERE f.id = p_id;
END;
$$;
 ?   DROP FUNCTION public.obtener_detalle_factura_id(p_id integer);
       public               postgres    false            :           1255    49640    obtener_detalles_carrito()    FUNCTION       CREATE FUNCTION public.obtener_detalles_carrito() RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, subtotal numeric, carrito_id integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_carrito;
END;
$$;
 1   DROP FUNCTION public.obtener_detalles_carrito();
       public               postgres    false            3           1255    49634    obtener_detalles_factura()    FUNCTION     �   CREATE FUNCTION public.obtener_detalles_factura() RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, producto_id integer, factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_factura;
END;
$$;
 1   DROP FUNCTION public.obtener_detalles_factura();
       public               postgres    false            H           1255    49747    obtener_detalles_producto()    FUNCTION       CREATE FUNCTION public.obtener_detalles_producto() RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,  -- <== Agregado
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0)
    FROM producto p
    LEFT JOIN inventario i ON i.producto_id = p.id
    LEFT JOIN marca m ON m.id = p.marca_id
    LEFT JOIN categoria c ON c.id = p.categoria_id
    LEFT JOIN precio pr ON pr.producto_id = p.id
        AND pr.fecha_inicio <= CURRENT_DATE
        AND pr.fecha_final >= CURRENT_DATE
    ORDER BY p.id;
END;
$$;
 2   DROP FUNCTION public.obtener_detalles_producto();
       public               postgres    false            0           1255    49631    obtener_factura_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_factura_id(p_id integer) RETURNS TABLE(id integer, fecha date, total numeric, estado character varying, metodo_id integer, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM factura f WHERE f.id = p_id;
END;
$$;
 7   DROP FUNCTION public.obtener_factura_id(p_id integer);
       public               postgres    false            /           1255    49630    obtener_facturas()    FUNCTION     �   CREATE FUNCTION public.obtener_facturas() RETURNS TABLE(id integer, fecha date, total numeric, estado character varying, metodo_id integer, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM factura;
END;
$$;
 )   DROP FUNCTION public.obtener_facturas();
       public               postgres    false                       1255    49542    obtener_inventario()    FUNCTION     �   CREATE FUNCTION public.obtener_inventario() RETURNS TABLE(id integer, costo numeric, cantidad integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM inventario;
END;
$$;
 +   DROP FUNCTION public.obtener_inventario();
       public               postgres    false            (           1255    49543    obtener_inventario_id(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_inventario_id(p_id integer) RETURNS TABLE(id integer, costo numeric, cantidad integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM inventario i WHERE i.id = p_id;
END;
$$;
 :   DROP FUNCTION public.obtener_inventario_id(p_id integer);
       public               postgres    false            <           1255    49644    obtener_marca(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_marca(p_id integer) RETURNS TABLE(id integer, nombre character varying, estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM marca M WHERE M.id = p_id;
END;
$$;
 2   DROP FUNCTION public.obtener_marca(p_id integer);
       public               postgres    false                       1255    41362    obtener_marcas()    FUNCTION     �   CREATE FUNCTION public.obtener_marcas() RETURNS TABLE(id integer, nombre character varying, estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM marca;
END;
$$;
 '   DROP FUNCTION public.obtener_marcas();
       public               postgres    false            B           1255    49657    obtener_metodo_pago_id(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_metodo_pago_id(pago_id integer) RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT m.id, m.nombre FROM metodo_pago m WHERE m.id = pago_id;
END;
$$;
 >   DROP FUNCTION public.obtener_metodo_pago_id(pago_id integer);
       public               postgres    false            '           1255    49556    obtener_metodos_pago()    FUNCTION     �   CREATE FUNCTION public.obtener_metodos_pago() RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT m.id, m.nombre FROM metodo_pago m;
END;
$$;
 -   DROP FUNCTION public.obtener_metodos_pago();
       public               postgres    false                       1255    41317    obtener_permiso(integer)    FUNCTION     N  CREATE FUNCTION public.obtener_permiso(p_id integer) RETURNS TABLE(id integer, crear boolean, eliminar boolean, actualizar boolean, ver boolean, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
	SELECT c.id,c.crear,c.eliminar,c.actualizar,c.ver,c.usuario_id 
	FROM permiso c
	WHERE c.usuario_id=p_id;
END;
$$;
 4   DROP FUNCTION public.obtener_permiso(p_id integer);
       public               postgres    false            @           1255    49655    obtener_personal()    FUNCTION     K  CREATE FUNCTION public.obtener_personal() RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal;
END;
$$;
 )   DROP FUNCTION public.obtener_personal();
       public               postgres    false            A           1255    49656    obtener_personal(integer)    FUNCTION     k  CREATE FUNCTION public.obtener_personal(p_id integer) RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal p WHERE p.id = p_id;
END;
$$;
 5   DROP FUNCTION public.obtener_personal(p_id integer);
       public               postgres    false            %           1255    49539    obtener_personal_id(integer)    FUNCTION     o  CREATE FUNCTION public.obtener_personal_id(p_id integer) RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal p WHERE p.id = p_id;
END;
$$;
 8   DROP FUNCTION public.obtener_personal_id(p_id integer);
       public               postgres    false            ,           1255    49547    obtener_precio_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_precio_id(p_id integer) RETURNS TABLE(id integer, precio numeric, fecha_inicio date, fecha_final date, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM precio p WHERE p.id = p_id;
END;
$$;
 6   DROP FUNCTION public.obtener_precio_id(p_id integer);
       public               postgres    false            +           1255    49546    obtener_precios()    FUNCTION     �   CREATE FUNCTION public.obtener_precios() RETURNS TABLE(id integer, precio numeric, fecha_inicio date, fecha_final date, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM precio;
END;
$$;
 (   DROP FUNCTION public.obtener_precios();
       public               postgres    false            9           1255    49663    obtener_producto(integer)    FUNCTION     j  CREATE FUNCTION public.obtener_producto(producto_id integer) RETURNS TABLE(id integer, descripcion character varying, estado character varying, marca_id integer, categoria_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT p.id, p.descripcion, p.estado, p.marca_id, p.categoria_id
    FROM producto p
    WHERE p.id = producto_id;
END;
$$;
 <   DROP FUNCTION public.obtener_producto(producto_id integer);
       public               postgres    false            ?           1255    49650    obtener_productos()    FUNCTION     8  CREATE FUNCTION public.obtener_productos() RETURNS TABLE(id integer, descripcion character varying, estado character varying, marca_id integer, categoria_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT p.id, p.descripcion, p.estado, p.marca_id, p.categoria_id  FROM producto p;
END;
$$;
 *   DROP FUNCTION public.obtener_productos();
       public               postgres    false            E           1255    49666 &   obtener_ultimo_permiso_por_email(text)    FUNCTION     �  CREATE FUNCTION public.obtener_ultimo_permiso_por_email(p_email text) RETURNS TABLE(crear boolean, eliminar boolean, actualizar boolean, ver boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        per.crear,
        per.eliminar,
        per.actualizar,
        per.ver
    FROM permiso per
    INNER JOIN usuarios_customuser u ON per.usuario_id = u.id
    WHERE u.email = p_email
    ORDER BY per.id DESC
    LIMIT 1;
END;
$$;
 E   DROP FUNCTION public.obtener_ultimo_permiso_por_email(p_email text);
       public               postgres    false                       1255    41307    obtener_usuarios()    FUNCTION       CREATE FUNCTION public.obtener_usuarios() RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, estado character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
     RETURN QUERY
	 SELECT c.id,c.nombre,c.apellido,c.telefono,c.direccion,c.estado,c.usuario_id FROM cliente c;
END;
$$;
 )   DROP FUNCTION public.obtener_usuarios();
       public               postgres    false                       1255    41306 x   registrar_cliente(character varying, character varying, character varying, character varying, character varying, bigint) 	   PROCEDURE     �  CREATE PROCEDURE public.registrar_cliente(IN nombre character varying, IN apellido character varying, IN telefono character varying, IN direccion character varying, IN estado character varying, IN usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
 INSERT INTO cliente (nombre,apellido,telefono,direccion,estado,usuario_id) VALUES (nombre,apellido,telefono,direccion,estado,usuario_id);
END;
$$;
 �   DROP PROCEDURE public.registrar_cliente(IN nombre character varying, IN apellido character varying, IN telefono character varying, IN direccion character varying, IN estado character varying, IN usuario_id bigint);
       public               postgres    false            
           1255    41312 >   registrar_permisos(boolean, boolean, boolean, boolean, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE public.registrar_permisos(IN c_crear boolean, IN c_eliminar boolean, IN c_actualizar boolean, IN c_ver boolean, IN c_usuario bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
 INSERT INTO permiso(crear,eliminar,actualizar,ver,usuario_id)VALUES(c_crear,c_eliminar,c_actualizar,c_ver,c_usuario);
END;
$$;
 �   DROP PROCEDURE public.registrar_permisos(IN c_crear boolean, IN c_eliminar boolean, IN c_actualizar boolean, IN c_ver boolean, IN c_usuario bigint);
       public               postgres    false            F           1255    49668 %   verificar_existencia_permiso(integer)    FUNCTION       CREATE FUNCTION public.verificar_existencia_permiso(p_id integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM permiso WHERE usuario_id = p_id
    ) INTO existe;

    RETURN existe;
END;
$$;
 A   DROP FUNCTION public.verificar_existencia_permiso(p_id integer);
       public               postgres    false            �            1259    33167 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap r       postgres    false            �            1259    33166    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    224            �            1259    33175    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap r       postgres    false            �            1259    33174    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    226            �            1259    33161    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap r       postgres    false            �            1259    33160    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    222            �            1259    33276    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap r       postgres    false                        1259    49559    carrito_compra    TABLE     �   CREATE TABLE public.carrito_compra (
    id integer NOT NULL,
    total numeric(10,2) NOT NULL,
    fecha date NOT NULL,
    estado character varying NOT NULL,
    cliente_id integer
);
 "   DROP TABLE public.carrito_compra;
       public         heap r       postgres    false            �            1259    49558    carrito_compra_id_seq    SEQUENCE     �   ALTER TABLE public.carrito_compra ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.carrito_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    256            �            1259    41321 	   categoria    TABLE     g   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    41320    categoria_id_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    242            �            1259    33290    cliente    TABLE     1  CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    telefono character varying(20) NOT NULL,
    direccion character varying(255) NOT NULL,
    estado character varying(20) NOT NULL,
    usuario_id bigint
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    33289    cliente_id_seq    SEQUENCE     �   ALTER TABLE public.cliente ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    237                       1259    49573    detalle_carrito    TABLE     �   CREATE TABLE public.detalle_carrito (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    "subTotal" numeric(10,2) NOT NULL,
    carrito_id integer,
    producto_id integer
);
 #   DROP TABLE public.detalle_carrito;
       public         heap r       postgres    false                       1259    49572    detalle_carrito_id_seq    SEQUENCE     �   ALTER TABLE public.detalle_carrito ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.detalle_carrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    258                       1259    49611    detalle_factura    TABLE     �   CREATE TABLE public.detalle_factura (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    factura_id integer,
    producto_id integer
);
 #   DROP TABLE public.detalle_factura;
       public         heap r       postgres    false                       1259    49610    detalle_factura_id_seq    SEQUENCE     �   ALTER TABLE public.detalle_factura ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.detalle_factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    262            �            1259    33256    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap r       postgres    false            �            1259    33255    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    234            �            1259    33153    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap r       postgres    false            �            1259    33152    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            �            1259    33145    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap r       postgres    false            �            1259    33144    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    33315    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap r       postgres    false                       1259    49591    factura    TABLE     �   CREATE TABLE public.factura (
    id integer NOT NULL,
    fecha date NOT NULL,
    total numeric(10,2) NOT NULL,
    estado character varying NOT NULL,
    cliente_id integer,
    metodo_id integer
);
    DROP TABLE public.factura;
       public         heap r       postgres    false                       1259    49590    factura_id_seq    SEQUENCE     �   ALTER TABLE public.factura ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    260            �            1259    49499 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    id integer NOT NULL,
    costo numeric(10,2) NOT NULL,
    cantidad integer NOT NULL,
    producto_id integer
);
    DROP TABLE public.inventario;
       public         heap r       postgres    false            �            1259    49498    inventario_id_seq    SEQUENCE     �   ALTER TABLE public.inventario ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    248            �            1259    41327    marca    TABLE     �   CREATE TABLE public.marca (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.marca;
       public         heap r       postgres    false            �            1259    41326    marca_id_seq    SEQUENCE     �   ALTER TABLE public.marca ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    244            �            1259    49549    metodo_pago    TABLE     i   CREATE TABLE public.metodo_pago (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);
    DROP TABLE public.metodo_pago;
       public         heap r       postgres    false            �            1259    49548    metodo_pago_id_seq    SEQUENCE     �   ALTER TABLE public.metodo_pago ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.metodo_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    254            �            1259    33304    permiso    TABLE     �   CREATE TABLE public.permiso (
    id integer NOT NULL,
    crear boolean NOT NULL,
    eliminar boolean NOT NULL,
    actualizar boolean NOT NULL,
    ver boolean NOT NULL,
    usuario_id bigint
);
    DROP TABLE public.permiso;
       public         heap r       postgres    false            �            1259    33303    permiso_id_seq    SEQUENCE     �   ALTER TABLE public.permiso ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    239            �            1259    49523    personal    TABLE     S  CREATE TABLE public.personal (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    direccion character varying(255) NOT NULL,
    fecha_nacimiento date NOT NULL,
    rol character varying(20) NOT NULL,
    usuario_id bigint
);
    DROP TABLE public.personal;
       public         heap r       postgres    false            �            1259    49522    personal_id_seq    SEQUENCE     �   ALTER TABLE public.personal ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    252            �            1259    49511    precio    TABLE     �   CREATE TABLE public.precio (
    id integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_final date NOT NULL,
    producto_id integer
);
    DROP TABLE public.precio;
       public         heap r       postgres    false            �            1259    49510    precios_precio_id_seq    SEQUENCE     �   ALTER TABLE public.precio ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.precios_precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    250            �            1259    41333    producto    TABLE     �   CREATE TABLE public.producto (
    id integer NOT NULL,
    descripcion character varying NOT NULL,
    estado character varying NOT NULL,
    categoria_id integer,
    marca_id integer
);
    DROP TABLE public.producto;
       public         heap r       postgres    false            �            1259    41332    producto_id_seq    SEQUENCE     �   ALTER TABLE public.producto ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    246            �            1259    33207    usuarios_customuser    TABLE     �  CREATE TABLE public.usuarios_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    role character varying(10) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);
 '   DROP TABLE public.usuarios_customuser;
       public         heap r       postgres    false            �            1259    33215    usuarios_customuser_groups    TABLE     �   CREATE TABLE public.usuarios_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);
 .   DROP TABLE public.usuarios_customuser_groups;
       public         heap r       postgres    false            �            1259    33214 !   usuarios_customuser_groups_id_seq    SEQUENCE     �   ALTER TABLE public.usuarios_customuser_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    230            �            1259    33206    usuarios_customuser_id_seq    SEQUENCE     �   ALTER TABLE public.usuarios_customuser ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    228            �            1259    33221 $   usuarios_customuser_user_permissions    TABLE     �   CREATE TABLE public.usuarios_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 8   DROP TABLE public.usuarios_customuser_user_permissions;
       public         heap r       postgres    false            �            1259    33220 +   usuarios_customuser_user_permissions_id_seq    SEQUENCE       ALTER TABLE public.usuarios_customuser_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    232            �          0    33167 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public               postgres    false    224   �x      �          0    33175    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public               postgres    false    226   �x      �          0    33161    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public               postgres    false    222   �x      �          0    33276    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public               postgres    false    235   %|      �          0    49559    carrito_compra 
   TABLE DATA           N   COPY public.carrito_compra (id, total, fecha, estado, cliente_id) FROM stdin;
    public               postgres    false    256   �|      �          0    41321 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public               postgres    false    242   �|      �          0    33290    cliente 
   TABLE DATA           `   COPY public.cliente (id, nombre, apellido, telefono, direccion, estado, usuario_id) FROM stdin;
    public               postgres    false    237   }      �          0    49573    detalle_carrito 
   TABLE DATA           m   COPY public.detalle_carrito (id, cantidad, precio_unitario, "subTotal", carrito_id, producto_id) FROM stdin;
    public               postgres    false    258   ~}      �          0    49611    detalle_factura 
   TABLE DATA           a   COPY public.detalle_factura (id, cantidad, precio_unitario, factura_id, producto_id) FROM stdin;
    public               postgres    false    262   �}      �          0    33256    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public               postgres    false    234   �}      �          0    33153    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public               postgres    false    220   �}      �          0    33145    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public               postgres    false    218   �~      �          0    33315    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public               postgres    false    240   ��      �          0    49591    factura 
   TABLE DATA           R   COPY public.factura (id, fecha, total, estado, cliente_id, metodo_id) FROM stdin;
    public               postgres    false    260   ��      �          0    49499 
   inventario 
   TABLE DATA           F   COPY public.inventario (id, costo, cantidad, producto_id) FROM stdin;
    public               postgres    false    248   :�      �          0    41327    marca 
   TABLE DATA           3   COPY public.marca (id, nombre, estado) FROM stdin;
    public               postgres    false    244   z�      �          0    49549    metodo_pago 
   TABLE DATA           1   COPY public.metodo_pago (id, nombre) FROM stdin;
    public               postgres    false    254   ��      �          0    33304    permiso 
   TABLE DATA           S   COPY public.permiso (id, crear, eliminar, actualizar, ver, usuario_id) FROM stdin;
    public               postgres    false    239   ܂      �          0    49523    personal 
   TABLE DATA           p   COPY public.personal (id, nombre, apellido, telefono, direccion, fecha_nacimiento, rol, usuario_id) FROM stdin;
    public               postgres    false    252   5�      �          0    49511    precio 
   TABLE DATA           T   COPY public.precio (id, precio, fecha_inicio, fecha_final, producto_id) FROM stdin;
    public               postgres    false    250   ��      �          0    41333    producto 
   TABLE DATA           S   COPY public.producto (id, descripcion, estado, categoria_id, marca_id) FROM stdin;
    public               postgres    false    246   �      �          0    33207    usuarios_customuser 
   TABLE DATA           �   COPY public.usuarios_customuser (id, password, last_login, is_superuser, email, first_name, role, is_active, is_staff) FROM stdin;
    public               postgres    false    228   a�      �          0    33215    usuarios_customuser_groups 
   TABLE DATA           Q   COPY public.usuarios_customuser_groups (id, customuser_id, group_id) FROM stdin;
    public               postgres    false    230   ��      �          0    33221 $   usuarios_customuser_user_permissions 
   TABLE DATA           `   COPY public.usuarios_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public               postgres    false    232   ��                 0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public               postgres    false    223                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public               postgres    false    225                       0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);
          public               postgres    false    221                       0    0    carrito_compra_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.carrito_compra_id_seq', 2, true);
          public               postgres    false    255                       0    0    categoria_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_id_seq', 15, true);
          public               postgres    false    241            	           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 8, true);
          public               postgres    false    236            
           0    0    detalle_carrito_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.detalle_carrito_id_seq', 4, true);
          public               postgres    false    257                       0    0    detalle_factura_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.detalle_factura_id_seq', 4, true);
          public               postgres    false    261                       0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public               postgres    false    233                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);
          public               postgres    false    219                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);
          public               postgres    false    217                       0    0    factura_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.factura_id_seq', 14, true);
          public               postgres    false    259                       0    0    inventario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.inventario_id_seq', 13, true);
          public               postgres    false    247                       0    0    marca_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marca_id_seq', 14, true);
          public               postgres    false    243                       0    0    metodo_pago_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.metodo_pago_id_seq', 1, true);
          public               postgres    false    253                       0    0    permiso_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.permiso_id_seq', 17, true);
          public               postgres    false    238                       0    0    personal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.personal_id_seq', 1, true);
          public               postgres    false    251                       0    0    precios_precio_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.precios_precio_id_seq', 16, true);
          public               postgres    false    249                       0    0    producto_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.producto_id_seq', 21, true);
          public               postgres    false    245                       0    0 !   usuarios_customuser_groups_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.usuarios_customuser_groups_id_seq', 1, false);
          public               postgres    false    229                       0    0    usuarios_customuser_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.usuarios_customuser_id_seq', 10, true);
          public               postgres    false    227                       0    0 +   usuarios_customuser_user_permissions_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.usuarios_customuser_user_permissions_id_seq', 1, false);
          public               postgres    false    231            �           2606    33204    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public                 postgres    false    224            �           2606    33190 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public                 postgres    false    226    226            �           2606    33179 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public                 postgres    false    226            �           2606    33171    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public                 postgres    false    224            �           2606    33181 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public                 postgres    false    222    222            �           2606    33165 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public                 postgres    false    222            �           2606    33280 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public                 postgres    false    235            �           2606    33282 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public                 postgres    false    235                       2606    49565 "   carrito_compra carrito_compra_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.carrito_compra
    ADD CONSTRAINT carrito_compra_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.carrito_compra DROP CONSTRAINT carrito_compra_pkey;
       public                 postgres    false    256                       2606    41325    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    242            �           2606    33296    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    237                       2606    49577 $   detalle_carrito detalle_carrito_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_pkey;
       public                 postgres    false    258            $           2606    49615 $   detalle_factura detalle_factura_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_pkey;
       public                 postgres    false    262            �           2606    33263 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public                 postgres    false    234            �           2606    33159 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public                 postgres    false    220    220            �           2606    33157 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public                 postgres    false    220            �           2606    33151 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public                 postgres    false    218                       2606    33321 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public                 postgres    false    240            !           2606    49597    factura factura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public                 postgres    false    260                       2606    49503    inventario inventario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public                 postgres    false    248                       2606    41331    marca marca_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public                 postgres    false    244                       2606    49553    metodo_pago metodo_pago_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.metodo_pago DROP CONSTRAINT metodo_pago_pkey;
       public                 postgres    false    254            �           2606    33308    permiso permiso_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public                 postgres    false    239                       2606    49529    personal personal_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_pkey;
       public                 postgres    false    252                       2606    49515    precio precios_precio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precios_precio_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.precio DROP CONSTRAINT precios_precio_pkey;
       public                 postgres    false    250                       2606    41339    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    246            �           2606    33213 1   usuarios_customuser usuarios_customuser_email_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.usuarios_customuser
    ADD CONSTRAINT usuarios_customuser_email_key UNIQUE (email);
 [   ALTER TABLE ONLY public.usuarios_customuser DROP CONSTRAINT usuarios_customuser_email_key;
       public                 postgres    false    228            �           2606    33228 Z   usuarios_customuser_groups usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq UNIQUE (customuser_id, group_id);
 �   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq;
       public                 postgres    false    230    230            �           2606    33219 :   usuarios_customuser_groups usuarios_customuser_groups_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_pkey;
       public                 postgres    false    230            �           2606    33211 ,   usuarios_customuser usuarios_customuser_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.usuarios_customuser
    ADD CONSTRAINT usuarios_customuser_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.usuarios_customuser DROP CONSTRAINT usuarios_customuser_pkey;
       public                 postgres    false    228            �           2606    33242 d   usuarios_customuser_user_permissions usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq UNIQUE (customuser_id, permission_id);
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq;
       public                 postgres    false    232    232            �           2606    33225 N   usuarios_customuser_user_permissions usuarios_customuser_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser_user_permissions_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser_user_permissions_pkey;
       public                 postgres    false    232            �           1259    33205    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public                 postgres    false    224            �           1259    33201 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public                 postgres    false    226            �           1259    33202 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public                 postgres    false    226            �           1259    33187 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public                 postgres    false    222            �           1259    33288 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public                 postgres    false    235                       1259    49571 "   carrito_compra_cliente_id_3724c4b8    INDEX     c   CREATE INDEX carrito_compra_cliente_id_3724c4b8 ON public.carrito_compra USING btree (cliente_id);
 6   DROP INDEX public.carrito_compra_cliente_id_3724c4b8;
       public                 postgres    false    256            �           1259    33302    cliente_usuario_id_ff892797    INDEX     U   CREATE INDEX cliente_usuario_id_ff892797 ON public.cliente USING btree (usuario_id);
 /   DROP INDEX public.cliente_usuario_id_ff892797;
       public                 postgres    false    237                       1259    49588 #   detalle_carrito_carrito_id_6d1f8b6b    INDEX     e   CREATE INDEX detalle_carrito_carrito_id_6d1f8b6b ON public.detalle_carrito USING btree (carrito_id);
 7   DROP INDEX public.detalle_carrito_carrito_id_6d1f8b6b;
       public                 postgres    false    258                       1259    49589 $   detalle_carrito_producto_id_ef50ac42    INDEX     g   CREATE INDEX detalle_carrito_producto_id_ef50ac42 ON public.detalle_carrito USING btree (producto_id);
 8   DROP INDEX public.detalle_carrito_producto_id_ef50ac42;
       public                 postgres    false    258            "           1259    49626 #   detalle_factura_factura_id_1d9c16d8    INDEX     e   CREATE INDEX detalle_factura_factura_id_1d9c16d8 ON public.detalle_factura USING btree (factura_id);
 7   DROP INDEX public.detalle_factura_factura_id_1d9c16d8;
       public                 postgres    false    262            %           1259    49627 $   detalle_factura_producto_id_a5e7ee3a    INDEX     g   CREATE INDEX detalle_factura_producto_id_a5e7ee3a ON public.detalle_factura USING btree (producto_id);
 8   DROP INDEX public.detalle_factura_producto_id_a5e7ee3a;
       public                 postgres    false    262            �           1259    33274 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public                 postgres    false    234            �           1259    33275 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public                 postgres    false    234                        1259    33323 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public                 postgres    false    240                       1259    33322 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public                 postgres    false    240                       1259    49608    factura_cliente_id_d6cd70fe    INDEX     U   CREATE INDEX factura_cliente_id_d6cd70fe ON public.factura USING btree (cliente_id);
 /   DROP INDEX public.factura_cliente_id_d6cd70fe;
       public                 postgres    false    260                       1259    49609    factura_metodo_id_87149544    INDEX     S   CREATE INDEX factura_metodo_id_87149544 ON public.factura USING btree (metodo_id);
 .   DROP INDEX public.factura_metodo_id_87149544;
       public                 postgres    false    260                       1259    49509    inventario_producto_id_61d8ae74    INDEX     ]   CREATE INDEX inventario_producto_id_61d8ae74 ON public.inventario USING btree (producto_id);
 3   DROP INDEX public.inventario_producto_id_61d8ae74;
       public                 postgres    false    248            �           1259    33314    permiso_usuario_id_352c28c2    INDEX     U   CREATE INDEX permiso_usuario_id_352c28c2 ON public.permiso USING btree (usuario_id);
 /   DROP INDEX public.permiso_usuario_id_352c28c2;
       public                 postgres    false    239                       1259    49535    personal_usuario_id_0f2b7609    INDEX     W   CREATE INDEX personal_usuario_id_0f2b7609 ON public.personal USING btree (usuario_id);
 0   DROP INDEX public.personal_usuario_id_0f2b7609;
       public                 postgres    false    252                       1259    49521 #   precios_precio_producto_id_96dabe0f    INDEX     ]   CREATE INDEX precios_precio_producto_id_96dabe0f ON public.precio USING btree (producto_id);
 7   DROP INDEX public.precios_precio_producto_id_96dabe0f;
       public                 postgres    false    250                       1259    41350    producto_categoria_id_67131168    INDEX     [   CREATE INDEX producto_categoria_id_67131168 ON public.producto USING btree (categoria_id);
 2   DROP INDEX public.producto_categoria_id_67131168;
       public                 postgres    false    246            	           1259    41351    producto_marca_id_2793ee53    INDEX     S   CREATE INDEX producto_marca_id_2793ee53 ON public.producto USING btree (marca_id);
 .   DROP INDEX public.producto_marca_id_2793ee53;
       public                 postgres    false    246            �           1259    33226 '   usuarios_customuser_email_9e9473e9_like    INDEX     |   CREATE INDEX usuarios_customuser_email_9e9473e9_like ON public.usuarios_customuser USING btree (email varchar_pattern_ops);
 ;   DROP INDEX public.usuarios_customuser_email_9e9473e9_like;
       public                 postgres    false    228            �           1259    33239 1   usuarios_customuser_groups_customuser_id_9e05d670    INDEX     �   CREATE INDEX usuarios_customuser_groups_customuser_id_9e05d670 ON public.usuarios_customuser_groups USING btree (customuser_id);
 E   DROP INDEX public.usuarios_customuser_groups_customuser_id_9e05d670;
       public                 postgres    false    230            �           1259    33240 ,   usuarios_customuser_groups_group_id_155d554c    INDEX     w   CREATE INDEX usuarios_customuser_groups_group_id_155d554c ON public.usuarios_customuser_groups USING btree (group_id);
 @   DROP INDEX public.usuarios_customuser_groups_group_id_155d554c;
       public                 postgres    false    230            �           1259    33253 ;   usuarios_customuser_user_permissions_customuser_id_c016378e    INDEX     �   CREATE INDEX usuarios_customuser_user_permissions_customuser_id_c016378e ON public.usuarios_customuser_user_permissions USING btree (customuser_id);
 O   DROP INDEX public.usuarios_customuser_user_permissions_customuser_id_c016378e;
       public                 postgres    false    232            �           1259    33254 ;   usuarios_customuser_user_permissions_permission_id_9a10b097    INDEX     �   CREATE INDEX usuarios_customuser_user_permissions_permission_id_9a10b097 ON public.usuarios_customuser_user_permissions USING btree (permission_id);
 O   DROP INDEX public.usuarios_customuser_user_permissions_permission_id_9a10b097;
       public                 postgres    false    232            >           2620    49670 )   usuarios_customuser trigger_crear_permiso    TRIGGER     �   CREATE TRIGGER trigger_crear_permiso AFTER INSERT ON public.usuarios_customuser FOR EACH ROW EXECUTE FUNCTION public.crear_permiso_al_crear_usuario();
 B   DROP TRIGGER trigger_crear_permiso ON public.usuarios_customuser;
       public               postgres    false    327    228            '           2606    33196 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public               postgres    false    226    222    4820            (           2606    33191 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public               postgres    false    226    4825    224            &           2606    33182 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public               postgres    false    4815    222    220            /           2606    33283 J   authtoken_token authtoken_token_user_id_35299eff_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_usuarios_customuser_id FOREIGN KEY (user_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_usuarios_customuser_id;
       public               postgres    false    4836    235    228            7           2606    49566 ?   carrito_compra carrito_compra_cliente_id_3724c4b8_fk_cliente_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito_compra
    ADD CONSTRAINT carrito_compra_cliente_id_3724c4b8_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.carrito_compra DROP CONSTRAINT carrito_compra_cliente_id_3724c4b8_fk_cliente_id;
       public               postgres    false    256    237    4859            0           2606    33297 =   cliente cliente_usuario_id_ff892797_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_usuario_id_ff892797_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_usuario_id_ff892797_fk_usuarios_customuser_id;
       public               postgres    false    237    228    4836            8           2606    49578 H   detalle_carrito detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id FOREIGN KEY (carrito_id) REFERENCES public.carrito_compra(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id;
       public               postgres    false    258    256    4889            9           2606    49583 C   detalle_carrito detalle_carrito_producto_id_ef50ac42_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_producto_id_ef50ac42_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_producto_id_ef50ac42_fk_producto_id;
       public               postgres    false    258    246    4875            <           2606    49616 A   detalle_factura detalle_factura_factura_id_1d9c16d8_fk_factura_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_factura_id_1d9c16d8_fk_factura_id FOREIGN KEY (factura_id) REFERENCES public.factura(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_factura_id_1d9c16d8_fk_factura_id;
       public               postgres    false    262    4897    260            =           2606    49621 C   detalle_factura detalle_factura_producto_id_a5e7ee3a_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_producto_id_a5e7ee3a_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_producto_id_a5e7ee3a_fk_producto_id;
       public               postgres    false    246    4875    262            -           2606    33264 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public               postgres    false    234    220    4815            .           2606    33269 L   django_admin_log django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id FOREIGN KEY (user_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id;
       public               postgres    false    234    228    4836            :           2606    49598 1   factura factura_cliente_id_d6cd70fe_fk_cliente_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_cliente_id_d6cd70fe_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_cliente_id_d6cd70fe_fk_cliente_id;
       public               postgres    false    260    237    4859            ;           2606    49603 4   factura factura_metodo_id_87149544_fk_metodo_pago_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_metodo_id_87149544_fk_metodo_pago_id FOREIGN KEY (metodo_id) REFERENCES public.metodo_pago(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_metodo_id_87149544_fk_metodo_pago_id;
       public               postgres    false    254    260    4886            4           2606    49504 9   inventario inventario_producto_id_61d8ae74_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_producto_id_61d8ae74_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_producto_id_61d8ae74_fk_producto_id;
       public               postgres    false    4875    248    246            1           2606    33309 =   permiso permiso_usuario_id_352c28c2_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_usuario_id_352c28c2_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_usuario_id_352c28c2_fk_usuarios_customuser_id;
       public               postgres    false    239    228    4836            6           2606    49530 ?   personal personal_usuario_id_0f2b7609_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_usuario_id_0f2b7609_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_usuario_id_0f2b7609_fk_usuarios_customuser_id;
       public               postgres    false    228    252    4836            5           2606    49516 9   precio precios_precio_producto_id_96dabe0f_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precios_precio_producto_id_96dabe0f_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.precio DROP CONSTRAINT precios_precio_producto_id_96dabe0f_fk_producto_id;
       public               postgres    false    246    4875    250            2           2606    41340 7   producto producto_categoria_id_67131168_fk_categoria_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_67131168_fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_categoria_id_67131168_fk_categoria_id;
       public               postgres    false    246    4869    242            3           2606    41345 /   producto producto_marca_id_2793ee53_fk_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_marca_id_2793ee53_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_marca_id_2793ee53_fk_marca_id;
       public               postgres    false    244    246    4871            )           2606    33229 S   usuarios_customuser_groups usuarios_customuser__customuser_id_9e05d670_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser__customuser_id_9e05d670_fk_usuarios_ FOREIGN KEY (customuser_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser__customuser_id_9e05d670_fk_usuarios_;
       public               postgres    false    228    4836    230            +           2606    33243 ]   usuarios_customuser_user_permissions usuarios_customuser__customuser_id_c016378e_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser__customuser_id_c016378e_fk_usuarios_ FOREIGN KEY (customuser_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser__customuser_id_c016378e_fk_usuarios_;
       public               postgres    false    232    228    4836            ,           2606    33248 ]   usuarios_customuser_user_permissions usuarios_customuser__permission_id_9a10b097_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser__permission_id_9a10b097_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser__permission_id_9a10b097_fk_auth_perm;
       public               postgres    false    232    4820    222            *           2606    33234 X   usuarios_customuser_groups usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id;
       public               postgres    false    4825    224    230            �      x������ � �      �      x������ � �      �   5  x�m�M��0���)r�"�_�u��e�������
lgڹ}e����"�#�������a�^ww;�i���Q����ᨫ�\~��
*�2X�j�v�`,e�	��h�
l+d�eeO;?�eݤ� -t��H�=�>��@`�,Q�A#pgVy���� 0�����s�E�AM	!9�TYJ�
z\����V��a�zZ�!T�*�4(��I��[�V�$Q�]Z�A�`O�z���6��6=���d�3F�V��U����kY���Z쬺hc�l]�8H4��Ȅ���@C0$2���c'u
:����D(�sG��BBH!���\(賂����up�����^K/�W��zD��>�i��o0�t-C�L�����g,�Y�p�����S��ܢ�b�k�-���[,bb�m�y��")V�'�c��"l�`����<�� t#g��[f��#���,�;�����i��#�;��� )#F�;3��x&�z�'���uY�2qߧ�n��#�n�I1�H��d��x�L���O?z�<z,~rE�" %�H�H�t"q�lЊ$�b��j����[�F��H�40���$0C�E�`F7we���p�]Ud���Q"�"�L�و�2�2JL�]��}��ͿD��T�J��Q(�l��(R<�CR�1+�a���:����9~��cB���t��f���F��svm�yd[��g�DKH��]�:���甉*SU�D�����m"wo���6����FeKN�Ჾ�AU��DG}Y��3'�iM\y*�c��|fԠ��P��z���V��ڤ����}�&�9������w��      �   K   x����  ��T�t�ģ�|���KH��~&�)���#L�w?7-(�e2�F��?�6�Fm&k��[� >5�p      �   -   x�3�445�30�4202�50�54�H�K�L�+I�4����� �Q�      �   8   x�34�tN̩JL��24��/HTpI-�/*�,K�24�tLNN-�/��/����� cR:      �   i   x�3�t*J�L�SNL���W�,�,.HUp,JN�4361�437�tJ,*����S��/JO�LL.�,����2A5�H��9����)`L)6��b�)6��bb���� �|      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�]�]n� ����TK��=@��Eh�02f�ܾ$�U_�7f<���0��ʂP�/HN���s���3	����ZuI.�x�춉�OPr!�\�%+����yT�v�/�;I�g�+����u����i5���M,���Hl�m�j�X��Ӎ���{M�b4��r�o9�[3G�����)��N7���h.��ܫ各��W��<�[w4�$;�$�E�W�s�5�o��=q�^      �   �  x���mn�8�;���ԗ�S����1ֶ2�]Lo�����N�8����P$_RP�a��8�?U�1���͝�+d(_�x��Az�#S�0���K�6�!�{{���_����k:�x����� kd*)Ī@���G{�q覩c�h���~<ӿ���QrE�+j�����R��E�qKI�8�2O��D��􊐷��M��ù�Ė~�0F(�!�
Qԍ�K�v�>�T��F�fE��9�]ߝ��d��d}�!��O�;��YQJXll��+��R�B��d�*�.J�yF�'
�u�a���p#J�`5.�].T"o/1���q�F}D-K�`�2�mVo]ܛ���s�Z���.�d.�YE�=ݸCRP�4��I����O	���#�iRA�$Y̵s��ޝm�+t��(s��E����;2\+y��{��#���׏4�2�	��m����!5��S#�K?�� m�M	�XY�ȫ�切{��S��N�߫xmt	&�b�=>� Λ՝�I4-�	A]M�:Kϣ�t��Z�s������}4Z��m4��b��H�NYz�JrVQ�NK;o��VG��~�n|�|7���ᬑ�Du�9RD�>Q	l]��UQ��oU��������DH�Ӏ(aEj�F
�J�K�܄�E&����~�s��D�đ�RE]����qlx}Tpu���Ϯ���{.�,�$ٔ�����%�m�"�4<])Jd�p���!ƺ��t�g��<�� ���      �      x������ � �      �   -   x�34�4202�50�54�450�30�HLOLI�4�4����� ���      �   0   x�34�45�30�4aK.C#NCS������$��r��qqq ��      �   *   x�34����N�,�24�tL�LI,�M8Js9Ӹb���� ���      �      x�3�tMKM.�,������ '�"      �   I   x�3�,�L��?.Sd�2�̀ȓ9�F`V�x�P6D�E�9\�Ѐ��γ䲄�͹�81z\\\ h"      �   R   x�3�tN,��/�8��(���������ȐӱLO!85�4/%�(3Q��Ԍ����@��L�Д3�� ��,�8��3Ə+F��� :Y�      �   E   x�E��	�@Dѳ��8�$�K��#Yذ�����HFҢ-��E���t��u��ZUqI��?pX}�>��/��      �   e   x�=�1
�0�99EO ���(�8��򑂁hE�x|;��{��	���2����nIrG�YǮ��\!��*TR�K�;K>.�(��xf�;����s��/n� �      �   +  x�u�1o�@ ����l&
����@+�*j��1i��;�_�֡q�����	���~8��Fx4~e�>�}��z��K>�!�(���k�{&�#�3��t}�C�ЖL��3����A7ϭ�y�(�Y��(�q: Z�[�{�*�^�*H �li�]Ka�D�TU\8�Тɬ5��.�$���ؒB�֩l9���MR�:4�p������rl�5!H0����@�4�ݯ d�	a���ĭV���d2�v�*%��E��ɮ�4E�Ht�kc_����'��Me�B̂GB����8���~�      �      x������ � �      �      x������ � �     