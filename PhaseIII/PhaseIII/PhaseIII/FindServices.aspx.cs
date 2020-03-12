using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhaseIII
{
    public partial class FindServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void ClearButton_Click(object sender, EventArgs e)
		{
			MaximumPriceBox.Text = String.Empty;
			MinimumPriceBox.Text = String.Empty;
			ServiceList.SelectedIndex = 0;
		}

		protected void SearchButton_Click(object sender, EventArgs e)
		{

			string query = (@"
				SELECT u.FName AS 'First Name',
				u.LName AS 'Last Name',
				u.Email,
				u.Phone,
				s.ServiceName AS 'Service Name',
				s.ServiceLength AS 'Service Length',
				sb.Price
				FROM Services s
				INNER JOIN ServicesBarBers sb
					ON sb.ServiceId = s.ServiceId
				INNER JOIN Users u
					ON u.UserId = sb.BarberID
				WHERE {0} <= sb.Price
					AND sb.price <= {1}
					AND s.ServiceId = {2}");

			if (!Int32.TryParse(ServiceList.SelectedValue, out int ServiceId))
				return;

			if (!Int32.TryParse(MinimumPriceBox.Text, out int MinPrice))
			{
				MinimumPriceBox.Text = String.Empty;
				MinPrice = 0;
			}

			if (!Int32.TryParse(MaximumPriceBox.Text, out int MaxPrice))
			{
				MaximumPriceBox.Text = String.Empty;
				MaxPrice = Int32.MaxValue;
			}

			query = String.Format(query, MinPrice, MaxPrice, ServiceId);

			string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

			using (SqlConnection conn = new SqlConnection(connectionString)) {
				conn.Open();

				SqlCommand command = new SqlCommand(query, conn);
				SqlDataReader dataReader = command.ExecuteReader();

				SearchResults.DataSource = dataReader;
				SearchResults.DataBind();

				command.Dispose();
				dataReader.Close();
				conn.Close();
			}
		}
	}
}