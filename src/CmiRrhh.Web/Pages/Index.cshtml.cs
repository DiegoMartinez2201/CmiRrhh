using System.Security.Claims;
using CmiRrhh.Web.Auth;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages;

[Authorize]
public class IndexModel : PageModel
{
    public string DisplayName { get; private set; } = string.Empty;

    public int? IdEmpleado { get; private set; }

    public IReadOnlyList<string> Roles { get; private set; } = Array.Empty<string>();

    public void OnGet()
    {
        DisplayName = User.Identity?.Name ?? "usuario";
        IdEmpleado = AuthClaimFactory.GetIdEmpleado(User);
        Roles = User.FindAll(ClaimTypes.Role).Select(c => c.Value).ToList();
    }
}
