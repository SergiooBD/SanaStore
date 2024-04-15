using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Domain.Entity;

namespace SanaStore.Domain.Abstractions
{
    public interface IProductsRepository
    {
        Task<List<Product>> GetProducts();

        Task<Product> GetProductToOrder(Guid idProduc, int quantity);
    }
}
