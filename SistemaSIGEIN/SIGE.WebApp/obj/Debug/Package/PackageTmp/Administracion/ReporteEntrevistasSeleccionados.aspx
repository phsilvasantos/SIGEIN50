﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="ReporteEntrevistasSeleccionados.aspx.cs" Inherits="SIGE.WebApp.Administracion.ReporteEntrevistasSeleccionados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label class="labelTitulo">Datos para entrevista de selección</label>
    <div style="height: calc(100% - 60px);">
        <telerik:RadGrid ID="grdEntrevistas" runat="server" Height="100%" HeaderStyle-Font-Bold="true" AutoGenerateColumns="false" ShowGroupPanel="True" AllowPaging="true" AllowSorting="true" AllowFilteringByColumn="true"
            OnNeedDataSource="grdEntrevistas_NeedDataSource" OnItemCommand="grdEntrevistas_ItemCommand" OnItemDataBound="grdEntrevistas_ItemDataBound">
            <ClientSettings AllowDragToGroup="True" AllowKeyboardNavigation="true">
                <Selecting AllowRowSelect="false" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true"></Scrolling>
            </ClientSettings>
            <ExportSettings ExportOnlyData="true" FileName="Entrevistas" Excel-Format="Xlsx" IgnorePaging="true"  >
            </ExportSettings>
            <GroupingSettings ShowUnGroupButton="true" CaseSensitive="false"></GroupingSettings>
            <PagerStyle AlwaysVisible="true" />
            <MasterTableView EnableColumnsViewState="false" AllowPaging="true" AllowFilteringByColumn="true"
                ShowHeadersWhenNoRecords="true" EnableHeaderContextFilterMenu="true" CommandItemDisplay="Top"
                DataKeyNames="ID_CANDIDATO" ClientDataKeyNames="ID_CANDIDATO">
                <GroupByExpressions>
                </GroupByExpressions>
                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridBoundColumn AllowFiltering="false" HeaderText="Renglón" DataField="RENGLON" UniqueName="RENGLON" HeaderStyle-Width="70"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Folio" DataField="ID_CANDIDATO" UniqueName="ID_CANDIDATO" HeaderStyle-Width="90" FilterControlWidth="40" DataType="System.Int32"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Nombre completo" DataField="NB_CANDIDATO" UniqueName="NB_CANDIDATO" HeaderStyle-Width="300" FilterControlWidth="150"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Domicilio" DataField="DOCMICILIO" UniqueName="DOCMICILIO" HeaderStyle-Width="450" FilterControlWidth="150"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Estado civil" DataField="CL_ESTADO_CIVIL" UniqueName="CL_ESTADO_CIVIL" HeaderStyle-Width="120" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataFormatString="{0:d}" AutoPostBackOnFilter="true" HeaderText="Fecha de nacimiento " DataField="FE_NACIMIENTO" UniqueName="FE_NACIMIENTO" HeaderStyle-Width="100" FilterControlWidth="70" DataType="System.DateTime"></telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Edad" DataField="EDAD" UniqueName="EDAD" HeaderStyle-Width="90" FilterControlWidth="40"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Lugar de nacimiento" DataField="DS_LUGAR_NACIMIENTO" UniqueName="DS_LUGAR_NACIMIENTO" HeaderStyle-Width="180" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Nivel académico" DataField="NIVEL_ESCOLARIDAD" UniqueName="NIVEL_ESCOLARIDAD" HeaderStyle-Width="120" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Suledo deseado" DataField="MN_SUELDO" UniqueName="MN_SUELDO" HeaderStyle-Width="100" FilterControlWidth="50" DataType="System.Int32"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Primaria" DataField="PRIMARIA" UniqueName="PRIMARIA" HeaderStyle-Width="250" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Secundaria" DataField="SECUNDARIA" UniqueName="SECUNDARIA" HeaderStyle-Width="250" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Preparatoria" DataField="PREPARATORIA" UniqueName="PREPARATORIA" HeaderStyle-Width="250" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Carrera técnica" DataField="CARRERA_TECNICA" UniqueName="CARRERA_TECNICA" HeaderStyle-Width="250" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Carrera profesional" DataField="CARRERA_PROFESIONAL" UniqueName="CARRERA_PROFESIONAL" HeaderStyle-Width="250" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Periodo profesional" DataField="PERIODO_PROFESIONAL" UniqueName="PERIODO_PROFESIONAL" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Postgrado" DataField="POSTGRADO" UniqueName="POSTGRADO" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Periodo postgrado" DataField="PERIODO_POSTGRADO" UniqueName="PERIODO_POSTGRADO" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Puesto actual" DataField="PUESTO_ACTUAL" UniqueName="PUESTO_ACTUAL" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Empresa actual " DataField="EMPRESA_ACTUAL" UniqueName="EMPRESA_ACTUAL" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Función actual" DataField="FUNCION_ACTUAL" UniqueName="FUNCION_ACTUAL" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Sueldo actual" DataField="SUELDO_ACTUAL" UniqueName="SUELDO_ACTUAL" HeaderStyle-Width="100" FilterControlWidth="50" DataType="System.Int32"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Periodo actual"  DataField="PERIODO_ACTUAL" UniqueName="PERIODO_ACTUAL" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Puesto anterior 1"  DataField="PUESTO_ANTERIOR1" UniqueName="PUESTO_ANTERIOR1" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Empresa anterior 1" DataField="EMPRESA_ANTERIOR1" UniqueName="EMPRESA_ANTERIOR1" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Función anterior 1" DataField="FUNCION_ANTERIOR1" UniqueName="FUNCION_ANTERIOR1" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Sueldo anterior 1" DataField="SUELDO_ANTERIOR1" UniqueName="SUELDO_ANTERIOR1" HeaderStyle-Width="100" FilterControlWidth="50" DataType="System.Int32"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Periodo anterior 1" DataField="PERIODO_ANTERIOR1" UniqueName="PERIODO_ANTERIOR1" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Puesto anterior 2 " DataField="PUESTO_ANTERIOR2" UniqueName="PUESTO_ANTERIOR2" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Empresa anterior 2" DataField="EMPRESA_ANTERIOR2" UniqueName="EMPRESA_ANTERIOR2" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Función anterior 2" DataField="FUNCION_ANTERIOR2" UniqueName="FUNCION_ANTERIOR2" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Sueldo anterior 2" DataField="SUELDO_ANTERIOR2" UniqueName="SUELDO_ANTERIOR2" HeaderStyle-Width="100" FilterControlWidth="50" DataType="System.Int32"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderText="Periodo anterior 2" DataField="PERIODO_ANTERIOR2" UniqueName="PERIODO_ANTERIOR2" HeaderStyle-Width="240" FilterControlWidth="50"></telerik:GridBoundColumn>
                 
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</asp:Content>
