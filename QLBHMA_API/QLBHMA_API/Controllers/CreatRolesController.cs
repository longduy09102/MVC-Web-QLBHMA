using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using QLBHMA_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLBHMA_API.Controllers
{
    public class CreatRolesController : Controller
    {
        // GET: CreatRoles
        public ActionResult Index()
        {
            var roleManager = new RoleManager<IdentityRole>(
                new RoleStore<IdentityRole>(new ApplicationDbContext()));

            roleManager.Create(new IdentityRole("QuanLy"));
            roleManager.Create(new IdentityRole("NhanVienBH"));
            roleManager.Create(new IdentityRole("NhanVienNH"));

            var userManager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = userManager.FindByName("admin@gmail.com");
            userManager.AddToRole(user.Id, "QuanLy");
            userManager.AddToRole(user.Id, "NhanVienBH");
            userManager.AddToRole(user.Id, "NhanVienNH");

            user = userManager.FindByName("tam@gmail.com");
            userManager.AddToRole(user.Id, "NhanVienBH");

            user = userManager.FindByName("binh@gmail.com");
            userManager.AddToRole(user.Id, "NhanVienNH");
            return View();
        }
    }
}