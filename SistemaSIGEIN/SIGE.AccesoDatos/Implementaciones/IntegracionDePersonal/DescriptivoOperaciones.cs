﻿using SIGE.Entidades;
using SIGE.Entidades.Administracion;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SIGE.AccesoDatos.Implementaciones.IntegracionDePersonal
{
    public class DescriptivoOperaciones
    {

        private SistemaSigeinEntities context;
        
        public SPE_OBTIENE_DESCRIPTIVO_Result ObtenerDescriptivo(int? pIdDescriptivo)
        {
            using (context =  new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_DESCRIPTIVO(pIdDescriptivo).FirstOrDefault();   
            }
        }

        public SPE_OBTIENE_DESCRIPTIVO_REQUISICION_Result ObtenerDescriptivoRequisicion(int? pIdDescriptivo)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_DESCRIPTIVO_REQUISICION(pIdDescriptivo).FirstOrDefault();
            }
        }
        public SPE_OBTIENE_PDE_DESCRIPTIVO_Result ObtenerDescriptivo_pde(string pIdDescriptivo)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_PDE_DESCRIPTIVO(pIdDescriptivo).FirstOrDefault();
            }
        }

        public List<SPE_OBTIENE_DESCRIPTIVO_Result> ObtenerDescriptivos(int? pIdDescriptico)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_DESCRIPTIVO(pIdDescriptico).ToList();
            }
        }

        public List<SPE_OBTIENE_PUESTO_FACTOR_Result> ObtenerFactoresPuestos(int pIdPuesto)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_PUESTO_FACTOR(pIdPuesto).ToList();
            }
        }

        public XElement ActualizarPuestoFactor(string pXmlPuestos, string pXmlFactores, string pClUsuario, string pNbPrograma)
        {
            using (context = new SistemaSigeinEntities())
            {
                ObjectParameter pOutClretorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ACTUALIZA_PUESTO_FACTOR(pOutClretorno, pXmlPuestos, pXmlFactores, pClUsuario, pNbPrograma);

                return XElement.Parse(pOutClretorno.Value.ToString());
            }
        }

        public XElement InsertarPuestoFactor(int pIdPuesto, string pClUsuario, string pNbPrograma)
        {
            using (context = new SistemaSigeinEntities())
            {
                ObjectParameter pOutClretorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_PUESTO_FACTOR(pOutClretorno, pIdPuesto, pClUsuario, pNbPrograma);

                return XElement.Parse(pOutClretorno.Value.ToString());
            }
        }
        public List<SPE_OBTIENE_DESCRIPTIVOS_PUESTOS_Result> ObtenerDescriptivosPuestos()
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_DESCRIPTIVOS_PUESTOS().ToList();
            }
        }

        public List<SPE_OBTIENE_JEFES_DESCRIPTIVO_Result> ObtenerJefesDescriptivo(int? pIdPuesto)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_JEFES_DESCRIPTIVO(pIdPuesto).ToList();
            }
        }

        public List<SPE_OBTIENE_SUBORDINADOS_DESCRIPTIVO_Result> ObtenerSubordinadosDescriptivo(int? pIdPuesto)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.SPE_OBTIENE_SUBORDINADOS_DESCRIPTIVO(pIdPuesto).ToList();
            }
        }

        public List<E_PUESTO_INTERRELACIONADO> ObtenerPuestosInterrelacionadas(int? pIdPuesto)
        {
            using (context = new SistemaSigeinEntities())
            {
                return context.Database.SqlQuery<E_PUESTO_INTERRELACIONADO>("EXEC " +
                    "[ADM].[SPE_OBTIENE_PLAZAS_INTERRELACIONADAS_DESCRIPTIVO] " +
                    "@PIN_ID_PUESTO " 
                    , new SqlParameter("@PIN_ID_PUESTO", (object)pIdPuesto ?? DBNull.Value)
                ).ToList();
            }
        }
    }
}
