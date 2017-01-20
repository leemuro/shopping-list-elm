using System;

namespace SwiftList.WebApi.Models.Responses.Api
{
  public class CreateListResponse
  {
    #region Injection

    private ListCatalog lists = new ListCatalog();
    private ListAccessResponse accessResponse = new ListAccessResponse();

    public CreateListResponse(ListCatalog lists,
      ListAccessResponse accessResponse)
    {
      this.lists = lists ?? this.lists;
      this.accessResponse = accessResponse ?? this.accessResponse;
    }

    #endregion

    public CreateListResponse()
    { }

    public Response Build(string name)
    {
      if (name == null)
        throw new ArgumentNullException("name");

      try
      {
        var list = lists.Create(name);
        return accessResponse.Build(list);
      }
      catch (Exception e)
      {
        return Response.ForError(e.Message);
      }
    }
  }
}