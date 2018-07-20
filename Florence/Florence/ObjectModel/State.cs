using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class State : ObjectBase<State> {
        public virtual int StateID { get; set; }
        [Required]
        public virtual string StateCode { get; set; }
        [Required]
        public virtual string StateName { get; set; }
    }
}
