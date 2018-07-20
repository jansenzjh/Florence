using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NHibernate;
using Florence.Models;
using NHibernate.Linq;
using System.Linq;

namespace Florence {
    
    public class TaxRule : ObjectBase<TaxRule> {
        public virtual int id { get; set; }
        [Required]
        public virtual string RuleName { get; set; }
        [Required]
        public virtual string TaxFormat { get; set; }
        [Required]
        public virtual decimal SalaryFrom { get; set; }
        [Required]
        public virtual decimal SalaryTo { get; set; }
        [Required]
        public virtual decimal TaxPercentage { get; set; }
        [Required]
        public virtual decimal ExemptedTaxAmount { get; set; }
        [Required]
        public virtual decimal AdditionalTaxAmount { get; set; }

        public virtual Guid LinkID { get; set; }

        public static List<string> TaxRuleList(Boolean includeEmptyHeader = true)
        {
            using (ISession session = NHibernateHelper.OpenSession<TaxRule>())
            {
                var list = session.Query<TaxRule>().Select(x => x.RuleName).Distinct().ToList();
                if (includeEmptyHeader)
                {
                    list.Insert(0, string.Empty);
                }
                return list;
            }
        }

        public static decimal GetTax(decimal taxableAmount, string taxRuleName)
        {
            if (string.IsNullOrEmpty(taxRuleName))
            {
                return 0;
            }
            var taxes = new TaxRule().GetObjectsValueFromExpression(x => x.RuleName.Equals(taxRuleName));
            decimal taxAmount = 0;
            if(taxes != null && taxes.Count > 0)
            {
                foreach(var tx in taxes.OrderBy(x => x.SalaryFrom).ToList())
                {
                    if(taxableAmount > tx.SalaryTo)
                    {
                        taxAmount += (tx.SalaryTo - tx.SalaryFrom - tx.ExemptedTaxAmount + tx.AdditionalTaxAmount) * tx.TaxPercentage / 100;
                    }
                    else
                    {
                        taxAmount += (taxableAmount - tx.SalaryFrom - tx.ExemptedTaxAmount + tx.AdditionalTaxAmount) * tx.TaxPercentage / 100;
                    }
                }
                return taxAmount;
            }
            return 0;
        }
    }
}
