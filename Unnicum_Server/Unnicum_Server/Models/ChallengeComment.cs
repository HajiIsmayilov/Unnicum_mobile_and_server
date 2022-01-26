using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record ChallengeComment : Entity
    {
        public int ChallengeId { get; set; }
        public Challenge Challenge { get; set; }

        public int CommentId { get; set; }
        public Comment Comment { get; set; }
    }
}
