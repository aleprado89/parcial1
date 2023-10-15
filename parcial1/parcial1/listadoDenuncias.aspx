<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listadoDenuncias.aspx.cs" Inherits="parcial1.listadoDenuncias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Seleccionar Categoria:"></asp:Label>
            <br />
            <asp:DropDownList ID="categoriaDDL" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="nombre" DataValueField="idDenunciaCategoria" Height="16px" Width="332px" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Denuncias:"></asp:Label>
            <asp:GridView ID="denunciasDG" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDenuncias" Width="605px">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Categoria" SortExpression="nombre" />
                    <asp:BoundField DataField="texto" HeaderText="Denuncia" SortExpression="texto" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [DenunciaCategorias]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDenuncias" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT DenunciaCategorias.nombre, Denuncias.texto FROM Denuncias INNER JOIN DenunciaCategorias ON Denuncias.idDenunciaCategoria = DenunciaCategorias.idDenunciaCategoria WHERE (Denuncias.idDenunciaCategoria = @idDenunciaCategoria)">
            <SelectParameters>
                <asp:ControlParameter ControlID="categoriaDDL" Name="idDenunciaCategoria" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
