using SwiftList.WebApi.Models.Exceptions;
using System;
using System.IO;

namespace SwiftList.WebApi.Models
{
  public class List
  {
    public string Name { get; set; }
    public string Contents { get; set; }
    public string FilePath { get; set; }

    public List()
    { }

    public List(string filePath)
      :this()
    {
      if (filePath == null)
        throw new ArgumentNullException("filePath");
      
      FilePath = filePath;
      Name = Path.GetFileNameWithoutExtension(filePath);
    }


    public static List Save(string filePath, string data)
    {
      var list = new List(filePath);
      list.Contents = data;

      File.WriteAllText(filePath, data);

      return list;
    }

    public static List CreateEmpty(string filePath)
    {
      var list = new List(filePath);

      using (var file = File.Create(filePath))
      { }

      return list;
    }

    public static List FromFile(string filePath)
    {
      var list = new List(filePath);

      if (!File.Exists(filePath))
        throw new ListNotFoundException(list.Name);

      using (var reader = new StreamReader(filePath))
      {
        list.Contents = reader.ReadToEnd();
      }

      return list;
    }
  }
}