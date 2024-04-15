using SanaStore.Application.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Application.Products
{
    public interface IGetProductsOutputPort
    {
        Task Handle(List<ProductDTO> products);

        Task HandleProductId(bool inStock);
    }
}
