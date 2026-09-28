<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rezervacija Sobe.aspx.cs" Inherits="ProbniTest.Rezervacija_Sobe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Rezervacija hotela</title>
    <style type="text/css">
        .w100 { width:100%; }
        .center { text-align:center; }
        .colH { width:180px; text-align:center; }
        .colS { width:60px; }
        .auto-style1 {
            width: 60px;
            height: 34px;
        }
        .auto-style2 {
            width: 180px;
            text-align: center;
            height: 34px;
        }
        .auto-style3 {
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center"><strong>Forma za rezervaciju hotela</strong></div>
        <table class="w100">

            <tr>
                <td class="colS"></td><td class="colH">Ime i prezime gosta</td>
                <td>
                    <asp:TextBox ID="txtGost" runat="server" Width="196px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGost" runat="server"
                        ControlToValidate="txtGost" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="196px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail" ForeColor="Red"
                        ErrorMessage="Neispravan email"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Kontakt telefon</td>
                <td>
                    <asp:TextBox ID="txtTelefon" runat="server" Width="196px" placeholder="0612345678"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTel" runat="server"
                        ControlToValidate="txtTelefon" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTel" runat="server"
                        ControlToValidate="txtTelefon" ForeColor="Red"
                        ErrorMessage="9-10 cifara"
                        ValidationExpression="^06\d{7,8}$"></asp:RegularExpressionValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Broj osoba</td>
                <td>
                    <asp:TextBox ID="txtOsobe" runat="server" TextMode="Number" Width="196px"></asp:TextBox>
                    <asp:RangeValidator ID="rvOsobe" runat="server"
                        ControlToValidate="txtOsobe" MinimumValue="1" MaximumValue="5"
                        Type="Integer" ForeColor="Red" ErrorMessage="Opseg 1–6"></asp:RangeValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Tip sobe</td>
                <td>
                    <asp:DropDownList ID="ddlSoba" runat="server" Width="200px">
                        <asp:ListItem>Izaberi tip sobe</asp:ListItem>
                        <asp:ListItem>Jednokrevetna</asp:ListItem>
                        <asp:ListItem>Dvokrevetna</asp:ListItem>
                        <asp:ListItem>Apartman</asp:ListItem>
                        <asp:ListItem>Luks apartman</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSoba" runat="server"
                        ControlToValidate="ddlSoba" InitialValue="Izaberi tip sobe"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Dodatne usluge</td>
                <td>
                    <asp:CheckBoxList ID="cbUsluge" runat="server">
                        <asp:ListItem>Doručak</asp:ListItem>
                        <asp:ListItem>Polupansion</asp:ListItem>
                        <asp:ListItem>Wellness & Spa</asp:ListItem>
                        <asp:ListItem>Bazen</asp:ListItem>
                        <asp:ListItem>Parking</asp:ListItem>
                        <asp:ListItem>Teretana</asp:ListItem>
                        <asp:ListItem>Padel</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="auto-style1"></td><td class="auto-style2">Datum rezervacije</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDatumRezervacije" runat="server" TextMode="Date" Width="196px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDolazak" runat="server"
                        ControlToValidate="txtDatumRezervacije" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvDatum" runat="server" ErrorMessage="Datum mora biti u opsegu" ControlToValidate="txtDatumRezervacije" ForeColor="Red" Type="Date"></asp:RangeValidator>
                </td>
                <td class="auto-style3"></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH">Komentar</td>
                <td>
                    <asp:TextBox ID="txtKomentar" runat="server" Height="83px" Width="413px"></asp:TextBox>
                &nbsp;<asp:CustomValidator ID="cvKomentar" runat="server" ControlToValidate="txtKomentar" ErrorMessage="Mora se napisati bar nekakav komentar." ForeColor="Red" OnServerValidate="cvKomentar_ServerValidate"></asp:CustomValidator>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td><td class="colH"></td>
                <td>
                    <asp:Button ID="btnRezervisi" runat="server" Text="Rezerviši" Width="200px" OnClick="btnRezervisi_Click" />
                    <t>
                    Želite da vidite listu rezervisanih soba? Nema problema, kliknite <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RezervacijaPrikaz.aspx">Ovde</asp:HyperLink>
                    </t>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td>
                <td class="center" colspan="2">
                    <asp:Label ID="lblRezultat" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblNagradnaIgra" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblBrojUcesnika" runat="server"></asp:Label>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="colS"></td>
                <td class="center" colspan="2">
                    <asp:Label ID="lblBrojac" runat="server">Broj rezervacija: 0</asp:Label>
                </td>
                <td></td>
            </tr>

        </table>

    </form>
</body>
</html>