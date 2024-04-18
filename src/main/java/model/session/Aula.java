package model.session;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Aula")
public class Aula {
    @Column(name = "idAula")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int chiave;

    @Column(name = "nome")
    private String nome;

/*
    @ManyToMany(mappedBy = "oAula")
    @JoinColumn(name = "fkIdDocente")
    private Docente oDocente;*/

    public void setChiave(int chiave) {
        this.chiave = chiave;
    }

    public int getChiave() {
        return chiave;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }


}
