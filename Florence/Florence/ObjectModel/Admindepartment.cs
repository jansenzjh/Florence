using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {

    public class AdminDepartment : ObjectBase<AdminDepartment> {

        public virtual int id { get; set; }
        [Required]
        public virtual Company ParentID { get; set; }
        [Required]
        public virtual string DeptCode { get; set; }
        [Required]
        public virtual string Name { get; set; }
        [Required]
        public virtual string Responsibility { get; set; }
        [Required]
        public virtual string Tel { get; set; }
        public virtual string Fax { get; set; }
        [EmailAddress]
        [Required]
        public virtual string Email { get; set; }
        public virtual string Addr { get; set; }
        public virtual string PostCode { get; set; }
        public virtual string BankName { get; set; }
        public virtual string BankAccount { get; set; }
        public virtual string UserName { get; set; }
        public virtual short? AbsIndex { get; set; }
        public virtual byte ItemLevel { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual bool IsDir { get; set; }
        public virtual string Memo { get; set; }

        public virtual int ParentSID { get; set; }

        public static string DepartmentName (int deptID)
        {
            return new AdminDepartment().GetStringValueFromExpression(x => x.id == deptID, x => x.Name);
        }
    }
}
