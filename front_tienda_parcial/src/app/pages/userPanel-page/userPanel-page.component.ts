import { ChangeDetectionStrategy, Component, inject, signal } from '@angular/core';
import { UserListComponent } from "./userList/userList.component";
import { RouterOutlet } from '@angular/router';
import { CreateUserComponentComponent } from "./createUser-component/createUser-component.component";
import { ModalService } from '../../services/modal.service';
import { UpdateUserComponentComponent } from "./updateUser-component/updateUser-component.component";
import { SearchUserComponent } from "./searchUser/searchUser.component";
import { ShowUserSearchedComponent } from "./showUserSearched/showUserSearched.component";
import { PermissionsComponent } from "./permissions/permissions.component";

@Component({
  selector: 'app-user-panel-page',
  imports: [CreateUserComponentComponent, UserListComponent, UpdateUserComponentComponent, SearchUserComponent, ShowUserSearchedComponent, PermissionsComponent],
  templateUrl: './userPanel-page.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class UserPanelPageComponent {
  showModal = signal<boolean>(true);
  modalCreateService=inject(ModalService);
  modalUpdateUserService=inject(ModalService);
  modalSearchedService=inject(ModalService);
  mostrarUsuarioBuscado=inject(ModalService);
  modalPermisosService=inject(ModalService);

}
