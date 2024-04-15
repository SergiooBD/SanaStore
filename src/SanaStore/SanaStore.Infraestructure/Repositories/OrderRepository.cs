using Microsoft.EntityFrameworkCore;
using SanaStore.Domain.Abstractions;
using SanaStore.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Infrastructure.Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly DatabaseContext context;
        public OrderRepository(DatabaseContext context)
        {
            this.context = context;
        }
        public async Task<Order> PostOrder(Order orderReg)
        {
            await context.orders.AddAsync(orderReg);
            await context.SaveChangesAsync();
            return orderReg;
        }
    }
}
