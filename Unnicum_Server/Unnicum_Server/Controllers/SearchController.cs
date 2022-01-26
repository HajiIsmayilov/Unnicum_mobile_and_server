using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Unnicum_Server.Repo;

namespace Unnicum_Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public SearchController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet("SearchByCategory/{categoryName}")]
        public async Task<IActionResult> SearchByCategory(string categoryName)
        {
            try
            {
                var posts = await _unitOfWork.PostRepository.GetAllAsync(p => p.SubCategory.Category.Name.Contains(categoryName));

                var challenges =
                    await _unitOfWork.ChallengeRepository.GetAllAsync(c =>
                        c.ChallengedPost.SubCategory.Category.Name.Contains(categoryName));

                return Ok(new { Posts = posts, Challenges = challenges });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet("SearchBySubCategory/{subCategoryName}")]
        public async Task<IActionResult> SearchBySubCategory(string subCategoryName)
        {
            var posts = await _unitOfWork.PostRepository.GetAllAsync(p => p.SubCategory.Name.Contains(subCategoryName));

            var challenges = await _unitOfWork.ChallengeRepository.GetAllAsync(c => c.ChallengedPost.SubCategory.Name.Contains(subCategoryName));

            return Ok(new { Posts = posts, Challenges = challenges });
        }

        [HttpGet("SearchByPopularity")]
        public async Task<IActionResult> SearchByPopularity()
        {
            try
            {
                int popularityCount = 100;

                var posts = await _unitOfWork.PostRepository.GetAllAsync(p =>
                    p.PostComments.Count >= popularityCount || p.PostLikes.Count >= popularityCount);

                var challenges = await _unitOfWork.ChallengeRepository.GetAllAsync(c =>
                    c.ChallengeComments.Count >= popularityCount || c.ChallengeLikes.Count >= popularityCount);

                return Ok(new { Posts = posts, Challenges = challenges });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet("SearchByNew")]
        public async Task<IActionResult> SearchByNew()
        {
            try
            {
                var posts = await _unitOfWork.PostRepository.GetAllAsync(d => d.Date.AddDays(7) <= DateTimeOffset.Now);

                var challenges =
                    await _unitOfWork.ChallengeRepository.GetAllAsync(d =>
                        d.ChallengerPost.Date.AddDays(7) <= DateTimeOffset.Now);

                return Ok(new { Posts = posts, Challenges = challenges });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet("SearchByUser/{username}")]
        public async Task<IActionResult> SearchByNew(string username)
        {
            try
            {
                var users = await _unitOfWork.UserRepository.GetAllAsync(u => u.Username.Contains(username));

                return Ok(new { Users = users });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpGet("GetDuels")]
        public async Task<IActionResult> GetDuels()
        {
            try
            {
                var challenges = await _unitOfWork.ChallengeRepository.GetAllAsync();

                return Ok(new { Challenges = challenges });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
