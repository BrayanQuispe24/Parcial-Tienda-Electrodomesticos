import { inject } from '@angular/core';
import { ActivatedRouteSnapshot, Router, CanActivateFn } from '@angular/router';
import { UserApiService } from '../services/userApi.service';

export const authGuardGuard: CanActivateFn = (route: ActivatedRouteSnapshot) => {
  const authService = inject(UserApiService);
  const router = inject(Router);

  const authData = authService.dataAuth(); // { token: string, rol: string }
  const isLoggedIn = authData.token.length > 0;

  if (!isLoggedIn) {
    router.navigate(['/login']);
    return false;
  }

  const userRole = authData.role; // por ejemplo: "SELLER"
  const allowedRoles = route.data?.['roles'] as string[] | undefined;

  // Si no se especificaron roles, permitimos el acceso por defecto
  if (!allowedRoles || allowedRoles.length === 0) {
    return true;
  }

  const canAccess = allowedRoles.includes(userRole);

  if (!canAccess) {
    router.navigate(['/dashboard']); // o un /acceso-denegado
  }

  return canAccess;
};
