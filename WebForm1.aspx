<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="shopping_cart.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left">
    
        <asp:Panel ID="Panel1" runat="server" style="text-align: center">
            <asp:Label ID="Label1" runat="server" 
    BorderColor="#660033" Font-Bold="True" Font-Names="Algerian" Font-Size="Larger" 
    Font-Strikeout="False" ForeColor="#CC6699" Height="38px" Text="Shopping Cart" 
    Width="290px"></asp:Label>
        </asp:Panel>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Welcome To Omkar Accessreis"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        no of cart:
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddToCart.aspx">show cart</asp:HyperLink>
        <br />
        <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DataKeyField="product_id" DataSourceID="SqlDataSource1" 
            GridLines="Both" onselectedindexchanged="DataList1_SelectedIndexChanged" 
            RepeatColumns="3" RepeatDirection="Horizontal" 
            onitemcommand="DataList1_ItemCommand">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table bgcolor="#CCFFCC" border="1" class="style1">
                    <tr>
                        <td style="text-align: center">
                            Product ID<asp:Label ID="Label3" runat="server" 
                                Text='<%# Eval("product_id") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Image ID="Image1" runat="server" Height="50px" 
                                ImageUrl='<%# Eval("Product_img") %>' Width="50px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            Rs.<asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            ADD TO CART<asp:ImageButton ID="ImageButton1" runat="server" 
                                CommandName="addtocart" Height="50px" ImageUrl="~/images/cart.png" 
                                Width="50px"  CommandArgument='<%# Eval("product_id")%>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:om_shoppingConnectionString %>" 
            SelectCommand="SELECT * FROM [product_Details]" 
            ProviderName="<%$ ConnectionStrings:om_shoppingConnectionString.ProviderName %>"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
