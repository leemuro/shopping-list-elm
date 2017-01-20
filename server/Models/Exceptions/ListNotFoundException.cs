using System;

namespace SwiftList.WebApi.Models.Exceptions
{
  public class ListNotFoundException : Exception
  {
    public ListNotFoundException(string name)
      : base("The list '" + name + "' was not found.")
    { }
  }
}