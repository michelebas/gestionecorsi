package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AulaService;
import model.session.Aula;
import model.session.Discente;

@WebServlet("/CtrlArchivioAula")
public class CtrlArchivioAula extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AulaService oAulaService = new AulaService();

    public CtrlArchivioAula (){
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String azione = request.getParameter("cmdAzione");
        if(azione == null)
        {
            visualizzaElenco(request,response);
        }else if(azione.equals("Torna alla Home"))
        {
            getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
        }
        else if(azione.equals("Nuovo"))
        {
            nuovoAula(request, response);
        }
        else if(azione.equals("Annulla"))
        {
            visualizzaElenco(request, response);
        }
        else if(azione.equals("Registra"))
        {
            salvaAula(request, response);
            visualizzaElenco(request, response);
        }
        else if(azione.equals("Modifica"))
        {
            modificaAula(request, response);
        }
        else if(azione.equals("Elimina"))
        {
            eliminaAula(request, response);
        }
        else if(azione.equals("Conferma"))
        {
            cancellaAula(request, response);
            visualizzaElenco(request, response);
        }
    }

    private void cancellaAula(HttpServletRequest request, HttpServletResponse response){
        oAulaService.delete(((Aula) request.getSession().getAttribute("beanAula")));
    }
    private void eliminaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.getSession().setAttribute("beanAula", oAulaService.findById(Integer.parseInt(request.getParameter("rdoIDAula"))));
        getServletContext().getRequestDispatcher("/ArchivioAula/PgsArchivioAulaElimina.jsp").forward(request, response);
    }
    private void modificaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("beanAula", oAulaService.findById(Integer.parseInt(request.getParameter("rdoIDAula"))));
        getServletContext().getRequestDispatcher("/ArchivioAula/PgsArchivioAulaNuovoModifica.jsp").forward(request, response);
    }
    private void salvaAula(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        ((Aula) request.getSession().getAttribute("beanAula")).setNome(request.getParameter("txtNome"));
        if(((Aula) request.getSession().getAttribute("beanAula")).getChiave() == 0)
            oAulaService.persist(((Aula) request.getSession().getAttribute("beanAula")));
        else
            oAulaService.update(((Aula) request.getSession().getAttribute("beanAula")));
    }

    private void nuovoAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Aula oAula = new Aula();
        HttpSession oSessione = request.getSession();
        oSessione.setAttribute("beanAula", oAula);
        getServletContext().getRequestDispatcher("/ArchivioAula/PgsArchivioAulaNuovoModifica.jsp").forward(request, response);
    }

    private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        List<Aula> elenco = oAulaService.findAll();

        request.setAttribute("elencoDiscenti", elenco);
        //Definizione di un oggetto della classeServletContext
        ServletContext oContesto = getServletContext();
        //Definizione di un oggetto per la pubblicazione della PGS
        RequestDispatcher oDispatcher = oContesto.getRequestDispatcher("" +
                "/ArchivioAula/PgsArchivioAula.jsp");
        oDispatcher.forward(request, response);
    }

}
