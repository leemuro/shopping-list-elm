using System.Linq;
using System.Web.Http;
using System.Web.Routing;

namespace SwiftList.WebApi.Controllers
{
  [Route("")]
  public class HomeController : ApiController
  {
    [Route(""), HttpGet]
    public IHttpActionResult Index()
    {
      var routes = WebApiConfig.AttributeRoutes.Routes
        .Where(x => !string.IsNullOrEmpty(x.Route.RouteTemplate))
        .Select(x => x.Route.RouteTemplate )
      .ToList();

      return Ok(routes);
    }
  }
}
