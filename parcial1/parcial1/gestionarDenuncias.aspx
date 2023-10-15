<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarDenuncias.aspx.cs" Inherits="parcial1.gestionarDenuncias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Denuncias Registradas"></asp:Label>
            <br />
            <asp:ListBox ID="denunciasLB" runat="server" DataSourceID="SqlDataSourceDenuncias" DataTextField="texto" DataValueField="idDenuncia" Height="142px" Width="591px" AutoPostBack="True" OnSelectedIndexChanged="denunciasLB_SelectedIndexChanged"></asp:ListBox>
            <br />
            <asp:Button ID="eliminarBT" runat="server" OnClick="eliminarBT_Click" Text="Eliminar Denuncia" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Denuncia:"></asp:Label>
&nbsp;<br />
            <asp:TextBox ID="textoTB" runat="server" Width="584px" Height="78px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Categoria:"></asp:Label>
            <br />
            <asp:DropDownList ID="categoriaDDL" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="nombre" DataValueField="idDenunciaCategoria" Height="16px" Width="332px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Denuncia" />
            <asp:Button ID="actualizarBT" runat="server" OnClick="actualizarBT_Click" Text="Actualizar Denuncia" />
            <br />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSourceDenuncias" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM Denuncias WHERE (idDenuncia = @idDenuncia)" InsertCommand="INSERT INTO Denuncias(idDenunciaCategoria, texto) VALUES (@idDenunciaCategoria, @texto)" SelectCommand="SELECT * FROM [Denuncias]" UpdateCommand="UPDATE Denuncias SET idDenunciaCategoria = @idDenunciaCategoria, texto = @texto WHERE (idDenuncia = @idDenuncia)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="denunciasLB" Name="idDenuncia" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="categoriaDDL" Name="idDenunciaCategoria" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="textoTB" Name="texto" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="categoriaDDL" Name="idDenunciaCategoria" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="textoTB" Name="texto" PropertyName="Text" />
                <asp:ControlParameter ControlID="denunciasLB" Name="idDenuncia" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [DenunciaCategorias]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDenunciasModificar" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT DenunciaCategorias.idDenunciaCategoria, Denuncias.texto, DenunciaCategorias.nombre FROM Denuncias INNER JOIN DenunciaCategorias ON Denuncias.idDenunciaCategoria = DenunciaCategorias.idDenunciaCategoria WHERE (Denuncias.idDenuncia = @idDenuncia)">
            <SelectParameters>
                <asp:ControlParameter ControlID="denunciasLB" Name="idDenuncia" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
