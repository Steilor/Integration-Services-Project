//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NorthwindDwh.ConceptualModel.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderDetails
    {
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public string UnitPrice { get; set; }
        public string Quantity { get; set; }
        public string Discount { get; set; }
        public int ProductsProductID { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual Orders Orders { get; set; }
    }
}
