using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Application.DTO;
using SanaStore.Domain.Entity;

namespace SanaStore.Application.Builders
{
    public class OrderBuilder : BuilderBase<Order, OrderDTO>
    {
        public override Order Convert(OrderDTO obj)
        {
            return new Order()
            {
                Id = obj.Id,
                OrderNumber = obj.OrderNumber,
                CustomerId = obj.CustomerId,
                Total = obj.Total,
                DateTime = obj.DateTime,
                OrderSatateId = obj.OrderSatateId

            };
        }
        public override OrderDTO Convert(Order obj)
        {
            return new OrderDTO()
            {
                Id = obj.Id,
                OrderNumber = obj.OrderNumber,
                CustomerId = obj.CustomerId,
                Total = obj.Total,
                DateTime = obj.DateTime,
                OrderSatateId = obj.OrderSatateId
            };
        }
    }
}
