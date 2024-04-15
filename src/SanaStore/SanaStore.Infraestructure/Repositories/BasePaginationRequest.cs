using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SanaStore.Infrastructure.Repositories
{
    public class BasePaginationRequest
    {
        public int NumPage { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public int MaxRecordsPage { get; set; } = 50;
    }
}
