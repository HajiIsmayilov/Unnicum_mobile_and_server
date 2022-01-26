using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Unnicum_Server.Models;
using Unnicum_Server.Models.Enums;
using Unnicum_Server.Repo;
using Unnicum_Server.ViewModels;

namespace Unnicum_Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ChallengeController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public ChallengeController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> ChallengeAdd([FromBody] PostAddRequest model)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Username == model.Username);

                if (user == null)
                    return BadRequest("User not found");

                Post challengerPost = new()
                {
                    Stream = model.Video,
                    Address = model.Address,
                    Description = model.Description,
                    Date = model.Date,
                    CanSeeChild = model.CanSeeChild,
                    SubCategory = model.SubCategory,
                    AreaLevel = model.AreaLevel
                };

                user.Posts.Add(challengerPost);

                _unitOfWork.UserRepository.Update(user);

                var challengedPost = await _unitOfWork.PostRepository.GetAsync(p =>
                    p.User != null && challengerPost.User != null && p.SubCategory == model.SubCategory
                    && p.PostStatus == PostStatus.Active && challengerPost.User.Username != p.User.Username);

                if (challengedPost == null)
                    return Ok(new ChallengePostAddResponse(challengerPost));

                Challenge challenge = new()
                {
                    ChallengedPost = challengedPost,
                    ChallengerPost = challengerPost,
                    Started = DateTimeOffset.Now,
                    Ended = DateTimeOffset.Now.AddDays(3),
                };

                challengerPost.PostStatus = PostStatus.Passive;

                challengedPost.PostStatus = PostStatus.Passive;

                _unitOfWork.ChallengeRepository.Add(challenge);

                await _unitOfWork.SaveAsync();

                return Ok(new ChallengePostAddResponse(challengerPost, challengedPost));
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return BadRequest();
            }
        }

        [HttpPost("ChallengeAddComment")]
        public async Task<IActionResult> ChallengeAddComment([FromBody] ChallengeAddCommentRequest model)
        {
            try
            {
                var challenge = await _unitOfWork.ChallengeRepository.GetAsync(p => p.Id == model.ChallengeId);

                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Id == model.UserId);

                if (challenge == null || user == null)
                    return BadRequest();

                challenge.ChallengeComments.Add(new ChallengeComment()
                {
                    Comment = new Comment
                    {
                        Content = model.Content,
                        User = user
                    }
                });

                _unitOfWork.ChallengeRepository.Update(challenge);

                await _unitOfWork.SaveAsync();

                return Ok(new { Message = "Comment added" });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("ChallengeAddLike")]
        public async Task<IActionResult> PostAddLike([FromBody] ChallengeAddLikeRequest model)
        {
            try
            {
                var challenge = await _unitOfWork.ChallengeRepository.GetAsync(p => p.Id == model.ChallengeId);

                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Id == model.UserId);

                if (challenge == null || user == null)
                    return BadRequest();

                challenge.ChallengeLikes.Add(new ChallengeLike
                {
                    Like = new Like
                    {
                        UserId = model.UserId
                    }
                });

                _unitOfWork.ChallengeRepository.Update(challenge);

                await _unitOfWork.SaveAsync();

                return Ok(new { Message = "Like added" });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("VoteAdd")]
        public async Task<IActionResult> VoteAdd([FromBody] VoteAddRequest model)
        {
            _unitOfWork.VoteRepository.Add(new Vote
            {
                SelectedUserId = model.SelectedUserId,
                VotedUserId = model.VotedUserId
            });

            await _unitOfWork.SaveAsync();

            return Ok(new { Message = "Vote Added" });
        }
    }
}
