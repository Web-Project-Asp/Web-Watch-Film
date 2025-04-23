
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Web_BTL.BusinessLogicLayer.Services;
using Web_BTL.DataAccessLayer;
using Web_BTL.DataAccessLayer.Models;

namespace Web_BTL.Controllers
{
    [ApiController]
    [Route("api/user")]
    public class UserDataController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public UserDataController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

      

        // GET: /api/user/favorites
        [HttpGet("favorites")]
        public async Task<List<MediaModel>> GetFavoriteMedias()
        {
            var (success, favoriteMedias) = await _customerService.GetFavoriteMediasAsync();


            return favoriteMedias;
        }

        // GET: /api/user/watched
        [HttpGet("watched")]
        public async Task<List<MediaModel>> GetWatchedMedias()
        {
            var (success, watchedMedias) = await _customerService.GetWatchedMediasAsync();


            return watchedMedias;
        }
    }
}
