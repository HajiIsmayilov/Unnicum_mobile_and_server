using Unnicum_Server.Models;

namespace Unnicum_Server.ViewModels
{
    public class PostCommentAddRequest
    {
        public int PostId { get; set; }

        public SubCategory SubCategory { get; set; }

        public string Username { get; set; }

        public string Content { get; set; }

        public DateTimeOffset Date { get; set; }
    }
}
