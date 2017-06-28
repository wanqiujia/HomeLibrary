using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace HomeLibrary.Business
{
    public class TransactionHandler
    {
        public static void Execute(Action action)
        {
            using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Required, new TimeSpan(0, 20, 0)))
            {
                action();
                tran.Complete();
            }
        }

        public static T Execute<T>(Func<T> action)
        {
            using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Required, new TimeSpan(0, 20, 0)))
            {
                T t = action();
                tran.Complete();
                return t;
            }
        }

        public static TResult Execute<T, TResult>(Func<T, TResult> action, T t)
        {
            using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Required, new TimeSpan(0, 20, 0)))
            {
                TResult result = action(t);
                tran.Complete();
                return result;
            }
        }

        public static void Independent(Action action)
        {
            using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Suppress, new TimeSpan(0, 20, 0)))
            {
                action();
                tran.Complete();
            }
        }


        //public static void Execute(Action action, Model.Log log)
        //{
        //    try
        //    {
        //        using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Required, new TimeSpan(0, 20, 0)))
        //        {
        //            action();
        //            LogBusiness.AddLog(log);
        //            tran.Complete();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        log.LogTypeID = (int)LogType.SystemError;
        //        log.ID = Guid.NewGuid();
        //        log.UserName = "System";
        //        log.Message = ex.Message;
        //        log.Comment = ex.StackTrace;
        //        log.LogTime = DateTime.Now;
        //        log.IP = string.Empty;
        //        LogBusiness.AddLog(log);
        //        throw ex;
        //    }

        //}


        //public static T Execute<T>(Func<T> action, Model.Log log)
        //{
        //    try
        //    {
        //        using (TransactionScope tran = new TransactionScope(TransactionScopeOption.Required, new TimeSpan(0, 20, 0)))
        //        {
        //            T t = action();
        //            tran.Complete();
        //            LogBusiness.AddLog(log);
        //            return t;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        log.LogTypeID =(int) LogType.SystemError;
        //        log.ID = Guid.NewGuid();
        //        log.UserName = "System";
        //        log.Message = ex.Message;
        //        log.Comment = ex.StackTrace;
        //        log.LogTime = DateTime.Now;
        //        log.IP = string.Empty;
        //        LogBusiness.AddLog(log);
        //        throw ex;
        //    }

        //}



    }
}
