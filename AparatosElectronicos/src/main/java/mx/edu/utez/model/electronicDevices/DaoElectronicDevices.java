package mx.edu.utez.model.electronicDevices;

import jdk.nashorn.internal.runtime.ScriptObject;
import mx.edu.utez.model.address.BeanAddress;
import mx.edu.utez.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoElectronicDevices {

    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoElectronicDevices.class);

    public List<BeanElectronicDevices> findAll(){
        List<BeanElectronicDevices> listElectronicDevices = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_findAll}");
            rs = cstm.executeQuery();

            while (rs.next()){
                BeanAddress beanAddress = new BeanAddress();
                BeanElectronicDevices beanElectronicDevices = new BeanElectronicDevices();

                beanAddress.setIdAddress(rs.getInt("idAddress"));
                beanAddress.setCalle(rs.getString("calle"));
                beanAddress.setColonia(rs.getString("colonia"));
                beanAddress.setCodigoPostal(rs.getInt("codigoPostal"));
                beanAddress.setEstado(rs.getString("estado"));
                beanAddress.setPais(rs.getString("pais"));

                beanElectronicDevices.setId(rs.getInt("id"));
                beanElectronicDevices.setNombre(rs.getString("nombre"));
                beanElectronicDevices.setAddressId(beanAddress);
                beanElectronicDevices.setFechaRegistro(rs.getString("fechaRegistro"));
                beanElectronicDevices.setStatus(rs.getInt("status"));

                listElectronicDevices.add(beanElectronicDevices);
            }
        }catch (SQLException e) {
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnection(con, cstm, rs);
        }
        return listElectronicDevices;
    }
    public boolean create(BeanElectronicDevices beanElectronicDevices){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?,?,?,?)}");
            cstm.setString(1, beanElectronicDevices.getNombre());
            cstm.setString(2,beanElectronicDevices.getAddressId().getCalle());
            cstm.setString(3,beanElectronicDevices.getAddressId().getColonia());
            cstm.setInt(4, beanElectronicDevices.getAddressId().getCodigoPostal());
            cstm.setString(5, beanElectronicDevices.getAddressId().getEstado());
            cstm.setString(6, beanElectronicDevices.getAddressId().getPais());
            cstm.setString(7, beanElectronicDevices.getFechaRegistro());
            flag = cstm.execute();
        }catch (SQLException e){
            System.out.println("Se ha encontrado el siguiente error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;
    }
    public BeanElectronicDevices findById(int id){
        BeanElectronicDevices beanElectronicDevices = new BeanElectronicDevices();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call.sp_findById(?)}");
            cstm.setInt(1, id);
            rs = cstm.executeQuery();
            if (rs.next()){
                BeanAddress beanAddress = new BeanAddress();
                beanAddress.setIdAddress(rs.getInt("idAddress"));
                beanAddress.setCalle(rs.getString("calle"));
                beanAddress.setColonia(rs.getString("colonia"));
                beanAddress.setCodigoPostal(rs.getInt("codigoPostal"));
                beanAddress.setEstado(rs.getString("estado"));
                beanAddress.setPais(rs.getString("pais"));

                beanElectronicDevices.setId(rs.getInt("id"));
                beanElectronicDevices.setNombre(rs.getString("nombre"));
                beanElectronicDevices.setAddressId(beanAddress);
                beanElectronicDevices.setFechaRegistro(rs.getString("fechaRegistro"));

            }
        }catch (SQLException e){
            System.out.println("Se ha encontrado el siguiente error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnection(con, cstm, rs);
        }
        return beanElectronicDevices;
    }
    public boolean update(BeanElectronicDevices beanElectronicDevices){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?,?,?,?,?)}");
            cstm.setInt(1,beanElectronicDevices.getId());
            cstm.setString(2, beanElectronicDevices.getNombre());
            cstm.setInt(3,beanElectronicDevices.getAddressId().getIdAddress());
            cstm.setString(4,beanElectronicDevices.getAddressId().getCalle());
            cstm.setString(5,beanElectronicDevices.getAddressId().getColonia());
            cstm.setInt(6, beanElectronicDevices.getAddressId().getCodigoPostal());
            cstm.setString(7, beanElectronicDevices.getAddressId().getEstado());
            cstm.setString(8, beanElectronicDevices.getAddressId().getPais());
            cstm.setString(9, beanElectronicDevices.getFechaRegistro());
            flag = cstm.execute();
        }catch (SQLException e){
            System.out.println("Se ha encontrado el siguiente error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;
    }
    public boolean delete(int id){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setInt(1,id);
            flag = cstm.execute();

        }catch (SQLException e){
            System.out.println("Se ha encontrado el siguiente error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;

    }
}

