using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.DTOs;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Web.Auth;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using IAppAuthenticationService = CmiRrhh.Domain.Auth.IAuthenticationService;

namespace CmiRrhh.Web.Pages.Account;

[Authorize]
public class ChangePasswordModel : PageModel
{
    private readonly IAppAuthenticationService _authenticationService;

    public ChangePasswordModel(IAppAuthenticationService authenticationService)
    {
        _authenticationService = authenticationService;
    }

    [BindProperty]
    [Required(ErrorMessage = "La nueva contraseña es obligatoria.")]
    [MinLength(AuthConstants.MinPasswordLength, ErrorMessage = "La contraseña debe tener al menos {1} caracteres.")]
    [DataType(DataType.Password)]
    [Display(Name = "Nueva contraseña")]
    public string NuevaPassword { get; set; } = string.Empty;

    [BindProperty]
    [Required(ErrorMessage = "Confirme la nueva contraseña.")]
    [Compare(nameof(NuevaPassword), ErrorMessage = "Las contraseñas no coinciden.")]
    [DataType(DataType.Password)]
    [Display(Name = "Confirmar contraseña")]
    public string Confirmacion { get; set; } = string.Empty;

    public string? InfoMessage { get; set; }

    public void OnGet()
    {
        if (User.HasClaim(AuthConstants.PasswordChangeClaimType, "true"))
        {
            InfoMessage = "Debe establecer una contraseña nueva antes de continuar.";
        }
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        var idUsuario = AuthClaimFactory.GetIdUsuario(User);
        if (idUsuario is null)
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToPage("/Account/Login");
        }

        var request = new ChangePasswordRequest
        {
            IdUsuario = idUsuario.Value,
            NuevaPassword = NuevaPassword,
            Confirmacion = Confirmacion
        };

        await _authenticationService.ChangePasswordAsync(request.IdUsuario, request.NuevaPassword);

        var principal = AuthClaimFactory.WithoutPasswordChange(User);
        await HttpContext.SignInAsync(
            CookieAuthenticationDefaults.AuthenticationScheme,
            principal,
            new AuthenticationProperties { IsPersistent = true, AllowRefresh = true });

        return RedirectToPage("/Index");
    }
}
