﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FYD/MenuFYD.master" AutoEventWireup="true" CodeBehind="PeriodosEvaluacion.aspx.cs" Inherits="SIGE.WebApp.FYD.PeriodosEvaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .RadListViewContainer {
            width: 200px;
            border: 1px solid lightgray;
            float: left;
            margin: 5px;
            border-radius: 5px;
        }

            .RadListViewContainer.Selected {
                background-color: #FF7400 !important;
                color: #fff !important;
            }

            .RadListViewContainer > .SelectionOptions {
                overflow: auto;
                background-color: lightgray;
                padding: 10px;
            }

        .labelSubtitulo {
            margin-top: 20px;
            display: block;
            font-size: 1.6em;
        }
    </style>
    <script type="text/javascript">
        function onCloseWindow(sender, args) {
            var lista = $find("<%# rlvPeriodos.ClientID %>");
            lista.rebind();
        }

        function GetWindowProperties() {
            return {
                width: document.documentElement.clientWidth - 20,
                height: document.documentElement.clientHeight - 30
            };
        }

        function GetWindowPropertiesOpen() {
            return {
                width: document.documentElement.clientWidth - 500,
                height: document.documentElement.clientHeight - 40
            };
        }

        function GetControlAvanceWindowProperties(pIdPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Control de avance";
            wnd.vURL = "ControlAvance.aspx?idPeriodo=" + pIdPeriodo;
            wnd.vRadWindowId = "winPeriodo";
            return wnd;
        }

        function GetConfiguracionWindowProperties(pIdPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Configuración del período";
            wnd.vURL = "ConfiguracionPeriodo.aspx?PeriodoId=" + pIdPeriodo;
            wnd.vRadWindowId = "winConfigurar";
            return wnd;
        }

        function GetPeriodoWindowProperties(pIdPeriodo, pTipoTarea) {
            var wnd = GetWindowPropertiesOpen();
            wnd.vTitulo = "Agregar período";
            wnd.vRadWindowId = "winPeriodo";
            wnd.vURL = "PeriodoEvaluacion.aspx";
            if (pIdPeriodo != null) {
                if (pTipoTarea != "COPIA") {
                    wnd.vURL += String.format("?PeriodoId={0}", pIdPeriodo);
                    wnd.vTitulo = "Editar período";
                }
                else {
                    wnd.vURL += String.format("?PeriodoId={0}&TipoTarea={1}", pIdPeriodo, pTipoTarea);
                    wnd.vTitulo = "Copiar período";
                }
            }
            return wnd;
        }

        //function ConfirmarCopiar(sender, args) {
        //    var vIdPeriodo = GetPeriodoId();
        //    var vNbPeriodo = "";

        //    if (vIdPeriodo != null) {

        //        vNbPeriodo = GetPeriodoNombre();

        //        var callBackFunction = Function.createDelegate(sender, function (shouldSubmit)
        //        { if (shouldSubmit) { this.click(); } });
        //        radconfirm("¿Deseas copiar el evento " + vNbPeriodo + '?', callBackFunction, 400, 150, null, "Copiar periodo");
        //        args.set_cancel(true);

        //    } else {
        //        radalert("Seleccione un evento.", 400, 150, "Error");
        //        args.set_cancel(true);
        //    }
        //}

        function GetContestarCuestionariosWindowProperties(pIdPeriodo, pNbPeriodo, pEstadoPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Contestar cuestionarios";
            wnd.vURL = "ContestarCuestionarios.aspx?PeriodoId=" + pIdPeriodo + "&PeriodoNb=" + pNbPeriodo + "&EstadoPeriodo=" + pEstadoPeriodo;
            wnd.vRadWindowId = "winPeriodo";
            return wnd;
        }

        function GetNecesidadCapacitacionWindowProperties(pIdPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Necesidades de capacitación - Evaluación de competencias";
            //wnd.vURL = "/FYD/NecesidadesDeCapacitacion.aspx?PeriodoId=" + pIdPeriodo;
            wnd.vURL = "NecesidadesCapacitacion2.aspx?PeriodoId=" + pIdPeriodo;
            wnd.vRadWindowId = "winPeriodo";
            return wnd;
        }

        function GetConsultaGeneralWindowProperties(pIdPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Consulta general - Evaluación de competencias";
            wnd.vURL = "ConsultasGenerales.aspx?IdPeriodo=" + pIdPeriodo;
            wnd.vRadWindowId = "rwReportes";
            return wnd;
        }

        function GetConsultaIndividualWindowProperties(pIdPeriodo) {
            var wnd = GetWindowProperties();
            wnd.vTitulo = "Consulta individual - Evaluación de competencias";
            wnd.vURL = "ConsultasIndividuales.aspx?IdPeriodo=" + pIdPeriodo;
            wnd.vRadWindowId = "rwReportes";
            return wnd;
        }

        function GetEnvioSolicitudesWindowProperties(pIdPeriodo) {
            var wnd = GetWindowPropertiesOpen();
            wnd.vTitulo = "Enviar evaluaciones";
            wnd.vURL = "VentanaEnvioSolicitudes.aspx?IdPeriodo=" + pIdPeriodo;
            wnd.vRadWindowId = "rwReportes";
            return wnd;
        }

        function GetPeriodoId() {
            var listView = $find('<%= rlvPeriodos.ClientID %>');
            var selectedIndex = listView.get_selectedIndexes();
            if (selectedIndex.length > 0)
                return listView.get_clientDataKeyValue()[selectedIndex]["ID_PERIODO"];
            else
                return null;
        }

        function GetPeriodoNombre() {
            var listView = $find('<%= rlvPeriodos.ClientID %>');
            var selectedIndex = listView.get_selectedIndexes();
            if (selectedIndex.length > 0)
                return listView.get_clientDataKeyValue()[selectedIndex]["NB_PERIODO"];
            else
                return null;
        }

        function GetPeriodoEstado() {
            var listView = $find('<%= rlvPeriodos.ClientID %>');
            var selectedIndex = listView.get_selectedIndexes();
            if (selectedIndex.length > 0)
                return listView.get_clientDataKeyValue()[selectedIndex]["CL_ESTADO_PERIODO"];
            else
                return null;
        }

        function OpenWindow(pWindowProperties) {
            openChildDialog(pWindowProperties.vURL, pWindowProperties.vRadWindowId, pWindowProperties.vTitulo, pWindowProperties);
        }

        function OpenControlAvanceWindow(sender, args) {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null)
                OpenWindow(GetControlAvanceWindowProperties(vIdPeriodo));
            else
                radalert("Selecciona un período.", 400, 150);
        }

        function OpenNecesidadCapacitacionWindow(sender, args) {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null)
                OpenWindow(GetNecesidadCapacitacionWindowProperties(vIdPeriodo));
            else
                radalert("Selecciona un período.", 400, 150);
        }

        function OpenConfiguracionWindow() {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null)
                OpenWindow(GetConfiguracionWindowProperties(vIdPeriodo));
            else
                radalert("Selecciona un período.", 400, 150);
        }

        function OpenConsultaGeneralWindow() {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null) {
                OpenWindow(GetConsultaGeneralWindowProperties(vIdPeriodo));
            }
            else {
                radalert("Selecciona un período.", 400, 150);
            }
        }

        function OpenConsultaIndividualWindow() {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null) {
                OpenWindow(GetConsultaIndividualWindowProperties(vIdPeriodo));
            }
            else {
                radalert("Selecciona un período.", 400, 150);
            }
        }

        function OpenEnvioSolicitudesWindow() {
            var vIdPeriodo = GetPeriodoId();
            if (vIdPeriodo != null) {
                OpenWindow(GetEnvioSolicitudesWindowProperties(vIdPeriodo));
            }
            else {
                radalert("Selecciona un período.", 400, 150);
            }
        }

        function OpenInsertPeriodoWindow() {
            OpenPeriodoWindow(null, "INSERTA");
        }

        function OpenEditPeriodoWindow() {
            if('<%= vEditarPeriodo %>' == "True")
                OpenPeriodoWindow(GetPeriodoId(), "EDITA");
            else {
                radalert("No tiene los permisos necesarios para llevar a cabo esta función.", 450, 200, "");
            }

        }

        function AbrirCopiarPeriodo(pIdPeriodo) {
            if (pIdPeriodo != null) {
                OpenPeriodoWindow(pIdPeriodo, "COPIA")
            }
        }

        function OpenPeriodoWindow(pIdPeriodo, pTipoTarea) {
            OpenWindow(GetPeriodoWindowProperties(pIdPeriodo, pTipoTarea));
        }

        function OpenContestarCuestionariosWindow(sender, args) {
            var vIdPeriodo = GetPeriodoId();
            var vNbPeriodo = GetPeriodoNombre();
            var vEstadoPeriodo = GetPeriodoEstado();
            if (vIdPeriodo != null) {
                OpenWindow(GetContestarCuestionariosWindowProperties(vIdPeriodo, vNbPeriodo, vEstadoPeriodo));
            }
        }

        function ConfirmarCerrar(sender, args) {
            var vIdPeriodo = GetPeriodoId();
            var vNbPeriodo = GetPeriodoNombre();

            if (vIdPeriodo != null) {

                var callBackFunction = Function.createDelegate(sender, function (shouldSubmit)
                { if (shouldSubmit) { this.click(); } });

                radconfirm('¿Deseas cerrar el período ' + vNbPeriodo + '?', callBackFunction, 400, 170, null, "Cerrar período");
                args.set_cancel(true);
            }
            else {
                radalert("Seleccione un período.", 400, 150, "");
                args.set_cancel(true);
            }
        }

        function ConfirmarReactivar(sender, args) {
            var vIdPeriodo = GetPeriodoId();
            var vNbPeriodo = GetPeriodoNombre();

            if (vIdPeriodo != null) {

                var callBackFunction = Function.createDelegate(sender, function (shouldSubmit)
                { if (shouldSubmit) { this.click(); } });

                radconfirm('¿Deseas reactivar el período ' + vNbPeriodo + ' ?', callBackFunction, 400, 170, null, "Reactivar período");
                args.set_cancel(true);
            }
            else {
                radalert("Seleccione un período.", 400, 150, "");
                args.set_cancel(true);
            }
        }

        function ConfirmarEliminar(sender, args) {
            if ('<%= vEliminarPeriodo %>' == "True") {
                var vIdPeriodo = GetPeriodoId();
                var vNbPeriodo = GetPeriodoNombre();

                if (vIdPeriodo != null) {

                    var callBackFunction = Function.createDelegate(sender, function (shouldSubmit)
                    { if (shouldSubmit) { this.click(); } });

                    radconfirm('¿Deseas eliminar el período ' + vNbPeriodo + '? Esta opción eliminará todos los datos relacionados con el período y no podrá revertirse.', callBackFunction, 400, 170, null, "Eliminar período");
                    args.set_cancel(true);
                }
                else {
                    radalert("Seleccione un período.", 400, 150, "");
                    args.set_cancel(true);
                }
            }
            else {
                radalert("No tiene los permisos necesarios para llevar a cabo esta función.", 450, 200, "");
                args.set_cancel(true);
            }

        }

        function useDataFromChild(pDato) {
            if (pDato != null) {
                switch (pDato[0].accion) {
                    case "ACTUALIZARLISTA":
                        var ajaxManager = $find('<%= ramOrganigrama.ClientID%>');
                            ajaxManager.ajaxRequest(JSON.stringify({ clTipo: "ACTUALIZARLISTA" }));
                            break;
                    default:
                        var ajaxManager = $find('<%= ramOrganigrama.ClientID%>');
                        ajaxManager.ajaxRequest(JSON.stringify({ clTipo: "ACTUALIZAR" }));
                            //var list = $find('<= rlvPeriodos.ClientID %>');
                            //list.rebind();
                        break;
                }
            }
        }


        function CloseWindowConfig() {
            var ajaxManager = $find('<%= ramOrganigrama.ClientID%>');
                   ajaxManager.ajaxRequest(JSON.stringify({ clTipo: "CONFIGURACION" }));
               }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxLoadingPanel ID="ralpPeriodosEvaluacion" runat="server"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="ramOrganigrama" runat="server" OnAjaxRequest="ramOrganigrama_AjaxRequest" DefaultLoadingPanelID="ralpPeriodosEvaluacion">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ramOrganigrama">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos" />
                    <telerik:AjaxUpdatedControl ControlID="txtUsuarioMod" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtFechaMod" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtClPeriodo" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtDsPeriodo" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtNotas" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtClEstatus" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtTipoEval" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                     <telerik:AjaxUpdatedControl ControlID="btnEnviarSolicitudes" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                     <telerik:AjaxUpdatedControl ControlID="btnControlAvance" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnContestarCuestionarios" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnCerrar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnConfigurar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rlvPeriodos">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnCerrar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnEnviarSolicitudes" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadButton6" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnConfigurar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnControlAvance" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnContestarCuestionarios" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtUsuarioMod" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtFechaMod" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtClPeriodo" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtDsPeriodo" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtNotas" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtClEstatus" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="txtTipoEval" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnAgregar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnCerrar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos" />
                    <telerik:AjaxUpdatedControl ControlID="btnCerrar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnEnviarSolicitudes" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadButton6" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnConfigurar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnContestarCuestionarios" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnReactivar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos" />
                    <telerik:AjaxUpdatedControl ControlID="btnCerrar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnEnviarSolicitudes" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadButton6" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnConfigurar" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="btnContestarCuestionarios" UpdatePanelRenderMode="Inline"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rbAscendente">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rbDescendente">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rfFiltros">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rfFiltros"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rfFiltros">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rlvPeriodos" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnCopiar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="btnCopiar" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadSplitter ID="rsPeriodosEvaluacion" BorderSize="0" Width="100%" Height="100%" runat="server">
        <telerik:RadPane ID="rpPeriodosEvaluacion" runat="server">
            <label class="labelTitulo">Evaluación de competencias</label>
            <div class="ctrlBasico">
                <telerik:RadListView ID="rlvPeriodos" runat="server" DataKeyNames="ID_PERIODO,CL_ESTADO_PERIODO" ClientDataKeyNames="ID_PERIODO,NB_PERIODO, CL_ESTADO_PERIODO"
                    OnNeedDataSource="rlvPeriodos_NeedDataSource" OnItemCommand="rlvPeriodos_ItemCommand" AllowPaging="true" ItemPlaceholderID="ProductsHolder">
                    <LayoutTemplate>
                        <div style="overflow: auto; width: 700px;">
                            <div style="overflow: auto; overflow-y: auto; max-height: 450px;">
                                <asp:Panel ID="ProductsHolder" runat="server"></asp:Panel>
                            </div>
                            <div style="clear: both;"></div>
                            <telerik:RadDataPager ID="rdpPeriodos" runat="server" PagedControlID="rlvPeriodos" PageSize="6" Width="630">
                                <Fields>
                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev"></telerik:RadDataPagerButtonField>
                                    <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="5"></telerik:RadDataPagerButtonField>
                                    <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                                    <telerik:RadDataPagerGoToPageField CurrentPageText="Página:" TotalPageText="de" SubmitButtonText="Ir"></telerik:RadDataPagerGoToPageField>
                                </Fields>
                            </telerik:RadDataPager>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="RadListViewContainer">
                            <div style="padding: 10px;">
                                <div style="overflow: auto; overflow-y: auto; height: 35px;">
                                    <label>Clave:</label>
                                    <%# Eval("CL_PERIODO") %>
                                </div>
                                <div>
                                    <label>Estatus:</label>
                                    <%# Eval("CL_ESTADO_PERIODO") %>
                                </div>
                                <div style="overflow: auto; overflow-y: auto; height: 50px;">
                                    <label>Descripción:</label>
                                    <%# Eval("DS_PERIODO") %>
                                </div>
                            </div>
                            <div class="SelectionOptions">
                                <telerik:RadButton ID="btnSeleccionar" runat="server" CommandName="Select" Text="Seleccionar" Width="100%"></telerik:RadButton>
                            </div>
                        </div>
                        <%-- <div class="RadListViewContainer">
                            <div style="padding: 10px;">
                                <div>
                                    <table>
                                        <tr>
                                            <td>
                                                <div style="font-size: 1.6em; width: 75px; text-align: center;"><%# Eval("ID_PERIODO") %></div>
                                            </td>
                                            <td>
                                                <div style="overflow: auto; overflow-y: auto; overflow-x: auto; height: 35px"><%# Eval("CL_PERIODO") %> </div>
                                            </td>
                                        </tr>
                                      <tr>
                                            <td><%# ((DateTime)Eval("FE_INICIO")).ToString("MMMM yyyy") %></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <# Eval("CL_ESTADO_PERIODO") %>
                                </div>
                                <div style="overflow: auto; overflow-y: auto; height: 50px;">
                                    <# Eval("DS_PERIODO") %>
                                </div>
                            </div>
                            <div class="SelectionOptions">
                                <telerik:RadButton ID="btnSeleccionar" runat="server" CommandName="Select" Text="Seleccionar" Width="100%"></telerik:RadButton>
                            </div>
                        </div>--%>
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <div class="RadListViewContainer Selected">
                            <div style="padding: 10px;">
                                <div style="overflow: auto; overflow-y: auto; height: 35px;">
                                    <label style="color: white;">Clave:</label>
                                    <%# Eval("CL_PERIODO") %>
                                </div>
                                <div>
                                    <label style="color: white;">Estatus:</label>
                                    <%# Eval("CL_ESTADO_PERIODO") %>
                                </div>
                                <div style="overflow: auto; overflow-y: auto; height: 50px;">
                                    <label style="color: white;">Descripción:</label>
                                    <%# Eval("DS_PERIODO") %>
                                </div>
                            </div>
                            <div class="SelectionOptions">
                                <div style="width: 50%; float: left; padding-right: 5px;">
                                    <telerik:RadButton ID="btnModificar" runat="server" Text="Editar" OnClientClicked="OpenEditPeriodoWindow" Width="100%"></telerik:RadButton>
                                </div>
                                <div style="width: 50%; float: left; padding-left: 5px;">
                                    <telerik:RadButton ID="btnEliminar" runat="server" Text="Eliminar" Width="100%" OnClientClicking="ConfirmarEliminar" OnClick="btnEliminar_Click"></telerik:RadButton>
                                </div>
                            </div>
                        </div>
                        <%--            <div class="RadListViewContainer Selected">
                            <div style="padding: 10px;">
                                <div>
                                    <table>
                                        <tr>
                                            <td>
                                                <div style="font-size: 1.6em; width: 75px; text-align: center;"><# Eval("ID_PERIODO") %></div>
                                            </td>
                                            <td>
                                                <div style="overflow: auto; overflow-y: auto; overflow-x: auto; height: 35px"><%# Eval("CL_PERIODO") %> </div>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td><# ((DateTime)Eval("FE_INICIO")).ToString("MMMM yyyy") %></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <# Eval("CL_ESTADO_PERIODO") %>
                                </div>
                                <div style="overflow: auto; overflow-y: auto; height: 50px;">
                                    <# Eval("DS_PERIODO") %>
                                </div>
                            </div>
                            <div class="SelectionOptions">
                                <div style="width: 50%; float: left; padding-right: 5px;">
                                    <telerik:RadButton ID="btnModificar" runat="server" Text="Editar" OnClientClicked="OpenEditPeriodoWindow" Width="100%"></telerik:RadButton>
                                </div>
                                <div style="width: 50%; float: left; padding-left: 5px;">
                                    <telerik:RadButton ID="btnEliminar" runat="server" Text="Eliminar" Width="100%" OnClientClicking="ConfirmarEliminar" OnClick="btnEliminar_Click"></telerik:RadButton>
                                </div>
                            </div>
                        </div>--%>
                    </SelectedItemTemplate>
                    <EmptyDataTemplate>
                        <div class="RadListViewContainer" style="overflow: auto; text-align: center; width: 660px; height: 100px;">
                            No hay períodos disponibles
                        </div>
                    </EmptyDataTemplate>
                </telerik:RadListView>
            </div>
            <div class="ctrlBasico" style="text-align: center">
                <telerik:RadTabStrip runat="server" ID="rtsEventos" MultiPageID="rmpPeriodos" SelectedIndex="0">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="Gestionar"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Detalles"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <div style="height: 10px;"></div>
                <telerik:RadMultiPage runat="server" ID="rmpPeriodos" SelectedIndex="0" Height="100%" Width="100%">
                    <telerik:RadPageView ID="rpvGestionar" runat="server">
                        <div>
                            <label class="labelTitulo">Administrar</label>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnAgregar" runat="server" Text="Agregar" AutoPostBack="false" OnClientClicked="OpenInsertPeriodoWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnConfigurar" runat="server" Text="Configurar" AutoPostBack="false" OnClientClicked="OpenConfiguracionWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnCerrar" runat="server" Text="Cerrar" OnClientClicking="ConfirmarCerrar" OnClick="btnCerrar_Click"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnReactivar" runat="server" Text="Re abrir" OnClientClicking="ConfirmarReactivar" OnClick="btnReactivar_Click"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnCopiar" runat="server" Text="Copiar" OnClick="btnCopiar_Click"></telerik:RadButton>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div>
                            <label class="labelTitulo">Procesos</label>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnEnviarSolicitudes" runat="server" Text="Enviar evaluaciones" AutoPostBack="false" OnClientClicked="OpenEnvioSolicitudesWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnContestarCuestionarios" runat="server" Text="Contestar" AutoPostBack="false" OnClientClicked="OpenContestarCuestionariosWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnControlAvance" runat="server" Text="Control de avance" AutoPostBack="false" OnClientClicked="OpenControlAvanceWindow"></telerik:RadButton>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div>
                            <label class="labelTitulo">Consultas</label>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnIndividuales" runat="server" Text="Individuales" AutoPostBack="false" OnClientClicked="OpenConsultaIndividualWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnGenerales" runat="server" Text="Generales" AutoPostBack="false" OnClientClicked="OpenConsultaGeneralWindow"></telerik:RadButton>
                            </div>
                            <div class="ctrlBasico">
                                <telerik:RadButton ID="btnNecesidadesCapacitacion" runat="server" Text="Necesidades de capacitación" AutoPostBack="false" OnClientClicked="OpenNecesidadCapacitacionWindow"></telerik:RadButton>
                            </div>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rpvInformacion" runat="server">
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="lblEvento" name="lblEvento" runat="server">Período:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtClPeriodo" Enabled="false" runat="server" Width="350px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label1" name="lblEvento" runat="server">Descripción:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtDsPeriodo" Enabled="false" runat="server" Width="350px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label4" name="lblEvento" runat="server">Notas:</label>
                            </div>
                            <div class="divControlDerecha">
                                <div id="txtNotasContenedor" runat="server" style="width: 350px; height: 100px; text-align: justify; border: 1px solid #ccc; border-radius: 5px; background: #ccc;">
                                    <p id="txtNotas" runat="server" style="padding: 10px;"></p>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label2" name="lblEvento" runat="server">Estatus:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtClEstatus" Enabled="false" runat="server" Width="200px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label3" name="lblEvento" runat="server">Tipo de evaluación:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtTipoEval" Enabled="false" runat="server" Width="350px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label5" name="lblCurso" runat="server">Último usuario que modifica:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtUsuarioMod" Enabled="false" runat="server" Width="105px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="ctrlBasico">
                            <div class="divControlIzquierda">
                                <label style="width: 120px;" id="Label6" name="lblCurso" runat="server">Última fecha de modificación:</label>
                            </div>
                            <div class="divControlDerecha">
                                <telerik:RadTextBox ID="txtFechaMod" Enabled="false" runat="server" Width="105px" MaxLength="1000" Height="35px" TextMode="MultiLine"></telerik:RadTextBox>
                            </div>
                        </div>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </div>
        </telerik:RadPane>
        <telerik:RadPane ID="rpOrdenarFiltrar" runat="server" Scrolling="None" Width="20px">
            <telerik:RadSlidingZone ID="rszOrdenarFiltrar" runat="server" SlideDirection="Left" ExpandedPaneId="rsPeriodosEvaluacion" Width="20px" ClickToOpen="true">
                <telerik:RadSlidingPane ID="rspOrdenarFiltrar" runat="server" Title="Ordenar y filtrar" Width="450px" RenderMode="Mobile" Height="100%">
                    <div style="clear: both; height: 10px;"></div>
                    <div>
                        <fieldset>
                            <legend>Ordenar por:</legend>
                            <telerik:RadComboBox ID="cmbOrdenamiento" runat="server">
                                <Items>
                                    <telerik:RadComboBoxItem Text="Clave del período" Value="CL_PERIODO" />
                                    <telerik:RadComboBoxItem Text="Nombre del período" Value="NB_PERIODO" />
                                    <telerik:RadComboBoxItem Text="Estatus" Value="CL_ESTADO_PERIODO" />
                                    <telerik:RadComboBoxItem Text="Fecha de inicio del período" Value="FE_INICIO" />
                                </Items>
                            </telerik:RadComboBox>
                            <telerik:RadButton ID="rbAscendente" runat="server" ButtonType="ToggleButton" ToggleType="Radio" Text="Ascendente" GroupName="ordenamiento" OnCheckedChanged="rbAscendente_CheckedChanged"></telerik:RadButton>
                            <telerik:RadButton ID="rbDescendente" runat="server" ButtonType="ToggleButton" ToggleType="Radio" Text="Descendente" GroupName="ordenamiento" OnCheckedChanged="rbDescendente_CheckedChanged"></telerik:RadButton>
                        </fieldset>
                    </div>
                    <div style="clear: both; height: 10px;"></div>
                    <div>
                        <fieldset>
                            <legend>Filtrar por:</legend>
                            <telerik:RadFilter runat="server" ID="rfFiltros" ExpressionPreviewPosition="Top" OnApplyExpressions="rfFiltros_ApplyExpressions">
                                <FieldEditors>
                                    <telerik:RadFilterTextFieldEditor DataType="System.Int32" DisplayName="No." FieldName="ID_PERIODO" DefaultFilterFunction="Contains" ToolTip="Numero del periodo" />
                                    <telerik:RadFilterTextFieldEditor DataType="System.String" DisplayName="Clave" FieldName="CL_PERIODO" DefaultFilterFunction="Contains" ToolTip="Clave del periodo" />
                                    <telerik:RadFilterTextFieldEditor DataType="System.String" DisplayName="Nombre" FieldName="NB_PERIODO" DefaultFilterFunction="Contains" ToolTip="Nombre del periodo" />
                                    <telerik:RadFilterTextFieldEditor DataType="System.String" DisplayName="Descripción" FieldName="DS_PERIODO" DefaultFilterFunction="Contains" ToolTip="Descripción del periodo" />
                                    <telerik:RadFilterTextFieldEditor DataType="System.DateTime" DisplayName="F. Inicial" FieldName="FE_INICIO" DefaultFilterFunction="GreaterThanOrEqualTo" ToolTip="Fecha Inicial" />
                                    <telerik:RadFilterTextFieldEditor DataType="System.String" DisplayName="Estatus" FieldName="CL_ESTADO_PERIODO" DefaultFilterFunction="Contains" ToolTip="Estatus del periodo" />
                                </FieldEditors>
                            </telerik:RadFilter>
                        </fieldset>
                    </div>
                </telerik:RadSlidingPane>
            </telerik:RadSlidingZone>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <div style="clear: both;"></div>
    <telerik:RadWindowManager ID="rwmAlertas" runat="server">
        <Windows>
            <telerik:RadWindow ID="winPeriodo" runat="server" Title="Agregar/Editar período" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" Modal="true" Behaviors="Close" OnClientClose="returnDataToParentPopup"></telerik:RadWindow>
            <telerik:RadWindow ID="winConfigurar" runat="server" Title="Configurar período" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" Modal="true" Behaviors="Close" OnClientClose="CloseWindowConfig"></telerik:RadWindow>
            <telerik:RadWindow ID="winAgregarCuestionario" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" OnClientClose="returnDataToParentPopup" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winMatrizCuestionarios" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" OnClientClose="returnDataToParentPopup" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winSeleccion" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" OnClientClose="returnDataToParentPopup" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="rwReportes" runat="server" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="rwReporte" runat="server" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winEmpleado" runat="server" Behaviors="Close" Modal="true" VisibleStatusbar="false"></telerik:RadWindow>
            <telerik:RadWindow ID="winDescriptivo" runat="server" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="rwReporteComparativo" runat="server" Behaviors="Close" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true"></telerik:RadWindow>
            <telerik:RadWindow ID="winAutoriza" runat="server" Height="600" Width="1300" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winCamposAdicionales" runat="server" Title="Seleccionar" Height="650px" Width="850px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" OnClientClose="returnDataToParentPopup" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winEdicionPorEvaluado" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" OnClientClose="returnDataToParentPopup" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winContestarCuestionarios" runat="server" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Animation="Fade" Modal="true" Behaviors="Close" OnClientClose="returnDataToParentPopup"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>