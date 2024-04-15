﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Domain.Entity
{
    public class OrderDetail
    {
        public Guid Id { get; set; }
        public Order? Order { get; set; }
        public Guid OrderId { get; set; }
        public Guid ProductId { get; set; }

        public Product? Product { get; set; }
        public int Quantity { get; set; }
        public decimal Total {  get; set; }
    }
}
