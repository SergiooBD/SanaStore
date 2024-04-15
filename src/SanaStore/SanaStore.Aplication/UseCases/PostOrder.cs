using SanaStore.Application.Orders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Application.Orders;
using SanaStore.Domain.Entity;
using SanaStore.Application.Builders;
using SanaStore.Application.Products;
using SanaStore.Domain.Abstractions;
using SanaStore.Application.DTO;

namespace SanaStore.Application.UseCases
{
    public class PostOrder : IPostOrdersInputPort
    {
        private readonly IPostOrderOutputPort postOrderOutputPort;
        private readonly IOrderRepository orderRepository;
        private readonly OrderBuilder orderBuilder;

        public PostOrder(IOrderRepository orderRepository, OrderBuilder orderBuilder, IPostOrderOutputPort postOrderOutputPort)
        {
            this.postOrderOutputPort = postOrderOutputPort;
            this.orderRepository = orderRepository;
            this.orderBuilder = orderBuilder;
        }

        public async Task Handle(OrderDTO orderDTO)
        {
            var order = orderBuilder.Convert(orderDTO);
            //var listProduct = await orderRepository.PostOrder(orderDTO);
            await postOrderOutputPort.Handle(orderDTO);
        }
        
       
    }
}
