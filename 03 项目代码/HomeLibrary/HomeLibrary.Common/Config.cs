using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeLibrary.Common
{
    public static class Config
    {
        /// <summary>
        /// 获取应用版本号
        /// </summary>
        public static string AppVersion
        {
            get
            {
                return ConfigurationManager.AppSettings["AppVersion"] ?? "";
            }
        }
    }
}
