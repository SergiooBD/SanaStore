using Microsoft.Extensions.DependencyInjection;
using SanaStore.Application.Products;
using SanaStore.Application.UseCases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Application.Builders
{
    public static class DependencyContainer
    {
        public static IServiceCollection AddBuilders(this IServiceCollection services)
        {
            services.AddScoped<ProductBuilder>();
            services.AddScoped<IGetProductsInputPort, GetProducts>();
            return services;
        }
    }
}
