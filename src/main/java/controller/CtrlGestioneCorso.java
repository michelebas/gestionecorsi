package controller;

import java.io.IOException;
import java.util.*;

import javax.print.Doc;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import model.dao.CorsoService;
import model.dao.DiscenteService;
import model.dao.DocenteService;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;

@WebServlet("/CtrlGestioneCorso")
public class CtrlGestioneCorso extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CorsoService oCorsoService = new CorsoService();

    public CtrlGestioneCorso() {
        super();
    }

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
        oCorsoService.delete(((Corso) request.getSession().getAttribute("beanCorso")));
    }

    private void eliminaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("beanCorso", oCorsoService.findById(Integer.parseInt(request.getParameter("rdoIDCorso"))));
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoElimina.jsp").forward(request, response);
    }

    private void modificaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("beanCorso", oCorsoService.findById(Integer.parseInt(request.getParameter("rdoIDCorso"))));
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoNuovoModifica.jsp").forward(request, response);
    }

    private void salvaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DocenteService oDocenteService = new DocenteService();
        Corso beanCorso = ((Corso) request.getSession().getAttribute("beanCorso"));
        // TODO Auto-generated method stub
        beanCorso.setNome(request.getParameter("txtNome"));
        beanCorso.setDurata(Integer.parseInt(request.getParameter("txtDurata")));
        String rdoDocente = request.getParameter("rdoIdDocente");
        List<Docente> elencoDocenti = oDocenteService.findAll();
        for (Docente docente : elencoDocenti) {
            if (Integer.parseInt(rdoDocente) == docente.getChiave()) {
                beanCorso.setObjDocente(docente);
            }
        }
        DiscenteService oDiscenteService = new DiscenteService();
        String[] check = request.getParameterValues("checkIdDiscente");//creo un array di stringhe e assegno i vari checkbox cliccati dall'utente
        List<Discente> elencoDiscenti = new ArrayList<>();
        for (String i : check) {//scorro l'array di stringhe
            Discente oDiscente = oDiscenteService.findById(Integer.parseInt(i)); //assegno ad ogni oggetto discente il suo i-esimo id
            elencoDiscenti.add(oDiscente);
        }
        beanCorso.setDiscenti(elencoDiscenti);
        if (beanCorso.getChiave() == 0)
            oCorsoService.persist(beanCorso);
        else
            oCorsoService.update(beanCorso);
    }

    private void nuovoCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Corso oCorso = new Corso();
        HttpSession oSessione = request.getSession();
        oSessione.setAttribute("beanCorso", oCorso);
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoNuovoModifica.jsp").forward(request, response);
    }

    @Transactional
    private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        List<Corso> elenco = oCorsoService.findAll();

        request.setAttribute("elencoCorsi", elenco);

        //Definizione di un oggetto della classeServletContext
        ServletContext oContesto = getServletContext();
        //Definizione di un oggetto per la pubblicazione della PGS
        RequestDispatcher oDispatcher = oContesto.getRequestDispatcher("" +
                "/GestioneCorso/PgsGestioneCorso.jsp");
        oDispatcher.forward(request, response);
    }
}
