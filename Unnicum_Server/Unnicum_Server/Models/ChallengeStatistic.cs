using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record ChallengeStatistic : Entity
    {
        public int ChallengeId { get; set; }
        public Challenge Challenge { get; set; }

        public int LoserId { get; set; }
        public User Loser { get; set; }
        public int WinnerId { get; set; }
        public User Winner { get; set; }

    }
}
