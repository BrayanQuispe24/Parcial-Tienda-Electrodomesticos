import { HttpClient } from '@angular/common/http';
import { inject, Injectable, signal } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment.development';
import { Productos } from '../models/productos.interface';


@Injectable({
  providedIn: 'root'
})
export class ProductoApiService {
  private http = inject(HttpClient);
  private router = inject(Router);
  private apiUrl = environment.apiUrl;

  //productos
  public productList = signal<Productos[]>([]);

  //Manejo de productos
  public getAllProducts() {
    this.http.get<Productos[]>(`${this.apiUrl}producto/producto_with_information`)
      .subscribe((resp) => {
        const listProduct: Productos[] = resp.map((producto) => {
          const productoDate: Productos = {
            id: producto.id,
            descripcion: producto.descripcion,
            costo: producto.costo,
            marca: producto.marca,
            categoria: producto.categoria,
            cantidad: producto.cantidad,
            precio: producto.precio
          }
          return productoDate;
        })
        this.productList.set(listProduct);
      })

  }
  //manejo de peticiones

  constructor() { }

}
