
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;

namespace PhaseIII
{
    public partial class Default : System.Web.UI.Page
    {
        string API_KEY = "&key=AIzaSyC1ZOwD2OkPuMC - eD7MpBVrGNrcj8bQzkc";
        static HttpClient client = new HttpClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static async Task<string> GeoLatLon(string path)
        {

            client.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));
            if (client.BaseAddress == null)
            {
                client.BaseAddress = new Uri("https://maps.googleapis.com/maps/api/geocode/json");
            }
            var response = await client.GetAsync(path);


            return response.Content.ReadAsStringAsync().Result;
        }
        protected async void btnSearchZip_Click(object sender, EventArgs e)
        {

            // List data respons
            string zip = txtSearchZip.Text;
            string range = dropDownListRange.SelectedValue;
            string result = await GeoLatLon("?address=" + zip + API_KEY);
            Console.WriteLine(result);
            var parsed = JObject.Parse(result);
            var loc = parsed.SelectToken("$.results[0].geometry.location").Value<JToken>();
            double lat = loc.SelectToken("lat").Value<float>();
            double lng = loc.SelectToken("lng").Value <float>();
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            string selectCommand = "SELECT  Name, Phone" +
            " FROM(SELECT FName Name, Phone, CurrentLocation Location, Locations.Latitude Lat, Locations.Longtitude Lon FROM Users, Locations WHERE Users.CurrentLocation = Locations.LocationId AND Users.GroupId = 2)" +
            "AS CurrentLocations WHERE(acos(sin(" + lat + " * pi() / 180) * sin(Lat * pi() / 180) + cos(" + lat + " * pi() / 180) * cos(Lat * pi() / 180) * cos(pi() / 180 * (Lon - (" + lng + ")))) * 3958.8 <= " + range + ")";
            /*
            selectCommand.Parameters.Add(new SqlParameter
            {
                ParameterName = "@Lat",
                Value = lat,
                SqlDbType = SqlDbType.Float,
            });
            selectCommand.Parameters.Add(new SqlParameter
            {
                ParameterName = "@Lng",
                Value = lng,
                SqlDbType = SqlDbType.Float,
            });
            selectCommand.Parameters.Add(new SqlParameter
            {
                ParameterName = "@Dist",
                Value = 100,
                SqlDbType = SqlDbType.Float,
            });
            */
            try
            {
                conn.Open();

                SqlDataAdapter sda = new SqlDataAdapter(selectCommand, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Console.Write(dt);
                grdViewZip.DataSource = dt;
                grdViewZip.DataBind();
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}