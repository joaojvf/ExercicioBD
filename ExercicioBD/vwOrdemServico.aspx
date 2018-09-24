<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vwOrdemServico.aspx.cs" Inherits="ExercicioBD.vwOrdemServico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Data de Solicitação"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDataSolicitacao" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Prazo de Entrega"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrazoEntrega" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownStatus" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Aberto</asp:ListItem>
                            <asp:ListItem>Andamento</asp:ListItem>
                            <asp:ListItem>Finalizado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Button ID="BtnSalvar" runat="server" Text="Salvar" />
            <asp:Button ID="BtnAlterar" runat="server" Text="Alterar" />
            <asp:Button ID="BtnListar" runat="server" Text="Listar" />
        </div>
    </form>
</body>
</html>
