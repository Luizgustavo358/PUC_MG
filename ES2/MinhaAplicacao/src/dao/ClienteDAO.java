package dao;
import factory.ConnectionFactory;
import modelo.Cliente;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
public class ClienteDAO { 
    private Connection connection;
    Long id;
    String nome;
    String cpf;
    String email;
    String telefone;
    public ClienteDAO(){ 
        this.connection = new ConnectionFactory().getConnection();
    } 
    public void adiciona(Cliente cliente){ 
        String sql = "INSERT INTO cliente(tipusu,nomcli,cpfcnpj) VALUES(?,?,?)";
        String SQL1 = "select codcli from cliente where cpfcnpj=?";
        Long codigo=-1L;
        try{
            PreparedStatement stmt = connection.prepareStatement(SQL1);
            stmt.setString(1, cliente.getCpfcnpj());
            ResultSet rs = stmt.executeQuery();
            rs.next();
            codigo = (rs.getLong("codcli"));
            rs.close();
            stmt.close();
        }catch(SQLException u){
            
        }
        if(codigo!=-1L){
            JOptionPane.showMessageDialog(null, "O Cliente com esse CPF/CNPJ já existe.");
            System.out.println("O Cliente com esse CPF/CNPJ já existe.");
        }
        if(codigo==-1L){
            try { 
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, cliente.getTipcli());
                stmt.setString(2, cliente.getNomcli());
                stmt.setString(3, cliente.getCpfcnpj());
                stmt.execute();
                stmt.close();
                JOptionPane.showMessageDialog(null, "Cliente "+cliente.getNomcli()+" inserido com sucesso! ");
            } 
            catch (SQLException u) { 
                throw new RuntimeException(u);
            } 
        }
        
    } 
    
}