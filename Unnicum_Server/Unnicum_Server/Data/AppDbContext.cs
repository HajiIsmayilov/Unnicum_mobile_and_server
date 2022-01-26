using Microsoft.EntityFrameworkCore;
using Unnicum_Server.Models;

namespace Unnicum_Server.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions opt) : base(opt) { }

        public DbSet<User>? Users { get; set; }

        public DbSet<Media>? Medias { get; set; }

        public DbSet<Notification>? Notifications { get; set; }

        public DbSet<Challenge>? Challenges { get; set; }

        public DbSet<Post>? Posts { get; set; }

        public DbSet<Category>? Categories { get; set; }

        public DbSet<ChallengeCategory>? ChallengeCategories { get; set; }

        public DbSet<JudgementCategory>? JudgementCategories { get; set; }

        public DbSet<Like>? Likes { get; set; }

        public DbSet<Comment>? Comments { get; set; }

        public DbSet<SubCategory>? SubCategories { get; set; }

        public DbSet<Vote>? Votes { get; set; }

        public DbSet<Address>? Addresses { get; set; }

        public DbSet<BlockedUser>? BlockedUsers { get; set; }

        public DbSet<ChallengeStatistic>? ChallengeStatistics { get; set; }

        public DbSet<RefreshToken>? RefreshTokens { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Media>()
                .HasOne(m => m.User)
                .WithOne(u => u.Image)
                .HasForeignKey<User>(m => m.ImageId)
                .OnDelete(DeleteBehavior.NoAction);


            modelBuilder.Entity<Notification>()
                .HasOne(n => n.User)
                .WithMany(u => u.Notifications)
                .HasForeignKey(n => n.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Address>()
                .HasOne(a => a.User)
                .WithOne(u => u.Address)
                .HasForeignKey<User>(a => a.AddressId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Media>()
                .HasOne(m => m.Notification)
                .WithOne(n => n.Image)
                .HasForeignKey<Notification>(m => m.ImageId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ChallengeCategory>()
                .HasOne(cc => cc.Category)
                .WithMany(c => c.ChallengeCategories)
                .HasForeignKey(cc => cc.CategoryId)
                .OnDelete(DeleteBehavior.NoAction);//

            modelBuilder.Entity<ChallengeCategory>()
                .HasOne(cc => cc.User)
                .WithMany(c => c.ChallengeCategories)
                .HasForeignKey(cc => cc.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<JudgementCategory>()
               .HasOne(cc => cc.Category)
               .WithMany(j => j.JudgementCategories)
               .HasForeignKey(cc => cc.CategoryId)
               .OnDelete(DeleteBehavior.NoAction);//

            modelBuilder.Entity<JudgementCategory>()
                .HasOne(cc => cc.User)
                .WithMany(c => c.JudgementCategories)
                .HasForeignKey(cc => cc.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<RefreshToken>()
                .HasOne(r => r.User)
                .WithMany(u => u.RefreshTokens)
                .HasForeignKey(r => r.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<SubCategory>()
                .HasOne(s => s.Category)
                .WithMany(c => c.SubCategories)
                .HasForeignKey(s => s.CategoryId)
                .OnDelete(DeleteBehavior.NoAction); // 

            modelBuilder.Entity<Like>()
                .HasOne(l => l.User)
                .WithMany(u => u.Likes)
                .HasForeignKey(l => l.UserId)
                .OnDelete(DeleteBehavior.NoAction); //

            modelBuilder.Entity<PostLike>()
                .HasOne(p => p.Post)
                .WithMany(p => p.PostLikes)
                .HasForeignKey(p => p.PostId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Like>()
                .HasOne(l => l.PostLike)
                .WithOne(p => p.Like)
                .HasForeignKey<PostLike>(p => p.LikeId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ChallengeLike>()
                .HasOne(c => c.Challenge)
                .WithMany(c => c.ChallengeLikes)
                .HasForeignKey(c => c.ChallengeId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Like>()
                .HasOne(l => l.ChallengeLike)
                .WithOne(c => c.Like)
                .HasForeignKey<ChallengeLike>(c => c.LikeId);

            modelBuilder.Entity<Post>()
                .HasOne(p => p.User)
                .WithMany(u => u.Posts)
                .HasForeignKey(p => p.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Media>()
                .HasOne(s => s.Post)
                .WithOne(p => p.Stream)
                .HasForeignKey<Post>(p => p.StreamId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Post>()
                .HasOne(p => p.Address)
                .WithMany(a => a.Posts)
                .HasForeignKey(p => p.AddressId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<PostComment>()
               .HasOne(p => p.Post)
               .WithMany(p => p.PostComments)
               .HasForeignKey(p => p.PostId)
               .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Comment>()
                .HasOne(l => l.PostComment)
                .WithOne(p => p.Comment)
                .HasForeignKey<PostComment>(p => p.CommentId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ChallengeComment>()
               .HasOne(p => p.Challenge)
               .WithMany(p => p.ChallengeComments)
               .HasForeignKey(p => p.ChallengeId)
               .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Comment>()
                .HasOne(c => c.ChallengeComment)
                .WithOne(c => c.Comment)
                .HasForeignKey<ChallengeComment>(c => c.CommentId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Comment>()
                .HasOne(c => c.User)
                .WithMany(u => u.Comments)
                .HasForeignKey(c => c.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Post>()
                .HasOne(p => p.SubCategory)
                .WithMany(u => u.Posts)
                .HasForeignKey(p => p.SubCategoryId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Post>()
                .HasOne(c => c.ChallengerPostChallenge)
                .WithOne(p => p.ChallengerPost)
                .HasForeignKey<Challenge>(c => c.ChallengerPostId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Post>()
                .HasOne(c => c.ChallengedPostChallenge)
                .WithOne(p => p.ChallengedPost)
                .HasForeignKey<Challenge>(c => c.ChallengedPostId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Vote>()
                .HasOne(v => v.Challenge)
                .WithMany(c => c.Votes)
                .HasForeignKey(v => v.ChallengeId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Vote>()
                .HasOne(u => u.VotedUser)
                .WithMany(v => v.VotedUserVotes)
                .HasForeignKey(u => u.VotedUserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Vote>()
                .HasOne(v => v.SelectedUser)
                .WithMany(u => u.SelectedUserVote)
                .HasForeignKey(v => v.SelectedUserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<BlockedUser>()
                .HasOne(b => b.Blocked)
                .WithMany(b => b.BlockedUserBlockeds)
                .HasForeignKey(b => b.BlockedId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<BlockedUser>()
                .HasOne(b => b.WhoBlocked)
                .WithMany(b => b.WhoBlockedBlockeds)
                .HasForeignKey(b => b.WhoBlockedId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Challenge>()
                .HasOne(c => c.ChallengeStatistic)
                .WithOne(c => c.Challenge)
                .HasForeignKey<ChallengeStatistic>(c => c.ChallengeId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ChallengeStatistic>()
                .HasOne(c => c.Loser)
                .WithMany(u => u.LoserChallengeStatistic)
                .HasForeignKey(c => c.LoserId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<ChallengeStatistic>()
                .HasOne(c => c.Winner)
                .WithMany(u => u.WinnerChallengeStatistic)
                .HasForeignKey(c => c.WinnerId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
