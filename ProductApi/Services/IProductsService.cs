using ProductApi.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductApi.Services
{
    public interface IProductsService
    {
        public ICollection<Product> GetAll();
    }
}
