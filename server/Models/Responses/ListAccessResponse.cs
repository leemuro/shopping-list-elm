using SwiftList.WebApi.Models.Utility;
using System;
using System.Web.Http.Routing;

namespace SwiftList.WebApi.Models.Responses
{
  public class ListAccessResponse
  {
    #region Injection

    private UrlHelper urlHelper = new AbsolutePathUrlHelper();

    public ListAccessResponse(UrlHelper urlHelper)
    {
      this.urlHelper = urlHelper ?? this.urlHelper;
    }

    #endregion

    public ListAccessResponse()
    { }

    public virtual Response Build(List list)
    {
      if(list == null)
        throw new ArgumentNullException("list");

      var data = new
      {
        openUrl = urlHelper.Route("ListOpen", new { list.Name }),
        saveUrl = urlHelper.Route("ListSave", new { list.Name }),
        contents = list.Contents
      };
      return Response.ForSuccess(data);
    }
  }
}