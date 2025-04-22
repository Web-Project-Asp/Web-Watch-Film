using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;

namespace Web_BTL.Auth
{
    public class RoleAuthorizeAttribute : Attribute, IAuthorizationFilter
    {
        private readonly string[] _roles;

        public RoleAuthorizeAttribute(params string[] roles)
        {
            _roles = roles;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var role = context.HttpContext.Session.GetString("Admin");

            if (string.IsNullOrEmpty(role))
            {


                context.Result = new RedirectToActionResult(
    actionName: "Index",
    controllerName: "Authorize",
    routeValues: null
);

            }

        }
    }
}
