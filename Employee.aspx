<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Assignment3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EMPLOYEE DETAILS</title>
    <style type="text/css">
        .auto-style1 {
            height: 281px;
            width: 469px;
            margin-left:auto;
            margin-right:auto;
        }
        .auto-style2 {
            height: 45px;
        }
        .auto-style3 {
            margin-top: 0px;
        }
        .auto-style4 {
            height: 47px;
            margin-top: 0px;
        }
        .auto-style5 {
            height: 47px;
        }
        .auto-style6 {
            height: 40px;
            width: 469px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1> EMPLOYEE DETAILS</h1>

            <table align="right">
                 <tr>  
                     
                    <td class="auto-style8">  
                        <asp:TextBox ID="Search" runat="server"  placeholder="Search...."  ToolTip="Search Employee By Employee First Name"></asp:TextBox>

                    </td>  
                     <td>

                         <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />

                     </td>
                </tr>   

            </table>


               <table class="auto-style1"> 
                   
                   <!--Employee Number -->

                    <tr>  
                    <td class="auto-style3">  
                        <asp:Label ID="Label1" runat="server" Text=" Employee Number : "></asp:Label>

                    </td>  
                    <td>  
                        <asp:Label ID="EmployeeNumbe" runat="server" ></asp:Label>

                    </td>  
                </tr>   

                    <!--Job title-->

                    <tr>  
                    <td class="auto-style3">  
                        <asp:Label ID="Label2" runat="server" Text=" Job Title : "></asp:Label>

                    </td>  
                    <td>  
                        <asp:TextBox ID="Job_title" runat="server" ToolTip="Enter Job Title"></asp:TextBox>

                    </td>  
                </tr>   

                    <!--Last Name -->

                    <tr>  
                    <td class="auto-style3">  
                        <asp:Label ID="Label3" runat="server" Text=" Last Name : "></asp:Label>

                    </td>  
                    <td>  
                        <asp:TextBox ID="LastName" runat="server" ToolTip="Enter Last Name"></asp:TextBox>

                    </td>  
                </tr>   

                    <!--First tName -->

                    <tr>  
                    <td class="auto-style3">  
                        <asp:Label ID="Label4" runat="server" Text=" First Name : "></asp:Label>

                    </td>  
                    <td>  
                        <asp:TextBox ID="FirstName" runat="server" ToolTip="Enter First Name"></asp:TextBox>

                    </td>  
                </tr>   

                     <!-- Gender -->

                    <tr>  
                    <td class="auto-style2">  
                        <asp:Label ID="Label5" runat="server" Text=" Gender : "></asp:Label>

                    </td>  
                    <td class="auto-style2">  
                       

                        
                        <asp:RadioButtonList ID="Gender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:RadioButtonList>
                       

                        
                    </td>  
                </tr>   

                    <!-- Birthday -->
                   <tr>
                       <td class="auto-style4">  
                        <asp:Label ID="Label6" runat="server" Text=" Date Of Birth : "></asp:Label>

                     </td>  
                          <td class="auto-style5">
                              <asp:TextBox ID="Birthday" runat="server"  ToolTip="dd/mm/yyyy" CssClass="auto-style3" Height="18px"></asp:TextBox>

                                                            
                                <asp:ImageButton ID="ImageCalendar" runat="server"  Width="37px" ImageUrl="calendar_button.jpg" OnClick="ImageCalendar1_Click" />  
                              

                          <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                              <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                              <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                              <OtherMonthDayStyle ForeColor="#999999" />
                              <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                              <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                              <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                              <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                              <WeekendDayStyle BackColor="#CCCCFF" />
                              </asp:Calendar> 
                              

                            </td>
                   </tr>

                   
                    <!-- Hire date -->
                   <tr>
                       <td class="auto-style4">  
                        <asp:Label ID="Label7" runat="server" Text=" Hire Date : "></asp:Label>

                     </td>  
                          <td class="auto-style5">
                              <asp:TextBox ID="Hiredate" runat="server"  ToolTip="dd/mm/yyyy" CssClass="auto-style3" Height="18px"></asp:TextBox>

                                                            
                                <asp:ImageButton ID="ImageButton2" runat="server"  Width="37px" ImageUrl="calendar_button.jpg" OnClick="ImageCalendar2_Click" />  
                              

                          <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                              <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                              <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                              <OtherMonthDayStyle ForeColor="#999999" />
                              <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                              <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                              <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                              <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                              <WeekendDayStyle BackColor="#CCCCFF" />
                              </asp:Calendar> 
                              

                            </td>
                   </tr>

                    <!-- Deprtment Number -->

                    <tr>  
                    <td class="auto-style2">  
                        <asp:Label ID="Label8" runat="server" Text=" Department Name : "></asp:Label>

                    </td>  
                    <td class="auto-style2">  
                        
                        
                        <asp:DropDownList ID="DepartmentNumber" runat="server" DataSourceID="SqlDataSource1"  DataTextField="DepartmentName" DataValueField="DepartmentNumber">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Assignment3ConnectionString2 %>" SelectCommand="SELECT [DepartmentName], [DepartmentNumber] FROM [Department]"></asp:SqlDataSource>
                        
                        
                    </td>  
                </tr>   


                   <!-- Product Number -->

                    <tr>  
                    <td class="auto-style2">  
                        <asp:Label ID="Label9" runat="server" Text=" Project Name : "></asp:Label>

                        

                    </td>  
                    <td class="auto-style2">  
                        
                        
                        <asp:DropDownList ID="ProjectNumber" runat="server" DataSourceID="SqlDataSource2" DataTextField="ProjectName" DataValueField="ProjectNumber">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Assignment3ConnectionString %>" SelectCommand="SELECT [ProjectNumber], [ProjectName] FROM [Project]"></asp:SqlDataSource>
                        
                        
                    </td>  
                </tr>  

               </table>

            <!-- Buttons -->

            <table class="auto-style6">
                <tr>
                       <td>

                           <asp:Button ID="Save" runat="server" Text="Save" OnClick="Insert_Employee" />
                           <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                           

                       </td>

                    <td>
                        <asp:Button ID="Reset" runat="server" Text="Reset" OnClick="Reset_Click" />

                    </td>
                   </tr>
            </table>

                   


         
            <!-- Grid veiw -->
        
            
        </div>

        
        <br />
        <br />

       
        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
            <Columns>
                <asp:BoundField DataField="EmployeeNumber" HeaderText="Employee Number" SortExpression="EmployeeNumber" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Job_title" HeaderText="Job Title" SortExpression="Job_title" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="Date Of Birth" SortExpression="DateOfBirth" />
                <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate" />
                <asp:BoundField DataField="DepartmentNumber" HeaderText="Department Number" SortExpression="DepartmentNumber" />
                <asp:BoundField DataField="ProjectNumber" HeaderText="Project Number" SortExpression="ProjectNumber" />


                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("EmployeeNumber") %>'>Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("EmployeeNumber") %>'>Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
   
    </form>
</body>
</html>
                              
