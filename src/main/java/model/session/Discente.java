package model.session;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Discente")
public class Discente {
    @Column(name = "matricola")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int chiave;
    @Column(name = "cognome")
    private String cognome;
    @Column(name = "nome")
    private String nome;
    @ManyToMany(mappedBy = "discenti")
    private Set<Corso> corsi;

     public Discente(){
         this.nome = "";
         this.cognome="";
     }

    public void setChiave(int chiave) {
        this.chiave = chiave;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public int getChiave() {
        return chiave;
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public Set<Corso> getCorsi() {
        return corsi;
    }

    public void setCorsi(Set<Corso> corsi) {
        this.corsi = corsi;
    }
}
