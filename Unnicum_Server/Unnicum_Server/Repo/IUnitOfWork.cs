using Unnicum_Server.Models;

namespace Unnicum_Server.Repo
{
    public interface IUnitOfWork
    {
        public IRepository<User> UserRepository { get; }
        public IRepository<Post> PostRepository { get; }
        public IRepository<Challenge> ChallengeRepository { get; }
        public IRepository<RefreshToken> RefreshTokenRepository { get; }
        public IRepository<BlockedUser> BlockedUserRepository { get; }
        public IRepository<Vote> VoteRepository { get; }
        public IRepository<ChallengeStatistic> ChallengeStatisticRepository { get; }
        public void Save();
        public Task<int> SaveAsync();
    }
}
