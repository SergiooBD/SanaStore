using SanaStore.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Domain.Abstractions
{
    public interface IOrderRepository
    {
        Task<Order> PostOrder(Order orderReg);
    }
}
