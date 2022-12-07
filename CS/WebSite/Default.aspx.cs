using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(Object sender, EventArgs e) {
        // grid1 initialization
        if (!IsPostBack) {
            GridViewDataDateColumn column1 = grid1.Columns["BirthDate"] as GridViewDataDateColumn;
            column1.PropertiesDateEdit.DisplayFormatString = cmbDate1.Text;
        }
     
        // grid2 initialization
        GridViewDataDateColumn column2 = grid2.Columns["BirthDate"] as GridViewDataDateColumn;
        column2.PropertiesDateEdit.DisplayFormatString = cmbDate2.Text;
    }

    protected void cmbDate1_SelectedIndexChanged(object sender, EventArgs e) {
        GridViewDataDateColumn column1 = grid1.Columns["BirthDate"] as GridViewDataDateColumn;
        column1.PropertiesDateEdit.DisplayFormatString = cmbDate1.Text;

        // grid1 hierarchy re-creation
        grid1.DataBind();

        // grid2 hierarchy re-creation
        grid2.DataBind();
    }

    protected void grid2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
        // grid2 hierarchy re-creation
        grid2.DataBind();
    }
}
