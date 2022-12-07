<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to switch date formats for the GridViewDataDateColumn at runtime</title>

    <script type="text/javascript">
        function OnSelectedIndexChanged (s, e) {
            e.processOnServer = false;
            
            grid2.PerformCallback (s.GetText());
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
                SelectCommand="SELECT [EmployeeID], [LastName], [BirthDate] FROM [Employees]"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>
                        <b>PostBack Solution</b>
                    </td>
                    <td>
                        <b>Callback Solution </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="grid1" runat="server" AutoGenerateColumns="False" DataSourceID="sds"
                            KeyFieldName="EmployeeID" ClientInstanceName="grid1">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="2">
                                </dx:GridViewDataDateColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </td>
                    <td>
                        <dx:ASPxGridView ID="grid2" runat="server" AutoGenerateColumns="False" DataSourceID="sds"
                            KeyFieldName="EmployeeID" ClientInstanceName="grid2" OnCustomCallback="grid2_CustomCallback">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="2">
                                </dx:GridViewDataDateColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cmbDate1" runat="server" AutoPostBack="true" ValueType="System.Int32"
                            SelectedIndex="0" OnSelectedIndexChanged="cmbDate1_SelectedIndexChanged">
                            <Items>
                                <dx:ListEditItem Text="MM.dd.yyyy" Value="0" />
                                <dx:ListEditItem Text="dd.MM.yyyy" Value="1" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbDate2" runat="server" AutoPostBack="false" ValueType="System.Int32"
                            SelectedIndex="0">
                            <Items>
                                <dx:ListEditItem Text="MM.dd.yyyy" Value="0" />
                                <dx:ListEditItem Text="dd.MM.yyyy" Value="1" />
                            </Items>
                            <ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
