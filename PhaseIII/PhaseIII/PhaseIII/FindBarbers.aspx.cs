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
    public partial class FindBarbers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void ClearButton_Click(object sender, EventArgs e)
		{
			MaximumPriceBox.Text = String.Empty;
			MinimumPriceBox.Text = String.Empty;
			MaximumServiceBox.Text = String.Empty;
			MinimumServiceBox.Text = String.Empty;
		}

		protected void SearchButton_Click(object sender, EventArgs e)
		{

			string query = (@"
				SELECT *
				FROM (
					SELECT u.FName AS 'First Name',
						u.LName AS 'Last Name',
						COUNT(s.ServiceId) AS [Services Offered],
						ROUND(AVG(s.Price), 2) AS [Average Price]
					FROM Users u
						INNER JOIN (
							SELECT sb.BarberID,
								sb.Price,
								sb.ServiceId
							FROM ServicesBarBers sb
							) as s
							ON u.UserId = s.BarberID
					GROUP BY u.UserId, 
						u.FName,
						u.LName
					) AS result
				WHERE {0} <= [Services Offered]
					AND [Services Offered] <= {1}
					AND {2} <= [Average Price]
					AND [Average Price] <= {3}
				ORDER BY [Services Offered] DESC,
					[Average Price]
				");

			if (!Int32.TryParse(MinimumServiceBox.Text, out int MinServices))
			{
				MinimumServiceBox.Text = String.Empty;
				MinServices = 1;
			}

			if (!Int32.TryParse(MaximumServiceBox.Text, out int MaxServices))
			{
				MaximumServiceBox.Text = String.Empty;
				MaxServices = Int32.MaxValue;
			}

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

			query = String.Format(query, MinServices, MaxServices, MinPrice, MaxPrice);

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