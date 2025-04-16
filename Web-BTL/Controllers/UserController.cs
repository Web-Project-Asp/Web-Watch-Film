using Microsoft.AspNetCore.Mvc;
using Web_BTL.BusinessLogicLayer.Services;


namespace Web_BTL.Controllers {
    // Controller xử lý các yêu cầu liên quan đến thông tin người dùng
    public class UserController : Controller {
        private readonly IUserService _userService; // Dịch vụ nghiệp vụ xử lý logic người dùng
        private readonly IWebHostEnvironment _environment; // Môi trường lưu trữ để xử lý tệp
        private readonly SaveImageVideo _save; // Dịch vụ lưu hình ảnh

        // Constructor: Tiêm các dịch vụ qua Dependency Injection
        public UserController(IUserService userService, IWebHostEnvironment environment, SaveImageVideo save) {
            _userService = userService;
            _environment = environment;
            _save = save;
        }

        // Hiển thị thông tin người dùng
        [HttpGet]
        public async Task<IActionResult> UserInformation() {
            // Lấy email và vai trò từ Session
            string email = HttpContext.Session.GetString("LogIn Session");
            string role = HttpContext.Session.GetString("Admin");

            // Gọi tầng nghiệp vụ để lấy thông tin người dùng
            var (user, isAdmin) = await _userService.GetUserInformationAsync(email);

            // Nếu không có email hoặc người dùng, chuyển hướng đến trang đăng nhập
            if (user == null)
                return RedirectToAction(nameof(SignIn), "Account");

            // Trả về View với thông tin người dùng
            return View(user);
        }

        // Hiển thị form chỉnh sửa hình ảnh
        public async Task<IActionResult> Image() {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để lấy thông tin người dùng
            var (user, isAdmin) = await _userService.GetUserForImageAsync(email);

            // Trả về PartialView với thông tin người dùng
            return PartialView("SaveImage", user);
        }

        // Lưu hình ảnh người dùng
        [HttpPost]
        public async Task<IActionResult> SaveImage(IFormFile image) {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để lưu hình ảnh
            await _userService.SaveUserImageAsync(email, image, _environment, _save);

            // Chuyển hướng về trang thông tin người dùng
            return RedirectToAction(nameof(UserInformation));
        }

        // Hiển thị form chỉnh sửa tên
        public async Task<IActionResult> Name() {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để lấy thông tin người dùng
            var (user, isAdmin) = await _userService.GetUserForNameAsync(email);

            // Trả về PartialView với thông tin người dùng
            return PartialView("EditName", user);
        }

        // Cập nhật tên người dùng
        [HttpPost]
        public async Task<IActionResult> EditName(string name) {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để cập nhật tên
            await _userService.UpdateUserNameAsync(email, name);

            // Chuyển hướng về trang thông tin người dùng
            return RedirectToAction(nameof(UserInformation));
        }

        // Hiển thị form chỉnh sửa mật khẩu
        public async Task<IActionResult> RPassword() {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để lấy thông tin người dùng
            var (user, isAdmin) = await _userService.GetUserForPasswordAsync(email);

            // Trả về PartialView với thông tin người dùng
            return PartialView("EditPassword", user);
        }

        // Cập nhật mật khẩu người dùng
        [HttpPost]
        public async Task<IActionResult> EditPassword(string oPassword, string nPassword, string cPassword) {
            // Lấy email từ Session
            string email = HttpContext.Session.GetString("LogIn Session");

            // Gọi tầng nghiệp vụ để cập nhật mật khẩu
            var (success, errorMessage) = await _userService.UpdateUserPasswordAsync(email, oPassword, nPassword, cPassword);

            // Nếu cập nhật không thành công, hiển thị lỗi
            if (!success) {
                ModelState.AddModelError("ErrorPassword", errorMessage);
                var (user, isAdmin) = await _userService.GetUserInformationAsync(email);
                return View("UserInformation", user);
            }

            // Chuyển hướng về trang thông tin người dùng nếu thành công
            return RedirectToAction(nameof(UserInformation));
        }

        // Đăng xuất người dùng
        [HttpGet]
        public IActionResult LogOut() {
            // Lấy email và vai trò từ Session
            string email = HttpContext.Session.GetString("LogIn Session");
            string role = HttpContext.Session.GetString("Admin");

            // Xóa thông tin Session nếu có
            if (email != null)
                HttpContext.Session.Remove("LogIn Session");
            if (role != null)
                HttpContext.Session.Remove("Admin");

            // Chuyển hướng đến trang đăng nhập
            return RedirectToAction(nameof(SignIn), "Account");
        }

        // Hiển thị trang Index mặc định
        public IActionResult Index() {
            // Trả về View mặc định
            return View();
        }
    }
}