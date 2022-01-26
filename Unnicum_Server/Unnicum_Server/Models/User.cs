using System.Text.Json.Serialization;
using Unnicum_Server.Models.Abstraction;
using Unnicum_Server.Models.Enums;

namespace Unnicum_Server.Models
{
    public record User : Entity
    {
        public string Username { get; set; }
        public string Email { get; set; }
        [JsonIgnore]
        public byte[] PasswordSalt { get; set; }
        [JsonIgnore]
        public byte[] PasswordHash { get; set; }
        public DateTimeOffset Birthday { get; set; }

        public UserStatus UserStatus { get; set; }
        public bool IsJudge { get; set; }


        public int ImageId { get; set; }
        public Media Image { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        public virtual List<RefreshToken> RefreshTokens { get; set; } = new();
        public virtual List<Notification> Notifications { get; set; } = new();
        public virtual List<ChallengeCategory> ChallengeCategories { get; set; } = new();
        public virtual List<JudgementCategory> JudgementCategories { get; set; } = new();
        public virtual List<Post> Posts { get; set; } = new();
        public virtual List<Like> Likes { get; set; } = new();
        public virtual List<Comment> Comments { get; set; } = new();
        public virtual List<Vote> VotedUserVotes { get; set; } = new();
        public virtual List<Vote> SelectedUserVote { get; set; } = new();
        public virtual List<BlockedUser> BlockedUserBlockeds { get; set; } = new();
        public virtual List<BlockedUser> WhoBlockedBlockeds { get; set; } = new();
        public virtual List<ChallengeStatistic> LoserChallengeStatistic { get; set; } = new();
        public virtual List<ChallengeStatistic> WinnerChallengeStatistic { get; set; } = new();
    }
}
