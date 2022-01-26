using Unnicum_Server.Models.Abstraction;
using Unnicum_Server.Models.Enums;

namespace Unnicum_Server.Models
{
    public record Post : Entity
    {
        public AreaLevel AreaLevel { get; set; }

        public PostStatus PostStatus { get; set; }
        public bool CanSeeChild { get; set; }
        public DateTimeOffset Date { get; set; }
        public string Description { get; set; }

        public int UserId { get; set; }
        public User? User { get; set; }
        public int StreamId { get; set; }
        public Media Stream { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        public int SubCategoryId { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual Challenge? ChallengerPostChallenge { get; set; }
        public virtual Challenge? ChallengedPostChallenge { get; set; }
        public virtual List<PostLike> PostLikes { get; set; } = new();
        public virtual List<PostComment> PostComments { get; set; } = new();
    }
}
