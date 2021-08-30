package mx.edu.utez.controller;

import com.google.gson.Gson;
import mx.edu.utez.model.address.BeanAddress;
import mx.edu.utez.model.electronicDevices.BeanElectronicDevices;
import mx.edu.utez.model.electronicDevices.DaoElectronicDevices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletElectronicDevices", urlPatterns = {"/readAparatos", "/createAparatos", "/updateAparatos"})
public class ServletElectronicDevices extends HttpServlet {
    private Map map = new HashMap();
    final private Logger CONSOLE = LoggerFactory.getLogger(ServletElectronicDevices.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        map.put("listaAparatos", new DaoElectronicDevices().findAll());
        write(response,map);
        request.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action){
            case "create":
                String nombre = request.getParameter("nombre");
                String calle = request.getParameter("calle");
                String colonia = request.getParameter("colonia");
                int codigoPostal = Integer.parseInt(request.getParameter("codigoPostal"));
                String estado = request.getParameter("estado");
                String pais = request.getParameter("pais");
                String fechaRegistro = request.getParameter("fechaRegistro");
                BeanAddress beanAddress = new BeanAddress(0,calle, colonia, codigoPostal, estado, pais);
                BeanElectronicDevices beanElectronicDevices = new BeanElectronicDevices(0, nombre, beanAddress, fechaRegistro,0);
                boolean flag = new DaoElectronicDevices().create(beanElectronicDevices);
                if (flag){
                    System.out.println("Se ha agregado correctamente el aparato electrónico");
                }else {
                    System.out.println("No se agrego correctamente el aparato electrónico");
                }
                break;
            case "findById":
                int id = Integer.parseInt(request.getParameter("id"));
                BeanElectronicDevices beanElectronicDevices1 = new DaoElectronicDevices().findById(id);
                request.setAttribute("aparato",beanElectronicDevices1);
                request.getRequestDispatcher("/views/aparatos/updateAparatos.jsp").forward(request, response);
                break;
            case "update":
                int id1 = Integer.parseInt(request.getParameter("id"));
                String nombre1 = request.getParameter("name");
                int id2 = Integer.parseInt(request.getParameter("idAddress"));
                String calle1 = request.getParameter("calle");
                String colonia1 = request.getParameter("col");
                int codigoPostal1 = Integer.parseInt(request.getParameter("codigo"));
                String estado1 = request.getParameter("estado");
                String pais1 = request.getParameter("pais");
                String fechaRegistro1 = request.getParameter("registro");
                BeanAddress beanAddress1 = new BeanAddress(id2,calle1, colonia1, codigoPostal1, estado1, pais1);
                BeanElectronicDevices beanElectronicDevices2 = new BeanElectronicDevices(id1, nombre1, beanAddress1, fechaRegistro1,0);
                boolean flag1 = new DaoElectronicDevices().update(beanElectronicDevices2);
                if (flag1){
                    System.out.println("Se ha actualizado correctamente el aparato electrónico");
                }else {
                    System.out.println("No se actualizo correctamente el aparato electrónico");
                }
                request.getRequestDispatcher("/views/aparatos/listAparatos.jsp").forward(request, response);
                break;
            case "delete":
                int id3 = Integer.parseInt(request.getParameter("id"));
                boolean flag3 = new DaoElectronicDevices().delete(id3);
                if (flag3){
                    System.out.println("Se ha eliminado correctamente el aparato electrónico");
                }else {
                    System.out.println("No se eliminó correctamente el aparato electrónico");
                }
                request.getRequestDispatcher("/views/aparatos/listAparatos.jsp").forward(request, response);
                break;
        }

    }

    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException{
        response.setContentType("aplication/json");
        response.getWriter().write(new Gson().toJson(map));
    }
}

