using CmiRrhh.Domain.Auth;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace CmiRrhh.Web.Auth;

public static class AuthClaimFactory
{
    public static ClaimsPrincipal CreatePrincipal(LoginResult result)
    {
        var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, result.IdUsuario.ToString()),
            new(ClaimTypes.Name, result.DisplayName),
            new(AuthConstants.IdEmpleadoClaimType, result.IdEmpleado?.ToString() ?? string.Empty),
            new(AuthConstants.PasswordChangeClaimType, result.RequiereCambioPassword ? "true" : "false")
        };

        claims.AddRange(result.Roles.Select(role => new Claim(ClaimTypes.Role, role)));

        var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        return new ClaimsPrincipal(identity);
    }

    public static int? GetIdUsuario(ClaimsPrincipal user)
    {
        var value = user.FindFirstValue(ClaimTypes.NameIdentifier);
        return int.TryParse(value, out var id) ? id : null;
    }

    public static int? GetIdEmpleado(ClaimsPrincipal user)
    {
        var value = user.FindFirstValue(AuthConstants.IdEmpleadoClaimType);
        return int.TryParse(value, out var id) ? id : null;
    }

    public static ClaimsPrincipal WithoutPasswordChange(ClaimsPrincipal user)
    {
        var claims = user.Claims
            .Where(c => c.Type != AuthConstants.PasswordChangeClaimType)
            .ToList();
        claims.Add(new Claim(AuthConstants.PasswordChangeClaimType, "false"));
        var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
        return new ClaimsPrincipal(identity);
    }
}
