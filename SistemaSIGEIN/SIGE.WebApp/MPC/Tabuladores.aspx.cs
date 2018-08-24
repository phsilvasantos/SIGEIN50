﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGE.Entidades.MetodologiaCompensacion;
using SIGE.Negocio.MetodologiaCompensacion;
using SIGE.Entidades;
using Telerik.Web.UI;
using SIGE.Entidades.Externas;
using SIGE.WebApp.Comunes;

namespace SIGE.WebApp.MPC
{
    public partial class Tabuladores : System.Web.UI.Page
    {
        private string vClUsuario;
        private string vNbPrograma;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        TabuladoresNegocio nTabulador = new TabuladoresNegocio();

        E_TABULADOR vTabulador
        {
            get { return (E_TABULADOR)ViewState["vs_vTabulador"]; }
            set { ViewState["vs_vTabulador"] = value; }
        }

        public int? vIdConsulta
        {
            get { return (int?)ViewState["vs_vIdConsulta"]; }
            set { ViewState["vs_vIdConsulta"] = value; }
        }

        public bool vFgEditar
        {
            get { return (bool)ViewState["vs_vFgEditar"]; }
            set { ViewState["vs_vFgEditar"] = value; }
        }


        public bool vFgEliminar
        {
            get { return (bool)ViewState["vs_vFgEliminar"]; }
            set { ViewState["vs_vFgEliminar"] = value; }
        }

        private void SeguridadProcesos()
        {
            btnAgregar.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.A");
            vFgEditar = ContextoUsuario.oUsuario.TienePermiso("K.A.A.B");
            vFgEliminar = ContextoUsuario.oUsuario.TienePermiso("K.A.A.C");
            btnConfigurar.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.D");
            btnVerNiveles.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.E");
            btnCambiarEstado.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.F");
            btnCopiar.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.G");
            btnValuar.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.H");
            btnCapturar.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.I");
            btnCrear.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.J");
            btnIncrementos.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.K");
            btnConsSueldos.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.L");
            btnGraficaAnalisis.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.M");
            btnDesviaciones.Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.N");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            vClUsuario = ContextoUsuario.oUsuario.CL_USUARIO;
            vNbPrograma = ContextoUsuario.nbPrograma;
            if (!IsPostBack)
            {
                SeguridadProcesos();
            }
        }
        
        //protected void grdTabuladores_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
           // grdTabuladores.DataSource = nTabulador.ObtenerTabuladores();
        //}

        private void ordenarListView(string ordenamiento)
        {
            var campo = cmbOrdenamiento.SelectedValue;
            rlvConsultas.Items[0].FireCommandEvent(RadListView.SortCommandName, campo + ordenamiento);
        }

        private void EstatusBotonesPeriodos(bool pFgEstatus)
        {
            //btnConfigurar.Enabled = pFgEstatus;
            btnCambiarEstado.Enabled = pFgEstatus;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (vIdConsulta != null)
            {
                var vMensaje = nTabulador.EliminaTabulador(vIdConsulta.Value, vClUsuario, vNbPrograma);
                UtilMensajes.MensajeResultadoDB(rwmMensaje, vMensaje.MENSAJE[0].DS_MENSAJE.ToString(), vMensaje.CL_TIPO_ERROR, 400, 150, "");
                vIdConsulta = null;
                rlvConsultas.Rebind();
                rlvConsultas.SelectedValues.Clear();
                rlvConsultas.SelectedItems.Clear();

                txtClPeriodo.Text = "";
                txtDsPeriodo.Text = "";
                txtClEstatus.Text = "";
                txtTipo.Text = "";
                txtUsuarioMod.Text = "";
                txtFechaMod.Text = "";
            }
            //foreach (GridDataItem item in grdTabuladores.SelectedItems)
            //{
            //    E_RESULTADO vResultado = nTabulador.EliminaTabulador(int.Parse(item.GetDataKeyValue("ID_TABULADOR").ToString()), vClUsuario, vNbPrograma);
            //    string vMensaje = vResultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            //    UtilMensajes.MensajeResultadoDB(rwmMensaje, vMensaje, vResultado.CL_TIPO_ERROR, pCallBackFunction: "onCloseWindow");
            //}
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
           TabuladoresNegocio nTabulador = new TabuladoresNegocio();
            var vpTabulador = nTabulador.ObtenerTabuladores(ID_TABULADOR: vIdConsulta).FirstOrDefault();

            if (vpTabulador.CL_ESTADO == "ABIERTO")
            {
                vpTabulador.CL_ESTADO = "CERRADO";
            }
            else
            {
                vpTabulador.CL_ESTADO = "ABIERTO";
            }
            vTabulador = new E_TABULADOR
            {
                CL_TABULADOR = vpTabulador.CL_TABULADOR,
                ID_TABULADOR = vpTabulador.ID_TABULADOR,
                NB_TABULADOR = vpTabulador.NB_TABULADOR,
                DS_TABULADOR = vpTabulador.DS_TABULADOR,
                NO_NIVELES = vpTabulador.NO_NIVELES,
                NO_CATEGORIAS = vpTabulador.NO_CATEGORIAS,
                PR_INFLACION = vpTabulador.PR_INFLACION,
                PR_PROGRESION = vpTabulador.PR_PROGRESION,
                XML_VARIACION = vpTabulador.XML_VARIACION,
                ID_CUARTIL_INCREMENTO = vpTabulador.ID_CUARTIL_INCREMENTO,
                ID_CUARTIL_INFLACIONAL = vpTabulador.ID_CUARTIL_INFLACIONAL,
                FE_CREACION = vpTabulador.FE_CREACION,
                FE_VIGENCIA = vpTabulador.FE_VIGENCIA,
                CL_ESTADO = vpTabulador.CL_ESTADO,
                CL_SUELDO_COMPARACION = vpTabulador.CL_SUELDO_COMPARACION,
                CL_TIPO_PUESTO = vpTabulador.CL_TIPO_PUESTO
            };

            E_RESULTADO vResultado = nTabulador.InsertaActualizaTabulador(usuario: vClUsuario, programa: vNbPrograma, pClTipoOperacion: E_TIPO_OPERACION_DB.A.ToString(), vTabulador: vTabulador);
            string vMensaje = vResultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            rlvConsultas.Rebind();
            EstatusBotonesPeriodos(false);
            UtilMensajes.MensajeResultadoDB(rwmMensaje, vMensaje, vResultado.CL_TIPO_ERROR, 400, 150, "");

        }

