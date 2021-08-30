package mx.edu.utez.model.address;

import mx.edu.utez.model.electronicDevices.DaoElectronicDevices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class DaoAddress {
    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoElectronicDevices.class);

}
