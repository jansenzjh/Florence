using FluentNHibernate.Cfg;
using NHibernate;
using FluentNHibernate.Cfg.Db;
using NHibernate.Tool.hbm2ddl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Florence.Models
{
    public class NHibernateHelper
    {
        public static ISession OpenSession<T>()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            ISessionFactory sessionFactory = Fluently.Configure()
                .Database(MsSqlConfiguration.MsSql2012
                .ConnectionString(connectionString)
                .ShowSql())
                .Mappings(m => m.FluentMappings.AddFromAssemblyOf<T>())
                .ExposeConfiguration(cfg => new SchemaExport(cfg).Create(false, false))
                .BuildSessionFactory();
            if (sessionFactory != null)
            {
                return sessionFactory.OpenSession();
            }
            else
            {
                throw new Exception("Session Factory is nothing");
            }

                
            
        }

        internal static ISession OpenSession()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            ISessionFactory sessionFactory = Fluently.Configure()
                .Database(MsSqlConfiguration.MsSql2012
                .ConnectionString(connectionString)
                .ShowSql())
                .ExposeConfiguration(cfg => new SchemaExport(cfg).Create(false, false))
                .BuildSessionFactory();
            //return sessionFactory.OpenSession();
            if (sessionFactory != null)
            {
                return sessionFactory.OpenSession();
            }
            else
            {
                throw new Exception("Session Factory is nothing");
            }
        }

        public static List<Object> ExecStoreProcedure(string sqlString)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                return session.CreateSQLQuery(sqlString).List<Object>().ToList();
            }
        }
    }
}