using System;
using System.Globalization;
using System.Web.UI.WebControls;

namespace WebformAssignment4
{
    public partial class CustomerOrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
        }        

        //header label for Customer Full Name
        protected void FvCustomer_DataBound(object sender, EventArgs e)
        {
            if ((Label)fvCustomer.FindControl("custFirstLabel") != null)
                this.lblCustomerName.Text = ((Label)fvCustomer.FindControl("custFirstLabel")).Text + " "
                                  + ((Label)fvCustomer.FindControl("custLastLabel")).Text;
        }


        protected void FvCustomer_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                MessageBoxShow("Database cant accept your update, Please check your input!");
            }
        }

        protected void GvOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRemindText.Visible = false;
            lblOrderTotal.Visible = true;
        }


        protected void GvOrderDetails_DataBound(object sender, EventArgs e)
        {
            decimal price = 0;
            foreach (GridViewRow row in gvOrderDetails.Rows)
            {
                price += row.Cells[3] != null ? Decimal.Parse(row.Cells[3].Text, NumberStyles.Currency) : 0;
            }

            lblOrderTotal.Text = "Order total is " + price.ToString("C");
        }

        protected void MessageBoxShow(string message)
        {
            Response.Write("<script>alert('" + message + "')</script>");
        }


    }
}