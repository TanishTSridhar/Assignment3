<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="Assignment3.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PROJECT DETAILS</title>

     <style type="text/css">
        .auto-style1 {
            height: 281px;
            width: 469px;
            margin-left:auto;
            margin-right:auto;
        }
      
        .auto-style6 {
            height: 40px;
            width: 469px;
            margin-left: auto;
            margin-right: auto;
             margin-top: 0px;
         }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <h1> PROJECT DETAILS </h1>

            <table align="right">
                 <tr>  
                     
                    <td class="auto-style8">  
                        <asp:TextBox ID="Search" runat="server"  placeholder="Search...."  ToolTip="Search Project By Project Name"></asp:TextBox>

                    </td>  
                     <td>

                         <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />

                     </td>
                </tr>   

            </table>


               <table class="auto-style1"> 
                   
                   <!--Project Number -->

                    <tr>  
                    <td class="auto-style7">  
                        <asp:Label ID="Label1" runat="server" Text=" Project Number : "></asp:Label>

                    </td>  
                    <td class="auto-style8">  
                        <asp:label ID="ProjectNumbe" runat="server" ></asp:label>

                    &nbsp;</td>  
                </tr>   
                       

                    <!--Project Name-->

                    <tr>  
                    <td class="auto-style7">  
                        <asp:Label ID="Label2" runat="server" Text=" Project Name : "></asp:Label>

                    </td>  
                    <td class="auto-style8">  
                        <asp:TextBox ID="ProjectName" runat="server" ToolTip="Enter Project Name"></asp:TextBox>

                    </td>  
                </tr>   

                     <!-- Start Date -->
                   <tr>
                       <td class="auto-style4">  
                        <asp:Label ID="Label3" runat="server" Text=" Start Date : "></asp:Label>

                     </td>  
                          <td class="auto-style5">
                              <asp:TextBox ID="StartDate" runat="server"  ToolTip="dd/mm/yyyy" CssClass="auto-style3" Height="18px"></asp:TextBox>

                                                            
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
            </table>
           <!-- Buttons -->

            <table class="auto-style6">
                <tr>
                       <td>

                           <asp:Button ID="Save" runat="server" Text="Save" OnClick="Insert_Project" />
                           <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                           

                       </td>

                    <td>
                        <asp:Button ID="Reset" runat="server" Text="Reset" OnClick="Reset_Click" />

                    </td>
                   </tr>
            </table>

        </div>
        <p>
            &nbsp;</p>
        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView_RowCommand" OnRowDeleting="GridView_RowDeleting" OnRowEditing="GridView_RowEditing" >
            <Columns>
                <asp:BoundField DataField="ProjectNumber" HeaderText="Project Number" />
                <asp:BoundField DataField="ProjectName" HeaderText="Project Name" />
                <asp:BoundField DataField="Startdate" HeaderText="Start Date" />


                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ProjectNumber") %>' >Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ProjectNumber") %>' >Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
