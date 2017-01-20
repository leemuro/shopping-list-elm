using SwiftList.WebApi.App_Start;
using System.Web.Http;

namespace SwiftList.WebApi
{
  public class WebApiApplication : System.Web.HttpApplication
  {
    protected void Application_Start()
    {
      GlobalConfiguration.Configure(WebApiConfig.Register);
      JsonConvertConfig.Configure();
    }
  }
}
