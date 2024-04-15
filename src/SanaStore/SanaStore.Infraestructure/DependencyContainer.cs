using Microsoft.Extensions.DependencyInjection;
using SanaStore.Application.Orders;
using SanaStore.Application.Products;
using SanaStore.Domain.Abstractions;
using SanaStore.Infrastructure.Presenters;
using SanaStore.Infrastructure.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Infrastructure
{
    public static class DependencyContainer
    {
        public static IServiceCollection AddPresenters(this IServiceCollection services)
        {
            services.AddScoped<IGetProductsOutputPort, GetProdutosPresenter>();
            services.AddScoped<IPostOrderOutputPort, PostOrderPresenter>();
            services.AddScoped<IProductsRepository, ProductRepository>();
            return services;
        }
    }
}
