using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JulieGreger_AddressBook
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
                gvAddress.Visible = true;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        { 
            gvAddress.Visible = true;
            if (gvAddress.SelectedRow == null)
            {
                dvAddress.Visible = false;
            }
            else {
                dvAddress.Visible = true;
            }
            
        }
        protected void dvAddress_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gvAddress.DataBind();
            gvAddress.SelectRow(-1);
        }
       

        protected void dvAddress_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gvAddress.DataBind();
            gvAddress.SelectRow(-1);
            dvAddress.Visible = true;
        }

        protected void dvAddress_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gvAddress.DataBind();
            gvAddress.SelectRow(-1);

        }
    }
}