        //protected void grdTabuladores_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //GridDataItem item = (GridDataItem)grdTabuladores.SelectedItems[0];
        //    //int dataKey = int.Parse(item.GetDataKeyValue("ID_TABULADOR").ToString());
        //    ////if (dataKey != 0) {
        //    //    var vTabulador = nTabulador.ObtenerTabuladores(ID_TABULADOR: dataKey).FirstOrDefault();
        //    //    if (vTabulador.FG_MERCADO_SALARIAL.Equals(true))
        //    //        chbMercadoSalarial.Checked = true;
        //    //    else
        //    //        chbMercadoSalarial.Checked = false;
        //    //    if (vTabulador.FG_PLANEACION_INCREMENTOS.Equals(true))
        //    //        chbPlaneacionIncrementos.Checked = true;
        //    //    else
        //    //        chbPlaneacionIncrementos.Checked = false;
        //    //    if (vTabulador.FG_VALUACION_PUESTOS.Equals(true))
        //    //        chbValuacionPuestos.Checked = true;
        //    //    else
        //    //        chbValuacionPuestos.Checked = false;
        //    //    if (vTabulador.FG_TABULADOR_MAESTRO.Equals(true))
        //    //        chbTabuladorMaestro.Checked = true;
        //    //    else
        //    //        chbTabuladorMaestro.Checked = false;
        //    ////}
        //}

        protected void rlvConsultas_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
        {
            rlvConsultas.DataSource = nTabulador.ObtenerTabuladores();
        }

        protected void rlvConsultas_ItemCommand(object sender, RadListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                RadListViewDataItem item = e.ListViewItem as RadListViewDataItem;
               
                rlvConsultas.SelectedItems.Clear();
                item.Selected = true;

                int vIdConsultaLista = 0;
                if (int.TryParse(item.GetDataKeyValue("ID_TABULADOR").ToString(), out vIdConsultaLista))
                    vIdConsulta = vIdConsultaLista;

                SPE_OBTIENE_TABULADORES_Result vPeriodo =  nTabulador.ObtenerTabuladores(ID_TABULADOR: vIdConsulta).FirstOrDefault();

                txtClPeriodo.Text = vPeriodo.CL_TABULADOR;
                txtDsPeriodo.Text = vPeriodo.DS_TABULADOR;
                txtClEstatus.Text = vPeriodo.CL_ESTADO;
                txtTipo.Text = vPeriodo.CL_TIPO_PUESTO;
                txtUsuarioMod.Text = vPeriodo.CL_USUARIO_APP_MODIFICA;
                txtFechaMod.Text = String.Format("{0:dd/MM/yyyy}", vPeriodo.FE_ULTIMA_MODIFICACION);


                //DESACTIVAR BOTONES
                if (e.CommandName == RadListView.SelectCommandName)
                {
                //    (item.FindControl("btnModificar") as RadButton).Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.B");
                //    (item.FindControl("btnEliminar") as RadButton).Enabled = ContextoUsuario.oUsuario.TienePermiso("K.A.A.C");
                
                    string vClEstado = (item.GetDataKeyValue("CL_ESTADO").ToString());
                    EstatusBotonesPeriodos((vClEstado.ToUpper() == "CERRADO") ? false : true);
                }
            }
        }

        protected void rbAscendente_CheckedChanged(object sender, EventArgs e)
        {
            if (rbAscendente.Checked)
            {
                ordenarListView(" ASC");
            }
        }

        protected void rbDescendente_CheckedChanged(object sender, EventArgs e)
        {
            if (rbDescendente.Checked)
            {
                ordenarListView(" DESC");
            }
        }

        protected void rfFiltros_ApplyExpressions(object sender, RadFilterApplyExpressionsEventArgs e)
        {

            RadFilterListViewQueryProvider provider = new RadFilterListViewQueryProvider(new List<RadFilterGroupOperation>() { RadFilterGroupOperation.And, RadFilterGroupOperation.Or });
            provider.ProcessGroup(e.ExpressionRoot);

            if (provider.ListViewExpressions.Count > 0)
            {
                rlvConsultas.FilterExpressions.Add(provider.ListViewExpressions[0]);
            }
            else
            {
                rlvConsultas.FilterExpressions.Clear();
            }

            rlvConsultas.Rebind();
        }

    }
}