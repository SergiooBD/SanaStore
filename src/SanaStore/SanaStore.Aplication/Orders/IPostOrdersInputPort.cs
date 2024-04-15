using SanaStore.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Application.Orders
{
    public interface IPostOrdersInputPort
    {
        Task Handle(OrderDTO orderDTO);
    }
}
