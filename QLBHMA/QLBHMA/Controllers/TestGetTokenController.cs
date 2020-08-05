using QLBHMA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBHMA.Helper;
using System.Threading.Tasks;

namespace QLBHMA.Controllers
{
    public class TestGetTokenController : Controller
    {
        // GET: TestGetToken
        public ActionResult Index()
        {
            return View();
        }
        // POST: TestGetToken/DangNhap2
        [HttpPost]
        public async Task<ActionResult> DangNhap(UserLoginModel userLogin)
        {
            //var userLogin = new UserLoginModel { UserName = "admin@gmail.com", Password = "Admin-123" };
            string token = await ApiHepler.GetUserToken(userLogin);
            ViewBag.Access_token = "Kết quả đăng nhập :<br>" + token;
            Session["user_token"] = token;
            return RedirectToAction("GetUserInfo");
        }
        public async Task<ActionResult> GetUserInfo()
        {
            try
            {
                string url = "Account/UserInfo";
                string user_token = (string)Session["user_token"];
                UserInfoModel userInfo = await ApiHeplper<UserInfoModel>.RunGetAsync(url, user_token);
                if (userInfo.Email=="longduy09102@gmail.com")
                {
                    return RedirectToAction("Index", "AdminHangHoa");
                }
                ViewBag.Email = userInfo.Email;
            }
            catch (Exception ex)
            {

                ViewBag.Err = ex.Message;
            }
            return View();
        }
        //GET: TestGetToken/GetUserInfo
        public async Task<ActionResult> GetList2()
        {
            try
            {
                string url = "test/doc-danh-sach2";
                string user_token = (string)Session["user_token"];
                List<string> ds = await ApiHeplper<List<string>>.RunGetAsync(url, user_token);
                string s = string.Join(",", ds);
                ViewBag.Values = s;
            }
            catch (Exception ex)
            {

                ViewBag.Err = ex.Message;
            }
            return View();
        }
        //GET: 
    }
}