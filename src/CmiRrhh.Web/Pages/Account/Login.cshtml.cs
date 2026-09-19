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

[AllowAnonymous]
public class LoginModel : PageModel
{
    private readonly IAppAuthenticationService _authenticationService;

    public LoginModel(IAppAuthenticationService authenticationService)
    {
        _authenticationService = authenticationService;
    }

    [BindProperty]
    [Required(ErrorMessage = "El usuario es obligatorio.")]
    [Display(Name = "Usuario")]
    public string Login { get; set; } = string.Empty;

    [BindProperty]
    [Required(ErrorMessage = "La contraseña es obligatoria.")]
    [DataType(DataType.Password)]
    [Display(Name = "Contraseña")]
    public string Password { get; set; } = string.Empty;

    public string? ErrorMessage { get; set; }

    public IActionResult OnGet(string? returnUrl = null)
    {
        if (User.Identity?.IsAuthenticated == true
            && !User.HasClaim(AuthConstants.PasswordChangeClaimType, "true"))
        {
            return RedirectToPage("/Index");
        }

        ViewData["ReturnUrl"] = returnUrl;
        return Page();
    }

    public async Task<IActionResult> OnPostAsync(string? returnUrl = null)
    {
        ViewData["ReturnUrl"] = returnUrl;

        if (!ModelState.IsValid)
        {
            return Page();
        }

        var request = new LoginRequest { Login = Login, Password = Password };
        var result = await _authenticationService.LoginAsync(request.Login, request.Password);

        if (!result.Succeeded)
        {
            ErrorMessage = result.ErrorMessage;
            Password = string.Empty;
            return Page();
        }

        var principal = AuthClaimFactory.CreatePrincipal(result);
        await HttpContext.SignInAsync(
            CookieAuthenticationDefaults.AuthenticationScheme,
            principal,
            new AuthenticationProperties
            {
                IsPersistent = true,
                AllowRefresh = true
            });

        if (result.RequiereCambioPassword)
        {
            return RedirectToPage("/Account/ChangePassword");
        }

        if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
        {
            return LocalRedirect(returnUrl);
        }

        return RedirectToPage("/Index");
    }
}
