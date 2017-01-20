using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Routing;

namespace SwiftList.WebApi
{
  public static class WebApiConfig
  {
    public static DirectRouteProvider AttributeRoutes = new DirectRouteProvider();

    public static void Register(HttpConfiguration config)
    {
      // Web API routes
      config.MapHttpAttributeRoutes(AttributeRoutes);
    }
  }
  
  public class DirectRouteProvider : IDirectRouteProvider
  {
    public List<RouteEntry> Routes { get; private set; }

    public DirectRouteProvider()
    {
      Routes = new List<RouteEntry>();
    }

    public IReadOnlyList<RouteEntry> GetDirectRoutes(HttpControllerDescriptor controllerDescriptor, IReadOnlyList<HttpActionDescriptor> actionDescriptors, IInlineConstraintResolver constraintResolver)
    {
      var realDirectRouteProvider = new DefaultDirectRouteProvider();
      var directRoutes = realDirectRouteProvider.GetDirectRoutes(controllerDescriptor, actionDescriptors, constraintResolver);
      // Store the routes in a property so that they can be retrieved later
      Routes.AddRange(directRoutes);
      return directRoutes;
    }
  }
}
