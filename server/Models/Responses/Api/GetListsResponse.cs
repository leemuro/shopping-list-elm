using System;
using System.Linq;

namespace SwiftList.WebApi.Models.Responses.Api
{
  public class GetListsResponse
  {
    #region Injection

    private ListCatalog lists = new ListCatalog();
    public GetListsResponse(ListCatalog lists)
    {
      this.lists = lists ?? this.lists;
    }

    #endregion

    public GetListsResponse()
    { }

    public Response Build()
    {
      try
      {
        var allLists = lists.All()
                            .Select(x => x.Name)
                            .ToList();

        return Response.ForSuccess(new { lists = allLists });
      }
      catch (Exception e)
      {
        return Response.ForError(e.Message);
      }
    }
  }
}