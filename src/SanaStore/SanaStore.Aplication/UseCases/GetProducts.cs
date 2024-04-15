using SanaStore.Application.Builders;
using SanaStore.Application.DTO;
using SanaStore.Application.Products;
using SanaStore.Domain.Abstractions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Application.UseCases
{
    public class GetProducts : IGetProductsInputPort
    {
        private readonly IGetProductsOutputPort getProductsOutputPort;
        private readonly IProductsRepository productsRepository;
        private readonly ProductBuilder productBuilder;

        public GetProducts(IGetProductsOutputPort getProductsOutputPort, IProductsRepository productsRepository, ProductBuilder productBuilder)
        {
            this.getProductsOutputPort = getProductsOutputPort;
            this.productsRepository = productsRepository;
            this.productBuilder = productBuilder;
        }

        public async Task Handle()
        {
            var listProduct = await productsRepository.GetProducts();
            //var Listproducts = products.ToList();
            var ToList = productBuilder.Convert(listProduct);
            await getProductsOutputPort.Handle(ToList);
        }
    }
}
