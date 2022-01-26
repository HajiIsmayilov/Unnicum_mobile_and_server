using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record Like : Entity
    {
        public int UserId { get; set; }
        public User User { get; set; }

        public virtual PostLike? PostLike { get; set; }
        public virtual ChallengeLike? ChallengeLike { get; set; }
    }
}
