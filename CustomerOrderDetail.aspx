<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerOrderDetail.aspx.cs" Inherits="WebformAssignment4.CustomerOrderDetail" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            margin-left: 10px;
        }
        .auto-style2 {
            text-align: left;
            margin-left: 250px;
        }

        .auto-style3 {
            text-align: center;
            margin-left: 250px;
            margin-bottom: 50px;
        }

        .auto-style4 {
            text-align: justify;
        }

        .auto-style5 {
            margin: 0 15px;

        }
        
        .auto-style6 {
            color: #999999;
            margin-left: 250px;
            margin-bottom: 50px;
        }
        .auto-style7 {
            margin-left: 300px;
            color: #CC6600;
            font-size: large;
        }

        .auto-style8 {
            text-align: left;
        }

        .auto-style9 {
            margin-left: 315px;
            color: #000000;
            font-size: medium;
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
            <br />
            <span class="auto-style6">Detail View: </span> <asp:Label ID="lblCustomerName" runat="server" CssClass="auto-style1" Text="Customer Full Name"></asp:Label>
            
            <hr />
            <asp:FormView ID="fvCustomer" class="auto-style3" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSourceCustomer" OnDataBound="FvCustomer_DataBound" OnItemUpdated="FvCustomer_ItemUpdated">
                <EditItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td><strong>ID:</strong></td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td class="auto-style8">&nbsp;</td>
                        </tr>
                        <tr>
                            <td><strong>First Name:</strong></td>
                            <td>
                                <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                             </td>
                            <td class="auto-style8">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="custFirstTextBox" ErrorMessage="First letter must be capital, rest of letters small, max num of letters 12!" ForeColor="Red" ValidationExpression="^[A-Z]{1}[a-z]{2,12}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Last Name:</strong></td>
                            <td>
                                <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                            </td>
                            <td class="auto-style8">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="custLastTextBox" ErrorMessage="First letter must be capital, rest of letters small, max num of letters 12!" ForeColor="Red" ValidationExpression="^[A-Z]{1}[a-z]{2,12}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Phone:</strong></td>
                            <td>
                                <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                            </td>
                            <td class="auto-style8">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="custPhoneTextBox" ErrorMessage="Insert phone as xxxxxxxxxx format" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}))?\d{3}\d{4}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Address:</strong></td>
                            <td>
                                <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                            </td>
                            <td class="auto-style8">&nbsp;</td>
                        </tr>
                        <tr>
                            <td><strong>City:</strong></td>
                            <td>
                                <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                            </td>
                            <td class="auto-style8">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="custCityTextBox" ErrorMessage="Required!"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Postal:</strong></td>
                            <td>
                                <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                            </td>
                            <td class="auto-style8">&nbsp;</td>
                        </tr>
                        <tr>
                            <td><strong>Email:</strong></td>
                            <td>
                                <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                            </td>
                            <td class="auto-style8">&nbsp;</td>
                        </tr>
                    </table>
                    <div class="auto-style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
               
                    </div>
                     </EditItemTemplate>
                
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>First Name:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custFirstLabel" runat="server" Text='<%# Bind("custFirst") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>Last Name:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custLastLabel" runat="server" Text='<%# Bind("custLast") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>Phone:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custPhoneLabel" runat="server" Text='<%# Bind("custPhone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>Address:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custAddressLabel" runat="server" Text='<%# Bind("custAddress") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>City:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custCityLabel" runat="server" Text='<%# Bind("custCity") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>Postal:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custPostalLabel" runat="server" Text='<%# Bind("custPostal") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8"><strong>Email:</strong></td>
                            <td class="auto-style4">
                                <asp:Label ID="custEmailLabel" runat="server" Text='<%# Bind("custEmail") %>' />
                            </td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;
                </ItemTemplate>
            </asp:FormView>

            <div class="auto-style3">
            <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSourceOrderUpdate" OnSelectedIndexChanged="GvOrder_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select" Text="Select" CssClass="auto-style5"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                           <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="auto-style5"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order" SortExpression="ordNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ordNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ordNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" SortExpression="ordDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ordDate", "{0:d}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ordDate", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Paid" SortExpression="ordPaid">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ordPaid") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("ordPaid") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment" SortExpression="paymentID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSourcePayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSourcePayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>' Enabled="False">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="custID" HeaderText="C" SortExpression="custID" />
                    <asp:BoundField DataField="empID" HeaderText="E" SortExpression="empID" />
                </Columns>
            </asp:GridView>
            </div>
            <asp:Label ID="lblRemindText" runat="server" Text="Select Order to see orderlines..." CssClass="auto-style7"></asp:Label>
          
          
            <asp:GridView ID="gvOrderDetails" class="auto-style2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceOrderDetail" OnDataBound="GvOrderDetails_DataBound">
                <Columns>
                    <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                    <asp:BoundField DataField="orlQuantity" HeaderText="Qty" SortExpression="orlQuantity" />
                    <asp:BoundField DataField="orlPrice" HeaderText="Price" SortExpression="orlPrice" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="lineTotal" HeaderText="Total" ReadOnly="True" SortExpression="lineTotal" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>
            <strong>
            <asp:Label ID="lblOrderTotal" runat="server" Text="Order total amount is here" CssClass="auto-style9" Visible="False"></asp:Label>
          
            </strong>
          
            <asp:ObjectDataSource ID="ObjectDataSourceCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.LookupCRUD_DataSetTableAdapters.CustomerTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            
            
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOrder" Name="Param1" PropertyName="Rows[0].Cells[7].Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceOrderUpdate" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.LookupCRUD_DataSetTableAdapters.ReceiptUpdateTableAdapter" UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Param1" SessionField="selectedOrder" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceOrderDetail" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.LookupCRUD_DataSetTableAdapters.OrderDetailsTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOrder" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourcePayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="LibraryAssignment4_TsogtBatjargal.LookupCRUD_DataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>

        &nbsp;<br />
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSourceCustomer">
            </asp:FormView>

        </div>
    </form>
</body>
</html>
