<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrikazRezervacija.aspx.cs" Inherits="ProbniTest.PrikazRezervacija" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDB %>" SelectCommand="SELECT [Gost], [Email], [Telefon], [BrojOsoba], [Usluge] FROM [Rezervacije] WHERE ([TipSobe] LIKE '%' + @TipSobe + '%') ORDER BY [Gost]">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="Apartman" Name="TipSobe" QueryStringField="Apartman" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDB %>" DeleteCommand="DELETE FROM [Rezervacije] WHERE [RezervacijaID] = @RezervacijaID" InsertCommand="INSERT INTO [Rezervacije] ([Gost], [Email], [Telefon], [BrojOsoba], [TipSobe], [Usluge], [DatumRezervacije], [Komentar]) VALUES (@Gost, @Email, @Telefon, @BrojOsoba, @TipSobe, @Usluge, @DatumRezervacije, @Komentar)" SelectCommand="SELECT * FROM [Rezervacije] WHERE (([DatumRezervacije] &lt;= @DatumRezervacije) AND ([Gost] LIKE '%' + @Gost + '%'))" UpdateCommand="UPDATE [Rezervacije] SET [Gost] = @Gost, [Email] = @Email, [Telefon] = @Telefon, [BrojOsoba] = @BrojOsoba, [TipSobe] = @TipSobe, [Usluge] = @Usluge, [DatumRezervacije] = @DatumRezervacije, [Komentar] = @Komentar WHERE [RezervacijaID] = @RezervacijaID">
                <DeleteParameters>
                    <asp:Parameter Name="RezervacijaID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Gost" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telefon" Type="String" />
                    <asp:Parameter Name="BrojOsoba" Type="Int32" />
                    <asp:Parameter Name="TipSobe" Type="String" />
                    <asp:Parameter Name="Usluge" Type="String" />
                    <asp:Parameter DbType="Date" Name="DatumRezervacije" />
                    <asp:Parameter Name="Komentar" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DbType="Date" DefaultValue="12-12-2025" Name="DatumRezervacije" QueryStringField="12-12-2025" />
                    <asp:QueryStringParameter DefaultValue="%vić" Name="Gost" QueryStringField="%vić" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Gost" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Telefon" Type="String" />
                    <asp:Parameter Name="BrojOsoba" Type="Int32" />
                    <asp:Parameter Name="TipSobe" Type="String" />
                    <asp:Parameter Name="Usluge" Type="String" />
                    <asp:Parameter DbType="Date" Name="DatumRezervacije" />
                    <asp:Parameter Name="Komentar" Type="String" />
                    <asp:Parameter Name="RezervacijaID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDB %>" SelectCommand="SELECT [GostHotela], [KontaktEmail], [KontaktTelefon], [VrstaSobe], [DodatneUsluge], [DatumRezervacije], [Napomena] FROM [RezervacijaSobe] WHERE ([BrojGostiju] &gt; @BrojGostiju)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="3" Name="BrojGostiju" QueryStringField="3" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" DataKeyNames="RezervacijaID">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="RezervacijaID" HeaderText="RezervacijaID" InsertVisible="False" ReadOnly="True" SortExpression="RezervacijaID" />
                <asp:BoundField DataField="Gost" HeaderText="Gost" SortExpression="Gost" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                <asp:BoundField DataField="BrojOsoba" HeaderText="BrojOsoba" SortExpression="BrojOsoba" />
                <asp:BoundField DataField="TipSobe" HeaderText="TipSobe" SortExpression="TipSobe" />
                <asp:BoundField DataField="Usluge" HeaderText="Usluge" SortExpression="Usluge" />
                <asp:BoundField DataField="DatumRezervacije" HeaderText="DatumRezervacije" SortExpression="DatumRezervacije" />
                <asp:BoundField DataField="Komentar" HeaderText="Komentar" SortExpression="Komentar" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </form>
</body>
</html>