using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QLBHMA_API.Controllers
{
    [Authorize]
    [RoutePrefix("api/test")]
    public class TestController : ApiController
    {
        [HttpGet]
        [Route("doc-danh-sach1")]
        [AllowAnonymous]
        public IEnumerable<string> DocDanhSach1()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet]
        [Route("doc-danh-sach2")]
        public IEnumerable<string> DocDanhSach2()
        {
            return new string[] { "values1", "values2" };
        }

        [HttpGet]
        [Route("doc/{id:int:min(1)}")]
        [Authorize(Roles = "QuanLy")]
        public string DocChiTiet(int id)
        {
            return $"value:{id}";
        }

        [HttpPost]
        [Authorize(Roles = "QuanLy,NhanVienNH")]
        [Route("them")]
        public string Them([FromBody]string value)
        {
            return $"Ghi giá trị:{value}";
        }

        [HttpPost]
        [Authorize(Users = "admin@gmail.com")]
        [Route("xoa")]
        public string Xoa([FromBody]string value)
        {
            return $"Xóa giá trị: {value}";
        }

        [HttpPost]
        [Authorize(Users = "QuanLy")]
        [Route("sua")]
        public string Sua([FromBody]string value)
        {
            return $"Xóa giá trị: {value}";
        }
    }
}
