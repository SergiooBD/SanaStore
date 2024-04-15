using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Domain.Entity
{
    public class ProductsXCategories
    {
        public Guid Id { get; set; }
        public Product Products { get; set; }
        public Categories Categories { get; set; }
    }
}
