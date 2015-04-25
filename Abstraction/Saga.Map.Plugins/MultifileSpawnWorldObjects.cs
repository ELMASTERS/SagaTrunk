﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Saga.Map.Configuration;
using System.Configuration;
using System.IO;
using System.Diagnostics;

namespace Saga.Map.Plugins
{
    public class MultifileSpawnWorldObjects : 
        Saga.Factory.SpawnWorldObjects
    {

        protected override void Load()
        {            
            try
            {
                Saga.Configuration.SpawnWorldObjectSettings section = (Saga.Configuration.SpawnWorldObjectSettings)ConfigurationManager.GetSection("Saga.Factory.SpawnWorldObjects");
                if (section != null)
                {
                    foreach (FactoryFileElement element in section.FolderItems)
                    {

                        string format = element.Reader;
                        switch (element.Reader)
                        {
                            case "text/csv": format = "csv"; break;
                            case "text/xml": format = "xml"; break;
                            default: continue;
                        }


                        string[] files = Directory.GetFiles(Saga.Structures.Server.SecurePath(element.Path), String.Format("*.{0}", format));
                        foreach (string file in files)
                        {
                            WriteLine("WorldObjectsFactory (single)", "Loading world objects from {0} using format {1}", file, element.Reader);
                            LoadParameterizedStreamContent(file, element.Reader);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                HostContext.AddUnhandeldException(e);
            }
        }


    }
}
