using SanaStore.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Domain.Entity;

namespace SanaStore.Application.Builders
{
    public class ProductBuilder: BuilderBase<Product, ProductDTO>
    {
        public override Product Convert(ProductDTO obj)
        {
            return new Product()
            {
                Id = obj.Id,
                Description = obj.Description,
                Name = obj.Name,
                ProductCode = obj.ProductCode,
                Stock = obj.Stock

            };
        }
        public override ProductDTO Convert(Product obj) {
            return new ProductDTO()
            {
                Id = obj.Id,
                Description = obj.Description,
                Name = obj.Name,
                ProductCode = obj.ProductCode,
                Stock = obj.Stock
            };
        }
    }
}
