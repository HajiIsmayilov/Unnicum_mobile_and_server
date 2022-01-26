using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Vote : Entity
    {
        public int ChallengeId { get; set; }
        public Challenge Challenge { get; set; }
        public int VotedUserId { get; set; }
        public User VotedUser { get; set; }
        public int SelectedUserId { get; set; }
        public User SelectedUser { get; set; }
    }
}
