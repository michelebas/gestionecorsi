package model.dao;
import model.session.Aula;

public class AulaService extends AbstractService<AulaDAO, Aula>{
    @Override
    public AulaDAO createDAO() {
        return new AulaDAO();
    }
}
