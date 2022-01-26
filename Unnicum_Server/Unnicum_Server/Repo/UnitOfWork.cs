using Unnicum_Server.Data;
using Unnicum_Server.Models;

namespace Unnicum_Server.Repo
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;

        public UnitOfWork(AppDbContext context)
        {
            _context = context;
            UserRepository = new Repository<User>(_context);

            PostRepository = new Repository<Post>(_context);

            ChallengeRepository = new Repository<Challenge>(_context);

            RefreshTokenRepository = new Repository<RefreshToken>(_context);

            BlockedUserRepository = new Repository<BlockedUser>(_context);

            VoteRepository = new Repository<Vote>(_context);

            ChallengeStatisticRepository = new Repository<ChallengeStatistic>(_context);
        }

        public IRepository<User> UserRepository { get; }
        public IRepository<Post> PostRepository { get; }
        public IRepository<Challenge> ChallengeRepository { get; }
        public IRepository<RefreshToken> RefreshTokenRepository { get; }
        public IRepository<BlockedUser> BlockedUserRepository { get; }
        public IRepository<Vote> VoteRepository { get; }
        public IRepository<ChallengeStatistic> ChallengeStatisticRepository { get; }

        public void Save()
        {
            _context.SaveChanges();
        }

        public async Task<int> SaveAsync()
        {
            return await _context.SaveChangesAsync();
        }
    }
}
