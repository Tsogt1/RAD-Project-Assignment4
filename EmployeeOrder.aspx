<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeOrder.aspx.cs" Inherits="WebformAssignment4.EmployeeCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            margin-top: 100px;
        }
        .auto-style1 {
            color: #000000;
            margin-left: 20px;
            font-size: large;
        }
        .auto-style3 {
            text-align: center;
            justify-content: center;
        }
        .auto-style4 {
            text-align: center;
            height: 52px;
        }
        .auto-style5 {
            margin-left: 230px;
            font-size: medium;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            text-align: center;
        }
        .Background {
            background-color: gainsboro;
            filter: opacity(90);
            opacity: 0.8;
            padding-top: 130px;
        }

    </style>
</head>
<body class="Background">
    <form id="form1" runat="server">
        <div>
            <div class="auto-style4">
            <asp:DropDownList ID="ddlEmployees" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSourceEmployees" DataTextField="empFullName" DataValueField="id" Height="35px" Width="213px" OnSelectedIndexChanged="DdlEmployees_SelectedIndexChanged" ViewStateMode="Disabled" CssClass="auto-style6">
            </asp:DropDownList>
                <asp:Label ID="lblPosition" runat="server" Text="Select Employee..." CssClass="auto-style1" ForeColor="#CC6600"></asp:Label>
                <br />
            <br />
            <br />
            </div>
            <div class="auto-style7">
            <asp:GridView ID="gvOrderList" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSourceReceipts" OnSelectedIndexChanged="GvOrders_SelectedIndexChanged" CssClass="auto-style5" Width="835px" Visible="False">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="#" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="custFullName" HeaderText="Customer Name" ReadOnly="True" SortExpression="custFullName" />
                    <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                    <asp:BoundField DataField="ordNumber" HeaderText="Order" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                </Columns>
            </asp:GridView>
            </div>
            <div class="auto-style3">
            <br />
            <br />
            </div>
            <asp:ObjectDataSource ID="ObjectDataSourceEmployees" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.EmmasDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceReceipts" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.EmmasDataSetTableAdapters.ReceiptTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEmployees" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="auto-style3">
            <br />
            </div>
        </div>
    </form>
</body>
</html>
