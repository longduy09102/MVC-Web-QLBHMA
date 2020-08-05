using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBHMA.DAL;

namespace QLBHMA.Controllers
{
    public class ThuongHieuController : Controller
    {
        QLBHMADbContext db = new QLBHMADbContext();
        // GET: ThuongHieu
        public PartialViewResult _ThuongHieuBannerIndex()
        {
            List<ThuongHieu> items = db.ThuongHieux.ToList();
            return PartialView(model:items);
        }
    }
}