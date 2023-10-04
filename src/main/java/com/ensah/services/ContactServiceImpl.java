package com.ensah.services;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import com.ensah.dao.IContactDao;
import com.ensah.dao.IGroupeDao;


@Service
public  class ContactServiceImpl implements IContactService{
       
	@Autowired
	private IContactDao data;
    
	@Autowired
	private IGroupeDao GroupDao;
	
	
	public ContactServiceImpl(IContactDao d) {
		this.data=d;
	}
	

	@Override
	public void addContact(Contact contact) {
		data.save(contact);
	}
	

	@Override
	public void updateContact(Contact contact) {
		data.save(contact);
		
	}

	@Override
	public List<Contact> getAllContact() {
		// TODO Auto-generated method stub
		return data.findAll();
	}

	@Override
	public void deleteContact(Long id) {
		data.deleteById(id);
		
	}

	@Override
	public Contact getContactByName(String nom) {
		// TODO Auto-generated method stub
		return  data.findBynom(nom);
	}

	public Contact getByNumPersonelOrProfesionel(String tele) {
		
		   Contact contact = data.findByteleper(tele); 

		    if (contact == null) { 
		        contact = data.findByteleprof(tele); 
		    }

		    return contact;
   }

	
	
	@SuppressWarnings("deprecation")
	@Override
	public Contact getContactById(Long id) {
		// TODO Auto-generated method stub
		return data.getById(id);
	}
	
	 @Override
	    public List<Contact> getAllContactsOrderedByName() {
	        return data.findAllByOrderByNomAsc();
	    }


//*******************Group*******************


	@Override
	public List<Groupe> getAllGroup() {
		return GroupDao.findAll();
	}


	@SuppressWarnings("deprecation")
	@Override
	public Groupe getGroupById(Long id) {
		
		return GroupDao.getById(id);
	}


	@Override
	public Groupe getGroupByName(String nom) {
		// TODO Auto-generated method stub
		return  GroupDao.findBynom(nom);
	}
	
	@Override
	public void addGroup(Groupe group) {
		GroupDao.save(group);
	}
	
	

	@Override
	public void deleteGroup(Long id) {

			
		    Groupe groupe = GroupDao.findById(id).orElse(null);
		    if (groupe != null) {
		        groupe.getContacts().forEach(contact -> contact.setGroup(null)); // Supprime la référence au groupe pour chaque contact
		        GroupDao.delete(groupe);
		    }

	}
	
	

	
}
