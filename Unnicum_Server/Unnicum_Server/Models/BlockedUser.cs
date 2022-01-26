using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record BlockedUser : Entity
    {
        public int BlockedId { get; set; }
        public int WhoBlockedId { get; set; }
        public User Blocked { get; set; }
        public User WhoBlocked { get; set; }
    }
}
