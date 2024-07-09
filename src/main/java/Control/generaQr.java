/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
public class generaQr extends HttpServlet {

       
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               String texto=request.getParameter("texto");
               try{
		byte[] qrCodeImage = generateQrCodeForUri(texto);
		
		response.setContentType("image/png");
		
		// SECURITY NOTE: This Cache-Control header is not 'nice-to-have'. IT IS A REQUIREMENT.
		response.addHeader("Cache-Control", "no-store");
		
		try (OutputStream out = response.getOutputStream()) {
			out.write(qrCodeImage);
		}
               }catch(Exception ex){
                   ex.printStackTrace();
               }
    }
   private byte[] generateQrCodeForUri(String uri) throws WriterException {
		try {
			ByteArrayOutputStream stream = new ByteArrayOutputStream();
			BitMatrix matrix = new QRCodeWriter().encode(uri, BarcodeFormat.QR_CODE, 300, 300);
			MatrixToImageWriter.writeToStream(matrix, "PNG", stream);
			return stream.toByteArray();
		} catch (IOException | WriterException e) {
			// Given that this operation is entirely in memory, any such exceptions are indicative of bad input.
			throw new IllegalArgumentException("Invalid URI", e);
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

}
