package com.ensah.controllers;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.PostConstruct;




import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import com.ensah.services.IContactService;

@Controller
public class ContactController {
    
	
	private IContactService metier;

	
	@PostConstruct
	public void init() {
	
	}
	
	@Autowired
	public ContactController(IContactService metier) {
		this.metier=metier;
	}
	
	@RequestMapping("/showForm")
	public String showForm(Model model) {
		
		// Ajouter un objet contact vide comme attribut du modèle
		model.addAttribute("ContactModel", new Contact()); 
		model.addAttribute("GroupList", metier.getAllGroup());
		model.addAttribute("ContactList", metier.getAllContactsOrderedByName()); //recuperer les contacts

		return "form"; 
	}
	
	
	
	@RequestMapping("/addContact")
	public String process(@Valid @ModelAttribute("ContactModel") Contact contact, BindingResult bindingResult,
			ModelMap model) {
		
         
		if (bindingResult.hasErrors()) {
			model.addAttribute("GroupeList", metier.getAllGroup());
			model.addAttribute("errorMsg", "Les données sont invalides.");
		} else {
			metier.addContact(contact);
			model.addAttribute("ContactModel", new Contact()); 
			model.addAttribute("infoMsg", "Contact ajouté avec succès");
		}
		
		model.addAttribute("ContactList", metier.getAllContactsOrderedByName()); 

		return "form";

	}
	

	@RequestMapping(value = "/updateContactForm/{id}", method = RequestMethod.GET)
	public String updateContactForm(@PathVariable(name = "id") int id, Model model) {
		
	    model.addAttribute("ContactModel", metier.getContactById(Long.valueOf(id)));
	    model.addAttribute("GroupList", metier.getAllGroup());
	    return "updateForm";
	}

	

	
	
	@RequestMapping("/updateContact")
	public String updateContact(@Valid @ModelAttribute("ContactModel") Contact contact, BindingResult bindingResult,
			ModelMap model) {

		// Si il y a pas des erreurs
		if (bindingResult.hasErrors()) {
			model.addAttribute("errorMsg", "Les données sont invalides.");
		
		}else {
			metier.updateContact(contact);
			model.addAttribute("infoMsg", "Contact modifie avec succès");
		}
		model.addAttribute("ContactList", metier.getAllContactsOrderedByName());

		// rediriger vers un autre handler
		return "redirect:/manageContact";
	}
	
	
	
	@RequestMapping("/manageContact")
	public String manageContact(Model model) {

		model.addAttribute("ContactList", metier.getAllContactsOrderedByName()); // Mettre a jour la liste des contact dans le modèle

		return "listContacts";
	}
	
	

	
	
	@RequestMapping(value = "/deleteContact/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		metier.deleteContact(Long.valueOf(id));

		//return new RedirectView(appContext.getContextPath() + "/manageContact");
		 return "redirect:/manageContact";
	}
	
	
	@PostMapping(value = "searchContact")
	public String searchContact(@RequestParam("nom") String ids, Model model) {
	    Contact contact = metier.getContactByName(ids);
	    Contact contact1=metier.getByNumPersonelOrProfesionel(ids);
	    List<Contact> contactList = new ArrayList<>();

	    if (contact != null) {
	        contactList.add(contact);
	    }
	    if (contact1 != null) {
	        contactList.add(contact1);
	    }

	    model.addAttribute("ContactList", contactList);

	    return "listContacts";
	}

//********************Groupe*************************
	
	@RequestMapping("/showGroup")
	public String showGroup(Model model) {
		
		model.addAttribute("GroupeModel", new Groupe()); 
		
		model.addAttribute("GroupList", metier.getAllGroup());

		return "AddGroup"; 
	}
	
	

	@RequestMapping("/addGroup")
	public String process(@Valid @ModelAttribute("GroupeModel") Groupe group, BindingResult bindingResult,
			ModelMap model) {
		

		if (bindingResult.hasErrors()) {
			model.addAttribute("errorMsg", "Les données sont invalides.");
		} else {
			metier.addGroup(group);
			model.addAttribute("infoMsg", "groupe ajouté avec succès");

		}
		model.addAttribute("GroupList", metier.getAllGroup()); //mettre a jour la liste des groupes

		return "AddGroup";

	}
	
	
	@RequestMapping(value = "/deleteGroup/{id}", method = RequestMethod.GET)
	public String deletegoup(@PathVariable int id) {
		metier.deleteGroup(Long.valueOf(id));
        
		//return new RedirectView(appContext.getContextPath() + "/manageGroup");
		return "redirect:/manageGroup";
	}
	
	@RequestMapping("/manageGroup")
	public String manageGroup(Model model) {

		model.addAttribute("GroupList", metier.getAllGroup()); 

		return "listGroups";
	}
	
	@PostMapping(value = "searchGroup")
	public String searchGroup(@RequestParam("ids") String ids, Model model) {
	    Groupe group = metier.getGroupByName(ids);

	    List<Groupe> groupList = new ArrayList<>();

	    if (group != null) {
	    	groupList.add(group);
	    }
	    

	    model.addAttribute("GroupList", groupList);

	    return "listGroups";
	}
	
	
	
	
}
