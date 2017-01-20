using System;

namespace SwiftList.WebApi.Models.Responses.Api
{
  public class SaveListResponse
  {
    #region Injection

    private ListCatalog lists = new ListCatalog();
    private ListAccessResponse accessResponse = new ListAccessResponse();

    public SaveListResponse(ListCatalog lists,
      ListAccessResponse accessResponse)
    {
      this.lists = lists ?? this.lists;
      this.accessResponse = accessResponse ?? this.accessResponse;
    }

    #endregion

    public SaveListResponse()
    { }

    public Response Build(string name, string data)
    {
      if (name == null)
        throw new ArgumentNullException("name");

      try
      {
        var list = lists.Save(name, data);
        return accessResponse.Build(list);
      }
      catch (Exception e)
      {
        return Response.ForError(e.Message);
      }
    }
  }
}