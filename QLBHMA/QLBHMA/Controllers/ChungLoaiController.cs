using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBHMA.DAL;

namespace QLBHMA.Controllers
{
    public class ChungLoaiController : Controller
    {
        QLBHMADbContext db = new QLBHMADbContext();
        #region Index
        // GET: ChungLoai
        public PartialViewResult _ChungLoai()
        {
            List<ChungLoai> items = db.ChungLoais
                .Where(p=>p.Loais.Count>0)
                .Include(p=>p.Loais)
                .ToList();
            ViewBag.ChungLoai = items;
            return PartialView();
        }
        #endregion

        #region Product
        [ChildActionOnly]
        public PartialViewResult _ChungLoaiAjaxPartial()
        {
            List<ChungLoai> items = db.ChungLoais
                .Where(p => p.Loais.Count > 0)
                .Include(p => p.Loais)
                .ToList();
            ViewBag.ChungLoais = items;

            return PartialView();
        }
        #endregion
    }
}