using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Unnicum_Server.Models;
using Unnicum_Server.Repo;
using Unnicum_Server.ViewModels;

namespace Unnicum_Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public PostController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpPost("AddComment")]
        public async Task<IActionResult> PostAddComment([FromBody] PostAddCommentRequest model)
        {
            try
            {
                //var post = await _postRepo.GetAsync(p => p.Id == model.PostId);
                var post = await _unitOfWork.PostRepository.GetAsync(p => p.Id == model.PostId);

                //var user = await _userRepo.GetAsync(u => u.Id == model.UserId);
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Id == model.UserId);

                if (post == null || user == null)
                    return BadRequest();

                post.PostComments.Add(new PostComment()
                {
                    Comment = new Comment
                    {
                        Content = model.Content,
                        Date = model.Date,
                        User = user
                    }
                });

                //_postRepo.Update(post);

                _unitOfWork.PostRepository.Update(post);

                // await _postRepo.SaveAsync();

                await _unitOfWork.SaveAsync();

                return Ok(new { Message = "Comment added" });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("PostAddLike")]
        public async Task<IActionResult> PostAddLike([FromBody] PostAddLikeRequest model)
        {
            try
            {
                //var post = await _postRepo.GetAsync(p => p.Id == model.PostId);
                var post = await _unitOfWork.PostRepository.GetAsync(p => p.Id == model.PostId);

                //var user = await _userRepo.GetAsync(u => u.Id == model.UserId);
                var user = await _unitOfWork.UserRepository.GetAsync(u => u.Id == model.UserId);

                if (post == null || user == null)
                    return BadRequest();

                post.PostLikes.Add(new PostLike
                {
                    Like = new Like
                    {
                        UserId = model.UserId
                    }
                });

                // _postRepo.Update(post);
                _unitOfWork.PostRepository.Update(post);

                //await _postRepo.SaveAsync();
                await _unitOfWork.SaveAsync();

                return Ok(new { Message = "Like added" });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
