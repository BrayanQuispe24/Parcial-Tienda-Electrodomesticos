import { ChangeDetectionStrategy, Component, inject } from '@angular/core';
import { ProductoApiService } from '../../services/productoApi.service';
import { ProductoListComponentComponent } from "../components/products/productoListComponent/productoListComponent.component";

@Component({
  selector: 'app-productos-page',
  imports: [ProductoListComponentComponent],
  templateUrl: './productos-page.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ProductosPageComponent {
  productService=inject(ProductoApiService);

  public mostrarProductos(){
    console.log(this.productService.productList());
  }
  ngOnInit(): void {
    this.productService.getAllProducts();
  }
 }
