using System;

namespace SwiftList.WebApi.Models.Exceptions
{
  public class ListAlreadyCreatedException : Exception
  {
    public ListAlreadyCreatedException(string name)
      : base("The list '" + name + "' has already been created.")
    { }
  }
}