using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record PostLike : Entity
    {
        public int PostId { get; set; }
        public Post Post { get; set; }

        public int LikeId { get; set; }
        public Like Like { get; set; }
    }
}
