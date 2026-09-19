using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Account;

[Authorize]
public class AccessDeniedModel : PageModel
{
    public void OnGet()
    {
    }
}
