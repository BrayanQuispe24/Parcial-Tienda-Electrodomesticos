import { ChangeDetectionStrategy, Component, computed, inject, signal } from '@angular/core';
import { ListaFacturasComponent } from "../components/ventas-facturas/lista-facturas/lista-facturas.component";
import { VentasServiceService } from '../../services/ventasService.service';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable';
import { Facturas } from '../../models/factura.interface';
import FileSaver from 'file-saver';
import * as XLSX from 'xlsx';
import { ProductoApiService } from '../../services/productoApi.service';
import { ClienteServiceService } from '../../services/clienteService.service';
import { ToastrService } from 'ngx-toastr';
import { HttpErrorResponse } from '@angular/common/http';
@Component({
  selector: 'app-ventas-page',
  imports: [ListaFacturasComponent],
  templateUrl: './ventas-page.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class VentasPageComponent {
  productoService = inject(ProductoApiService);
  clienteService = inject(ClienteServiceService);
  facturaService = inject(VentasServiceService);
    private toastr = inject(ToastrService);
  lista = computed(() => (this.facturaService.listaFacturas()));
  fechaInicio = signal<string>('');
  fechaFinal = signal<string>('');

  listaProductos = computed(() => (this.productoService.productList()));
  listaClientes = computed(() => (this.clienteService.listaClientes()));
  listaDetalles=computed(()=>(this.facturaService.listDetalles()));

  nombreProducto = signal<string>('');
  nombreCliente = signal<string>('');
  total = signal<number>(0);
  fecha = signal<string>('');
  estado = signal<string>('');
  cantidad = signal<string>('5');


  idProducto = signal<number>(0);
  idCliente = signal<number>(0);
  idFactura = signal<number>(0);

  private idMetodo: number = 4;

  public buscarProducto() {
    const nombreProducto = this.nombreProducto();
    const producto = this.listaProductos().find((producto) => (producto.descripcion == nombreProducto));
    if (producto) {
      return producto.id;
    } else {
      return 0;
    }
  }

  public buscarCliente() {
    const nombreCliente = this.nombreCliente();
    const cliente = this.listaClientes().find((cliente) => (cliente.nombre == nombreCliente));
    if (cliente) {
      return cliente.id;
    } else {
      return 0;
    }
  }
  //todo: agregar un boton para crear una factura
  public estaDisponible(id: number, cantidad: number) {
    this.facturaService.consultarStock(id, cantidad).subscribe(
      (resp) => {
        if (resp.stock_suficiente == false) {
          console.log('no hay strock Suficiente');
        }
      }
    );
  }

  public crearFactura() {
    const idCliente = this.buscarCliente();
    if (idCliente == 0) {
      console.log('cliente no encontrado o insertar cliente');
      return;
    }
    this.facturaService.crearFactura(idCliente, this.idMetodo).subscribe(
      (resp) => {
        console.log(resp);
        this.idFactura.set(resp.factura_id);
      }
    );

  }

  public insertarDetalleFactura() {
    const idFactura = this.idFactura();
    const idproducto = this.buscarProducto();
    const cantidad = +this.cantidad();
    if (idproducto == 0) {
      console.log('producto no encontrado');
      return;
    }
    this.facturaService.insertarProductoFactura(idFactura, idproducto, cantidad).subscribe(
      (resp) => {
        console.log(resp);
        this.total.set(this.total() + resp.subtotal);
      }
    );
    this.nombreProducto.set('');
    this.cantidad.set('');
  }

  public cambiarEstadoFactura() {
    //el estado lo cambiaremos mas adelante para actualizar la informacion
    const idFactura = this.idFactura();
    const estado = 'PAGADO';
    this.facturaService.cambiarEstadoFactura(idFactura, estado).subscribe({
      next: (resp: any) => {
        console.log(resp);
        this.toastr.success("Registro exitoso");
      },
      error: (e: HttpErrorResponse) => {
        const errorMessage = e.error?.detail ||
          e.error?.message ||
          "Error al registrar una venta";

        this.toastr.error(errorMessage, 'Error', {
          positionClass: 'toast-bottom-right',
          timeOut: 3000// Nota que se usa 'timeOut' en lugar de 'timeout'
        });
      }
    })
  }










  public mostrarI() {
    console.log(this.fechaInicio(), this.fechaFinal());
  }

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

  exportarFacturasAExcel() {

    const fechaInicio: string = this.fechaInicio();
    const fechaFin: string = this.fechaFinal();
    // Filtrar las facturas según el rango de fechas
    const facturasFiltradas = this.lista().filter(factura => {
      const fechaFactura = new Date(factura.fecha);
      const inicio = new Date(fechaInicio);
      const fin = new Date(fechaFin);
      return fechaFactura >= inicio && fechaFactura <= fin;
    });

    // Si no hay facturas en el rango de fechas, mostramos un mensaje
    if (facturasFiltradas.length === 0) {
      console.log('No se encontraron facturas en este rango de fechas');
      return;
    }

    // Mapeamos los datos a los encabezados deseados
    const encabezados = [
      { id: 'id', label: 'ID Factura' },
      { id: 'fecha', label: 'Fecha' },
      { id: 'total', label: 'Total' },
      { id: 'estado', label: 'Estado' },
      { id: 'metodo_id', label: 'Método de Pago' },
      { id: 'cliente_id', label: 'ID Cliente' }
    ];

    // Preparamos los datos para la exportación
    const datosExportados = facturasFiltradas.map(factura => ({
      'ID Factura': factura.id,
      'Fecha': factura.fecha,
      'Total': factura.total,
      'Estado': factura.estado,
      'Método de Pago': factura.metodo_id,
      'ID Cliente': factura.cliente_id
    }));

    // Creamos la hoja de trabajo
    const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(datosExportados, {
      header: encabezados.map(e => e.label),
    });

    // Creamos el libro de trabajo
    const workbook: XLSX.WorkBook = {
      Sheets: { 'Facturas': worksheet },
      SheetNames: ['Facturas']
    };

    // Convertimos a array de bytes para el archivo Excel
    const excelBuffer: any = XLSX.write(workbook, {
      bookType: 'xlsx',
      type: 'array'
    });

    // Creamos el blob para descargar el archivo
    const data: Blob = new Blob([excelBuffer], {
      type:
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8'
    });

    // Usamos FileSaver para descargar el archivo Excel
    FileSaver.saveAs(data, `facturas_${new Date().getTime()}.xlsx`);
  }

  //-------------------------------------------PARA EXPORTAR REPORTES EN EXCEL




  ngOnInit(): void {
    this.clienteService.obtenerTodosLosClientes();
    this.facturaService.obtenerTodasLasFacturas();
    this.productoService.getAllProducts();
  }

}
