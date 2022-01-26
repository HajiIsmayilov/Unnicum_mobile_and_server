using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Challenge : Entity
    {
        public int ChallengerPostId { get; set; }
        public Post ChallengerPost { get; set; }
        public int ChallengedPostId { get; set; }
        public Post ChallengedPost { get; set; }
        public DateTimeOffset Started { get; set; }
        public DateTimeOffset Ended { get; set; }

        ////
        public virtual ChallengeStatistic? ChallengeStatistic { get; set; }

        public virtual List<Vote> Votes { get; set; } = new();
        public virtual List<ChallengeLike> ChallengeLikes { get; set; } = new();
        public virtual List<ChallengeComment> ChallengeComments { get; set; } = new();
    }
}
