namespace Unnicum_Server.ViewModels
{
    public class ChallengeAddCommentRequest
    {
        public int ChallengeId { get; set; }

        public int UserId { get; set; }

        public string Content { get; set; }

        public DateTimeOffset Date { get; set; }
    }
}
