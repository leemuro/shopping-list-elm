using SwiftList.WebApi.Models.Exceptions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace SwiftList.WebApi.Models
{
  // todo: scrub list name for illegal characters?
  // todo: locking IO for reads/writes?
  public class ListCatalog
  {
    #region Injection 

    public string path = "~/App_Data/lists";
    public Func<string, string> mapPath = x => HttpContext.Current.Server.MapPath(x);

    public ListCatalog(string path, Func<string, string> mapPath)
    {
      this.path = path ?? this.path;
      this.mapPath = mapPath ?? this.mapPath;
    }

    #endregion

    public ListCatalog()
    { }

    public virtual IEnumerable<List> All()
    {
      var pathToLists = mapPath(path);
      if (!Directory.Exists(pathToLists))
        throw new DirectoryNotFoundException("Cannot find list data: " + pathToLists);

      var files = Directory.GetFiles(pathToLists)
                           .Select(x => List.FromFile(x))
                           .OrderBy(x => x.Name)
                           .ToList();

      return files;
    }

    public List Create(string name)
    {
      if (name == null)
        throw new ArgumentNullException("name");
      
      var filePath = GetFilePath(name);
      var alreadyCreated = File.Exists(filePath);

      if (alreadyCreated)
        throw new ListAlreadyCreatedException(name);

      return ReadOrCreateList(name);
    }

    public List Open(string name)
    {
      if (name == null)
        throw new ArgumentNullException("name");

      return ReadOrCreateList(name);
    }

    public List Save(string name, string data)
    {
      var filePath = GetFilePath(name);
      return List.Save(filePath, data);
    }

    private List ReadOrCreateList(string name)
    {
      var filePath = GetFilePath(name);

      if (!File.Exists(filePath))
        return List.CreateEmpty(filePath);

      return List.FromFile(filePath);
    }

    private string GetFilePath(string name)
    {
      return Path.Combine(mapPath(path), name + ".json");
    }
  }
}