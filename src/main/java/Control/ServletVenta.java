package Control;

import Beans.MCliente;
import DAO.DCliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletVenta extends HttpServlet {

    DCliente objC = new DCliente();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1)lisCli(request, response);
        if(op==2)agregarCliente(request, response);
        if(op==3)actualizarCliente(request, response);
        if(op==4)eliminarCliente(request, response);
    }
    
    protected void lisCli(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String cod=request.getParameter("cod");
       request.setAttribute("dato", objC.lisClientes());
       String pag="/clientes.jsp";
       request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void agregarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MCliente cliente = new MCliente();
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setNumeroDocumento(request.getParameter("numDoc"));
        cliente.setDireccion(request.getParameter("direccion"));
        cliente.setTelefono(request.getParameter("telefono"));
        cliente.setCorreo(request.getParameter("correo"));
        cliente.setEstado(1); // Estado activo
        cliente.setUsuarioCrea(1); // Usuario de creación (puede cambiarse)
        cliente.setFechaCrea(new java.sql.Timestamp(System.currentTimeMillis())); // Fecha actual
        objC.agregarCliente(cliente);
        lisCli(request, response);
    }
    
    

    protected void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MCliente cliente = new MCliente();
        cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setNumeroDocumento(request.getParameter("numDoc"));
        cliente.setDireccion(request.getParameter("direccion"));
        cliente.setTelefono(request.getParameter("telefono"));
        cliente.setCorreo(request.getParameter("correo"));
        objC.actualizarCliente(cliente);
        lisCli(request, response);
    }

    protected void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        objC.eliminarCliente(idCliente);
        lisCli(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
