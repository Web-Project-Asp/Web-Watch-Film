using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_BTL.BusinessLogicLayer.Services;
using Web_BTL.DataAccessLayer;
using Web_BTL.DataAccessLayer.Models;

namespace Web_BTL.BusinessLogicLayer.Controllers {
    public class AccountController : Controller {
        private readonly IAccountService _accountService;
        DBXemPhimContext _dataContext ;

        public AccountController(IAccountService accountService, DBXemPhimContext dBXemPhimContext) {
            _accountService = accountService;
            _dataContext = dBXemPhimContext;
        }

        [HttpGet]
        public IActionResult SignIn() {
            return View(new LogInModel());
        }

        [HttpPost]
        public async Task<IActionResult> SignIn(LogInModel model) {
            if (!ModelState.IsValid) {
                return View(model);
            }

            var (success, email, isAdmin, role) = await _accountService.SignInAsync(model.LogInName, model.Password);
            if (success) {
                return RedirectToAction(nameof(Index), "Home");
            }

            ModelState.AddModelError(string.Empty, "Thông tin đăng nhập không hợp lệ");
            return View(model);
        }

        [HttpGet]
        public IActionResult SignUp() {
            return View(new CustomerModel());
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(CustomerModel model) {
            if (ModelState.IsValid) {
                var admin = await _dataContext.Admins.FirstOrDefaultAsync(a => a.UserEmail == model.UserEmail || a.UserLogin == model.UserLogin);
                var customer = await _dataContext.Customers.FirstOrDefaultAsync(c => c.UserEmail == model.UserEmail || c.UserLogin == model.UserLogin);

                if (admin != null || customer != null) {
                    ModelState.AddModelError(string.Empty, "Email hoặc tên đăng nhập đã tồn tại");
                    return View(model);
                }

                // Set default values for new customer
                model.UserImagePath = "default.jpg";
                model.UserState = true;
              
                model.UserCreateDate = DateTime.Now;

                // Add customer directly to database
                _dataContext.Customers.Add(model);
                await _dataContext.SaveChangesAsync();

                // Create and associate a watchlist
                var watchList = new WatchListModel {
                    CustomerId = model.CustomerId
                };
                _dataContext.WatchLists.Add(watchList);
                await _dataContext.SaveChangesAsync();

                // Update customer with watchlist ID
                model.WatchListId = watchList.WatchListId;
                await _dataContext.SaveChangesAsync();

                // Redirect to sign in page after successful registration
                TempData["SuccessMessage"] = "Đăng ký thành công! Vui lòng đăng nhập.";
                return RedirectToAction(nameof(SignIn));
            }
            return View(model);
        }

        [HttpGet]
        public IActionResult RecoverPassword() {
            return View(new LogInModel());
        }

        [HttpPost]
        public async Task<IActionResult> RecoverPassword(LogInModel model) {
            if (!ModelState.IsValid) {
                return View(model);
            }

            var (success, errorMessage) = await _accountService.RecoverPasswordAsync(model.LogInName, model.Password);
            if (success) {
                return RedirectToAction(nameof(SignIn));
            }

            ModelState.AddModelError(string.Empty, errorMessage);
            return View(model);
        }

        public IActionResult Index() {
            return View();
        }
    }
}