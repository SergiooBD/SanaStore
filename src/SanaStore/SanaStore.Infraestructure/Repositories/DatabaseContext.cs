using Microsoft.EntityFrameworkCore;
using SanaStore.Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Infrastructure.Repositories
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options) { }
        public DbSet<Categories> categories { get; set; }
        public DbSet<Customer> customers { get; set; }
        public DbSet<Order> orders { get; set; }
        public DbSet<OrderDetail> ordersDetails { get; set; }
        public DbSet<OrderState> orderStates { get; set; }
        public DbSet<Product> product { get; set; }
        public DbSet<ProductsXCategories> productsXcategories { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer("server=DESKTOP-N5GB4D9\\SQLEXPRESS; Database=SanaStore;User ID=sa; Password=Admin123; Trusted_Connection=true;TrustServerCertificate=true");

        //}
    }
}
