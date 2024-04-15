using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Application;
using SanaStore.Application.DTO;
using SanaStore.Application.Products;

namespace SanaStore.Infrastructure.Presenters
{
    internal class GetProdutosPresenter: IGetProductsOutputPort, IPresenter<List<ProductDTO>>
    {
        public List<ProductDTO> Content { get; private set; }

        public Task Handle(List<ProductDTO> products)
        {
            Content = products;
            return Task.CompletedTask;
        }

    }
}
