export interface facturaImprimir {
  nombre_cliente: string,
  factura_id: number,
  fecha: string,
  total: number,
  producto: string,
  cantidad: number,
  precio_unitario: number,
  subtotal: number
}
