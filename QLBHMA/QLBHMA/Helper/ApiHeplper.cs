using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//-------------------------------
using System.Threading.Tasks;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Configuration;
using QLBHMA.Models;

namespace QLBHMA.Helper
{
    //bổ sung
    public class ApiHepler
    {      
        public static async Task<string> GetUserToken(UserLoginModel userLogin)
        {
            string result = null;
            using (HttpClient client = new HttpClient())
            {
                string apiURL = "https://localhost:44369/";
                client.BaseAddress = new Uri(apiURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var login = new Dictionary<string, string>
                {
                    {"grant_type", "password"},
                    {"username", userLogin.UserName},
                    {"password", userLogin.Password}
                };
                var response = client.PostAsync("Token", new FormUrlEncodedContent(login)).Result;
                if (response.IsSuccessStatusCode)
                {
                    var tokenDetails = await response.Content.ReadAsAsync<Dictionary<string, string>>();
                    result = tokenDetails["access_token"];
                }
            }
            return result;
        }
    }
    //-----------------------------------------
    public class ApiHeplper<T>
    {
        static string apiURL = "https://localhost:44369/api/";
        //static string apiURL = ConfigurationManager.AppSettings["apiURL"];
        //-------------------------------------------------------
        #region
        public static async Task<dynamic> RunGetAsync(string url,string userToken="")//bố sung string userToken
        {
            dynamic result = null;
            using (HttpClient client=new HttpClient())
            {
                client.BaseAddress = new Uri(apiURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                if (!string.IsNullOrEmpty(userToken))//bổ sung
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userToken);
                HttpResponseMessage response = await client.GetAsync(url);
                if (response.IsSuccessStatusCode)
                {
                    result = await response.Content.ReadAsAsync<T>();
                }
                else if (response.StatusCode == HttpStatusCode.BadRequest)
                {
                    var err = await response.Content.ReadAsAsync<BadRequestGet>();
                    throw new Exception(err.Mesage);
                }
                else if (response.StatusCode==HttpStatusCode.Unauthorized)//bổ sung
                {
                    throw new Exception("Lỗi: không có quyền truy cập");
                }
                else
                {
                    throw new Exception("Lỗi kết nối với service");
                }
                return result;
            }
        }
        #endregion
        //-------------------------------------------------------------------------
        #region
        public static dynamic RunGet(string url,string userToken="")
        {
            dynamic result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                if (!string.IsNullOrEmpty(userToken))//bổ sung
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userToken);
                HttpResponseMessage response = client.GetAsync(url).Result;
                if (response.IsSuccessStatusCode)
                {
                    result = response.Content.ReadAsAsync<T>().Result;
                }
                else if (response.StatusCode == HttpStatusCode.BadRequest)
                {
                    var err = response.Content.ReadAsAsync<BadRequestGet>().Result;
                    throw new Exception(err.Mesage);
                }
                else if (response.StatusCode == HttpStatusCode.Unauthorized)//bổ sung
                {
                    throw new Exception("Lỗi: không có quyền truy cập");
                }
                else
                {
                    throw new Exception("Lỗi kết nối với service");
                }
                return result;
            }
        }
        #endregion
        //-----------------------------------------------------------------
        #region
        public static async Task<dynamic> RunPostAsync(string url,object input=null,string userToken="")
        {
            dynamic result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                if (userToken.Trim() != "")//bổ sung
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userToken);
                HttpResponseMessage response = await client.PostAsJsonAsync(url,input);
                if (response.IsSuccessStatusCode)
                {
                    result = await response.Content.ReadAsAsync<T>();
                }
                else if (response.StatusCode == HttpStatusCode.BadRequest)
                {
                    var err = await response.Content.ReadAsAsync<BadRequestPost>();
                    string errMsg = null;
                    if (err.ModelState==null)
                    {
                        errMsg = err.Message;
                    }
                    else
                    {
                        foreach (KeyValuePair<string, string[]> item in err.ModelState)
                        {
                            errMsg += $"{string.Join(",", item.Value)}";
                        }
                    }
                    throw new Exception(errMsg);
                }
                else if (response.StatusCode == HttpStatusCode.Unauthorized)//bổ sung
                {
                    throw new Exception("Lỗi: không có quyền truy cập");
                }
                else
                {
                    throw new Exception("Lỗi kết nối với service");
                }
                return result;
            }
        }
        #endregion
    }
}