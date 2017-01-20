using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Web.Http;

namespace SwiftList.WebApi.App_Start
{
  public static class JsonConvertConfig
  {
    public static void Configure()
    {
      JsonConvert.DefaultSettings = () => new JsonSerializerSettings
      {
          Formatting = Formatting.Indented,
          ContractResolver = new CamelCasePropertyNamesContractResolver()
      };

      GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings = JsonConvert.DefaultSettings();
    }
  }
}