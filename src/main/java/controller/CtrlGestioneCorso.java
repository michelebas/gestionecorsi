package controller;
import model.dao.CorsoService;
import model.dao.DiscenteService;
import model.dao.DocenteService;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CtrlArchivioCorso extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CorsoService corsoService = new CorsoService();
    private DocenteService docenteService = new DocenteService();
    private DiscenteService discenteService = new DiscenteService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String azione = request.getParameter("cmdAzione");
        if (azione == null) {
            visualizzaElenco(request, response);
        } else if (azione.equals("Torna alla Home")) {
            getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
        } else if (azione.equals("Nuovo")) {
            nuovoCorso(request, response);
        } else if (azione.equals("Annulla")) {
            visualizzaElenco(request, response);
        } else if (azione.equals("Registra")) {
            salvaCorso(request, response);
            visualizzaElenco(request, response);
        } else if (azione.equals("Modifica")) {
            modificaCorso(request, response);
        } else if (azione.equals("Elimina")) {
            eliminaCorso(request, response);
        } else if (azione.equals("Conferma")) {
            cancellaCorso(request, response);
            visualizzaElenco(request, response);
        }
    }

    private void cancellaCorso(HttpServletRequest request, HttpServletResponse response) {
        Corso corso = (Corso) request.getSession().getAttribute("beanCorso");
        corsoService.delete(corso);
    }

    private void eliminaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCorso = Integer.parseInt(request.getParameter("rdoIDCorso"));
        Corso corso = corsoService.findById(idCorso);
        HttpSession session = request.getSession();
        session.setAttribute("beanCorso", corso);
        getServletContext().getRequestDispatcher("/ArchivioCorso/PgsArchivioCorsoElimina.jsp").forward(request, response);
    }

    private void modificaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCorso = Integer.parseInt(request.getParameter("rdoIDCorso"));
        Corso corso = corsoService.findById(idCorso);
        HttpSession session = request.getSession();
        session.setAttribute("beanCorso", corso);
        request.setAttribute("elencoDocenti", docenteService.findAll());
        request.setAttribute("elencoDiscenti", discenteService.findAll());
        getServletContext().getRequestDispatcher("/ArchivioCorso/PgsArchivioCorsoNuovoModifica.jsp").forward(request, response);
    }

    private void salvaCorso(HttpServletRequest request, HttpServletResponse response) {
        Corso corso = (Corso) request.getSession().getAttribute("beanCorso");
        corso.setNome(request.getParameter("txtNome"));;
        corso.setOre(Integer.parseInt(request.getParameter("txtOre")));

        int docenteId = Integer.parseInt(request.getParameter("docente"));
        Docente docente = docenteService.findById(docenteId);
        corso.setDocente(docente);

        String[] discentiIds = request.getParameterValues("discenti");
        if (discentiIds != null) {
            corso.getDiscenti().clear();
            for (String discenteId : discentiIds) {
                Discente discente = discenteService.findById(Integer.parseInt(discenteId));
                corso.getDiscenti().add(discente);
            }
        }

        if (corso.getId() == 0) {
            corsoService.persist(corso);
        } else {
            corsoService.update(corso);
        }
    }


private void nuovoCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Corso corso = new Corso();
    HttpSession session = request.getSession();
    session.setAttribute("beanCorso", corso);
    request.setAttribute("elencoDocenti", docenteService.findAll());
    request.setAttribute("elencoDiscenti", discenteService.findAll());
    getServletContext().getRequestDispatcher("/ArchivioCorso/PgsArchivioCorsoNuovoModifica.jsp").forward(request, response);
}

    private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Corso> elenco = corsoService.findAll();
        request.setAttribute("elencoCorsi", elenco);
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/ArchivioCorso/PgsArchivioCorso.jsp");
        dispatcher.forward(request, response);
    }
}


