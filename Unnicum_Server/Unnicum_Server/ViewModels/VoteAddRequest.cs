namespace Unnicum_Server.ViewModels
{
    public record VoteAddRequest
    {
        public int VotedUserId { get; set; }

        public int SelectedUserId { get; set; }
    }
}
