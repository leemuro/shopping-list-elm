using SwiftList.WebApi.Models;
using SwiftList.WebApi.Models.Responses.Api;
using System.Web.Http;

namespace SwiftList.WebApi.Controllers
{
  [RoutePrefix("api/v1/lists")]
  public class ListController : ApiController
  {
    [Route("")]
    public Response GetLists()
    {
      return new GetListsResponse().Build();
    }

    [Route("create/{name}")]
    public Response Create(string name)
    {
      return new CreateListResponse().Build(name);
    }

    [Route("open/{name}", Name = "ListOpen"), HttpGet]
    public Response Open(string name)
    {
      return new OpenListResponse().Build(name);
    }

    [Route("save/{name}", Name = "ListSave")]
    public Response Save(string name, [FromBody]string data)
    {
      return new SaveListResponse().Build(name, data);
    }
  }
}