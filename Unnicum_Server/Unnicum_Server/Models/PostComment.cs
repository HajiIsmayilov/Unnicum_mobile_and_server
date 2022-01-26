using Unnicum_Server.Models.Abstraction;

namespace Unnicum_Server.Models
{
    public record PostComment : Entity
    {
        public int PostId { get; set; }
        public Post Post { get; set; }

        public int CommentId { get; set; }
        public Comment Comment { get; set; }
    }
}
