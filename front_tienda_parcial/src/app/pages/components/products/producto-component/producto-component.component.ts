import { ChangeDetectionStrategy, Component, input } from '@angular/core';
import { Productos } from '../../../../models/productos.interface';

@Component({
  selector: 'producto-component',
  imports: [],
  templateUrl: './producto-component.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ProductoComponentComponent {
  producto=input<Productos>();
}
