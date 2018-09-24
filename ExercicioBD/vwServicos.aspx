<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vwServicos.aspx.cs" EnableEventValidation="false" Inherits="ExercicioBD.vwServicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gdvServico" runat="server"
            AutoGenerateColumns="False" 
            DataKeyNames="cod_servico"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowUpdating="gdvServico_RowUpdating1"  >
            <Columns>
                <asp:TemplateField HeaderText="Número">   
                    <ItemTemplate>
                        <asp:Label ID="LblRua" runat="server" Text='<%# Bind("cod_servico") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valor">
                        <ItemTemplate>
                            <asp:Label ID="LblValor" runat="server" Text='<%# Bind("valor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tempo Médio">
                        <ItemTemplate>
                            <asp:Label ID="LblTempo" runat="server" Text='<%# Bind("tempo_medio") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantidade">
                        <ItemTemplate>
                            <asp:TextBox ID="TxtQuantidade" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Adicionar" CommandName = "Update" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
             <asp:TextBox ID="txtDataSolicitacao" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
