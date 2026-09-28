using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProbniTest
{
    public partial class Rezervacija_Sobe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["brojRezervacija"] = 0;
                rvDatum.MaximumValue = DateTime.Now.AddMonths(6).AddDays(20).ToShortDateString();
                rvDatum.MinimumValue = DateTime.Now.AddDays(1).ToShortDateString();
                ViewState["nagradnaIgra"] = 0;
            }
            if (Convert.ToInt32(ViewState["brojRezervacija"]) > 2)
            {
                lblNagradnaIgra.Text = "Čestitamo imate šansu da osvojite produžetak pansiona za nedelju dana";
                int broj = Convert.ToInt32(ViewState["nagradnaIgra"]);
                broj++;
                ViewState["nagradnaIgra"] = broj;
                lblBrojUcesnika.Text = "Broj učesnika u nagradnoj igri: " + ViewState["nagradnaIgra"].ToString();
            }
        }

        protected void btnRezervisi_Click(object sender, EventArgs e)
        {
            // Čitanje vrednosti sa forme
            string gost = txtGost.Text;                  // TextBox
            string email = txtEmail.Text;                // TextBox
            string telefon = txtTelefon.Text;            // TextBox
            int brojOsoba = Convert.ToInt32(txtOsobe.Text); // TextBox (Number)
            string tipSobe = ddlSoba.SelectedItem.Text;      // DropDownList

            // Čekirane dodatne usluge -> CSV
            string usluge = "";
            foreach (ListItem usluga in cbUsluge.Items)
            {
                if (usluga.Selected)
                    usluge += usluga + " ";
            }

            DateTime datumRezervacije = DateTime.Parse(txtDatumRezervacije.Text); // TextBox (Date)
            string komentar = txtKomentar.Text;          // TextBox

            // Povezivanje sa bazom (ConnectionString u Web.config)
            string connString = System.Configuration.ConfigurationManager
                                .ConnectionStrings["HotelDB"].ConnectionString;

            string query = @"INSERT INTO Rezervacije (Gost, Email, Telefon, BrojOsoba, TipSobe, Usluge, DatumRezervacije, Komentar) VALUES (@Gost, @Email, @Telefon, @BrojOsoba, @TipSobe, @Usluge, @DatumRezervacije, @Komentar);";

            using (var conn = new SqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Gost", gost);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Telefon", telefon);
                    cmd.Parameters.AddWithValue("@BrojOsoba", brojOsoba);
                    cmd.Parameters.AddWithValue("@TipSobe", tipSobe);
                    cmd.Parameters.AddWithValue("@Usluge", string.IsNullOrWhiteSpace(usluge) ? (object)DBNull.Value : usluge);
                    cmd.Parameters.AddWithValue("@DatumRezervacije", datumRezervacije);
                    cmd.Parameters.AddWithValue("@Komentar", string.IsNullOrWhiteSpace(komentar) ? (object)DBNull.Value : komentar);

                    int result = cmd.ExecuteNonQuery();
                    lblRezultat.Text = (result > 0) ? "Rezervacija uspešno uneta." : "Greška pri unosu podataka.";
                }
            }

            int brojac = Convert.ToInt32(ViewState["brojRezervacija"]);
            if (tipSobe == "Lux apartman")
            {
                brojac++;
                ViewState["brojRezervacija"] = brojac;
            }
            if (brojac % 2 == 0)
            {
                int broj = Convert.ToInt32(ViewState["nagradnaIgra"]);
                broj++;
                ViewState["nagradnaIgra"] = broj;
            }

            lblBrojac.Text = "Broj rezervacija: " + ViewState["brojRezervacija"].ToString();
            lblNagradnaIgra.Text = "Broj učesnika u nagradnoj igri: " + ViewState["nagradnaIgra"].ToString();
        }

        protected void cvKomentar_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int duzina = args.Value.Length;
            if (duzina > 200)
            {
                args.IsValid = false;
            }
        }
    }
}