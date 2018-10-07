package modelo;
public class Conta {
    Long codcon;
    char tipcon;
    Long codcli;
    int mescon;
    int anocon;
    int medant;
    int medatu;
    int valcon;
    String cpfcnpj;
    
    public Conta(){
        
    }

    public String getTipcon() {
        return String.valueOf(tipcon);
    }

    public void setTipcon(String tipcon) {
        this.tipcon = tipcon.charAt(0);
    }

    public String getCpfcnpj() {
        return cpfcnpj;
    }

    public void setCpfcnpj(String cpfcnpj) {
        this.cpfcnpj = cpfcnpj;
    }
    
    
    public Long getCodcon() {
        return codcon;
    }

    public void setCodcon(Long codcon) {
        this.codcon = codcon;
    }

    public Long getCodcli() {
        return codcli;
    }

    public void setCodcli(Long codcli) {
        this.codcli = codcli;
    }

    public int getMescon() {
        return mescon;
    }

    public void setMescon(String mescon) {
        this.mescon = Integer.parseInt(mescon);
    }

    public int getAnocon() {
        return anocon;
    }

    public void setAnocon(String anocon) {
        this.anocon = Integer.parseInt(anocon);
    }

    public int getMedant() {
        return medant;
    }

    public void setMedant(String medant) {
        this.medant = Integer.parseInt(medant);
    }

    public int getMedatu() {
        return medatu;
    }

    public void setMedatu(String medatu) {
        this.medatu = Integer.parseInt(medatu);
    }

    public int getValcon() {
        return valcon;
    }

    public void setValcon(int valcon) {
        this.valcon = valcon;
    }
   
}