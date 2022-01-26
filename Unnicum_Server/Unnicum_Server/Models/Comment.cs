using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Comment : Entity
    {
        public int UserId { get; set; }
        public User User { get; set; }
        public string Content { get; set; }
        public DateTimeOffset Date { get; set; }

        public virtual PostComment? PostComment { get; set; }
        public virtual ChallengeComment? ChallengeComment { get; set; }
    }
}
