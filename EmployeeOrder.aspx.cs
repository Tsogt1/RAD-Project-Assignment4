using System;
using System.Data;
using LibraryAssignment4_TsogtBatjargal;
using LibraryAssignment4_TsogtBatjargal.EmmasDataSetTableAdapters;

namespace WebformAssignment4
{
    public partial class EmployeeCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {}

        private static readonly EmmasDataSet dsEmployee;
        
        static EmployeeCustomers()
        {
            dsEmployee = new EmmasDataSet();
            EmployeeTableAdapter daEmployee = new EmployeeTableAdapter();
            try
            {
                daEmployee.Fill(dsEmployee.Employee);                
            }
            catch { }
        }

        protected void DdlEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmployees.SelectedIndex != -1)
            {
                gvOrderList.Visible = true;
                lblPosition.ForeColor = System.Drawing.Color.Black;

                int id = Convert.ToInt32(dsEmployee.Employee[ddlEmployees.SelectedIndex].ItemArray[0]);
                DataRow employee = dsEmployee.Employee.FindByid(id);
                if (employee != null)
                {
                    this.lblPosition.Text = employee.ItemArray[1].ToString();
                }
                else
                {
                    this.lblPosition.Text = "Employee Not Found!" ;
                }                
            }            
            
        }

        protected void GvOrders_SelectedIndexChanged(object sender, EventArgs e)
        {
            //display selected record
            if (gvOrderList.SelectedIndex != -1)
            {
                string selectedReceiptID = gvOrderList.SelectedRow.Cells[1].Text; //selecting Receipt ID for passing next page
                Session["selectedOrder"] = selectedReceiptID;                
                Response.Redirect("CustomerOrderDetail.aspx");
            }
            
            
        }
    }
}