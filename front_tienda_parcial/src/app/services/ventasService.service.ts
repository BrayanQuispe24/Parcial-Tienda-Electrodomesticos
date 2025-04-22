import { inject, Injectable, signal } from '@angular/core';
import { Facturas } from '../models/factura.interface';
import { environment } from '../../environments/environment.development';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable, tap } from 'rxjs';
import { facturaImprimir } from '../models/facturaImprimir.interface';

@Injectable({
  providedIn: 'root'
})
export class VentasServiceService {
  private http = inject(HttpClient);
  private router = inject(Router);
  private apiUrl = environment.apiUrl;


  public listaFacturas = signal<Facturas[]>([]);

  //factura actual
  public facturaActual = signal<Facturas>({
    id: 0,
    fecha: '',
    total: 0.0,
    estado: '',
    metodo_id: 0,
    cliente_id: 0
  });

  //PARA IMPRIMIR LA FACTURA
  public listDetalles = signal<facturaImprimir[]>([]);

  public obtenerTodasLasFacturas() {
    this.http.get<Facturas[]>(`${this.apiUrl}factura/obtener_facturas`).subscribe((resp) => {
      const listaFactura: Facturas[] = resp.map((factura) => {
        const personalDate: Facturas = {
          id: factura.id,
          fecha: factura.fecha,
          total: factura.total,
          estado: factura.estado,
          metodo_id: factura.metodo_id,
          cliente_id: factura.cliente_id
        }
        return personalDate;
      })
      this.listaFacturas.set(listaFactura);
      console.log(listaFactura);
    })
  }

  public crearFactura(id_cliente: number, id_metodo: number): Observable<any> {
    const body = {
      cliente_id: id_cliente,
      metodo_id: id_metodo
    }
    console.log({ body });
    return this.http.post<any>(`${this.apiUrl}factura/crear_factura_venta/`, body).pipe(
      tap(() => {
        // después de registrar, actualizamos el signal
        this.obtenerTodasLasFacturas();
      })
    );
  }

  public insertarProductoFactura(factura_id: number, producto_id: number, cantidad: number): Observable<any> {
    const body = {
      factura_id: factura_id,
      producto_id: producto_id,
      cantidad: cantidad
    }
    return this.http.post<any>(`${this.apiUrl}factura/crear_detalle_factura/`, body);
  }

  public consultarStock(producto_id: number, cantidad: number): Observable<any> {
    const body = {
      producto_id: producto_id,
      cantidad: cantidad
    }
    return this.http.get<any>(`${this.apiUrl}factura/verificar_stock?producto_id=${body.producto_id}&cantidad${body.cantidad}`);
  }

  public cambiarEstadoFactura(factura_id: number, nuevo_estado: string) {
    const body = {
      factura_id: factura_id,
      nuevo_estado: nuevo_estado
    }

    return this.http.post<any>(`${this.apiUrl}factura/cambiar_estado_factura/`, body).pipe(
      tap(() => {
        // después de registrar, actualizamos el signal
        this.obtenerTodasLasFacturas();
      })
    );
  }

  public detallesParaFactura(id: number):Observable<any> {
    return this.http.get<facturaImprimir[]>(`${this.apiUrl}factura/obtener_detalle_factura?factura_id=${id}`);
  }



  constructor() { }

}
