<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
    MasterPageFile="~/Site1.Master" Inherits="JulieGreger_AddressBook.Default" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder">

            <div class="auto-style2">
            
            <asp:GridView ID="gvAddress" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" Height="220px" Width="868px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="4" AllowPaging="True" PagerSettings-Mode="NextPreviousFirstLast">
                <Columns>
           
                    <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">

                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="First name is a required field." ForeColor="Red" Text="*" ControlToValidate="Textbox1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>

                        <ItemStyle Width="150px" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
           
                    <asp:BoundField DataField="CellNumber" HeaderText="Cell Number" SortExpression="CellNumber" >
                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Relationship" HeaderText="Relationship/Business" SortExpression="Relationship" >
                    <ItemStyle HorizontalAlign="Center" Width="220px" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />

<PagerSettings Mode="NextPreviousFirstLast"></PagerSettings>

                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [FirstName], [LastName], [CellNumber], [Relationship] FROM [Contacts] ORDER BY [LastName]"></asp:SqlDataSource>

            <br />
            <br />

            <asp:DetailsView ID="dvAddress" runat="server" Height="214px" Width="405px" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnItemDeleted="dvAddress_ItemDeleted" OnItemInserted="dvAddress_ItemInserted" OnItemUpdated="dvAddress_ItemUpdated" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ValidateRequestMode="Enabled">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields>
                    
                    <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox1" runat="server" ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="HomeNumber" HeaderText="Home Number" SortExpression="HomeNumber" />
                    <asp:TemplateField HeaderText="Cell Number" SortExpression="CellNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CellNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ErrorMessage="Cell phone is required."></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CellNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox2" runat="server" ErrorMessage="Cell phone is required."></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CellNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
                    <asp:BoundField DataField="Relationship" HeaderText="Relationship/Business" SortExpression="Relationship" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([HomeNumber] = @original_HomeNumber) OR ([HomeNumber] IS NULL AND @original_HomeNumber IS NULL)) AND (([CellNumber] = @original_CellNumber) OR ([CellNumber] IS NULL AND @original_CellNumber IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([Relationship] = @original_Relationship) OR ([Relationship] IS NULL AND @original_Relationship IS NULL))" 
                InsertCommand="INSERT INTO [Contacts] ([FirstName], [LastName], [Address], [HomeNumber], [CellNumber], [EmailAddress], [Relationship]) VALUES (@FirstName, @LastName, @Address, @HomeNumber, @CellNumber, @EmailAddress, @Relationship)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Contacts] WHERE ([Id] = @Id)" 
                UpdateCommand="UPDATE [Contacts] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [HomeNumber] = @HomeNumber, [CellNumber] = @CellNumber, [EmailAddress] = @EmailAddress, [Relationship] = @Relationship WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([HomeNumber] = @original_HomeNumber) OR ([HomeNumber] IS NULL AND @original_HomeNumber IS NULL)) AND (([CellNumber] = @original_CellNumber) OR ([CellNumber] IS NULL AND @original_CellNumber IS NULL)) AND (([EmailAddress] = @original_EmailAddress) OR ([EmailAddress] IS NULL AND @original_EmailAddress IS NULL)) AND (([Relationship] = @original_Relationship) OR ([Relationship] IS NULL AND @original_Relationship IS NULL))" ConflictDetection="CompareAllValues">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_HomeNumber" Type="String" />
                    <asp:Parameter Name="original_CellNumber" Type="String" />
                    <asp:Parameter Name="original_EmailAddress" Type="String" />
                    <asp:Parameter Name="original_Relationship" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="HomeNumber" Type="String" />
                    <asp:Parameter Name="CellNumber" Type="String" />
                    <asp:Parameter Name="EmailAddress" Type="String" />
                    <asp:Parameter Name="Relationship" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvAddress" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="HomeNumber" Type="String" />
                    <asp:Parameter Name="CellNumber" Type="String" />
                    <asp:Parameter Name="EmailAddress" Type="String" />
                    <asp:Parameter Name="Relationship" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_HomeNumber" Type="String" />
                    <asp:Parameter Name="original_CellNumber" Type="String" />
                    <asp:Parameter Name="original_EmailAddress" Type="String" />
                    <asp:Parameter Name="original_Relationship" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>

</asp:Content>