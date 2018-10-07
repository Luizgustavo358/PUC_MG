package dao;
import factory.ConnectionFactory;
import modelo.Conta;
import java.sql.*;
import java.sql.PreparedStatement;
public class ContaDAO { 
    private Connection connection;
    Long codcon;
    char tipcon;
    Long codcli;
    int mescon;
    int anocon;
    int medant;
    int medatu;
    int valcon;
    public ContaDAO(){ 
        this.connection = new ConnectionFactory().getConnection();
    } 
    public void adiciona(Conta conta){ 
        String SQL1 = "select codcli from cliente where cpfcnpj=?";
        Long codigo=-1L;
        try{
            PreparedStatement stmt = connection.prepareStatement(SQL1);
            stmt.setString(1, conta.getCpfcnpj());
            ResultSet rs = stmt.executeQuery();
            rs.next();
            codigo = (rs.getLong("codcli"));
            rs.close();
            stmt.close();
        }catch(SQLException u){
            System.out.println("O Cliente não foi encontrado.");
            throw new RuntimeException(u);
        }
        if(codigo!=-1L){
            String sql = "INSERT INTO conta(tipcon,codcli,mescon,anocon,medant,medatu,valcon) VALUES(?,?,?,?,?,?,?)";
            try { 
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, conta.getTipcon());
                stmt.setLong(2, codigo);
                stmt.setInt(3, conta.getMescon());
                stmt.setInt(4, conta.getAnocon());
                stmt.setInt(5, conta.getMedant());
                stmt.setInt(6, conta.getMedatu());
                int valor = (conta.getMedatu()-conta.getMedant())*2;
                stmt.setInt(7, valor);
                stmt.execute();
                stmt.close();
            } 
            catch (SQLException u) { 
                throw new RuntimeException(u);
            } 
        }
        
    } 
    
}