using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Domain.Entity
{
    public class Order
    {
        public Guid Id { get; set; }
        public int OrderNumber { get; set; }
        public Customer? Customer { get; set; }
        public Guid CustomerId { get; set; }

        public decimal Total { get; set; }
        public DateTime DateTime { get; set; }
        public ICollection<OrderDetail>? OrderDetail { get; set; }
        public OrderState? OrderState { get; set; }
        public Guid OrderSatateId { get; set; }
    }
}
