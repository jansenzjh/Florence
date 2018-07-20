using NHibernate;
using Florence.Models;
using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;
using System.Linq.Expressions;

namespace Florence
{
    public class ObjectBase<T> where T : class, new()
    {
        #region Property

        public static int Count
        {
            get
            {
                using (ISession s = NHibernateHelper.OpenSession<T>())
                {
                    return s.Query<T>().Count();
                }
            }
        }

        #endregion

        #region Single Value Getting
        public virtual decimal SumValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, decimal>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                decimal obj = session.Query<T>().Where(whereCriteria).Sum(selectCriteria);
                return obj;
            }
        }

        public virtual int CountFromExpression(Expression<Func<T, bool>> whereCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                int obj = session.Query<T>().Where(whereCriteria).Count();
                return obj;
            }
        }

        public virtual decimal GetDecimalValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, decimal>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                decimal obj = session.Query<T>().Where(whereCriteria).Select(selectCriteria).FirstOrDefault();
                return obj;
            }
        }

        public virtual List<int> GetIntListFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, int>> selectCriteria)
        {
            using(ISession session = NHibernateHelper.OpenSession<T>())
            {
                var objs = session.Query<T>().Where(whereCriteria).Select(selectCriteria).ToList();
                return objs;
            }
        }

        public virtual List<string> GetStringListFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, string>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                var objs = session.Query<T>().Where(whereCriteria).Select(selectCriteria).ToList();
                return objs;
            }
        }

        public virtual int GetIntValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, int>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                int obj = session.Query<T>().Where(whereCriteria).Select(selectCriteria).FirstOrDefault();
                return obj;
            }
        }

        public virtual string GetStringValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, string>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                string obj = session.Query<T>().Where(whereCriteria).Select(selectCriteria).FirstOrDefault();
                return obj;
            }
        }

        public virtual DateTime GetDateTimeValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, DateTime>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                DateTime obj = session.Query<T>().Where(whereCriteria).Select(selectCriteria).FirstOrDefault();
                return obj;
            }
        }

        public virtual bool GetBooleanValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, bool>> selectCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                bool obj = session.Query<T>().Where(whereCriteria).Select(selectCriteria).FirstOrDefault();
                return obj;
            }
        }

        public virtual T GetObjectValueFromExpression(Expression<Func<T, bool>> whereCriteria, Expression<Func<T, object>> orderBy = null, bool isDesc = true)
        {

            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                if (orderBy == null)
                {
                    T obj = session.Query<T>().Where(whereCriteria).FirstOrDefault();
                    return obj;
                }
                else
                {
                    if (isDesc)
                    {
                        T obj = session.Query<T>().Where(whereCriteria).OrderByDescending(orderBy).FirstOrDefault();
                        return obj;
                    }
                    else
                    {
                        T obj = session.Query<T>().Where(whereCriteria).OrderBy(orderBy).FirstOrDefault();
                        return obj;
                    }
                    
                }
                
            }
        }

        public virtual List<T> GetObjectsValueFromExpression(Expression<Func<T, bool>> whereCriteria)
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                List<T> objs = session.Query<T>().Where(whereCriteria).ToList();
                return objs;
            }
        }

        //public virtual int Count()
        //{
        //    using (ISession s = NHibernateHelper.OpenSession<T>())
        //    {
        //        return s.Query<T>().Count();
        //    }
        //}
        #endregion

        #region store proc
        public virtual List<Object> ExecStoreProcedure(string sqlString)
        {
            return NHibernateHelper.ExecStoreProcedure(sqlString);
        }

        #endregion

        public virtual T Copy()
        {
            return (T)this.MemberwiseClone();
        }

        public static T GetById(int id)
        {
            return new ObjectBase<T>()._GetById(id);
        }

        public virtual T _GetById(int id)
        {
            return GetObjectValueFromExpression(_GetIdExpression(id));
        }

        private Expression<Func<T, bool>> _GetIdExpression(int id)
        {
            var itemParameter = Expression.Parameter(typeof(T), "item");
            var whereExpression = Expression.Lambda<Func<T, bool>>
                (
                Expression.Equal(
                    Expression.Property(
                        itemParameter,
                        "id"
                        ),
                    Expression.Constant(id)
                    ),
                new[] { itemParameter }
                );
            return whereExpression;
        }

        public virtual ResultModel Insert()
        {
            try
            {
                using (ISession session = NHibernateHelper.OpenSession<T>())
                {
                    using (ITransaction transaction = session.BeginTransaction())
                    {
                        session.Save(this);
                        transaction.Commit();

                    }
                }
                return new ResultModel { BooleanResult = true, StringResult = "Success!", ObjectResult = this };
            }
            catch (Exception e)
            {

                return new ResultModel(false, "Object cannot be inserted" + Environment.NewLine + e.Message + Environment.NewLine + e.StackTrace);
            }
        }
        public virtual ResultModel Delete()
        {
            try
            {
                using (ISession session = NHibernateHelper.OpenSession<T>())
                {
                    using (ITransaction trans = session.BeginTransaction())
                    {
                        session.Delete(this);
                        trans.Commit();
                    }
                }
                return ResultModel.SuccessResult();
            }
            catch (Exception)
            {
                return new ResultModel(false, "Object cannot be deleted");
            }
        }

        public virtual ResultModel Save()
        {
            throw new NotImplementedException();
        }

        public virtual ResultModel SaveOrUpDate()
        {
            try
            {
                using (ISession session = NHibernateHelper.OpenSession<T>())
                {
                    var objId = _GetObjectPropertyValue("id");
                    var obj = session.Query<T>().Where(_GetIdExpression((int)objId)).FirstOrDefault();
                    if (obj != null)
                    {
                        obj = this.Copy();
                        using (ITransaction transaction = session.BeginTransaction())
                        {
                            session.Merge(obj);
                            transaction.Commit();
                            return ResultModel.SuccessResult();
                        }
                    }
                    return ResultModel.FailResult();
                }
            }
            catch (Exception)
            {
                return ResultModel.FailResult();
            }
        }
        private object _GetObjectPropertyValue(string PropertyName)
        {
            return this.GetType().GetProperty(PropertyName).GetValue(this, null);
        }

        public virtual List<T> _GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession<T>())
            {
                var objs = new List<T>();
                objs = session.Query<T>().ToList();
                if(objs == null || objs.Count == 0)
                {
                    return new List<T>();
                }
                return objs;
            }
        }

        public static List<T> GetAll(Boolean includeEmptyHeader = false)
        {
            var list = new ObjectBase<T>()._GetAll();
            if (includeEmptyHeader)
            {
                list.Insert(0, new T());
            }
            return list;
        }
    }
}