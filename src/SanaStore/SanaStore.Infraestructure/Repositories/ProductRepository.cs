using Microsoft.EntityFrameworkCore;
using SanaStore.Domain.Abstractions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanaStore.Domain.Entity;

namespace SanaStore.Infrastructure.Repositories
{
    public class ProductRepository : IProductsRepository
    {   
        private readonly DatabaseContext context;
        public ProductRepository(DatabaseContext context)
        {
            this.context = context;
        }
        public async Task<List<Product>> GetProducts()
        {
            var products = await context.product.Where(c=> c.Stock > 0).ToListAsync();
            return products;
        }
        public async Task<Product> GetProductId(Guid idProduc, int quantity)
        {
            var product = await context.product.Where(c => c.Id == idProduc && c.Stock >= quantity).FirstAsync();
            return product;
        }
    }
}
