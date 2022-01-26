using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record ChallengeLike : Entity
    {
        public int ChallengeId { get; set; }
        public Challenge Challenge { get; set; }

        public int LikeId { get; set; }
        public Like Like { get; set; }
    }
}
