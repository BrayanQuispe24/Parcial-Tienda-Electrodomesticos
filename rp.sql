PGDMP  (    6                }            DB_tienda_parcial_api    17.4    17.4    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            +           1262    33143    DB_tienda_parcial_api    DATABASE     }   CREATE DATABASE "DB_tienda_parcial_api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';
 '   DROP DATABASE "DB_tienda_parcial_api";
                     postgres    false            Q           1255    66434 0   actualizar_cantidad_inventario(integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.actualizar_cantidad_inventario(IN p_producto_id integer, IN p_nueva_cantidad integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Verificar si existe el producto en inventario
    IF EXISTS (SELECT 1 FROM inventario WHERE producto_id = p_producto_id) THEN
        -- Actualizar la cantidad
        UPDATE inventario
        SET cantidad = p_nueva_cantidad
        WHERE producto_id = p_producto_id;
    ELSE
        RAISE EXCEPTION 'No existe inventario para el producto con ID %', p_producto_id;
    END IF;
END;
$$;
 m   DROP PROCEDURE public.actualizar_cantidad_inventario(IN p_producto_id integer, IN p_nueva_cantidad integer);
       public               postgres    false            8           1255    49637 F   actualizar_carrito(integer, numeric, date, character varying, integer) 	   PROCEDURE     e  CREATE PROCEDURE public.actualizar_carrito(IN p_id integer, IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer)
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
       public               postgres    false                       1255    41353 0   actualizar_categoria(integer, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_categoria(IN p_id integer, IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE categoria
    SET nombre = p_nombre
    WHERE id = p_id;
END;
$$;
 \   DROP PROCEDURE public.actualizar_categoria(IN p_id integer, IN p_nombre character varying);
       public               postgres    false                       1255    41308 �   actualizar_cliente(integer, character varying, character varying, character varying, character varying, character varying, bigint) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_cliente(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_estado character varying, IN p_usuario_id bigint)
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
       public               postgres    false            F           1255    49662 P   actualizar_detalle_carrito(integer, integer, numeric, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_detalle_carrito(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer)
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
       public               postgres    false            4           1255    49633 G   actualizar_detalle_factura(integer, integer, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_detalle_factura(IN p_id integer, IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer)
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
       public               postgres    false            1           1255    49629 O   actualizar_factura(integer, date, numeric, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_factura(IN p_id integer, IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer)
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
       public               postgres    false                       1255    49541 9   actualizar_inventario(integer, numeric, integer, integer) 	   PROCEDURE     :  CREATE PROCEDURE public.actualizar_inventario(IN p_id integer, IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer)
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
       public               postgres    false                       1255    41360 5   actualizar_marca(integer, character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_marca(IN p_id integer, IN p_nombre character varying, IN p_estado boolean)
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
       public               postgres    false            '           1255    49555 2   actualizar_metodo_pago(integer, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.actualizar_metodo_pago(IN p_id integer, IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE metodo_pago
    SET nombre = p_nombre
    WHERE id = p_id;
END;
$$;
 ^   DROP PROCEDURE public.actualizar_metodo_pago(IN p_id integer, IN p_nombre character varying);
       public               postgres    false                       1255    41319 ?   actualizar_permiso(boolean, boolean, boolean, boolean, integer) 	   PROCEDURE     W  CREATE PROCEDURE public.actualizar_permiso(IN p_crear boolean, IN p_eliminar boolean, IN p_actualizar boolean, IN p_ver boolean, IN p_usuario_id integer)
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
       public               postgres    false                       1255    49537 �   actualizar_personal(integer, character varying, character varying, character varying, character varying, date, character varying, integer) 	   PROCEDURE     I  CREATE PROCEDURE public.actualizar_personal(IN p_id integer, IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_usuario_id integer)
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
       public               postgres    false            -           1255    49545 8   actualizar_precio(integer, numeric, date, date, integer) 	   PROCEDURE     z  CREATE PROCEDURE public.actualizar_precio(IN p_id integer, IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer)
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
       public               postgres    false            @           1255    49649 T   actualizar_producto(integer, character varying, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_producto(IN producto_id integer, IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer)
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
       public               postgres    false            T           1255    58251 Q   actualizar_producto_por_nombre(text, text, numeric, text, text, integer, numeric)    FUNCTION     �  CREATE FUNCTION public.actualizar_producto_por_nombre(nombre_producto text, nueva_descripcion text, nuevo_costo numeric, nueva_marca text, nueva_categoria text, nueva_cantidad integer, nuevo_precio numeric) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_producto_id INT;
    v_marca_id INT;
    v_categoria_id INT;
    v_existente INT;
BEGIN
    -- Obtener el ID del producto por nombre
    SELECT id INTO v_producto_id
    FROM producto
    WHERE descripcion = nombre_producto
    LIMIT 1;

    IF NOT FOUND THEN
        RETURN 'Producto no encontrado.';
    END IF;

    -- Obtener el ID de la marca
    SELECT id INTO v_marca_id FROM marca WHERE nombre = nueva_marca;
    IF NOT FOUND THEN
        RETURN 'Marca no encontrada.';
    END IF;

    -- Obtener el ID de la categoría
    SELECT id INTO v_categoria_id FROM categoria WHERE nombre = nueva_categoria;
    IF NOT FOUND THEN
        RETURN 'Categoría no encontrada.';
    END IF;

    -- Actualizar tabla producto
    UPDATE producto
    SET descripcion = nueva_descripcion,
        marca_id = v_marca_id,
        categoria_id = v_categoria_id
    WHERE id = v_producto_id;

    -- Actualizar inventario
    UPDATE inventario
    SET costo = nuevo_costo,
        cantidad = nueva_cantidad
    WHERE producto_id = v_producto_id;

    -- Verificar si ya existe un precio vigente
    SELECT COUNT(*) INTO v_existente
    FROM precio
    WHERE producto_id = v_producto_id
      AND CURRENT_DATE BETWEEN fecha_inicio AND fecha_final;

    IF v_existente > 0 THEN
        -- Actualizar precio vigente
        UPDATE precio
        SET precio = nuevo_precio
        WHERE producto_id = v_producto_id
          AND CURRENT_DATE BETWEEN fecha_inicio AND fecha_final;
    ELSE
        -- Insertar nuevo precio vigente
        INSERT INTO precio (producto_id, precio, fecha_inicio, fecha_final)
        VALUES (v_producto_id, nuevo_precio, CURRENT_DATE, CURRENT_DATE + INTERVAL '1 year');
    END IF;

    RETURN 'Producto actualizado correctamente.';
END;
$$;
 �   DROP FUNCTION public.actualizar_producto_por_nombre(nombre_producto text, nueva_descripcion text, nuevo_costo numeric, nueva_marca text, nueva_categoria text, nueva_cantidad integer, nuevo_precio numeric);
       public               postgres    false            ]           1255    74660 5   agregar_producto_a_factura(integer, integer, integer)    FUNCTION     G  CREATE FUNCTION public.agregar_producto_a_factura(p_factura_id integer, p_producto_id integer, p_cantidad integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_precio_unitario NUMERIC;
    v_subtotal NUMERIC;
BEGIN
    -- Obtener precio actual válido
    SELECT precio INTO v_precio_unitario
    FROM precio
    WHERE producto_id = p_producto_id
      AND CURRENT_DATE BETWEEN fecha_inicio AND fecha_final
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF v_precio_unitario IS NULL THEN
        RAISE EXCEPTION 'No hay precio válido para el producto %', p_producto_id;
    END IF;

    -- Verificar stock
    IF NOT existe_stock_suficiente(p_producto_id, p_cantidad) THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto %', p_producto_id;
    END IF;

    -- Calcular subtotal
    v_subtotal := p_cantidad * v_precio_unitario;

    -- Insertar detalle
    INSERT INTO detalle_factura (cantidad, precio_unitario, factura_id, producto_id)
    VALUES (p_cantidad, v_precio_unitario, p_factura_id, p_producto_id);

    -- Descontar inventario
    UPDATE inventario
    SET cantidad = cantidad - p_cantidad
    WHERE producto_id = p_producto_id;

    -- Actualizar total en factura
    UPDATE factura
    SET total = total + v_subtotal
    WHERE id = p_factura_id;

    -- Retornar subtotal
    RETURN v_subtotal;
END;
$$;
 r   DROP FUNCTION public.agregar_producto_a_factura(p_factura_id integer, p_producto_id integer, p_cantidad integer);
       public               postgres    false            ^           1255    74661 %   cambiar_estado_factura(integer, text)    FUNCTION     �  CREATE FUNCTION public.cambiar_estado_factura(p_factura_id integer, p_nuevo_estado text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_estado_actual TEXT;
BEGIN
    -- Validar estado permitido
    IF p_nuevo_estado NOT IN ('PENDIENTE', 'PAGADO', 'ANULADO') THEN
        RAISE EXCEPTION 'Estado no válido: %. Estados permitidos: PENDIENTE, PAGADO, ANULADO', p_nuevo_estado;
    END IF;

    -- Validar existencia de factura y obtener estado actual
    SELECT estado INTO v_estado_actual
    FROM factura
    WHERE id = p_factura_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No existe factura con id %', p_factura_id;
    END IF;

    -- Si el nuevo estado es ANULADO y no está ya anulada, restaurar stock
    IF p_nuevo_estado = 'ANULADO' AND v_estado_actual != 'ANULADO' THEN
        -- Restaurar stock para cada producto de la factura
        UPDATE inventario i
        SET cantidad = cantidad + d.cantidad
        FROM detalle_factura d
        WHERE d.factura_id = p_factura_id
        AND i.producto_id = d.producto_id;
    END IF;

    -- Actualizar estado
    UPDATE factura
    SET estado = p_nuevo_estado
    WHERE id = p_factura_id;
END;
$$;
 X   DROP FUNCTION public.cambiar_estado_factura(p_factura_id integer, p_nuevo_estado text);
       public               postgres    false            U           1255    58252 &   cambiar_estado_producto(integer, text)    FUNCTION     �  CREATE FUNCTION public.cambiar_estado_producto(producto_id integer, nuevo_estado text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE producto
    SET estado = nuevo_estado
    WHERE id = producto_id;

    IF FOUND THEN
        RETURN 'Estado del producto actualizado correctamente.';
    ELSE
        RETURN 'No se encontró el producto con ese ID.';
    END IF;
END;
$$;
 V   DROP FUNCTION public.cambiar_estado_producto(producto_id integer, nuevo_estado text);
       public               postgres    false            7           1255    49636 8   crear_carrito(numeric, date, character varying, integer) 	   PROCEDURE     *  CREATE PROCEDURE public.crear_carrito(IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO carrito_compra (total, fecha, estado, cliente_id)
    VALUES (p_total, p_fecha, p_estado, p_cliente_id);
END;
$$;
 �   DROP PROCEDURE public.crear_carrito(IN p_total numeric, IN p_fecha date, IN p_estado character varying, IN p_cliente_id integer);
       public               postgres    false                       1255    41352 "   crear_categoria(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_categoria(IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO categoria(nombre)
    VALUES (p_nombre);
END;
$$;
 F   DROP PROCEDURE public.crear_categoria(IN p_nombre character varying);
       public               postgres    false            E           1255    49661 B   crear_detalle_carrito(integer, numeric, numeric, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.crear_detalle_carrito(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO detalle_carrito (cantidad, precio_unitario, "subTotal", carrito_id, producto_id)
    VALUES (p_cantidad, p_precio_unitario, p_subtotal, p_carrito_id, p_producto_id);
END;
$$;
 �   DROP PROCEDURE public.crear_detalle_carrito(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_subtotal numeric, IN p_carrito_id integer, IN p_producto_id integer);
       public               postgres    false            3           1255    49632 9   crear_detalle_factura(integer, numeric, integer, integer) 	   PROCEDURE     b  CREATE PROCEDURE public.crear_detalle_factura(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO detalle_factura (cantidad, precio_unitario, producto_id, factura_id)
    VALUES (p_cantidad, p_precio_unitario, p_producto_id, p_factura_id);
END;
$$;
 �   DROP PROCEDURE public.crear_detalle_factura(IN p_cantidad integer, IN p_precio_unitario numeric, IN p_producto_id integer, IN p_factura_id integer);
       public               postgres    false            [           1255    74658    crear_factura(integer, integer)    FUNCTION     y  CREATE FUNCTION public.crear_factura(p_cliente_id integer, p_metodo_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_factura_id INTEGER;
BEGIN
    INSERT INTO factura (fecha, total, estado, cliente_id, metodo_id)
    VALUES (CURRENT_DATE, 0, 'PENDIENTE', p_cliente_id, p_metodo_id)
    RETURNING id INTO v_factura_id;

    RETURN v_factura_id;
END;
$$;
 O   DROP FUNCTION public.crear_factura(p_cliente_id integer, p_metodo_id integer);
       public               postgres    false            0           1255    49628 A   crear_factura(date, numeric, character varying, integer, integer) 	   PROCEDURE     S  CREATE PROCEDURE public.crear_factura(IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO factura (fecha, total, estado, metodo_id, cliente_id)
    VALUES (p_fecha, p_total, p_estado, p_metodo_id, p_cliente_id);
END;
$$;
 �   DROP PROCEDURE public.crear_factura(IN p_fecha date, IN p_total numeric, IN p_estado character varying, IN p_metodo_id integer, IN p_cliente_id integer);
       public               postgres    false            )           1255    49540 +   crear_inventario(numeric, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.crear_inventario(IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO inventario(costo, cantidad, producto_id)
    VALUES (p_costo, p_cantidad, p_producto_id);
END;
$$;
 m   DROP PROCEDURE public.crear_inventario(IN p_costo numeric, IN p_cantidad integer, IN p_producto_id integer);
       public               postgres    false                       1255    41359 '   crear_marca(character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_marca(IN p_nombre character varying, IN p_estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO marca(nombre, estado)
    VALUES (p_nombre, p_estado);
END;
$$;
 W   DROP PROCEDURE public.crear_marca(IN p_nombre character varying, IN p_estado boolean);
       public               postgres    false            &           1255    49554 $   crear_metodo_pago(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.crear_metodo_pago(IN p_nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO metodo_pago(nombre)
    VALUES (p_nombre);
END;
$$;
 H   DROP PROCEDURE public.crear_metodo_pago(IN p_nombre character varying);
       public               postgres    false            I           1255    49669     crear_permiso_al_crear_usuario()    FUNCTION     �   CREATE FUNCTION public.crear_permiso_al_crear_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO permiso (crear, eliminar, actualizar, ver, usuario_id)
    VALUES (TRUE, TRUE, TRUE, TRUE, NEW.id);
    RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.crear_permiso_al_crear_usuario();
       public               postgres    false            P           1255    66433 �   crear_personal(character varying, character varying, character varying, character varying, date, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.crear_personal(IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_correo_electronico character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_usuario_id BIGINT;
BEGIN
    -- Obtener el usuario_id a partir del correo electrónico
    SELECT id INTO v_usuario_id
    FROM public.usuarios_customuser
    WHERE email = p_correo_electronico;

    -- Verificar si el usuario existe
    IF v_usuario_id IS NULL THEN
        RAISE EXCEPTION 'Correo electrónico no encontrado';
    END IF;

    -- Insertar el nuevo personal
    INSERT INTO public.personal (nombre, apellido, telefono, direccion, fecha_nacimiento, rol, usuario_id)
    VALUES (p_nombre, p_apellido, p_telefono, p_direccion, p_fecha_nacimiento, p_rol, v_usuario_id);

    -- Confirmar éxito
    RAISE NOTICE 'Personal creado con éxito';
END;
$$;
   DROP PROCEDURE public.crear_personal(IN p_nombre character varying, IN p_apellido character varying, IN p_telefono character varying, IN p_direccion character varying, IN p_fecha_nacimiento date, IN p_rol character varying, IN p_correo_electronico character varying);
       public               postgres    false            ,           1255    49544 *   crear_precio(numeric, date, date, integer) 	   PROCEDURE     =  CREATE PROCEDURE public.crear_precio(IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO precio(precio, fecha_inicio, fecha_final, producto_id)
    VALUES (p_precio, p_fecha_inicio, p_fecha_final, p_producto_id);
END;
$$;
 �   DROP PROCEDURE public.crear_precio(IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date, IN p_producto_id integer);
       public               postgres    false            ?           1255    49648 F   crear_producto(character varying, character varying, integer, integer) 	   PROCEDURE     s  CREATE PROCEDURE public.crear_producto(IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO producto (descripcion, estado, marca_id, categoria_id)
    VALUES (descripcion_param, estado_param, marca_id_param, categoria_id_param);
END;
$$;
 �   DROP PROCEDURE public.crear_producto(IN descripcion_param character varying, IN estado_param character varying, IN marca_id_param integer, IN categoria_id_param integer);
       public               postgres    false            L           1255    58244 �   crear_producto_con_inventario_y_precio(character varying, character varying, integer, integer, numeric, integer, numeric, date, date) 	   PROCEDURE     @  CREATE PROCEDURE public.crear_producto_con_inventario_y_precio(IN p_descripcion character varying, IN p_estado character varying, IN p_categoria_id integer, IN p_marca_id integer, IN p_costo numeric, IN p_cantidad integer, IN p_precio numeric, IN p_fecha_inicio date DEFAULT CURRENT_DATE, IN p_fecha_final date DEFAULT CURRENT_DATE)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_producto_id INTEGER;
BEGIN
    -- Insertar en la tabla producto
    INSERT INTO public.producto (descripcion, estado, categoria_id, marca_id)
    VALUES (p_descripcion, p_estado, p_categoria_id, p_marca_id)
    RETURNING id INTO v_producto_id;

    -- Insertar en inventario
    INSERT INTO public.inventario (costo, cantidad, producto_id)
    VALUES (p_costo, p_cantidad, v_producto_id);

    -- Insertar en precio (usa CURRENT_DATE si los parámetros vienen nulos)
    INSERT INTO public.precio (precio, fecha_inicio, fecha_final, producto_id)
    VALUES (
        p_precio,
        COALESCE(p_fecha_inicio, CURRENT_DATE),
        COALESCE(p_fecha_final, CURRENT_DATE),
        v_producto_id
    );
END;
$$;
 "  DROP PROCEDURE public.crear_producto_con_inventario_y_precio(IN p_descripcion character varying, IN p_estado character varying, IN p_categoria_id integer, IN p_marca_id integer, IN p_costo numeric, IN p_cantidad integer, IN p_precio numeric, IN p_fecha_inicio date, IN p_fecha_final date);
       public               postgres    false            \           1255    74659 )   existe_stock_suficiente(integer, integer)    FUNCTION     I  CREATE FUNCTION public.existe_stock_suficiente(p_producto_id integer, p_cantidad integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_stock_actual INTEGER;
BEGIN
    SELECT cantidad INTO v_stock_actual
    FROM inventario
    WHERE producto_id = p_producto_id;

    RETURN v_stock_actual >= p_cantidad;
END;
$$;
 Y   DROP FUNCTION public.existe_stock_suficiente(p_producto_id integer, p_cantidad integer);
       public               postgres    false            Z           1255    66842 +   insertar_imagen(character varying, integer)    FUNCTION     �   CREATE FUNCTION public.insertar_imagen(p_url character varying, p_producto_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.imagenes (url, producto_id)
    VALUES (p_url, p_producto_id);
END;
$$;
 V   DROP FUNCTION public.insertar_imagen(p_url character varying, p_producto_id integer);
       public               postgres    false            J           1255    58242 j   insertar_producto_con_inventario(character varying, character varying, integer, integer, numeric, integer)    FUNCTION     �  CREATE FUNCTION public.insertar_producto_con_inventario(p_descripcion character varying, p_estado character varying, p_categoria_id integer, p_marca_id integer, p_costo numeric, p_cantidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_producto_id INTEGER;
BEGIN
    -- Insertar en la tabla producto
    INSERT INTO public.producto(descripcion, estado, categoria_id, marca_id)
    VALUES (p_descripcion, p_estado, p_categoria_id, p_marca_id)
    RETURNING id INTO v_producto_id;

    -- Insertar en la tabla inventario con el ID del producto recién insertado
    INSERT INTO public.inventario(costo, cantidad, producto_id)
    VALUES (p_costo, p_cantidad, v_producto_id);
END;
$$;
 �   DROP FUNCTION public.insertar_producto_con_inventario(p_descripcion character varying, p_estado character varying, p_categoria_id integer, p_marca_id integer, p_costo numeric, p_cantidad integer);
       public               postgres    false            :           1255    49639    obtener_carrito_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_carrito_id(p_id integer) RETURNS TABLE(id integer, total numeric, fecha date, estado character varying, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM carrito_compra cp WHERE cp.id = p_id;
END;
$$;
 7   DROP FUNCTION public.obtener_carrito_id(p_id integer);
       public               postgres    false            9           1255    49638    obtener_carritos()    FUNCTION     �   CREATE FUNCTION public.obtener_carritos() RETURNS TABLE(id integer, total numeric, fecha date, estado character varying, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM carrito_compra;
END;
$$;
 )   DROP FUNCTION public.obtener_carritos();
       public               postgres    false                       1255    41358    obtener_categoria(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_categoria(p_id integer) RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.nombre FROM categoria c
    WHERE c.id = p_id;
END;
$$;
 6   DROP FUNCTION public.obtener_categoria(p_id integer);
       public               postgres    false                       1255    41356    obtener_categorias()    FUNCTION     �   CREATE FUNCTION public.obtener_categorias() RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.nombre FROM categoria c;
END;
$$;
 +   DROP FUNCTION public.obtener_categorias();
       public               postgres    false            =           1255    49642 #   obtener_detalle_carrito_id(integer)    FUNCTION     4  CREATE FUNCTION public.obtener_detalle_carrito_id(p_id integer) RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, subtotal numeric, carrito_id integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_carrito dc WHERE dc.id = p_id;
END;
$$;
 ?   DROP FUNCTION public.obtener_detalle_carrito_id(p_id integer);
       public               postgres    false            6           1255    49635 #   obtener_detalle_factura_id(integer)    FUNCTION        CREATE FUNCTION public.obtener_detalle_factura_id(p_id integer) RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, producto_id integer, factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_factura f WHERE f.id = p_id;
END;
$$;
 ?   DROP FUNCTION public.obtener_detalle_factura_id(p_id integer);
       public               postgres    false            <           1255    49640    obtener_detalles_carrito()    FUNCTION       CREATE FUNCTION public.obtener_detalles_carrito() RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, subtotal numeric, carrito_id integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_carrito;
END;
$$;
 1   DROP FUNCTION public.obtener_detalles_carrito();
       public               postgres    false            5           1255    49634    obtener_detalles_factura()    FUNCTION     �   CREATE FUNCTION public.obtener_detalles_factura() RETURNS TABLE(id integer, cantidad integer, precio_unitario numeric, producto_id integer, factura_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM detalle_factura;
END;
$$;
 1   DROP FUNCTION public.obtener_detalles_factura();
       public               postgres    false            O           1255    74669 !   obtener_detalles_factura(integer)    FUNCTION     �  CREATE FUNCTION public.obtener_detalles_factura(p_factura_id integer) RETURNS TABLE(nombre_cliente text, factura_id integer, fecha date, total numeric, producto text, cantidad integer, precio_unitario numeric, subtotal numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        (c.nombre || ' ' || c.apellido)::TEXT AS nombre_cliente,
        f.id AS factura_id,
        f.fecha,
        f.total,
        p.descripcion::TEXT AS producto,
        df.cantidad,
        df.precio_unitario,
        (df.cantidad * df.precio_unitario) AS subtotal
    FROM factura f
    JOIN cliente c ON f.cliente_id = c.id
    JOIN detalle_factura df ON f.id = df.factura_id
    JOIN producto p ON df.producto_id = p.id
    WHERE f.id = p_factura_id;
END;
$$;
 E   DROP FUNCTION public.obtener_detalles_factura(p_factura_id integer);
       public               postgres    false            W           1255    58254    obtener_detalles_producto()    FUNCTION       CREATE FUNCTION public.obtener_detalles_producto() RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric, estado text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0),
        p.estado::TEXT
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
       public               postgres    false            M           1255    58255 )   obtener_detalles_producto_categoria(text)    FUNCTION     Z  CREATE FUNCTION public.obtener_detalles_producto_categoria(nombre_categoria text) RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric, estado text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0),
        p.estado::TEXT
    FROM producto p
    LEFT JOIN inventario i ON i.producto_id = p.id
    LEFT JOIN marca m ON m.id = p.marca_id
    LEFT JOIN categoria c ON c.id = p.categoria_id
    LEFT JOIN precio pr ON pr.producto_id = p.id
        AND pr.fecha_inicio <= CURRENT_DATE
        AND pr.fecha_final >= CURRENT_DATE
    WHERE c.nombre = nombre_categoria
    ORDER BY p.id;
END;
$$;
 Q   DROP FUNCTION public.obtener_detalles_producto_categoria(nombre_categoria text);
       public               postgres    false            K           1255    58256 %   obtener_detalles_producto_marca(text)    FUNCTION     N  CREATE FUNCTION public.obtener_detalles_producto_marca(nombre_marca text) RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric, estado text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0),
        p.estado::TEXT
    FROM producto p
    LEFT JOIN inventario i ON i.producto_id = p.id
    LEFT JOIN marca m ON m.id = p.marca_id
    LEFT JOIN categoria c ON c.id = p.categoria_id
    LEFT JOIN precio pr ON pr.producto_id = p.id
        AND pr.fecha_inicio <= CURRENT_DATE
        AND pr.fecha_final >= CURRENT_DATE
    WHERE m.nombre = nombre_marca
    ORDER BY p.id;
END;
$$;
 I   DROP FUNCTION public.obtener_detalles_producto_marca(nombre_marca text);
       public               postgres    false            N           1255    58257 &   obtener_detalles_producto_nombre(text)    FUNCTION     f  CREATE FUNCTION public.obtener_detalles_producto_nombre(nombre_producto text) RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric, estado text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0),
        p.estado::TEXT
    FROM producto p
    LEFT JOIN inventario i ON i.producto_id = p.id
    LEFT JOIN marca m ON m.id = p.marca_id
    LEFT JOIN categoria c ON c.id = p.categoria_id
    LEFT JOIN precio pr ON pr.producto_id = p.id
        AND pr.fecha_inicio <= CURRENT_DATE
        AND pr.fecha_final >= CURRENT_DATE
    WHERE p.descripcion = nombre_producto
    ORDER BY p.id
    LIMIT 1;
END;
$$;
 M   DROP FUNCTION public.obtener_detalles_producto_nombre(nombre_producto text);
       public               postgres    false            V           1255    58253    obtener_detalles_productov2()    FUNCTION       CREATE FUNCTION public.obtener_detalles_productov2() RETURNS TABLE(id integer, descripcion text, costo numeric, marca text, categoria text, cantidad integer, precio numeric, estado text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.descripcion::TEXT,
        COALESCE(i.costo, 0),
        m.nombre::TEXT,
        c.nombre::TEXT,
        COALESCE(i.cantidad, 0),
        COALESCE(pr.precio, 0),
        p.estado::TEXT
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
 4   DROP FUNCTION public.obtener_detalles_productov2();
       public               postgres    false            S           1255    74667 %   obtener_factura_con_detalles(integer)    FUNCTION     o  CREATE FUNCTION public.obtener_factura_con_detalles(p_factura_id integer) RETURNS TABLE(factura_id integer, fecha date, total numeric, estado character varying, cliente_id integer, metodo_id integer, detalle_id integer, producto_id integer, nombre_producto character varying, cantidad integer, precio_unitario numeric, subtotal numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        f.id AS factura_id,
        f.fecha,
        f.total,
        f.estado,
        f.cliente_id,
        f.metodo_id,
        df.id AS detalle_id,
        df.producto_id,
        p.descripcion AS nombre_producto,
        df.cantidad,
        df.precio_unitario,
        df.cantidad * df.precio_unitario AS subtotal
    FROM factura f
    JOIN detalle_factura df ON f.id = df.factura_id
    JOIN producto p ON df.producto_id = p.id
    WHERE f.id = p_factura_id;
END;
$$;
 I   DROP FUNCTION public.obtener_factura_con_detalles(p_factura_id integer);
       public               postgres    false            2           1255    49631    obtener_factura_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_factura_id(p_id integer) RETURNS TABLE(id integer, fecha date, total numeric, estado character varying, metodo_id integer, cliente_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM factura f WHERE f.id = p_id;
END;
$$;
 7   DROP FUNCTION public.obtener_factura_id(p_id integer);
       public               postgres    false            R           1255    66827    obtener_facturas()    FUNCTION     �   CREATE FUNCTION public.obtener_facturas() RETURNS TABLE(id integer, fecha date, total numeric, estado character varying, cliente_id integer, metodo_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM factura;
END;
$$;
 )   DROP FUNCTION public.obtener_facturas();
       public               postgres    false            _           1255    74664 2   obtener_facturas_con_detalles_por_cliente(integer)    FUNCTION     \  CREATE FUNCTION public.obtener_facturas_con_detalles_por_cliente(p_cliente_id integer) RETURNS TABLE(factura_id integer, fecha date, total numeric, estado character varying, metodo_id integer, detalle_id integer, producto_id integer, nombre_producto character varying, cantidad integer, precio_unitario numeric, subtotal numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        f.id AS factura_id,
        f.fecha,
        f.total,
        f.estado,
        f.metodo_id,
        df.id AS detalle_id,
        df.producto_id,
        p.descripcion AS nombre_producto,
        df.cantidad,
        df.precio_unitario,
        (df.cantidad * df.precio_unitario) AS subtotal
    FROM factura f
    JOIN detalle_factura df ON f.id = df.factura_id
    JOIN producto p ON df.producto_id = p.id
    WHERE f.cliente_id = p_cliente_id;
END;
$$;
 V   DROP FUNCTION public.obtener_facturas_con_detalles_por_cliente(p_cliente_id integer);
       public               postgres    false            Y           1255    66841    obtener_imagen_por_id(bigint)    FUNCTION     �   CREATE FUNCTION public.obtener_imagen_por_id(p_id bigint) RETURNS TABLE(id bigint, url character varying, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM public.imagenes WHERE id = p_id;
END;
$$;
 9   DROP FUNCTION public.obtener_imagen_por_id(p_id bigint);
       public               postgres    false                       1255    49542    obtener_inventario()    FUNCTION     �   CREATE FUNCTION public.obtener_inventario() RETURNS TABLE(id integer, costo numeric, cantidad integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM inventario;
END;
$$;
 +   DROP FUNCTION public.obtener_inventario();
       public               postgres    false            +           1255    49543    obtener_inventario_id(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_inventario_id(p_id integer) RETURNS TABLE(id integer, costo numeric, cantidad integer, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM inventario i WHERE i.id = p_id;
END;
$$;
 :   DROP FUNCTION public.obtener_inventario_id(p_id integer);
       public               postgres    false            >           1255    49644    obtener_marca(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_marca(p_id integer) RETURNS TABLE(id integer, nombre character varying, estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM marca M WHERE M.id = p_id;
END;
$$;
 2   DROP FUNCTION public.obtener_marca(p_id integer);
       public               postgres    false                       1255    41362    obtener_marcas()    FUNCTION     �   CREATE FUNCTION public.obtener_marcas() RETURNS TABLE(id integer, nombre character varying, estado boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM marca;
END;
$$;
 '   DROP FUNCTION public.obtener_marcas();
       public               postgres    false            D           1255    49657    obtener_metodo_pago_id(integer)    FUNCTION     �   CREATE FUNCTION public.obtener_metodo_pago_id(pago_id integer) RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT m.id, m.nombre FROM metodo_pago m WHERE m.id = pago_id;
END;
$$;
 >   DROP FUNCTION public.obtener_metodo_pago_id(pago_id integer);
       public               postgres    false            *           1255    49556    obtener_metodos_pago()    FUNCTION     �   CREATE FUNCTION public.obtener_metodos_pago() RETURNS TABLE(id integer, nombre character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT m.id, m.nombre FROM metodo_pago m;
END;
$$;
 -   DROP FUNCTION public.obtener_metodos_pago();
       public               postgres    false                       1255    41317    obtener_permiso(integer)    FUNCTION     N  CREATE FUNCTION public.obtener_permiso(p_id integer) RETURNS TABLE(id integer, crear boolean, eliminar boolean, actualizar boolean, ver boolean, usuario_id bigint)
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
       public               postgres    false            B           1255    49655    obtener_personal()    FUNCTION     K  CREATE FUNCTION public.obtener_personal() RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal;
END;
$$;
 )   DROP FUNCTION public.obtener_personal();
       public               postgres    false            C           1255    49656    obtener_personal(integer)    FUNCTION     k  CREATE FUNCTION public.obtener_personal(p_id integer) RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal p WHERE p.id = p_id;
END;
$$;
 5   DROP FUNCTION public.obtener_personal(p_id integer);
       public               postgres    false            (           1255    49539    obtener_personal_id(integer)    FUNCTION     o  CREATE FUNCTION public.obtener_personal_id(p_id integer) RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, fecha_nacimiento date, rol character varying, usuario_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM personal p WHERE p.id = p_id;
END;
$$;
 8   DROP FUNCTION public.obtener_personal_id(p_id integer);
       public               postgres    false            /           1255    49547    obtener_precio_id(integer)    FUNCTION       CREATE FUNCTION public.obtener_precio_id(p_id integer) RETURNS TABLE(id integer, precio numeric, fecha_inicio date, fecha_final date, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM precio p WHERE p.id = p_id;
END;
$$;
 6   DROP FUNCTION public.obtener_precio_id(p_id integer);
       public               postgres    false            .           1255    49546    obtener_precios()    FUNCTION     �   CREATE FUNCTION public.obtener_precios() RETURNS TABLE(id integer, precio numeric, fecha_inicio date, fecha_final date, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM precio;
END;
$$;
 (   DROP FUNCTION public.obtener_precios();
       public               postgres    false            ;           1255    49663    obtener_producto(integer)    FUNCTION     j  CREATE FUNCTION public.obtener_producto(producto_id integer) RETURNS TABLE(id integer, descripcion character varying, estado character varying, marca_id integer, categoria_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT p.id, p.descripcion, p.estado, p.marca_id, p.categoria_id
    FROM producto p
    WHERE p.id = producto_id;
END;
$$;
 <   DROP FUNCTION public.obtener_producto(producto_id integer);
       public               postgres    false            A           1255    49650    obtener_productos()    FUNCTION     8  CREATE FUNCTION public.obtener_productos() RETURNS TABLE(id integer, descripcion character varying, estado character varying, marca_id integer, categoria_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT p.id, p.descripcion, p.estado, p.marca_id, p.categoria_id  FROM producto p;
END;
$$;
 *   DROP FUNCTION public.obtener_productos();
       public               postgres    false            X           1255    66840    obtener_todas_las_imagenes()    FUNCTION     �   CREATE FUNCTION public.obtener_todas_las_imagenes() RETURNS TABLE(id bigint, url character varying, producto_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.imagenes;
END;
$$;
 3   DROP FUNCTION public.obtener_todas_las_imagenes();
       public               postgres    false            G           1255    49666 &   obtener_ultimo_permiso_por_email(text)    FUNCTION     �  CREATE FUNCTION public.obtener_ultimo_permiso_por_email(p_email text) RETURNS TABLE(crear boolean, eliminar boolean, actualizar boolean, ver boolean)
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
       public               postgres    false                       1255    41307    obtener_usuarios()    FUNCTION       CREATE FUNCTION public.obtener_usuarios() RETURNS TABLE(id integer, nombre character varying, apellido character varying, telefono character varying, direccion character varying, estado character varying, usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
     RETURN QUERY
	 SELECT c.id,c.nombre,c.apellido,c.telefono,c.direccion,c.estado,c.usuario_id FROM cliente c;
END;
$$;
 )   DROP FUNCTION public.obtener_usuarios();
       public               postgres    false                       1255    41306 x   registrar_cliente(character varying, character varying, character varying, character varying, character varying, bigint) 	   PROCEDURE     �  CREATE PROCEDURE public.registrar_cliente(IN nombre character varying, IN apellido character varying, IN telefono character varying, IN direccion character varying, IN estado character varying, IN usuario_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
 INSERT INTO cliente (nombre,apellido,telefono,direccion,estado,usuario_id) VALUES (nombre,apellido,telefono,direccion,estado,usuario_id);
END;
$$;
 �   DROP PROCEDURE public.registrar_cliente(IN nombre character varying, IN apellido character varying, IN telefono character varying, IN direccion character varying, IN estado character varying, IN usuario_id bigint);
       public               postgres    false                       1255    41312 >   registrar_permisos(boolean, boolean, boolean, boolean, bigint) 	   PROCEDURE     ;  CREATE PROCEDURE public.registrar_permisos(IN c_crear boolean, IN c_eliminar boolean, IN c_actualizar boolean, IN c_ver boolean, IN c_usuario bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
 INSERT INTO permiso(crear,eliminar,actualizar,ver,usuario_id)VALUES(c_crear,c_eliminar,c_actualizar,c_ver,c_usuario);
END;
$$;
 �   DROP PROCEDURE public.registrar_permisos(IN c_crear boolean, IN c_eliminar boolean, IN c_actualizar boolean, IN c_ver boolean, IN c_usuario bigint);
       public               postgres    false            H           1255    49668 %   verificar_existencia_permiso(integer)    FUNCTION       CREATE FUNCTION public.verificar_existencia_permiso(p_id integer) RETURNS boolean
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
            public               postgres    false    260                       1259    66829    imagenes    TABLE     {   CREATE TABLE public.imagenes (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    producto_id integer
);
    DROP TABLE public.imagenes;
       public         heap r       postgres    false                       1259    66828    imagenes_id_seq    SEQUENCE     �   ALTER TABLE public.imagenes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    264            �            1259    49499 
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
            public               postgres    false    246            
           1259    74644    reglas_asociacion    TABLE     �   CREATE TABLE public.reglas_asociacion (
    id integer NOT NULL,
    antecedents text NOT NULL,
    consequents text NOT NULL,
    support double precision NOT NULL,
    confidence double precision NOT NULL,
    lift double precision NOT NULL
);
 %   DROP TABLE public.reglas_asociacion;
       public         heap r       postgres    false            	           1259    74643    reglas_asociacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reglas_asociacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.reglas_asociacion_id_seq;
       public               postgres    false    266            ,           0    0    reglas_asociacion_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.reglas_asociacion_id_seq OWNED BY public.reglas_asociacion.id;
          public               postgres    false    265            �            1259    33207    usuarios_customuser    TABLE     �  CREATE TABLE public.usuarios_customuser (
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
            public               postgres    false    232            �           2604    74647    reglas_asociacion id    DEFAULT     |   ALTER TABLE ONLY public.reglas_asociacion ALTER COLUMN id SET DEFAULT nextval('public.reglas_asociacion_id_seq'::regclass);
 C   ALTER TABLE public.reglas_asociacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    265    266    266            �          0    33167 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public               postgres    false    224   ��      �          0    33175    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public               postgres    false    226   ��      �          0    33161    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public               postgres    false    222   ��                0    33276    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public               postgres    false    235   U�                0    49559    carrito_compra 
   TABLE DATA           N   COPY public.carrito_compra (id, total, fecha, estado, cliente_id) FROM stdin;
    public               postgres    false    256   ��                0    41321 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public               postgres    false    242   ��                0    33290    cliente 
   TABLE DATA           `   COPY public.cliente (id, nombre, apellido, telefono, direccion, estado, usuario_id) FROM stdin;
    public               postgres    false    237   2�                0    49573    detalle_carrito 
   TABLE DATA           m   COPY public.detalle_carrito (id, cantidad, precio_unitario, "subTotal", carrito_id, producto_id) FROM stdin;
    public               postgres    false    258   L�      !          0    49611    detalle_factura 
   TABLE DATA           a   COPY public.detalle_factura (id, cantidad, precio_unitario, factura_id, producto_id) FROM stdin;
    public               postgres    false    262   i�                0    33256    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public               postgres    false    234   ��      �          0    33153    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public               postgres    false    220   ��      �          0    33145    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public               postgres    false    218   ��                0    33315    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public               postgres    false    240   �                0    49591    factura 
   TABLE DATA           R   COPY public.factura (id, fecha, total, estado, cliente_id, metodo_id) FROM stdin;
    public               postgres    false    260   (�      #          0    66829    imagenes 
   TABLE DATA           8   COPY public.imagenes (id, url, producto_id) FROM stdin;
    public               postgres    false    264   ��                0    49499 
   inventario 
   TABLE DATA           F   COPY public.inventario (id, costo, cantidad, producto_id) FROM stdin;
    public               postgres    false    248   ��                0    41327    marca 
   TABLE DATA           3   COPY public.marca (id, nombre, estado) FROM stdin;
    public               postgres    false    244   ��                0    49549    metodo_pago 
   TABLE DATA           1   COPY public.metodo_pago (id, nombre) FROM stdin;
    public               postgres    false    254   ��      
          0    33304    permiso 
   TABLE DATA           S   COPY public.permiso (id, crear, eliminar, actualizar, ver, usuario_id) FROM stdin;
    public               postgres    false    239   ��                0    49523    personal 
   TABLE DATA           p   COPY public.personal (id, nombre, apellido, telefono, direccion, fecha_nacimiento, rol, usuario_id) FROM stdin;
    public               postgres    false    252   Q�                0    49511    precio 
   TABLE DATA           T   COPY public.precio (id, precio, fecha_inicio, fecha_final, producto_id) FROM stdin;
    public               postgres    false    250   ��                0    41333    producto 
   TABLE DATA           S   COPY public.producto (id, descripcion, estado, categoria_id, marca_id) FROM stdin;
    public               postgres    false    246   ��      %          0    74644    reglas_asociacion 
   TABLE DATA           d   COPY public.reglas_asociacion (id, antecedents, consequents, support, confidence, lift) FROM stdin;
    public               postgres    false    266   ��      �          0    33207    usuarios_customuser 
   TABLE DATA           �   COPY public.usuarios_customuser (id, password, last_login, is_superuser, email, first_name, role, is_active, is_staff) FROM stdin;
    public               postgres    false    228   �                0    33215    usuarios_customuser_groups 
   TABLE DATA           Q   COPY public.usuarios_customuser_groups (id, customuser_id, group_id) FROM stdin;
    public               postgres    false    230                    0    33221 $   usuarios_customuser_user_permissions 
   TABLE DATA           `   COPY public.usuarios_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public               postgres    false    232   =      -           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public               postgres    false    223            .           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public               postgres    false    225            /           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);
          public               postgres    false    221            0           0    0    carrito_compra_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.carrito_compra_id_seq', 2, true);
          public               postgres    false    255            1           0    0    categoria_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_id_seq', 82, true);
          public               postgres    false    241            2           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 91, true);
          public               postgres    false    236            3           0    0    detalle_carrito_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.detalle_carrito_id_seq', 4, true);
          public               postgres    false    257            4           0    0    detalle_factura_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.detalle_factura_id_seq', 11, true);
          public               postgres    false    261            5           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public               postgres    false    233            6           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);
          public               postgres    false    219            7           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);
          public               postgres    false    217            8           0    0    factura_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.factura_id_seq', 126, true);
          public               postgres    false    259            9           0    0    imagenes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.imagenes_id_seq', 16, true);
          public               postgres    false    263            :           0    0    inventario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.inventario_id_seq', 64, true);
          public               postgres    false    247            ;           0    0    marca_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marca_id_seq', 61, true);
          public               postgres    false    243            <           0    0    metodo_pago_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.metodo_pago_id_seq', 8, true);
          public               postgres    false    253            =           0    0    permiso_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.permiso_id_seq', 21, true);
          public               postgres    false    238            >           0    0    personal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.personal_id_seq', 9, true);
          public               postgres    false    251            ?           0    0    precios_precio_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.precios_precio_id_seq', 94, true);
          public               postgres    false    249            @           0    0    producto_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.producto_id_seq', 134, true);
          public               postgres    false    245            A           0    0    reglas_asociacion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.reglas_asociacion_id_seq', 1128, true);
          public               postgres    false    265            B           0    0 !   usuarios_customuser_groups_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.usuarios_customuser_groups_id_seq', 1, false);
          public               postgres    false    229            C           0    0    usuarios_customuser_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.usuarios_customuser_id_seq', 14, true);
          public               postgres    false    227            D           0    0 +   usuarios_customuser_user_permissions_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.usuarios_customuser_user_permissions_id_seq', 1, false);
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
       public                 postgres    false    222                       2606    33280 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public                 postgres    false    235                       2606    33282 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public                 postgres    false    235            7           2606    49565 "   carrito_compra carrito_compra_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.carrito_compra
    ADD CONSTRAINT carrito_compra_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.carrito_compra DROP CONSTRAINT carrito_compra_pkey;
       public                 postgres    false    256            #           2606    41325    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    242                       2606    33296    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    237            :           2606    49577 $   detalle_carrito detalle_carrito_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_pkey;
       public                 postgres    false    258            B           2606    49615 $   detalle_factura detalle_factura_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_pkey;
       public                 postgres    false    262                       2606    33263 &   django_admin_log django_admin_log_pkey 
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
       public                 postgres    false    218                        2606    33321 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public                 postgres    false    240            ?           2606    49597    factura factura_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public                 postgres    false    260            E           2606    66833    imagenes imagenes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_pkey;
       public                 postgres    false    264            +           2606    49503    inventario inventario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public                 postgres    false    248            %           2606    41331    marca marca_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public                 postgres    false    244            4           2606    49553    metodo_pago metodo_pago_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.metodo_pago DROP CONSTRAINT metodo_pago_pkey;
       public                 postgres    false    254                       2606    33308    permiso permiso_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public                 postgres    false    239            1           2606    49529    personal personal_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_pkey;
       public                 postgres    false    252            .           2606    49515    precio precios_precio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precios_precio_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.precio DROP CONSTRAINT precios_precio_pkey;
       public                 postgres    false    250            )           2606    41339    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    246            H           2606    74651 (   reglas_asociacion reglas_asociacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reglas_asociacion
    ADD CONSTRAINT reglas_asociacion_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reglas_asociacion DROP CONSTRAINT reglas_asociacion_pkey;
       public                 postgres    false    266                        2606    33213 1   usuarios_customuser usuarios_customuser_email_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.usuarios_customuser
    ADD CONSTRAINT usuarios_customuser_email_key UNIQUE (email);
 [   ALTER TABLE ONLY public.usuarios_customuser DROP CONSTRAINT usuarios_customuser_email_key;
       public                 postgres    false    228                       2606    33228 Z   usuarios_customuser_groups usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq UNIQUE (customuser_id, group_id);
 �   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_customuser_id_group_id_aace3972_uniq;
       public                 postgres    false    230    230                       2606    33219 :   usuarios_customuser_groups usuarios_customuser_groups_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_pkey;
       public                 postgres    false    230                       2606    33211 ,   usuarios_customuser usuarios_customuser_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.usuarios_customuser
    ADD CONSTRAINT usuarios_customuser_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.usuarios_customuser DROP CONSTRAINT usuarios_customuser_pkey;
       public                 postgres    false    228            
           2606    33242 d   usuarios_customuser_user_permissions usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq UNIQUE (customuser_id, permission_id);
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser_user_customuser_id_permission_8dac6e14_uniq;
       public                 postgres    false    232    232                       2606    33225 N   usuarios_customuser_user_permissions usuarios_customuser_user_permissions_pkey 
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
       public                 postgres    false    222                       1259    33288 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public                 postgres    false    235            5           1259    49571 "   carrito_compra_cliente_id_3724c4b8    INDEX     c   CREATE INDEX carrito_compra_cliente_id_3724c4b8 ON public.carrito_compra USING btree (cliente_id);
 6   DROP INDEX public.carrito_compra_cliente_id_3724c4b8;
       public                 postgres    false    256                       1259    33302    cliente_usuario_id_ff892797    INDEX     U   CREATE INDEX cliente_usuario_id_ff892797 ON public.cliente USING btree (usuario_id);
 /   DROP INDEX public.cliente_usuario_id_ff892797;
       public                 postgres    false    237            8           1259    49588 #   detalle_carrito_carrito_id_6d1f8b6b    INDEX     e   CREATE INDEX detalle_carrito_carrito_id_6d1f8b6b ON public.detalle_carrito USING btree (carrito_id);
 7   DROP INDEX public.detalle_carrito_carrito_id_6d1f8b6b;
       public                 postgres    false    258            ;           1259    49589 $   detalle_carrito_producto_id_ef50ac42    INDEX     g   CREATE INDEX detalle_carrito_producto_id_ef50ac42 ON public.detalle_carrito USING btree (producto_id);
 8   DROP INDEX public.detalle_carrito_producto_id_ef50ac42;
       public                 postgres    false    258            @           1259    49626 #   detalle_factura_factura_id_1d9c16d8    INDEX     e   CREATE INDEX detalle_factura_factura_id_1d9c16d8 ON public.detalle_factura USING btree (factura_id);
 7   DROP INDEX public.detalle_factura_factura_id_1d9c16d8;
       public                 postgres    false    262            C           1259    49627 $   detalle_factura_producto_id_a5e7ee3a    INDEX     g   CREATE INDEX detalle_factura_producto_id_a5e7ee3a ON public.detalle_factura USING btree (producto_id);
 8   DROP INDEX public.detalle_factura_producto_id_a5e7ee3a;
       public                 postgres    false    262                       1259    33274 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public                 postgres    false    234                       1259    33275 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public                 postgres    false    234                       1259    33323 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public                 postgres    false    240            !           1259    33322 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public                 postgres    false    240            <           1259    49608    factura_cliente_id_d6cd70fe    INDEX     U   CREATE INDEX factura_cliente_id_d6cd70fe ON public.factura USING btree (cliente_id);
 /   DROP INDEX public.factura_cliente_id_d6cd70fe;
       public                 postgres    false    260            =           1259    49609    factura_metodo_id_87149544    INDEX     S   CREATE INDEX factura_metodo_id_87149544 ON public.factura USING btree (metodo_id);
 .   DROP INDEX public.factura_metodo_id_87149544;
       public                 postgres    false    260            F           1259    66839    imagenes_producto_id_f47173dd    INDEX     Y   CREATE INDEX imagenes_producto_id_f47173dd ON public.imagenes USING btree (producto_id);
 1   DROP INDEX public.imagenes_producto_id_f47173dd;
       public                 postgres    false    264            ,           1259    49509    inventario_producto_id_61d8ae74    INDEX     ]   CREATE INDEX inventario_producto_id_61d8ae74 ON public.inventario USING btree (producto_id);
 3   DROP INDEX public.inventario_producto_id_61d8ae74;
       public                 postgres    false    248                       1259    33314    permiso_usuario_id_352c28c2    INDEX     U   CREATE INDEX permiso_usuario_id_352c28c2 ON public.permiso USING btree (usuario_id);
 /   DROP INDEX public.permiso_usuario_id_352c28c2;
       public                 postgres    false    239            2           1259    49535    personal_usuario_id_0f2b7609    INDEX     W   CREATE INDEX personal_usuario_id_0f2b7609 ON public.personal USING btree (usuario_id);
 0   DROP INDEX public.personal_usuario_id_0f2b7609;
       public                 postgres    false    252            /           1259    49521 #   precios_precio_producto_id_96dabe0f    INDEX     ]   CREATE INDEX precios_precio_producto_id_96dabe0f ON public.precio USING btree (producto_id);
 7   DROP INDEX public.precios_precio_producto_id_96dabe0f;
       public                 postgres    false    250            &           1259    41350    producto_categoria_id_67131168    INDEX     [   CREATE INDEX producto_categoria_id_67131168 ON public.producto USING btree (categoria_id);
 2   DROP INDEX public.producto_categoria_id_67131168;
       public                 postgres    false    246            '           1259    41351    producto_marca_id_2793ee53    INDEX     S   CREATE INDEX producto_marca_id_2793ee53 ON public.producto USING btree (marca_id);
 .   DROP INDEX public.producto_marca_id_2793ee53;
       public                 postgres    false    246            �           1259    33226 '   usuarios_customuser_email_9e9473e9_like    INDEX     |   CREATE INDEX usuarios_customuser_email_9e9473e9_like ON public.usuarios_customuser USING btree (email varchar_pattern_ops);
 ;   DROP INDEX public.usuarios_customuser_email_9e9473e9_like;
       public                 postgres    false    228                       1259    33239 1   usuarios_customuser_groups_customuser_id_9e05d670    INDEX     �   CREATE INDEX usuarios_customuser_groups_customuser_id_9e05d670 ON public.usuarios_customuser_groups USING btree (customuser_id);
 E   DROP INDEX public.usuarios_customuser_groups_customuser_id_9e05d670;
       public                 postgres    false    230                       1259    33240 ,   usuarios_customuser_groups_group_id_155d554c    INDEX     w   CREATE INDEX usuarios_customuser_groups_group_id_155d554c ON public.usuarios_customuser_groups USING btree (group_id);
 @   DROP INDEX public.usuarios_customuser_groups_group_id_155d554c;
       public                 postgres    false    230                       1259    33253 ;   usuarios_customuser_user_permissions_customuser_id_c016378e    INDEX     �   CREATE INDEX usuarios_customuser_user_permissions_customuser_id_c016378e ON public.usuarios_customuser_user_permissions USING btree (customuser_id);
 O   DROP INDEX public.usuarios_customuser_user_permissions_customuser_id_c016378e;
       public                 postgres    false    232                       1259    33254 ;   usuarios_customuser_user_permissions_permission_id_9a10b097    INDEX     �   CREATE INDEX usuarios_customuser_user_permissions_permission_id_9a10b097 ON public.usuarios_customuser_user_permissions USING btree (permission_id);
 O   DROP INDEX public.usuarios_customuser_user_permissions_permission_id_9a10b097;
       public                 postgres    false    232            b           2620    49670 )   usuarios_customuser trigger_crear_permiso    TRIGGER     �   CREATE TRIGGER trigger_crear_permiso AFTER INSERT ON public.usuarios_customuser FOR EACH ROW EXECUTE FUNCTION public.crear_permiso_al_crear_usuario();
 B   DROP TRIGGER trigger_crear_permiso ON public.usuarios_customuser;
       public               postgres    false    228    329            J           2606    33196 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public               postgres    false    222    4850    226            K           2606    33191 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public               postgres    false    4855    226    224            I           2606    33182 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public               postgres    false    222    4845    220            R           2606    33283 J   authtoken_token authtoken_token_user_id_35299eff_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_usuarios_customuser_id FOREIGN KEY (user_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_usuarios_customuser_id;
       public               postgres    false    4866    228    235            Z           2606    49566 ?   carrito_compra carrito_compra_cliente_id_3724c4b8_fk_cliente_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito_compra
    ADD CONSTRAINT carrito_compra_cliente_id_3724c4b8_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.carrito_compra DROP CONSTRAINT carrito_compra_cliente_id_3724c4b8_fk_cliente_id;
       public               postgres    false    256    4889    237            S           2606    33297 =   cliente cliente_usuario_id_ff892797_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_usuario_id_ff892797_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_usuario_id_ff892797_fk_usuarios_customuser_id;
       public               postgres    false    237    4866    228            [           2606    49578 H   detalle_carrito detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id FOREIGN KEY (carrito_id) REFERENCES public.carrito_compra(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_carrito_id_6d1f8b6b_fk_carrito_compra_id;
       public               postgres    false    4919    258    256            \           2606    49583 C   detalle_carrito detalle_carrito_producto_id_ef50ac42_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_carrito
    ADD CONSTRAINT detalle_carrito_producto_id_ef50ac42_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.detalle_carrito DROP CONSTRAINT detalle_carrito_producto_id_ef50ac42_fk_producto_id;
       public               postgres    false    258    246    4905            _           2606    49616 A   detalle_factura detalle_factura_factura_id_1d9c16d8_fk_factura_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_factura_id_1d9c16d8_fk_factura_id FOREIGN KEY (factura_id) REFERENCES public.factura(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_factura_id_1d9c16d8_fk_factura_id;
       public               postgres    false    260    262    4927            `           2606    49621 C   detalle_factura detalle_factura_producto_id_a5e7ee3a_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_producto_id_a5e7ee3a_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_producto_id_a5e7ee3a_fk_producto_id;
       public               postgres    false    262    4905    246            P           2606    33264 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public               postgres    false    234    4845    220            Q           2606    33269 L   django_admin_log django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id FOREIGN KEY (user_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_customuser_id;
       public               postgres    false    234    228    4866            ]           2606    49598 1   factura factura_cliente_id_d6cd70fe_fk_cliente_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_cliente_id_d6cd70fe_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_cliente_id_d6cd70fe_fk_cliente_id;
       public               postgres    false    237    260    4889            ^           2606    49603 4   factura factura_metodo_id_87149544_fk_metodo_pago_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_metodo_id_87149544_fk_metodo_pago_id FOREIGN KEY (metodo_id) REFERENCES public.metodo_pago(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_metodo_id_87149544_fk_metodo_pago_id;
       public               postgres    false    260    4916    254            a           2606    66834 5   imagenes imagenes_producto_id_f47173dd_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_producto_id_f47173dd_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_producto_id_f47173dd_fk_producto_id;
       public               postgres    false    264    246    4905            W           2606    49504 9   inventario inventario_producto_id_61d8ae74_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_producto_id_61d8ae74_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_producto_id_61d8ae74_fk_producto_id;
       public               postgres    false    4905    246    248            T           2606    33309 =   permiso permiso_usuario_id_352c28c2_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_usuario_id_352c28c2_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_usuario_id_352c28c2_fk_usuarios_customuser_id;
       public               postgres    false    239    228    4866            Y           2606    49530 ?   personal personal_usuario_id_0f2b7609_fk_usuarios_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_usuario_id_0f2b7609_fk_usuarios_customuser_id FOREIGN KEY (usuario_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_usuario_id_0f2b7609_fk_usuarios_customuser_id;
       public               postgres    false    252    4866    228            X           2606    49516 9   precio precios_precio_producto_id_96dabe0f_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precios_precio_producto_id_96dabe0f_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.precio DROP CONSTRAINT precios_precio_producto_id_96dabe0f_fk_producto_id;
       public               postgres    false    4905    250    246            U           2606    41340 7   producto producto_categoria_id_67131168_fk_categoria_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_67131168_fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_categoria_id_67131168_fk_categoria_id;
       public               postgres    false    4899    242    246            V           2606    41345 /   producto producto_marca_id_2793ee53_fk_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_marca_id_2793ee53_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_marca_id_2793ee53_fk_marca_id;
       public               postgres    false    246    244    4901            L           2606    33229 S   usuarios_customuser_groups usuarios_customuser__customuser_id_9e05d670_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser__customuser_id_9e05d670_fk_usuarios_ FOREIGN KEY (customuser_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser__customuser_id_9e05d670_fk_usuarios_;
       public               postgres    false    4866    230    228            N           2606    33243 ]   usuarios_customuser_user_permissions usuarios_customuser__customuser_id_c016378e_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser__customuser_id_c016378e_fk_usuarios_ FOREIGN KEY (customuser_id) REFERENCES public.usuarios_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser__customuser_id_c016378e_fk_usuarios_;
       public               postgres    false    4866    232    228            O           2606    33248 ]   usuarios_customuser_user_permissions usuarios_customuser__permission_id_9a10b097_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions
    ADD CONSTRAINT usuarios_customuser__permission_id_9a10b097_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_user_permissions DROP CONSTRAINT usuarios_customuser__permission_id_9a10b097_fk_auth_perm;
       public               postgres    false    4850    222    232            M           2606    33234 X   usuarios_customuser_groups usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_customuser_groups
    ADD CONSTRAINT usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_customuser_groups DROP CONSTRAINT usuarios_customuser_groups_group_id_155d554c_fk_auth_group_id;
       public               postgres    false    4855    230    224            �      x������ � �      �      x������ � �      �   Y  x�m�Mn�0���)|��ԟ�u��e�@�YW�-��6�/E�o(���7��p�Sb��a:����n;��2ʟ?�9u���a�YA�R� ^�ݮ��6��_�m����i�Ǹ,��T���P� I�'�'Xl�%
2h��*o�{=U���9����tbPSBH!U�����׬�����~=�j�*mm�S��J�-j+x�(�.-�W�'V��8�6��6=���d�3F�V��U��<�ײ����Yuq���t%� �4D��'$�F4C�q�@fw�p�NA���+a����"��RDX A=>
���9�>�{��A��k��RP��7�G�mV��Ɠ��	�IW�0����;K�<C�r*r�-�C�1��ߧX�D�m�y�a����X&X� �6
�~X����L� pA7r�Lsˬ�xd��2���d�`��?����݈ug��#��RD,<A	=������N����[�󈥛dRl=��&���G.�$Sy���ӯ�0����\ѭ0�DI#���&�H�$�"	���e�Z��vҭt#<�HI70�T�N`��	�]�4ܕ�G�YwU�QƲG���2�=Jd#<�\�(Q��vuW�qx7�1󩶕t'�P��� }Q4${`����W>C���:����9>�zʘP��>e��z8nd����k��m�Ϯ�BH�d�]�:���딉*SU�������m�wo���60����FeKv�Ჾ�AU��DG}^��3'�iM\~*�c���̨�9sC�n��#��m��9C��3�5�9CΙ[������Ǳ���g,�u/�XJf&�o�L��$��ȉ��Mk�*���         L   x�ȱ� �Z������%M������:<8�������x�K��c�rm�5�/�@Ҋ2*˿	JO!�"�            x������ � �         T  x�M�Mn�0��3��	� ��,UHhWݸ��Z2v�بW�9z��	��|3�ߢ������j�2���%!H,ࢌ��q�-ᠥwζ)����q�Ќ���,���d�$���Y�P����A����V~&����\��g�������kI<�a-��,lѩ��b	G���Y����+5K�
v^M�=C�!+������Q +a���a���!cpr.d�"�pVR��=���
6��jޑդ�C�7�9�b:a6/2�87��Ȑ/'r:����Q&ᑗdr��*M���aQ������Wpp1�k��Lsa�S�j�Z��y��㻉��'D����         
  x�e��n�@E��h�uG�@�X:�$��X�(�lʸ�a��1�&�e^�����l,dq��nU�¬��Շ�o���R	7�e��aV ����<?NBh��}u�����[�z�j5{J��|A��j3S��:���W�m�E2�W<����i��2[�ܕ=��m�;�cF~��|>`^�E�z�Nyϩv4�kp�0���dh�z	�Ѯ�?L�w�H�{��`����Om��=��ia�F��)�!�ڼ�9���1QׇT̉��P$`f�N�ݷ���$,��*�H	�ꜧ	��OGJ�j�Ԥ\�!��5��}u��D��TR���r�Q~d�����k�v�_0R���0��Y��>��I�u�T�8j2R�ăM��N�L;�����������	�;A�ѥ�Q!<�!����%�V�'9Op��"�UP���4���]ɰ��H�\��b:���K]�֥E��\Nj�G��2m�H�D���f�{���k�}y���L&���0
            x������ � �      !   L   x�M���0��0U����	T~��w�3bD@(�T�LN$�}����u���J�Ud,�S�U2l^��H�            x������ � �      �   �   x�]�[n� E���TC潋.���"4E83jv_'�L�|l��-0@}�F\�4cT�&����s��V�	O`9�Je�\����[;r�@Ʌ�gU�,Jv	���𷋰�x�_���x;z�_m��PWS�hX7p�_���@�jmh���}��tWBs��-�b4gU9�W��\���#�;��Bp�=����2��n��n�r���w��8�GSԼ������D-bg��vU�]с�_�O� ?���p      �     x���mn�8�;���ԗ�S����ֶ2�]Lo�����N�8����P$_RP�q��0M?V�1�aSp]��+��^@7HoudJ���)�&��wo�?���\��tm@g��<�zd�Le�Xh]7�d/>�aCJDۻ?��Ù������+�_Q�H�w�{J�Bj��R�-%����4>F�Y~z�+B�":7N���@���Fa�P�@������v�>�\��F�fE��9�]Nn�i��t�>��l��ѝ��(%\ll��+��R��+��U�](����O�+��|ه�F,��ո v�P�������ƍ��\��o�zioZJ����jg�B�1�\�!���{�ðCRP�4��I�J��O	���#�iRA�$[̵S��Νm�+�v�g�9���b�)��wd"�V �c�:\N�CT�F\?F����&�{��kq�HVN�x/�\_��96m$�b�
E^�]��Y��b`w*�^�k��`�Z��gR�eӢ��=���2!���_g�y4�A,]����Sp[Bxa� 6��F+�xMջ�~/��G�_���UԮ��N�5�Ց�D��*�ԁ�^�5�5�����/G���'*������*�s�[�zy�Gvr�t�� � ��4 ��"7q��ڌ��%]nB�E&��O��s��D�đå>���R��qlx}Tpu���O����{.�,�$۔/G��7�?sr�*E�ix�R�(��f�C�u@!�/^�
=]����"+� p2�4���p8��c��            x������ � �         �  x��W�n7<��ł(�"u#�%͡�^��(
�����\����?�ѐK���C���)W����ˏ��_�y>�)��a�C�c�t�/O/<�|���a혥ӎ#��#F=N��>���1��1m2��\:_��U��� #W�ì�0vh��*����=b��ҍY�,���N��S��xH�3�.�k]%�)nR��%km��[���
G���,��ϷVF߿�0N�=	z� �)T}����^u��,VbC�����m^�����N4v�H2)��n,Nh� �=�+s�8�"@}�ܢ�T�&��J��i��*����J������NFl�� Yp>�v9���+��~&� t�DgFZxOѽ� Up10�$��U�e`�A$�WԆu�r�q�=	�"�X�$04_d�ɴj"�юN����T`�P�é����"�`�FF�đ,�v2�J�v����X�H+�ٵ��Ŋ [��-��x��l@;KAK�	��l�"�cf�2i� �2�RN4����:�mJR�;H� vq���m�@q1��$Jn.`Z ���p���ة[��CN|[���v�'�_�6HꜹZ.���U�k,���8 �Q)=tB��#-B0O˚D��7�$�9f북)4.���k�-x�yѼ�B�U0,�EGG3F뺬�dX�-�b�y˝���j������o[�Xf&rk���^��ؖ�F�,H�q�r.-�O�s&Њҧ���Z��1Ln�{1�a_T���I���D��dl޵�7�7�}�h3�qj���j���bU��p�����:�{5��>+��g�P/ #N���e�`mv�\��l��Za�a"������\s�`�쭆$� P��XYu0���h&8�/ ��@,q�Ӽ�� f��o����Z�E=i����NxǫƗ �p-�y������$wX����͝�=<O����i�4�J�mN��8g�9(c�Z��JGA�F��S0D�kOw!��u�Zv���F�0!��^���i�>�;��7Ǖ߿G�Q��}��A�6��Z��
7���^L��c�?��1h����_����M�q���E���>}���WlP���`{�相>�^��^㌈�o�?d��[.�7�ﵔ�/�Y      #   �   x���MN�0�u�0���؜	EI	��i���+u5�nl.������Ƕ-�c��Ny��~��|6�|���<���OG�/�܏���"�e��>l�-P��L�@�I�H%���Ir�
R��2��x'!��R.�N�n!c1��y�@H��%�.b)�إ�d��@�KEʨ)#���_Gl���Lj&��=�Yߠ�f}�}*������C����t���=7b�%[x� �9���         �   x�=�ˑ!C�R0S�X��2��1n����҇R�3�!1
y0��a�\ЦFˇ��E��#5�zp5Nj�z�,�`v�g�E��f�o���[e�a֕�И�n�˙q�k26o7��`,�P����e�'3�;�-QR�y�n�N�[�w�9�!��7��=������3�         �   x�%��N�0���+�#������(P-T���kꥩ�	��W���J�y��.aq'�I^c���H�ayF�����
�a6�0����c�P�@��w�%*t�]E%�}����b�f }�m�>��Th&Z���3����c�*���'>Or�ʰ��%j��̯����Hf�nC�ʮ��o*���&a	~���xJ�^Xa���a�8�;���ԗ)��S��]�$��Q�         X   x�3�tMKM.�,��2�I,�J-ITHIUp.:�2%�$��Y����$��9gHQb^qZjQj^rf��Sb^rbQf"��SfUi.W� ���      
   W   x�3�,�L��?.Sd�2�̀ȓ9�F`V�x�P6D�E�9��
���Ј�� �3�DQh��3BX`h�eh�l]� �/H         X  x���Kj�0���S� u���c�$Pihk�d3�EQq�0�퍺ȪG��j%�-�."�����0Ej}�/2��g�N�P�nYe��5HY�SE�c��BC�o�l�	V�(��!�#m{7@��q ���gUO,ˋ6�}���������y2Ұ�mO�>��Q!��;dKO[�#f6`��hġ�5*JaB���U�j����1���@�U���osOo$�:��B�Z�&hɋ����*��v0�j4*�%�#l���nK؜jR������3G�Y~�z:����6	�6E,�k����w���Y�Bw:���k%1� L�p�����|�xy���6���e��           x����m�0г�KK�~�t�9*�s+X #y���Q�~�Ŗ�g�<�K�g����%	J���H�k6"��-J�iĒd$�B"ar�0Ė��F1����G�`��䪌$�D�$��o4�F.~���:�1�H]�r�dn�Z�Z��?�<�����6}^0�Ș�	��$��(���e�Q��2�-��Lk��a�I���:<�im�!#��H��}�H���?���M7j��v2����_��mw\f�'F6z�����.����	���&         �  x����n�8���S�O R����23v�N��lh�v8�D����o�e]��bs�dS�1������!�d-�F��6t�
Iw���8��U�T�:��D	��d�r�u]����溦F�%Y�z!#A�E	Y���}}2z/[�kQR�}����aӔ,�F�Q�Q5��e+����Եʭz!#e$]�Ʌ�q�B�Mq��׾�ӛ��]�0�b��ȺS�'d���}+�H�y1#O���WA}hY��0�bN����hC��;!@9>��j*D2�Ou���!yԦ���<��;�rQ.�/;���\�vIFB:"7�S����J�j7h�=L�8&�b/;9��`D%v���ѭ�.Z�fPf/N�rٞ�(U�-e�ł��qJA����e�P�(��<�F�Un�?�F����u�NJ|r��3"�F��A�%cuƜ0��;�Q���+�H��[i�Z�%�ld.�1�u#��_��	!A_$���A��y����K�? r�$�$$[Y�7Ղ���m��P運��-��x�0A;#�r��GGsF?j\�v��b<<̆B��֋�����܇�O�Ӧ	�T�tt�B�芆��	#/I]�O-�<�"��m�0�,u�
Q��JhS�E��w���@����"�F��l����F��c5����4p�~C���	R��3N͙S�J��4�>��d�4�Y�gyi2��L0ZJ�^0(,��l�	DH#��(m|#~���@��_��&�26�oŹ4SB���{²��N�`[����,�ag;y��u��B�Wm���D/C��N7��u|E�߾˚FV�I���������67
T��j����ȼ,jEgfp��'����R0��>~pa�|����;������p�:�1P��wx�͍�|�f�/.g1(��wmcd�j�|)H�s9���΄����T��aD�{������íR���0�N`�9ħV�/᳜�)��EP`Hb�ϛ��n�Y��j6���1��*M�ӫ�%�芁)�g�F@�#���Z��;���?E��L���J�H�[)�9�;I�s���� X�h1)�ϥ]l�7�F��&������ҙ(�ęm܆�M��)�D��b�7��a��lD�����q��c&��,�R��`/]B�h�Ivg,���J�
	)����Qᨇ��G-�~�y���D~��|�@}줆�nƲQ��nap��Nq�`u����0�:Y5��%f���}��$�m�����A{}q���5L[ �<�W;�-�~�X��8`<p�#.h�
x>�¿:0?�P���QU�Z���J�P7
*�A��_p´w:V$>��8�7� y�	<Q�N�̏�5�gdg�*�J�kW���Ԯ�1�B�,�p�1y1�8U)��}_��T�� <�(���'W�Y�
f�@�a�>�ǵu"<0〓'YF��?-!H*	X�NiP]�aĎ-���nϣ�j9ސ,]-�8h�����u�y�?�O�      %      x��]�nd��}���� ��;Y��� �p��t^Y�P�������R��ݛ�*��lK�<����b�X7�>���>�?�>��������)�[����:�c���'B���Ϗ����_.(.�l�~2�m��?�?>�v����O��4��!嬋�����Q��+o\�1X�.}�z�z:�����92S�O>����>��	?|�������G�����+����?`�Q����k3�W<�c�+�5�F`�N}Ї��lM˕��143��V�q�7z��}
F��{��k+� )\{�ͯ8�����������/O����1�#{,����M���G�'����v�T8����y!������~z�h���?���=��f,�<���ș�g@AN�Faz�Q4��Q+���m@�K������>�>.<��Ǘ�w��|z�zz��Ǘ���������Q�+YC\��dKÑm�>8�"`�98��6�z�ц'ȸ���^�,�]��ק�ϟ�O�b�5�F����8�j�I����GQ?�z��IHc}�nb{�H�fjO̊>괍`3i�Ƥ�������`GK�)�C���!W ��3�
��6�9vG1*�8�Mv�_�h�!���p���D��F�H�DqAX���>�6��Ĳ%��ڠ�6G�g�F�?����������e��ɝ��*`e�u��%�՛]�������e���6n���lEl�;�����o�7m<6�ۍ�������[��r{�)��<�P���������L2P��(���-����P�e"h%�[s�����ڏc֎��P�����R �m��mCE/�[�A��n��!�Z�ES1�Vt�������k�b�K7���j����=� y���
6��J�����xe��Ϗw�hv@+�`D�+�C'71�l2�)���Ԅ
�P��0=ږ�j�b���Ի;��&�I��=8~������kcNw��G@�!ઋ�+H
Նid������д1�"~BM�ߞn�ϧo=��<[ű�Gܳ[��}�ެ��)��p<�����H	�_tQ����֭]7���oix����HfGJ�zN�\f_ؐ�+�O�#!�Wf:�|���p���3t2���>X�X;	O��;��X+�Rרܛ5�C���I�7�O�J\#�D��3��%x��f������T2��1�s��֣u�<��7gD���~�"�`(��N�;�\Z激�Ԗ��L"���.QD�EdA/�ot'1&�b�
B�N��.e.z�E��gÐ5䉫�L7�5��RT�Kh��F���&�a�gY+4Nbx����)R;�k���m�&�D�N��3�/y�p{`t߬�x��Uw�|��W�Š���x�g-+ �|��v�lhVBq��1�B".<KZk`��� �4jv�Xe��؎-����0���H(b��k'4B���#�Yz�DmoG�͠6{۴�MT�J���Q�>f��!�2W���/�9$9�M���3��r{7q���֪���Б�MA!L�
��X�˟�eA�}�]7��1x,���Yc�*�Z��Z:2�ޕ߸�ꭍ<�t���d�q2�^Z�����
���ږ�pkJ�1����k�Yi�rv��}��q͉H
���xS>S�X��������1�	��^>^����B���S+T��+��J�|��"g�u�:;tA����>��9�y�(�V�e���$ptA��vR��3u��k�ʁ�����O�<���a7����U(�3\��V �I�>� ��C�4�J�E�QR�/de7��]�I
.��q����_O_��3��I1������PM`�6�A��?�yv���G�E���O��ǧ�}y�7vw"+�Ĩ*�̃w�#h���x��h5Qb-n�&�a)�.1p�7�֭�$d�6��SM��QW_ؼ�{��u��
?�Zk��(��ө���"w�}��r@�Ĳ�:�lڡ u�<��L��������b���F�û�p�F�h�����21��8�F'��J���x8G*�lɝ��aNt�J���n*,��M`u��6�)�e�0���H$�I=¨;��M�n)��M�PIJG�l�h���jcE�+�Z�M�=2�jF���ve혼)�j�-V�dqD�lt��W��.��a`D�@����������o��C!��������i9I9��L��E,���7ӳ"�4��L���3g�y���d�-:��v5<�B������-3ͯ�q���H�/*$�.�����f�[~�4:R��ՠ���{P��!��Wt�R�b��������J���t-��� ����|{��<�Ɗ�==�3�%��k�����U��͌FJ�����̰�L�m{`F�,mZ<����[�L6CU�]�M&�Y����mgqy�$kX�$�s�(��W�=�ӤD~q��?�P�_���U�@��i���,�e�p�Uf>�Bc>�J�x�x.��%:��O�4Q��b���ϗg��d����6'��~f��&}#=,��R�g�s�W�%�@A����"U��Y�Hp���#�y�H�ܒ�0R��g�bRM�wS��d�MB�a�DL��,!o(�3d1�n��l'2"��W1�;�H��C&����&&OG���������/f&#��n��(棛��qś�����h�]]T��1�q��4�
��L#Ãq��3�]�Fb>�I�N\ �W�ֵ=��s�or�XE�)�Enpb�*�����{���f�*�h��#���d}HD<哗4�ԉ��b����խ9��+H��ٺCa$e77���#)*`3Z��W\m�����m�vS�7�f�fᇇ�'QI	��µ�i�^�T:�Y���m?I��fJK��UC�~+:i����f�6L5�e��2>I[��,.Ē+>�o/<�N{0�:�zo8iE���`�L:4��*���M)���zヌ���t�N�5�'�e�x�*a�T2����w�x�х�<.�b[�)�2R3!�IuY^t/�!��"b�����d�6W/��_+�x��UEC� ��*ș��o!���L��an
���A���i�dո$�]��&Y=}�Ψ���1M���Op�ˆ'��+\�Ŧ|��5R6ՋD�,�צ�dW��<�A˵L��*Eň3e�)�dS/��YI��W�& iڙLNNUL��Z�N���Ҍs�P���E6��;�a��u4�w#\���7KL����\!�u9�J_����$��^�%��;N�'W�s�̮/�ݛ��hzM��>��ӎ+���5O�����oj^9��!֪��e:�?�z�nB����������_�iK�fHn��e�; (�Dƽ�|���k������B�D�IS5�6}��]���@���|�r�R
��2��H��\J�)k<$��(��=��mvV����c���dW�B���*�[Q6��KU6�6��ޮ�
wr��&2�|2ў��֤wrٟ:I1�����)2>2Y�>Y��"0�h���SJ�)�
s��5t�hB�z�!����֦��m6!W5م�Su;j�,I������&Δ�8S�FV�h��=��|4�L ?ʱ�L��*Ο0��Y֝�	���ݻ���p{��f&���C����h��@��d�h�1k=��^kI��wr�`f�Y$�,9(f������_�ԭ`t6(.��W�W���O4�n�`_���a㏜P�a�^M�����]�ك
b׉�+l���R�R�����F�%�[
��A���d������Y��z>Ц�)޾����n�k[�N�>�Ȏv���5͠�~�Æ��fl�Ήܱ��P)�2�ܷ+�v�1�ԯ���C���<t�q7l�8>䢹����_�������n۩ �<������{�ubyQ�o���e�H�P��3���2�;�*�E���Kj�� k\z�s�lq�p;\b�٢r����6Xڟ��oχ-Cg�(%./������00���<�d��n��1g�U�{o6���M%��҉����Ӧ��h,�+$���+*�9{W   \qkQ��'�~4�G���U:����N2�m#����C�X;�J����E�
�	V�Ķ��򩌋>2B/�^�(:�CP�F��|�b�&f����%ÂS��ݭgz�����ݰG_�M�@EHk�"X�۰>p�:9P�2 @3T3�&�%��Ĭ�'f������������zsh2��g6LJ�Q�T\T��է�o6�GYJ^7B�|}H<z�wa]�g�����bn�+_��Cj�N_�L�d����PP�L�X}��?U�T���㓫w�pc��egs^9�]��3�L�S�j�5V>�t��;�!k��@o]��2�|m����ޏ�-��n���^2�Wk�-�Ȇ寐���Hn�]�G,��v���I	��ge �/[J���E՟Ն�V���Lr
[�Z�݉GH�������.T����9��m����AJ�nbOa.�J��'ؖ��*%��d�D�����u� ��ЮZa� ����PKs|��0��q��ug��ԗ��7�s��'�n]�˄��X��aE���mm�P7�hU�����z-ј�Nonu���������&�i"}!w��,W<{o�,c%\;��!�WcW��ƣX�u�Ǚ��Tw�K=s�bV�P5�I���y8x�i:�La���D� ++�S!Y���>=E���j!d�� \뛐:��V̵sbރB���L�t�.�7=���N�,���G��{@]���A6w�3b&Gu����Үg��['6�U�pw~fG?���:k��2H�](-�b�,؅w�<�ܮ̧�9��M�BȍcN��l�&�z?�f�U}��Ѩr;�D�����d7☍u4��,[K��Y8��.��P�� 'K�����n�~�G��I��}��	����QD�p�&�5�I��;��H�yA��+�bCL�g%��Oؗ�s�!�	M�(vO]`����v<�,A�0$�M�r�ړY��H�,6�SDTFI��^��`�F����K�����J漕O�ǵ&��3wҹ��{�%��3�/d;*����F[޿w���`��$��7b;'ڶZ,�	6B�N������C)ͮ1_+*����lt��f6yA2�]n�;�%RR���<�)�e�#�r���c7�f���AY�×Ej_Z����q��,�]9��HL�����m�����i�l��^�%��'f�,Wؽ�|���.d������\���C�3 #�ބ_�L��ج��W!_�2�m����
�mrpU�X�D���6#y	m{:OTqt|6oԷ��;�OM�+�4�UB�6o��Z��śo���5�W�e^��=:��t����{e�Yqm������	���D�w��౛�(>�N2ޓ��g�֤L�Խ{Č�_�$l�|����ui�b��w4,��X��� _���F$�o{rD"�&|ڑ�]��krs/&"���<B�u�5!�s�g��2�|�=7����R J��#�<o&�葌_��=j?@�~
���ȝ�rmh�I��GA˟��܂A�L�.���"q�t���at�9��o$�'���3��@$M0Q�*n$�E&��e��xiHF4��q!&��!�FU��K�HgEW�zw^�F
��_��4+v�-�&]��K�Kkד�{{�J�܇�����;�ł��b0��(�yZ�͛�hmU����/��۬�r�L�$�.IDd��,8BFo����(�����Į�+�oL٨�� ҆>6�OJ��ql�o�b)Oo�3:�w����
zi�6'i4�{&���>}�/>���      �   (  x�m��n�@ E��Wt���eM:TP�I��fp ������֕o���.N�Af4�����H�5�Q%��W�f�gL��f�.-	g��jl�)+Ԥ�<S��m�N��!��%�~��ĀpJ(�J
����\<�Gvls��T^cdѺ�|+1��l�SK:����7�����减�U�Zcn�nZه��>��1q�,��~`4�Ђ�O��H��n�"���5���O/�`�DJ��Ϊ����n�B]�q2�Z�ʈ{�O?�~I����g�����>�u� ���~            x������ � �            x������ � �     