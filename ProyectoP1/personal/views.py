from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.db import connection

@api_view(['POST'])
def crear_personal(request):
    data = request.data
    try:
        with connection.cursor() as cursor:
            cursor.callproc('crear_personal', [
                data['nombre'],
                data['apellido'],
                data['telefono'],
                data['direccion'],
                data['fecha_nacimiento'],
                data['rol'],
                data['usuario_id']
            ])
        return Response({'mensaje': 'Personal creado con éxito'}, status=status.HTTP_201_CREATED)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def actualizar_personal(request):
    data = request.data
    try:
        with connection.cursor() as cursor:
            cursor.callproc('actualizar_personal', [
                data['id'],
                data['nombre'],
                data['apellido'],
                data['telefono'],
                data['direccion'],
                data['fecha_nacimiento'],
                data['rol'],
                data['usuario_id']
            ])
        return Response({'mensaje': 'Personal actualizado con éxito'}, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def obtener_personal(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM obtener_personal()")
            columnas = [col[0] for col in cursor.description]
            datos = [dict(zip(columnas, fila)) for fila in cursor.fetchall()]
        return Response(datos, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def obtener_personal_id(request, id):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM obtener_personal_id(%s)", [id])
            columnas = [col[0] for col in cursor.description]
            datos = [dict(zip(columnas, fila)) for fila in cursor.fetchall()]
        return Response(datos, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
