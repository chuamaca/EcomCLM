package Control;

import DAO.*;
import Beans.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

public class ServletVenta extends HttpServlet {

    DCliente objC = new DCliente();
    DProducto objP = new DProducto();
    DDetalleVenta objDetalleVenta = new DDetalleVenta();
    private static final String UPLOAD_DIRECTORY = "imagenes";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) {
            lisCli(request, response);
        }
        if (op == 2) {
            agregarCliente(request, response);
        }
        if (op == 3) {
            actualizarCliente(request, response);
        }
        if (op == 4) {
            eliminarCliente(request, response);
        }
        if (op == 5) {
            lisProd(request, response);
        }
        if (op == 6) {
            agregarProducto(request, response);
        }
        if (op == 7) {
            actualizarProducto(request, response);
        }
        if (op == 8) {
            eliminarProducto(request, response);
        }

        if (op == 21) {
            ProductById(request, response);
        }

        if (op == 22) {
            AgregarCarritoTemp(request, response);
        }

        if (op == 23) {
            ConfirmarCompra(request, response);
        }

        if (op == 24) {
            ListarVentas(request, response);
        }

        if (op == 25) {
            QuitarCarritoTemp(request, response);
        }

    }

    protected void lisCli(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");
        request.setAttribute("dato", objC.lisClientes());
        String pag = "/clientes.jsp";
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

    protected void lisProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dato", objP.lisProductos());
        request.getRequestDispatcher("/productos.jsp").forward(request, response);
    }

    protected void agregarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        int stock = Integer.parseInt(request.getParameter("stock"));
        double precioVenta = Double.parseDouble(request.getParameter("precioVenta"));
        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        Part filePart = request.getPart("imagen");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = getServletContext().getRealPath("/imagenes/") + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Path path = Paths.get(filePath);
            Files.copy(fileContent, path, StandardCopyOption.REPLACE_EXISTING);
        }

        MProducto producto = new MProducto();
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setStock(stock);
        producto.setPrecioVenta(precioVenta);
        producto.setImagen(fileName); // Guardar la ruta de la imagen en la base de datos
        producto.setIdCategoria(idCategoria);
        producto.setEstado(1);
        producto.setUsuarioCrea(1);  // Placeholder, replace with actual user
        producto.setFechaCrea(new java.util.Date());

        objP.agregarProducto(producto);
        lisProd(request, response);
    }

    protected void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        int stock = Integer.parseInt(request.getParameter("stock"));
        double precioVenta = Double.parseDouble(request.getParameter("precioVenta"));
        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        Part filePart = request.getPart("imagen");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = getServletContext().getRealPath("/imagenes/") + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Path path = Paths.get(filePath);
            Files.copy(fileContent, path, StandardCopyOption.REPLACE_EXISTING);
        }

        MProducto producto = new MProducto();
        producto.setIdProducto(idProducto);
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setStock(stock);
        producto.setPrecioVenta(precioVenta);
        producto.setImagen(fileName); // Actualizar la ruta de la imagen en la base de datos
        producto.setIdCategoria(idCategoria);
        producto.setEstado(1);
        producto.setUsuarioModifica(1);  // Placeholder, replace with actual user
        producto.setFechaModifica(new java.util.Date());

        objP.actualizarProducto(producto);
        lisProd(request, response);
    }

    protected void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        objP.eliminarProducto(idProducto);
        lisProd(request, response);
    }

    protected void ProductById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int IdProducto = Integer.parseInt(request.getParameter("IdProducto"));
        request.setAttribute("dato", objP.SelectById(IdProducto));
        String pag = "/ecomerceproducto.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

    protected void AgregarCarritoTemp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Crear una Session
        HttpSession sesion = request.getSession();
        int IdProducto = Integer.parseInt(request.getParameter("idproducto"));
        int cantidadCompra = Integer.parseInt(request.getParameter("cantidad"));

        MProducto productoObj = objP.SelectById(IdProducto);
        RDetalleVenta compra = new RDetalleVenta();
        compra.setIdProducto(productoObj.getIdProducto());
        compra.setNombre(productoObj.getNombre());
        compra.setPrecioVenta(productoObj.getPrecioVenta());
        compra.setCantidad(cantidadCompra);
        compra.setImagen(productoObj.getImagen());
        List<RDetalleVenta> lista;
        if (sesion.getAttribute("canasta") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<RDetalleVenta>) sesion.getAttribute("canasta");
        }

        boolean productoExiste = false;
        for (RDetalleVenta item : lista) {
            if (item.getIdProducto() == IdProducto) {
                item.setCantidad(item.getCantidad() + cantidadCompra);
                productoExiste = true;
                break;
            }
        }

        if (!productoExiste) {
            lista.add(compra);
        }

        sesion.setAttribute("canasta", lista);
        String pag = "/ecomerce.jsp";
        response.sendRedirect(request.getContextPath() + pag);
    }

    protected void QuitarCarritoTemp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        int IdProducto = Integer.parseInt(request.getParameter("idproducto"));

        List<RDetalleVenta> lista;
        if (sesion.getAttribute("canasta") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<RDetalleVenta>) sesion.getAttribute("canasta");
        }

        // Buscar y eliminar el producto con el IdProducto
        for (Iterator<RDetalleVenta> iterator = lista.iterator(); iterator.hasNext();) {
            RDetalleVenta detalle = iterator.next();
            if (detalle.getIdProducto() == IdProducto) {
                iterator.remove();
                break; // Asumimos que solo hay un producto con ese IdProducto, así que rompemos el bucle
            }
        }

        sesion.setAttribute("canasta", lista);
        String pag = "/ecomerce.jsp";
        response.sendRedirect(request.getContextPath() + pag);
    }

    protected void ConfirmarCompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String usuario = request.getParameter("usuario");
        String documento = request.getParameter("tarjeta");

        //Consultamos Uusuario
        int idusuario = 1;
        MCliente cliente = new MCliente();

        List<RDetalleVenta> lista;
        if (sesion.getAttribute("canasta") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<RDetalleVenta>) sesion.getAttribute("canasta");
            double total = (double) sesion.getAttribute("total");

            int NumeroVenta = objDetalleVenta.GrabarVentaDetalle(lista, idusuario, total);

            String cad = "Factura Nro 000000" + NumeroVenta;
//            cad += "\n cliente " + cliente.getNombre() + ", " + cliente.getNumeroDocumento();
            cad += "\n Total compra " + total;

            sesion.setAttribute("canasta", null);
            sesion.setAttribute("total", null);
            response.sendRedirect("generaQr?texto=" + cad);

        }

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

    private void ListarVentas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("dato", objDetalleVenta.SelectVentas());

        String pag = "/ventas.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

}
