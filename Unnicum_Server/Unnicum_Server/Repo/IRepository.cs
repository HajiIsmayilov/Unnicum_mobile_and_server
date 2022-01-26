using System.Linq.Expressions;
using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Repo
{
    public interface IRepository<TEntity> where TEntity : Entity
    {
        public void Add(TEntity entity);
        public void Update(TEntity entity);
        public void Delete(TEntity entity);
        public TEntity? Get(Expression<Func<TEntity, bool>> filter);
        public Task<TEntity?> GetAsync(Expression<Func<TEntity, bool>> filter);
        public List<TEntity> GetAll(Expression<Func<TEntity, bool>>? filter = null);
        public Task<List<TEntity>?> GetAllAsync(Expression<Func<TEntity, bool>>? filter = null);
    }
}
