namespace Unnicum_Server.ViewModels
{
    public class PostAddCommentRequest
    {
        public int PostId { get; set; }

        public int UserId { get; set; }

        public string Content { get; set; }

        public DateTimeOffset Date { get; set; }
    }
}
