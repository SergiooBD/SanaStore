using SanaStore.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Application.DTO
{
    public class OrderDTO
    {
        public Guid Id { get; set; }
        public int OrderNumber { get; set; }
        public Guid CustomerId { get; set; }

        public decimal Total { get; set; }
        public DateTime DateTime { get; set; }
        public ICollection<OrderDetailDTO>? OrderDetail { get; set; }
        public Guid OrderSatateId { get; set; }
    }
}
