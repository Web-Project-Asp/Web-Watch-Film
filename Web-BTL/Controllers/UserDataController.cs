
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Web_BTL.DataAccessLayer;
using Web_BTL.DataAccessLayer.Models;

namespace Web_BTL.Controllers
{
    [ApiController]
    [Route("api/user")]
    public class UserDataController : ControllerBase
    {
        private readonly DBXemPhimContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public UserDataController(DBXemPhimContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        private int GetCurrentUserId()
        {
            var userIdClaim = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            return int.Parse(userIdClaim.Value);
        }

        // GET: /api/user/favorites
        [HttpGet("favorites")]
        public IActionResult GetFavoriteMedias()
        {
            int userId = GetCurrentUserId();

            var favorites = _context.ListMedia
                .Include(lm => lm.media)
                .Include(lm => lm.watchList)
                .Where(lm => lm.watchList.CustomerId == userId && lm.Favorite == true)
                .Select(lm => new
                {
                    Id = lm.media.MediaId,
                    Name = lm.media.MediaName,
                    Description = lm.media.MediaDescription,
                    Image = lm.media.MediaImagePath,
                    Url = lm.media.MediaUrl
                }).ToList();

            return Ok(favorites);
        }

        // GET: /api/user/watched
        [HttpGet("watched")]
        public IActionResult GetWatchedMedias()
        {
            int userId = GetCurrentUserId();

            var watched = _context.ListMedia
                .Include(lm => lm.media)
                .Include(lm => lm.watchList)
                .Where(lm => lm.watchList.CustomerId == userId && lm.IsWatched == true)
                .Select(lm => new
                {
                    Id = lm.media.MediaId,
                    Name = lm.media.MediaName,
                    Description = lm.media.MediaDescription,
                    Image = lm.media.MediaImagePath,
                    Url = lm.media.MediaUrl
                }).ToList();

            return Ok(watched);
        }
    }
}
