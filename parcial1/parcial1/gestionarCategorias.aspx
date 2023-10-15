<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarCategorias.aspx.cs" Inherits="parcial1.gestionarCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Categorias Registradas"></asp:Label>
            <br />
            <asp:ListBox ID="categoriasLB" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="nombre" DataValueField="idDenunciaCategoria" Height="142px" Width="329px" AutoPostBack="True" OnSelectedIndexChanged="categoriasLB_SelectedIndexChanged"></asp:ListBox>
            <br />
            <asp:Button ID="eliminarBT" runat="server" OnClick="eliminarBT_Click" Text="Eliminar Categoria" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Categoria:"></asp:Label>
&nbsp;<br />
            <asp:TextBox ID="categoriaTB" runat="server" MaxLength="50" Width="324px"></asp:TextBox>
            <br />
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Categoria" />
            <asp:Button ID="actualizarBT" runat="server" OnClick="actualizarBT_Click" Text="Actualizar Categoria" />
            <br />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM DenunciaCategorias WHERE (idDenunciaCategoria = @idDenunciaCategoria)" InsertCommand="INSERT INTO DenunciaCategorias(nombre) VALUES (@nombre)" SelectCommand="SELECT idDenunciaCategoria, nombre FROM DenunciaCategorias ORDER BY nombre" UpdateCommand="UPDATE DenunciaCategorias SET nombre = @nombre WHERE (idDenunciaCategoria = @idDenunciaCategoria)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="categoriasLB" Name="idDenunciaCategoria" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="categoriaTB" Name="nombre" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="categoriaTB" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="categoriasLB" Name="idDenunciaCategoria" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
