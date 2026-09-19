using CmiRrhh.Domain.Auth;

namespace CmiRrhh.Web.Middleware;

public sealed class RequirePasswordChangeMiddleware
{
    private readonly RequestDelegate _next;

    public RequirePasswordChangeMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        if (context.User.Identity?.IsAuthenticated == true
            && context.User.HasClaim(AuthConstants.PasswordChangeClaimType, "true"))
        {
            var path = context.Request.Path;
            if (!path.StartsWithSegments("/Account/ChangePassword")
                && !path.StartsWithSegments("/Account/Logout")
                && !path.StartsWithSegments("/Account/AccessDenied")
                && !path.StartsWithSegments("/Error"))
            {
                context.Response.Redirect("/Account/ChangePassword");
                return;
            }
        }

        await _next(context);
    }
}
