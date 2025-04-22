import { ChangeDetectionStrategy, Component, computed, inject, input, signal } from '@angular/core';
import { Facturas } from '../../../../models/factura.interface';
import { VentasServiceService } from '../../../../services/ventasService.service';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { facturaImprimir } from '../../../../models/facturaImprimir.interface';

@Component({
  selector: 'factura-item',
  imports: [],
  templateUrl: './factura-item.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class FacturaItemComponent {
  factura = input<Facturas>();
  facturaService = inject(VentasServiceService);
  listaDetalles = signal<facturaImprimir[]>([]);
  facturaActual = computed(() => (this.facturaService.facturaActual()));


  public actualizarFacturaActual() {
    const facturaRepuesto: Facturas = {
      id: 0,
      fecha: '',
      total: 0,
      estado: '',
      metodo_id: 0,
      cliente_id: 0
    }
    this.facturaService.facturaActual.set(this.factura() || facturaRepuesto);
  }

  public obtenerDetalles() {
    this.actualizarFacturaActual();
    this.facturaService.detallesParaFactura(this.facturaActual().id).subscribe((resp) => {
      const listaDetallesz: facturaImprimir[] = resp.map((detalle: facturaImprimir) => ({
        nombre_cliente: detalle.nombre_cliente,
        factura_id: detalle.factura_id,
        fecha: detalle.fecha,
        total: detalle.total,
        producto: detalle.producto,
        cantidad: detalle.cantidad,
        precio_unitario: detalle.precio_unitario,
        subtotal: detalle.subtotal
      }));

      this.listaDetalles.set(listaDetallesz);
      console.log(listaDetallesz);

      // ✅ Exportar PDF después de que se reciben los datos
      this.exportPDFFactura();
    });
  }


  exportPDFFactura() {
    const datos = this.listaDetalles();
    const doc = new jsPDF();

    if (datos.length === 0) {
      console.warn('No hay datos para exportar.');
      return;
    }

    // Obtenemos la información de la factura (todos los productos pertenecen a la misma)
    const factura = datos[0];

    // Fecha actual (emisión)
    const fecha = new Date();
    const fechaStr = fecha.toLocaleDateString('es-ES', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric'
    });

    // Ancho de página para alinear a la derecha
    const pageWidth = doc.internal.pageSize.getWidth();

    // Encabezado
    doc.setFontSize(16);
    doc.text('Factura', 14, 15); // Título a la izquierda
    doc.setFontSize(10);
    doc.text(`Fecha de emisión: ${fechaStr}`, pageWidth - 60, 15); // Fecha a la derecha

    // Detalles generales de la factura
    let y = 30;
    doc.setFontSize(12);
    doc.text(`Factura ID: ${factura.factura_id}`, 14, y);
    y += 8;
    doc.text(`Cliente: ${factura.nombre_cliente}`, 14, y);
    y += 8;
    doc.text(`Fecha de la factura: ${factura.fecha}`, 14, y);
    y += 8;
    doc.text(`Total: $${parseFloat(factura.total.toString()).toFixed(2)}`, 14, y);
    y += 10;

    // Título de la tabla
    doc.setFontSize(11);
    doc.text('Detalles de la Factura:', 14, y);
    y += 6;

    // Filas de la tabla
    const filas = datos.map((detalle) => [
      detalle.producto,
      `$${detalle.precio_unitario.toFixed(2)}`,
      detalle.cantidad,
      `$${detalle.subtotal.toFixed(2)}`
    ]);

    // Tabla de productos
    autoTable(doc, {
      startY: y,
      head: [['Producto', 'Precio Unitario', 'Cantidad', 'Subtotal']],
      body: filas,
      styles: { fontSize: 10 },
      headStyles: { fillColor: [0, 150, 136] },
    });

    // Guardar PDF
    doc.save(`factura_${factura.factura_id}.pdf`);
  }


}
