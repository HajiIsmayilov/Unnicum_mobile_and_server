using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Unnicum_Server.Data;
using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Repo
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : Entity
    {
        private readonly AppDbContext _context;

        public Repository(AppDbContext context)
        {
            _context = context;
        }

        public void Add(TEntity entity)
        {
            _context.Add(entity);
        }

        public void Delete(TEntity entity)
        {
            _context.Remove(entity);
        }

        public TEntity? Get(Expression<Func<TEntity, bool>> filter)
        {
            return _context.Set<TEntity>().FirstOrDefault(filter);
        }

        public async Task<TEntity?> GetAsync(Expression<Func<TEntity, bool>> filter)
        {
            return await _context.Set<TEntity>().FirstOrDefaultAsync(filter);
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>>? filter = null)
        {
            return filter == null
                   ? _context.Set<TEntity>().ToList()
                   : _context.Set<TEntity>().Where(filter).ToList();
        }

        public async Task<List<TEntity>?> GetAllAsync(Expression<Func<TEntity, bool>>? filter = null)
        {
            return filter == null
                  ? await _context.Set<TEntity>().ToListAsync()
                  : await _context.Set<TEntity>().Where(filter).ToListAsync();
        }

        public void Update(TEntity entity)
        {
            _context.Update(entity);
        }

    }
}
