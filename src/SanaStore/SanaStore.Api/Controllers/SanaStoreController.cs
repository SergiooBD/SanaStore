using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SanaStore.Application.UseCases;
using SanaStore.Infrastructure.Repositories;
using SanaStore.Application.Products;
using SanaStore.Infrastructure.Presenters;
using SanaStore.Application.DTO;
using SanaStore.Application.Orders;

namespace SanaStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanaStoreController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly IGetProductsInputPort getProductsInputPort;
        private readonly IGetProductsOutputPort getProductsOutputPort;
        private readonly IPostOrdersInputPort postOrdersInputPort;

        public SanaStoreController(DatabaseContext context, IGetProductsInputPort getProductsInputPort, IGetProductsOutputPort getProductsOutputPort, IPostOrdersInputPort postOrdersInputPort)
        {
            _context = context;
            this.getProductsInputPort = getProductsInputPort;
            this.getProductsOutputPort = getProductsOutputPort;
            this.postOrdersInputPort = postOrdersInputPort;
        }

        [HttpGet("GetProducts")]
        public async Task<ActionResult> Getproducts()
        {
            await getProductsInputPort.Handle();
            var response = ((IPresenter<List<ProductDTO>>)getProductsOutputPort).Content;
            return Ok(response);
        }

        [HttpPost("CreteOrder")]
        public async Task<OrderDTO> ProcessOrder(OrderDTO Order)
        {
            return await postOrdersInputPort.CreateOrder(Order);
        }

    }
}
