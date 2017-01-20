using System;
using System.Net.Http;
using System.Web;
using System.Web.Http.Routing;

namespace SwiftList.WebApi.Models.Utility
{
  public class AbsolutePathUrlHelper : UrlHelper
  {
    public AbsolutePathUrlHelper(HttpRequestMessage request)
      :base(request)
    { }

    // http://stackoverflow.com/questions/16670329/how-to-access-the-current-httprequestmessage-object-globally
    public AbsolutePathUrlHelper()
      : base(HttpContext.Current.Items["MS_HttpRequestMessage"] as HttpRequestMessage)
    { }

    public override string Route(string routeName, object routeValues)
    {
      var relative = base.Route(routeName, routeValues);
      return new Uri(HttpContext.Current.Request.Url, relative).AbsoluteUri;
    }
  }
}