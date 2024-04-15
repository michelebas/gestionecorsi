package model.session;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "Corso")
public class Corso {
    @Column(name = "idCorso")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int chiave;
    @Column(name = "nome")
    private String nome;
    @Column(name = "durata")
    private int durata;

    @ManyToOne
    @JoinColumn(name = "fkIdDocente")
    private Docente oDocente;

    @ManyToMany
    @JoinTable(
            name="corsoDiscente",
            joinColumns = @JoinColumn(name = "matricola"),
            inverseJoinColumns = @JoinColumn(name = "idCorso"))
    private Set<Discente> discenti;


    public Corso(){
        this.nome = "";
        this.durata = 0 ;
    }

    public void setChiave(int chiave) {
        this.chiave = chiave;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDurata(int durata) {
        this.durata = durata;
    }

    public int getChiave() {
        return chiave;
    }

    public String getNome() {
        return nome;
    }

    public int getDurata() {
        return durata;
    }

    public void setObjDocente(Docente oDocente) {
        this.oDocente = oDocente;
    }

    public Docente getObjDocente() {
        return oDocente;
    }

    public void setDiscenti(Set<Discente> discenti) {
        this.discenti = discenti;
    }

    public Set<Discente> getDiscenti() {
        return discenti;
    }
}
