using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NHibernate;
using NHibernate.Linq;
using Florence.Models;
using System.Linq;

namespace Florence {
    
    public class Reimbursement : ObjectBase<Reimbursement> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid InstanceID { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual bool IsApproved { get; set; }

        public virtual List<ReimbursementDetail> Details {
            get
            {
                var objs = new ReimbursementDetail().GetObjectsValueFromExpression(x => x.InstanceID == InstanceID);
                if(objs != null && objs.Count > 0)
                {
                    return objs;
                }
                else
                {
                    return new List<ReimbursementDetail>();
                }
            }
            set
            {
                this.Details = value;
            }
        }
        

        


    }
}
