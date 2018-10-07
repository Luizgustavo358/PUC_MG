package modelo;
public class Cliente {
    Long codcli;
    char tipcli;    
    String nomcli;
    String cpfcnpj;
    public Cliente(){
        
    }
    
    public String getTipcli() {
        return String.valueOf(tipcli);
    }
    public void setTipcli(String tipcli) {
        this.tipcli = tipcli.charAt(0);
    }
    public String getCpfcnpj() {
        return cpfcnpj;
    }
    public void setCpfcnpj(String cpfcnpj) {
        this.cpfcnpj = cpfcnpj;
    }
    public Long getCodcli() {
        return codcli;
    }
    public void setCodcli(Long codcli) {
        this.codcli = codcli;
    } 
    public String getNomcli() { 
        return nomcli;
    } 
    public void setNomcli(String nomcli) { 
        this.nomcli = nomcli;
    } 
}