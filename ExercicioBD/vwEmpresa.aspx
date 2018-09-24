<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vwEmpresa.aspx.cs" Inherits="ExercicioBD.vwEmpresa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>   
            <asp:Label ID="LblRazaoSocial" runat="server" Text="Razão Social: "></asp:Label>
            <asp:TextBox ID="TxtRazaoSocial" runat="server" OnTextChanged="TxtRazaoSocial_TextChanged"></asp:TextBox>
        </div>
        <div>   
            <asp:Label ID="LblCnpj" runat="server" Text="CNPJ:"></asp:Label>
            <asp:TextBox ID="TxtCnpj" runat="server" OnTextChanged="TxtCnpj_TextChanged"></asp:TextBox>
        </div>

         <div>   
            <asp:Label ID="LblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="TxtEmail" runat="server" OnTextChanged="TxtEmail_TextChanged"></asp:TextBox>
        </div>
         <div>   
            <asp:Label ID="LblSenha" runat="server" Text="Senha:"></asp:Label>
        <asp:TextBox ID="TxtSenha" runat="server" TextMode="Password" OnTextChanged="TxtSenha_TextChanged"></asp:TextBox>
        </div>
        
        <div> 
            <asp:Button ID="BtnAdd" runat="server" Text="Adicionar" OnClick="BtnAdd_Click" style="height: 26px" />
        </div>
        <asp:Label ID="LblResultado" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
