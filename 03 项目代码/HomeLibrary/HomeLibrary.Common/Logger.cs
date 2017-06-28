using log4net;
using log4net.Config;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeLibrary.Common
{
    public static class Logger
    {
        private static readonly ILog Filelog;

        static Logger()
        {
            var configFile = new FileInfo(AppDomain.CurrentDomain.BaseDirectory + "\\log4net.config");
            if (!configFile.Exists)
            {
                throw new Exception("log4net.Config文件不存在。");
            }
            XmlConfigurator.ConfigureAndWatch(configFile);
            Filelog = LogManager.GetLogger("ServiceLogger");
        }

        private static readonly object LockObject = new object();

        public enum LoggerLevel
        {
            Debug,
            Info,
            Warn,
            Error,
            Fatal
        }

        public static void WriteLog(object message)
        {
            WriteLog(message, LoggerLevel.Info, null);
        }

        public static void WriteLog(object message, LoggerLevel level, Exception exception)
        {
            lock (LockObject)
            {
                switch (level)
                {
                    case LoggerLevel.Debug:
                        Filelog.Debug(message);
                        break;
                    case LoggerLevel.Error:
                        Filelog.Error(message, exception);
                        break;
                    case LoggerLevel.Fatal:
                        Filelog.Fatal(message);
                        break;
                    case LoggerLevel.Info:
                        Filelog.Info(message);
                        break;
                    case LoggerLevel.Warn:
                        Filelog.Warn(message);
                        break;
                }
            }
        }
    }
}
