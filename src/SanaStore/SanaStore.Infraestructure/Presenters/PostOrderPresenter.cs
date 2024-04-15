using SanaStore.Application.DTO;
using SanaStore.Application.Orders;
using SanaStore.Application.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Infrastructure.Presenters
{
    internal class PostOrderPresenter : IPostOrderOutputPort
    {
        public OrderDTO Content { get; private set; }

        public Task Handle(OrderDTO order)
        {
            Content = order;
            return Task.CompletedTask;
        }
    }
}
