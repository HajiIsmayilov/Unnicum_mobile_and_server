using Unnicum_Server.Models;

namespace Unnicum_Server.ViewModels
{
    public record ChallengePostAddResponse(params Post[] Posts)
    {
        public Post[] Posts { get; set; } = Posts;
    }
}
