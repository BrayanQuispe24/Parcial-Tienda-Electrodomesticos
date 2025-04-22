from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.db import connection

@api_view(['POST'])
def crear_factura(request):
    data = request.data
    try:
        with connection.cursor() as cursor:
            cursor.callproc('crear_factura', [
                data['fecha'],
                data['total'],
                data['estado'],
                data['metodo_id'],
                data['cliente_id']
            ])
        return Response({'mensaje': 'Factura creada con éxito'}, status=status.HTTP_201_CREATED)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def actualizar_factura(request):
    data = request.data
    try:
        with connection.cursor() as cursor:
            cursor.callproc('actualizar_factura', [
                data['id'],
                data['fecha'],
                data['total'],
                data['estado'],
                data['metodo_id'],
                data['cliente_id']
            ])
        return Response({'mensaje': 'Factura actualizada con éxito'}, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def obtener_facturas(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM obtener_facturas()")
            columnas = [col[0] for col in cursor.description]
            datos = [dict(zip(columnas, fila)) for fila in cursor.fetchall()]
        return Response(datos, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def obtener_factura_id(request, id):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM obtener_factura_id(%s)", [id])
            columnas = [col[0] for col in cursor.description]
            datos = [dict(zip(columnas, fila)) for fila in cursor.fetchall()]
        return Response(datos, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



@api_view(['POST'])
def crear_factura_venta(request):
    try:
        cliente_id = request.data.get('cliente_id')
        metodo_id = request.data.get('metodo_id')
        
        if not cliente_id or not metodo_id:
            return Response({'error': 'Faltan parámetros necesarios: cliente_id, metodo_id'}, status=status.HTTP_400_BAD_REQUEST)
        
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM crear_factura(%s, %s)", [cliente_id, metodo_id])
            factura_id = cursor.fetchone()[0]  # El ID de la factura creada es el primer valor retornado
        return Response({'factura_id': factura_id}, status=status.HTTP_201_CREATED)
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    
@api_view(['GET'])
def verificar_stock(request):
    try:
        producto_id = request.query_params.get('producto_id')
        cantidad = request.query_params.get('cantidad')
        
        if not producto_id or not cantidad:
            return Response({'error': 'Faltan parámetros necesarios: producto_id, cantidad'}, status=status.HTTP_400_BAD_REQUEST)

        with connection.cursor() as cursor:
            cursor.execute("SELECT existe_stock_suficiente(%s, %s)", [producto_id, cantidad])
            stock_suficiente = cursor.fetchone()[0]  # Devuelve True o False
        return Response({'stock_suficiente': stock_suficiente}, status=status.HTTP_200_OK)
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



@api_view(['POST'])
def agregar_producto_factura(request):
    try:
        factura_id = request.data.get('factura_id')
        producto_id = request.data.get('producto_id')
        cantidad = request.data.get('cantidad')
        
        if not factura_id or not producto_id or not cantidad:
            return Response({'error': 'Faltan parámetros necesarios: factura_id, producto_id, cantidad'}, status=status.HTTP_400_BAD_REQUEST)

        with connection.cursor() as cursor:
            cursor.execute("SELECT agregar_producto_a_factura(%s, %s, %s)", [factura_id, producto_id, cantidad])
            subtotal = cursor.fetchone()[0]  # El subtotal calculado para el producto agregado
        return Response({'subtotal': subtotal}, status=status.HTTP_201_CREATED)
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
def cambiar_estado_factura(request):
    try:
        factura_id = request.data.get('factura_id')
        nuevo_estado = request.data.get('nuevo_estado')
        
        if not factura_id or not nuevo_estado:
            return Response({'error': 'Faltan parámetros necesarios: factura_id, nuevo_estado'}, status=status.HTTP_400_BAD_REQUEST)

        with connection.cursor() as cursor:
            cursor.execute("SELECT cambiar_estado_factura(%s, %s)", [factura_id, nuevo_estado])
        return Response({'estado_actualizado': nuevo_estado}, status=status.HTTP_200_OK)
    
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
@api_view(['GET'])
def obtener_detalles_factura(request):
    try:
        factura_id = request.query_params.get('factura_id')

        if not factura_id:
            return Response({'error': 'Debe proporcionar el parámetro factura_id'}, status=status.HTTP_400_BAD_REQUEST)

        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM obtener_detalles_factura(%s)", [factura_id])
            columns = [col[0] for col in cursor.description]
            results = [
                dict(zip(columns, row))
                for row in cursor.fetchall()
            ]

        return Response(results, status=status.HTTP_200_OK)

    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)