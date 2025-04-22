from django.urls import path
from . import views 

urlpatterns = [
    path('obtener_facturas', views.obtener_facturas),
    path('obtener/<int:id>/', views.obtener_factura_id),
    path('crear/', views.crear_factura),
    path('actualizar/', views.actualizar_factura),
    path('crear_factura_venta/',views.crear_factura_venta),
    path('verificar_stock',views.verificar_stock),
    path('crear_detalle_factura/',views.agregar_producto_factura),
    path('cambiar_estado_factura/',views.cambiar_estado_factura),
    path('obtener_detalle_factura',views.obtener_detalles_factura)
]
