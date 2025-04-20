import { ChangeDetectionStrategy, Component, computed, inject } from '@angular/core';
import { ListaFacturasComponent } from "../components/ventas-facturas/lista-facturas/lista-facturas.component";
import { VentasServiceService } from '../../services/ventasService.service';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable';
import { Facturas } from '../../models/factura.interface';

@Component({
  selector: 'app-ventas-page',
  imports: [ListaFacturasComponent],
  templateUrl: './ventas-page.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class VentasPageComponent {
 facturaService=inject(VentasServiceService);
 lista = computed(() => (this.facturaService.listaFacturas()));

 exportPDFFacturas() {
  const doc = new jsPDF();

  const fecha = new Date();
  const fechaStr = fecha.toLocaleDateString('es-ES', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric'
  });

  // Título y Fecha
  doc.setFontSize(16);
  doc.text('Reporte de Facturas', 14, 15);
  doc.setFontSize(10);
  doc.text(`Fecha: ${fechaStr}`, 14, 22);

  // Totales
  let totalGeneral = 0;
  const totalPorEstado: { [estado: string]: number } = {};

  // Cuerpo
  const filas = this.lista().map((f: Facturas) => {
    totalGeneral += f.total;

    if (!totalPorEstado[f.estado]) {
      totalPorEstado[f.estado] = 0;
    }
    totalPorEstado[f.estado] += f.total;

    return [
      f.id,
      f.fecha,
      f.total.toFixed(2),
      f.estado,
      f.metodo_id,
      f.cliente_id
    ];
  });

  // Mostrar totales antes de la tabla
  let y = 30;
  doc.setFontSize(12);
  doc.text(`Total General de Ventas: $${totalGeneral.toFixed(2)}`, 14, y);
  y += 8;

  doc.setFontSize(11);
  doc.text('Totales por Estado:', 14, y);
  y += 6;

  for (const estado in totalPorEstado) {
    const monto = totalPorEstado[estado];
    doc.text(`- ${estado}: $${monto.toFixed(2)}`, 20, y);
    y += 6;
  }

  // Tabla principal debajo de los totales
  autoTable(doc, {
    startY: y + 5,
    head: [['ID', 'Fecha', 'Total', 'Estado', 'Método ID', 'Cliente ID']],
    body: filas,
    styles: { fontSize: 10 },
    headStyles: { fillColor: [0, 150, 136] },
  });

  // Guardar
  doc.save('reporte_facturas.pdf');
}


  ngOnInit(): void {
    this.facturaService.obtenerTodasLasFacturas();
  }

 }
