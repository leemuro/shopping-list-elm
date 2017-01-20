using Newtonsoft.Json;
namespace SwiftList.WebApi.Models
{
  public class Response
  {
    public bool IsSuccessful { get; set; }
    public string Data { get; set; }

    public static Response ForError(string message)
    {
      return new Response
      {
        IsSuccessful = false,
        Data = message
      };
    }

    public static Response ForSuccess(object data)
    {
      return new Response
      {
        IsSuccessful = false,
        Data = JsonConvert.SerializeObject(data ?? new {})
      };
    }
  }
}