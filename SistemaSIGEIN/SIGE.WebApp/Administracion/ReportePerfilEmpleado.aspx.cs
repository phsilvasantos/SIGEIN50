﻿using SIGE.Entidades;
using SIGE.Entidades.Externas;
using SIGE.Negocio.Administracion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace SIGE.WebApp.Administracion
{
    public partial class ReportePerfilEmpleado : System.Web.UI.Page
    {
        #region Variables

        private string vClUsuario;
        private string vNbPrograma;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdPerfilEmpleados_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            EmpleadoNegocio perfilEmpleado = new EmpleadoNegocio();
            List<SPE_OBTIENE_PERFIL_EMPLEADOS_Result> listaPerfilEmpleados = new List<SPE_OBTIENE_PERFIL_EMPLEADOS_Result>();
            listaPerfilEmpleados = perfilEmpleado.ObtenerPerfilEmpleados();
            grdPerfilEmpleados.DataSource = listaPerfilEmpleados;
        }

        protected void grdPerfilEmpleados_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "ExportToExcel":
                    ExportarExcel();
                    break;
                default:
                    break;
            }
        }

        private void ExportarExcel()
        {
            grdPerfilEmpleados.ExportSettings.OpenInNewWindow = true;
            foreach (GridColumn col in grdPerfilEmpleados.MasterTableView.RenderColumns)
            {
                col.Display = true;
            }
            grdPerfilEmpleados.Rebind();
            grdPerfilEmpleados.MasterTableView.ExportToExcel();
        }

        protected void grdPerfilEmpleados_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridPagerItem)
            {
                RadComboBox PageSizeCombo = (RadComboBox)e.Item.FindControl("PageSizeComboBox");

                PageSizeCombo.Items.Clear();
                PageSizeCombo.Items.Add(new RadComboBoxItem("10"));
                PageSizeCombo.FindItemByText("10").Attributes.Add("ownerTableViewId", grdPerfilEmpleados.MasterTableView.ClientID);
                PageSizeCombo.Items.Add(new RadComboBoxItem("50"));
                PageSizeCombo.FindItemByText("50").Attributes.Add("ownerTableViewId", grdPerfilEmpleados.MasterTableView.ClientID);
                PageSizeCombo.Items.Add(new RadComboBoxItem("100"));
                PageSizeCombo.FindItemByText("100").Attributes.Add("ownerTableViewId", grdPerfilEmpleados.MasterTableView.ClientID);
                PageSizeCombo.Items.Add(new RadComboBoxItem("500"));
                PageSizeCombo.FindItemByText("500").Attributes.Add("ownerTableViewId", grdPerfilEmpleados.MasterTableView.ClientID);
                PageSizeCombo.Items.Add(new RadComboBoxItem("1000"));
                PageSizeCombo.FindItemByText("1000").Attributes.Add("ownerTableViewId", grdPerfilEmpleados.MasterTableView.ClientID);
                PageSizeCombo.FindItemByText(e.Item.OwnerTableView.PageSize.ToString()).Selected = true;
            }
        }
    }
}